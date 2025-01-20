@interface CNWallpaper
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)contentIsSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (CNWallpaper)initWithCoder:(id)a3;
- (CNWallpaper)initWithDataRepresentation:(id)a3;
- (CNWallpaper)initWithDataRepresentationForPersistence:(id)a3;
- (CNWallpaper)initWithImageData:(id)a3 posterArchiveData:(id)a4;
- (CNWallpaper)initWithImageData:(id)a3 type:(id)a4;
- (CNWallpaper)initWithPosterArchiveData:(id)a3;
- (CNWallpaper)initWithPosterArchiveData:(id)a3 contentIsSensitive:(BOOL)a4;
- (CNWallpaper)initWithPosterArchiveData:(id)a3 fontDescription:(id)a4 fontColorDescription:(id)a5 backgroundColorDescription:(id)a6 extensionBundleID:(id)a7 vertical:(BOOL)a8 visualFingerprintData:(id)a9 contentIsSensitive:(BOOL)a10;
- (CNWallpaper)initWithPosterArchiveData:(id)a3 metadata:(id)a4 contentIsSensitive:(BOOL)a5;
- (CNWallpaperMetadata)metadata;
- (NSData)dataRepresentation;
- (NSData)generatedWatchImageData;
- (NSData)imageData;
- (NSData)posterArchiveData;
- (NSData)visualFingerprintData;
- (NSDictionary)backgroundColorDescription;
- (NSDictionary)fontColorDescription;
- (NSDictionary)fontDescription;
- (NSString)extensionBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataRepresentationForPersistence;
- (id)generateSnapshotImageDataForWatch;
- (id)wallpaperIncludingIMWallpaperMetadata:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)generateSnapshotImageDataForWatch;
- (void)setContentIsSensitive:(BOOL)a3;
- (void)setDataRepresentation:(id)a3;
- (void)setGeneratedWatchImageData:(id)a3;
- (void)setImageData:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPosterArchiveData:(id)a3;
@end

@implementation CNWallpaper

+ (id)log
{
  if (log_cn_once_token_0_11 != -1) {
    dispatch_once(&log_cn_once_token_0_11, &__block_literal_global_115);
  }
  v2 = (void *)log_cn_once_object_0_11;

  return v2;
}

uint64_t __18__CNWallpaper_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts", "CNWallpaper");
  uint64_t v1 = log_cn_once_object_0_11;
  log_cn_once_object_0_11 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNWallpaper)initWithImageData:(id)a3 type:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNWallpaper;
  v7 = [(CNWallpaper *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_imageData, a3);
    v9 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    posterArchiveData = v8->_posterArchiveData;
    v8->_posterArchiveData = v9;

    v11 = v8;
  }

  return v8;
}

- (CNWallpaper)initWithImageData:(id)a3 posterArchiveData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNWallpaper;
  v9 = [(CNWallpaper *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageData, a3);
    objc_storeStrong((id *)&v10->_posterArchiveData, a4);
    v11 = v10;
  }

  return v10;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNWallpaper;
  id v6 = [(CNWallpaper *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    imageData = v6->_imageData;
    v6->_imageData = 0;

    objc_storeStrong((id *)&v7->_posterArchiveData, a3);
    v9 = v7;
  }

  return v7;
}

