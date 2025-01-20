@interface NTKFoghornFaceColorPalette
+ (id)_canonicalMonochromePaletteNameForBezelStyle:(int64_t)a3;
+ (id)_colorFromColor:(id)a3 alpha:(double)a4;
+ (id)_colorFromColorSetColor:(id)a3 fallbackRootColor:(id)a4 alpha:(double)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNightMode;
- (NTKFoghornFaceColorPalette)nightModeColorPalette;
- (UIColor)bezelDepthDecorationColor;
- (UIColor)bezelDepthLabelColor;
- (UIColor)bezelDepthLimitLabelColor;
- (UIColor)bezelDepthLimitMajorTickColor;
- (UIColor)bezelDepthLimitMedialTick;
- (UIColor)bezelDepthLimitMedialTickColor;
- (UIColor)bezelDepthLimitMedialTick_night;
- (UIColor)bezelDepthLimitMinorTick;
- (UIColor)bezelDepthLimitMinorTickColor;
- (UIColor)bezelDepthLimitMinorTick_night;
- (UIColor)bezelDepthMarkerColor;
- (UIColor)bezelDepthMaxLabelColor;
- (UIColor)bezelDepthMaxMajorTickColor;
- (UIColor)bezelDepthMaxMarkerColor;
- (UIColor)bezelDepthMaxMedialTick;
- (UIColor)bezelDepthMaxMedialTickColor;
- (UIColor)bezelDepthMaxMedialTick_night;
- (UIColor)bezelDepthMaxMinorTick;
- (UIColor)bezelDepthMaxMinorTickColor;
- (UIColor)bezelDepthMaxMinorTick_night;
- (UIColor)bezelHarmoniaEmphasizedTickColor;
- (UIColor)bezelHarmoniaOvernightOutOfRangeColor;
- (UIColor)bezelHarmoniaOvernightPartiallyOutOfRangeColor;
- (UIColor)bezelHarmoniaOvernightTypicalColor;
- (UIColor)bezelHarmoniaTrainingAboveColor;
- (UIColor)bezelHarmoniaTrainingBelowColor;
- (UIColor)bezelHarmoniaTrainingNearColor;
- (UIColor)bezelHarmoniaTrainingWellAboveColor;
- (UIColor)bezelHarmoniaTrainingWellBelowColor;
- (UIColor)bezelHarmoniaUnitLabelColor;
- (UIColor)bezelInactiveMajorTickColor;
- (UIColor)bezelInactiveMedialTickColor;
- (UIColor)bezelInactiveMinorTickColor;
- (UIColor)bezelMajorTickColor;
- (UIColor)bezelMedialTickColor;
- (UIColor)bezelMinorTickColor;
- (UIColor)nightModeStatusBarColor;
- (UIColor)primaryColor;
- (UIColor)primaryComplicationColor;
- (UIColor)secondaryComplicationColor;
- (UIColor)simpleTextComplicationColor;
- (UIColor)timeMinutesColor;
- (UIColor)timeSecondsColor;
- (id)_canonicalMonochromePaletteForBezelStyle:(int64_t)a3;
- (id)_proxyPalette;
- (id)_redColor;
- (id)_whiteColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)isMulticolorF;
- (id)isNightModeF;
- (int64_t)bezelStyle;
- (void)configurationDidChange:(id)a3;
- (void)setBezelStyle:(int64_t)a3;
@end

@implementation NTKFoghornFaceColorPalette

