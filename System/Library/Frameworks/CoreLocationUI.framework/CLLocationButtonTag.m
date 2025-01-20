@interface CLLocationButtonTag
+ (BOOL)supportsSecureCoding;
+ (unint64_t)cacheLimit;
+ (unsigned)secureNameForLabel:(int64_t)a3;
- (BOOL)contrastValidForBgColorAndFgTextWithCumulativeOpacity:(float)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)renderedSuccessfully;
- (CGRect)frame;
- (CLLocationButtonTag)initWithCoder:(id)a3;
- (CLLocationButtonTag)initWithLabel:(int64_t)a3 iconType:(int64_t)a4 backgroundColor:(id)a5 tintColor:(id)a6 cornerRadius:(double)a7 frame:(CGRect)a8 fontSize:(double)a9;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (UISSlotStyle)style;
- (double)buttonHeight;
- (double)buttonWidth;
- (double)cornerRadius;
- (double)fontSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resolvedStyleForStyle:(id)a3;
- (int64_t)icon;
- (int64_t)label;
- (unint64_t)authenticationMessageContextForStyle:(id)a3;
- (unint64_t)failGradeForStyle:(id)a3;
- (unint64_t)hitTestInformationMaskForStyle:(id)a3;
- (unsigned)secureNameForStyle:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIcon:(int64_t)a3;
- (void)setLabel:(int64_t)a3;
- (void)setRenderedSuccessfully:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation CLLocationButtonTag

- (double)buttonWidth
{
  objc_msgSend_frame(self, a2, v2, v3);
  return v4;
}

- (double)buttonHeight
{
  objc_msgSend_frame(self, a2, v2, v3);
  return v4;
}

- (CLLocationButtonTag)initWithLabel:(int64_t)a3 iconType:(int64_t)a4 backgroundColor:(id)a5 tintColor:(id)a6 cornerRadius:(double)a7 frame:(CGRect)a8 fontSize:(double)a9
{
  double height = a8.size.height;
  double width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  id v19 = a5;
  id v20 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CLLocationButtonTag;
  v21 = [(CLLocationButtonTag *)&v51 init];
  v25 = v21;
  if (v21)
  {
    objc_msgSend_setLabel_(v21, v22, v23, v24, a3);
    objc_msgSend_setIcon_(v25, v26, v27, v28, a4);
    objc_msgSend_setBackgroundColor_(v25, v29, v30, v31, v19);
    objc_msgSend_setTintColor_(v25, v32, v33, v34, v20);
    v35.n128_f64[0] = a7;
    objc_msgSend_setCornerRadius_(v25, v36, v35, v37);
    v38.n128_f64[0] = x;
    v39.n128_f64[0] = y;
    objc_msgSend_setFrame_(v25, v40, v38, v39, width, height);
    v41.n128_f64[0] = a9;
    objc_msgSend_setFontSize_(v25, v42, v41, v43);
    objc_msgSend_fontSize(v25, v44, v45, v46);
    v49.n128_u64[0] = 12.0;
    if (v48.n128_f64[0] < 12.0)
    {
      v48.n128_u64[0] = 18.0;
      objc_msgSend_setFontSize_(v25, v47, v48, v49);
    }
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    uint64_t v8 = objc_msgSend_label(self, v4, v6, v7);
    objc_msgSend_setLabel_(v5, v9, v10, v11, v8);
    uint64_t v15 = objc_msgSend_icon(self, v12, v13, v14);
    objc_msgSend_setIcon_(v5, v16, v17, v18, v15);
    v22 = objc_msgSend_backgroundColor(self, v19, v20, v21);
    objc_msgSend_setBackgroundColor_(v5, v23, v24, v25, v22);

    v29 = objc_msgSend_tintColor(self, v26, v27, v28);
    objc_msgSend_setTintColor_(v5, v30, v31, v32, v29);

    objc_msgSend_cornerRadius(self, v33, v34, v35);
    objc_msgSend_setCornerRadius_(v5, v36, v37, v38);
    objc_msgSend_frame(self, v39, v40, v41);
    objc_msgSend_setFrame_(v5, v42, v43, v44);
    __n128 v48 = objc_msgSend_style(self, v45, v46, v47);
    objc_msgSend_setStyle_(v5, v49, v50, v51, v48);

    uint64_t v55 = objc_msgSend_renderedSuccessfully(self, v52, v53, v54);
    objc_msgSend_setRenderedSuccessfully_(v5, v56, v57, v58, v55);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t label_low = LODWORD(self->_label);
  id v26 = a3;
  objc_msgSend_encodeInt_forKey_(v26, v5, v6, v7, label_low, @"kCLLocationButtonLabel");
  objc_msgSend_encodeInt_forKey_(v26, v8, v9, v10, LODWORD(self->_icon), @"kCLLocationButtonIcon");
  objc_msgSend_encodeObject_forKey_(v26, v11, v12, v13, self->_backgroundColor, @"kCLLocationButtonBackgroundColor");
  objc_msgSend_encodeObject_forKey_(v26, v14, v15, v16, self->_tintColor, @"kCLLocationButtonTintColor");
  v17.n128_u64[0] = *(void *)&self->_cornerRadius;
  v17.n128_f32[0] = v17.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v26, v18, v17, v19, @"kCLLocationButtonCornerRadius");
  v20.n128_u64[0] = *(void *)&self->_frame.origin.x;
  v21.n128_u64[0] = *(void *)&self->_frame.origin.y;
  objc_msgSend_encodeCGRect_forKey_(v26, v22, v20, v21, @"kCLLocationButtonFrame", self->_frame.size.width, self->_frame.size.height);
  v23.n128_u64[0] = *(void *)&self->_fontSize;
  v23.n128_f32[0] = v23.n128_f64[0];
  objc_msgSend_encodeFloat_forKey_(v26, v24, v23, v25, @"kCLLocationButtonFontSize");
}