- (CNWallpaper)initWithDataRepresentation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    id v11 = 0;
    id v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v11];

    id v7 = v11;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v7;
        _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNWallpaper: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (CNWallpaper)initWithDataRepresentationForPersistence:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    id v14 = 0;
    id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v14];

    id v7 = v14;
    int v8 = [v6 decodeIntForKey:@"version"];
    if (v8 >= 5)
    {
      int v11 = v8;
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CNWallpaper initWithDataRepresentationForPersistence:](v11, v9);
      }
    }
    else
    {
      v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_posterArchiveData"];
      if (v9)
      {
        v10 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:]([CNWallpaper alloc], "initWithPosterArchiveData:contentIsSensitive:", v9, [v6 decodeBoolForKey:@"_contentIsSensitive"]);
LABEL_12:

        goto LABEL_13;
      }
      v12 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v7;
        _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNWallpaper: %@", buf, 0xCu);
      }
    }
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 contentIsSensitive:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNWallpaper;
  int v8 = [(CNWallpaper *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_posterArchiveData, a3);
    v9->_contentIsSensitive = a4;
    v10 = v9;
  }

  return v9;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 metadata:(id)a4 contentIsSensitive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  if (v8)
  {
    v10 = [v8 fontDescription];
    int v11 = [v8 fontColorDescription];
    objc_super v12 = [v8 backgroundColorDescription];
    id v13 = [v8 extensionBundleID];
    uint64_t v14 = [v8 isVertical];
    v15 = [v8 visualFingerprintData];
    LOBYTE(v20) = v5;
    id v16 = [(CNWallpaper *)self initWithPosterArchiveData:v9 fontDescription:v10 fontColorDescription:v11 backgroundColorDescription:v12 extensionBundleID:v13 vertical:v14 visualFingerprintData:v15 contentIsSensitive:v20];

    uint64_t v17 = v16;
  }
  else
  {
    v18 = [(CNWallpaper *)self initWithPosterArchiveData:v9 contentIsSensitive:v5];

    uint64_t v17 = v18;
  }

  return v17;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 fontDescription:(id)a4 fontColorDescription:(id)a5 backgroundColorDescription:(id)a6 extensionBundleID:(id)a7 vertical:(BOOL)a8 visualFingerprintData:(id)a9 contentIsSensitive:(BOOL)a10
{
  BOOL v10 = a8;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  v36.receiver = self;
  v36.super_class = (Class)CNWallpaper;
  v23 = [(CNWallpaper *)&v36 init];
  if (v23)
  {
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
    {
      objc_storeStrong((id *)&v23->_posterArchiveData, a3);
      v33 = [[CNWallpaperMetadata alloc] initWithFontDescription:v18 fontColorDescription:v19 backgroundColorDescription:v20 extensionBundleID:v21 vertical:v10 visualFingerprintData:v22];
      metadata = v23->_metadata;
      v23->_metadata = v33;

      v23->_contentIsSensitive = a10;
      v32 = v23;
      goto LABEL_8;
    }
    v24 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CNWallpaper initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  v32 = 0;
LABEL_8:

  return v32;
}

- (NSData)dataRepresentation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v7];
  id v3 = v7;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    BOOL v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "Error archiving CNWallpaper: %@", buf, 0xCu);
    }
  }

  return (NSData *)v2;
}

- (id)dataRepresentationForPersistence
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeInt:4 forKey:@"version"];
  [v3 encodeObject:self->_posterArchiveData forKey:@"_posterArchiveData"];
  [v3 encodeBool:self->_contentIsSensitive forKey:@"_contentIsSensitive"];
  [v3 finishEncoding];
  id v4 = [v3 encodedData];

  return v4;
}

- (id)generateSnapshotImageDataForWatch
{
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CNWallpaper *)v3 generateSnapshotImageDataForWatch];
  }

  uint64_t v11 = *MEMORY[0x1E4F5A268];
  objc_super v12 = [(CNWallpaper *)self posterArchiveData];
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if (v11)
  {
    id v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CNWallpaper *)v13 generateSnapshotImageDataForWatch];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    id v21 = [(CNWallpaper *)self snapshotImageDataForWatch];
    goto LABEL_10;
  }
  id v21 = 0;
