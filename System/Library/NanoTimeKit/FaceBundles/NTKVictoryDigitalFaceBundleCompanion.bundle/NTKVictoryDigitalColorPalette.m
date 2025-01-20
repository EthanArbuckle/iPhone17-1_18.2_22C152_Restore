@interface NTKVictoryDigitalColorPalette
- (id)_alternateComplicationColor;
- (id)_background;
- (id)_complication;
- (id)_complicationPlatter;
- (id)_digits;
@end

@implementation NTKVictoryDigitalColorPalette

- (id)_digits
{
  if ([(NTKVictoryDigitalColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKVictoryDigitalColorPalette *)self paletteAtIndex:0];
    v4 = [v3 primaryColor];
  }
  else
  {
    v4 = [(NTKVictoryDigitalColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_complication
{
  if ([(NTKVictoryDigitalColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKVictoryDigitalColorPalette *)self paletteAtIndex:1];
    v4 = [v3 primaryColor];
  }
  else
  {
    v4 = [(NTKVictoryDigitalColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_complicationPlatter
{
  v2 = [(NTKVictoryDigitalColorPalette *)self complication];
  v3 = NTKColorByPremultiplyingAlpha();

  return v3;
}

- (id)_alternateComplicationColor
{
  return +[UIColor whiteColor];
}

- (id)_background
{
  return +[UIColor blackColor];
}

@end