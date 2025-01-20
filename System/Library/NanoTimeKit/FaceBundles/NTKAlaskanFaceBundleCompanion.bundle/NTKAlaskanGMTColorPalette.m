@interface NTKAlaskanGMTColorPalette
- (NTKAlaskanGMTColorPalette)init;
- (id)_cornerComplicationInnerTextColor;
- (id)_dateComplicationColor;
- (id)_dayDialColor;
- (id)_nightDialColor;
- (id)_outerMarkersColor;
@end

@implementation NTKAlaskanGMTColorPalette

- (NTKAlaskanGMTColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v9.receiver = self;
  v9.super_class = (Class)NTKAlaskanGMTColorPalette;
  v4 = [(NTKAlaskanGMTColorPalette *)&v9 initWithFaceClass:v3];
  v5 = v4;
  if (v4)
  {
    v6 = [(NTKAlaskanGMTColorPalette *)v4 lightTickColor];
    CLKUIConvertToRGBfFromUIColor_fast();

    CLKUIConvertRGBtoLAB();
    *(_OWORD *)v5->_lightTickColorLABRepresentation = v7;
  }
  return v5;
}

- (id)_dayDialColor
{
  if ([(NTKAlaskanGMTColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKAlaskanGMTColorPalette *)self paletteAtIndex:1];
    v4 = [v3 primaryColor];
  }
  else
  {
    v4 = NTKColorWithRGBA();
  }

  return v4;
}

- (id)_nightDialColor
{
  if ([(NTKAlaskanGMTColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKAlaskanGMTColorPalette *)self paletteAtIndex:0];
    v4 = [v3 primaryColor];
  }
  else
  {
    v4 = [(NTKAlaskanGMTColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_outerMarkersColor
{
  uint64_t v3 = [(NTKAlaskanGMTColorPalette *)self nightDialColor];
  CLKUIConvertToRGBfFromUIColor_fast();

  CLKUIConvertRGBtoLAB();
  float v5 = v4 - *(float *)self->_lightTickColorLABRepresentation;
  if (v5 < 0.0) {
    float v5 = -v5;
  }
  if (v5 >= 20.0) {
    [(NTKAlaskanGMTColorPalette *)self lightTickColor];
  }
  else {
  v6 = [(NTKAlaskanGMTColorPalette *)self darkTickColor];
  }

  return v6;
}

- (id)_dateComplicationColor
{
  return +[UIColor whiteColor];
}

- (id)_cornerComplicationInnerTextColor
{
  if ([(NTKAlaskanGMTColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKAlaskanGMTColorPalette *)self paletteAtIndex:0];
    float v4 = [v3 cornerComplicationInnerTextColor];
  }
  else
  {
    float v4 = [(NTKAlaskanGMTColorPalette *)self nightDialColor];
  }

  return v4;
}

@end