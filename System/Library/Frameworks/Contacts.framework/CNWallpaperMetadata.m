@interface CNWallpaperMetadata
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVertical;
- (CNWallpaperMetadata)initWithCoder:(id)a3;
- (CNWallpaperMetadata)initWithDataRepresentation:(id)a3;
- (CNWallpaperMetadata)initWithFontDescription:(id)a3 fontColorDescription:(id)a4 backgroundColorDescription:(id)a5 extensionBundleID:(id)a6 vertical:(BOOL)a7 visualFingerprintData:(id)a8;
- (NSData)dataRepresentation;
- (NSData)visualFingerprintData;
- (NSDictionary)backgroundColorDescription;
- (NSDictionary)fontColorDescription;
- (NSDictionary)fontDescription;
- (NSString)extensionBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColorDescription:(id)a3;
- (void)setExtensionBundleID:(id)a3;
- (void)setFontColorDescription:(id)a3;
- (void)setFontDescription:(id)a3;
- (void)setVertical:(BOOL)a3;
- (void)setVisualFingerprintData:(id)a3;
@end

@implementation CNWallpaperMetadata

+ (id)log
{
  if (log_cn_once_token_0_0 != -1) {
    dispatch_once(&log_cn_once_token_0_0, &__block_literal_global_13);
  }
  v2 = (void *)log_cn_once_object_0_0;

  return v2;
}

uint64_t __26__CNWallpaperMetadata_log__block_invoke()
{
  log_cn_once_object_0_0 = (uint64_t)os_log_create("com.apple.contacts", "CNWallpaperMetadata");

  return MEMORY[0x1F41817F8]();
}

- (CNWallpaperMetadata)initWithFontDescription:(id)a3 fontColorDescription:(id)a4 backgroundColorDescription:(id)a5 extensionBundleID:(id)a6 vertical:(BOOL)a7 visualFingerprintData:(id)a8
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CNWallpaperMetadata;
  v18 = [(CNWallpaperMetadata *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fontDescription, a3);
    objc_storeStrong((id *)&v19->_fontColorDescription, a4);
    objc_storeStrong((id *)&v19->_backgroundColorDescription, a5);
    objc_storeStrong((id *)&v19->_extensionBundleID, a6);
    v19->_vertical = a7;
    objc_storeStrong((id *)&v19->_visualFingerprintData, a8);
    v20 = v19;
  }

  return v19;
}

