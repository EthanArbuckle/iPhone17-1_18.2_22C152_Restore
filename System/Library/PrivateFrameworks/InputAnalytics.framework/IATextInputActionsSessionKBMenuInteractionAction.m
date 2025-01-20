@interface IATextInputActionsSessionKBMenuInteractionAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionKBMenuInteractionAction)initWithCoder:(id)a3;
- (NSString)updatedInputMode;
- (int64_t)inputActionCount;
- (unint64_t)KBMenuInteractionSource;
- (unint64_t)KBMenuSelectedAction;
- (void)encodeWithCoder:(id)a3;
- (void)setKBMenuInteractionSource:(unint64_t)a3;
- (void)setKBMenuSelectedAction:(unint64_t)a3;
- (void)setUpdatedInputMode:(id)a3;
@end

@implementation IATextInputActionsSessionKBMenuInteractionAction

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)KBMenuInteractionSource
{
  return self->_KBMenuInteractionSource;
}

- (void)setKBMenuInteractionSource:(unint64_t)a3
{
  self->_KBMenuInteractionSource = a3;
}

- (unint64_t)KBMenuSelectedAction
{
  return self->_KBMenuSelectedAction;
}

- (void)setKBMenuSelectedAction:(unint64_t)a3
{
  self->_KBMenuSelectedAction = a3;
}

- (NSString)updatedInputMode
{
  return self->_updatedInputMode;
}

- (void)setUpdatedInputMode:(id)a3
{
}

- (void).cxx_destruct
{
}

- (IATextInputActionsSessionKBMenuInteractionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IATextInputActionsSessionKBMenuInteractionAction;
  v5 = [(IATextInputActionsSessionAction *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"KBMenuInteractionSource");
    v5->_KBMenuInteractionSource = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"KBMenuSelectedAction");
    v5->_KBMenuSelectedAction = objc_msgSend_unsignedLongValue(v14, v15, v16, v17);

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"updatedInputMode");
    updatedInputMode = v5->_updatedInputMode;
    v5->_updatedInputMode = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)IATextInputActionsSessionKBMenuInteractionAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v14 encodeWithCoder:v4];
  v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_KBMenuInteractionSource, v6, v14.receiver, v14.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"KBMenuInteractionSource");

  uint64_t v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, self->_KBMenuSelectedAction, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"KBMenuSelectedAction");

  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)self->_updatedInputMode, @"updatedInputMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end