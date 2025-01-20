@interface BTUIBatteryLevelIndicator
+ (id)defaultConnectedStateStringName;
+ (id)defaultLowBatteryStateStringName;
+ (id)defaultLowBatteryWithNumberStateStringName;
+ (id)expandedConnectedStateStringName;
+ (id)expandedLowBatteryStateStringName;
- (BOOL)showsPercentageLabel;
- (BSUICAPackageView)micaRootLayer;
- (BTUIBatteryLevelIndicator)initWithFrame:(CGRect)a3;
- (CAShapeLayer)micaProgressFill;
- (UILabel)percentageLabel;
- (double)percentageLevel;
- (id)localizePercentageLevel;
- (void)_setupLayersAndLayerStates;
- (void)layoutSubviews;
- (void)setColorforPercentageLabel:(id)a3;
- (void)setMicaProgressFill:(id)a3;
- (void)setMicaRootLayer:(id)a3;
- (void)setPercentageLabel:(id)a3;
- (void)setPercentageLevel:(double)a3;
- (void)setShowsPercentageLabel:(BOOL)a3;
@end

@implementation BTUIBatteryLevelIndicator

- (BTUIBatteryLevelIndicator)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BTUIBatteryLevelIndicator;
  v3 = -[BTUIBatteryLevelIndicator initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(BTUIBatteryLevelIndicator *)v3 _setupLayersAndLayerStates];
  }
  return v4;
}

+ (id)defaultConnectedStateStringName
{
  return @"compact";
}

+ (id)expandedConnectedStateStringName
{
  return @"zoom";
}

+ (id)defaultLowBatteryStateStringName
{
  return @"low_compact";
}

+ (id)defaultLowBatteryWithNumberStateStringName
{
  return @"low_with_number";
}

+ (id)expandedLowBatteryStateStringName
{
  return @"low_zoom";
}

- (void)setShowsPercentageLabel:(BOOL)a3
{
  if (self->_showsPercentageLabel != a3)
  {
    self->_showsPercentageLabel = a3;
    [(BTUIBatteryLevelIndicator *)self setNeedsLayout];
    [(BTUIBatteryLevelIndicator *)self layoutIfNeeded];
  }
}

- (void)_setupLayersAndLayerStates
{
  id v3 = objc_alloc((Class)BSUICAPackageView);
  v4 = +[NSBundle mainBundle];
  id v42 = [v3 initWithPackageName:@"batteryLevel" inBundle:v4];

  id v5 = [(BTUIBatteryLevelIndicator *)self setMicaRootLayer:v42];
  id v6 = v42;
  if (v42)
  {
    [v42 setState:@"compact"];
    [(BTUIBatteryLevelIndicator *)self setMicaRootLayer:v42];
    v7 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    [(BTUIBatteryLevelIndicator *)self addSubview:v7];

    v8 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v10 = [v9 widthAnchor];
    v11 = [(BTUIBatteryLevelIndicator *)self widthAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v14 = [v13 heightAnchor];
    v15 = [(BTUIBatteryLevelIndicator *)self heightAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v18 = [v17 centerXAnchor];
    v19 = [(BTUIBatteryLevelIndicator *)self centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v22 = [v21 centerYAnchor];
    v23 = [(BTUIBatteryLevelIndicator *)self centerYAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    v25 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    v26 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v27 = [v26 widthAnchor];
    v28 = [(BTUIBatteryLevelIndicator *)self widthAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v31 = [v30 heightAnchor];
    v32 = [(BTUIBatteryLevelIndicator *)self heightAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    [v33 setActive:1];

    v34 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v35 = [v34 centerXAnchor];
    v36 = [(BTUIBatteryLevelIndicator *)self centerXAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    v38 = [(BTUIBatteryLevelIndicator *)self micaRootLayer];
    v39 = [v38 centerYAnchor];
    v40 = [(BTUIBatteryLevelIndicator *)self centerYAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v41 setActive:1];

LABEL_3:
    id v6 = v42;
    goto LABEL_8;
  }
  if (dword_10001EDF0 <= 90)
  {
    if (dword_10001EDF0 != -1 || (v5 = (id)_LogCategory_Initialize(), id v6 = 0, v5))
    {
      id v5 = (id)LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:

  _objc_release_x1(v5, v6);
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)BTUIBatteryLevelIndicator;
  [(BTUIBatteryLevelIndicator *)&v28 layoutSubviews];
  unsigned int v3 = [(BTUIBatteryLevelIndicator *)self showsPercentageLabel];
  v4 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
  id v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      id v6 = objc_alloc_init((Class)UILabel);
      [(BTUIBatteryLevelIndicator *)self setPercentageLabel:v6];

      v7 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
      [(BTUIBatteryLevelIndicator *)self addSubview:v7];

      percentageLabelColor = self->_percentageLabelColor;
      v9 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
      [v9 setTextColor:percentageLabelColor];
    }
    v10 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
    [(BTUIBatteryLevelIndicator *)self bringSubviewToFront:v10];

    v11 = [(BTUIBatteryLevelIndicator *)self localizePercentageLevel];
    v12 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
    [v12 setText:v11];

    double v13 = 16.0;
    if ([(BTUIBatteryLevelIndicator *)self SBUISA_layoutMode] == (id)3)
    {
      double v13 = 12.0;
      v14 = +[UIFont systemFontOfSize:12.0 weight:UIFontWeightMedium];
      v15 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
      [v15 setFont:v14];
    }
    v16 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
    v17 = [v16 font];
    [v17 pointSize];
    double v19 = v18;

    if (v19 != v13)
    {
      v20 = +[UIFont systemFontOfSize:v13 weight:UIFontWeightBold];
      v21 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
      [v21 setFont:v20];
    }
    v22 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
    [v22 sizeToFit];

    [(BTUIBatteryLevelIndicator *)self bounds];
    UIRectGetCenter();
    double v24 = v23;
    double v26 = v25;
    v27 = [(BTUIBatteryLevelIndicator *)self percentageLabel];
    objc_msgSend(v27, "setCenter:", v24, v26);
  }
  else
  {
    [v4 removeFromSuperview];

    [(BTUIBatteryLevelIndicator *)self setPercentageLabel:0];
  }
}

- (id)localizePercentageLevel
{
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  [(BTUIBatteryLevelIndicator *)self percentageLevel];
  double v6 = v5 * 100.0;
  *(float *)&double v6 = v6;
  v7 = +[NSNumber numberWithFloat:v6];
  v8 = [v3 stringFromNumber:v7];

  return v8;
}

- (void)setColorforPercentageLabel:(id)a3
{
}

- (double)percentageLevel
{
  return self->_percentageLevel;
}

- (void)setPercentageLevel:(double)a3
{
  self->_percentageLevel = a3;
}

- (BSUICAPackageView)micaRootLayer
{
  return self->_micaRootLayer;
}

- (void)setMicaRootLayer:(id)a3
{
}

- (CAShapeLayer)micaProgressFill
{
  return self->_micaProgressFill;
}

- (void)setMicaProgressFill:(id)a3
{
}

- (BOOL)showsPercentageLabel
{
  return self->_showsPercentageLabel;
}

- (UILabel)percentageLabel
{
  return self->_percentageLabel;
}

- (void)setPercentageLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_micaProgressFill, 0);
  objc_storeStrong((id *)&self->_micaRootLayer, 0);
  objc_storeStrong((id *)&self->_percentageLabelColor, 0);

  objc_storeStrong((id *)&self->_percentageLabel, 0);
}

@end