@interface CTLazuliChatBotRenderInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotRenderInformation:(id)a3;
- (CTLazuliChatBotGenericCssTemplateInfo)cssInfo;
- (CTLazuliChatBotInformation)botInfo;
- (CTLazuliChatBotMenuItem)persistentMenu;
- (CTLazuliChatBotRenderInformation)initWithCoder:(id)a3;
- (CTLazuliChatBotRenderInformation)initWithReflection:(const void *)a3;
- (CTLazuliChatBotVerificationDetails)verificationDetails;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBotInfo:(id)a3;
- (void)setCssInfo:(id)a3;
- (void)setPersistentMenu:(id)a3;
- (void)setVerificationDetails:(id)a3;
@end

@implementation CTLazuliChatBotRenderInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotRenderInformation *)self botInfo];
  [v3 appendFormat:@", botInfo = %@", v4];

  v5 = [(CTLazuliChatBotRenderInformation *)self persistentMenu];
  [v3 appendFormat:@", persistentMenu = %@", v5];

  v6 = [(CTLazuliChatBotRenderInformation *)self verificationDetails];
  [v3 appendFormat:@", verificationDetails = %@", v6];

  v7 = [(CTLazuliChatBotRenderInformation *)self cssInfo];
  [v3 appendFormat:@", cssInfo = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotRenderInformation:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliChatBotRenderInformation *)self botInfo];
  v7 = [v5 botInfo];
  if (![v6 isEqualToCTLazuliChatBotInformation:v7])
  {
    char v9 = 0;
    goto LABEL_19;
  }
  v8 = [(CTLazuliChatBotRenderInformation *)self persistentMenu];
  if (v8 || ([v5 persistentMenu], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = [(CTLazuliChatBotRenderInformation *)self persistentMenu];
    v3 = [v5 persistentMenu];
    if (([v20 isEqualToCTLazuliChatBotMenuItem:v3] & 1) == 0)
    {

      char v9 = 0;
      goto LABEL_16;
    }
    int v19 = 1;
  }
  else
  {
    v18 = 0;
    int v19 = 0;
  }
  v10 = [(CTLazuliChatBotRenderInformation *)self verificationDetails];
  v11 = [v5 verificationDetails];
  if ([v10 isEqualToCTLazuliChatBotVerificationDetails:v11])
  {
    uint64_t v17 = [(CTLazuliChatBotRenderInformation *)self cssInfo];
    if (v17 || ([v5 cssInfo], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(CTLazuliChatBotRenderInformation *)self cssInfo];
      v13 = [v5 cssInfo];
      char v9 = [v12 isEqualToCTLazuliChatBotGenericCssTemplateInfo:v13];

      v14 = (void *)v17;
      if (!v17) {
        v14 = (void *)v16;
      }
    }
    else
    {
      v14 = 0;
      char v9 = 1;
    }

    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  char v9 = 0;
  if (v19)
  {
LABEL_15:
  }
LABEL_16:
  if (!v8) {

  }
LABEL_19:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotRenderInformation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotRenderInformation *)self isEqualToCTLazuliChatBotRenderInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotRenderInformation allocWithZone:a3];
  [(CTLazuliChatBotRenderInformation *)v4 setBotInfo:self->_botInfo];
  [(CTLazuliChatBotRenderInformation *)v4 setPersistentMenu:self->_persistentMenu];
  [(CTLazuliChatBotRenderInformation *)v4 setVerificationDetails:self->_verificationDetails];
  [(CTLazuliChatBotRenderInformation *)v4 setCssInfo:self->_cssInfo];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_botInfo forKey:@"kBotInfoKey"];
  [v4 encodeObject:self->_persistentMenu forKey:@"kPersistentMenuKey"];
  [v4 encodeObject:self->_verificationDetails forKey:@"kVerificationDetailsKey"];
  [v4 encodeObject:self->_cssInfo forKey:@"kCssInfoKey"];
}

- (CTLazuliChatBotRenderInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliChatBotRenderInformation;
  id v5 = [(CTLazuliChatBotRenderInformation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBotInfoKey"];
    botInfo = v5->_botInfo;
    v5->_botInfo = (CTLazuliChatBotInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPersistentMenuKey"];
    persistentMenu = v5->_persistentMenu;
    v5->_persistentMenu = (CTLazuliChatBotMenuItem *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kVerificationDetailsKey"];
    verificationDetails = v5->_verificationDetails;
    v5->_verificationDetails = (CTLazuliChatBotVerificationDetails *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCssInfoKey"];
    cssInfo = v5->_cssInfo;
    v5->_cssInfo = (CTLazuliChatBotGenericCssTemplateInfo *)v12;
  }
  return v5;
}

- (CTLazuliChatBotRenderInformation)initWithReflection:(const void *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliChatBotRenderInformation;
  id v4 = [(CTLazuliChatBotRenderInformation *)&v16 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliChatBotInformation alloc] initWithReflection:a3];
  botInfo = v4->_botInfo;
  v4->_botInfo = v5;

  if (*((unsigned char *)a3 + 592))
  {
    v7 = [CTLazuliChatBotMenuItem alloc];
    if (!*((unsigned char *)a3 + 592)) {
      goto LABEL_12;
    }
    uint64_t v8 = [(CTLazuliChatBotMenuItem *)v7 initWithReflection:(char *)a3 + 568];
    persistentMenu = v4->_persistentMenu;
    v4->_persistentMenu = (CTLazuliChatBotMenuItem *)v8;
  }
  else
  {
    persistentMenu = v4->_persistentMenu;
    v4->_persistentMenu = 0;
  }

  uint64_t v10 = [[CTLazuliChatBotVerificationDetails alloc] initWithReflection:(char *)a3 + 600];
  verificationDetails = v4->_verificationDetails;
  v4->_verificationDetails = v10;

  if (!*((unsigned char *)a3 + 680))
  {
    cssInfo = v4->_cssInfo;
    v4->_cssInfo = 0;
    goto LABEL_10;
  }
  uint64_t v12 = [CTLazuliChatBotGenericCssTemplateInfo alloc];
  if (*((unsigned char *)a3 + 680))
  {
    uint64_t v13 = [(CTLazuliChatBotGenericCssTemplateInfo *)v12 initWithReflection:(char *)a3 + 656];
    cssInfo = v4->_cssInfo;
    v4->_cssInfo = (CTLazuliChatBotGenericCssTemplateInfo *)v13;
LABEL_10:

    return v4;
  }
LABEL_12:
  result = (CTLazuliChatBotRenderInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotInformation)botInfo
{
  return self->_botInfo;
}

- (void)setBotInfo:(id)a3
{
}

- (CTLazuliChatBotMenuItem)persistentMenu
{
  return self->_persistentMenu;
}

- (void)setPersistentMenu:(id)a3
{
}

- (CTLazuliChatBotVerificationDetails)verificationDetails
{
  return self->_verificationDetails;
}

- (void)setVerificationDetails:(id)a3
{
}

- (CTLazuliChatBotGenericCssTemplateInfo)cssInfo
{
  return self->_cssInfo;
}

- (void)setCssInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cssInfo, 0);
  objc_storeStrong((id *)&self->_verificationDetails, 0);
  objc_storeStrong((id *)&self->_persistentMenu, 0);

  objc_storeStrong((id *)&self->_botInfo, 0);
}

@end