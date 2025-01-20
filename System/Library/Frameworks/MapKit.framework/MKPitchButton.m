@interface MKPitchButton
+ (MKPitchButton)pitchButtonWithMapView:(id)a3;
- (CGSize)intrinsicContentSize;
- (MKMapView)mapView;
- (MKPitchButton)initWithFrame:(CGRect)a3;
- (MKPitchButton)initWithMapView:(id)a3;
- (int64_t)visibility;
- (unint64_t)_backgroundStyle;
- (unint64_t)_controlSize;
- (void)_performPitchAction:(id)a3;
- (void)_setBackgroundStyle:(unint64_t)a3;
- (void)_setControlSize:(unint64_t)a3;
- (void)_updateButtonState;
- (void)_updateControlSize;
- (void)addInteraction:(id)a3;
- (void)layoutSubviews;
- (void)removeInteraction:(id)a3;
- (void)setMapView:(id)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation MKPitchButton

- (void)setVisibility:(int64_t)a3
{
  if (self->_visibility != a3)
  {
    self->_visibility = a3;
    [(MKPitchButton *)self _updateButtonState];
  }
}

- (void)_setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    v5 = [(MKPitchButton *)self layer];
    v7 = v5;
    if (a3)
    {
      LODWORD(v6) = 1.0;
      [v5 setShadowOpacity:v6];

      if (!self->_effectView)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F43028]);
        v9 = (UIVisualEffectView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        effectView = self->_effectView;
        self->_effectView = v9;

        v11 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
        [(UIVisualEffectView *)self->_effectView setEffect:v11];

        [(UIVisualEffectView *)self->_effectView setUserInteractionEnabled:0];
        v12 = [(UIVisualEffectView *)self->_effectView layer];
        [v12 setMasksToBounds:1];
      }
      [(MKPitchButton *)self invalidateIntrinsicContentSize];
      [(MKPitchButton *)self insertSubview:self->_effectView atIndex:0];
      [(MKPitchButton *)self setNeedsLayout];
    }
    else
    {
      [v5 setShadowOpacity:0.0];

      [(UIVisualEffectView *)self->_effectView removeFromSuperview];
      [(MKPitchButton *)self invalidateIntrinsicContentSize];
    }
  }
}

- (void)_updateButtonState
{
  if ([(MKPitchButton *)self visibility] == 1)
  {
    [(MKPitchButton *)self setHidden:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    if ([WeakRetained _isPitched])
    {
      id v4 = objc_loadWeakRetained((id *)&self->_mapView);
      int v5 = [v4 _canEnter3DMode];

      int v6 = v5 ^ 1;
    }
    else
    {
      int v6 = 1;
    }

    GEOConfigGetDouble();
    double v8 = v7;
    id v9 = objc_loadWeakRetained((id *)&self->_mapView);
    [v9 _zoomLevel];
    double v11 = v10;

    id v12 = objc_loadWeakRetained((id *)&self->_mapView);
    uint64_t v13 = [v12 mapType];
    BOOL v14 = (unint64_t)(v13 - 1) >= 4 && v13 != 107;

    if (v11 < v8) {
      int v15 = v6;
    }
    else {
      int v15 = 0;
    }
    unsigned int v16 = v15 & v14;
    if ([(MKPitchButton *)self visibility]) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v16;
    }
    [(MKPitchButton *)self setHidden:v17];
  }
  id v18 = objc_loadWeakRetained((id *)&self->_mapView);
  int v19 = [v18 _isPitched];

  button = self->_button;
  if (v19)
  {
    [(UIButton *)button setAccessibilityIdentifier:@"ModeButton2D"];
    v21 = self->_button;
    v22 = _MKLocalizedStringFromThisBundle(@"2D mode");
    [(UIButton *)v21 setAccessibilityLabel:v22];

    objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_systemImageNamed:", @"view.2d");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_button, "setImage:forState:");
    [(UIButton *)self->_button setEnabled:1];
  }
  else
  {
    [(UIButton *)button setAccessibilityIdentifier:@"ModeButton3D"];
    v23 = self->_button;
    v24 = _MKLocalizedStringFromThisBundle(@"3D mode");
    [(UIButton *)v23 setAccessibilityLabel:v24];

    objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_systemImageNamed:", @"view.3d");
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](self->_button, "setImage:forState:");
    id v25 = objc_loadWeakRetained((id *)&self->_mapView);
    -[UIButton setEnabled:](self->_button, "setEnabled:", [v25 _canEnter3DMode]);
  }
}

