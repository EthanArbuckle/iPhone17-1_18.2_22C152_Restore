@interface CNGeminiHandle
+ (BOOL)supportsSecureCoding;
- (CNGeminiHandle)initWithCoder:(id)a3;
- (CNGeminiHandle)initWithString:(id)a3 type:(int64_t)a4;
- (NSString)stringValue;
- (int64_t)handleType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNGeminiHandle

- (CNGeminiHandle)initWithString:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNGeminiHandle;
  v7 = [(CNGeminiHandle *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_handleType = a4;
    if (a4) {
      goto LABEL_4;
    }
    v9 = +[CNPhoneNumber phoneNumberWithStringValue:v6];
    uint64_t v10 = [v9 unformattedInternationalStringValue];
    stringValue = v8->_stringValue;
    v8->_stringValue = (NSString *)v10;

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
    {
LABEL_4:
      uint64_t v12 = [v6 copy];
      v13 = v8->_stringValue;
      v8->_stringValue = (NSString *)v12;
    }
    v14 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNGeminiHandle;
  v5 = [(CNGeminiHandle *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_stringValue"];
    uint64_t v7 = [v6 copy];
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v7;

    v5->_handleType = [v4 decodeIntegerForKey:@"_handleType"];
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  stringValue = self->_stringValue;
  id v5 = a3;
  [v5 encodeObject:stringValue forKey:@"_stringValue"];
  [v5 encodeInteger:self->_handleType forKey:@"_handleType"];
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
}

@end