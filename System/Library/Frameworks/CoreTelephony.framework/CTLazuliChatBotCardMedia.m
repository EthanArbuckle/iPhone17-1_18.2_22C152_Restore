@interface CTLazuliChatBotCardMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliChatBotCardMedia:(id)a3;
- (CTLazuliChatBotCardMedia)initWithCoder:(id)a3;
- (CTLazuliChatBotCardMedia)initWithReflection:(const void *)a3;
- (NSNumber)mediaFileSize;
- (NSNumber)thumbnailFileSize;
- (NSString)contentDescription;
- (NSString)mediaContentType;
- (NSString)thumbnailContentType;
- (NSURL)mediaUrl;
- (NSURL)thumbnailUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)height;
- (void)encodeWithCoder:(id)a3;
- (void)setContentDescription:(id)a3;
- (void)setHeight:(int64_t)a3;
- (void)setMediaContentType:(id)a3;
- (void)setMediaFileSize:(id)a3;
- (void)setMediaUrl:(id)a3;
- (void)setThumbnailContentType:(id)a3;
- (void)setThumbnailFileSize:(id)a3;
- (void)setThumbnailUrl:(id)a3;
@end

@implementation CTLazuliChatBotCardMedia

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliChatBotCardMedia *)self mediaUrl];
  [v3 appendFormat:@", mediaUrl = %@", v4];

  v5 = [(CTLazuliChatBotCardMedia *)self mediaContentType];
  [v3 appendFormat:@", mediaContentType = %@", v5];

  v6 = [(CTLazuliChatBotCardMedia *)self mediaFileSize];
  [v3 appendFormat:@", mediaFileSize = %@", v6];

  v7 = [(CTLazuliChatBotCardMedia *)self thumbnailUrl];
  [v3 appendFormat:@", thumbnailUrl = %@", v7];

  v8 = [(CTLazuliChatBotCardMedia *)self thumbnailContentType];
  [v3 appendFormat:@", thumbnailContentType = %@", v8];

  v9 = [(CTLazuliChatBotCardMedia *)self thumbnailFileSize];
  [v3 appendFormat:@", thumbnailFileSize = %@", v9];

  int64_t v10 = [(CTLazuliChatBotCardMedia *)self height];
  int64_t v13 = [(CTLazuliChatBotCardMedia *)self height];
  [v3 appendFormat:@", height = [%ld - %s]", v10, print_CTLazuliChatBotCardMediaHeightType(&v13)];
  v11 = [(CTLazuliChatBotCardMedia *)self contentDescription];
  [v3 appendFormat:@", contentDescription = %@", v11];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliChatBotCardMedia:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliChatBotCardMedia *)self mediaUrl];
  v6 = [v4 mediaUrl];
  if ([v5 isEqual:v6])
  {
    v7 = [(CTLazuliChatBotCardMedia *)self mediaContentType];
    v8 = [v4 mediaContentType];
    if (![v7 isEqualToString:v8])
    {
      char v12 = 0;
LABEL_47:

      goto LABEL_48;
    }
    v9 = [(CTLazuliChatBotCardMedia *)self mediaFileSize];
    uint64_t v10 = [v9 longValue];
    v11 = [v4 mediaFileSize];
    if (v10 != [v11 longValue])
    {
      char v12 = 0;
LABEL_46:

      goto LABEL_47;
    }
    v36 = [(CTLazuliChatBotCardMedia *)self thumbnailUrl];
    if (v36 || ([v4 thumbnailUrl], (v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v37 = [(CTLazuliChatBotCardMedia *)self thumbnailUrl];
      v35 = [v4 thumbnailUrl];
      if (!objc_msgSend(v37, "isEqual:"))
      {
        char v12 = 0;
LABEL_42:

LABEL_43:
        if (!v36) {

        }
        goto LABEL_46;
      }
      int v32 = 1;
    }
    else
    {
      v30 = 0;
      int v32 = 0;
    }
    v33 = [(CTLazuliChatBotCardMedia *)self thumbnailContentType];
    if (v33 || ([v4 thumbnailContentType], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v34 = [(CTLazuliChatBotCardMedia *)self thumbnailContentType];
      v31 = [v4 thumbnailContentType];
      if (!objc_msgSend(v34, "isEqualToString:"))
      {
        char v12 = 0;
LABEL_38:

        goto LABEL_39;
      }
      int v28 = 1;
    }
    else
    {
      v25 = 0;
      int v28 = 0;
    }
    v29 = [(CTLazuliChatBotCardMedia *)self thumbnailFileSize];
    if (v29 || ([v4 thumbnailFileSize], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = [(CTLazuliChatBotCardMedia *)self thumbnailFileSize];
      uint64_t v13 = [v27 longValue];
      v26 = [v4 thumbnailFileSize];
      if (v13 != [v26 longValue])
      {

        v14 = v29;
        if (!v29) {
          v14 = v23;
        }

        char v12 = 0;
        if (v28) {
          goto LABEL_38;
        }
        goto LABEL_39;
      }
      int v24 = 1;
    }
    else
    {
      v23 = 0;
      int v24 = 0;
    }
    int64_t v15 = [(CTLazuliChatBotCardMedia *)self height];
    if (v15 == [v4 height])
    {
      uint64_t v22 = [(CTLazuliChatBotCardMedia *)self contentDescription];
      if (v22 || ([v4 contentDescription], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v21 = [(CTLazuliChatBotCardMedia *)self contentDescription];
        v16 = [v4 contentDescription];
        char v12 = [v21 isEqualToString:v16];

        v17 = (void *)v22;
        if (!v22) {
          v17 = v20;
        }
      }
      else
      {
        v17 = 0;
        char v12 = 1;
      }

      if ((v24 & 1) == 0)
      {
LABEL_35:
        if (!v29) {

        }
        if (v28) {
          goto LABEL_38;
        }
LABEL_39:
        if (!v33) {

        }
        if (!v32) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
    }
    else
    {
      char v12 = 0;
      if (!v24) {
        goto LABEL_35;
      }
    }

    goto LABEL_35;
  }
  char v12 = 0;
LABEL_48:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliChatBotCardMedia *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliChatBotCardMedia *)self isEqualToCTLazuliChatBotCardMedia:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliChatBotCardMedia allocWithZone:a3];
  [(CTLazuliChatBotCardMedia *)v4 setMediaUrl:self->_mediaUrl];
  [(CTLazuliChatBotCardMedia *)v4 setMediaContentType:self->_mediaContentType];
  [(CTLazuliChatBotCardMedia *)v4 setMediaFileSize:self->_mediaFileSize];
  [(CTLazuliChatBotCardMedia *)v4 setThumbnailUrl:self->_thumbnailUrl];
  [(CTLazuliChatBotCardMedia *)v4 setThumbnailContentType:self->_thumbnailContentType];
  [(CTLazuliChatBotCardMedia *)v4 setThumbnailFileSize:self->_thumbnailFileSize];
  [(CTLazuliChatBotCardMedia *)v4 setHeight:self->_height];
  [(CTLazuliChatBotCardMedia *)v4 setContentDescription:self->_contentDescription];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_mediaUrl forKey:@"kMediaUrlKey"];
  [v5 encodeObject:self->_mediaContentType forKey:@"kMediaContentTypeKey"];
  [v5 encodeObject:self->_mediaFileSize forKey:@"kMediaFileSizeKey"];
  [v5 encodeObject:self->_thumbnailUrl forKey:@"kThumbnailUrlKey"];
  [v5 encodeObject:self->_thumbnailContentType forKey:@"kThumbnailContentTypeKey"];
  [v5 encodeObject:self->_thumbnailFileSize forKey:@"kThumbnailFileSizeKey"];
  id v4 = [NSNumber numberWithLong:self->_height];
  [v5 encodeObject:v4 forKey:@"kHeightKey"];

  [v5 encodeObject:self->_contentDescription forKey:@"kContentDescriptionKey"];
}

- (CTLazuliChatBotCardMedia)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CTLazuliChatBotCardMedia;
  id v5 = [(CTLazuliChatBotCardMedia *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaUrlKey"];
    mediaUrl = v5->_mediaUrl;
    v5->_mediaUrl = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaContentTypeKey"];
    mediaContentType = v5->_mediaContentType;
    v5->_mediaContentType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMediaFileSizeKey"];
    mediaFileSize = v5->_mediaFileSize;
    v5->_mediaFileSize = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kThumbnailUrlKey"];
    thumbnailUrl = v5->_thumbnailUrl;
    v5->_thumbnailUrl = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kThumbnailContentTypeKey"];
    thumbnailContentType = v5->_thumbnailContentType;
    v5->_thumbnailContentType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kThumbnailFileSizeKey"];
    thumbnailFileSize = v5->_thumbnailFileSize;
    v5->_thumbnailFileSize = (NSNumber *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kHeightKey"];
    v5->_height = [v18 longValue];

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kContentDescriptionKey"];
    contentDescription = v5->_contentDescription;
    v5->_contentDescription = (NSString *)v19;
  }
  return v5;
}

- (CTLazuliChatBotCardMedia)initWithReflection:(const void *)a3
{
  v40.receiver = self;
  v40.super_class = (Class)CTLazuliChatBotCardMedia;
  id v4 = [(CTLazuliChatBotCardMedia *)&v40 init];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = NSString;
    int v7 = *((char *)a3 + 23);
    uint64_t v8 = *(const void **)a3;
    uint64_t v9 = [NSString defaultCStringEncoding];
    if (v7 >= 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = v8;
    }
    v11 = [v6 stringWithCString:v10 encoding:v9];
    uint64_t v12 = [v5 URLWithString:v11];
    mediaUrl = v4->_mediaUrl;
    v4->_mediaUrl = (NSURL *)v12;

    if (*((char *)a3 + 47) >= 0) {
      uint64_t v14 = (char *)a3 + 24;
    }
    else {
      uint64_t v14 = (char *)*((void *)a3 + 3);
    }
    uint64_t v15 = [NSString stringWithUTF8String:v14];
    mediaContentType = v4->_mediaContentType;
    v4->_mediaContentType = (NSString *)v15;

    uint64_t v17 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 6)];
    mediaFileSize = v4->_mediaFileSize;
    v4->_mediaFileSize = (NSNumber *)v17;

    if (*((unsigned char *)a3 + 80))
    {
      uint64_t v19 = (char *)*((void *)a3 + 7);
      v20 = (void *)MEMORY[0x1E4F1CB10];
      v21 = NSString;
      int v22 = *((char *)a3 + 79);
      uint64_t v23 = [NSString defaultCStringEncoding];
      if (v22 >= 0) {
        int v24 = (char *)a3 + 56;
      }
      else {
        int v24 = v19;
      }
      v25 = [v21 stringWithCString:v24 encoding:v23];
      uint64_t v26 = [v20 URLWithString:v25];
      thumbnailUrl = v4->_thumbnailUrl;
      v4->_thumbnailUrl = (NSURL *)v26;
    }
    else
    {
      v25 = v4->_thumbnailUrl;
      v4->_thumbnailUrl = 0;
    }

    if (*((unsigned char *)a3 + 112))
    {
      if (*((char *)a3 + 111) >= 0) {
        int v28 = (char *)a3 + 88;
      }
      else {
        int v28 = (char *)*((void *)a3 + 11);
      }
      uint64_t v29 = [NSString stringWithUTF8String:v28];
      thumbnailContentType = v4->_thumbnailContentType;
      v4->_thumbnailContentType = (NSString *)v29;
    }
    else
    {
      thumbnailContentType = v4->_thumbnailContentType;
      v4->_thumbnailContentType = 0;
    }

    if (*((unsigned char *)a3 + 128))
    {
      uint64_t v31 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 15)];
      thumbnailFileSize = v4->_thumbnailFileSize;
      v4->_thumbnailFileSize = (NSNumber *)v31;
    }
    else
    {
      thumbnailFileSize = v4->_thumbnailFileSize;
      v4->_thumbnailFileSize = 0;
    }

    v4->_height = encode_CTLazuliChatBotCardMediaHeightType((unsigned int *)a3 + 34);
    if (*((unsigned char *)a3 + 168))
    {
      v35 = (char *)*((void *)a3 + 18);
      v34 = (char *)a3 + 144;
      v33 = v35;
      if (v34[23] >= 0) {
        v36 = v34;
      }
      else {
        v36 = v33;
      }
      uint64_t v37 = [NSString stringWithUTF8String:v36];
      contentDescription = v4->_contentDescription;
      v4->_contentDescription = (NSString *)v37;
    }
    else
    {
      contentDescription = v4->_contentDescription;
      v4->_contentDescription = 0;
    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mediaUrl
{
  return self->_mediaUrl;
}

- (void)setMediaUrl:(id)a3
{
}

- (NSString)mediaContentType
{
  return self->_mediaContentType;
}

- (void)setMediaContentType:(id)a3
{
}

- (NSNumber)mediaFileSize
{
  return self->_mediaFileSize;
}

- (void)setMediaFileSize:(id)a3
{
}

- (NSURL)thumbnailUrl
{
  return self->_thumbnailUrl;
}

- (void)setThumbnailUrl:(id)a3
{
}

- (NSString)thumbnailContentType
{
  return self->_thumbnailContentType;
}

- (void)setThumbnailContentType:(id)a3
{
}

- (NSNumber)thumbnailFileSize
{
  return self->_thumbnailFileSize;
}

- (void)setThumbnailFileSize:(id)a3
{
}

- (int64_t)height
{
  return self->_height;
}

- (void)setHeight:(int64_t)a3
{
  self->_height = a3;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setContentDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_thumbnailFileSize, 0);
  objc_storeStrong((id *)&self->_thumbnailContentType, 0);
  objc_storeStrong((id *)&self->_thumbnailUrl, 0);
  objc_storeStrong((id *)&self->_mediaFileSize, 0);
  objc_storeStrong((id *)&self->_mediaContentType, 0);

  objc_storeStrong((id *)&self->_mediaUrl, 0);
}

@end