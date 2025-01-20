@interface MKUserTrackingButton
+ (MKUserTrackingButton)userTrackingButtonWithMapView:(MKMapView *)mapView;
- (CGSize)intrinsicContentSize;
- (MKMapView)mapView;
- (MKUserTrackingButton)init;
- (MKUserTrackingButton)initWithFrame:(CGRect)a3;
- (MKUserTrackingButton)initWithFrame:(CGRect)a3 button:(id)a4;
- (unint64_t)_controlSize;
- (unint64_t)backgroundStyle;
- (void)_setControlSize:(unint64_t)a3;
- (void)addInteraction:(id)a3;
- (void)layoutSubviews;
- (void)removeInteraction:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setMapView:(MKMapView *)mapView;
@end

@implementation MKUserTrackingButton

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  v3 = [WeakRetained mapView];

  return (MKMapView *)v3;
}

- (void)setMapView:(MKMapView *)mapView
{
  p_button = &self->_button;
  v4 = mapView;
  id WeakRetained = objc_loadWeakRetained((id *)p_button);
  [WeakRetained setMapView:v4];
}

+ (MKUserTrackingButton)userTrackingButtonWithMapView:(MKMapView *)mapView
{
  v4 = mapView;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setMapView:v4];

  return (MKUserTrackingButton *)v5;
}

- (MKUserTrackingButton)initWithFrame:(CGRect)a3 button:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MKUserTrackingButton;
  v10 = -[MKUserTrackingButton initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v10->_controlSize = 1;
    id v12 = objc_storeWeak((id *)&v10->_button, v9);
    [v9 setControlSize:1];

    id WeakRetained = objc_loadWeakRetained((id *)&v11->_button);
    [(MKUserTrackingButton *)v11 addSubview:WeakRetained];

    v14 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKUserTrackingButton *)v11 setBackgroundColor:v14];

    [(MKUserTrackingButton *)v11 setNeedsLayout];
    v15 = +[MKUsageCounter sharedCounter];
    [v15 count:4];

    v16 = [(MKUserTrackingButton *)v11 layer];
    [v16 setShadowRadius:8.0];

    v17 = [(MKUserTrackingButton *)v11 layer];
    objc_msgSend(v17, "setShadowOffset:", 0.0, 2.0);

    v18 = [MEMORY[0x1E4F428B8] blackColor];
    id v19 = [v18 colorWithAlphaComponent:0.0799999982];
    uint64_t v20 = [v19 CGColor];
    v21 = [(MKUserTrackingButton *)v11 layer];
    [v21 setShadowColor:v20];

    v22 = [(MKUserTrackingButton *)v11 layer];
    [v22 setShadowOpacity:0.0];

    v23 = [(MKUserTrackingButton *)v11 layer];
    [v23 setMasksToBounds:0];
  }
  return v11;
}

- (MKUserTrackingButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = +[_MKUserTrackingButton buttonWithMapView:0];
  id v9 = -[MKUserTrackingButton initWithFrame:button:](self, "initWithFrame:button:", v8, x, y, width, height);

  return v9;
}

