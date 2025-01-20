@interface NTKCrosswindColorPalette
- (BOOL)_isCustomHeroColor;
- (BOOL)_isCustomHeroOrSpecialColor;
- (BOOL)_isWhiteColor;
- (BOOL)isEditingComplications;
- (NSNumber)editingComplicationsFraction;
- (UIColor)resolvedComplicationColor;
- (double)_valueForColorIndex:(unint64_t)a3 inValues:;
- (id)_baseLayerBackground;
- (id)_baseLayerColorForForeground:(BOOL)a3;
- (id)_baseLayerForeground;
- (id)_colorAtIndex:(unint64_t)a3 position:(unint64_t)a4;
- (id)_complicationColor;
- (id)_fromColor1;
- (id)_fromColor2;
- (id)_fromColor3;
- (id)_fromColor4;
- (id)_handInlay1;
- (id)_handInlay2;
- (id)_handInlay3;
- (id)_handInlay4;
- (id)_handInlayColorAtIndex:(unint64_t)a3;
- (id)_identityColor:(id)a3 withLightnessFraction:(double)a4;
- (id)_identityColorForIndex:(unint64_t)a3;
- (id)_midColor1;
- (id)_midColor2;
- (id)_midColor3;
- (id)_midColor4;
- (id)_outermostColorAtIndex:(unint64_t)a3 position:(unint64_t)a4;
- (id)_outermostFromColor1;
- (id)_outermostFromColor2;
- (id)_outermostFromColor3;
- (id)_outermostFromColor4;
- (id)_outermostMidColor1;
- (id)_outermostMidColor2;
- (id)_outermostMidColor3;
- (id)_outermostMidColor4;
- (id)_outermostToColor1;
- (id)_outermostToColor2;
- (id)_outermostToColor3;
- (id)_outermostToColor4;
- (id)_rainbowColorForDigit:(unint64_t)a3;
- (id)_toColor1;
- (id)_toColor2;
- (id)_toColor3;
- (id)_toColor4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)swatchImageForSize:(CGSize)a3;
- (unint64_t)_lightnessLevel;
- (unint64_t)_lightnessLevelForColor:(id)a3;
- (void)configurationDidChange:(id)a3;
- (void)invalidateCachedValues;
- (void)setIsEditingComplications:(BOOL)a3;
@end

@implementation NTKCrosswindColorPalette

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKCrosswindColorPalette;
    v4 = [(NTKCrosswindColorPalette *)&v8 identifier];
    v5 = +[NSString stringWithFormat:@"%@-%lu", v4, self->_isEditingComplications];
    v6 = self->_cachedIdentifier;
    self->_cachedIdentifier = v5;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCrosswindColorPalette;
  id v4 = [(NTKCrosswindColorPalette *)&v6 copyWithZone:a3];
  [v4 setIsEditingComplications:self->_isEditingComplications];
  [v4 invalidateCachedValues];
  return v4;
}

- (void)invalidateCachedValues
{
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (void)setIsEditingComplications:(BOOL)a3
{
  self->_isEditingComplications = a3;
  [(NTKCrosswindColorPalette *)self invalidateCachedValues];
}

- (void)configurationDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCrosswindColorPalette;
  [(NTKCrosswindColorPalette *)&v4 configurationDidChange:a3];
  [(NTKCrosswindColorPalette *)self invalidateCachedValues];
}

- (id)_baseLayerBackground
{
  return [(NTKCrosswindColorPalette *)self _baseLayerColorForForeground:0];
}

- (id)_baseLayerForeground
{
  return [(NTKCrosswindColorPalette *)self _baseLayerColorForForeground:1];
}

- (id)_fromColor1
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:0 position:0];
}

- (id)_midColor1
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:0 position:1];
}

- (id)_toColor1
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:0 position:2];
}

- (id)_handInlay1
{
  return [(NTKCrosswindColorPalette *)self _handInlayColorAtIndex:0];
}

