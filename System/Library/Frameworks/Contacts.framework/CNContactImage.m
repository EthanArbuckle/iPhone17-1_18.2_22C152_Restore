@interface CNContactImage
- (BOOL)ignoredForRevert;
- (CGRect)cropRect;
- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 cropRect:(CGRect)a5 lastUsedDate:(id)a6;
- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 lastUsedDate:(id)a5 cropRect:(CGRect)a6 source:(int64_t)a7 sourceIdentifier:(id)a8 variant:(id)a9 poseConfigurationData:(id)a10 displayString:(id)a11 ignoredForRevert:(BOOL)a12;
- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5;
- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5 source:(int64_t)a6;
- (CNContactPoster)pairedPoster;
- (CNVisualFingerprint)visualFingerprint;
- (NSData)imageData;
- (NSData)poseConfigurationData;
- (NSDate)lastUsedDate;
- (NSString)displayString;
- (NSString)identifier;
- (NSString)sourceIdentifier;
- (NSString)variant;
- (id)copyWithNewImageData:(id)a3;
- (id)copyWithNewImageData:(id)a3 cropRect:(CGRect)a4;
- (id)resizedContactImageForMeCardSharing;
- (id)resizedContactImageToMaxEdgeWidth:(unint64_t)a3;
- (int64_t)source;
- (void)setDisplayString:(id)a3;
- (void)setIgnoredForRevert:(BOOL)a3;
- (void)setPairedPoster:(id)a3;
- (void)setPoseConfigurationData:(id)a3;
- (void)setSource:(int64_t)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setVariant:(id)a3;
- (void)setVisualFingerprint:(id)a3;
@end

@implementation CNContactImage

- (id)resizedContactImageForMeCardSharing
{
  return [(CNContactImage *)self resizedContactImageToMaxEdgeWidth:500];
}

- (id)resizedContactImageToMaxEdgeWidth:(unint64_t)a3
{
  v5 = [(CNContactImage *)self imageData];
  uint64_t v6 = *MEMORY[0x1E4F5A268];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A268] + 16))(*MEMORY[0x1E4F5A268], v5))
  {
    v7 = self;
    goto LABEL_24;
  }
  [(CNContactImage *)self cropRect];
  if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    id v15 = v5;
  }
  else
  {
    [(CNContactImage *)self cropRect];
    CNImageUtilsCroppedImageDataFromFullSizeImageData(v5, 0, v11, v12, v13, v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  if ((*(unsigned int (**)(uint64_t, id))(v6 + 16))(v6, v15))
  {
    v17 = meCardSharingLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:](v17, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_21:

    goto LABEL_22;
  }
  unint64_t v45 = 0;
  unint64_t v46 = 0;
  if (!CNImageUtilsCopyImageSourceAndGetSizeFromData(v16, 0, &v46, &v45))
  {
    v17 = meCardSharingLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:](v17, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_21;
  }
  if (v46 > a3 || v45 > a3)
  {
    uint64_t v44 = 0x3FF0000000000000;
    BOOL v25 = [(CNContactImage *)self source] != 2;
    v26 = CNImageUtilsImageDataByScalingImageData((const __CFData *)v16, v25, a3, (double *)&v44, (double)(uint64_t)v46, (double)(uint64_t)v45, 1.0);
    if ((*(unsigned int (**)(uint64_t, void *))(v6 + 16))(v6, v26))
    {
      v27 = meCardSharingLogger();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[CNContactImage(MeCardSharing) resizedContactImageToMaxEdgeWidth:](v27, v28, v29, v30, v31, v32, v33, v34);
      }

      v35 = self;
    }
    else
    {
      v35 = -[CNContactImage copyWithNewImageData:cropRect:](self, "copyWithNewImageData:cropRect:", v26, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    v7 = v35;

    goto LABEL_23;
  }
LABEL_22:
  v7 = self;
LABEL_23:

LABEL_24:

  return v7;
}

- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v11 = (void *)MEMORY[0x1E4F29128];
  id v12 = a5;
  id v13 = a3;
  CGFloat v14 = [v11 UUID];
  id v15 = [v14 UUIDString];

  v16 = -[CNContactImage initWithIdentifier:imageData:cropRect:lastUsedDate:](self, "initWithIdentifier:imageData:cropRect:lastUsedDate:", v15, v13, v12, x, y, width, height);
  return v16;
}

- (CNContactImage)initWithImageData:(id)a3 cropRect:(CGRect)a4 lastUsedDate:(id)a5 source:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = (void *)MEMORY[0x1E4F29128];
  id v14 = a5;
  id v15 = a3;
  v16 = [v13 UUID];
  v17 = [v16 UUIDString];

  LOBYTE(v20) = 0;
  uint64_t v18 = -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](self, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", v17, v15, v14, a6, 0, 0, x, y, width, height, 0, 0, v20);

  return v18;
}

- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 cropRect:(CGRect)a5 lastUsedDate:(id)a6
{
  LOBYTE(v7) = 0;
  return -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](self, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", a3, a4, a6, 0, 0, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, 0, 0, v7);
}