- (CNWallpaperMetadata)initWithDataRepresentation:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    id v17 = 0;
    v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v17];

    id v7 = v17;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CNWallpaperMetadata initWithDataRepresentation:]((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSData)dataRepresentation
{
  id v13 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v13];
  id v3 = v13;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CNWallpaperMetadata *)(uint64_t)v3 dataRepresentation];
    }
  }

  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNWallpaperMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeIntForKey:@"version"];
  if (v5 >= 3)
  {
    int v34 = v5;
    v35 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[CNWallpaperMetadata initWithCoder:](v34, v35, v36, v37, v38, v39, v40, v41);
    }

    v33 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_fontDescription"];
    uint64_t v11 = (NSDictionary *)[v10 copy];
    fontDescription = self->_fontDescription;
    self->_fontDescription = v11;

    id v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    id v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_fontColorDescription"];
    v18 = (NSDictionary *)[v17 copy];
    fontColorDescription = self->_fontColorDescription;
    self->_fontColorDescription = v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    id v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    objc_super v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_backgroundColorDescription"];
    v25 = (NSDictionary *)[v24 copy];
    backgroundColorDescription = self->_backgroundColorDescription;
    self->_backgroundColorDescription = v25;

    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_extensionBundleID"];
    v28 = (NSString *)[v27 copy];
    extensionBundleID = self->_extensionBundleID;
    self->_extensionBundleID = v28;

    self->_vertical = [v4 decodeBoolForKey:@"_vertical"];
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_visualFingerprintData"];
    v31 = (NSData *)[v30 copy];
    visualFingerprintData = self->_visualFingerprintData;
    self->_visualFingerprintData = v31;

    v33 = self;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:2 forKey:@"version"];
  [v4 encodeObject:self->_fontDescription forKey:@"_fontDescription"];
  [v4 encodeObject:self->_fontColorDescription forKey:@"_fontColorDescription"];
  [v4 encodeObject:self->_backgroundColorDescription forKey:@"_backgroundColorDescription"];
  [v4 encodeObject:self->_extensionBundleID forKey:@"_extensionBundleID"];
  [v4 encodeBool:self->_vertical forKey:@"_vertical"];
  [v4 encodeObject:self->_visualFingerprintData forKey:@"_visualFingerprintData"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNWallpaperMetadata);
  int v5 = [(CNWallpaperMetadata *)self fontDescription];
  [(CNWallpaperMetadata *)v4 setFontDescription:v5];

  uint64_t v6 = [(CNWallpaperMetadata *)self fontColorDescription];
  [(CNWallpaperMetadata *)v4 setFontColorDescription:v6];

  uint64_t v7 = [(CNWallpaperMetadata *)self backgroundColorDescription];
  [(CNWallpaperMetadata *)v4 setBackgroundColorDescription:v7];

  uint64_t v8 = [(CNWallpaperMetadata *)self extensionBundleID];
  [(CNWallpaperMetadata *)v4 setExtensionBundleID:v8];

  [(CNWallpaperMetadata *)v4 setVertical:[(CNWallpaperMetadata *)self isVertical]];
  uint64_t v9 = [(CNWallpaperMetadata *)self visualFingerprintData];
  [(CNWallpaperMetadata *)v4 setVisualFingerprintData:v9];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNWallpaperMetadata *)a3;
  if (self == v4) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  unint64_t v5 = (unint64_t)[(CNWallpaperMetadata *)self fontDescription];
  unint64_t v6 = (unint64_t)[(CNWallpaperMetadata *)v4 fontDescription];
  if (v5 | v6)
  {
    if (![(id)v5 isEqual:v6]) {
      goto LABEL_15;
    }
  }
  unint64_t v7 = (unint64_t)[(CNWallpaperMetadata *)self fontColorDescription];
  unint64_t v8 = (unint64_t)[(CNWallpaperMetadata *)v4 fontColorDescription];
  if (v7 | v8)
  {
    if (![(id)v7 isEqual:v8]) {
      goto LABEL_15;
    }
  }
  if (((unint64_t v9 = (unint64_t)[(CNWallpaperMetadata *)self backgroundColorDescription],
         unint64_t v10 = (unint64_t)[(CNWallpaperMetadata *)v4 backgroundColorDescription],
         !(v9 | v10))
     || [(id)v9 isEqual:v10])
    && ((unint64_t v11 = (unint64_t)[(CNWallpaperMetadata *)self extensionBundleID],
         unint64_t v12 = (unint64_t)[(CNWallpaperMetadata *)v4 extensionBundleID],
         !(v11 | v12))
     || [(id)v11 isEqual:v12])
    && (BOOL v13 = [(CNWallpaperMetadata *)self isVertical],
        v13 == [(CNWallpaperMetadata *)v4 isVertical])
    && ((unint64_t v14 = (unint64_t)[(CNWallpaperMetadata *)self visualFingerprintData],
         unint64_t v15 = (unint64_t)[(CNWallpaperMetadata *)v4 visualFingerprintData],
         !(v14 | v15))
     || [(id)v14 isEqual:v15]))
  {
LABEL_14:
    BOOL v16 = 1;
  }
  else
  {
LABEL_15:
    BOOL v16 = 0;
  }

  return v16;
}

- (NSDictionary)fontDescription
{
  return self->_fontDescription;
}

- (void)setFontDescription:(id)a3
{
}

- (NSDictionary)fontColorDescription
{
  return self->_fontColorDescription;
}

- (void)setFontColorDescription:(id)a3
{
}

- (NSDictionary)backgroundColorDescription
{
  return self->_backgroundColorDescription;
}

- (void)setBackgroundColorDescription:(id)a3
{
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (void)setExtensionBundleID:(id)a3
{
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (NSData)visualFingerprintData
{
  return self->_visualFingerprintData;
}

- (void)setVisualFingerprintData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualFingerprintData, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_backgroundColorDescription, 0);
  objc_storeStrong((id *)&self->_fontColorDescription, 0);

  objc_storeStrong((id *)&self->_fontDescription, 0);
}

- (void)initWithDataRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dataRepresentation
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end