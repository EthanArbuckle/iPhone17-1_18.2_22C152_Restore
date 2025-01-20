@interface NTKKuiperFaceColorPalette
- (BOOL)_isCloudBlueColor;
- (BOOL)_isGrayColor;
- (BOOL)_isLightColor;
- (BOOL)_isRainbowColor;
- (BOOL)_isWhiteColor;
- (BOOL)_useBrightnessOffsetForBackgroundColor;
- (BOOL)_usesRedContrastSecondHandColor;
- (id)_background;
- (id)_backgroundMedium;
- (id)_baseBackgroundColor;
- (id)_complicationBackground;
- (id)_complicationPrimary;
- (id)_complicationPrimaryDark;
- (id)_complicationPrimaryEditing;
- (id)_complicationPrimaryMedium;
- (id)_complicationSecondary;
- (id)_complicationSecondaryDarkBackground;
- (id)_dialBackground;
- (id)_dialBackgroundDark;
- (id)_dialBackgroundMedium;
- (id)_digit;
- (id)_hourTick;
- (id)_minuteTick;
- (id)_secondHand;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (unint64_t)dial;
- (void)configurationDidChange:(id)a3;
- (void)setDial:(unint64_t)a3;
@end

@implementation NTKKuiperFaceColorPalette

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKKuiperFaceColorPalette;
  id v4 = [(NTKKuiperFaceColorPalette *)&v6 copyWithZone:a3];
  [v4 setDial:self->_dial];
  return v4;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKKuiperFaceColorPalette;
    id v4 = [(NTKKuiperFaceColorPalette *)&v8 identifier];
    v5 = +[NSString stringWithFormat:@"%@-%lu", v4, self->_dial];
    objc_super v6 = self->_cachedIdentifier;
    self->_cachedIdentifier = v5;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (void)configurationDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKuiperFaceColorPalette;
  [(NTKKuiperFaceColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

- (void)setDial:(unint64_t)a3
{
  self->_dial = a3;
  self->_cachedIdentifier = 0;
  _objc_release_x1();
}

- (id)_background
{
  if (self->_dial == 4)
  {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self backgroundBlack];
LABEL_17:
    v7 = (void *)v3;
    goto LABEL_18;
  }
  if ([(NTKKuiperFaceColorPalette *)self _isWhiteColor])
  {
    unint64_t dial = self->_dial;
    if (dial != 1)
    {
      if (dial) {
        goto LABEL_16;
      }
LABEL_11:
      uint64_t v3 = [(NTKKuiperFaceColorPalette *)self backgroundLight];
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  if ([(NTKKuiperFaceColorPalette *)self _isCloudBlueColor])
  {
    unint64_t v5 = self->_dial;
    if (v5 == 1) {
      goto LABEL_11;
    }
    if (!v5)
    {
LABEL_10:
      uint64_t v3 = [(NTKKuiperFaceColorPalette *)self backgroundMedium];
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self backgroundDefault];
    goto LABEL_17;
  }
  if ([(NTKKuiperFaceColorPalette *)self _isRainbowColor])
  {
    unint64_t v6 = self->_dial;
    if (v6 == 1)
    {
      uint64_t v3 = [(NTKKuiperFaceColorPalette *)self dialBackgroundDark];
      goto LABEL_17;
    }
    if (!v6)
    {
      uint64_t v3 = [(NTKKuiperFaceColorPalette *)self dialBackgroundMedium];
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v9 = [(NTKKuiperFaceColorPalette *)self _baseBackgroundColor];
  v10 = v9;
  if (self->_dial > 1)
  {
    id v14 = v9;
  }
  else
  {
    double v17 = 0.0;
    double v18 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    [v9 getHue:&v18 saturation:&v17 brightness:&v16 alpha:&v15];
    double v11 = v16;
    if (v16 <= 0.82)
    {
      double v13 = v17;
    }
    else
    {
      double v16 = 0.82;
      unsigned __int8 v12 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
      double v13 = v17;
      if ((v12 & 1) == 0)
      {
        double v13 = v17 + -0.05;
        double v17 = v17 + -0.05;
      }
    }
    id v14 = +[UIColor colorWithHue:v18 saturation:v13 brightness:v16 alpha:v15];
  }
  v7 = v14;

LABEL_18:

  return v7;
}

- (id)_baseBackgroundColor
{
  if (self->_dial) {
    [(NTKKuiperFaceColorPalette *)self backgroundDefault];
  }
  else {
  v2 = [(NTKKuiperFaceColorPalette *)self backgroundMedium];
  }

  return v2;
}

- (id)_dialBackground
{
  unint64_t dial = self->_dial;
  if (dial < 2)
  {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self lightDialBackground];
  }
  else if (dial - 3 >= 2)
  {
    if (dial != 2) {
      goto LABEL_8;
    }
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self dialBackgroundMedium];
  }
  else
  {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self dialBackgroundDark];
  }
  a2 = v3;
LABEL_8:

  return (id)(id)a2;
}

- (id)_digit
{
  if (self->_dial > 1) {
    [(NTKKuiperFaceColorPalette *)self darkDialDigit];
  }
  else {
  v2 = [(NTKKuiperFaceColorPalette *)self lightDialDigit];
  }

  return v2;
}

- (id)_hourTick
{
  if (self->_dial > 1) {
    [(NTKKuiperFaceColorPalette *)self darkDialHourTick];
  }
  else {
  v2 = [(NTKKuiperFaceColorPalette *)self lightDialHourTick];
  }

  return v2;
}

- (id)_minuteTick
{
  if (self->_dial > 1)
  {
    id v4 = [(NTKKuiperFaceColorPalette *)self hourTick];
    unint64_t v5 = [(NTKKuiperFaceColorPalette *)self dialBackground];
    uint64_t v3 = NTKInterpolateBetweenColors();
  }
  else
  {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self lightDialMinuteTick];
  }

  return v3;
}

- (id)_secondHand
{
  if ([(NTKKuiperFaceColorPalette *)self _usesRedContrastSecondHandColor])
  {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self redContrastSecondHand];
  }
  else
  {
    if (self->_dial > 1) {
      [(NTKKuiperFaceColorPalette *)self darkDialSecondHand];
    }
    else {
    uint64_t v3 = [(NTKKuiperFaceColorPalette *)self lightDialSecondHand];
    }
  }

  return v3;
}

