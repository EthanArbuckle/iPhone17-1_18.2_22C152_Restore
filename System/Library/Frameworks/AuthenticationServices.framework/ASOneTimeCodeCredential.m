@interface ASOneTimeCodeCredential
+ (BOOL)supportsSecureCoding;
+ (id)credentialWithCode:(id)a3;
- (ASOneTimeCodeCredential)initWithCode:(id)a3;
- (ASOneTimeCodeCredential)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)code;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASOneTimeCodeCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)credentialWithCode:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCode:v4];

  return v5;
}

- (ASOneTimeCodeCredential)initWithCode:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOneTimeCodeCredential;
  v5 = [(ASOneTimeCodeCredential *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    code = v5->_code;
    v5->_code = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASOneTimeCodeCredential)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"code"];

  uint64_t v6 = [(ASOneTimeCodeCredential *)self initWithCode:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  code = self->_code;

  return (id)[v4 initWithCode:code];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASOneTimeCodeCredential *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      code = self->_code;
      uint64_t v6 = [(ASOneTimeCodeCredential *)v4 code];
      char v7 = [(NSString *)code isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_code hash];
}

- (NSString)code
{
  return self->_code;
}

- (void).cxx_destruct
{
}

@end