- (id)_fromColor2
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:1 position:0];
}

- (id)_midColor2
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:1 position:1];
}

- (id)_toColor2
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:1 position:2];
}

- (id)_handInlay2
{
  return [(NTKCrosswindColorPalette *)self _handInlayColorAtIndex:1];
}

- (id)_fromColor3
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:2 position:0];
}

- (id)_midColor3
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:2 position:1];
}

- (id)_toColor3
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:2 position:2];
}

- (id)_handInlay3
{
  return [(NTKCrosswindColorPalette *)self _handInlayColorAtIndex:2];
}

- (id)_fromColor4
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:3 position:0];
}

- (id)_midColor4
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:3 position:1];
}

- (id)_toColor4
{
  return [(NTKCrosswindColorPalette *)self _colorAtIndex:3 position:2];
}

- (id)_handInlay4
{
  return [(NTKCrosswindColorPalette *)self _handInlayColorAtIndex:3];
}

- (id)_outermostFromColor1
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:0 position:0];
}

- (id)_outermostMidColor1
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:0 position:1];
}

- (id)_outermostToColor1
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:0 position:2];
}

- (id)_outermostFromColor2
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:1 position:0];
}

- (id)_outermostMidColor2
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:1 position:1];
}

- (id)_outermostToColor2
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:1 position:2];
}

- (id)_outermostFromColor3
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:2 position:0];
}

- (id)_outermostMidColor3
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:2 position:1];
}

- (id)_outermostToColor3
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:2 position:2];
}

- (id)_outermostFromColor4
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:3 position:0];
}

- (id)_outermostMidColor4
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:3 position:1];
}

- (id)_outermostToColor4
{
  return [(NTKCrosswindColorPalette *)self _outermostColorAtIndex:3 position:2];
}

- (NSNumber)editingComplicationsFraction
{
  if (self->_isEditingComplications) {
    return (NSNumber *)&off_109A0;
  }
  else {
    return (NSNumber *)&off_109B0;
  }
}

- (UIColor)resolvedComplicationColor
{
  if (self->_isEditingComplications) {
    +[UIColor whiteColor];
  }
  else {
  v2 = [(NTKCrosswindColorPalette *)self complicationColor];
  }

  return (UIColor *)v2;
}