- (id)_complicationPrimary
{
  if ([(NTKKuiperFaceColorPalette *)self _isWhiteColor])
  {
    unint64_t dial = self->_dial;
    if (dial != 4)
    {
      if (dial != 1)
      {
        if (dial)
        {
LABEL_15:
          uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryMedium];
          goto LABEL_16;
        }
        goto LABEL_14;
      }
LABEL_8:
      uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryDark];
LABEL_16:
      v10 = (void *)v4;
      goto LABEL_17;
    }
LABEL_14:
    uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryDefault];
    goto LABEL_16;
  }
  if ([(NTKKuiperFaceColorPalette *)self _isCloudBlueColor])
  {
    if ((self->_dial | 4) != 4) {
      goto LABEL_8;
    }
    goto LABEL_14;
  }
  unsigned int v7 = [(NTKKuiperFaceColorPalette *)self _isRainbowColor];
  unint64_t v8 = self->_dial;
  if (v7)
  {
    if (!v6 & v5) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = ((1 << v8) & 0x13) == 0;
    }
    if (v9) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  switch(v8)
  {
    case 0uLL:
    case 4uLL:
      uint64_t v12 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryDefault];
      goto LABEL_25;
    case 1uLL:
    case 2uLL:
      uint64_t v12 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryMedium];
      goto LABEL_25;
    case 3uLL:
      uint64_t v12 = [(NTKKuiperFaceColorPalette *)self complicationPrimaryDark];
