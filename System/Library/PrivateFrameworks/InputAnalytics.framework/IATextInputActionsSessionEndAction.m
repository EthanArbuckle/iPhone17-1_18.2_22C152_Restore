@interface IATextInputActionsSessionEndAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionEndAction)initWithCoder:(id)a3;
- (NSDictionary)keyboardTrialParameters;
- (id)description;
- (int64_t)inputActionCount;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyboardTrialParameters:(id)a3;
@end

@implementation IATextInputActionsSessionEndAction

- (int64_t)inputActionCount
{
  return 0;
}

- (id)description
{
  v27.receiver = self;
  v27.super_class = (Class)IATextInputActionsSessionEndAction;
  v3 = [(IATextInputActionsSessionAction *)&v27 description];
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  v11 = objc_msgSend_keyboardTrialParameters(self, v8, v9, v10);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = sub_252A08920;
  v25 = &unk_265387E78;
  id v26 = v7;
  id v12 = v7;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v11, v13, (uint64_t)&v22, v14);

  v17 = objc_msgSend_componentsJoinedByString_(v12, v15, @", ", v16);
  v20 = objc_msgSend_stringByAppendingFormat_(v3, v18, @", %@", v19, v17, v22, v23, v24, v25);

  return v20;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

- (IATextInputActionsSessionEndAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IATextInputActionsSessionEndAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v8, v6, v7, @"keyboardTrialParameters");
    keyboardTrialParameters = v5->_keyboardTrialParameters;
    v5->_keyboardTrialParameters = (NSDictionary *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IATextInputActionsSessionEndAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v6 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_keyboardTrialParameters, @"keyboardTrialParameters", v6.receiver, v6.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end