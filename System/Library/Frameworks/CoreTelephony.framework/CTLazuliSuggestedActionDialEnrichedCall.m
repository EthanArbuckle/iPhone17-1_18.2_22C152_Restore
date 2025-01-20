@interface CTLazuliSuggestedActionDialEnrichedCall
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSuggestedActionDialEnrichedCall:(id)a3;
- (CTLazuliSuggestedActionDialEnrichedCall)initWithCoder:(id)a3;
- (CTLazuliSuggestedActionDialEnrichedCall)initWithReflection:(const void *)a3;
- (NSString)fallbackUrl;
- (NSString)phoneNumber;
- (NSString)subject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackUrl:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation CTLazuliSuggestedActionDialEnrichedCall

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSuggestedActionDialEnrichedCall *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber = %@", v4];

  v5 = [(CTLazuliSuggestedActionDialEnrichedCall *)self fallbackUrl];
  [v3 appendFormat:@", fallbackUrl = %@", v5];

  v6 = [(CTLazuliSuggestedActionDialEnrichedCall *)self subject];
  [v3 appendFormat:@", subject = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSuggestedActionDialEnrichedCall:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliSuggestedActionDialEnrichedCall *)self phoneNumber];
  v8 = [v6 phoneNumber];
  if (![v7 isEqualToString:v8])
  {
    char v10 = 0;
    goto LABEL_17;
  }
  v9 = [(CTLazuliSuggestedActionDialEnrichedCall *)self fallbackUrl];
  if (v9 || ([v6 fallbackUrl], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliSuggestedActionDialEnrichedCall *)self fallbackUrl];
    v4 = [v6 fallbackUrl];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {

      char v10 = 0;
      goto LABEL_14;
    }
    int v18 = 1;
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  v11 = [(CTLazuliSuggestedActionDialEnrichedCall *)self subject];
  if (!v11)
  {
    uint64_t v16 = [v6 subject];
    if (!v16)
    {
      v15 = 0;
      char v10 = 1;
LABEL_20:

      if ((v18 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v12 = [(CTLazuliSuggestedActionDialEnrichedCall *)self subject];
  v13 = [v6 subject];
  char v10 = [v12 isEqualToString:v13];

  if (!v11)
  {
    v15 = (void *)v16;
    goto LABEL_20;
  }

  if (v18)
  {
LABEL_13:
  }
LABEL_14:
  if (!v9) {

  }
LABEL_17:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSuggestedActionDialEnrichedCall *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSuggestedActionDialEnrichedCall *)self isEqualToCTLazuliSuggestedActionDialEnrichedCall:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSuggestedActionDialEnrichedCall allocWithZone:a3];
  [(CTLazuliSuggestedActionDialEnrichedCall *)v4 setPhoneNumber:self->_phoneNumber];
  [(CTLazuliSuggestedActionDialEnrichedCall *)v4 setFallbackUrl:self->_fallbackUrl];
  [(CTLazuliSuggestedActionDialEnrichedCall *)v4 setSubject:self->_subject];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_phoneNumber forKey:@"kPhoneNumberKey"];
  [v4 encodeObject:self->_fallbackUrl forKey:@"kFallbackUrlKey"];
  [v4 encodeObject:self->_subject forKey:@"kSubjectKey"];
}

- (CTLazuliSuggestedActionDialEnrichedCall)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliSuggestedActionDialEnrichedCall;
  v5 = [(CTLazuliSuggestedActionDialEnrichedCall *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPhoneNumberKey"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFallbackUrlKey"];
    fallbackUrl = v5->_fallbackUrl;
    v5->_fallbackUrl = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSubjectKey"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliSuggestedActionDialEnrichedCall)initWithReflection:(const void *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CTLazuliSuggestedActionDialEnrichedCall;
  id v4 = [(CTLazuliSuggestedActionDialEnrichedCall *)&v18 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v6;

    if (*((unsigned char *)a3 + 48))
    {
      if (*((char *)a3 + 47) >= 0) {
        uint64_t v8 = (char *)a3 + 24;
      }
      else {
        uint64_t v8 = (char *)*((void *)a3 + 3);
      }
      uint64_t v9 = [NSString stringWithUTF8String:v8];
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = (NSString *)v9;
    }
    else
    {
      fallbackUrl = v4->_fallbackUrl;
      v4->_fallbackUrl = 0;
    }

    if (*((unsigned char *)a3 + 80))
    {
      objc_super v13 = (char *)*((void *)a3 + 7);
      v12 = (char *)a3 + 56;
      v11 = v13;
      if (v12[23] >= 0) {
        v14 = v12;
      }
      else {
        v14 = v11;
      }
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      subject = v4->_subject;
      v4->_subject = (NSString *)v15;
    }
    else
    {
      subject = v4->_subject;
      v4->_subject = 0;
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

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_fallbackUrl, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end