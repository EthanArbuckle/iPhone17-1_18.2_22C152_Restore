@interface NTKMagmaColorPalette
- (BOOL)isSpecialColor;
- (id)_backgroundEnd;
- (id)_backgroundMask;
- (id)_backgroundStart;
- (id)_backgroundTextureAlpha;
- (id)_digits;
- (id)_digitsOutline;
- (id)_logoBackgroundOff;
- (id)_maskedBackgroundEnd;
- (id)_maskedBackgroundStart;
- (id)_primaryBackgroundEnd;
- (id)_primaryBackgroundStart;
- (id)_swoosh;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)swatchImageForSize:(CGSize)a3;
- (unint64_t)backgroundStyle;
- (void)configurationDidChange:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
@end

@implementation NTKMagmaColorPalette

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKMagmaColorPalette;
  id v4 = [(NTKMagmaColorPalette *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setBackgroundStyle:", -[NTKMagmaColorPalette backgroundStyle](self, "backgroundStyle"));
  return v4;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKMagmaColorPalette;
    id v4 = [(NTKMagmaColorPalette *)&v8 identifier];
    v5 = +[NSString stringWithFormat:@"%@-%lu", v4, self->_backgroundStyle];
    objc_super v6 = self->_cachedIdentifier;
    self->_cachedIdentifier = v5;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (void)configurationDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMagmaColorPalette;
  [(NTKMagmaColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (BOOL)isSpecialColor
{
  if ([(NTKMagmaColorPalette *)self isRainbowColor]) {
    return 1;
  }
  id v4 = [(NTKMagmaColorPalette *)self pigmentEditOption];
  objc_super v5 = [v4 collectionName];
  unsigned __int8 v6 = [v5 isEqualToString:@"magma.special"];

  return v6;
}

- (id)_digits
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self digitsBackgroundOn];
  }
  else
  {
    v3 = [(NTKMagmaColorPalette *)self digitsBackgroundOff];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_digitsOutline
{
  v2 = [(NTKMagmaColorPalette *)self digits];
  v3 = [v2 colorWithAlphaComponent:0.0];

  return v3;
}

- (id)_swoosh
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self logo];
  }
  else
  {
    v3 = [(NTKMagmaColorPalette *)self logoBackgroundOff];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_logoBackgroundOff
{
  if ([(NTKMagmaColorPalette *)self isSpecialColor]) {
    [(NTKMagmaColorPalette *)self primaryBackgroundEnd];
  }
  else {
  v3 = [(NTKMagmaColorPalette *)self logo];
  }

  return v3;
}

- (id)_primaryBackgroundStart
{
  if ([(NTKMagmaColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKMagmaColorPalette *)self paletteAtIndex:0];
    id v4 = [v3 primaryColor];
  }
  else
  {
    id v4 = [(NTKMagmaColorPalette *)self primaryColor];
  }

  return v4;
}

- (id)_primaryBackgroundEnd
{
  if ([(NTKMagmaColorPalette *)self isCompositePalette])
  {
    v3 = [(NTKMagmaColorPalette *)self paletteAtIndex:1];
    id v4 = [v3 primaryColor];
  }
  else
  {
    id v4 = [(NTKMagmaColorPalette *)self primaryBackgroundStart];
  }

  return v4;
}

- (id)_backgroundStart
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self primaryBackgroundStart];
  }
  else
  {
    v3 = +[UIColor blackColor];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_backgroundEnd
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self primaryBackgroundEnd];
  }
  else
  {
    v3 = +[UIColor blackColor];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_maskedBackgroundStart
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self maskedBackgroundOnStart];
  }
  else
  {
    v3 = [(NTKMagmaColorPalette *)self maskedBackgroundOffStart];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_maskedBackgroundEnd
{
  unint64_t backgroundStyle = self->_backgroundStyle;
  if (backgroundStyle)
  {
    if (backgroundStyle != 1) {
      goto LABEL_6;
    }
    v3 = [(NTKMagmaColorPalette *)self maskedBackgroundOnEnd];
  }
  else
  {
    v3 = [(NTKMagmaColorPalette *)self maskedBackgroundOffEnd];
  }
  a2 = v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)_backgroundMask
{
  unsigned int v3 = [(NTKMagmaColorPalette *)self isSpecialColor];
  id v4 = &off_15018;
  if (v3 && !self->_backgroundStyle) {
    id v4 = &off_15008;
  }

  return v4;
}

- (id)_backgroundTextureAlpha
{
  unsigned int v3 = [(NTKMagmaColorPalette *)self isRainbowColor];
  id v4 = &off_15018;
  if (v3 && self->_backgroundStyle == 1) {
    id v4 = &off_15008;
  }

  return v4;
}

- (id)swatchImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NTKMagmaColorPalette *)self isRainbowColor])
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKMagmaColorPalette;
    unsigned __int8 v6 = -[NTKMagmaColorPalette swatchImageForSize:](&v14, "swatchImageForSize:", width, height);
  }
  else if ([(NTKMagmaColorPalette *)self isSpecialColor])
  {
    if (qword_1C488 != -1) {
      dispatch_once(&qword_1C488, &stru_14510);
    }
    v7 = [(NTKMagmaColorPalette *)self configuration];
    objc_super v8 = [v7 uniqueId];
    v16.double width = width;
    v16.double height = height;
    v9 = NSStringFromCGSize(v16);
    v10 = +[NSString stringWithFormat:@"%@-%@", v8, v9];

    unsigned __int8 v6 = [(id)qword_1C480 objectForKey:v10];
    if (!v6)
    {
      v11 = [(NTKMagmaColorPalette *)self maskedBackgroundOffStart];
      v12 = [(NTKMagmaColorPalette *)self maskedBackgroundOffEnd];
      unsigned __int8 v6 = NTKSwatchTwoColorGradientImage();
      [(id)qword_1C480 setObject:v6 forKey:v10];
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
}

@end