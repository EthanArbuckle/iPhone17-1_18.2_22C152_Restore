@interface ZWSlugCollapsingRingView
- (BOOL)shouldUseContinuousCornerRadius;
- (UIImageView)speakFingerImageView;
- (ZWSlugCollapsingRingView)initWithFrame:(CGRect)a3;
- (double)_cornerRadiusForExpandedRing;
- (void)layoutSubviews;
- (void)setShouldUseContinuousCornerRadius:(BOOL)a3;
- (void)setSpeakFingerImageView:(id)a3;
@end

@implementation ZWSlugCollapsingRingView

- (ZWSlugCollapsingRingView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)ZWSlugCollapsingRingView;
  v3 = -[ZWSlugCollapsingRingView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ZWSlugCollapsingRingView *)v3 layer];
    [v5 setBorderWidth:2.0];

    v6 = [(ZWSlugCollapsingRingView *)v4 layer];
    [v6 setCornerCurve:kCACornerCurveContinuous];

    id v7 = +[UIColor whiteColor];
    id v8 = [v7 CGColor];
    v9 = [(ZWSlugCollapsingRingView *)v4 layer];
    [v9 setBorderColor:v8];

    v10 = +[UIBlurEffect effectWithStyle:19];
    [(ZWSlugCollapsingRingView *)v4 setEffect:v10];

    id v11 = objc_alloc_init((Class)UIImageView);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setHidden:1];
    [(ZWSlugCollapsingRingView *)v4 setSpeakFingerImageView:v11];
    v12 = [(ZWSlugCollapsingRingView *)v4 contentView];
    v13 = [(ZWSlugCollapsingRingView *)v4 speakFingerImageView];
    [v12 addSubview:v13];

    v14 = [(ZWSlugCollapsingRingView *)v4 layer];
    [v14 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");

    v24 = [(ZWSlugCollapsingRingView *)v4 centerXAnchor];
    v15 = [(ZWSlugCollapsingRingView *)v4 speakFingerImageView];
    v16 = [v15 centerXAnchor];
    v17 = [v24 constraintEqualToAnchor:v16];
    v26[0] = v17;
    v18 = [(ZWSlugCollapsingRingView *)v4 centerYAnchor];
    v19 = [(ZWSlugCollapsingRingView *)v4 speakFingerImageView];
    v20 = [v19 centerYAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v26[1] = v21;
    v22 = +[NSArray arrayWithObjects:v26 count:2];
    +[NSLayoutConstraint activateConstraints:v22];

    [(ZWSlugCollapsingRingView *)v4 setShouldUseContinuousCornerRadius:1];
  }
  return v4;
}

- (double)_cornerRadiusForExpandedRing
{
  v3 = [(ZWSlugCollapsingRingView *)self traitCollection];
  [v3 displayCornerRadius];
  if (v4 <= 0.0)
  {
    double v7 = 7.8;
  }
  else
  {
    v5 = [(ZWSlugCollapsingRingView *)self traitCollection];
    [v5 displayCornerRadius];
    double v7 = v6 / 5.0;
  }
  return v7;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)ZWSlugCollapsingRingView;
  [(ZWSlugCollapsingRingView *)&v22 layoutSubviews];
  v3 = [(ZWSlugCollapsingRingView *)self layer];
  [v3 cornerRadius];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    if ([(ZWSlugCollapsingRingView *)self shouldUseContinuousCornerRadius])
    {
      [(ZWSlugCollapsingRingView *)self bounds];
      double v12 = v11 * 0.5;
    }
    else
    {
      [(ZWSlugCollapsingRingView *)self _cornerRadiusForExpandedRing];
      double v12 = v17;
    }
    v18 = [(ZWSlugCollapsingRingView *)self layer];
    [v18 setCornerRadius:v12];

    double v6 = [(ZWSlugCollapsingRingView *)self layer];
    [v6 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
  else
  {
    double v6 = +[CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    double v7 = [(ZWSlugCollapsingRingView *)self layer];
    [v7 cornerRadius];
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setFromValue:v8];

    if ([(ZWSlugCollapsingRingView *)self shouldUseContinuousCornerRadius])
    {
      [(ZWSlugCollapsingRingView *)self bounds];
      double v10 = v9 * 0.5;
    }
    else
    {
      [(ZWSlugCollapsingRingView *)self _cornerRadiusForExpandedRing];
    }
    v13 = +[NSNumber numberWithDouble:v10];
    [v6 setToValue:v13];

    [v6 setDuration:ZWDefaultZoomAnimationDuration()];
    v14 = [(ZWSlugCollapsingRingView *)self layer];
    [v14 addAnimation:v6 forKey:@"ZWCornerRadius"];

    if ([(ZWSlugCollapsingRingView *)self shouldUseContinuousCornerRadius])
    {
      [(ZWSlugCollapsingRingView *)self bounds];
      double v16 = v15 * 0.5;
    }
    else
    {
      [(ZWSlugCollapsingRingView *)self _cornerRadiusForExpandedRing];
      double v16 = v19;
    }
    v20 = [(ZWSlugCollapsingRingView *)self layer];
    [v20 setCornerRadius:v16];

    v21 = [(ZWSlugCollapsingRingView *)self layer];
    [v21 cornerRadius];
    -[ZWSlugCollapsingRingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
}

- (UIImageView)speakFingerImageView
{
  return self->_speakFingerImageView;
}

- (void)setSpeakFingerImageView:(id)a3
{
}

- (BOOL)shouldUseContinuousCornerRadius
{
  return self->_shouldUseContinuousCornerRadius;
}

- (void)setShouldUseContinuousCornerRadius:(BOOL)a3
{
  self->_shouldUseContinuousCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end