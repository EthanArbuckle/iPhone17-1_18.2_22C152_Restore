@interface CTLazuliChatBotPCC
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotPCC:(id)a3;
- (CTLazuliChatBotOrgDetails)orgDetails;
- (CTLazuliChatBotPCC)initWithCoder:(id)a3;
- (CTLazuliChatBotPCC)initWithReflection:(const void *)a3;
- (NSString)pccType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOrgDetails:(id)a3;
- (void)setPccType:(id)a3;
@end

@implementation CTLazuliChatBotPCC

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotPCC *)self orgDetails];
  [v3 appendFormat:@", orgDetails = %@", v4];

  v5 = [(CTLazuliChatBotPCC *)self pccType];
  [v3 appendFormat:@", pccType = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotPCC:(id)a3
{
  id v8 = a3;
  v9 = [(CTLazuliChatBotPCC *)self orgDetails];
  if (v9 || ([v8 orgDetails], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliChatBotPCC *)self orgDetails];
    v4 = [v8 orgDetails];
    if (![v3 isEqualToCTLazuliChatBotOrgDetails:v4])
    {
      char v11 = 0;
      goto LABEL_12;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  v16 = v5;
  v12 = [(CTLazuliChatBotPCC *)self pccType];
  if (!v12)
  {
    v6 = [v8 pccType];
    if (!v6)
    {
      char v11 = 1;
LABEL_16:

      if (v10) {
        goto LABEL_11;
      }
LABEL_17:
      v5 = v16;
      if (v9) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v13 = [(CTLazuliChatBotPCC *)self pccType];
  v14 = [v8 pccType];
  char v11 = [v13 isEqualToString:v14];

  if (!v12) {
    goto LABEL_16;
  }

  if (!v10) {
    goto LABEL_17;
  }
LABEL_11:
  v5 = v16;
LABEL_12:

  if (!v9) {
LABEL_13:
  }

LABEL_14:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotPCC *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotPCC *)self isEqualToCTLazuliChatBotPCC:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotPCC allocWithZone:a3];
  [(CTLazuliChatBotPCC *)v4 setOrgDetails:self->_orgDetails];
  [(CTLazuliChatBotPCC *)v4 setPccType:self->_pccType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_orgDetails forKey:@"kOrgDetailsKey"];
  [v4 encodeObject:self->_pccType forKey:@"kPccTypeKey"];
}

- (CTLazuliChatBotPCC)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotPCC;
  v5 = [(CTLazuliChatBotPCC *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOrgDetailsKey"];
    orgDetails = v5->_orgDetails;
    v5->_orgDetails = (CTLazuliChatBotOrgDetails *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPccTypeKey"];
    pccType = v5->_pccType;
    v5->_pccType = (NSString *)v8;
  }
  return v5;
}

- (CTLazuliChatBotPCC)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotPCC;
  id v4 = [(CTLazuliChatBotPCC *)&v13 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (!*((unsigned char *)a3 + 272))
  {
    orgDetails = v4->_orgDetails;
    v4->_orgDetails = 0;
    goto LABEL_6;
  }
  uint64_t v6 = [CTLazuliChatBotOrgDetails alloc];
  if (*((unsigned char *)a3 + 272))
  {
    uint64_t v7 = [(CTLazuliChatBotOrgDetails *)v6 initWithReflection:a3];
    orgDetails = v5->_orgDetails;
    v5->_orgDetails = (CTLazuliChatBotOrgDetails *)v7;
LABEL_6:

    if (*((unsigned char *)a3 + 304))
    {
      if (*((char *)a3 + 303) >= 0) {
        v9 = (char *)a3 + 280;
      }
      else {
        v9 = (char *)*((void *)a3 + 35);
      }
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      pccType = v5->_pccType;
      v5->_pccType = (NSString *)v10;
    }
    else
    {
      pccType = v5->_pccType;
      v5->_pccType = 0;
    }

    return v5;
  }
  result = (CTLazuliChatBotPCC *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotOrgDetails)orgDetails
{
  return self->_orgDetails;
}

- (void)setOrgDetails:(id)a3
{
}

- (NSString)pccType
{
  return self->_pccType;
}

- (void)setPccType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pccType, 0);

  objc_storeStrong((id *)&self->_orgDetails, 0);
}

@end