@interface NTKNumeralsHourView
- (BOOL)isLoaded;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_hourColorForDevice:(id)a3 faceColorPalette:(id)a4 colorSchemeUnits:(unint64_t)a5;
- (id)_imageNameForStyle:(unint64_t)a3 hour:(int64_t)a4;
- (id)initForHour:(int64_t)a3 style:(unint64_t)a4 faceConfiguration:(id)a5;
- (id)initUnloadedHourViewForHour:(int64_t)a3 style:(unint64_t)a4 faceConfiguration:(id)a5;
- (int64_t)hour;
- (void)_applyTintColor:(id)a3;
- (void)applyFaceColorFromFaceConfiguration:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 faceConfiguration:(id)a6;
- (void)load;
- (void)unload;
@end

@implementation NTKNumeralsHourView

- (id)initForHour:(int64_t)a3 style:(unint64_t)a4 faceConfiguration:(id)a5
{
  id v5 = [(NTKNumeralsHourView *)self initUnloadedHourViewForHour:a3 style:a4 faceConfiguration:a5];
  v6 = v5;
  if (v5) {
    [v5 load];
  }
  return v6;
}

- (id)initUnloadedHourViewForHour:(int64_t)a3 style:(unint64_t)a4 faceConfiguration:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NTKNumeralsHourView;
  v10 = [(NTKNumeralsHourView *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_hour = a3;
    v10->_style = a4;
    objc_storeStrong((id *)&v10->_faceConfiguration, a5);
  }

  return v11;
}

- (void)load
{
  if (!self->_isLoaded)
  {
    v3 = [(NTKNumeralsHourView *)self _imageNameForStyle:self->_style hour:self->_hour];
    v4 = +[NTKNumeralsAnalogFaceBundle imageWithName:v3];
    id v5 = [v4 imageWithRenderingMode:2];

    v6 = [v5 _imageThatSuppressesAccessibilityHairlineThickening];

    [(NTKNumeralsHourView *)self setImage:v6];
    [(NTKNumeralsHourView *)self applyFaceColorFromFaceConfiguration:self->_faceConfiguration];
  }
  self->_isLoaded = 1;
}

- (void)unload
{
  self->_isLoaded = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = +[CLKDevice currentDevice];
  if ([v6 deviceCategory] == (char *)&dword_0 + 1)
  {
    v7 = +[CLKDevice currentDevice];
    [v7 screenBounds];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)NTKNumeralsHourView;
    -[NTKNumeralsHourView sizeThatFits:](&v16, "sizeThatFits:", width, height);
    double v9 = v12;
    double v11 = v13;
  }

  double v14 = v9;
  double v15 = v11;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)applyTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5 faceConfiguration:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  double v12 = [v9 device];
  -[NTKNumeralsHourView _hourColorForDevice:faceColorPalette:colorSchemeUnits:](self, "_hourColorForDevice:faceColorPalette:colorSchemeUnits:", v12, v11, [v9 colorSchemeUnits]);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  double v13 = [v9 device];
  id v14 = [v9 colorSchemeUnits];

  double v15 = [(NTKNumeralsHourView *)self _hourColorForDevice:v13 faceColorPalette:v10 colorSchemeUnits:v14];

  objc_super v16 = NTKInterpolateBetweenColors();
  [(NTKNumeralsHourView *)self _applyTintColor:v16];
}

- (void)applyFaceColorFromFaceConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 device];
  v6 = [v4 faceColorPalette];
  id v7 = [v4 colorSchemeUnits];

  id v8 = [(NTKNumeralsHourView *)self _hourColorForDevice:v5 faceColorPalette:v6 colorSchemeUnits:v7];

  [(NTKNumeralsHourView *)self _applyTintColor:v8];
}

- (id)_hourColorForDevice:(id)a3 faceColorPalette:(id)a4 colorSchemeUnits:(unint64_t)a5
{
  id v5 = +[NTKFaceColorScheme colorSchemeForDevice:a3 withFaceColorPalette:a4 units:a5];
  v6 = [v5 foregroundColor];
  id v7 = [v6 colorWithAlphaComponent:1.0];

  return v7;
}

- (void)_applyTintColor:(id)a3
{
  p_appliedColor = &self->_appliedColor;
  id v6 = a3;
  if ((-[UIColor isEqual:](*p_appliedColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_appliedColor, a3);
    [(NTKNumeralsHourView *)self setTintColor:*p_appliedColor];
  }
}

- (id)_imageNameForStyle:(unint64_t)a3 hour:(int64_t)a4
{
  CFStringRef v4 = @"numerals_analog_latn_alt%lu_%lu";
  if (a3 == 8) {
    CFStringRef v4 = @"numerals-analog_deva_alt%lu_%lu";
  }
  if (a3 == 7)
  {
    CFStringRef v4 = @"numerals-analog_arab_alt%lu_%lu";
    unint64_t v5 = 1;
  }
  else
  {
    unint64_t v5 = a3 - 7;
  }
  if (a3 < 7) {
    unint64_t v5 = a3 + 1;
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5, a4);
}

- (int64_t)hour
{
  return self->_hour;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedColor, 0);

  objc_storeStrong((id *)&self->_faceConfiguration, 0);
}

@end