- (CLLocationButtonTag)initWithCoder:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_decodeIntForKey_(v4, v5, v6, v7, @"kCLLocationButtonLabel");
  int v12 = objc_msgSend_decodeIntForKey_(v4, v9, v10, v11, @"kCLLocationButtonIcon");
  uint64_t v13 = objc_opt_class();
  __n128 v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v15, v16, v13, @"kCLLocationButtonBackgroundColor");
  uint64_t v18 = objc_opt_class();
  v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v20, v21, v18, @"kCLLocationButtonTintColor");
  objc_msgSend_decodeFloatForKey_(v4, v23, v24, v25, @"kCLLocationButtonCornerRadius");
  float v27 = v26.n128_f32[0];
  double v28 = v26.n128_f32[0];
  objc_msgSend_decodeCGRectForKey_(v4, v29, v26, v30, @"kCLLocationButtonFrame");
  unint64_t v32 = v31.n128_u64[0];
  double v34 = v33.n128_f64[0];
  double v36 = v35;
  double v38 = v37;
  objc_msgSend_decodeFloatForKey_(v4, v39, v31, v33, @"kCLLocationButtonFontSize");
  float v41 = v40;

  if (v36 >= v38) {
    double v45 = v38;
  }
  else {
    double v45 = v36;
  }
  v43.n128_f64[0] = v45 * 0.5;
  if (v43.n128_f64[0] >= v28)
  {
    v43.n128_u64[0] = 0;
    if (v27 >= 0.0) {
      v43.n128_f64[0] = v28;
    }
  }
  v44.n128_u64[0] = v32;
  __n128 v46 = (CLLocationButtonTag *)objc_msgSend_initWithLabel_iconType_backgroundColor_tintColor_cornerRadius_frame_fontSize_(self, v42, v43, v44, v8, v12, v17, v22, v34, v36, v38, v41);

  return v46;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

+ (unint64_t)cacheLimit
{
  return 0;
}

- (BOOL)isValid
{
  uint64_t v4 = objc_msgSend_label(self, a2, v2, v3);
  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v5, v6, v7, v4) - 0x20000 < 5;
}

- (unint64_t)authenticationMessageContextForStyle:(id)a3
{
  return 0x9FB774E4B8F165C9;
}

- (unint64_t)failGradeForStyle:(id)a3
{
  return -1;
}

- (unint64_t)hitTestInformationMaskForStyle:(id)a3
{
  return 15;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v5 = objc_msgSend_copyWithChangeBlock_(a3, a2, v3, v4, &unk_26F0BB1E0);

  return v5;
}