- (id)_complicationColor
{
  if ([(NTKCrosswindColorPalette *)self _isWhiteColor])
  {
    uint64_t v3 = +[UIColor colorWithRed:0.498039216 green:0.466666669 blue:0.470588237 alpha:1.0];
  }
  else
  {
    if ([(NTKCrosswindColorPalette *)self isSeasonalCollection]
      && (char *)[(NTKCrosswindColorPalette *)self _lightnessLevel] == (char *)&dword_0 + 1)
    {
      objc_super v4 = [(NTKCrosswindColorPalette *)self _identityColorForIndex:3];
      v5 = objc_msgSend(v4, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.18);

      goto LABEL_8;
    }
    uint64_t v3 = +[UIColor whiteColor];
  }
  v5 = (void *)v3;
LABEL_8:

  return v5;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKCrosswindColorPalette *)self isRainbowColor])
  {
    v23.receiver = self;
    v23.super_class = (Class)NTKCrosswindColorPalette;
    objc_super v6 = -[NTKCrosswindColorPalette swatchImageForSize:](&v23, "swatchImageForSize:", width, height);
  }
  else if (([(NTKCrosswindColorPalette *)self isCompositePalette] & 1) != 0 {
         || [(NTKCrosswindColorPalette *)self _isCustomHeroColor])
  }
  {
    if (qword_16F28 != -1) {
      dispatch_once(&qword_16F28, &stru_104F8);
    }
    v7 = [(NTKCrosswindColorPalette *)self configuration];
    objc_super v8 = [v7 uniqueId];
    v27.double width = width;
    v27.double height = height;
    v9 = NSStringFromCGSize(v27);
    v10 = +[NSString stringWithFormat:@"%@-%@", v8, v9];

    objc_super v6 = [(id)qword_16F20 objectForKey:v10];
    if (!v6)
    {
      if ([(NTKCrosswindColorPalette *)self isCompositePalette])
      {
        v11 = [(NTKCrosswindColorPalette *)self toColor1];
        v12 = [(NTKCrosswindColorPalette *)self fromColor1];
        objc_super v6 = NTKSwatchTwoColorGradientImage();
      }
      else
      {
        v13 = [(NTKCrosswindColorPalette *)self pigmentEditOption];
        v14 = [v13 identifier];
        unsigned int v15 = [v14 isEqualToString:@"crosswind.special.hero-marigold"];

        if (v15)
        {
          v16 = [(NTKCrosswindColorPalette *)self toColor1];
          v25[0] = v16;
          v17 = [(NTKCrosswindColorPalette *)self toColor2];
          v25[1] = v17;
          v18 = [(NTKCrosswindColorPalette *)self toColor4];
          v25[2] = v18;
          v19 = [(NTKCrosswindColorPalette *)self toColor3];
          v25[3] = v19;
          v20 = v25;
        }
        else
        {
          v16 = [(NTKCrosswindColorPalette *)self toColor3];
          v24[0] = v16;
          v17 = [(NTKCrosswindColorPalette *)self toColor2];
          v24[1] = v17;
          v18 = [(NTKCrosswindColorPalette *)self toColor4];
          v24[2] = v18;
          v19 = [(NTKCrosswindColorPalette *)self toColor1];
          v24[3] = v19;
          v20 = v24;
        }
        v21 = +[NSArray arrayWithObjects:v20 count:4];

        objc_super v6 = NTKSwatchColorSectorsImage();
      }
      [(id)qword_16F20 setObject:v6 forKey:v10];
    }
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (BOOL)_isWhiteColor
{
  v2 = [(NTKCrosswindColorPalette *)self pigmentEditOption];
  uint64_t v3 = [v2 optionName];
  unsigned __int8 v4 = [v3 isEqualToString:@"white"];

  return v4;
}

- (BOOL)_isCustomHeroColor
{
  v2 = [(NTKCrosswindColorPalette *)self pigmentEditOption];
  uint64_t v3 = [v2 collectionName];
  unsigned __int8 v4 = [v3 isEqualToString:@"crosswind.special"];

  return v4;
}

- (BOOL)_isCustomHeroOrSpecialColor
{
  if ([(NTKCrosswindColorPalette *)self _isCustomHeroColor]) {
    return 1;
  }

  return [(NTKCrosswindColorPalette *)self isRainbowColor];
}

- (unint64_t)_lightnessLevel
{
  if ([(NTKCrosswindColorPalette *)self _isCustomHeroOrSpecialColor]) {
    return 0;
  }
  unsigned __int8 v4 = [(NTKCrosswindColorPalette *)self _identityColorForIndex:0];
  unint64_t v5 = [(NTKCrosswindColorPalette *)self _lightnessLevelForColor:v4];

  return v5;
}

- (unint64_t)_lightnessLevelForColor:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[UIColor whiteColor];
  CLKContrastRatioForColors();
  double v6 = v5;

  return v6 < 2.0;
}

- (id)_identityColorForIndex:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double v5 = [(NTKCrosswindColorPalette *)self toColor1];
      goto LABEL_9;
    case 1uLL:
      double v5 = [(NTKCrosswindColorPalette *)self toColor2];
      goto LABEL_9;
    case 2uLL:
      double v5 = [(NTKCrosswindColorPalette *)self toColor3];
      goto LABEL_9;
    case 3uLL:
      double v5 = [(NTKCrosswindColorPalette *)self toColor4];
LABEL_9:
      break;
    default:
      double v5 = 0;
      break;
  }
  return v5;
}

