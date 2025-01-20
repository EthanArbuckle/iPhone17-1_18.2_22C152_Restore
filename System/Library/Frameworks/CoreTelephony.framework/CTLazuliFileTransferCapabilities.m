@interface CTLazuliFileTransferCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)autoAccept;
- (BOOL)httpFallback;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliFileTransferCapabilities:(id)a3;
- (CTLazuliFileTransferCapabilities)initWithCoder:(id)a3;
- (CTLazuliFileTransferCapabilities)initWithReflection:(const void *)a3;
- (NSNumber)max1ToManyRecipients;
- (NSNumber)maxTransferSize;
- (NSNumber)warnSize;
- (NSString)password;
- (NSString)userName;
- (NSURL)contentServerDownloadUrl;
- (NSURL)contentServerUploadUrl;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAccept:(BOOL)a3;
- (void)setContentServerDownloadUrl:(id)a3;
- (void)setContentServerUploadUrl:(id)a3;
- (void)setHttpFallback:(BOOL)a3;
- (void)setMax1ToManyRecipients:(id)a3;
- (void)setMaxTransferSize:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserName:(id)a3;
- (void)setWarnSize:(id)a3;
@end

@implementation CTLazuliFileTransferCapabilities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliFileTransferCapabilities *)self url];
  [v3 appendFormat:@", url = %@", v4];

  v5 = [(CTLazuliFileTransferCapabilities *)self contentServerUploadUrl];
  [v3 appendFormat:@", contentServerUploadUrl = %@", v5];

  v6 = [(CTLazuliFileTransferCapabilities *)self contentServerDownloadUrl];
  [v3 appendFormat:@", contentServerDownloadUrl = %@", v6];

  v7 = [(CTLazuliFileTransferCapabilities *)self userName];
  [v3 appendFormat:@", userName = %@", v7];

  v8 = [(CTLazuliFileTransferCapabilities *)self password];
  [v3 appendFormat:@", password = %@", v8];

  v9 = [(CTLazuliFileTransferCapabilities *)self max1ToManyRecipients];
  [v3 appendFormat:@", max1ToManyRecipients = %@", v9];

  v10 = [(CTLazuliFileTransferCapabilities *)self maxTransferSize];
  [v3 appendFormat:@", maxTransferSize = %@", v10];

  [v3 appendFormat:@", autoAccept = %d", -[CTLazuliFileTransferCapabilities autoAccept](self, "autoAccept")];
  [v3 appendFormat:@", httpFallback = %d", -[CTLazuliFileTransferCapabilities httpFallback](self, "httpFallback")];
  v11 = [(CTLazuliFileTransferCapabilities *)self warnSize];
  [v3 appendFormat:@", warnSize = %@", v11];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliFileTransferCapabilities:(id)a3
{
  id v8 = a3;
  v9 = [(CTLazuliFileTransferCapabilities *)self url];
  if (v9 || ([v8 url], (v52 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliFileTransferCapabilities *)self url];
    v4 = [v8 url];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      BOOL v10 = 0;
      goto LABEL_78;
    }
    int v53 = 1;
  }
  else
  {
    v52 = 0;
    int v53 = 0;
  }
  v11 = [(CTLazuliFileTransferCapabilities *)self contentServerUploadUrl];
  if (v11 || ([v8 contentServerUploadUrl], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = [(CTLazuliFileTransferCapabilities *)self contentServerUploadUrl];
    v6 = [v8 contentServerUploadUrl];
    if (([v5 isEqual:v6] & 1) == 0)
    {

      if (v11) {
      else
      }

      BOOL v10 = 0;
      if ((v53 & 1) == 0) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
    int v50 = 1;
  }
  else
  {
    v48 = 0;
    int v50 = 0;
  }
  v12 = [(CTLazuliFileTransferCapabilities *)self contentServerDownloadUrl];
  if (v12 || ([v8 contentServerDownloadUrl], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v51 = [(CTLazuliFileTransferCapabilities *)self contentServerDownloadUrl];
    v49 = [v8 contentServerDownloadUrl];
    if (!objc_msgSend(v51, "isEqual:"))
    {
      BOOL v10 = 0;
LABEL_69:

      goto LABEL_70;
    }
    int v45 = 1;
  }
  else
  {
    v43 = 0;
    int v45 = 0;
  }
  v46 = [(CTLazuliFileTransferCapabilities *)self userName];
  if (v46 || ([v8 userName], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v47 = [(CTLazuliFileTransferCapabilities *)self userName];
    v44 = [v8 userName];
    if (!objc_msgSend(v47, "isEqualToString:"))
    {
      BOOL v10 = 0;
LABEL_65:

      goto LABEL_66;
    }
    int v40 = 1;
  }
  else
  {
    v38 = 0;
    int v40 = 0;
  }
  v41 = [(CTLazuliFileTransferCapabilities *)self password];
  if (v41 || ([v8 password], (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v42 = [(CTLazuliFileTransferCapabilities *)self password];
    v39 = [v8 password];
    if (!objc_msgSend(v42, "isEqualToString:"))
    {
      BOOL v10 = 0;
LABEL_61:

      goto LABEL_62;
    }
    int v36 = 1;
  }
  else
  {
    v33 = 0;
    int v36 = 0;
  }
  v37 = [(CTLazuliFileTransferCapabilities *)self max1ToManyRecipients];
  if (v37 || ([v8 max1ToManyRecipients], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v35 = [(CTLazuliFileTransferCapabilities *)self max1ToManyRecipients];
    uint64_t v13 = [v35 longValue];
    v34 = [v8 max1ToManyRecipients];
    if (v13 != [v34 longValue])
    {
      BOOL v10 = 0;
LABEL_57:

      goto LABEL_58;
    }
    int v31 = 1;
  }
  else
  {
    v28 = 0;
    int v31 = 0;
  }
  v32 = [(CTLazuliFileTransferCapabilities *)self maxTransferSize];
  if (v32 || ([v8 maxTransferSize], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = [(CTLazuliFileTransferCapabilities *)self maxTransferSize];
    uint64_t v14 = [v30 longValue];
    v29 = [v8 maxTransferSize];
    if (v14 != [v29 longValue])
    {

      v15 = v32;
      if (!v32) {
        v15 = v26;
      }

      BOOL v10 = 0;
      if (v31) {
        goto LABEL_57;
      }
      goto LABEL_58;
    }
    int v27 = 1;
  }
  else
  {
    v26 = 0;
    int v27 = 0;
  }
  int v16 = [(CTLazuliFileTransferCapabilities *)self autoAccept];
  if (v16 != [v8 autoAccept]
    || (int v17 = [(CTLazuliFileTransferCapabilities *)self httpFallback],
        v17 != [v8 httpFallback]))
  {
    BOOL v10 = 0;
    if (!v27) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
  uint64_t v25 = [(CTLazuliFileTransferCapabilities *)self warnSize];
  if (v25 || ([v8 warnSize], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = [(CTLazuliFileTransferCapabilities *)self warnSize];
    uint64_t v19 = [v24 longValue];
    v20 = [v8 warnSize];
    BOOL v10 = v19 == [v20 longValue];

    v21 = (void *)v25;
    if (!v25) {
      v21 = v23;
    }
  }
  else
  {
    v21 = 0;
    BOOL v10 = 1;
  }

  if (v27)
  {
LABEL_53:
  }
LABEL_54:
  if (!v32) {

  }
  if (v31) {
    goto LABEL_57;
  }
LABEL_58:
  if (!v37) {

  }
  if (v36) {
    goto LABEL_61;
  }
LABEL_62:
  if (!v41) {

  }
  if (v40) {
    goto LABEL_65;
  }
LABEL_66:
  if (!v46) {

  }
  if (v45) {
    goto LABEL_69;
  }
LABEL_70:
  if (!v12) {

  }
  if (v50)
  {
  }
  if (!v11) {

  }
  if (v53)
  {
LABEL_77:
  }
LABEL_78:
  if (!v9) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliFileTransferCapabilities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliFileTransferCapabilities *)self isEqualToCTLazuliFileTransferCapabilities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliFileTransferCapabilities allocWithZone:a3];
  [(CTLazuliFileTransferCapabilities *)v4 setUrl:self->_url];
  [(CTLazuliFileTransferCapabilities *)v4 setContentServerUploadUrl:self->_contentServerUploadUrl];
  [(CTLazuliFileTransferCapabilities *)v4 setContentServerDownloadUrl:self->_contentServerDownloadUrl];
  [(CTLazuliFileTransferCapabilities *)v4 setUserName:self->_userName];
  [(CTLazuliFileTransferCapabilities *)v4 setPassword:self->_password];
  [(CTLazuliFileTransferCapabilities *)v4 setMax1ToManyRecipients:self->_max1ToManyRecipients];
  [(CTLazuliFileTransferCapabilities *)v4 setMaxTransferSize:self->_maxTransferSize];
  [(CTLazuliFileTransferCapabilities *)v4 setAutoAccept:self->_autoAccept];
  [(CTLazuliFileTransferCapabilities *)v4 setHttpFallback:self->_httpFallback];
  [(CTLazuliFileTransferCapabilities *)v4 setWarnSize:self->_warnSize];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_url forKey:@"kUrlKey"];
  [v4 encodeObject:self->_contentServerUploadUrl forKey:@"kContentServerUploadUrlKey"];
  [v4 encodeObject:self->_contentServerDownloadUrl forKey:@"kContentServerDownloadUrlKey"];
  [v4 encodeObject:self->_userName forKey:@"kUserNameKey"];
  [v4 encodeObject:self->_password forKey:@"kPasswordKey"];
  [v4 encodeObject:self->_max1ToManyRecipients forKey:@"kMax1ToManyRecipientsKey"];
  [v4 encodeObject:self->_maxTransferSize forKey:@"kMaxTransferSizeKey"];
  [v4 encodeBool:self->_autoAccept forKey:@"kAutoAcceptKey"];
  [v4 encodeBool:self->_httpFallback forKey:@"kHttpFallbackKey"];
  [v4 encodeObject:self->_warnSize forKey:@"kWarnSizeKey"];
}

- (CTLazuliFileTransferCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTLazuliFileTransferCapabilities;
  v5 = [(CTLazuliFileTransferCapabilities *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUrlKey"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentServerUploadUrlKey"];
    contentServerUploadUrl = v5->_contentServerUploadUrl;
    v5->_contentServerUploadUrl = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentServerDownloadUrlKey"];
    contentServerDownloadUrl = v5->_contentServerDownloadUrl;
    v5->_contentServerDownloadUrl = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUserNameKey"];
    userName = v5->_userName;
    v5->_userName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kPasswordKey"];
    password = v5->_password;
    v5->_password = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMax1ToManyRecipientsKey"];
    max1ToManyRecipients = v5->_max1ToManyRecipients;
    v5->_max1ToManyRecipients = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMaxTransferSizeKey"];
    maxTransferSize = v5->_maxTransferSize;
    v5->_maxTransferSize = (NSNumber *)v18;

    v5->_autoAccept = [v4 decodeBoolForKey:@"kAutoAcceptKey"];
    v5->_httpFallback = [v4 decodeBoolForKey:@"kHttpFallbackKey"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kWarnSizeKey"];
    warnSize = v5->_warnSize;
    v5->_warnSize = (NSNumber *)v20;
  }
  return v5;
}

- (CTLazuliFileTransferCapabilities)initWithReflection:(const void *)a3
{
  v46.receiver = self;
  v46.super_class = (Class)CTLazuliFileTransferCapabilities;
  id v4 = [(CTLazuliFileTransferCapabilities *)&v46 init];
  v5 = v4;
  if (v4)
  {
    if (*((unsigned char *)a3 + 24))
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
      v7 = NSString;
      int v8 = *((char *)a3 + 23);
      v9 = *(const void **)a3;
      uint64_t v10 = [NSString defaultCStringEncoding];
      if (v8 >= 0) {
        v11 = a3;
      }
      else {
        v11 = v9;
      }
      uint64_t v12 = [v7 stringWithCString:v11 encoding:v10];
      uint64_t v13 = [v6 URLWithString:v12];
      url = v5->_url;
      v5->_url = (NSURL *)v13;
    }
    else
    {
      uint64_t v12 = v4->_url;
      v4->_url = 0;
    }

    if (*((unsigned char *)a3 + 56))
    {
      v15 = (char *)*((void *)a3 + 4);
      uint64_t v16 = (void *)MEMORY[0x1E4F1CB10];
      int v17 = NSString;
      int v18 = *((char *)a3 + 55);
      uint64_t v19 = [NSString defaultCStringEncoding];
      if (v18 >= 0) {
        uint64_t v20 = (char *)a3 + 32;
      }
      else {
        uint64_t v20 = v15;
      }
      v21 = [v17 stringWithCString:v20 encoding:v19];
      uint64_t v22 = [v16 URLWithString:v21];
      contentServerUploadUrl = v5->_contentServerUploadUrl;
      v5->_contentServerUploadUrl = (NSURL *)v22;
    }
    else
    {
      v21 = v5->_contentServerUploadUrl;
      v5->_contentServerUploadUrl = 0;
    }

    if (*((unsigned char *)a3 + 88))
    {
      v24 = (char *)*((void *)a3 + 8);
      uint64_t v25 = (void *)MEMORY[0x1E4F1CB10];
      v26 = NSString;
      int v27 = *((char *)a3 + 87);
      uint64_t v28 = [NSString defaultCStringEncoding];
      if (v27 >= 0) {
        v29 = (char *)a3 + 64;
      }
      else {
        v29 = v24;
      }
      v30 = [v26 stringWithCString:v29 encoding:v28];
      uint64_t v31 = [v25 URLWithString:v30];
      contentServerDownloadUrl = v5->_contentServerDownloadUrl;
      v5->_contentServerDownloadUrl = (NSURL *)v31;
    }
    else
    {
      v30 = v5->_contentServerDownloadUrl;
      v5->_contentServerDownloadUrl = 0;
    }

    if (*((unsigned char *)a3 + 120))
    {
      if (*((char *)a3 + 119) >= 0) {
        v33 = (char *)a3 + 96;
      }
      else {
        v33 = (char *)*((void *)a3 + 12);
      }
      uint64_t v34 = [NSString stringWithUTF8String:v33];
      userName = v5->_userName;
      v5->_userName = (NSString *)v34;
    }
    else
    {
      userName = v5->_userName;
      v5->_userName = 0;
    }

    if (*((unsigned char *)a3 + 152))
    {
      if (*((char *)a3 + 151) >= 0) {
        int v36 = (char *)a3 + 128;
      }
      else {
        int v36 = (char *)*((void *)a3 + 16);
      }
      uint64_t v37 = [NSString stringWithUTF8String:v36];
      password = v5->_password;
      v5->_password = (NSString *)v37;
    }
    else
    {
      password = v5->_password;
      v5->_password = 0;
    }

    if (*((unsigned char *)a3 + 168))
    {
      uint64_t v39 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 20)];
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = (NSNumber *)v39;
    }
    else
    {
      max1ToManyRecipients = v5->_max1ToManyRecipients;
      v5->_max1ToManyRecipients = 0;
    }

    if (*((unsigned char *)a3 + 184))
    {
      uint64_t v41 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 22)];
      maxTransferSize = v5->_maxTransferSize;
      v5->_maxTransferSize = (NSNumber *)v41;
    }
    else
    {
      maxTransferSize = v5->_maxTransferSize;
      v5->_maxTransferSize = 0;
    }

    v5->_autoAccept = *((unsigned char *)a3 + 192);
    v5->_httpFallback = *((unsigned char *)a3 + 193);
    if (*((unsigned char *)a3 + 208))
    {
      uint64_t v43 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 25)];
      warnSize = v5->_warnSize;
      v5->_warnSize = (NSNumber *)v43;
    }
    else
    {
      warnSize = v5->_warnSize;
      v5->_warnSize = 0;
    }
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)contentServerUploadUrl
{
  return self->_contentServerUploadUrl;
}

- (void)setContentServerUploadUrl:(id)a3
{
}

- (NSURL)contentServerDownloadUrl
{
  return self->_contentServerDownloadUrl;
}

- (void)setContentServerDownloadUrl:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSNumber)max1ToManyRecipients
{
  return self->_max1ToManyRecipients;
}

- (void)setMax1ToManyRecipients:(id)a3
{
}

- (NSNumber)maxTransferSize
{
  return self->_maxTransferSize;
}

- (void)setMaxTransferSize:(id)a3
{
}

- (BOOL)autoAccept
{
  return self->_autoAccept;
}

- (void)setAutoAccept:(BOOL)a3
{
  self->_autoAccept = a3;
}

- (BOOL)httpFallback
{
  return self->_httpFallback;
}

- (void)setHttpFallback:(BOOL)a3
{
  self->_httpFallback = a3;
}

- (NSNumber)warnSize
{
  return self->_warnSize;
}

- (void)setWarnSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warnSize, 0);
  objc_storeStrong((id *)&self->_maxTransferSize, 0);
  objc_storeStrong((id *)&self->_max1ToManyRecipients, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_contentServerDownloadUrl, 0);
  objc_storeStrong((id *)&self->_contentServerUploadUrl, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end