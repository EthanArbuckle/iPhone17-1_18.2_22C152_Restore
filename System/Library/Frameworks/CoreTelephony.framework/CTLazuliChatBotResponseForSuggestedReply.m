@interface CTLazuliChatBotResponseForSuggestedReply
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotResponseForSuggestedReply:(id)a3;
- (CTLazuliChatBotPostbackData)postBackData;
- (CTLazuliChatBotResponseForSuggestedReply)initWithCoder:(id)a3;
- (CTLazuliChatBotResponseForSuggestedReply)initWithReflection:(const void *)a3;
- (CTLazuliMessageID)inReplyToID;
- (NSString)displayText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayText:(id)a3;
- (void)setInReplyToID:(id)a3;
- (void)setPostBackData:(id)a3;
@end

@implementation CTLazuliChatBotResponseForSuggestedReply

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotResponseForSuggestedReply *)self displayText];
  [v3 appendFormat:@", displayText = %@", v4];

  v5 = [(CTLazuliChatBotResponseForSuggestedReply *)self postBackData];
  [v3 appendFormat:@", postBackData = %@", v5];

  v6 = [(CTLazuliChatBotResponseForSuggestedReply *)self inReplyToID];
  [v3 appendFormat:@", inReplyToID = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotResponseForSuggestedReply:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotResponseForSuggestedReply *)self displayText];
  v6 = [v4 displayText];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CTLazuliChatBotResponseForSuggestedReply *)self postBackData];
    v8 = [v4 postBackData];
    if ([v7 isEqualToCTLazuliChatBotPostbackData:v8])
    {
      v9 = [(CTLazuliChatBotResponseForSuggestedReply *)self inReplyToID];
      v10 = [v4 inReplyToID];
      char v11 = [v9 isEqualToCTLazuliMessageID:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotResponseForSuggestedReply *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotResponseForSuggestedReply *)self isEqualToCTLazuliChatBotResponseForSuggestedReply:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotResponseForSuggestedReply allocWithZone:a3];
  [(CTLazuliChatBotResponseForSuggestedReply *)v4 setDisplayText:self->_displayText];
  [(CTLazuliChatBotResponseForSuggestedReply *)v4 setPostBackData:self->_postBackData];
  [(CTLazuliChatBotResponseForSuggestedReply *)v4 setInReplyToID:self->_inReplyToID];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_displayText forKey:@"kDisplayTextKey"];
  [v4 encodeObject:self->_postBackData forKey:@"kPostBackDataKey"];
  [v4 encodeObject:self->_inReplyToID forKey:@"kInReplyToIDKey"];
}

- (CTLazuliChatBotResponseForSuggestedReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotResponseForSuggestedReply;
  v5 = [(CTLazuliChatBotResponseForSuggestedReply *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDisplayTextKey"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPostBackDataKey"];
    postBackData = v5->_postBackData;
    v5->_postBackData = (CTLazuliChatBotPostbackData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kInReplyToIDKey"];
    inReplyToID = v5->_inReplyToID;
    v5->_inReplyToID = (CTLazuliMessageID *)v10;
  }
  return v5;
}

- (CTLazuliChatBotResponseForSuggestedReply)initWithReflection:(const void *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatBotResponseForSuggestedReply;
  id v4 = [(CTLazuliChatBotResponseForSuggestedReply *)&v13 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    displayText = v4->_displayText;
    v4->_displayText = (NSString *)v6;

    uint64_t v8 = [[CTLazuliChatBotPostbackData alloc] initWithReflection:(char *)a3 + 24];
    postBackData = v4->_postBackData;
    v4->_postBackData = v8;

    uint64_t v10 = [[CTLazuliMessageID alloc] initWithReflection:(char *)a3 + 48];
    inReplyToID = v4->_inReplyToID;
    v4->_inReplyToID = v10;
  }
  return v4;
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

- (CTLazuliChatBotPostbackData)postBackData
{
  return self->_postBackData;
}

- (void)setPostBackData:(id)a3
{
}

- (CTLazuliMessageID)inReplyToID
{
  return self->_inReplyToID;
}

- (void)setInReplyToID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inReplyToID, 0);
  objc_storeStrong((id *)&self->_postBackData, 0);

  objc_storeStrong((id *)&self->_displayText, 0);
}

@end