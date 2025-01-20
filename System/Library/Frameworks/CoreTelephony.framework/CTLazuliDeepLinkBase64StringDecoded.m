@interface CTLazuliDeepLinkBase64StringDecoded
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliDeepLinkBase64StringDecoded:(id)a3;
- (CTLazuliChatBotSuggestedChipList)chipList;
- (CTLazuliDeepLinkBase64StringDecoded)initWithCoder:(id)a3;
- (CTLazuliDeepLinkBase64StringDecoded)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChipList:(id)a3;
@end

@implementation CTLazuliDeepLinkBase64StringDecoded

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliDeepLinkBase64StringDecoded *)self chipList];
  [v3 appendFormat:@", chipList = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliDeepLinkBase64StringDecoded:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliDeepLinkBase64StringDecoded *)self chipList];
  if (!v6)
  {
    v3 = [v5 chipList];
    if (!v3)
    {
      char v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v7 = [(CTLazuliDeepLinkBase64StringDecoded *)self chipList];
  v8 = [v5 chipList];
  char v9 = [v7 isEqualToCTLazuliChatBotSuggestedChipList:v8];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliDeepLinkBase64StringDecoded *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliDeepLinkBase64StringDecoded *)self isEqualToCTLazuliDeepLinkBase64StringDecoded:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliDeepLinkBase64StringDecoded allocWithZone:a3];
  [(CTLazuliDeepLinkBase64StringDecoded *)v4 setChipList:self->_chipList];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliDeepLinkBase64StringDecoded)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliDeepLinkBase64StringDecoded;
  id v5 = [(CTLazuliDeepLinkBase64StringDecoded *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChipListKey"];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v6;
  }
  return v5;
}

- (CTLazuliDeepLinkBase64StringDecoded)initWithReflection:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CTLazuliDeepLinkBase64StringDecoded;
  id v4 = [(CTLazuliDeepLinkBase64StringDecoded *)&v10 init];
  id v5 = v4;
  if (!v4) {
    return v5;
  }
  if (!*((unsigned char *)a3 + 24))
  {
    chipList = v4->_chipList;
    v4->_chipList = 0;
    goto LABEL_6;
  }
  uint64_t v6 = [CTLazuliChatBotSuggestedChipList alloc];
  if (*((unsigned char *)a3 + 24))
  {
    uint64_t v7 = [(CTLazuliChatBotSuggestedChipList *)v6 initWithReflection:a3];
    chipList = v5->_chipList;
    v5->_chipList = (CTLazuliChatBotSuggestedChipList *)v7;
LABEL_6:

    return v5;
  }
  result = (CTLazuliDeepLinkBase64StringDecoded *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotSuggestedChipList)chipList
{
  return self->_chipList;
}

- (void)setChipList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end