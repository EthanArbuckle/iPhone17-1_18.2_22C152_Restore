@interface NTKSpectrumColorPalette
- (BOOL)is3ComponentsGradient;
- (NSNumber)overlayOpacity;
- (NTKSpectrumColorPalette)init;
- (id)_bandColor;
- (id)_complicationColor;
- (id)_fromColor;
- (id)_toColor;
- (id)hourHandInlayAtAngle:(id)a3;
- (id)minuteHandInlayAtAngle:(id)a3;
- (id)swatchImageForSize:(CGSize)a3;
- (id)swatchPrimaryColor;
@end

@implementation NTKSpectrumColorPalette

- (NTKSpectrumColorPalette)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)NTKSpectrumColorPalette;
  return [(NTKSpectrumColorPalette *)&v5 initWithFaceClass:v3];
}

- (id)_fromColor
{
  if ([(NTKSpectrumColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKSpectrumColorPalette *)self paletteAtIndex:1];
    id v4 = [v3 primaryColor];
  }
  else
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor])
    {
      objc_super v5 = CLKUIConvertToUIColorFromRGBf();
      goto LABEL_10;
    }
    unsigned int v6 = [(NTKSpectrumColorPalette *)self hasPrimaryColorRange];
    v7 = [(NTKSpectrumColorPalette *)self primaryColor];
    uint64_t v3 = v7;
    if (v6)
    {
      uint64_t v11 = 0;
      v8 = (id *)&v11;
      sub_2DD4((uint64_t)v7, &v11, 0);
    }
    else
    {
      uint64_t v10 = 0;
      v8 = (id *)&v10;
      sub_2EC8(v7, &v10, 0);
    }
    id v4 = *v8;
  }
  objc_super v5 = v4;

LABEL_10:

  return v5;
}

- (id)_bandColor
{
  if ([(NTKSpectrumColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKSpectrumColorPalette *)self fromColor];
    id v4 = [(NTKSpectrumColorPalette *)self toColor];
    objc_super v5 = NTKInterpolateBetweenColors();
  }
  else
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor]) {
      CLKUIConvertToUIColorFromRGBf();
    }
    else {
    objc_super v5 = [(NTKSpectrumColorPalette *)self primaryColor];
    }
  }

  return v5;
}

- (id)_complicationColor
{
  if ([(NTKSpectrumColorPalette *)self isUnityColor]) {
    +[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
  }
  else {
  uint64_t v3 = [(NTKSpectrumColorPalette *)self bandColor];
  }

  return v3;
}

- (id)_toColor
{
  if ([(NTKSpectrumColorPalette *)self isCompositePalette])
  {
    uint64_t v3 = [(NTKSpectrumColorPalette *)self paletteAtIndex:0];
    id v4 = [v3 primaryColor];
  }
  else
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor])
    {
      objc_super v5 = CLKUIConvertToUIColorFromRGBf();
      goto LABEL_10;
    }
    unsigned int v6 = [(NTKSpectrumColorPalette *)self hasPrimaryColorRange];
    v7 = [(NTKSpectrumColorPalette *)self primaryColor];
    uint64_t v3 = v7;
    if (v6)
    {
      uint64_t v11 = 0;
      v8 = (id *)&v11;
      sub_2DD4((uint64_t)v7, 0, &v11);
    }
    else
    {
      uint64_t v10 = 0;
      v8 = (id *)&v10;
      sub_2EC8(v7, 0, &v10);
    }
    id v4 = *v8;
  }
  objc_super v5 = v4;

LABEL_10:

  return v5;
}

- (id)hourHandInlayAtAngle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKSpectrumColorPalette *)self hourHandInlay];
  if ([(NTKSpectrumColorPalette *)self isNotFoundColor:v5])
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor])
    {
      [v4 floatValue];
      _NTKSpectrumGetOverlayGradientColor();
    }
    else
    {
      [(NTKSpectrumColorPalette *)self bandColor];
    uint64_t v6 = };

    objc_super v5 = (void *)v6;
  }

  return v5;
}

- (id)minuteHandInlayAtAngle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKSpectrumColorPalette *)self minuteHandInlay];
  if ([(NTKSpectrumColorPalette *)self isNotFoundColor:v5])
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor])
    {
      [v4 floatValue];
      _NTKSpectrumGetOverlayGradientColor();
    }
    else
    {
      [(NTKSpectrumColorPalette *)self bandColor];
    uint64_t v6 = };

    objc_super v5 = (void *)v6;
  }

  return v5;
}

- (NSNumber)overlayOpacity
{
  if ([(NTKSpectrumColorPalette *)self isRainbowColor]) {
    return (NSNumber *)&off_10C28;
  }
  else {
    return (NSNumber *)&off_10C38;
  }
}

- (BOOL)is3ComponentsGradient
{
  v2 = [(NTKSpectrumColorPalette *)self midColor];
  BOOL v3 = v2 != (void *)NTKFaceColorPaletteNotFoundColor;

  return v3;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!qword_16D98)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)qword_16D98;
    qword_16D98 = v6;
  }
  v8 = [(NTKSpectrumColorPalette *)self configuration];
  v9 = [v8 uniqueId];
  v18.double width = width;
  v18.double height = height;
  uint64_t v10 = NSStringFromCGSize(v18);
  uint64_t v11 = +[NSString stringWithFormat:@"%@-%@", v9, v10];

  v12 = [(id)qword_16D98 objectForKey:v11];
  if (!v12)
  {
    if ([(NTKSpectrumColorPalette *)self isRainbowColor])
    {
      v16.receiver = self;
      v16.super_class = (Class)NTKSpectrumColorPalette;
      v12 = -[NTKSpectrumColorPalette swatchImageForSize:](&v16, "swatchImageForSize:", width, height);
    }
    else
    {
      v13 = [(NTKSpectrumColorPalette *)self toColor];
      v14 = [(NTKSpectrumColorPalette *)self fromColor];
      v12 = NTKSwatchTwoColorGradientImage();

      [(id)qword_16D98 setObject:v12 forKey:v11];
    }
  }

  return v12;
}

- (id)swatchPrimaryColor
{
  if ([(NTKSpectrumColorPalette *)self isRainbowColor])
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKSpectrumColorPalette;
    BOOL v3 = [(NTKSpectrumColorPalette *)&v5 swatchPrimaryColor];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

@end