- (MKUserTrackingButton)init
{
  v3 = +[_MKUserTrackingButton buttonWithMapView:0];
  [v3 sizeToFit];
  [v3 frame];
  v4 = -[MKUserTrackingButton initWithFrame:button:](self, "initWithFrame:button:", v3);

  return v4;
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
  unint64_t v8 = [(MKUserTrackingButton *)self backgroundStyle];
  double v9 = v7;
  if (v8 != 2)
  {
    unint64_t v10 = self->_controlSize;
    if (MapKitIdiomIsMacCatalyst() && v10 < 3)
    {
      double v9 = dbl_18BD1B678[v10];
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
  result.double height = v9;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)MKUserTrackingButton;
  [(MKUserTrackingButton *)&v30 layoutSubviews];
  [(MKUserTrackingButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
  objc_msgSend(WeakRetained, "setFrame:", v4, v6, v8, v10);

  [(MKUserTrackingButton *)self bounds];
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  if ([(MKUserTrackingButton *)self backgroundStyle] == 2)
  {
    [(MKUserTrackingButton *)self bounds];
    CGFloat v12 = CGRectGetWidth(v31) * 0.5;
    double v13 = [(MKUserTrackingButton *)self layer];
    [v13 setCornerRadius:v12];

    [(MKUserTrackingButton *)self bounds];
    CGFloat v14 = CGRectGetWidth(v32) * 0.5;
    v15 = [(UIVisualEffectView *)self->_effectView layer];
    [v15 setCornerRadius:v14];

    v16 = (void *)MEMORY[0x1E4F427D0];
    [(MKUserTrackingButton *)self bounds];
    v17 = objc_msgSend(v16, "bezierPathWithOvalInRect:");
  }
  else
  {
    unint64_t controlSize = self->_controlSize;
    if (controlSize == 1) {
      double v19 = 8.0;
    }
    else {
      double v19 = 6.0;
    }
    if (controlSize == 2) {
      double v20 = 11.0;
    }
    else {
      double v20 = v19;
    }
    v21 = [(MKUserTrackingButton *)self layer];
    [v21 setCornerRadius:v20];

    unint64_t v22 = self->_controlSize;
    if (v22 == 1) {
      double v23 = 8.0;
    }
    else {
      double v23 = 6.0;
    }
    if (v22 == 2) {
      double v24 = 11.0;
    }
    else {
      double v24 = v23;
    }
    objc_super v25 = [(UIVisualEffectView *)self->_effectView layer];
    [v25 setCornerRadius:v24];

    v26 = (void *)MEMORY[0x1E4F427D0];
    [(MKUserTrackingButton *)self bounds];
    v17 = objc_msgSend(v26, "bezierPathWithRoundedRect:cornerRadius:");
  }
  id v27 = v17;
  uint64_t v28 = [v27 CGPath];
  v29 = [(MKUserTrackingButton *)self layer];
  [v29 setShadowPath:v28];
}

- (void)_setControlSize:(unint64_t)a3
{
  if (self->_controlSize != a3)
  {
    self->_unint64_t controlSize = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    [WeakRetained setControlSize:a3];

    [(MKUserTrackingButton *)self invalidateIntrinsicContentSize];
  }
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a3)
    {
      double v4 = [(MKUserTrackingButton *)self layer];
      LODWORD(v5) = 1.0;
      [v4 setShadowOpacity:v5];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
      [WeakRetained _setSelectsWhenTracking:0];

      if (!self->_effectView)
      {
        id v7 = objc_alloc(MEMORY[0x1E4F43028]);
        double v8 = (UIVisualEffectView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        effectView = self->_effectView;
        self->_effectView = v8;

        double v10 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
        [(UIVisualEffectView *)self->_effectView setEffect:v10];

        [(UIVisualEffectView *)self->_effectView setUserInteractionEnabled:0];
        BOOL v11 = [(UIVisualEffectView *)self->_effectView layer];
        [v11 setMasksToBounds:1];
      }
      [(MKUserTrackingButton *)self invalidateIntrinsicContentSize];
      [(MKUserTrackingButton *)self insertSubview:self->_effectView atIndex:0];
      [(MKUserTrackingButton *)self setNeedsLayout];
    }
    else
    {
      id v12 = objc_loadWeakRetained((id *)&self->_button);
      [v12 _setSelectsWhenTracking:1];

      [(UIVisualEffectView *)self->_effectView removeFromSuperview];
      [(MKUserTrackingButton *)self invalidateIntrinsicContentSize];
      id v13 = [(MKUserTrackingButton *)self layer];
      [v13 setShadowOpacity:0.0];
    }
  }
}

- (void)addInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    [WeakRetained addInteraction:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKUserTrackingButton;
    [(MKUserTrackingButton *)&v6 addInteraction:v4];
  }
}

- (void)removeInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_button);
    [WeakRetained removeInteraction:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKUserTrackingButton;
    [(MKUserTrackingButton *)&v6 removeInteraction:v4];
  }
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (unint64_t)_controlSize
{
  return self->_controlSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_destroyWeak((id *)&self->_button);
}

@end