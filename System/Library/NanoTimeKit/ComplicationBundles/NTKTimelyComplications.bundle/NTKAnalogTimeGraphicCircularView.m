@interface NTKAnalogTimeGraphicCircularView
+ (id)_newWorldClockViewForDevice:(id)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKWorldClockGraphicCircularView)worldClockCircularView;
- (double)tintedFraction;
- (id)initFullColorImageViewWithDevice:(id)a3;
- (id)tintedPlatterColor;
- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)pauseLiveFullColorImageView;
- (void)resumeLiveFullColorImageView;
- (void)setFilterProvider:(id)a3;
- (void)setTintedFraction:(double)a3;
- (void)setTintedPlatterColor:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKAnalogTimeGraphicCircularView

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKAnalogTimeGraphicCircularView;
  [(NTKAnalogTimeGraphicCircularView *)&v9 layoutSubviews];
  v3 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [(NTKAnalogTimeGraphicCircularView *)self bounds];
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  if (CGRectIsNull(v10)) {
    goto LABEL_4;
  }
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (CGRectIsEmpty(v11)
    || (v12.origin.double x = x, v12.origin.y = y, v12.size.width = width, v12.size.height = height, CGRectIsInfinite(v12)))
  {
LABEL_4:
    objc_msgSend(v3, "setBounds:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  else
  {
    objc_msgSend(v3, "setBounds:", x, y, width, height);
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    double MidX = CGRectGetMidX(v13);
    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.double width = width;
    v14.size.double height = height;
    objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v14));
  }
}

- (id)initFullColorImageViewWithDevice:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKAnalogTimeGraphicCircularView;
  v5 = -[NTKAnalogTimeGraphicCircularView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (NTKWorldClockGraphicCircularView *)[(id)objc_opt_class() _newWorldClockViewForDevice:v4];
    worldClockCircularView = v5->_worldClockCircularView;
    v5->_worldClockCircularView = v6;

    [(NTKAnalogTimeGraphicCircularView *)v5 addSubview:v5->_worldClockCircularView];
  }

  return v5;
}

- (void)pauseLiveFullColorImageView
{
  id v2 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v2 pauseLiveFullColorImageView];
}

- (void)resumeLiveFullColorImageView
{
  id v2 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v2 resumeLiveFullColorImageView];
}

- (void)configureWithImageProvider:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v7 configureWithImageProvider:v6 reason:a4];
}

- (void)setFilterProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v5 setFilterProvider:v4];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v4 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v4 transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  id v2 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v2 updateMonochromeColor];
}

- (double)tintedFraction
{
  id v2 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v2 tintedFraction];
  double v4 = v3;

  return v4;
}

- (void)setTintedFraction:(double)a3
{
  id v4 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v4 setTintedFraction:a3];
}

- (id)tintedPlatterColor
{
  id v2 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  double v3 = [v2 tintedPlatterColor];

  return v3;
}

- (void)setTintedPlatterColor:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKAnalogTimeGraphicCircularView *)self worldClockCircularView];
  [v5 setTintedPlatterColor:v4];
}

+ (id)_newWorldClockViewForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKWorldClockGraphicCircularViewSeconds alloc] initWithDevice:v3 smallTickCount:5];

  return v4;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);

  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (NTKWorldClockGraphicCircularView)worldClockCircularView
{
  return self->_worldClockCircularView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldClockCircularView, 0);

  objc_destroyWeak((id *)&self->_filterProvider);
}

@end