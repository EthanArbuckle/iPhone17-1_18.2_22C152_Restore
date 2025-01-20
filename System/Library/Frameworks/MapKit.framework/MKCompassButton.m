@interface MKCompassButton
+ (MKCompassButton)compassButtonWithMapView:(MKMapView *)mapView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MKCompassButton)initWithFrame:(CGRect)a3;
- (MKCompassButton)initWithFrame:(CGRect)a3 mapView:(id)a4;
- (MKFeatureVisibility)compassVisibility;
- (MKMapView)mapView;
- (int64_t)compassSize;
- (void)_updateVisibility;
- (void)addInteraction:(id)a3;
- (void)dealloc;
- (void)didTapCompassGesture:(id)a3;
- (void)layoutSubviews;
- (void)mapViewDidUpdateYawNotification:(id)a3;
- (void)removeInteraction:(id)a3;
- (void)setCompassSize:(int64_t)a3;
- (void)setCompassVisibility:(MKFeatureVisibility)compassVisibility;
- (void)setMapView:(MKMapView *)mapView;
@end

@implementation MKCompassButton

+ (MKCompassButton)compassButtonWithMapView:(MKMapView *)mapView
{
  v4 = mapView;
  BOOL v5 = _MKLinkedOnOrAfterReleaseSet(3081);
  double v6 = MKCompassViewDiameterForSize(v5);
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:mapView:", v4, 0.0, 0.0, v6, v6);

  return (MKCompassButton *)v7;
}

- (MKCompassButton)initWithFrame:(CGRect)a3 mapView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MKCompassButton;
  v10 = -[MKCompassButton initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [MKCompassView alloc];
    [(MKCompassButton *)v10 bounds];
    uint64_t v12 = -[MKCompassView initWithFrame:](v11, "initWithFrame:");
    compassView = v10->_compassView;
    v10->_compassView = (MKCompassView *)v12;

    if (_MKLinkedOnOrAfterReleaseSet(3081)) {
      [(MKCompassView *)v10->_compassView setCompassViewSize:1 style:1];
    }
    [(MKCompassView *)v10->_compassView setAutoresizingMask:18];
    [(MKCompassButton *)v10 setAutoresizesSubviews:1];
    [(MKCompassButton *)v10 addSubview:v10->_compassView];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v10 action:sel_didTapCompassGesture_];
    [(MKCompassButton *)v10 addGestureRecognizer:v14];
    [(MKCompassButton *)v10 setMapView:v9];
    v15 = +[MKUsageCounter sharedCounter];
    [v15 count:2];
  }
  return v10;
}

- (MKCompassButton)initWithFrame:(CGRect)a3
{
  return -[MKCompassButton initWithFrame:mapView:](self, "initWithFrame:mapView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  -[MKMapView _stopPostingCompassUpdateNotifications]((uint64_t)WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)MKCompassButton;
  [(MKCompassButton *)&v4 dealloc];
}

- (void)setMapView:(MKMapView *)mapView
{
  obj = mapView;
  id WeakRetained = (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_mapView);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_mapView);
      -[MKMapView _stopPostingCompassUpdateNotifications]((uint64_t)v6);

      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v8 = objc_loadWeakRetained((id *)&self->_mapView);
      [v7 removeObserver:self name:@"MKMapViewDidUpdateYawNotification" object:v8];
    }
    self->_visible = 0;
    [(MKCompassView *)self->_compassView setMapHeading:0.0];
    id v9 = objc_storeWeak((id *)&self->_mapView, obj);

    if (obj)
    {
      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v11 = objc_loadWeakRetained((id *)&self->_mapView);
      [v10 addObserver:self selector:sel_mapViewDidUpdateYawNotification_ name:@"MKMapViewDidUpdateYawNotification" object:v11];

      uint64_t v12 = objc_loadWeakRetained((id *)&self->_mapView);
      if (v12) {
        ++v12[166];
      }

      id v13 = objc_loadWeakRetained((id *)&self->_mapView);
      [v13 _postDidUpdateYawNotification];
    }
    [(MKCompassButton *)self _updateVisibility];
  }
}

