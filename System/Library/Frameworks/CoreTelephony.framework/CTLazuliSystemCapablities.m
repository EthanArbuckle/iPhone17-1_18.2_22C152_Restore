@interface CTLazuliSystemCapablities
+ (BOOL)supportsSecureCoding;
- (BOOL)autoAcceptChat;
- (BOOL)autoAcceptGroupChat;
- (BOOL)fileTransferAutoAccept;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSystemCapablities:(id)a3;
- (CTLazuliSystemCapablities)initWithCoder:(id)a3;
- (CTLazuliSystemCapablities)initWithReflection:(const void *)a3;
- (NSNumber)fileTransferMaxRecipients;
- (NSNumber)maxFileTransferSize;
- (NSNumber)maxGroupSize;
- (NSURL)exploderUri;
- (NSURL)fileTransferUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoAcceptChat:(BOOL)a3;
- (void)setAutoAcceptGroupChat:(BOOL)a3;
- (void)setExploderUri:(id)a3;
- (void)setFileTransferAutoAccept:(BOOL)a3;
- (void)setFileTransferMaxRecipients:(id)a3;
- (void)setFileTransferUrl:(id)a3;
- (void)setMaxFileTransferSize:(id)a3;
- (void)setMaxGroupSize:(id)a3;
@end

