@interface QLTThumbnailRequest
+ (BOOL)supportsSecureCoding;
+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7;
+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8;
+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6;
+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 error:(id *)a7;
- (BOOL)forceGeneration;
- (BOOL)iconMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)provideCachedResultsOnly;
- (BOOL)provideFullResolutionThumbnail;
- (BOOL)provideGenericIcon;
- (BOOL)provideLowQualityThumbnail;
- (BOOL)shouldProvideFoldedGenericIcon;
- (BOOL)wantsBaseline;
- (CGSize)size;
- (NSString)contentType;
- (NSUUID)uuid;
- (QLCacheVersionedFileIdentifier)fileIdentifier;
- (QLTThumbnailRequest)initWithCoder:(id)a3;
- (QLTThumbnailRequest)initWithVersionedFileIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 flavor:(int)a7 wantsBaseline:(BOOL)a8 minimumDimension:(double)a9 requestedTypes:(unint64_t)a10;
- (double)minimumDimension;
- (double)scale;
- (float)maximumPixelSize;
- (id)computeContentType;
- (id)copyWithZone:(_NSZone *)a3;
- (int)flavor;
- (int64_t)compare:(id)a3;
- (int64_t)generationBehavior;
- (int64_t)requestedMostRepresentativeType;
- (unint64_t)badgeType;
- (unint64_t)hash;
- (unint64_t)requestedTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setBadgeType:(unint64_t)a3;
- (void)setContentType:(id)a3;
- (void)setFlavor:(int)a3;
- (void)setGenerationBehavior:(int64_t)a3;
- (void)setMinimumDimension:(double)a3;
- (void)setRequestedTypes:(unint64_t)a3;
- (void)setScale:(double)a3;
- (void)setShouldProvideFoldedGenericIcon:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setUuid:(id)a3;
- (void)setWantsBaseline:(BOOL)a3;
@end

