@interface NTKVictoryAnalogColorPalette
- (BOOL)hasWhiteElements;
- (NSNumber)dotMarkerAlpha;
- (UIColor)backgroundColor;
- (double)smallDotsColorBrightness;
- (double)smallNumbersColorBrightness;
- (id)_background;
- (id)_cornerComplicationsAccent;
- (id)_dotMarker;
- (id)_hands;
- (id)_logo;
- (id)_markerAtIndex:(id)a3;
- (id)_numbers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)digit;
- (id)dotMarkerColorAtIndex:(id)a3;
- (id)identifier;
- (id)numberColorAtIndex:(id)a3;
- (unint64_t)style;
- (void)configurationDidChange:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKVictoryAnalogColorPalette

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryAnalogColorPalette;
  id v4 = [(NTKVictoryAnalogColorPalette *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setStyle:", -[NTKVictoryAnalogColorPalette style](self, "style"));
  return v4;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKVictoryAnalogColorPalette;
    id v4 = [(NTKVictoryAnalogColorPalette *)&v8 identifier];
    v5 = +[NSString stringWithFormat:@"%@-%lu", v4, self->_style];
    objc_super v6 = self->_cachedIdentifier;
    self->_cachedIdentifier = v5;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (void)configurationDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryAnalogColorPalette;
  [(NTKVictoryAnalogColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (id)_numbers
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKVictoryAnalogColorPalette *)self paletteAtIndex:0];
    id v4 = [v3 primaryColor];
  }
  else
  {
    id v4 = [(NTKVictoryAnalogColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_hands
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette]) {
    [(NTKVictoryAnalogColorPalette *)self logo];
  }
  else {
  v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (id)_logo
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKVictoryAnalogColorPalette *)self paletteAtIndex:1];
    id v4 = [v3 primaryColor];
  }
  else
  {
    if ((char *)[(NTKVictoryAnalogColorPalette *)self style] == (char *)&dword_0 + 3) {
      [(NTKVictoryAnalogColorPalette *)self valueForKey:@"logoForLargeNumbers"];
    }
    else {
    id v4 = +[UIColor whiteColor];
    }
  }

  return v4;
}

- (id)_cornerComplicationsAccent
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette]) {
    [(NTKVictoryAnalogColorPalette *)self logo];
  }
  else {
  v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (id)_dotMarker
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKVictoryAnalogColorPalette *)self paletteAtIndex:0];
    id v4 = [v3 primaryColor];
  }
  else
  {
    id v4 = [(NTKVictoryAnalogColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_background
{
  return +[UIColor blackColor];
}

- (UIColor)backgroundColor
{
  return (UIColor *)[(NTKVictoryAnalogColorPalette *)self background];
}

- (NSNumber)dotMarkerAlpha
{
  if ([(NTKVictoryAnalogColorPalette *)self hasWhiteElements]) {
    return (NSNumber *)&off_CCD8;
  }
  v3 = (NSNumber *)&off_CCD8;
  if ([(NTKVictoryAnalogColorPalette *)self style]
    && ![(NTKVictoryAnalogColorPalette *)self isMulticolor])
  {
    return (NSNumber *)&off_CCE8;
  }
  return v3;
}

- (BOOL)hasWhiteElements
{
  if ([(NTKVictoryAnalogColorPalette *)self isCompositePalette]) {
    return 1;
  }
  id v4 = [(NTKVictoryAnalogColorPalette *)self pigmentEditOption];
  objc_super v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqual:ntk_victory_white];

  return v6;
}

- (double)smallDotsColorBrightness
{
  v2 = [(NTKVictoryAnalogColorPalette *)self numbersColor];
  CLKUIComputeDimmingRequiredToObtainColorAPL();
  double v4 = v3;

  return v4;
}

- (double)smallNumbersColorBrightness
{
  v2 = [(NTKVictoryAnalogColorPalette *)self numbersColor];
  CLKUIComputeDimmingRequiredToObtainColorAPL();
  double v4 = v3;

  return v4;
}

- (id)dotMarkerColorAtIndex:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKVictoryAnalogColorPalette *)self dotMarker];
  if ([(NTKVictoryAnalogColorPalette *)self isRainbowColor])
  {
    uint64_t v6 = [(NTKVictoryAnalogColorPalette *)self _markerAtIndex:v4];

    objc_super v5 = (void *)v6;
  }

  return v5;
}

- (id)numberColorAtIndex:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKVictoryAnalogColorPalette *)self numbers];
  if ([(NTKVictoryAnalogColorPalette *)self isRainbowColor])
  {
    uint64_t v6 = [(NTKVictoryAnalogColorPalette *)self _markerAtIndex:v4];

    objc_super v5 = (void *)v6;
  }

  return v5;
}

- (id)digit
{
  return 0;
}

- (id)_markerAtIndex:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKVictoryAnalogColorPalette *)self style];
  uint64_t v6 = @"largeDigit";
  if (v5 < 3) {
    uint64_t v6 = @"digit";
  }
  v7 = v6;
  unint64_t v8 = [(NTKVictoryAnalogColorPalette *)self style];
  v9 = (char *)[v4 integerValue];

  if (v8 >= 3) {
    v10 = v9;
  }
  else {
    v10 = v9 + 1;
  }
  v11 = +[NSString stringWithFormat:@"%@%lu", v7, v10];

  v12 = [(NTKVictoryAnalogColorPalette *)self valueForKey:v11];

  return v12;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
}

@end