- (double)_valueForColorIndex:(unint64_t)a3 inValues:
{
  switch(a3)
  {
    case 0uLL:
      return *(float *)&v3;
    case 1uLL:
      float v5 = *((float *)&v3 + 1);
      goto LABEL_7;
    case 2uLL:
      float v5 = *((float *)&v3 + 2);
      goto LABEL_7;
    case 3uLL:
      float v5 = *((float *)&v3 + 3);
LABEL_7:
      double result = v5;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)_identityColor:(id)a3 withLightnessFraction:(double)a4
{
  id v6 = a3;
  double v7 = 1.0 - a4;
  if ([(NTKCrosswindColorPalette *)self hasPrimaryColorRange]) {
    [(NTKCrosswindColorPalette *)self primaryColorWithFraction:v7];
  }
  else {
  objc_super v8 = objc_msgSend(v6, "ntk_colorWithLightness:", v7 * -0.28 + 0.95);
  }

  return v8;
}

- (id)_baseLayerColorForForeground:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTKCrosswindColorPalette *)self _isWhiteColor])
  {
    double v5 = 0.886274517;
    if (!v3) {
      double v5 = 1.0;
    }
    id v6 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5);
  }
  else
  {
    double v7 = [(NTKCrosswindColorPalette *)self _identityColorForIndex:0];
    if ([(NTKCrosswindColorPalette *)self isSeasonalCollection])
    {
      unint64_t v8 = [(NTKCrosswindColorPalette *)self _lightnessLevel];
      if (v8 == 1)
      {
        double v9 = 0.0000000134110482;
      }
      else
      {
        double v9 = 0.0;
        if (!v8) {
          double v9 = 0.000000119209318;
        }
      }
      v11 = +[UIColor whiteColor];
      id v6 = CLKUIInterpolateBetweenColors();
    }
    else
    {
      v10 = [(NTKCrosswindColorPalette *)self pigmentEditOption];
      v11 = [v10 fullname];

      if ([v11 isEqualToString:ntk_standard_yellow])
      {
        int8x8_t v12 = (int8x8_t)0x3F0000003F800000;
      }
      else
      {
        if ([v11 isEqualToString:ntk_standard_cream]) {
          unsigned int v13 = -1;
        }
        else {
          unsigned int v13 = 0;
        }
        int8x8_t v12 = vbsl_s8((int8x8_t)vdup_n_s32(v13), (int8x8_t)0x3F4000003F000000, (int8x8_t)0x3F4000003F800000);
      }
      if (v3) {
        v12.i32[0] = v12.i32[1];
      }
      id v6 = [(NTKCrosswindColorPalette *)self _identityColor:v7 withLightnessFraction:*(float *)v12.i32];
      if (!v3 && [v11 isEqualToString:ntk_standard_warmGray])
      {
        uint64_t v14 = objc_msgSend(v6, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.05);

        id v6 = (void *)v14;
      }
    }
  }

  return v6;
}

