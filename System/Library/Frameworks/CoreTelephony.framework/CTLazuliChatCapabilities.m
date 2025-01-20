@interface CTLazuliChatCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)autoAcceptChat;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatCapabilities:(id)a3;
- (CTLazuliChatCapabilities)initWithCoder:(id)a3;
- (CTLazuliChatCapabilities)initWithReflection:(const void *)a3;
- (NSNumber)max1ToManyRecipients;
- (NSNumber)revokeTimer;
- (NSString)spamReportingUri;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAcceptChat:(BOOL)a3;
- (void)setMax1ToManyRecipients:(id)a3;
- (void)setRevokeTimer:(id)a3;
- (void)setSpamReportingUri:(id)a3;
@end

@implementation CTLazuliChatCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  [v3 appendFormat:@", autoAcceptChat = %d", -[CTLazuliChatCapabilities autoAcceptChat](self, "autoAcceptChat")];
  v4 = [(CTLazuliChatCapabilities *)self max1ToManyRecipients];
  [v3 appendFormat:@", max1ToManyRecipients = %@", v4];

  v5 = [(CTLazuliChatCapabilities *)self revokeTimer];
  [v3 appendFormat:@", revokeTimer = %@", v5];

  v6 = [(CTLazuliChatCapabilities *)self spamReportingUri];
  [v3 appendFormat:@", spamReportingUri = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatCapabilities:(id)a3
{
  id v7 = a3;
  int v8 = [(CTLazuliChatCapabilities *)self autoAcceptChat];
  if (v8 != [v7 autoAcceptChat])
  {
    char v9 = 0;
    goto LABEL_27;
  }
  v10 = [(CTLazuliChatCapabilities *)self max1ToManyRecipients];
  if (!v10)
  {
    v23 = [v7 max1ToManyRecipients];
    if (!v23)
    {
      v23 = 0;
      int v24 = 0;
      goto LABEL_9;
    }
  }
  v25 = [(CTLazuliChatCapabilities *)self max1ToManyRecipients];
  uint64_t v11 = [v25 longValue];
  v3 = [v7 max1ToManyRecipients];
  if (v11 == [v3 longValue])
  {
    int v24 = 1;
LABEL_9:
    v12 = [(CTLazuliChatCapabilities *)self revokeTimer];
    if (v12 || ([v7 revokeTimer], (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = [(CTLazuliChatCapabilities *)self revokeTimer];
      uint64_t v13 = [v4 longValue];
      v5 = [v7 revokeTimer];
      if (v13 != [v5 longValue])
      {
        char v9 = 0;
        goto LABEL_19;
      }
      int v22 = 1;
    }
    else
    {
      v21 = 0;
      int v22 = 0;
    }
    v14 = [(CTLazuliChatCapabilities *)self spamReportingUri];
    if (v14 || ([v7 spamReportingUri], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = [(CTLazuliChatCapabilities *)self spamReportingUri];
      v16 = [v7 spamReportingUri];
      char v9 = [v15 isEqualToString:v16];

      if (v14)
      {

        if (!v22)
        {
LABEL_20:
          if (!v12) {

          }
          if (v24)
          {
          }
          goto LABEL_24;
        }
LABEL_19:

        goto LABEL_20;
      }
      v18 = v20;
    }
    else
    {
      v18 = 0;
      char v9 = 1;
    }

    if ((v22 & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  char v9 = 0;
LABEL_24:
  if (!v10) {

  }
LABEL_27:
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliChatCapabilities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatCapabilities *)self isEqualToCTLazuliChatCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliChatCapabilities allocWithZone:a3];
  [(CTLazuliChatCapabilities *)v4 setAutoAcceptChat:self->_autoAcceptChat];
  [(CTLazuliChatCapabilities *)v4 setMax1ToManyRecipients:self->_max1ToManyRecipients];
  [(CTLazuliChatCapabilities *)v4 setRevokeTimer:self->_revokeTimer];
  [(CTLazuliChatCapabilities *)v4 setSpamReportingUri:self->_spamReportingUri];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->_autoAcceptChat forKey:@"kAutoAcceptChatKey"];
  [v4 encodeObject:self->_max1ToManyRecipients forKey:@"kMax1ToManyRecipientsKey"];
  [v4 encodeObject:self->_revokeTimer forKey:@"kRevokeTimerKey"];
  [v4 encodeObject:self->_spamReportingUri forKey:@"kSpamReportingUriKey"];
}

- (CTLazuliChatCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliChatCapabilities;
  v5 = [(CTLazuliChatCapabilities *)&v13 init];
  if (v5)
  {
    v5->_autoAcceptChat = [v4 decodeBoolForKey:@"kAutoAcceptChatKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMax1ToManyRecipientsKey"];
    max1ToManyRecipients = v5->_max1ToManyRecipients;
    v5->_max1ToManyRecipients = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRevokeTimerKey"];
    revokeTimer = v5->_revokeTimer;
    v5->_revokeTimer = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSpamReportingUriKey"];
    spamReportingUri = v5->_spamReportingUri;
    v5->_spamReportingUri = (NSString *)v10;
  }
  return v5;
}

- (CTLazuliChatCapabilities)initWithReflection:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliChatCapabilities;
  id v4 = [(CTLazuliChatCapabilities *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_autoAcceptChat = *(unsigned char *)a3;
    if (*((unsigned char *)a3 + 16))
    {
      uint64_t v6 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 1)];
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = (NSNumber *)v6;
    }
    else
    {
      max1ToManyRecipients = v4->_max1ToManyRecipients;
      v4->_max1ToManyRecipients = 0;
    }

    if (*((unsigned char *)a3 + 32))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 3)];
      revokeTimer = v5->_revokeTimer;
      v5->_revokeTimer = (NSNumber *)v8;
    }
    else
    {
      revokeTimer = v5->_revokeTimer;
      v5->_revokeTimer = 0;
    }

    if (*((unsigned char *)a3 + 64))
    {
      v12 = (char *)*((void *)a3 + 5);
      uint64_t v11 = (char *)a3 + 40;
      uint64_t v10 = v12;
      if (v11[23] >= 0) {
        objc_super v13 = v11;
      }
      else {
        objc_super v13 = v10;
      }
      uint64_t v14 = [NSString stringWithUTF8String:v13];
      spamReportingUri = v5->_spamReportingUri;
      v5->_spamReportingUri = (NSString *)v14;
    }
    else
    {
      spamReportingUri = v5->_spamReportingUri;
      v5->_spamReportingUri = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)autoAcceptChat
{
  return self->_autoAcceptChat;
}

- (void)setAutoAcceptChat:(BOOL)a3
{
  self->_autoAcceptChat = a3;
}

- (NSNumber)max1ToManyRecipients
{
  return self->_max1ToManyRecipients;
}

- (void)setMax1ToManyRecipients:(id)a3
{
}

- (NSNumber)revokeTimer
{
  return self->_revokeTimer;
}

- (void)setRevokeTimer:(id)a3
{
}

- (NSString)spamReportingUri
{
  return self->_spamReportingUri;
}

- (void)setSpamReportingUri:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spamReportingUri, 0);
  objc_storeStrong((id *)&self->_revokeTimer, 0);

  objc_storeStrong((id *)&self->_max1ToManyRecipients, 0);
}

@end