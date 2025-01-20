@interface IATextInputActionsSessionKBMenuDismissAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionKBMenuDismissAction)initWithCoder:(id)a3;
- (int64_t)inputActionCount;
- (unint64_t)KBMenuDismissSource;
- (void)encodeWithCoder:(id)a3;
- (void)setKBMenuDismissSource:(unint64_t)a3;
@end

@implementation IATextInputActionsSessionKBMenuDismissAction

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)KBMenuDismissSource
{
  return self->_KBMenuDismissSource;
}

- (void)setKBMenuDismissSource:(unint64_t)a3
{
  self->_KBMenuDismissSource = a3;
}

- (IATextInputActionsSessionKBMenuDismissAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IATextInputActionsSessionKBMenuDismissAction;
  v5 = [(IATextInputActionsSessionAction *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"KBMenuDismissSource");
    v5->_KBMenuDismissSource = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IATextInputActionsSessionKBMenuDismissAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v9 encodeWithCoder:v4];
  v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_KBMenuDismissSource, v6, v9.receiver, v9.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"KBMenuDismissSource");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end