@implementation CTLazuliSystemCapablities

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSystemCapablities *)self exploderUri];
  [v3 appendFormat:@", exploderUri = %@", v4];

  [v3 appendFormat:@", autoAcceptChat = %d", -[CTLazuliSystemCapablities autoAcceptChat](self, "autoAcceptChat")];
  [v3 appendFormat:@", autoAcceptGroupChat = %d", -[CTLazuliSystemCapablities autoAcceptGroupChat](self, "autoAcceptGroupChat")];
  v5 = [(CTLazuliSystemCapablities *)self maxGroupSize];
  [v3 appendFormat:@", maxGroupSize = %@", v5];

  v6 = [(CTLazuliSystemCapablities *)self fileTransferUrl];
  [v3 appendFormat:@", fileTransferUrl = %@", v6];

  v7 = [(CTLazuliSystemCapablities *)self fileTransferMaxRecipients];
  [v3 appendFormat:@", fileTransferMaxRecipients = %@", v7];

  v8 = [(CTLazuliSystemCapablities *)self maxFileTransferSize];
  [v3 appendFormat:@", maxFileTransferSize = %@", v8];

  [v3 appendFormat:@", fileTransferAutoAccept = %d", -[CTLazuliSystemCapablities fileTransferAutoAccept](self, "fileTransferAutoAccept")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSystemCapablities:(id)a3
{
  id v8 = a3;
  v9 = [(CTLazuliSystemCapablities *)self exploderUri];
  if (v9 || ([v8 exploderUri], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = [(CTLazuliSystemCapablities *)self exploderUri];
    v5 = [v8 exploderUri];
    if (![v4 isEqual:v5])
    {
      LOBYTE(v11) = 0;
LABEL_10:

      goto LABEL_11;
    }
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
  }
  int v12 = [(CTLazuliSystemCapablities *)self autoAcceptChat];
  if (v12 != [v8 autoAcceptChat]
    || (int v13 = [(CTLazuliSystemCapablities *)self autoAcceptGroupChat],
        v13 != [v8 autoAcceptGroupChat]))
  {
    LOBYTE(v11) = 0;
    if (!v10) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v15 = [(CTLazuliSystemCapablities *)self maxGroupSize];
  if (v15 || ([v8 maxGroupSize], (v32 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = [(CTLazuliSystemCapablities *)self maxGroupSize];
    uint64_t v16 = [v38 longValue];
    v37 = [v8 maxGroupSize];
    if (v16 != [v37 longValue])
    {
      LOBYTE(v11) = 0;
      goto LABEL_48;
    }
    int v34 = 1;
  }
  else
  {
    v32 = 0;
    int v34 = 0;
  }
  v35 = [(CTLazuliSystemCapablities *)self fileTransferUrl];
  if (v35 || ([v8 fileTransferUrl], (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = [(CTLazuliSystemCapablities *)self fileTransferUrl];
    v33 = [v8 fileTransferUrl];
    if (!objc_msgSend(v36, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_45;
    }
    int v30 = 1;
  }
  else
  {
    v27 = 0;
    int v30 = 0;
  }
  v31 = [(CTLazuliSystemCapablities *)self fileTransferMaxRecipients];
  if (v31
    || ([v8 fileTransferMaxRecipients], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = [(CTLazuliSystemCapablities *)self fileTransferMaxRecipients];
    uint64_t v17 = [v28 longValue];
    v29 = [v8 fileTransferMaxRecipients];
    if (v17 != [v29 longValue])
    {
      LOBYTE(v11) = 0;
      v18 = v29;
      goto LABEL_42;
    }
    int v25 = 1;
  }
  else
  {
    v23 = 0;
    int v25 = 0;
  }
  v26 = [(CTLazuliSystemCapablities *)self maxFileTransferSize];
  if (!v26)
  {
    v22 = [v8 maxFileTransferSize];
    if (!v22)
    {
      v22 = 0;
      int v20 = 0;
LABEL_38:
      BOOL v21 = [(CTLazuliSystemCapablities *)self fileTransferAutoAccept];
      int v11 = v21 ^ [v8 fileTransferAutoAccept] ^ 1;
      if (!v20) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  v24 = [(CTLazuliSystemCapablities *)self maxFileTransferSize];
  uint64_t v19 = [v24 longValue];
  v6 = [v8 maxFileTransferSize];
  if (v19 == [v6 longValue])
  {
    int v20 = 1;
    goto LABEL_38;
  }
  LOBYTE(v11) = 0;
LABEL_39:

LABEL_40:
  v18 = v29;
  if (v26)
  {

    if (!v25) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }

  if (v25)
  {
LABEL_42:
  }
LABEL_43:
  if (v31)
  {

    if (!v30) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }

  if (v30)
  {
LABEL_45:
  }
LABEL_46:
  if (v35)
  {

    if (!v34) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  if (v34)
  {
LABEL_48:
  }
LABEL_49:
  if (!v15) {

  }
  if (v10) {
    goto LABEL_10;
  }
LABEL_11:
  if (!v9) {

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSystemCapablities *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSystemCapablities *)self isEqualToCTLazuliSystemCapablities:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSystemCapablities allocWithZone:a3];
  [(CTLazuliSystemCapablities *)v4 setExploderUri:self->_exploderUri];
  [(CTLazuliSystemCapablities *)v4 setAutoAcceptChat:self->_autoAcceptChat];
  [(CTLazuliSystemCapablities *)v4 setAutoAcceptGroupChat:self->_autoAcceptGroupChat];
  [(CTLazuliSystemCapablities *)v4 setMaxGroupSize:self->_maxGroupSize];
  [(CTLazuliSystemCapablities *)v4 setFileTransferUrl:self->_fileTransferUrl];
  [(CTLazuliSystemCapablities *)v4 setFileTransferMaxRecipients:self->_fileTransferMaxRecipients];
  [(CTLazuliSystemCapablities *)v4 setMaxFileTransferSize:self->_maxFileTransferSize];
  [(CTLazuliSystemCapablities *)v4 setFileTransferAutoAccept:self->_fileTransferAutoAccept];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_exploderUri forKey:@"kExploderUriKey"];
  [v4 encodeBool:self->_autoAcceptChat forKey:@"kAutoAcceptChatKey"];
  [v4 encodeBool:self->_autoAcceptGroupChat forKey:@"kAutoAcceptGroupChatKey"];
  [v4 encodeObject:self->_maxGroupSize forKey:@"kMaxGroupSizeKey"];
  [v4 encodeObject:self->_fileTransferUrl forKey:@"kFileTransferUrlKey"];
  [v4 encodeObject:self->_fileTransferMaxRecipients forKey:@"kFileTransferMaxRecipientsKey"];
  [v4 encodeObject:self->_maxFileTransferSize forKey:@"kMaxFileTransferSizeKey"];
  [v4 encodeBool:self->_fileTransferAutoAccept forKey:@"kFileTransferAutoAcceptKey"];
}

- (CTLazuliSystemCapablities)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliSystemCapablities;
  v5 = [(CTLazuliSystemCapablities *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kExploderUriKey"];
    exploderUri = v5->_exploderUri;
    v5->_exploderUri = (NSURL *)v6;

    v5->_autoAcceptChat = [v4 decodeBoolForKey:@"kAutoAcceptChatKey"];
    v5->_autoAcceptGroupChat = [v4 decodeBoolForKey:@"kAutoAcceptGroupChatKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMaxGroupSizeKey"];
    maxGroupSize = v5->_maxGroupSize;
    v5->_maxGroupSize = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileTransferUrlKey"];
    fileTransferUrl = v5->_fileTransferUrl;
    v5->_fileTransferUrl = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileTransferMaxRecipientsKey"];
    fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
    v5->_fileTransferMaxRecipients = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMaxFileTransferSizeKey"];
    maxFileTransferSize = v5->_maxFileTransferSize;
    v5->_maxFileTransferSize = (NSNumber *)v14;

    v5->_fileTransferAutoAccept = [v4 decodeBoolForKey:@"kFileTransferAutoAcceptKey"];
  }

  return v5;
}

- (CTLazuliSystemCapablities)initWithReflection:(const void *)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CTLazuliSystemCapablities;
  id v4 = [(CTLazuliSystemCapablities *)&v31 init];
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
        int v11 = a3;
      }
      else {
        int v11 = v9;
      }
      uint64_t v12 = [v7 stringWithCString:v11 encoding:v10];
      uint64_t v13 = [v6 URLWithString:v12];
      exploderUri = v5->_exploderUri;
      v5->_exploderUri = (NSURL *)v13;
    }
    else
    {
      uint64_t v12 = v4->_exploderUri;
      v4->_exploderUri = 0;
    }

    v5->_autoAcceptChat = *((unsigned char *)a3 + 32);
    v5->_autoAcceptGroupChat = *((unsigned char *)a3 + 33);
    if (*((unsigned char *)a3 + 48))
    {
      uint64_t v15 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 5)];
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = (NSNumber *)v15;
    }
    else
    {
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = 0;
    }

    if (*((unsigned char *)a3 + 80))
    {
      objc_super v17 = (char *)*((void *)a3 + 7);
      v18 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v19 = NSString;
      int v20 = *((char *)a3 + 79);
      uint64_t v21 = [NSString defaultCStringEncoding];
      if (v20 >= 0) {
        v22 = (char *)a3 + 56;
      }
      else {
        v22 = v17;
      }
      v23 = [v19 stringWithCString:v22 encoding:v21];
      uint64_t v24 = [v18 URLWithString:v23];
      fileTransferUrl = v5->_fileTransferUrl;
      v5->_fileTransferUrl = (NSURL *)v24;
    }
    else
    {
      v23 = v5->_fileTransferUrl;
      v5->_fileTransferUrl = 0;
    }

    if (*((unsigned char *)a3 + 96))
    {
      uint64_t v26 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 11)];
      fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
      v5->_fileTransferMaxRecipients = (NSNumber *)v26;
    }
    else
    {
      fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
      v5->_fileTransferMaxRecipients = 0;
    }

    if (*((unsigned char *)a3 + 112))
    {
      uint64_t v28 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 13)];
      maxFileTransferSize = v5->_maxFileTransferSize;
      v5->_maxFileTransferSize = (NSNumber *)v28;
    }
    else
    {
      maxFileTransferSize = v5->_maxFileTransferSize;
      v5->_maxFileTransferSize = 0;
    }

    v5->_fileTransferAutoAccept = *((unsigned char *)a3 + 120);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)exploderUri
{
  return self->_exploderUri;
}

- (void)setExploderUri:(id)a3
{
}

- (BOOL)autoAcceptChat
{
  return self->_autoAcceptChat;
}

- (void)setAutoAcceptChat:(BOOL)a3
{
  self->_autoAcceptChat = a3;
}

- (BOOL)autoAcceptGroupChat
{
  return self->_autoAcceptGroupChat;
}

- (void)setAutoAcceptGroupChat:(BOOL)a3
{
  self->_autoAcceptGroupChat = a3;
}

- (NSNumber)maxGroupSize
{
  return self->_maxGroupSize;
}

- (void)setMaxGroupSize:(id)a3
{
}

- (NSURL)fileTransferUrl
{
  return self->_fileTransferUrl;
}

- (void)setFileTransferUrl:(id)a3
{
}

- (NSNumber)fileTransferMaxRecipients
{
  return self->_fileTransferMaxRecipients;
}

- (void)setFileTransferMaxRecipients:(id)a3
{
}

- (NSNumber)maxFileTransferSize
{
  return self->_maxFileTransferSize;
}

- (void)setMaxFileTransferSize:(id)a3
{
}

- (BOOL)fileTransferAutoAccept
{
  return self->_fileTransferAutoAccept;
}

- (void)setFileTransferAutoAccept:(BOOL)a3
{
  self->_fileTransferAutoAccept = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxFileTransferSize, 0);
  objc_storeStrong((id *)&self->_fileTransferMaxRecipients, 0);
  objc_storeStrong((id *)&self->_fileTransferUrl, 0);
  objc_storeStrong((id *)&self->_maxGroupSize, 0);

  objc_storeStrong((id *)&self->_exploderUri, 0);
}

@end