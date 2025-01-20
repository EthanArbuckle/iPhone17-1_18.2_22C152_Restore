@interface CTLazuliSuggestedActionDialPhoneNumber
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionDialPhoneNumber:(id)a3;
- (CTLazuliSuggestedActionDialPhoneNumber)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionDialPhoneNumber)initWithReflection:(const void *)a3;
- (NSString)fallbackUrl;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackUrl:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation CTLazuliSuggestedActionDialPhoneNumber

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionDialPhoneNumber *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber = %@", v4];

  v5 = [(CTLazuliSuggestedActionDialPhoneNumber *)self fallbackUrl];
  [v3 appendFormat:@", fallbackUrl = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDialPhoneNumber:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliSuggestedActionDialPhoneNumber *)self phoneNumber];
  v7 = [v5 phoneNumber];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(CTLazuliSuggestedActionDialPhoneNumber *)self fallbackUrl];
    if (v8 || ([v5 fallbackUrl], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(CTLazuliSuggestedActionDialPhoneNumber *)self fallbackUrl];
      v10 = [v5 fallbackUrl];
      char v11 = [v9 isEqualToString:v10];

      if (v8)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_10:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSuggestedActionDialPhoneNumber *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionDialPhoneNumber *)self isEqualToCTLazuliSuggestedActionDialPhoneNumber:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSuggestedActionDialPhoneNumber allocWithZone:a3];
  [(CTLazuliSuggestedActionDialPhoneNumber *)v4 setPhoneNumber:self->_phoneNumber];
  [(CTLazuliSuggestedActionDialPhoneNumber *)v4 setFallbackUrl:self->_fallbackUrl];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_phoneNumber forKey:@"kPhoneNumberKey"];
  [v4 encodeObject:self->_fallbackUrl forKey:@"kFallbackUrlKey"];
}

- (CTLazuliSuggestedActionDialPhoneNumber)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliSuggestedActionDialPhoneNumber;
  id v5 = [(CTLazuliSuggestedActionDialPhoneNumber *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPhoneNumberKey"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFallbackUrlKey"];
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliSuggestedActionDialPhoneNumber)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliSuggestedActionDialPhoneNumber;
  id v4 = [(CTLazuliSuggestedActionDialPhoneNumber *)&v15 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      id v5 = a3;
    }
    else {
      id v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v6;

    if (*((unsigned char *)a3 + 48))
    {
      v10 = (char *)*((void *)a3 + 3);
      v9 = (char *)a3 + 24;
      uint64_t v8 = v10;
      if (v9[23] >= 0) {
        objc_super v11 = v9;
      }
      else {
        objc_super v11 = v8;
      }
      uint64_t v12 = [NSString stringWithUTF8String:v11];
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v12;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)fallbackUrl
{
  return self->_fallbackUrl;
}

- (void)setFallbackUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackUrl, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end