@interface PCNativeLocalizedHeadline
+ (BOOL)supportsSecureCoding;
- (NSString)languageIdentifier;
- (NSString)value;
- (PCNativeLocalizedHeadline)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PCNativeLocalizedHeadline

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeLocalizedHeadline)initWithCoder:(id)a3
{
  id v4 = a3;
  v11 = (PCNativeLocalizedHeadline *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"languageIdentifier", v14, v15, v16);
    languageIdentifier = v11->_languageIdentifier;
    v11->_languageIdentifier = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"value", v21, v22, v23);
    value = v11->_value;
    v11->_value = (NSString *)v24;
  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11 = objc_msgSend_languageIdentifier(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"languageIdentifier", v13, v14, v15);

  objc_msgSend_value(self, v16, v17, v18, v19, v20, v21);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v26, @"value", v23, v24, v25);
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
}

@end