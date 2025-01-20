@interface PCNativeButtonStyle
+ (BOOL)supportsSecureCoding;
- (PCNativeBorderStyle)borderStyle;
- (PCNativeButtonStyle)initWithCoder:(id)a3;
- (PCNativeColor)color;
- (PCNativeColor)disabledColor;
- (PCNativeColor)highlightColor;
- (PCNativeColor)textColor;
- (double)cornerRadius;
- (void)encodeWithCoder:(id)a3;
- (void)setBorderStyle:(id)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisabledColor:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PCNativeButtonStyle

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeButtonStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"color", v14, v15, v16);
    v18 = *(void **)(v11 + 8);
    *(void *)(v11 + 8) = v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"highlightColor", v21, v22, v23);
    v25 = *(void **)(v11 + 16);
    *(void *)(v11 + 16) = v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"disabledColor", v28, v29, v30);
    v32 = *(void **)(v11 + 24);
    *(void *)(v11 + 24) = v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"textColor", v35, v36, v37);
    v39 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = v38;

    objc_msgSend_decodeDoubleForKey_(v4, v40, @"cornerRadius", v41, v42, v43, v44);
    *(void *)(v11 + 40) = v45;
    uint64_t v46 = objc_opt_class();
    uint64_t v51 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"borderStyle", v48, v49, v50);
    v52 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = v51;
  }
  return (PCNativeButtonStyle *)v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_color(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"color", v13, v14, v15);

  double v22 = objc_msgSend_highlightColor(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"highlightColor", v24, v25, v26);

  uint64_t v33 = objc_msgSend_disabledColor(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"disabledColor", v35, v36, v37);

  double v44 = objc_msgSend_textColor(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"textColor", v46, v47, v48);

  objc_msgSend_cornerRadius(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeDouble_forKey_(v4, v55, @"cornerRadius", v56, v57, v58, v59);
  objc_msgSend_borderStyle(self, v60, v61, v62, v63, v64, v65);
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v66, (uint64_t)v70, @"borderStyle", v67, v68, v69);
}

- (PCNativeColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (PCNativeColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (PCNativeColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
}

- (PCNativeColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
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

- (PCNativeBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderStyle, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end