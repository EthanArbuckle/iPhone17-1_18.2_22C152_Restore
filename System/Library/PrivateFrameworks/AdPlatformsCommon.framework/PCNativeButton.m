@interface PCNativeButton
+ (BOOL)supportsSecureCoding;
- (NSString)accessibleText;
- (NSString)text;
- (PCNativeButton)init;
- (PCNativeButton)initWithCoder:(id)a3;
- (PCNativeButtonStyle)style;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibleText:(id)a3;
- (void)setStyle:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PCNativeButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeButton)init
{
  v3.receiver = self;
  v3.super_class = (Class)PCNativeButton;
  result = [(PCNativeButton *)&v3 init];
  if (result) {
    result->_type = -1;
  }
  return result;
}

- (PCNativeButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v14 = (PCNativeButton *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v14)
  {
    v14->_type = (int)objc_msgSend_decodeInt32ForKey_(v4, v11, @"type", v12, v13, v15, v16);
    uint64_t v17 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"text", v19, v20, v21);
    text = v14->_text;
    v14->_text = (NSString *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"accessibleText", v26, v27, v28);
    accessibleText = v14->_accessibleText;
    v14->_accessibleText = (NSString *)v29;

    uint64_t v31 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, @"style", v33, v34, v35);
    style = v14->_style;
    v14->_style = (PCNativeButtonStyle *)v36;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_type(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeInt32_forKey_(v4, v12, v11, @"type", v13, v14, v15);
  uint64_t v22 = objc_msgSend_text(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"text", v24, v25, v26);

  uint64_t v33 = objc_msgSend_accessibleText(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"accessibleText", v35, v36, v37);

  objc_msgSend_style(self, v38, v39, v40, v41, v42, v43);
  id v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v44, (uint64_t)v48, @"style", v45, v46, v47);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)accessibleText
{
  return self->_accessibleText;
}

- (void)setAccessibleText:(id)a3
{
}

- (PCNativeButtonStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_accessibleText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end