- (CNContactImage)initWithIdentifier:(id)a3 imageData:(id)a4 lastUsedDate:(id)a5 cropRect:(CGRect)a6 source:(int64_t)a7 sourceIdentifier:(id)a8 variant:(id)a9 poseConfigurationData:(id)a10 displayString:(id)a11 ignoredForRevert:(BOOL)a12
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v21 = a3;
  id v35 = a4;
  id v34 = a5;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v22 = a11;
  v36.receiver = self;
  v36.super_class = (Class)CNContactImage;
  uint64_t v23 = [(CNContactImage *)&v36 init];
  if (v23)
  {
    if ([v21 length])
    {
      uint64_t v24 = (NSString *)v21;
      identifier = v23->_identifier;
      v23->_identifier = v24;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v26 = [identifier UUIDString];
      v27 = v23->_identifier;
      v23->_identifier = (NSString *)v26;
    }
    objc_storeStrong((id *)&v23->_imageData, a4);
    objc_storeStrong((id *)&v23->_lastUsedDate, a5);
    v23->_cropRect.origin.CGFloat x = x;
    v23->_cropRect.origin.CGFloat y = y;
    v23->_cropRect.size.CGFloat width = width;
    v23->_cropRect.size.CGFloat height = height;
    v23->_source = a7;
    objc_storeStrong((id *)&v23->_sourceIdentifier, a8);
    objc_storeStrong((id *)&v23->_variant, a9);
    objc_storeStrong((id *)&v23->_poseConfigurationData, a10);
    objc_storeStrong((id *)&v23->_displayString, a11);
    v23->_ignoredForRevert = a12;
    uint64_t v28 = v23;
  }

  return v23;
}

- (id)copyWithNewImageData:(id)a3
{
  id v4 = a3;
  v5 = [CNContactImage alloc];
  [(CNContactImage *)self cropRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(CNContactImage *)self lastUsedDate];
  id v15 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v5, "initWithImageData:cropRect:lastUsedDate:", v4, v14, v7, v9, v11, v13);

  [(CNContactImage *)v15 setSource:[(CNContactImage *)self source]];
  v16 = [(CNContactImage *)self sourceIdentifier];
  [(CNContactImage *)v15 setSourceIdentifier:v16];

  v17 = [(CNContactImage *)self variant];
  [(CNContactImage *)v15 setVariant:v17];

  uint64_t v18 = [(CNContactImage *)self displayString];
  [(CNContactImage *)v15 setDisplayString:v18];

  uint64_t v19 = [(CNContactImage *)self poseConfigurationData];
  [(CNContactImage *)v15 setPoseConfigurationData:v19];

  [(CNContactImage *)v15 setIgnoredForRevert:[(CNContactImage *)self ignoredForRevert]];
  uint64_t v20 = [(CNContactImage *)self pairedPoster];
  [(CNContactImage *)v15 setPairedPoster:v20];

  [(CNContactImage *)v15 setVisualFingerprint:0];
  return v15;
}

- (id)copyWithNewImageData:(id)a3 cropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = [CNContactImage alloc];
  double v11 = [(CNContactImage *)self lastUsedDate];
  double v12 = -[CNContactImage initWithImageData:cropRect:lastUsedDate:](v10, "initWithImageData:cropRect:lastUsedDate:", v9, v11, x, y, width, height);

  [(CNContactImage *)v12 setSource:[(CNContactImage *)self source]];
  double v13 = [(CNContactImage *)self sourceIdentifier];
  [(CNContactImage *)v12 setSourceIdentifier:v13];

  id v14 = [(CNContactImage *)self variant];
  [(CNContactImage *)v12 setVariant:v14];

  id v15 = [(CNContactImage *)self displayString];
  [(CNContactImage *)v12 setDisplayString:v15];

  v16 = [(CNContactImage *)self poseConfigurationData];
  [(CNContactImage *)v12 setPoseConfigurationData:v16];

  [(CNContactImage *)v12 setIgnoredForRevert:[(CNContactImage *)self ignoredForRevert]];
  v17 = [(CNContactImage *)self pairedPoster];
  [(CNContactImage *)v12 setPairedPoster:v17];

  [(CNContactImage *)v12 setVisualFingerprint:0];
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
}

- (NSData)poseConfigurationData
{
  return self->_poseConfigurationData;
}

- (void)setPoseConfigurationData:(id)a3
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setDisplayString:(id)a3
{
}

- (BOOL)ignoredForRevert
{
  return self->_ignoredForRevert;
}

- (void)setIgnoredForRevert:(BOOL)a3
{
  self->_ignoredForRevert = a3;
}

- (CNVisualFingerprint)visualFingerprint
{
  return self->_visualFingerprint;
}

- (void)setVisualFingerprint:(id)a3
{
}

- (CNContactPoster)pairedPoster
{
  return self->_pairedPoster;
}

- (void)setPairedPoster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedPoster, 0);
  objc_storeStrong((id *)&self->_visualFingerprint, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_poseConfigurationData, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end