- (int64_t)visibility
{
  return self->_visibility;
}

+ (MKPitchButton)pitchButtonWithMapView:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc((Class)a1) initWithMapView:v4];

  return (MKPitchButton *)v5;
}

- (MKPitchButton)initWithMapView:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MKPitchButton;
  int v5 = -[MKPitchButton initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  int v6 = v5;
  if (v5)
  {
    v5->_backgroundStyle = 0;
    uint64_t v7 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    button = v6->_button;
    v6->_button = (UIButton *)v7;

    [(UIButton *)v6->_button addTarget:v6 action:sel__performPitchAction_ forControlEvents:0x2000];
    v6->_controlSize = 1;
    [(MKPitchButton *)v6 _updateControlSize];
    [(MKPitchButton *)v6 addSubview:v6->_button];
    id v9 = [(MKPitchButton *)v6 layer];
    [v9 setShadowRadius:8.0];

    double v10 = [(MKPitchButton *)v6 layer];
    objc_msgSend(v10, "setShadowOffset:", 0.0, 2.0);

    double v11 = [MEMORY[0x1E4F428B8] blackColor];
    id v12 = [v11 colorWithAlphaComponent:0.0799999982];
    uint64_t v13 = [v12 CGColor];
    BOOL v14 = [(MKPitchButton *)v6 layer];
    [v14 setShadowColor:v13];

    int v15 = [(MKPitchButton *)v6 layer];
    [v15 setShadowOpacity:0.0];

    unsigned int v16 = [(MKPitchButton *)v6 layer];
    [v16 setMasksToBounds:0];

    [(MKPitchButton *)v6 setMapView:v4];
  }

  return v6;
}

- (void)setMapView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained != obj)
  {
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = objc_loadWeakRetained((id *)&self->_mapView);
    [v5 removeObserver:self name:@"MKMapViewPitchStateDidChangeNotification" object:v6];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = objc_loadWeakRetained((id *)&self->_mapView);
    [v7 removeObserver:self name:@"MKMapViewCanEnter3DDidChangeNotification" object:v8];

    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v10 = objc_loadWeakRetained((id *)&self->_mapView);
    [v9 removeObserver:self name:0x1ED91A468 object:v10];

    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = objc_loadWeakRetained((id *)&self->_mapView);
    [v11 removeObserver:self name:@"MKMapViewDidChangeZoomNotification" object:v12];

    uint64_t v13 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v13) {
      --v13[169];
    }

    objc_storeWeak((id *)&self->_mapView, obj);
    BOOL v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__updateButtonState name:@"MKMapViewPitchStateDidChangeNotification" object:obj];

    int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:self selector:sel__updateButtonState name:@"MKMapViewCanEnter3DDidChangeNotification" object:obj];

    unsigned int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:self selector:sel__updateButtonState name:0x1ED91A468 object:obj];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:self selector:sel__updateButtonState name:@"MKMapViewDidChangeZoomNotification" object:obj];

    objc_super v18 = objc_loadWeakRetained((id *)&self->_mapView);
    if (v18) {
      ++v18[169];
    }

    [(MKPitchButton *)self _updateButtonState];
  }
}

- (void)_updateControlSize
{
  v3 = (void *)MEMORY[0x1E4F42A98];
  unint64_t controlSize = self->_controlSize;
  BOOL IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  unint64_t v6 = 12;
  if (controlSize == 2) {
    unint64_t v6 = 16;
  }
  uint64_t v7 = 18;
  if (controlSize == 2) {
    uint64_t v7 = 22;
  }
  if (!IsMacCatalyst) {
    unint64_t v6 = v7;
  }
  objc_msgSend(v3, "_mapkit_configurationWithPointSize:weight:", (double)v6, *MEMORY[0x1E4F43920]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(UIButton *)self->_button setPreferredSymbolConfiguration:v8 forImageInState:0];
}