LABEL_25:
      double v13 = (void *)v12;
      break;
    default:
      double v13 = 0;
      break;
  }
  if ([(NTKKuiperFaceColorPalette *)self _useBrightnessOffsetForBackgroundColor])
  {
    objc_msgSend(v13, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.05);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = v13;
  }
  v10 = v14;

LABEL_17:

  return v10;
}

- (id)_complicationSecondary
{
  if (![(NTKKuiperFaceColorPalette *)self _isWhiteColor])
  {
    if (![(NTKKuiperFaceColorPalette *)self _isCloudBlueColor])
    {
      unsigned int v5 = [(NTKKuiperFaceColorPalette *)self _isRainbowColor];
      unint64_t dial = self->_dial;
      if (!v5)
      {
        if (dial) {
          [(NTKKuiperFaceColorPalette *)self complicationSecondaryDarkBackground];
        }
        else {
        uint64_t v12 = [(NTKKuiperFaceColorPalette *)self complicationSecondaryDefault];
        }
        if ([(NTKKuiperFaceColorPalette *)self _useBrightnessOffsetForBackgroundColor])
        {
          objc_msgSend(v12, "ntk_colorWithSaturationDelta:brightnessDelta:", 0.0, -0.05);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v13 = v12;
        }
        v10 = v13;

        goto LABEL_17;
      }
      BOOL v7 = dial > 4;
      uint64_t v8 = (1 << dial) & 0x13;
      if (!v7 && v8 != 0) {
        goto LABEL_14;
      }
LABEL_15:
      uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationPrimary];
      goto LABEL_16;
    }
    if ((self->_dial | 4) != 4) {
      goto LABEL_8;
    }
LABEL_14:
    uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationSecondaryDefault];
    goto LABEL_16;
  }
  unint64_t v3 = self->_dial;
  switch(v3)
  {
    case 4uLL:
      goto LABEL_14;
    case 1uLL:
      goto LABEL_15;
    case 0uLL:
      goto LABEL_14;
  }
LABEL_8:
  uint64_t v4 = [(NTKKuiperFaceColorPalette *)self complicationSecondaryLightBackground];
LABEL_16:
  v10 = (void *)v4;
LABEL_17:

  return v10;
}

- (BOOL)_useBrightnessOffsetForBackgroundColor
{
  v2 = [(NTKKuiperFaceColorPalette *)self _baseBackgroundColor];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v5 = 0;
  double v6 = 0.0;
  [v2 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  BOOL v3 = v6 > 0.82;

  return v3;
}

- (id)_backgroundMedium
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    unsigned int v4 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v5 = 0.1;
    if (v4) {
      double v5 = 0.0;
    }
    uint64_t v6 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v5, -0.2);
  }
  else
  {
    uint64_t v6 = NTKColorByApplyingWhiteOverlay();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)_complicationBackground
{
  if ([(NTKKuiperFaceColorPalette *)self _isRainbowColor] && self->_dial <= 1)
  {
    BOOL v3 = +[UIColor grayColor];
  }
  else
  {
    BOOL v3 = [(NTKKuiperFaceColorPalette *)self _background];
  }

  return v3;
}

- (id)_complicationPrimaryMedium
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    unsigned int v4 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v5 = 0.2;
    if (v4) {
      double v5 = 0.0;
    }
    uint64_t v6 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v5, -0.3);
  }
  else
  {
    uint64_t v6 = NTKColorByApplyingWhiteOverlay();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)_complicationPrimaryDark
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    unsigned int v4 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v5 = 0.2;
    if (v4) {
      double v5 = 0.0;
    }
    uint64_t v6 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v5, -0.3);
  }
  else
  {
    uint64_t v6 = NTKColorByApplyingBlackOverlay();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)_complicationPrimaryEditing
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    id v4 = v3;
  }
  else
  {
    NTKColorByApplyingWhiteOverlay();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v5 = v4;

  return v5;
}