@implementation QLTThumbnailRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLTThumbnailRequest)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"si"];
  double v23 = 0.0;
  double v24 = 0.0;
  [v8 getValue:&v23 size:16];
  id v9 = objc_alloc((Class)objc_opt_class());
  v10 = [v5 decodeObjectOfClasses:v7 forKey:@"fi"];
  [v5 decodeDoubleForKey:@"sc"];
  double v12 = v11;
  uint64_t v13 = [v5 decodeBoolForKey:@"i"];
  uint64_t v14 = [v5 decodeIntForKey:@"flavor"];
  uint64_t v15 = [v5 decodeBoolForKey:@"baseline"];
  [v5 decodeDoubleForKey:@"ms"];
  double v17 = v16;
  uint64_t v18 = [v5 decodeIntegerForKey:@"rt"];
  v19 = (QLTThumbnailRequest *)objc_msgSend(v9, "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", v10, v13, v14, v15, v18, v23, v24, v12, v17);

  v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  [(QLTThumbnailRequest *)v19 setUuid:v20];

  -[QLTThumbnailRequest setBadgeType:](v19, "setBadgeType:", [v5 decodeIntegerForKey:@"bt"]);
  uint64_t v21 = [v5 decodeIntegerForKey:@"generationBehavior"];

  [(QLTThumbnailRequest *)v19 setGenerationBehavior:v21];
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  fileIdentifier = self->_fileIdentifier;
  id v6 = a3;
  [v6 encodeObject:fileIdentifier forKey:@"fi"];
  id v5 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_size objCType:"{CGSize=dd}"];
  [v6 encodeObject:v5 forKey:@"si"];

  [v6 encodeDouble:@"sc" forKey:self->_scale];
  [v6 encodeBool:self->_iconMode forKey:@"i"];
  [v6 encodeInteger:self->_badgeType forKey:@"bt"];
  [v6 encodeDouble:@"ms" forKey:self->_minimumDimension];
  [v6 encodeInteger:self->_requestedTypes forKey:@"rt"];
  [v6 encodeObject:self->_uuid forKey:@"uuid"];
  [v6 encodeInteger:self->_flavor forKey:@"flavor"];
  [v6 encodeBool:self->_wantsBaseline forKey:@"baseline"];
  [v6 encodeInteger:self->_generationBehavior forKey:@"generationBehavior"];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(QLTThumbnailRequest *)self iconMode];
  int v6 = [v4 iconMode];
  if (!v5 && (v6 & 1) != 0) {
    goto LABEL_3;
  }
  if ((!v5 | v6) != 1)
  {
LABEL_9:
    int64_t v7 = 1;
    goto LABEL_10;
  }
  unint64_t v8 = [(QLTThumbnailRequest *)self badgeType];
  uint64_t v9 = [v4 badgeType];
  if (v8 || !v9)
  {
    if (!v8 || v9)
    {
      [(QLTThumbnailRequest *)self maximumPixelSize];
      float v12 = v11;
      [v4 maximumPixelSize];
      if (v12 >= v13)
      {
        [(QLTThumbnailRequest *)self maximumPixelSize];
        float v21 = v20;
        [v4 maximumPixelSize];
        int64_t v7 = v21 > v22;
        goto LABEL_10;
      }
      [(QLTThumbnailRequest *)self minimumDimension];
      double v15 = v14;
      [v4 minimumDimension];
      if (v15 <= v16) {
        goto LABEL_3;
      }
      [(QLTThumbnailRequest *)self minimumDimension];
      double v18 = v17;
      [v4 minimumDimension];
      if (v18 <= v19)
      {
        int64_t v7 = 0;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
LABEL_3:
  int64_t v7 = -1;
LABEL_10:

  return v7;
}

- (QLTThumbnailRequest)initWithVersionedFileIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 flavor:(int)a7 wantsBaseline:(BOOL)a8 minimumDimension:(double)a9 requestedTypes:(unint64_t)a10
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v20 = a3;
  v26.receiver = self;
  v26.super_class = (Class)QLTThumbnailRequest;
  float v21 = [(QLTThumbnailRequest *)&v26 init];
  float v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_fileIdentifier, a3);
    v22->_size.CGFloat width = width;
    v22->_size.CGFloat height = height;
    v22->_scale = a5;
    v22->_iconMode = a6;
    v22->_minimumDimension = a9;
    v22->_requestedTypes = a10;
    uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
    uuid = v22->_uuid;
    v22->_uuid = (NSUUID *)v23;

    v22->_flavor = a7;
    v22->_wantsBaseline = a8;
    v22->_badgeType = 1;
    v22->_generationBehavior = 2;
  }

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithVersionedFileIdentifier:size:scale:iconMode:flavor:wantsBaseline:minimumDimension:requestedTypes:", self->_fileIdentifier, self->_iconMode, self->_flavor, self->_wantsBaseline, self->_requestedTypes, self->_size.width, self->_size.height, self->_scale, self->_minimumDimension);
  BOOL v5 = (void *)[(NSUUID *)self->_uuid copy];
  [v4 setUuid:v5];

  [v4 setBadgeType:self->_badgeType];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (QLTThumbnailRequest *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uuid = self->_uuid;
      int64_t v7 = [(QLTThumbnailRequest *)v5 uuid];
      if (![(NSUUID *)uuid isEqual:v7])
      {
        BOOL v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      unint64_t v8 = [(QLTThumbnailRequest *)self fileIdentifier];
      uint64_t v9 = [(QLTThumbnailRequest *)v5 fileIdentifier];
      if (![v8 isEqual:v9]) {
        goto LABEL_17;
      }
      [(QLTThumbnailRequest *)v5 size];
      BOOL v11 = 0;
      if (self->_size.width != v12 || self->_size.height != v10) {
        goto LABEL_18;
      }
      double scale = self->_scale;
      [(QLTThumbnailRequest *)v5 scale];
      if (scale != v14) {
        goto LABEL_17;
      }
      BOOL iconMode = self->_iconMode;
      if (iconMode == [(QLTThumbnailRequest *)v5 iconMode]
        && (unint64_t badgeType = self->_badgeType, badgeType == [(QLTThumbnailRequest *)v5 badgeType])
        && (double minimumDimension = self->_minimumDimension,
            [(QLTThumbnailRequest *)v5 minimumDimension],
            minimumDimension == v18)
        && (unint64_t requestedTypes = self->_requestedTypes,
            requestedTypes == [(QLTThumbnailRequest *)v5 requestedTypes])
        && (int flavor = self->_flavor, flavor == [(QLTThumbnailRequest *)v5 flavor]))
      {
        BOOL wantsBaseline = self->_wantsBaseline;
        BOOL v11 = wantsBaseline == [(QLTThumbnailRequest *)v5 wantsBaseline];
      }
      else
      {
LABEL_17:
        BOOL v11 = 0;
      }
LABEL_18:

      goto LABEL_19;
    }
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(QLCacheVersionedFileIdentifier *)self->_fileIdentifier hash];
  unint64_t width = (unint64_t)self->_size.width;
  return v3 ^ [(NSUUID *)self->_uuid hash] ^ width;
}