- (id)_colorAtIndex:(unint64_t)a3 position:(unint64_t)a4
{
  if (![(NTKCrosswindColorPalette *)self isCompositePalette])
  {
    if ([(NTKCrosswindColorPalette *)self isRainbowColor])
    {
      if (a4 < 3) {
        unint64_t v9 = a4 + 1;
      }
      else {
        unint64_t v9 = 0;
      }
      uint64_t v10 = [(NTKCrosswindColorPalette *)self _rainbowColorForDigit:v9 + 3 * a3];
    }
    else
    {
      if (a4 == 2)
      {
        v19 = [(NTKCrosswindColorPalette *)self primaryColor];
LABEL_19:
        if ([(NTKCrosswindColorPalette *)self _isWhiteColor])
        {
          [(NTKCrosswindColorPalette *)self _valueForColorIndex:a3 inValues:0.000195791275];
          uint64_t v20 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:");
        }
        else
        {
          if (![(NTKCrosswindColorPalette *)self isSeasonalCollection])
          {
            [(NTKCrosswindColorPalette *)self _valueForColorIndex:a3 inValues:0.000000119209318];
            v24 = -[NTKCrosswindColorPalette _identityColor:withLightnessFraction:](self, "_identityColor:withLightnessFraction:", v19);
            uint64_t v4 = v24;
            if (a3 == 3)
            {
              uint64_t v25 = objc_msgSend(v24, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.1);

              uint64_t v4 = (void *)v25;
            }
            goto LABEL_30;
          }
          unint64_t v21 = [(NTKCrosswindColorPalette *)self _lightnessLevelForColor:v19];
          if (v21 == 1)
          {
            [(NTKCrosswindColorPalette *)self _valueForColorIndex:a3 inValues:0.00000000566244382];
            double v22 = v26;
            double v23 = -0.000000119209374;
          }
          else
          {
            double v22 = 0.0;
            double v23 = 0.0;
            if (!v21) {
              double v23 = -0.00000000149011647;
            }
          }
          [(NTKCrosswindColorPalette *)self _valueForColorIndex:a3 inValues:v23];
          uint64_t v20 = objc_msgSend(v19, "ntk_colorWithSaturationDelta:brightnessDelta:", v22, v27);
        }
        uint64_t v4 = (void *)v20;
LABEL_30:

        goto LABEL_31;
      }
      if (a4 == 1) {
        goto LABEL_16;
      }
      if (a4) {
        goto LABEL_31;
      }
      uint64_t v10 = [(NTKCrosswindColorPalette *)self _identityColorForIndex:a3];
    }
    uint64_t v4 = (void *)v10;
    goto LABEL_31;
  }
  switch(a4)
  {
    case 2uLL:
      v18 = [(NTKCrosswindColorPalette *)self paletteAtIndex:0];
      v19 = [v18 primaryColor];

      goto LABEL_19;
    case 1uLL:
LABEL_16:
      unint64_t v11 = a3 + 1;
      int8x8_t v12 = +[NSNumber numberWithUnsignedInteger:a3 + 1];
      unsigned int v13 = +[NSString stringWithFormat:@"fromColor%@", v12];
      uint64_t v14 = [(NTKCrosswindColorPalette *)self valueForKey:v13];

      unsigned int v15 = +[NSNumber numberWithUnsignedInteger:v11];
      v16 = +[NSString stringWithFormat:@"toColor%@", v15];
      v17 = [(NTKCrosswindColorPalette *)self valueForKey:v16];

      uint64_t v4 = CLKUIInterpolateBetweenColors();

      break;
    case 0uLL:
      unint64_t v8 = [(NTKCrosswindColorPalette *)self paletteAtIndex:1];
      uint64_t v4 = [v8 primaryColor];

      break;
  }
LABEL_31:

  return v4;
}

- (id)_outermostColorAtIndex:(unint64_t)a3 position:(unint64_t)a4
{
  if (a4 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (uint64_t)*(&off_10518 + a4);
  }
  id v6 = +[NSNumber numberWithUnsignedInteger:a3 + 1];
  double v7 = +[NSString stringWithFormat:@"%@Color%@", v5, v6];
  unint64_t v8 = [(NTKCrosswindColorPalette *)self valueForKey:v7];

  unint64_t v9 = objc_msgSend(v8, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.05);

  return v9;
}

- (id)_handInlayColorAtIndex:(unint64_t)a3
{
  BOOL v3 = [(NTKCrosswindColorPalette *)self _identityColorForIndex:a3];
  uint64_t v4 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.1);

  return v4;
}

- (id)_rainbowColorForDigit:(unint64_t)a3
{
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = +[NSString stringWithFormat:@"digit%@", v4];

  id v6 = [(NTKCrosswindColorPalette *)self valueForKey:v5];

  return v6;
}

- (BOOL)isEditingComplications
{
  return self->_isEditingComplications;
}

- (void).cxx_destruct
{
}

@end