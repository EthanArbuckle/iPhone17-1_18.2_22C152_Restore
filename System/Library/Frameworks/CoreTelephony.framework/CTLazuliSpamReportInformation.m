@interface CTLazuliSpamReportInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isChatbot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSpamReportInformation:(id)a3;
- (CTLazuliMessageIDList)messageIDList;
- (CTLazuliSpamReportInformation)initWithCoder:(id)a3;
- (CTLazuliSpamReportInformation)initWithReflection:(const void *)a3;
- (NSString)content;
- (NSString)destinationUri;
- (NSString)freeBodyText;
- (NSString)spamReportingUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)spamType;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setDestinationUri:(id)a3;
- (void)setFreeBodyText:(id)a3;
- (void)setIsChatbot:(BOOL)a3;
- (void)setMessageIDList:(id)a3;
- (void)setSpamReportingUri:(id)a3;
- (void)setSpamType:(int64_t)a3;
@end

@implementation CTLazuliSpamReportInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  [v3 appendFormat:@", isChatbot = %d", -[CTLazuliSpamReportInformation isChatbot](self, "isChatbot")];
  v4 = [(CTLazuliSpamReportInformation *)self destinationUri];
  [v3 appendFormat:@", destinationUri = %@", v4];

  v5 = [(CTLazuliSpamReportInformation *)self spamReportingUri];
  [v3 appendFormat:@", spamReportingUri = %@", v5];

  v6 = [(CTLazuliSpamReportInformation *)self messageIDList];
  [v3 appendFormat:@", messageIDList = %@", v6];

  v7 = [(CTLazuliSpamReportInformation *)self content];
  [v3 appendFormat:@", content = %@", v7];

  int64_t v8 = [(CTLazuliSpamReportInformation *)self spamType];
  int64_t v11 = [(CTLazuliSpamReportInformation *)self spamType];
  [v3 appendFormat:@", spamType = [%ld - %s]", v8, print_CTLazuliSpamReportType(&v11)];
  v9 = [(CTLazuliSpamReportInformation *)self freeBodyText];
  [v3 appendFormat:@", freeBodyText = %@", v9];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSpamReportInformation:(id)a3
{
  id v6 = a3;
  int v7 = [(CTLazuliSpamReportInformation *)self isChatbot];
  if (v7 == [v6 isChatbot])
  {
    v9 = [(CTLazuliSpamReportInformation *)self destinationUri];
    v10 = [v6 destinationUri];
    if (![v9 isEqualToString:v10])
    {
      char v8 = 0;
LABEL_37:

      goto LABEL_38;
    }
    int64_t v11 = [(CTLazuliSpamReportInformation *)self spamReportingUri];
    if (v11 || ([v6 spamReportingUri], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v3 = [(CTLazuliSpamReportInformation *)self spamReportingUri];
      v4 = [v6 spamReportingUri];
      if (![v3 isEqualToString:v4])
      {
        char v8 = 0;
        goto LABEL_33;
      }
      int v26 = 1;
    }
    else
    {
      v25 = 0;
      int v26 = 0;
    }
    v27 = [(CTLazuliSpamReportInformation *)self messageIDList];
    v12 = [v6 messageIDList];
    if (![v27 isEqualToCTLazuliMessageIDList:v12])
    {
      char v8 = 0;
      goto LABEL_32;
    }
    v23 = [(CTLazuliSpamReportInformation *)self content];
    if (v23 || ([v6 content], (v20 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = [(CTLazuliSpamReportInformation *)self content];
      v22 = [v6 content];
      if ((objc_msgSend(v24, "isEqualToString:") & 1) == 0)
      {

        if (!v23) {
        char v8 = 0;
        }
        if ((v26 & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      int v21 = 1;
    }
    else
    {
      v20 = 0;
      int v21 = 0;
    }
    int64_t v13 = [(CTLazuliSpamReportInformation *)self spamType];
    if (v13 == [v6 spamType])
    {
      uint64_t v19 = [(CTLazuliSpamReportInformation *)self freeBodyText];
      if (v19 || ([v6 freeBodyText], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v18 = [(CTLazuliSpamReportInformation *)self freeBodyText];
        v14 = [v6 freeBodyText];
        char v8 = [v18 isEqualToString:v14];

        v15 = (void *)v19;
        if (!v19) {
          v15 = (void *)v17;
        }
      }
      else
      {
        v15 = 0;
        char v8 = 1;
      }

      if ((v21 & 1) == 0) {
        goto LABEL_29;
      }
    }
    else
    {
      char v8 = 0;
      if (!v21)
      {
LABEL_29:
        if (!v23) {

        }
LABEL_32:
        if (!v26)
        {
LABEL_34:
          if (!v11) {

          }
          goto LABEL_37;
        }
LABEL_33:

        goto LABEL_34;
      }
    }

    goto LABEL_29;
  }
  char v8 = 0;
LABEL_38:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSpamReportInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSpamReportInformation *)self isEqualToCTLazuliSpamReportInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSpamReportInformation allocWithZone:a3];
  [(CTLazuliSpamReportInformation *)v4 setIsChatbot:self->_isChatbot];
  [(CTLazuliSpamReportInformation *)v4 setDestinationUri:self->_destinationUri];
  [(CTLazuliSpamReportInformation *)v4 setSpamReportingUri:self->_spamReportingUri];
  [(CTLazuliSpamReportInformation *)v4 setMessageIDList:self->_messageIDList];
  [(CTLazuliSpamReportInformation *)v4 setContent:self->_content];
  [(CTLazuliSpamReportInformation *)v4 setSpamType:self->_spamType];
  [(CTLazuliSpamReportInformation *)v4 setFreeBodyText:self->_freeBodyText];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:self->_isChatbot forKey:@"kIsChatbotKey"];
  [v5 encodeObject:self->_destinationUri forKey:@"kDestinationUriKey"];
  [v5 encodeObject:self->_spamReportingUri forKey:@"kSpamReportingUriKey"];
  [v5 encodeObject:self->_messageIDList forKey:@"kMessageIDListKey"];
  [v5 encodeObject:self->_content forKey:@"kContentKey"];
  v4 = [NSNumber numberWithLong:self->_spamType];
  [v5 encodeObject:v4 forKey:@"kSpamTypeKey"];

  [v5 encodeObject:self->_freeBodyText forKey:@"kFreeBodyTextKey"];
}

- (CTLazuliSpamReportInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CTLazuliSpamReportInformation;
  id v5 = [(CTLazuliSpamReportInformation *)&v18 init];
  if (v5)
  {
    v5->_isChatbot = [v4 decodeBoolForKey:@"kIsChatbotKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDestinationUriKey"];
    destinationUri = v5->_destinationUri;
    v5->_destinationUri = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSpamReportingUriKey"];
    spamReportingUri = v5->_spamReportingUri;
    v5->_spamReportingUri = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessageIDListKey"];
    messageIDList = v5->_messageIDList;
    v5->_messageIDList = (CTLazuliMessageIDList *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentKey"];
    content = v5->_content;
    v5->_content = (NSString *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSpamTypeKey"];
    v5->_spamType = [v14 longValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFreeBodyTextKey"];
    freeBodyText = v5->_freeBodyText;
    v5->_freeBodyText = (NSString *)v15;
  }
  return v5;
}

- (CTLazuliSpamReportInformation)initWithReflection:(const void *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CTLazuliSpamReportInformation;
  id v4 = [(CTLazuliSpamReportInformation *)&v24 init];
  id v5 = v4;
  if (v4)
  {
    v4->_isChatbot = *(unsigned char *)a3;
    if (*((char *)a3 + 31) >= 0) {
      uint64_t v6 = (char *)a3 + 8;
    }
    else {
      uint64_t v6 = (char *)*((void *)a3 + 1);
    }
    uint64_t v7 = [NSString stringWithUTF8String:v6];
    destinationUri = v5->_destinationUri;
    v5->_destinationUri = (NSString *)v7;

    if (*((unsigned char *)a3 + 56))
    {
      if (*((char *)a3 + 55) >= 0) {
        v9 = (char *)a3 + 32;
      }
      else {
        v9 = (char *)*((void *)a3 + 4);
      }
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      spamReportingUri = v5->_spamReportingUri;
      v5->_spamReportingUri = (NSString *)v10;
    }
    else
    {
      spamReportingUri = v5->_spamReportingUri;
      v5->_spamReportingUri = 0;
    }

    uint64_t v12 = [[CTLazuliMessageIDList alloc] initWithReflection:(char *)a3 + 64];
    messageIDList = v5->_messageIDList;
    v5->_messageIDList = v12;

    if (*((unsigned char *)a3 + 112))
    {
      if (*((char *)a3 + 111) >= 0) {
        v14 = (char *)a3 + 88;
      }
      else {
        v14 = (char *)*((void *)a3 + 11);
      }
      uint64_t v15 = [NSString stringWithUTF8String:v14];
      content = v5->_content;
      v5->_content = (NSString *)v15;
    }
    else
    {
      content = v5->_content;
      v5->_content = 0;
    }

    v5->_spamType = encode_CTLazuliSpamReportType((unsigned int *)a3 + 30);
    if (*((unsigned char *)a3 + 152))
    {
      uint64_t v19 = (char *)*((void *)a3 + 16);
      objc_super v18 = (char *)a3 + 128;
      uint64_t v17 = v19;
      if (v18[23] >= 0) {
        v20 = v18;
      }
      else {
        v20 = v17;
      }
      uint64_t v21 = [NSString stringWithUTF8String:v20];
      freeBodyText = v5->_freeBodyText;
      v5->_freeBodyText = (NSString *)v21;
    }
    else
    {
      freeBodyText = v5->_freeBodyText;
      v5->_freeBodyText = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isChatbot
{
  return self->_isChatbot;
}

- (void)setIsChatbot:(BOOL)a3
{
  self->_isChatbot = a3;
}

- (NSString)destinationUri
{
  return self->_destinationUri;
}

- (void)setDestinationUri:(id)a3
{
}

- (NSString)spamReportingUri
{
  return self->_spamReportingUri;
}

- (void)setSpamReportingUri:(id)a3
{
}

- (CTLazuliMessageIDList)messageIDList
{
  return self->_messageIDList;
}

- (void)setMessageIDList:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
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
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_messageIDList, 0);
  objc_storeStrong((id *)&self->_spamReportingUri, 0);

  objc_storeStrong((id *)&self->_destinationUri, 0);
}

@end