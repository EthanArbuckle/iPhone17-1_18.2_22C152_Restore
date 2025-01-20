@interface CTLazuliChatBotSuggestedReply
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSuggestedReply:(id)a3;
- (CTLazuliChatBotSuggestedReply)initWithCoder:(id)a3;
- (CTLazuliChatBotSuggestedReply)initWithReflection:(const void *)a3;
- (CTLazuliChatBotSuggestion)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CTLazuliChatBotSuggestedReply

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotSuggestedReply *)self data];
  [v3 appendFormat:@", data = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSuggestedReply:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotSuggestedReply *)self data];
  v6 = [v4 data];
  char v7 = [v5 isEqualToCTLazuliChatBotSuggestion:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotSuggestedReply *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSuggestedReply *)self isEqualToCTLazuliChatBotSuggestedReply:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotSuggestedReply allocWithZone:a3];
  [(CTLazuliChatBotSuggestedReply *)v4 setData:self->_data];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliChatBotSuggestedReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliChatBotSuggestedReply;
  v5 = [(CTLazuliChatBotSuggestedReply *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDataKey"];
    data = v5->_data;
    v5->_data = (CTLazuliChatBotSuggestion *)v6;
  }
  return v5;
}

- (CTLazuliChatBotSuggestedReply)initWithReflection:(const void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CTLazuliChatBotSuggestedReply;
  id v4 = [(CTLazuliChatBotSuggestedReply *)&v8 init];
  if (v4)
  {
    v5 = [[CTLazuliChatBotSuggestion alloc] initWithReflection:a3];
    data = v4->_data;
    v4->_data = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliChatBotSuggestion)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end