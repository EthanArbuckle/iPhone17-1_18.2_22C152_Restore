@interface IATextInputActionsSessionKBMenuAppearAction
+ (BOOL)supportsSecureCoding;
- (IATextInputActionsSessionKBMenuAppearAction)initWithCoder:(id)a3;
- (NSString)originalInputMode;
- (int64_t)inputActionCount;
- (unint64_t)glomojiType;
- (void)encodeWithCoder:(id)a3;
- (void)setGlomojiType:(unint64_t)a3;
- (void)setOriginalInputMode:(id)a3;
@end

@implementation IATextInputActionsSessionKBMenuAppearAction

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)glomojiType
{
  return self->_glomojiType;
}

- (void)setGlomojiType:(unint64_t)a3
{
  self->_glomojiType = a3;
}

- (NSString)originalInputMode
{
  return self->_originalInputMode;
}

- (void)setOriginalInputMode:(id)a3
{
}

- (void).cxx_destruct
{
}

- (IATextInputActionsSessionKBMenuAppearAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IATextInputActionsSessionKBMenuAppearAction;
  v5 = [(IATextInputActionsSessionAction *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"glomojiType");
    v5->_glomojiType = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"originalInputMode");
    originalInputMode = v5->_originalInputMode;
    v5->_originalInputMode = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IATextInputActionsSessionKBMenuAppearAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v10 encodeWithCoder:v4];
  v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_glomojiType, v6, v10.receiver, v10.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"glomojiType");

  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_originalInputMode, @"originalInputMode");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end