- (BOOL)contrastValidForBgColorAndFgTextWithCumulativeOpacity:(float)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  double v61 = 0.0;
  __n128 v6 = objc_msgSend_tintColor(self, a2, *(__n128 *)&a3, v3);
  objc_msgSend_getRed_green_blue_alpha_(v6, v7, v8, v9, 0, 0, 0, &v61);

  double v10 = a3;
  v11.n128_f64[0] = v61 * a3;
  float v12 = v11.n128_f64[0];
  __n128 v15 = objc_msgSend_tintColor(self, v13, v11, v14);
  __n128 v19 = objc_msgSend_whiteColor(MEMORY[0x263F1C548], v16, v17, v18);
  double v20 = v12;
  double v21 = sub_23CB166B0(v15, v19, v12);

  __n128 v25 = objc_msgSend_tintColor(self, v22, v23, v24);
  v29 = objc_msgSend_blackColor(MEMORY[0x263F1C548], v26, v27, v28);
  double v30 = sub_23CB166B0(v25, v29, v20);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    double v63 = v10;
    __int16 v64 = 2048;
    double v65 = v61;
    __int16 v66 = 2048;
    double v67 = v20;
    __int16 v68 = 2048;
    double v69 = v21;
    __int16 v70 = 2048;
    double v71 = v30;
    _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton contrastRatio tintColor-details , cumulativeOpacity: %f tintColorAlpha: %f tintColorEffectiveOpacity: %f fgLuminanceAgainstWhite: %f fgLuminanceAgainstBlack: %f", buf, 0x34u);
  }
  double v34 = objc_msgSend_backgroundColor(self, v31, v32, v33, 0);
  objc_msgSend_getRed_green_blue_alpha_(v34, v35, v36, v37, 0, 0, 0, &v60);

  v38.n128_f64[0] = v60 * v10;
  float v39 = v60 * v10;
  v42 = objc_msgSend_backgroundColor(self, v40, v38, v41);
  __n128 v46 = objc_msgSend_whiteColor(MEMORY[0x263F1C548], v43, v44, v45);
  double v47 = v39;
  double v48 = sub_23CB166B0(v42, v46, v39);

  v52 = objc_msgSend_backgroundColor(self, v49, v50, v51);
  v56 = objc_msgSend_blackColor(MEMORY[0x263F1C548], v53, v54, v55);
  double v57 = sub_23CB166B0(v52, v56, v47);

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    double v63 = v10;
    __int16 v64 = 2048;
    double v65 = v60;
    __int16 v66 = 2048;
    double v67 = v47;
    __int16 v68 = 2048;
    double v69 = v48;
    __int16 v70 = 2048;
    double v71 = v57;
    _os_log_debug_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "#locationButton contrastRatio backgroundColor-details , cumulativeOpacity: %f bgColorAlpha: %f bgColorEffectiveOpacity: %f bgLuminanceAgainstWhite: %f bgLuminanceAgainstBlack: %f", buf, 0x34u);
  }
  if ((v30 + 0.05) / (v48 + 0.05) >= 1.5 || (v57 + 0.05) / (v21 + 0.05) >= 1.5)
  {
    LOBYTE(v58) = 1;
  }
  else
  {
    BOOL v58 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v58)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_23CB13000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: #locationButton failed due to insufficient contrastRatio between tintColor and backgroundColor", buf, 2u);
      LOBYTE(v58) = 0;
    }
  }
  return v58;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)secureNameForStyle:(id)a3
{
  uint64_t v6 = objc_msgSend_label(self, a2, v3, v4, a3);

  return objc_msgSend_secureNameForLabel_(CLLocationButtonTag, v5, v7, v8, v6);
}

+ (unsigned)secureNameForLabel:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 4) {
    return 0x20000;
  }
  else {
    return a3 + 0x1FFFF;
  }
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (int64_t)icon
{
  return self->_icon;
}

- (void)setIcon:(int64_t)a3
{
  self->_icon = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (BOOL)renderedSuccessfully
{
  return self->_renderedSuccessfully;
}

- (void)setRenderedSuccessfully:(BOOL)a3
{
  self->_renderedSuccessfulldouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end