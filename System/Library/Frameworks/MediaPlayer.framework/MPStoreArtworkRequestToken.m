@interface MPStoreArtworkRequestToken
+ (BOOL)supportsSecureCoding;
+ (MPStoreArtworkRequestToken)tokenWithImageArtworkInfo:(id)a3;
+ (MPStoreArtworkRequestToken)tokenWithVideoArtworkInfo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICStoreArtworkInfo)imageArtworkInfo;
- (ICStoreVideoArtworkInfo)videoArtworkInfo;
- (MPStoreArtworkRequestToken)init;
- (MPStoreArtworkRequestToken)initWithCoder:(id)a3;
- (NSString)cropStyle;
- (NSString)format;
- (NSString)sourceEditorialArtworkKind;
- (NSURL)artworkURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
- (int64_t)artworkInfoType;
- (void)encodeWithCoder:(id)a3;
- (void)setArtworkInfoType:(int64_t)a3;
- (void)setArtworkURL:(id)a3;
- (void)setCropStyle:(id)a3;
- (void)setFormat:(id)a3;
- (void)setImageArtworkInfo:(id)a3;
- (void)setSourceEditorialArtworkKind:(id)a3;
- (void)setVideoArtworkInfo:(id)a3;
@end

@implementation MPStoreArtworkRequestToken

+ (MPStoreArtworkRequestToken)tokenWithImageArtworkInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(MPStoreArtworkRequestToken);
    [(MPStoreArtworkRequestToken *)v4 setImageArtworkInfo:v3];

    [(MPStoreArtworkRequestToken *)v4 setArtworkInfoType:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setImageArtworkInfo:(id)a3
{
}

- (void)setArtworkInfoType:(int64_t)a3
{
  self->_artworkInfoType = a3;
}

- (MPStoreArtworkRequestToken)init
{
  v7.receiver = self;
  v7.super_class = (Class)MPStoreArtworkRequestToken;
  v2 = [(MPStoreArtworkRequestToken *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_cropStyle, (id)*MEMORY[0x1E4FB8468]);
    int IsNonUIPlaybackService = MSVCurrentProcessIsNonUIPlaybackService();
    v5 = (id *)MEMORY[0x1E4FB8490];
    if (!IsNonUIPlaybackService) {
      v5 = (id *)MEMORY[0x1E4FB8488];
    }
    objc_storeStrong((id *)&v3->_format, *v5);
  }
  return v3;
}

- (ICStoreArtworkInfo)imageArtworkInfo
{
  return self->_imageArtworkInfo;
}

- (int64_t)artworkInfoType
{
  return self->_artworkInfoType;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)cropStyle
{
  return self->_cropStyle;
}

- (void)setFormat:(id)a3
{
}

- (void)setCropStyle:(id)a3
{
}

- (id)stringRepresentation
{
  int64_t artworkInfoType = self->_artworkInfoType;
  if (!artworkInfoType)
  {
    uint64_t v3 = 16;
    goto LABEL_5;
  }
  if (artworkInfoType == 1)
  {
    uint64_t v3 = 24;
LABEL_5:
    v4 = [*(id *)((char *)&self->super.isa + v3) stringRepresentation];
    v5 = (__CFString *)[v4 copy];

    goto LABEL_7;
  }
  v5 = &stru_1EE680640;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_sourceEditorialArtworkKind, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_cropStyle, 0);
  objc_storeStrong((id *)&self->_videoArtworkInfo, 0);

  objc_storeStrong((id *)&self->_imageArtworkInfo, 0);
}

- (void)setArtworkURL:(id)a3
{
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setSourceEditorialArtworkKind:(id)a3
{
}

- (NSString)sourceEditorialArtworkKind
{
  return self->_sourceEditorialArtworkKind;
}

- (void)setVideoArtworkInfo:(id)a3
{
}

- (ICStoreVideoArtworkInfo)videoArtworkInfo
{
  return self->_videoArtworkInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v4[1] = self->_artworkInfoType;
    objc_storeStrong(v4 + 4, self->_cropStyle);
    objc_storeStrong(v5 + 5, self->_format);
    objc_storeStrong(v5 + 6, self->_sourceEditorialArtworkKind);
    objc_storeStrong(v5 + 7, self->_artworkURL);
    objc_storeStrong(v5 + 2, self->_imageArtworkInfo);
    objc_storeStrong(v5 + 3, self->_videoArtworkInfo);
  }
  return v5;
}

- (MPStoreArtworkRequestToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MPStoreArtworkRequestToken;
  v5 = [(MPStoreArtworkRequestToken *)&v21 init];
  if (v5)
  {
    v5->_int64_t artworkInfoType = [v4 decodeIntegerForKey:@"artworkInfoType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cropStyle"];
    cropStyle = v5->_cropStyle;
    v5->_cropStyle = (NSString *)v6;

    if ([v4 containsValueForKey:@"format"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
      format = v5->_format;
      v5->_format = (NSString *)v8;
    }
    if (!v5->_format)
    {
      int IsNonUIPlaybackService = MSVCurrentProcessIsNonUIPlaybackService();
      v11 = (id *)MEMORY[0x1E4FB8490];
      if (!IsNonUIPlaybackService) {
        v11 = (id *)MEMORY[0x1E4FB8488];
      }
      objc_storeStrong((id *)&v5->_format, *v11);
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEditorialArtworkKind"];
    sourceEditorialArtworkKind = v5->_sourceEditorialArtworkKind;
    v5->_sourceEditorialArtworkKind = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artworkURL"];
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoArtwork"];
    videoArtworkInfo = v5->_videoArtworkInfo;
    v5->_videoArtworkInfo = (ICStoreVideoArtworkInfo *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageArtwork"];
    imageArtworkInfo = v5->_imageArtworkInfo;
    v5->_imageArtworkInfo = (ICStoreArtworkInfo *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t artworkInfoType = self->_artworkInfoType;
  id v5 = a3;
  [v5 encodeInteger:artworkInfoType forKey:@"artworkInfoType"];
  [v5 encodeObject:self->_cropStyle forKey:@"cropStyle"];
  [v5 encodeObject:self->_format forKey:@"format"];
  [v5 encodeObject:self->_sourceEditorialArtworkKind forKey:@"sourceEditorialArtworkKind"];
  [v5 encodeObject:self->_artworkURL forKey:@"artworkURL"];
  [v5 encodeObject:self->_videoArtworkInfo forKey:@"videoArtwork"];
  [v5 encodeObject:self->_imageArtworkInfo forKey:@"imageArtwork"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPStoreArtworkRequestToken *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = v5;
      if (self->_artworkInfoType == v5->_artworkInfoType)
      {
        imageArtworkInfo = self->_imageArtworkInfo;
        uint64_t v8 = v5->_imageArtworkInfo;
        if (imageArtworkInfo == v8)
        {
        }
        else
        {
          v9 = v8;
          v10 = imageArtworkInfo;
          int v11 = [(ICStoreArtworkInfo *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_20;
          }
        }
        videoArtworkInfo = self->_videoArtworkInfo;
        uint64_t v14 = v6->_videoArtworkInfo;
        if (videoArtworkInfo == v14)
        {
        }
        else
        {
          v15 = v14;
          uint64_t v16 = videoArtworkInfo;
          int v17 = [(ICStoreVideoArtworkInfo *)v16 isEqual:v15];

          if (!v17) {
            goto LABEL_20;
          }
        }
        cropStyle = self->_cropStyle;
        v19 = v6->_cropStyle;
        if (cropStyle == v19)
        {
        }
        else
        {
          v20 = v19;
          objc_super v21 = cropStyle;
          int v22 = [(NSString *)v21 isEqual:v20];

          if (!v22) {
            goto LABEL_20;
          }
        }
        format = self->_format;
        v24 = v6->_format;
        if (format == v24)
        {
        }
        else
        {
          v25 = v24;
          v26 = format;
          int v27 = [(NSString *)v26 isEqual:v25];

          if (!v27) {
            goto LABEL_20;
          }
        }
        sourceEditorialArtworkKind = self->_sourceEditorialArtworkKind;
        v30 = v6->_sourceEditorialArtworkKind;
        v31 = sourceEditorialArtworkKind;
        v32 = v31;
        if (v31 == v30) {
          char v12 = 1;
        }
        else {
          char v12 = [(NSString *)v31 isEqual:v30];
        }

        goto LABEL_21;
      }
LABEL_20:
      char v12 = 0;
LABEL_21:

      goto LABEL_22;
    }
    char v12 = 0;
  }
LABEL_22:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPStoreArtworkRequestToken)tokenWithVideoArtworkInfo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(MPStoreArtworkRequestToken);
    [(MPStoreArtworkRequestToken *)v4 setVideoArtworkInfo:v3];

    [(MPStoreArtworkRequestToken *)v4 setArtworkInfoType:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end