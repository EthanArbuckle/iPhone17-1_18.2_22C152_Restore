@interface ZWShowHideZoomRegionButton
- (UIView)buttonView;
- (UIView)zoomRegionRect;
- (ZWShowHideZoomRegionButton)init;
- (void)makeHorizontal;
- (void)makeVertical;
- (void)setButtonView:(id)a3;
- (void)setZoomRegionRect:(id)a3;
@end

@implementation ZWShowHideZoomRegionButton

- (ZWShowHideZoomRegionButton)init
{
  v13.receiver = self;
  v13.super_class = (Class)ZWShowHideZoomRegionButton;
  v2 = [(ZWShowHideZoomRegionButton *)&v13 init];
  id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 48.0, 15.0);
  v4 = [v3 layer];
  [v4 setCornerRadius:7.5];

  v5 = ZWLensInnerColor();
  [v3 setBackgroundColor:v5];

  double v6 = ZWLensOuterBorderWidth();
  v7 = [v3 layer];
  [v7 setBorderWidth:v6];

  v8 = +[CAFilter filterWithType:kCAFilterPlusD];
  v9 = [v3 layer];
  [v9 setCompositingFilter:v8];

  [(ZWShowHideZoomRegionButton *)v2 setButtonView:v3];
  [(ZWShowHideZoomRegionButton *)v2 addSubview:v3];
  v10 = ZWLocString(@"ZW_ZOOM_REGION_BUTTON_LABEL");
  [(ZWShowHideZoomRegionButton *)v2 setAccessibilityLabel:v10];

  v11 = ZWLocString(@"ZW_ZOOM_REGION_BUTTON_HINT");
  [(ZWShowHideZoomRegionButton *)v2 setAccessibilityHint:v11];

  return v2;
}

- (void)makeVertical
{
  [(ZWShowHideZoomRegionButton *)self bounds];
  -[ZWShowHideZoomRegionButton setBounds:](self, "setBounds:");
  id v3 = [(ZWShowHideZoomRegionButton *)self buttonView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(ZWShowHideZoomRegionButton *)self buttonView];
  objc_msgSend(v8, "setBounds:", v5, v7, 15.0, 48.0);
}

- (void)makeHorizontal
{
  [(ZWShowHideZoomRegionButton *)self bounds];
  -[ZWShowHideZoomRegionButton setBounds:](self, "setBounds:");
  id v3 = [(ZWShowHideZoomRegionButton *)self buttonView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(ZWShowHideZoomRegionButton *)self buttonView];
  objc_msgSend(v8, "setBounds:", v5, v7, 48.0, 15.0);
}

- (UIView)zoomRegionRect
{
  return self->_zoomRegionRect;
}

- (void)setZoomRegionRect:(id)a3
{
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);

  objc_storeStrong((id *)&self->_zoomRegionRect, 0);
}

@end