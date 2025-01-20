@interface PCNativeStyle
+ (BOOL)supportsSecureCoding;
- (PCNativeBorderStyle)borderStyle;
- (PCNativeButtonStyle)buttonStyle;
- (PCNativeColor)backgroundColor;
- (PCNativeColor)textColor;
- (PCNativeShadowStyle)shadowStyle;
- (PCNativeStyle)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderStyle:(id)a3;
- (void)setButtonStyle:(id)a3;
- (void)setShadowStyle:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PCNativeStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11 = (PCNativeStyle *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"backgroundColor", v14, v15, v16);
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (PCNativeColor *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"borderStyle", v21, v22, v23);
    borderStyle = v11->_borderStyle;
    v11->_borderStyle = (PCNativeBorderStyle *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"buttonStyle", v28, v29, v30);
    buttonStyle = v11->_buttonStyle;
    v11->_buttonStyle = (PCNativeButtonStyle *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"shadowStyle", v35, v36, v37);
    shadowStyle = v11->_shadowStyle;
    v11->_shadowStyle = (PCNativeShadowStyle *)v38;

    uint64_t v40 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v41, v40, @"textColor", v42, v43, v44);
    textColor = v11->_textColor;
    v11->_textColor = (PCNativeColor *)v45;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11 = objc_msgSend_backgroundColor(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"backgroundColor", v13, v14, v15);

  double v22 = objc_msgSend_borderStyle(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"borderStyle", v24, v25, v26);

  uint64_t v33 = objc_msgSend_buttonStyle(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"buttonStyle", v35, v36, v37);

  double v44 = objc_msgSend_shadowStyle(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"shadowStyle", v46, v47, v48);

  objc_msgSend_textColor(self, v49, v50, v51, v52, v53, v54);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v55, (uint64_t)v59, @"textColor", v56, v57, v58);
}

- (PCNativeColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (PCNativeBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
}

- (PCNativeButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
}

- (PCNativeShadowStyle)shadowStyle
{
  return self->_shadowStyle;
}

- (void)setShadowStyle:(id)a3
{
}

- (PCNativeColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowStyle, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end