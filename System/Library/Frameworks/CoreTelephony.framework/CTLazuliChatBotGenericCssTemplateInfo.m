@interface CTLazuliChatBotGenericCssTemplateInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotGenericCssTemplateInfo:(id)a3;
- (CTLazuliChatBotGenericCssTemplateInfo)initWithCoder:(id)a3;
- (CTLazuliChatBotGenericCssTemplateInfo)initWithReflection:(const void *)a3;
- (NSString)cssUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCssUrl:(id)a3;
@end

@implementation CTLazuliChatBotGenericCssTemplateInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotGenericCssTemplateInfo *)self cssUrl];
  [v3 appendFormat:@", cssUrl = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotGenericCssTemplateInfo:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotGenericCssTemplateInfo *)self cssUrl];
  v6 = [v4 cssUrl];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotGenericCssTemplateInfo *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotGenericCssTemplateInfo *)self isEqualToCTLazuliChatBotGenericCssTemplateInfo:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotGenericCssTemplateInfo allocWithZone:a3];
  [(CTLazuliChatBotGenericCssTemplateInfo *)v4 setCssUrl:self->_cssUrl];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotGenericCssTemplateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotGenericCssTemplateInfo;
  v5 = [(CTLazuliChatBotGenericCssTemplateInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCssUrlKey"];
    cssUrl = v5->_cssUrl;
    v5->_cssUrl = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliChatBotGenericCssTemplateInfo)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotGenericCssTemplateInfo;
  id v4 = [(CTLazuliChatBotGenericCssTemplateInfo *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    cssUrl = v4->_cssUrl;
    v4->_cssUrl = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)cssUrl
{
  return self->_cssUrl;
}

- (void)setCssUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end