LABEL_10:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNWallpaper)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"version"];
  if (v5 >= 5)
  {
    int v13 = v5;
    uint64_t v14 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CNWallpaper initWithDataRepresentationForPersistence:](v13, v14);
    }

    objc_super v12 = 0;
  }
  else
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_posterArchiveData"];
    uint64_t v7 = (NSData *)[v6 copy];
    posterArchiveData = self->_posterArchiveData;
    self->_posterArchiveData = v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metadata"];
    uint64_t v10 = (CNWallpaperMetadata *)[v9 copy];
    metadata = self->_metadata;
    self->_metadata = v10;

    self->_contentIsSensitive = [v4 decodeBoolForKey:@"_contentIsSensitive"];
    objc_super v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:4 forKey:@"version"];
  [v4 encodeObject:self->_posterArchiveData forKey:@"_posterArchiveData"];
  [v4 encodeObject:self->_metadata forKey:@"_metadata"];
  [v4 encodeBool:self->_contentIsSensitive forKey:@"_contentIsSensitive"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNWallpaper);
  int v5 = [(CNWallpaper *)self posterArchiveData];
  [(CNWallpaper *)v4 setPosterArchiveData:v5];

  uint64_t v6 = [(CNWallpaper *)self metadata];
  [(CNWallpaper *)v4 setMetadata:v6];

  [(CNWallpaper *)v4 setContentIsSensitive:[(CNWallpaper *)self contentIsSensitive]];
  uint64_t v7 = [(CNWallpaper *)self generatedWatchImageData];
  [(CNWallpaper *)v4 setGeneratedWatchImageData:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNWallpaper *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((unint64_t v5 = (unint64_t)[(CNWallpaper *)self posterArchiveData],
           unint64_t v6 = (unint64_t)[(CNWallpaper *)v4 posterArchiveData],
           !(v5 | v6))
       || [(id)v5 isEqual:v6]))
    {
      BOOL v7 = [(CNWallpaper *)self contentIsSensitive];
      BOOL v8 = v7 ^ [(CNWallpaper *)v4 contentIsSensitive] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)wallpaperIncludingIMWallpaperMetadata:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20[0] = @"name";
  id v4 = a3;
  unint64_t v5 = [v4 fontName];
  v21[0] = v5;
  v20[1] = @"point-size";
  unint64_t v6 = NSNumber;
  [v4 fontSize];
  BOOL v7 = objc_msgSend(v6, "numberWithDouble:");
  v21[1] = v7;
  v20[2] = @"weight";
  BOOL v8 = NSNumber;
  [v4 fontWeight];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  v21[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  uint64_t v11 = [CNWallpaper alloc];
  objc_super v12 = [(CNWallpaper *)self posterArchiveData];
  int v13 = [v4 fontColor];
  uint64_t v14 = [v4 backgroundColor];
  uint64_t v15 = [v4 type];
  uint64_t v16 = [v4 isVertical];

  LOBYTE(v19) = [(CNWallpaper *)self contentIsSensitive];
  uint64_t v17 = [(CNWallpaper *)v11 initWithPosterArchiveData:v12 fontDescription:v10 fontColorDescription:v13 backgroundColorDescription:v14 extensionBundleID:v15 vertical:v16 visualFingerprintData:0 contentIsSensitive:v19];

  return v17;
}

- (NSDictionary)fontDescription
{
  v2 = [(CNWallpaper *)self metadata];
  id v3 = [v2 fontDescription];

  return (NSDictionary *)v3;
}

- (NSDictionary)fontColorDescription
{
  v2 = [(CNWallpaper *)self metadata];
  id v3 = [v2 fontColorDescription];

  return (NSDictionary *)v3;
}

- (NSDictionary)backgroundColorDescription
{
  v2 = [(CNWallpaper *)self metadata];
  id v3 = [v2 backgroundColorDescription];

  return (NSDictionary *)v3;
}

- (NSString)extensionBundleID
{
  v2 = [(CNWallpaper *)self metadata];
  id v3 = [v2 extensionBundleID];

  return (NSString *)v3;
}

- (BOOL)isVertical
{
  v2 = [(CNWallpaper *)self metadata];
  char v3 = [v2 isVertical];

  return v3;
}

- (NSData)visualFingerprintData
{
  v2 = [(CNWallpaper *)self metadata];
  char v3 = [v2 visualFingerprintData];

  return (NSData *)v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSData)posterArchiveData
{
  return self->_posterArchiveData;
}

- (void)setPosterArchiveData:(id)a3
{
}

- (void)setDataRepresentation:(id)a3
{
}

- (CNWallpaperMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void)setContentIsSensitive:(BOOL)a3
{
  self->_contentIsSensitive = a3;
}

- (NSData)generatedWatchImageData
{
  return self->_generatedWatchImageData;
}

- (void)setGeneratedWatchImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedWatchImageData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_posterArchiveData, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)initWithDataRepresentationForPersistence:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Wallpaper has a higher version number than we know how to handle: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)initWithPosterArchiveData:(NSObject *)a1 fontDescription:(uint64_t)a2 fontColorDescription:(uint64_t)a3 backgroundColorDescription:(uint64_t)a4 extensionBundleID:(uint64_t)a5 vertical:(uint64_t)a6 visualFingerprintData:(uint64_t)a7 contentIsSensitive:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateSnapshotImageDataForWatch
{
}

@end