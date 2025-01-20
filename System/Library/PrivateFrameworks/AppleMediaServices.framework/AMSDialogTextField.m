@interface AMSDialogTextField
+ (BOOL)supportsSecureCoding;
+ (id)textFieldWithPlaceholder:(id)a3 secure:(BOOL)a4;
- (AMSDialogTextField)initWithCoder:(id)a3;
- (BOOL)secure;
- (NSString)placeholder;
- (NSString)text;
- (int64_t)keyboardType;
- (int64_t)tag;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setPlaceholder:(id)a3;
- (void)setSecure:(BOOL)a3;
- (void)setTag:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation AMSDialogTextField

+ (id)textFieldWithPlaceholder:(id)a3 secure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)a1);
  [v7 setPlaceholder:v6];

  [v7 setSecure:v4];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeInteger:forKey:", -[AMSDialogTextField keyboardType](self, "keyboardType"), @"kCodingKeyKeyboardType");
  BOOL v4 = [(AMSDialogTextField *)self placeholder];

  if (v4)
  {
    v5 = [(AMSDialogTextField *)self placeholder];
    [v8 encodeObject:v5 forKey:@"kCodingKeyPlaceholder"];
  }
  objc_msgSend(v8, "encodeBool:forKey:", -[AMSDialogTextField secure](self, "secure"), @"kCodingKeySecure");
  objc_msgSend(v8, "encodeInteger:forKey:", -[AMSDialogTextField tag](self, "tag"), @"kCodingKeyTag");
  id v6 = [(AMSDialogTextField *)self text];

  if (v6)
  {
    id v7 = [(AMSDialogTextField *)self text];
    [v8 encodeObject:v7 forKey:@"kCodingKeyText"];
  }
}

- (AMSDialogTextField)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDialogTextField;
  v5 = [(AMSDialogTextField *)&v11 init];
  if (v5)
  {
    v5->_keyboardType = [v4 decodeIntegerForKey:@"kCodingKeyKeyboardType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyPlaceholder"];
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v6;

    v5->_secure = [v4 decodeBoolForKey:@"kCodingKeySecure"];
    v5->_tag = [v4 decodeIntegerForKey:@"kCodingKeyTag"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyText"];
    text = v5->_text;
    v5->_text = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
}

@end