- (BOOL)isEqual:(id)a3
{
  v4 = (NTKFoghornFaceColorPalette *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFoghornFaceColorPalette;
    if ([(NTKFaceColorPalette *)&v15 isEqual:v4])
    {
      v5 = v4;
      int isMulticolor = objc_msgSend_isMulticolor(self, v6, v7, v8);
      BOOL v13 = isMulticolor == objc_msgSend_isMulticolor(v5, v10, v11, v12)
         && (!isMulticolor || v5->_bezelStyle == self->_bezelStyle)
         && v5->_nightMode == self->_nightMode;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFoghornFaceColorPalette;
  id result = [(NTKFaceColorPalette *)&v5 copyWithZone:a3];
  *((void *)result + 14) = self->_bezelStyle;
  *((unsigned char *)result + 104) = self->_nightMode;
  return result;
}

- (id)identifier
{
  cachedIdentifier = self->_cachedIdentifier;
  if (!cachedIdentifier)
  {
    if (objc_msgSend_isMulticolor(self, a2, v2, v3))
    {
      NTKFoghornFaceBezelStyleString(self->_bezelStyle);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = @"monochrome";
    }
    uint64_t v7 = NSString;
    v14.receiver = self;
    v14.super_class = (Class)NTKFoghornFaceColorPalette;
    uint64_t v8 = [(NTKFaceColorPalette *)&v14 identifier];
    objc_msgSend_stringWithFormat_(v7, v9, @"%@-%@-%u", v10, v8, v6, self->_nightMode);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_cachedIdentifier;
    self->_cachedIdentifier = v11;

    cachedIdentifier = self->_cachedIdentifier;
  }

  return cachedIdentifier;
}

- (void)configurationDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKFoghornFaceColorPalette;
  [(NTKFaceColorPalette *)&v5 configurationDidChange:a3];
  cachedIdentifier = self->_cachedIdentifier;
  self->_cachedIdentifier = 0;
}

+ (id)_colorFromColor:(id)a3 alpha:(double)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 >= 0.0 && a4 < 1.0)
  {
    NTKColorByPremultiplyingAlpha();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (id)_colorFromColorSetColor:(id)a3 fallbackRootColor:(id)a4 alpha:(double)a5
{
  id v8 = a3;
  uint64_t v11 = v8;
  if (!v8 || (id)*MEMORY[0x263F578F8] == v8)
  {
    objc_msgSend__colorFromColor_alpha_(a1, v9, (uint64_t)a4, v10, a5);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v8;
  }
  BOOL v13 = v12;

  return v13;
}

- (id)_whiteColor
{
  return (id)objc_msgSend_whiteColor(MEMORY[0x263F825C8], a2, v2, v3);
}

- (id)_redColor
{
  return (id)((uint64_t (*)(void, char *))MEMORY[0x270F9A6D0])(MEMORY[0x263F825C8], sel_redColor);
}

+ (id)_canonicalMonochromePaletteNameForBezelStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"foghorn";
  }
  else {
    return off_2651F69F8[a3];
  }
}

- (id)_canonicalMonochromePaletteForBezelStyle:(int64_t)a3
{
  id v5 = objc_opt_class();
  id v8 = objc_msgSend__canonicalMonochromePaletteNameForBezelStyle_(v5, v6, a3, v7);
  uint64_t v11 = objc_msgSend_pigmentNamed_(MEMORY[0x263F57A50], v9, (uint64_t)v8, v10);
  objc_super v14 = objc_msgSend_copyWithOption_(self, v12, (uint64_t)v11, v13);
  v14[14] = a3;

  return v14;
}

- (id)_proxyPalette
{
  if (objc_msgSend_isMulticolor(self, a2, v2, v3))
  {
    monochromeProxyPalette = self->_monochromeProxyPalette;
    if (!monochromeProxyPalette)
    {
      objc_msgSend__canonicalMonochromePaletteForBezelStyle_(self, v5, self->_bezelStyle, v6);
      id v8 = (NTKFoghornFaceColorPalette *)objc_claimAutoreleasedReturnValue();
      v9 = self->_monochromeProxyPalette;
      self->_monochromeProxyPalette = v8;

      monochromeProxyPalette = self->_monochromeProxyPalette;
    }
    uint64_t v10 = monochromeProxyPalette;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)setBezelStyle:(int64_t)a3
{
  if (self->_bezelStyle != a3)
  {
    self->_bezelStyle = a3;
    monochromeProxyPalette = self->_monochromeProxyPalette;
    self->_monochromeProxyPalette = 0;

    cachedIdentifier = self->_cachedIdentifier;
    self->_cachedIdentifier = 0;
  }
}

- (UIColor)primaryColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_primaryColor(v5, v6, v7, v8);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NTKFoghornFaceColorPalette;
    uint64_t v10 = [(NTKFoghornFaceColorPalette *)&v13 primaryColor];
  }
  uint64_t v11 = (void *)v10;

  return (UIColor *)v11;
}

