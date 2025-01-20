@interface IATextInputActionsInputMode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (IATextInputActionsInputMode)initWithCoder:(id)a3;
- (IATextInputActionsInputMode)initWithLanguage:(id)a3 region:(id)a4 keyboardVariant:(id)a5 keyboardLayout:(id)a6 keyboardType:(id)a7 inputModeIdentifier:(id)a8;
- (NSString)inputModeIdentifier;
- (NSString)keyboardLayout;
- (NSString)keyboardType;
- (NSString)keyboardVariant;
- (NSString)language;
- (NSString)region;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inputModeUniqueString;
- (void)encodeWithCoder:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setKeyboardType:(id)a3;
- (void)setKeyboardVariant:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation IATextInputActionsInputMode

- (IATextInputActionsInputMode)initWithLanguage:(id)a3 region:(id)a4 keyboardVariant:(id)a5 keyboardLayout:(id)a6 keyboardType:(id)a7 inputModeIdentifier:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)IATextInputActionsInputMode;
  v20 = [(IATextInputActionsInputMode *)&v35 init];
  v23 = v20;
  if (v20)
  {
    objc_msgSend_setLanguage_(v20, v21, (uint64_t)v14, v22);
    objc_msgSend_setRegion_(v23, v24, (uint64_t)v15, v25);
    objc_msgSend_setKeyboardVariant_(v23, v26, (uint64_t)v16, v27);
    objc_msgSend_setKeyboardLayout_(v23, v28, (uint64_t)v17, v29);
    objc_msgSend_setKeyboardType_(v23, v30, (uint64_t)v18, v31);
    objc_msgSend_setInputModeIdentifier_(v23, v32, (uint64_t)v19, v33);
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(IATextInputActionsInputMode);
  v8 = objc_msgSend_language(self, v5, v6, v7);
  objc_msgSend_setLanguage_(v4, v9, (uint64_t)v8, v10);

  id v14 = objc_msgSend_region(self, v11, v12, v13);
  objc_msgSend_setRegion_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_keyboardVariant(self, v17, v18, v19);
  objc_msgSend_setKeyboardVariant_(v4, v21, (uint64_t)v20, v22);

  v26 = objc_msgSend_keyboardLayout(self, v23, v24, v25);
  objc_msgSend_setKeyboardLayout_(v4, v27, (uint64_t)v26, v28);

  v32 = objc_msgSend_keyboardType(self, v29, v30, v31);
  objc_msgSend_setKeyboardType_(v4, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_inputModeIdentifier(self, v35, v36, v37);
  objc_msgSend_setInputModeIdentifier_(v4, v39, (uint64_t)v38, v40);

  return v4;
}

- (id)inputModeUniqueString
{
  v44 = NSString;
  uint64_t v5 = objc_msgSend_language(self, a2, v2, v3);
  v9 = (void *)v5;
  if (v5) {
    uint64_t v10 = (__CFString *)v5;
  }
  else {
    uint64_t v10 = @"None";
  }
  v43 = v10;
  uint64_t v11 = objc_msgSend_region(self, v6, v7, v8);
  id v15 = (void *)v11;
  if (v11) {
    uint64_t v16 = (__CFString *)v11;
  }
  else {
    uint64_t v16 = @"None";
  }
  v42 = v16;
  uint64_t v17 = objc_msgSend_keyboardVariant(self, v12, v13, v14);
  v21 = (void *)v17;
  if (v17) {
    uint64_t v22 = (__CFString *)v17;
  }
  else {
    uint64_t v22 = @"None";
  }
  uint64_t v23 = objc_msgSend_keyboardLayout(self, v18, v19, v20);
  uint64_t v27 = (void *)v23;
  if (v23) {
    uint64_t v28 = (__CFString *)v23;
  }
  else {
    uint64_t v28 = @"None";
  }
  uint64_t v29 = objc_msgSend_keyboardType(self, v24, v25, v26);
  uint64_t v33 = (void *)v29;
  if (v29) {
    uint64_t v34 = (__CFString *)v29;
  }
  else {
    uint64_t v34 = @"None";
  }
  uint64_t v35 = objc_msgSend_inputModeIdentifier(self, v30, v31, v32);
  v38 = (void *)v35;
  if (v35) {
    v39 = (__CFString *)v35;
  }
  else {
    v39 = @"None";
  }
  uint64_t v40 = objc_msgSend_stringWithFormat_(v44, v36, @"%@%@%@%@%@%@%@%@%@%@%@", v37, v43, @"≡", v42, @"≡", v22, @"≡", v28, @"≡", v34, @"≡", v39);

  return v40;
}

- (BOOL)isEmpty
{
  uint64_t v8 = objc_msgSend_language(self, a2, v2, v3);
  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend_region(self, v5, v6, v7);
    if (v13)
    {
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v17 = objc_msgSend_keyboardVariant(self, v10, v11, v12);
      if (v17)
      {
        BOOL v9 = 0;
      }
      else
      {
        v21 = objc_msgSend_keyboardLayout(self, v14, v15, v16);
        if (v21)
        {
          BOOL v9 = 0;
        }
        else
        {
          uint64_t v25 = objc_msgSend_keyboardType(self, v18, v19, v20);
          if (v25)
          {
            BOOL v9 = 0;
          }
          else
          {
            uint64_t v26 = objc_msgSend_inputModeIdentifier(self, v22, v23, v24);
            BOOL v9 = v26 == 0;
          }
        }
      }
    }
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char isEqualToString = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      id v7 = v4;
      uint64_t v11 = objc_msgSend_inputModeUniqueString(self, v8, v9, v10);
      uint64_t v15 = objc_msgSend_inputModeUniqueString(v7, v12, v13, v14);

      char isEqualToString = objc_msgSend_isEqualToString_(v11, v16, (uint64_t)v15, v17);
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (IATextInputActionsInputMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IATextInputActionsInputMode;
  uint64_t v5 = [(IATextInputActionsInputMode *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"language");
    language = v5->_language;
    v5->_language = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"region");
    region = v5->_region;
    v5->_region = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"keyboardVariant");
    keyboardVariant = v5->_keyboardVariant;
    v5->_keyboardVariant = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"keyboardLayout");
    keyboardLayout = v5->_keyboardLayout;
    v5->_keyboardLayout = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"keyboardType");
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"inputModeIdentifier");
    inputModeIdentifier = v5->_inputModeIdentifier;
    v5->_inputModeIdentifier = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  language = self->_language;
  id v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)language, @"language");
  objc_msgSend_encodeObject_forKey_(v11, v6, (uint64_t)self->_region, @"region");
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_keyboardVariant, @"keyboardVariant");
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_keyboardLayout, @"keyboardLayout");
  objc_msgSend_encodeObject_forKey_(v11, v9, (uint64_t)self->_keyboardType, @"keyboardType");
  objc_msgSend_encodeObject_forKey_(v11, v10, (uint64_t)self->_inputModeIdentifier, @"inputModeIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (void)setKeyboardVariant:(id)a3
{
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end