- (MKPitchButton)initWithFrame:(CGRect)a3
{
  return -[MKPitchButton initWithMapView:](self, "initWithMapView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  unint64_t controlSize = self->_controlSize;
  if (MapKitIdiomIsMacCatalyst())
  {
    BOOL v4 = controlSize == 2;
    double v5 = 36.0;
    double v6 = 49.0;
  }
  else
  {
    double v5 = 36.0;
    if (controlSize == 1) {
      double v5 = 44.0;
    }
    BOOL v4 = controlSize == 2;
    double v6 = 60.0;
  }
  if (v4) {
    double v7 = v6;
  }
  else {
    double v7 = v5;
  }
  unint64_t v8 = [(MKPitchButton *)self _backgroundStyle];
  double v9 = v7;
  if (v8 != 2)
  {
    unint64_t v10 = self->_controlSize;
    if (MapKitIdiomIsMacCatalyst() && v10 < 3)
    {
      double v9 = dbl_18BD1BA88[v10];
    }
    else
    {
      if (MapKitIdiomIsMacCatalyst())
      {
        BOOL v11 = v10 == 2;
        double v12 = 36.0;
        double v9 = 49.0;
      }
      else
      {
        double v12 = 36.0;
        if (v10 == 1) {
          double v12 = 44.0;
        }
        BOOL v11 = v10 == 2;
        double v9 = 60.0;
      }
      if (!v11) {
        double v9 = v12;
      }
    }
  }
  double v13 = v7;
  result.height = v9;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)MKPitchButton;
  [(MKPitchButton *)&v21 layoutSubviews];
  [(MKPitchButton *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
  [(MKPitchButton *)self bounds];
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  if ([(MKPitchButton *)self _backgroundStyle] == 2)
  {
    [(MKPitchButton *)self bounds];
    CGFloat v3 = CGRectGetWidth(v22) * 0.5;
    BOOL v4 = [(MKPitchButton *)self layer];
    [v4 setCornerRadius:v3];

    [(MKPitchButton *)self bounds];
    CGFloat v5 = CGRectGetWidth(v23) * 0.5;
    double v6 = [(UIVisualEffectView *)self->_effectView layer];
    [v6 setCornerRadius:v5];

    double v7 = (void *)MEMORY[0x1E4F427D0];
    [(MKPitchButton *)self bounds];
    unint64_t v8 = objc_msgSend(v7, "bezierPathWithOvalInRect:");
  }
  else
  {
    unint64_t controlSize = self->_controlSize;
    if (controlSize == 1) {
      double v10 = 8.0;
    }
    else {
      double v10 = 6.0;
    }
    if (controlSize == 2) {
      double v11 = 11.0;
    }
    else {
      double v11 = v10;
    }
    double v12 = [(MKPitchButton *)self layer];
    [v12 setCornerRadius:v11];

    unint64_t v13 = self->_controlSize;
    if (v13 == 1) {
      double v14 = 8.0;
    }
    else {
      double v14 = 6.0;
    }
    if (v13 == 2) {
      double v15 = 11.0;
    }
    else {
      double v15 = v14;
    }
    unsigned int v16 = [(UIVisualEffectView *)self->_effectView layer];
    [v16 setCornerRadius:v15];

    uint64_t v17 = (void *)MEMORY[0x1E4F427D0];
    [(MKPitchButton *)self bounds];
    unint64_t v8 = objc_msgSend(v17, "bezierPathWithRoundedRect:cornerRadius:");
  }
  id v18 = v8;
  uint64_t v19 = [v18 CGPath];
  v20 = [(MKPitchButton *)self layer];
  [v20 setShadowPath:v19];
}

- (void)_setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_unint64_t controlSize = a3;
    [(MKPitchButton *)self _updateControlSize];
    [(MKPitchButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)_performPitchAction:(id)a3
{
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  int v5 = [WeakRetained _isPitched];

  id v6 = objc_loadWeakRetained((id *)p_mapView);
  id v8 = v6;
  if (v5)
  {
    [v6 _exit3DMode];
  }
  else
  {
    int v7 = [v6 _canEnter3DMode];

    if (!v7) {
      return;
    }
    id v8 = objc_loadWeakRetained((id *)p_mapView);
    [v8 _enter3DMode];
  }
}

- (void)addInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIButton *)self->_button addInteraction:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPitchButton;
    [(MKPitchButton *)&v5 addInteraction:v4];
  }
}

- (void)removeInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIButton *)self->_button removeInteraction:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MKPitchButton;
    [(MKPitchButton *)&v5 removeInteraction:v4];
  }
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (unint64_t)_backgroundStyle
{
  return self->_backgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end