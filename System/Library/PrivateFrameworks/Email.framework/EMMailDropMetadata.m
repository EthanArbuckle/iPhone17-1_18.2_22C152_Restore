@interface EMMailDropMetadata
+ (BOOL)supportsSecureCoding;
+ (id)mailDropMetadata;
- (BOOL)autoArchive;
- (BOOL)isBanner;
- (BOOL)isBannerWithMultiple;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isInvalid;
- (BOOL)isPhotoArchive;
- (EMMailDropMetadata)initWithCoder:(id)a3;
- (NSDate)expiration;
- (NSString)UUID;
- (NSString)fileName;
- (NSString)mimeType;
- (NSURL)directUrl;
- (NSURL)wrappedUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)directUrlString;
- (id)wrappedUrlString;
- (int64_t)fileSize;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)setAutoArchive:(BOOL)a3;
- (void)setDirectUrl:(id)a3;
- (void)setExpiration:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setIsInvalid:(BOOL)a3;
- (void)setMimeType:(id)a3;
- (void)setUUID:(id)a3;
- (void)setWrappedUrl:(id)a3;
@end

@implementation EMMailDropMetadata

+ (id)mailDropMetadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMailDropMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMMailDropMetadata;
  v5 = [(EMMailDropMetadata *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    v5->_fileSize = [v4 decodeIntegerForKey:@"EFPropertyKey_fileSize"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_mimeType"];
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v8;

    v5->_autoArchive = [v4 decodeBoolForKey:@"EFPropertyKey_autoArchive"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_directUrl"];
    directUrl = v5->_directUrl;
    v5->_directUrl = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_wrappedUrl"];
    wrappedUrl = v5->_wrappedUrl;
    v5->_wrappedUrl = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_expiration"];
    expiration = v5->_expiration;
    v5->_expiration = (NSDate *)v14;

    v5->_flags = [v4 decodeIntegerForKey:@"EFPropertyKey_flags"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v16;

    v5->_isInvalid = [v4 decodeBoolForKey:@"EFPropertyKey_isInvalid"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(EMMailDropMetadata *)self fileName];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_fileName"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[EMMailDropMetadata fileSize](self, "fileSize"), @"EFPropertyKey_fileSize");
  v5 = [(EMMailDropMetadata *)self mimeType];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_mimeType"];

  objc_msgSend(v8, "encodeBool:forKey:", -[EMMailDropMetadata autoArchive](self, "autoArchive"), @"EFPropertyKey_autoArchive");
  uint64_t v6 = [(EMMailDropMetadata *)self directUrl];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_directUrl"];

  v7 = [(EMMailDropMetadata *)self wrappedUrl];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_wrappedUrl"];

  [v8 encodeObject:self->_expiration forKey:@"EFPropertyKey_expiration"];
  objc_msgSend(v8, "encodeInteger:forKey:", -[EMMailDropMetadata flags](self, "flags"), @"EFPropertyKey_flags");
  [v8 encodeObject:self->_UUID forKey:@"EFPropertyKey_UUID"];
  objc_msgSend(v8, "encodeBool:forKey:", -[EMMailDropMetadata isInvalid](self, "isInvalid"), @"EFPropertyKey_isInvalid");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(EMMailDropMetadata);
  uint64_t v5 = [(NSString *)self->_UUID copy];
  UUID = v4->_UUID;
  v4->_UUID = (NSString *)v5;

  v4->_autoArchive = self->_autoArchive;
  objc_storeStrong((id *)&v4->_directUrl, self->_directUrl);
  objc_storeStrong((id *)&v4->_expiration, self->_expiration);
  v4->_flags = self->_flags;
  uint64_t v7 = [(NSString *)self->_fileName copy];
  fileName = v4->_fileName;
  v4->_fileName = (NSString *)v7;

  v4->_fileSize = self->_fileSize;
  uint64_t v9 = [(NSString *)self->_mimeType copy];
  mimeType = v4->_mimeType;
  v4->_mimeType = (NSString *)v9;

  v4->_isInvalid = self->_isInvalid;
  objc_storeStrong((id *)&v4->_wrappedUrl, self->_wrappedUrl);
  return v4;
}

- (id)description
{
  v3 = NSString;
  long long v14 = *(_OWORD *)&self->_fileName;
  if (self->_autoArchive) {
    id v4 = "YES";
  }
  else {
    id v4 = "NO";
  }
  unint64_t flags = self->_flags;
  UUID = self->_UUID;
  mimeType = self->_mimeType;
  directUrl = self->_directUrl;
  wrappedUrl = self->_wrappedUrl;
  expiration = self->_expiration;
  [(EMMailDropMetadata *)self isBanner];
  v11 = NSStringFromBOOL();
  uint64_t v12 = [v3 stringWithFormat:@"\nPtr:[%p]\nName:[%@]\nSize:[%lu]\nMIME:[%@]\nAuto-archive:[%s]\nExpiration:[%@]\nUUID:[%@]\nMDType:[%lu]\nURL:[%@]\nWrapped URL:[%@]\nisBanner:[%@]\n--------------", self, v14, mimeType, v4, expiration, UUID, flags, directUrl, wrappedUrl, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  UUID = self->_UUID;
  uint64_t v6 = [v4 UUID];
  LOBYTE(UUID) = [(NSString *)UUID isEqualToString:v6];

  if (UUID)
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [(EMMailDropMetadata *)self directUrlString];
    uint64_t v9 = [v4 directUrlString];
    char v7 = [v8 isEqualToString:v9];
  }
  return v7;
}

- (id)directUrlString
{
  return [(NSURL *)self->_directUrl absoluteString];
}

- (id)wrappedUrlString
{
  return [(NSURL *)self->_wrappedUrl absoluteString];
}

- (BOOL)isBanner
{
  return self->_flags & 1;
}

- (BOOL)isPhotoArchive
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isExpired
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(NSDate *)self->_expiration laterDate:v3];
  LOBYTE(self) = v4 == v3;

  return (char)self;
}

- (BOOL)isBannerWithMultiple
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)merge:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v22 = v4;
    uint64_t v5 = [v4 fileName];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      char v7 = [v22 fileName];
      id v8 = objc_msgSend(v7, "ef_sanitizedFileName");
      [(EMMailDropMetadata *)self setFileName:v8];
    }
    if ([v22 fileSize]) {
      -[EMMailDropMetadata setFileSize:](self, "setFileSize:", [v22 fileSize]);
    }
    uint64_t v9 = [v22 mimeType];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      v11 = [v22 mimeType];
      [(EMMailDropMetadata *)self setMimeType:v11];
    }
    if ([v22 autoArchive]) {
      -[EMMailDropMetadata setAutoArchive:](self, "setAutoArchive:", [v22 autoArchive]);
    }
    uint64_t v12 = [v22 directUrlString];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      long long v14 = [v22 directUrl];
      [(EMMailDropMetadata *)self setDirectUrl:v14];
    }
    v15 = [v22 wrappedUrlString];
    uint64_t v16 = [v15 length];

    if (v16)
    {
      v17 = [v22 wrappedUrl];
      [(EMMailDropMetadata *)self setWrappedUrl:v17];
    }
    v18 = [v22 expiration];

    if (v18)
    {
      objc_super v19 = [v22 expiration];
      [(EMMailDropMetadata *)self setExpiration:v19];
    }
    -[EMMailDropMetadata setFlags:](self, "setFlags:", -[EMMailDropMetadata flags](self, "flags") | [v22 flags]);
    v20 = [v22 UUID];

    id v4 = v22;
    if (v20)
    {
      v21 = [v22 UUID];
      [(EMMailDropMetadata *)self setUUID:v21];

      id v4 = v22;
    }
  }
}

