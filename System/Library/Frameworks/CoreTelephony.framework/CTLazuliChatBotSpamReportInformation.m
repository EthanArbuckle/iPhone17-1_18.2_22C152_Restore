@interface CTLazuliChatBotSpamReportInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotSpamReportInformation:(id)a3;
- (CTLazuliChatBotSpamReportInformation)initWithCoder:(id)a3;
- (CTLazuliChatBotSpamReportInformation)initWithReflection:(const void *)a3;
- (CTLazuliMessageIDList)messageIDList;
- (NSString)chatbotUri;
- (NSString)freeBodyText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)spamType;
- (void)encodeWithCoder:(id)a3;
- (void)setChatbotUri:(id)a3;
- (void)setFreeBodyText:(id)a3;
- (void)setMessageIDList:(id)a3;
- (void)setSpamType:(int64_t)a3;
@end

@implementation CTLazuliChatBotSpamReportInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotSpamReportInformation *)self chatbotUri];
  [v3 appendFormat:@", chatbotUri = %@", v4];

  v5 = [(CTLazuliChatBotSpamReportInformation *)self messageIDList];
  [v3 appendFormat:@", messageIDList = %@", v5];

  int64_t v6 = [(CTLazuliChatBotSpamReportInformation *)self spamType];
  int64_t v9 = [(CTLazuliChatBotSpamReportInformation *)self spamType];
  [v3 appendFormat:@", spamType = [%ld - %s]", v6, print_CTLazuliSpamReportType(&v9)];
  v7 = [(CTLazuliChatBotSpamReportInformation *)self freeBodyText];
  [v3 appendFormat:@", freeBodyText = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotSpamReportInformation:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(CTLazuliChatBotSpamReportInformation *)self chatbotUri];
  v7 = [v5 chatbotUri];
  if ([v6 isEqualToString:v7])
  {
    v8 = [(CTLazuliChatBotSpamReportInformation *)self messageIDList];
    int64_t v9 = [v5 messageIDList];
    if (![v8 isEqualToCTLazuliMessageIDList:v9]
      || (int64_t v10 = -[CTLazuliChatBotSpamReportInformation spamType](self, "spamType"), v10 != [v5 spamType]))
    {
      char v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v11 = [(CTLazuliChatBotSpamReportInformation *)self freeBodyText];
    if (v11 || ([v5 freeBodyText], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = [(CTLazuliChatBotSpamReportInformation *)self freeBodyText];
      v13 = [v5 freeBodyText];
      char v14 = [v12 isEqualToString:v13];

      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      char v14 = 1;
    }

    goto LABEL_12;
  }
  char v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatBotSpamReportInformation *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotSpamReportInformation *)self isEqualToCTLazuliChatBotSpamReportInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatBotSpamReportInformation allocWithZone:a3];
  [(CTLazuliChatBotSpamReportInformation *)v4 setChatbotUri:self->_chatbotUri];
  [(CTLazuliChatBotSpamReportInformation *)v4 setMessageIDList:self->_messageIDList];
  [(CTLazuliChatBotSpamReportInformation *)v4 setSpamType:self->_spamType];
  [(CTLazuliChatBotSpamReportInformation *)v4 setFreeBodyText:self->_freeBodyText];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_chatbotUri forKey:@"kChatbotUriKey"];
  [v5 encodeObject:self->_messageIDList forKey:@"kMessageIDListKey"];
  v4 = [NSNumber numberWithLong:self->_spamType];
  [v5 encodeObject:v4 forKey:@"kSpamTypeKey"];

  [v5 encodeObject:self->_freeBodyText forKey:@"kFreeBodyTextKey"];
}

- (CTLazuliChatBotSpamReportInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTLazuliChatBotSpamReportInformation;
  id v5 = [(CTLazuliChatBotSpamReportInformation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatbotUriKey"];
    chatbotUri = v5->_chatbotUri;
    v5->_chatbotUri = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDListKey"];
    messageIDList = v5->_messageIDList;
    v5->_messageIDList = (CTLazuliMessageIDList *)v8;

    int64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSpamTypeKey"];
    v5->_spamType = [v10 longValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFreeBodyTextKey"];
    freeBodyText = v5->_freeBodyText;
    v5->_freeBodyText = (NSString *)v11;
  }
  return v5;
}

- (CTLazuliChatBotSpamReportInformation)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatBotSpamReportInformation;
  id v4 = [(CTLazuliChatBotSpamReportInformation *)&v17 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      id v5 = a3;
    }
    else {
      id v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    chatbotUri = v4->_chatbotUri;
    v4->_chatbotUri = (NSString *)v6;

    uint64_t v8 = [[CTLazuliMessageIDList alloc] initWithReflection:(char *)a3 + 24];
    messageIDList = v4->_messageIDList;
    v4->_messageIDList = v8;

    v4->_spamType = encode_CTLazuliSpamReportType((unsigned int *)a3 + 12);
    if (*((unsigned char *)a3 + 80))
    {
      v12 = (char *)*((void *)a3 + 7);
      uint64_t v11 = (char *)a3 + 56;
      int64_t v10 = v12;
      if (v11[23] >= 0) {
        v13 = v11;
      }
      else {
        v13 = v10;
      }
      uint64_t v14 = [NSString stringWithUTF8String:v13];
      freeBodyText = v4->_freeBodyText;
      v4->_freeBodyText = (NSString *)v14;
    }
    else
    {
      freeBodyText = v4->_freeBodyText;
      v4->_freeBodyText = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)chatbotUri
{
  return self->_chatbotUri;
}

- (void)setChatbotUri:(id)a3
{
}

- (CTLazuliMessageIDList)messageIDList
{
  return self->_messageIDList;
}

- (void)setMessageIDList:(id)a3
{
}

- (int64_t)spamType
{
  return self->_spamType;
}

- (void)setSpamType:(int64_t)a3
{
  self->_spamType = a3;
}

- (NSString)freeBodyText
{
  return self->_freeBodyText;
}

- (void)setFreeBodyText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_freeBodyText, 0);
  objc_storeStrong((id *)&self->_messageIDList, 0);

  objc_storeStrong((id *)&self->_chatbotUri, 0);
}

@end