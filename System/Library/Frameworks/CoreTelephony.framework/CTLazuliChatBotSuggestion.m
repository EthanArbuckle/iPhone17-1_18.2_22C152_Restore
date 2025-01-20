@interface CTLazuliChatBotSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSuggestion:(id)a3;
- (CTLazuliChatBotPostbackData)postback;
- (CTLazuliChatBotSuggestion)initWithCoder:(id)a3;
- (CTLazuliChatBotSuggestion)initWithReflection:(const void *)a3;
- (NSString)displayText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setPostback:(id)a3;
@end

@implementation CTLazuliChatBotSuggestion

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotSuggestion *)self displayText];
  [v3 appendFormat:@", displayText = %@", v4];

  v5 = [(CTLazuliChatBotSuggestion *)self postback];
  [v3 appendFormat:@", postback = %@", v5];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestion:(id)a3
{
  id v5 = a3;
  v6 = [(CTLazuliChatBotSuggestion *)self displayText];
  v7 = [v5 displayText];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(CTLazuliChatBotSuggestion *)self postback];
    if (v8 || ([v5 postback], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(CTLazuliChatBotSuggestion *)self postback];
      v10 = [v5 postback];
      char v11 = [v9 isEqualToCTLazuliChatBotPostbackData:v10];

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
  v4 = (CTLazuliChatBotSuggestion *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSuggestion *)self isEqualToCTLazuliChatBotSuggestion:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotSuggestion allocWithZone:a3];
  [(CTLazuliChatBotSuggestion *)v4 setDisplayText:self->_displayText];
  [(CTLazuliChatBotSuggestion *)v4 setPostback:self->_postback];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_displayText forKey:@"kDisplayTextKey"];
  [v4 encodeObject:self->_postback forKey:@"kPostbackKey"];
}

- (CTLazuliChatBotSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLazuliChatBotSuggestion;
  id v5 = [(CTLazuliChatBotSuggestion *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayTextKey"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPostbackKey"];
    postback = v5->_postback;
    v5->_postback = (CTLazuliChatBotPostbackData *)v8;
  }
  return v5;
}

- (CTLazuliChatBotSuggestion)initWithReflection:(const void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CTLazuliChatBotSuggestion;
  id v4 = [(CTLazuliChatBotSuggestion *)&v12 init];
  if (!v4) {
    return v4;
  }
  if (*((char *)a3 + 23) >= 0) {
    id v5 = a3;
  }
  else {
    id v5 = *(const void **)a3;
  }
  uint64_t v6 = [NSString stringWithUTF8String:v5];
  displayText = v4->_displayText;
  v4->_displayText = (NSString *)v6;

  if (!*((unsigned char *)a3 + 48))
  {
    postback = v4->_postback;
    v4->_postback = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [CTLazuliChatBotPostbackData alloc];
  if (*((unsigned char *)a3 + 48))
  {
    uint64_t v9 = [(CTLazuliChatBotPostbackData *)v8 initWithReflection:(char *)a3 + 24];
    postback = v4->_postback;
    v4->_postback = (CTLazuliChatBotPostbackData *)v9;
LABEL_9:

    return v4;
  }
  result = (CTLazuliChatBotSuggestion *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void)setDisplayText:(id)a3
{
}

- (CTLazuliChatBotPostbackData)postback
{
  return self->_postback;
}

- (void)setPostback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postback, 0);

  objc_storeStrong((id *)&self->_displayText, 0);
}

@end