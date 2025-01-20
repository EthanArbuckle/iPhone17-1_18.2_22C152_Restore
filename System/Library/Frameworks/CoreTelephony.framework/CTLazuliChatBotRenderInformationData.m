@interface CTLazuliChatBotRenderInformationData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotRenderInformationData:(id)a3;
- (CTLazuliChatBotRenderInformation)renderInformation;
- (CTLazuliChatBotRenderInformationData)initWithCoder:(id)a3;
- (CTLazuliChatBotRenderInformationData)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cacheType;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheType:(int64_t)a3;
- (void)setRenderInformation:(id)a3;
@end

@implementation CTLazuliChatBotRenderInformationData

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotRenderInformationData *)self renderInformation];
  [v3 appendFormat:@", renderInformation = %@", v4];

  int64_t v5 = [(CTLazuliChatBotRenderInformationData *)self cacheType];
  int64_t v7 = [(CTLazuliChatBotRenderInformationData *)self cacheType];
  [v3 appendFormat:@", cacheType = [%ld - %s]", v5, print_CTLazuliChatBotRenderInformationCacheType(&v7)];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotRenderInformationData:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliChatBotRenderInformationData *)self renderInformation];
  if (!v8)
  {
    v3 = [v7 renderInformation];
    if (!v3)
    {
      int v9 = 0;
LABEL_7:
      int64_t v11 = [(CTLazuliChatBotRenderInformationData *)self cacheType];
      BOOL v10 = v11 == [v7 cacheType];
      if (!v9) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  v4 = [(CTLazuliChatBotRenderInformationData *)self renderInformation];
  int64_t v5 = [v7 renderInformation];
  if ([v4 isEqualToCTLazuliChatBotRenderInformation:v5])
  {
    int v9 = 1;
    goto LABEL_7;
  }
  BOOL v10 = 0;
LABEL_8:

LABEL_9:
  if (!v8) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotRenderInformationData *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotRenderInformationData *)self isEqualToCTLazuliChatBotRenderInformationData:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotRenderInformationData allocWithZone:a3];
  [(CTLazuliChatBotRenderInformationData *)v4 setRenderInformation:self->_renderInformation];
  [(CTLazuliChatBotRenderInformationData *)v4 setCacheType:self->_cacheType];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_renderInformation forKey:@"kRenderInformationKey"];
  v4 = [NSNumber numberWithLong:self->_cacheType];
  [v5 encodeObject:v4 forKey:@"kCacheTypeKey"];
}

- (CTLazuliChatBotRenderInformationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotRenderInformationData;
  id v5 = [(CTLazuliChatBotRenderInformationData *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRenderInformationKey"];
    renderInformation = v5->_renderInformation;
    v5->_renderInformation = (CTLazuliChatBotRenderInformation *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCacheTypeKey"];
    v5->_cacheType = [v8 longValue];
  }
  return v5;
}

- (CTLazuliChatBotRenderInformationData)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliChatBotRenderInformationData;
  id v4 = [(CTLazuliChatBotRenderInformationData *)&v10 init];
  id v5 = v4;
  if (!v4) {
    return v5;
  }
  if (!*((unsigned char *)a3 + 688))
  {
    renderInformation = v4->_renderInformation;
    v4->_renderInformation = 0;
    goto LABEL_6;
  }
  uint64_t v6 = [CTLazuliChatBotRenderInformation alloc];
  if (*((unsigned char *)a3 + 688))
  {
    uint64_t v7 = [(CTLazuliChatBotRenderInformation *)v6 initWithReflection:a3];
    renderInformation = v5->_renderInformation;
    v5->_renderInformation = (CTLazuliChatBotRenderInformation *)v7;
LABEL_6:

    v5->_cacheType = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3 + 174);
    return v5;
  }
  result = (CTLazuliChatBotRenderInformationData *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotRenderInformation)renderInformation
{
  return self->_renderInformation;
}

- (void)setRenderInformation:(id)a3
{
}

- (int64_t)cacheType
{
  return self->_cacheType;
}

- (void)setCacheType:(int64_t)a3
{
  self->_cacheType = a3;
}

- (void).cxx_destruct
{
}

@end