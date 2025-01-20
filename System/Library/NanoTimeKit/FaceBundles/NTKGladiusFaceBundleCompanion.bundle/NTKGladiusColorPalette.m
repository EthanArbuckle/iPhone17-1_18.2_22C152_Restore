@interface NTKGladiusColorPalette
- (BOOL)_isLightColor;
- (id)_background;
- (id)_bottomComplicationDay;
- (id)_bottomComplicationNight;
- (id)_hourMinuteHandStrokeDay;
- (id)_hourMinuteHandStrokeNight;
- (id)_hourTickDay;
- (id)_hourTickNight;
- (id)_minuteTickDay;
- (id)_minuteTickNight;
- (id)_secondHandDay;
- (id)_secondHandNight;
- (id)_topComplicationDay;
- (id)_topComplicationNight;
- (id)swatch;
- (void)configurationDidChange:(id)a3;
@end

@implementation NTKGladiusColorPalette

- (void)configurationDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKGladiusColorPalette;
  [(NTKGladiusColorPalette *)&v3 configurationDidChange:a3];
}

- (id)_minuteTickDay
{
  return +[UIColor colorWithWhite:1.0 alpha:0.3];
}

- (id)_minuteTickNight
{
  unsigned int v3 = [(NTKGladiusColorPalette *)self _isLightColor];
  v4 = [(NTKGladiusColorPalette *)self primaryColor];
  v5 = v4;
  double v6 = 0.3;
  if (v3) {
    double v6 = 0.2;
  }
  v7 = [v4 colorWithAlphaComponent:v6];

  return v7;
}

- (id)_hourTickDay
{
  return +[UIColor colorWithWhite:1.0 alpha:0.9];
}

- (id)_hourTickNight
{
  v2 = [(NTKGladiusColorPalette *)self primaryColor];
  unsigned int v3 = [v2 colorWithAlphaComponent:0.3];

  return v3;
}

- (id)_background
{
  if ([(NTKGladiusColorPalette *)self isSeasonalCollection]
    && [(NTKGladiusColorPalette *)self _isLightColor])
  {
    unsigned int v3 = [(NTKGladiusColorPalette *)self primaryColor];
    v4 = NTKColorByModifyingHSB();
  }
  else
  {
    v4 = [(NTKGladiusColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_hourMinuteHandStrokeDay
{
  v2 = [(NTKGladiusColorPalette *)self primaryColor];
  unsigned int v3 = NTKColorByModifyingHSB();

  return v3;
}

- (id)_hourMinuteHandStrokeNight
{
  [(NTKGladiusColorPalette *)self _isLightColor];
  unsigned int v3 = [(NTKGladiusColorPalette *)self primaryColor];
  v4 = NTKColorByModifyingHSB();

  return v4;
}

- (id)_secondHandDay
{
  return +[UIColor whiteColor];
}

- (id)_secondHandNight
{
  return +[UIColor colorWithWhite:1.0 alpha:0.85];
}

- (id)_topComplicationDay
{
  v2 = [(NTKGladiusColorPalette *)self primaryColor];
  unsigned int v3 = +[UIColor whiteColor];
  v4 = NTKInterpolateBetweenColors();
  v5 = [v4 colorWithAlphaComponent:0.8];

  return v5;
}

- (id)_topComplicationNight
{
  v2 = [(NTKGladiusColorPalette *)self primaryColor];
  unsigned int v3 = +[UIColor whiteColor];
  v4 = NTKInterpolateBetweenColors();
  v5 = [v4 colorWithAlphaComponent:0.6];

  return v5;
}

- (id)_bottomComplicationDay
{
  return [(NTKGladiusColorPalette *)self _topComplicationDay];
}

- (id)_bottomComplicationNight
{
  return [(NTKGladiusColorPalette *)self _topComplicationNight];
}

- (BOOL)_isLightColor
{
  v2 = [(NTKGladiusColorPalette *)self primaryColor];
  unsigned int v3 = +[UIColor whiteColor];
  CLKContrastRatioForColors();
  BOOL v5 = v4 < 2.0;

  return v5;
}

- (id)swatch
{
  unsigned int v3 = [(NTKGladiusColorPalette *)self pigmentEditOption];
  double v4 = [v3 fullname];

  if (([v4 isEqualToString:ntk_standard_yellow] & 1) != 0
    || ([v4 isEqualToString:ntk_standard_lightYellow] & 1) != 0
    || ([v4 isEqualToString:ntk_standard_lightGreen] & 1) != 0
    || ([v4 isEqualToString:ntk_standard_green] & 1) != 0
    || ([v4 isEqualToString:ntk_standard_blue] & 1) != 0
    || [v4 isEqualToString:ntk_standard_cream])
  {
    uint64_t v5 = [(NTKGladiusColorPalette *)self background];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKGladiusColorPalette;
    uint64_t v5 = [(NTKGladiusColorPalette *)&v8 swatch];
  }
  double v6 = (void *)v5;

  return v6;
}

@end