- (float)maximumPixelSize
{
  double width = self->_size.width;
  if (width < self->_size.height) {
    double width = self->_size.height;
  }
  return self->_scale * width;
}

- (NSString)contentType
{
  contentType = self->_contentType;
  if (!contentType)
  {
    id v4 = [(QLTThumbnailRequest *)self computeContentType];
    BOOL v5 = self->_contentType;
    self->_contentType = v4;

    contentType = self->_contentType;
  }

  return contentType;
}

- (id)computeContentType
{
  return 0;
}

- (BOOL)provideGenericIcon
{
  return self->_requestedTypes & 1;
}

- (BOOL)provideLowQualityThumbnail
{
  return (LOBYTE(self->_requestedTypes) >> 1) & 1;
}

- (BOOL)provideFullResolutionThumbnail
{
  return (LOBYTE(self->_requestedTypes) >> 2) & 1;
}

- (BOOL)provideCachedResultsOnly
{
  return [(QLTThumbnailRequest *)self generationBehavior] == 0;
}

- (BOOL)forceGeneration
{
  return [(QLTThumbnailRequest *)self generationBehavior] == 1;
}

- (int64_t)requestedMostRepresentativeType
{
  if (self->_requestedTypes) {
    return flsl(self->_requestedTypes & 7) - 1;
  }
  else {
    return 0;
  }
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  BOOL v11 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v10, v6, 0, width, height, 0.0, a5);

  return v11;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  float v13 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v12, v8, a7, width, height, 0.0, a5);

  return v13;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v11, v7, 0, width, height, 0.0, a6);

  return v12;
}

+ (id)thumbnailRequestForFileAtURL:(id)a3 size:(CGSize)a4 minimumSize:(double)a5 scale:(double)a6 iconMode:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  double v14 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v13, v9, a8, width, height, 0.0, a6);

  return v14;
}

- (QLCacheVersionedFileIdentifier)fileIdentifier
{
  return (QLCacheVersionedFileIdentifier *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (void)setContentType:(id)a3
{
}

- (BOOL)shouldProvideFoldedGenericIcon
{
  return self->_shouldProvideFoldedGenericIcon;
}

- (void)setShouldProvideFoldedGenericIcon:(BOOL)a3
{
  self->_shouldProvideFoldedGenericIcon = a3;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (void)setBadgeType:(unint64_t)a3
{
  self->_unint64_t badgeType = a3;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (int)flavor
{
  return self->_flavor;
}

- (void)setFlavor:(int)a3
{
  self->_int flavor = a3;
}

- (double)minimumDimension
{
  return self->_minimumDimension;
}

- (void)setMinimumDimension:(double)a3
{
  self->_double minimumDimension = a3;
}

- (BOOL)wantsBaseline
{
  return self->_wantsBaseline;
}

- (void)setWantsBaseline:(BOOL)a3
{
  self->_BOOL wantsBaseline = a3;
}

- (int64_t)generationBehavior
{
  return self->_generationBehavior;
}

- (void)setGenerationBehavior:(int64_t)a3
{
  self->_generationBehavior = a3;
}

- (unint64_t)requestedTypes
{
  return self->_requestedTypes;
}

- (void)setRequestedTypes:(unint64_t)a3
{
  self->_unint64_t requestedTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_fileIdentifier, 0);
}

@end