- (void)setCompassVisibility:(MKFeatureVisibility)compassVisibility
{
  if (self->_compassVisibility != compassVisibility)
  {
    self->_compassVisibilitdouble y = compassVisibility;
    [(MKCompassButton *)self _updateVisibility];
  }
}

- (void)setCompassSize:(int64_t)a3
{
  if (self->_compassSize != a3)
  {
    self->_compassSize = a3;
    compassView = self->_compassView;
    id v6 = [(MKCompassButton *)self traitCollection];
    -[MKCompassView setCompassViewSize:style:](compassView, "setCompassViewSize:style:", a3, [v6 userInterfaceStyle] != 2);

    [(MKCompassButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)mapViewDidUpdateYawNotification:(id)a3
{
  id v6 = [a3 userInfo];
  objc_super v4 = [v6 objectForKeyedSubscript:@"MKMapViewDidUpdateYawDegreesKey"];
  [v4 doubleValue];
  -[MKCompassView setMapHeading:](self->_compassView, "setMapHeading:");

  id v5 = [v6 objectForKeyedSubscript:@"MKMapViewDidUpdateYawVisibleKey"];
  self->_visible = [v5 BOOLValue];

  [(MKCompassButton *)self _updateVisibility];
}

- (void)didTapCompassGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _handleCompassTap:v5];
  }
}

- (void)_updateVisibility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  compassView = self->_compassView;
  if (WeakRetained)
  {
    [(MKCompassView *)compassView setAlpha:1.0];
    compassVisibilitdouble y = self->_compassVisibility;
    if (compassVisibility == 2)
    {
      BOOL visible = 1;
    }
    else if (compassVisibility)
    {
      BOOL visible = 0;
    }
    else
    {
      BOOL visible = self->_visible;
    }
    v7 = [(MKCompassButton *)self window];

    if (v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __36__MKCompassButton__updateVisibility__block_invoke;
      v10[3] = &unk_1E54B8718;
      BOOL v11 = visible;
      v10[4] = self;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __36__MKCompassButton__updateVisibility__block_invoke_2;
      v8[3] = &unk_1E54B8740;
      v8[4] = self;
      BOOL v9 = visible;
      objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_animateFromCurrentStateWithDuration:animations:completion:", v10, v8, 0.5);
    }
    else
    {
      [(MKCompassButton *)self setAlpha:(double)visible];
      [(MKCompassButton *)self setHidden:!visible];
    }
  }
  else
  {
    [(MKCompassView *)compassView setAlpha:0.25];
  }
}

uint64_t __36__MKCompassButton__updateVisibility__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setHidden:0];
    LOBYTE(v2) = *(unsigned char *)(a1 + 40);
    double v3 = (double)v2;
  }
  else
  {
    double v3 = 0.0;
  }
  objc_super v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

uint64_t __36__MKCompassButton__updateVisibility__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) setHidden:*(unsigned char *)(result + 40) == 0];
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKCompassButton;
  [(MKCompassButton *)&v3 layoutSubviews];
  [(MKCompassButton *)self bounds];
  -[MKCompassView setFrame:](self->_compassView, "setFrame:");
}

- (CGSize)intrinsicContentSize
{
  [(MKCompassView *)self->_compassView intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  [(MKCompassView *)self->_compassView intrinsicContentSize];
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(MKCompassView *)self->_compassView intrinsicContentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)addInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MKCompassView *)self->_compassView addInteraction:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKCompassButton;
    [(MKCompassButton *)&v5 addInteraction:v4];
  }
}

- (void)removeInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MKCompassView *)self->_compassView removeInteraction:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKCompassButton;
    [(MKCompassButton *)&v5 removeInteraction:v4];
  }
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (MKFeatureVisibility)compassVisibility
{
  return self->_compassVisibility;
}

- (int64_t)compassSize
{
  return self->_compassSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);

  objc_storeStrong((id *)&self->_compassView, 0);
}

@end