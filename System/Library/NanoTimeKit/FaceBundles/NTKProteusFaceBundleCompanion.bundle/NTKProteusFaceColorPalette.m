@interface NTKProteusFaceColorPalette
- (NTKProteusFaceColorPalette)initWithFaceClass:(Class)a3 device:(id)a4;
- (double)_contrastRatio;
- (id)_background;
- (id)_simpleTextComplicationColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)digitColor;
- (id)identifier;
- (unint64_t)backgroundStyle;
- (void)configurationDidChange:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
@end

@implementation NTKProteusFaceColorPalette

- (NTKProteusFaceColorPalette)initWithFaceClass:(Class)a3 device:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKProteusFaceColorPalette;
  v8 = [(NTKProteusFaceColorPalette *)&v11 initWithFaceClass:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_device, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKProteusFaceColorPalette;
  v4 = [(NTKProteusFaceColorPalette *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setBackgroundStyle:", -[NTKProteusFaceColorPalette backgroundStyle](self, "backgroundStyle"));
  objc_storeStrong(v4 + 1, self->_device);
  return v4;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKProteusFaceColorPalette;
    v4 = [(NTKProteusFaceColorPalette *)&v8 identifier];
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
  v5.super_class = (Class)NTKProteusFaceColorPalette;
  [(NTKProteusFaceColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (id)_background
{
  if (self->_backgroundStyle == 1) {
    [(NTKProteusFaceColorPalette *)self primaryColor];
  }
  else {
  v2 = +[UIColor blackColor];
  }

  return v2;
}

- (id)_simpleTextComplicationColor
{
  v3 = [(NTKProteusFaceColorPalette *)self simpleTextComplication];
  v4 = v3;
  if (self->_backgroundStyle != 1)
  {
    id v15 = v3;
    objc_super v5 = v15;
LABEL_11:
    id v14 = v15;
    goto LABEL_12;
  }
  objc_super v5 = +[UIColor whiteColor];

  objc_super v6 = [(NTKProteusFaceColorPalette *)self primaryColor];
  CLKContrastRatioForColors();
  double v8 = v7;

  [(NTKProteusFaceColorPalette *)self _contrastRatio];
  if (v8 >= v9
    || ([(NTKProteusFaceColorPalette *)self pigmentEditOption],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isRainbowColor],
        v10,
        (v11 & 1) != 0))
  {
LABEL_10:
    id v15 = [v5 colorWithAlphaComponent:0.8];
    goto LABEL_11;
  }
  v12 = [(NTKProteusFaceColorPalette *)self simpleTextComplicationContrast];
  v13 = v12;
  if (!v12 || v12 == (void *)NTKFaceColorPaletteNotFoundColor)
  {
    if (([(NTKProteusFaceColorPalette *)self hasPrimaryColorRange] & 1) == 0)
    {
      v18 = [(NTKProteusFaceColorPalette *)self primaryColor];
      v19 = [v18 colorWithAlphaComponent:1.0];
      objc_msgSend(v19, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.18, -0.2);
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    uint64_t v16 = [(NTKProteusFaceColorPalette *)self primaryColorWithFraction:1.0];

    objc_super v5 = (void *)v16;
    goto LABEL_10;
  }
  id v14 = v12;
LABEL_16:

LABEL_12:

  return v14;
}

- (id)digitColor
{
  v3 = [(NTKProteusFaceColorPalette *)self digit];
  v4 = v3;
  if (v3 && v3 != (void *)NTKFaceColorPaletteNotFoundColor)
  {
    id v5 = v3;
    objc_super v6 = v5;
LABEL_4:
    id v7 = v5;
    goto LABEL_16;
  }
  if ([(NTKProteusFaceColorPalette *)self isTritium])
  {
    char v8 = NTKEnableAODVibrancy();
    double v9 = [(NTKProteusFaceColorPalette *)self primaryColor];
    id v7 = v9;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = [v9 colorWithAlphaComponent:0.7];

      objc_super v6 = v4;
      id v7 = (id)v10;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (self->_backgroundStyle != 1)
  {
    id v7 = [(NTKProteusFaceColorPalette *)self primaryColor];
LABEL_15:
    objc_super v6 = v4;
    goto LABEL_16;
  }
  objc_super v6 = +[UIColor whiteColor];

  unsigned __int8 v11 = [(NTKProteusFaceColorPalette *)self primaryColor];
  CLKContrastRatioForColors();
  double v13 = v12;

  [(NTKProteusFaceColorPalette *)self _contrastRatio];
  if (v13 >= v14) {
    goto LABEL_21;
  }
  id v15 = [(NTKProteusFaceColorPalette *)self pigmentEditOption];
  unsigned __int8 v16 = [v15 isRainbowColor];

  if (v16) {
    goto LABEL_21;
  }
  v17 = [(NTKProteusFaceColorPalette *)self digitContrast];
  v18 = v17;
  if (!v17 || v17 == (void *)NTKFaceColorPaletteNotFoundColor)
  {
    if (([(NTKProteusFaceColorPalette *)self hasPrimaryColorRange] & 1) == 0)
    {
      v21 = [(NTKProteusFaceColorPalette *)self primaryColor];
      v22 = [v21 colorWithAlphaComponent:1.0];
      objc_msgSend(v22, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.18, -0.2);
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    }
    uint64_t v20 = [(NTKProteusFaceColorPalette *)self primaryColorWithFraction:1.0];

    objc_super v6 = (void *)v20;
LABEL_21:
    id v5 = [v6 colorWithAlphaComponent:0.7];
    goto LABEL_4;
  }
  id v7 = v17;
LABEL_23:

LABEL_16:

  return v7;
}

- (double)_contrastRatio
{
  v2 = [(NTKProteusFaceColorPalette *)self pigmentEditOption];
  v3 = [v2 fullname];
  unsigned int v4 = [v3 isEqualToString:ntk_standard_lightYellow];

  double result = 1.3;
  if (!v4) {
    return 2.0;
  }
  return result;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end