- (id)_complicationSecondaryDarkBackground
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  unint64_t dial = self->_dial;
  if (![(NTKKuiperFaceColorPalette *)self _isLightColor] || dial == 4)
  {
    uint64_t v7 = [(NTKKuiperFaceColorPalette *)self darkBackgroundComplicationSecondary];
  }
  else
  {
    unsigned int v5 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v6 = 0.2;
    if (v5) {
      double v6 = 0.0;
    }
    uint64_t v7 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v6, -0.4);
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (id)_dialBackgroundMedium
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    unsigned int v4 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v5 = 0.1;
    if (v4) {
      double v5 = 0.0;
    }
    uint64_t v6 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v5, -0.25);
  }
  else
  {
    uint64_t v6 = NTKColorByApplyingWhiteOverlay();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)_dialBackgroundDark
{
  BOOL v3 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  if ([(NTKKuiperFaceColorPalette *)self _isLightColor])
  {
    unsigned int v4 = [(NTKKuiperFaceColorPalette *)self _isGrayColor];
    double v5 = 0.1;
    if (v4) {
      double v5 = 0.0;
    }
    uint64_t v6 = objc_msgSend(v3, "ntk_colorWithSaturationDelta:brightnessDelta:", v5, -0.5);
  }
  else
  {
    uint64_t v6 = NTKColorByApplyingBlackOverlay();
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (BOOL)_isLightColor
{
  if ([(NTKKuiperFaceColorPalette *)self _isRainbowColor]) {
    return 0;
  }
  unsigned int v4 = [(NTKKuiperFaceColorPalette *)self primaryColor];
  double v5 = +[UIColor whiteColor];
  CLKContrastRatioForColors();
  BOOL v3 = v6 < 2.0;

  return v3;
}

- (BOOL)_isWhiteColor
{
  v2 = [(NTKKuiperFaceColorPalette *)self pigmentEditOption];
  BOOL v3 = [v2 fullname];
  if ([v3 isEqualToString:ntk_seasons_spring2015_white]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:ntk_evergreen_white];
  }

  return v4;
}

- (BOOL)_isGrayColor
{
  v2 = [(NTKKuiperFaceColorPalette *)self pigmentEditOption];
  BOOL v3 = [v2 fullname];
  unsigned __int8 v4 = [v3 isEqualToString:ntk_standard_gray];

  return v4;
}

- (BOOL)_isCloudBlueColor
{
  v2 = [(NTKKuiperFaceColorPalette *)self pigmentEditOption];
  BOOL v3 = [v2 fullname];
  unsigned __int8 v4 = [v3 isEqualToString:ntk_seasons_summer2021_cloudBlue];

  return v4;
}

- (BOOL)_usesRedContrastSecondHandColor
{
  if (self->_dial != 2) {
    return 0;
  }
  v2 = [(NTKKuiperFaceColorPalette *)self pigmentEditOption];
  BOOL v3 = [v2 fullname];
  if ([v3 isEqualToString:ntk_standard_red])
  {
    [v2 colorFraction];
    unsigned __int8 v5 = v4 >= 0.5;
  }
  else if (([v3 isEqualToString:ntk_seasons_fall2015_red] & 1) != 0 {
         || ([v3 isEqualToString:ntk_seasons_fall2017_roseRed] & 1) != 0
  }
         || ([v3 isEqualToString:ntk_seasons_winter2018_hibiscus] & 1) != 0
         || ([v3 isEqualToString:ntk_seasons_winter2019_pomegranate] & 1) != 0
         || ([v3 isEqualToString:ntk_seasons_fall2021_red2sg] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v3 isEqualToString:ntk_seasons_fall2022_red];
  }

  return v5;
}

- (BOOL)_isRainbowColor
{
  v2 = [(NTKKuiperFaceColorPalette *)self pigmentEditOption];
  unsigned __int8 v3 = [v2 isRainbowColor];

  return v3;
}

- (unint64_t)dial
{
  return self->_dial;
}

- (void).cxx_destruct
{
}

@end