- (NSString)UUID
{
  if (!self->_UUID)
  {
    if (self->_directUrl)
    {
      v3 = [(EMMailDropMetadata *)self directUrlString];
      id v4 = [v3 dataUsingEncoding:4];

      uint64_t v5 = objc_msgSend(v4, "ef_md5Digest");
      uint64_t v6 = objc_msgSend(v5, "ef_hexString");
      if ((unint64_t)[v6 length] >= 0x20)
      {
        char v7 = NSString;
        id v8 = objc_msgSend(v6, "substringWithRange:", 0, 8);
        uint64_t v9 = objc_msgSend(v6, "substringWithRange:", 8, 4);
        uint64_t v10 = objc_msgSend(v6, "substringWithRange:", 12, 4);
        v11 = objc_msgSend(v6, "substringWithRange:", 16, 4);
        uint64_t v12 = objc_msgSend(v6, "substringWithRange:", 20, 12);
        uint64_t v13 = [v7 stringWithFormat:@"%@-%@-%@-%@-%@", v8, v9, v10, v11, v12];
        UUID = self->_UUID;
        self->_UUID = v13;
      }
    }
    else
    {
      id v4 = [MEMORY[0x1E4F29128] UUID];
      v15 = [v4 UUIDString];
      uint64_t v5 = self->_UUID;
      self->_UUID = v15;
    }
  }
  uint64_t v16 = self->_UUID;
  return v16;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (BOOL)autoArchive
{
  return self->_autoArchive;
}

- (void)setAutoArchive:(BOOL)a3
{
  self->_autoArchive = a3;
}

- (NSURL)directUrl
{
  return self->_directUrl;
}

- (void)setDirectUrl:(id)a3
{
}

- (NSURL)wrappedUrl
{
  return self->_wrappedUrl;
}

- (void)setWrappedUrl:(id)a3
{
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_unint64_t flags = a3;
}

- (void)setUUID:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)setIsInvalid:(BOOL)a3
{
  self->_isInvalid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_wrappedUrl, 0);
  objc_storeStrong((id *)&self->_directUrl, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end