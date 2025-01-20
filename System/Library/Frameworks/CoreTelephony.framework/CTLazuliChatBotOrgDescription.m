@interface CTLazuliChatBotOrgDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotOrgDescription:(id)a3;
- (CTLazuliChatBotOrgDescription)initWithCoder:(id)a3;
- (CTLazuliChatBotOrgDescription)initWithReflection:(const void *)a3;
- (NSString)orgDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOrgDescription:(id)a3;
@end

@implementation CTLazuliChatBotOrgDescription

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotOrgDescription *)self orgDescription];
  [v3 appendFormat:@", orgDescription = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotOrgDescription:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliChatBotOrgDescription *)self orgDescription];
  if (!v6)
  {
    v3 = [v5 orgDescription];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CTLazuliChatBotOrgDescription *)self orgDescription];
  v8 = [v5 orgDescription];
  char v9 = [v7 isEqualToString:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotOrgDescription *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotOrgDescription *)self isEqualToCTLazuliChatBotOrgDescription:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotOrgDescription allocWithZone:a3];
  [(CTLazuliChatBotOrgDescription *)v4 setOrgDescription:self->_orgDescription];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotOrgDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotOrgDescription;
  id v5 = [(CTLazuliChatBotOrgDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOrgDescriptionKey"];
    orgDescription = v5->_orgDescription;
    v5->_orgDescription = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliChatBotOrgDescription)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotOrgDescription;
  id v4 = [(CTLazuliChatBotOrgDescription *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 24))
    {
      if (*((char *)a3 + 23) >= 0) {
        uint64_t v6 = a3;
      }
      else {
        uint64_t v6 = *(const void **)a3;
      }
      uint64_t v7 = [NSString stringWithUTF8String:v6];
      orgDescription = v5->_orgDescription;
      v5->_orgDescription = (NSString *)v7;
    }
    else
    {
      orgDescription = v4->_orgDescription;
      v4->_orgDescription = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)orgDescription
{
  return self->_orgDescription;
}

- (void)setOrgDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end