- (UIColor)bezelMajorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelMajorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelMajorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelMajorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelMedialTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelMedialTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelMedialTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelMedialTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelMinorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelMinorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelMinorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelMinorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelInactiveMajorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelInactiveMajorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelInactiveMajorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelInactiveMajorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 0.4);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelInactiveMedialTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelInactiveMedialTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelInactiveMedialTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelInactiveMedialTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 0.4);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelInactiveMinorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelInactiveMinorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelInactiveMinorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelInactiveMinorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 0.4);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMaxMajorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMaxMajorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMaxMajorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMaxMajorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    if (self->_nightMode) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.45;
    }
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMaxMedialTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMaxMedialTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMaxMedialTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMaxMedialTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    if (self->_nightMode) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.45;
    }
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMaxMinorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMaxMinorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMaxMinorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMaxMinorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    if (self->_nightMode) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.45;
    }
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthLimitMajorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthLimitMajorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthLimitMajorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthLimitMajorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B22390[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthLimitMedialTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthLimitMedialTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthLimitMedialTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthLimitMedialTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B22390[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthLimitMinorTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthLimitMinorTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthLimitMinorTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthLimitMinorTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B22390[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMarkerColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMarkerColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMarker_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMarker(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMaxMarkerColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMaxMarkerColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMaxMarker_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMaxMarker(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    if (self->_nightMode) {
      double v16 = 1.0;
    }
    else {
      double v16 = 0.45;
    }
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthLabelColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthLabelColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthLabel_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthLabel(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthMaxLabelColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthMaxLabelColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthMaxLabel_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthMaxLabel(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B22390[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthLimitLabelColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthLimitLabelColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthLimitLabel_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthLimitLabel(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B223A0[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelDepthDecorationColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelDepthDecorationColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelDepthDecoration_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelDepthDecoration(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = dbl_246B223B0[!self->_nightMode];
    v17 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v17, v18, (uint64_t)v14, (uint64_t)v15, v16);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaUnitLabelColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaUnitLabelColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaUnitLabel_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaUnitLabel(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 0.4);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaEmphasizedTickColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaEmphasizedTickColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaEmphasizedTick_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaEmphasizedTick(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaOvernightTypicalColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaOvernightTypicalColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaOvernightTypical_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaOvernightTypical(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaOvernightPartiallyOutOfRangeColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaOvernightPartiallyOutOfRangeColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaOvernightPartiallyOutOfRange_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaOvernightPartiallyOutOfRange(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaOvernightOutOfRangeColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaOvernightOutOfRangeColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaOvernightOutOfRange_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaOvernightOutOfRange(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaTrainingWellBelowColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaTrainingWellBelowColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaTrainingWellBelow_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaTrainingWellBelow(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaTrainingBelowColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaTrainingBelowColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaTrainingBelow_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaTrainingBelow(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaTrainingNearColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaTrainingNearColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaTrainingNear_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaTrainingNear(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaTrainingAboveColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaTrainingAboveColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaTrainingAbove_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaTrainingAbove(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)bezelHarmoniaTrainingWellAboveColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_bezelHarmoniaTrainingWellAboveColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_bezelHarmoniaTrainingWellAbove_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_bezelHarmoniaTrainingWellAbove(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)timeMinutesColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_timeMinutesColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_timeMinutes_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_timeMinutes(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)timeSecondsColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_timeSecondsColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_timeSeconds_night(self, v6, v7, v8);
    }
    else {
    objc_super v14 = objc_msgSend_timeSeconds(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 0.6);
  }

  return (UIColor *)v10;
}

- (UIColor)nightModeStatusBarColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_nightModeStatusBarColor(v5, v6, v7, v8);
  }
  else
  {
    uint64_t v11 = objc_msgSend_statusBar_night(self, v6, v7, v8);
    objc_super v15 = objc_msgSend__redColor(self, v12, v13, v14);
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v11, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)simpleTextComplicationColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_simpleTextComplicationColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_simpleTextComplication_night(self, v6, v7, v8);
    }
    else {
    uint64_t v14 = objc_msgSend_simpleTextComplication(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)primaryComplicationColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_primaryComplicationColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_primaryComplication_night(self, v6, v7, v8);
    }
    else {
    uint64_t v14 = objc_msgSend_primaryComplication(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend__whiteColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (UIColor)secondaryComplicationColor
{
  id v5 = objc_msgSend__proxyPalette(self, a2, v2, v3);
  v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_secondaryComplicationColor(v5, v6, v7, v8);
  }
  else
  {
    if (self->_nightMode) {
      objc_msgSend_secondaryComplication_night(self, v6, v7, v8);
    }
    else {
    uint64_t v14 = objc_msgSend_secondaryComplication(self, v6, v7, v8);
    }
    if (self->_nightMode) {
      objc_msgSend__redColor(self, v11, v12, v13);
    }
    else {
    objc_super v15 = objc_msgSend_primaryColor(self, v11, v12, v13);
    }
    double v16 = objc_opt_class();
    uint64_t v10 = objc_msgSend__colorFromColorSetColor_fallbackRootColor_alpha_(v16, v17, (uint64_t)v14, (uint64_t)v15, 1.0);
  }

  return (UIColor *)v10;
}

- (id)isMulticolorF
{
  if (objc_msgSend_isMulticolor(self, a2, v2, v3)) {
    v4 = &unk_26FB121C8;
  }
  else {
    v4 = &unk_26FB121D8;
  }

  return v4;
}

- (id)isNightModeF
{
  if (self->_nightMode) {
    return &unk_26FB121C8;
  }
  else {
    return &unk_26FB121D8;
  }
}

- (NTKFoghornFaceColorPalette)nightModeColorPalette
{
  v4 = (unsigned char *)objc_msgSend_copy(self, a2, v2, v3);
  v4[104] = 1;

  return (NTKFoghornFaceColorPalette *)v4;
}

- (BOOL)isNightMode
{
  return self->_nightMode;
}

- (int64_t)bezelStyle
{
  return self->_bezelStyle;
}

- (UIColor)bezelDepthMaxMedialTick
{
  return self->_bezelDepthMaxMedialTick;
}

- (UIColor)bezelDepthMaxMinorTick
{
  return self->_bezelDepthMaxMinorTick;
}

- (UIColor)bezelDepthLimitMedialTick
{
  return self->_bezelDepthLimitMedialTick;
}

- (UIColor)bezelDepthLimitMinorTick
{
  return self->_bezelDepthLimitMinorTick;
}

- (UIColor)bezelDepthMaxMedialTick_night
{
  return self->_bezelDepthMaxMedialTick_night;
}

- (UIColor)bezelDepthMaxMinorTick_night
{
  return self->_bezelDepthMaxMinorTick_night;
}

- (UIColor)bezelDepthLimitMedialTick_night
{
  return self->_bezelDepthLimitMedialTick_night;
}

- (UIColor)bezelDepthLimitMinorTick_night
{
  return self->_bezelDepthLimitMinorTick_night;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelDepthLimitMinorTick_night, 0);
  objc_storeStrong((id *)&self->_bezelDepthLimitMedialTick_night, 0);
  objc_storeStrong((id *)&self->_bezelDepthMaxMinorTick_night, 0);
  objc_storeStrong((id *)&self->_bezelDepthMaxMedialTick_night, 0);
  objc_storeStrong((id *)&self->_bezelDepthLimitMinorTick, 0);
  objc_storeStrong((id *)&self->_bezelDepthLimitMedialTick, 0);
  objc_storeStrong((id *)&self->_bezelDepthMaxMinorTick, 0);
  objc_storeStrong((id *)&self->_bezelDepthMaxMedialTick, 0);
  objc_storeStrong((id *)&self->_cachedIdentifier, 0);

  objc_storeStrong((id *)&self->_monochromeProxyPalette, 0);
}

@end