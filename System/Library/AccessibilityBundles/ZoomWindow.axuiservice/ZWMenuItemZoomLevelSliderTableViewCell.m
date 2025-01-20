@interface ZWMenuItemZoomLevelSliderTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIImageView)zoomInImageView;
- (UIImageView)zoomOutImageView;
- (UISlider)zoomLevelSlider;
- (ZWMenuItemZoomLevelSliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)setZoomInImageView:(id)a3;
- (void)setZoomLevelSlider:(id)a3;
- (void)setZoomOutImageView:(id)a3;
@end

@implementation ZWMenuItemZoomLevelSliderTableViewCell

- (ZWMenuItemZoomLevelSliderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v29.receiver = self;
  v29.super_class = (Class)ZWMenuItemZoomLevelSliderTableViewCell;
  v4 = [(ZWMenuItemZoomLevelSliderTableViewCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v4 contentView];
    v7 = +[UIImage systemImageNamed:@"minus.magnifyingglass"];
    id v8 = [objc_alloc((Class)UIImageView) initWithImage:v7];
    v9 = +[UIColor whiteColor];
    [v8 setTintColor:v9];

    [v6 addSubview:v8];
    [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 setZoomOutImageView:v8];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = +[UIImage systemImageNamed:@"plus.magnifyingglass"];

    id v11 = [objc_alloc((Class)UIImageView) initWithImage:v10];
    v12 = +[UIColor whiteColor];
    [v11 setTintColor:v12];

    [v6 addSubview:v11];
    [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 setZoomInImageView:v11];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = objc_msgSend(objc_alloc((Class)UISlider), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v14 = +[UIColor whiteColor];
    [v13 setMinimumTrackTintColor:v14];

    [v6 addSubview:v13];
    [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 setZoomLevelSlider:v13];
    v15 = ZWLocString(@"ZW_MENU_SLIDER_ZOOM_LEVEL");
    [v13 setAccessibilityLabel:v15];

    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = _NSDictionaryOfVariableBindings(@"zoomOutImageView, zoomInImageView, slider", v8, v11, v13, 0);
    v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-xEdgePadding-[zoomOutImageView]-xSliderPadding-[slider]-xSliderPadding-[zoomInImageView]-xEdgePadding-|", 0, &off_7B638, v16);
    [v6 addConstraints:v17];

    v18 = +[NSLayoutConstraint constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
    [v6 addConstraint:v18];

    v19 = +[NSLayoutConstraint constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:-12.0];
    [v6 addConstraint:v19];

    v20 = +[NSLayoutConstraint constraintWithItem:v11 attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:-12.0];
    [v6 addConstraint:v20];

    BOOL v21 = ZWUseVibrantBlendModes();
    v22 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 zoomLevelSlider];
    v23 = v22;
    if (v21)
    {
      [v22 _setDrawsAsBackdropOverlayWithBlendMode:3];

      v24 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 zoomInImageView];
      [v24 _setDrawsAsBackdropOverlayWithBlendMode:3];

      v25 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 zoomOutImageView];
      [v25 _setDrawsAsBackdropOverlayWithBlendMode:3];
    }
    else
    {
      [v22 _setDrawsAsBackdropOverlay:0];

      v26 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 zoomInImageView];
      [v26 _setDrawsAsBackdropOverlay:0];

      v27 = [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 zoomOutImageView];
      [v27 _setDrawsAsBackdropOverlay:0];

      v25 = +[UIColor darkGrayColor];
      [v13 setMaximumTrackTintColor:v25];
    }

    [(ZWMenuItemZoomLevelSliderTableViewCell *)v5 setAccessibilityIgnoresInvertColors:1];
  }
  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5 = 44.0;
  result.height = v5;
  return result;
}

- (UISlider)zoomLevelSlider
{
  return self->_zoomLevelSlider;
}

- (void)setZoomLevelSlider:(id)a3
{
}

- (UIImageView)zoomOutImageView
{
  return self->_zoomOutImageView;
}

- (void)setZoomOutImageView:(id)a3
{
}

- (UIImageView)zoomInImageView
{
  return self->_zoomInImageView;
}

- (void)setZoomInImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomInImageView, 0);
  objc_storeStrong((id *)&self->_zoomOutImageView, 0);

  objc_storeStrong((id *)&self->_zoomLevelSlider, 0);
}

@end