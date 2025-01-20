@interface CTLazuliChatBotVerificationDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotVerificationDetails:(id)a3;
- (BOOL)verified;
- (CTLazuliChatBotVerificationDetails)initWithCoder:(id)a3;
- (CTLazuliChatBotVerificationDetails)initWithReflection:(const void *)a3;
- (NSString)expires;
- (NSString)verifiedBy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setExpires:(id)a3;
- (void)setVerified:(BOOL)a3;
- (void)setVerifiedBy:(id)a3;
@end

@implementation CTLazuliChatBotVerificationDetails

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  [v3 appendFormat:@", verified = %d", -[CTLazuliChatBotVerificationDetails verified](self, "verified")];
  v4 = [(CTLazuliChatBotVerificationDetails *)self verifiedBy];
  [v3 appendFormat:@", verifiedBy = %@", v4];

  v5 = [(CTLazuliChatBotVerificationDetails *)self expires];
  [v3 appendFormat:@", expires = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotVerificationDetails:(id)a3
{
  id v4 = a3;
  int v5 = [(CTLazuliChatBotVerificationDetails *)self verified];
  if (v5 == [v4 verified])
  {
    v7 = [(CTLazuliChatBotVerificationDetails *)self verifiedBy];
    v8 = [v4 verifiedBy];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(CTLazuliChatBotVerificationDetails *)self expires];
      v10 = [v4 expires];
      char v6 = [v9 isEqualToString:v10];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotVerificationDetails *)a3;
  int v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotVerificationDetails *)self isEqualToCTLazuliChatBotVerificationDetails:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotVerificationDetails allocWithZone:a3];
  [(CTLazuliChatBotVerificationDetails *)v4 setVerified:self->_verified];
  [(CTLazuliChatBotVerificationDetails *)v4 setVerifiedBy:self->_verifiedBy];
  [(CTLazuliChatBotVerificationDetails *)v4 setExpires:self->_expires];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_verified forKey:@"kVerifiedKey"];
  [v4 encodeObject:self->_verifiedBy forKey:@"kVerifiedByKey"];
  [v4 encodeObject:self->_expires forKey:@"kExpiresKey"];
}

- (CTLazuliChatBotVerificationDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotVerificationDetails;
  int v5 = [(CTLazuliChatBotVerificationDetails *)&v11 init];
  if (v5)
  {
    v5->_verified = [v4 decodeBoolForKey:@"kVerifiedKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVerifiedByKey"];
    verifiedBy = v5->_verifiedBy;
    v5->_verifiedBy = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExpiresKey"];
    expires = v5->_expires;
    v5->_expires = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliChatBotVerificationDetails)initWithReflection:(const void *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliChatBotVerificationDetails;
  id v4 = [(CTLazuliChatBotVerificationDetails *)&v16 init];
  int v5 = v4;
  if (v4)
  {
    v4->_verified = *(unsigned char *)a3;
    if (*((char *)a3 + 31) >= 0) {
      uint64_t v6 = (char *)a3 + 8;
    }
    else {
      uint64_t v6 = (char *)*((void *)a3 + 1);
    }
    uint64_t v7 = [NSString stringWithUTF8String:v6];
    verifiedBy = v5->_verifiedBy;
    v5->_verifiedBy = (NSString *)v7;

    objc_super v11 = (char *)*((void *)a3 + 4);
    v10 = (char *)a3 + 32;
    v9 = v11;
    if (v10[23] >= 0) {
      v12 = v10;
    }
    else {
      v12 = v9;
    }
    uint64_t v13 = [NSString stringWithUTF8String:v12];
    expires = v5->_expires;
    v5->_expires = (NSString *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)verified
{
  return self->_verified;
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (NSString)verifiedBy
{
  return self->_verifiedBy;
}

- (void)setVerifiedBy:(id)a3
{
}

- (NSString)expires
{
  return self->_expires;
}

- (void)setExpires:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);

  objc_storeStrong((id *)&self->_verifiedBy, 0);
}

@end