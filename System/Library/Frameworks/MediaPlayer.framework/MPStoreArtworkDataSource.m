@interface MPStoreArtworkDataSource
+ (MPStoreArtworkDataSource)sharedStoreArtworkDataSource;
- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4;
- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3;
- (BOOL)wantsBackgroundImageDecompression;
- (CGSize)_bestSizeForImageSizeInfo:(id)a3 catalog:(id)a4;
- (CGSize)_clampImageSize:(CGSize)a3 toMaxSupportedSize:(CGSize)a4;
- (CGSize)bestAvailableSizeForCatalog:(id)a3;
- (id)_bestURLForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)sortedSupportedSizesForCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPStoreArtworkDataSource

+ (MPStoreArtworkDataSource)sharedStoreArtworkDataSource
{
  if (sharedStoreArtworkDataSource_sOnceToken != -1) {
    dispatch_once(&sharedStoreArtworkDataSource_sOnceToken, &__block_literal_global_27030);
  }
  v2 = (void *)sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource;

  return (MPStoreArtworkDataSource *)v2;
}

- (id)_bestURLForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  id v7 = a3;
  [(MPStoreArtworkDataSource *)self bestAvailableSizeForCatalog:v7];
  double v10 = v9;
  double v11 = v8;
  if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v17 = 0;
    goto LABEL_21;
  }
  v13 = [v7 token];
  v14 = v13;
  if (a4 == 1)
  {
    uint64_t v18 = [v7 preferredVideoFormat];
    if (v18)
    {
      if (v18 != 1) {
        goto LABEL_14;
      }
      v16 = [v14 videoArtworkInfo];
      uint64_t v19 = objc_msgSend(v16, "CRABSVideoURLMatchingSize:", v10, v11);
    }
    else
    {
      v16 = [v14 videoArtworkInfo];
      uint64_t v19 = [v16 HLSVideoURLForAspectRatio:v10 / v11];
    }
    v17 = (void *)v19;
    goto LABEL_19;
  }
  if (!a4)
  {
    uint64_t v15 = [v13 artworkInfoType];
    if (v15 == 1)
    {
      v20 = [v14 videoArtworkInfo];
      v16 = [v20 previewFrameArtworkInfoMatchingAspectRatio:v10 / v11];

      goto LABEL_16;
    }
    if (!v15)
    {
      v16 = [v14 imageArtworkInfo];
LABEL_16:
      v21 = [v14 cropStyle];
      v22 = [v14 format];
      v17 = objc_msgSend(v16, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", v21, v22, MSVDeviceSupportsExtendedColorDisplay(), v10, v11);

LABEL_19:
      goto LABEL_20;
    }
  }
LABEL_14:
  v17 = 0;
LABEL_20:

LABEL_21:

  return v17;
}

- (CGSize)bestAvailableSizeForCatalog:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v7 = [v4 token];
  uint64_t v8 = [v7 artworkInfoType];
  if (v8 == 1)
  {
    [v4 fittingSize];
    double v14 = v13;
    [v4 fittingSize];
    double v16 = v14 / v15;
    uint64_t v17 = [v4 preferredVideoFormat];
    if (!v17)
    {
      v21 = [v7 videoArtworkInfo];
      v22 = [v21 HLSVideoURLForAspectRatio:v16];

      if (!v22) {
        goto LABEL_9;
      }
      v23 = [v7 videoArtworkInfo];
      double v10 = [v23 previewFrameArtworkInfoMatchingAspectRatio:v16];

      v24 = [v10 sizeInfo];
      [(MPStoreArtworkDataSource *)self _bestSizeForImageSizeInfo:v24 catalog:v4];
      double v5 = v25;
      double v6 = v26;

      goto LABEL_8;
    }
    if (v17 == 1)
    {
      uint64_t v18 = [v7 videoArtworkInfo];
      double v10 = [v18 supportedSizesForCRABSVideoForAspectRatio:v16];

      [v4 scaledFittingSize];
      ICStoreVideoArtworkInfoBestSizesForSize();
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
    double v9 = [v7 imageArtworkInfo];
    double v10 = [v9 sizeInfo];

    [(MPStoreArtworkDataSource *)self _bestSizeForImageSizeInfo:v10 catalog:v4];
LABEL_7:
    double v5 = v11;
    double v6 = v12;
LABEL_8:
  }
LABEL_9:

  double v19 = v5;
  double v20 = v6;
  result.height = v20;
  result.width = v19;
  return result;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)[a3 token];
}

- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  double v6 = [(MPStoreArtworkDataSource *)self _bestURLForCatalog:a3 kind:a5.width size:a5.height];
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x1E4FB8600] standardDefaults];
  int v8 = [v7 isLegacyStoreCacheBusterEnabled];

  if (v8)
  {
    double v9 = [MEMORY[0x1E4F29128] UUID];
    double v10 = [v9 UUIDString];

    double v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"buster" value:v10];
    v17[0] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    uint64_t v13 = objc_msgSend(v6, "ic_URLByAppendingQueryItems:", v12);

    double v6 = (void *)v13;
  }
  if (a4 == 1)
  {
    uint64_t v14 = [MEMORY[0x1E4F290D0] requestWithURL:v6];
    goto LABEL_9;
  }
  if (a4)
  {
LABEL_7:
    double v15 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = [MEMORY[0x1E4F290D0] requestWithURL:v6 cachePolicy:0 timeoutInterval:60.0];
LABEL_9:
  double v15 = (void *)v14;
LABEL_10:

  return v15;
}

- (id)sortedSupportedSizesForCatalog:(id)a3
{
  id v4 = a3;
  double v5 = [v4 token];
  [v4 scaledFittingSize];
  double v7 = v6;
  double v9 = v8;

  MSVGetMaximumScreenSize();
  double v11 = v10;
  double v13 = v12;
  int v14 = MGGetBoolAnswer();
  double v15 = 3384.0;
  if (!v14) {
    double v15 = v13;
  }
  double v16 = 6016.0;
  if (!v14) {
    double v16 = v11;
  }
  if (v16 >= v15) {
    double v15 = v16;
  }
  uint64_t v17 = (uint64_t)v15;
  if (!(uint64_t)v15) {
    uint64_t v17 = 1024;
  }
  -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v7, v9, (double)(unint64_t)v17, (double)(unint64_t)v17);
  double v19 = v18;
  double v21 = v20;
  v22 = [v5 imageArtworkInfo];
  v23 = [v22 sizeInfo];
  uint64_t v24 = [v23 type];
  if (v24 == 2)
  {
    double v25 = [v23 supportedSizes];
  }
  else
  {
    if (v24 == 1)
    {
      if ([v23 hasMaxSupportedSize])
      {
        [v23 maxSupportedSize];
        -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v19, v21, v26, v27);
        double v19 = v28;
        double v21 = v29;
      }
    }
    else if (v24)
    {
      double v25 = 0;
      goto LABEL_17;
    }
    v30 = (void *)MEMORY[0x1E4F1C978];
    v31 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v19, v21);
    double v25 = [v30 arrayWithObject:v31];
  }
LABEL_17:

  return v25;
}

- (CGSize)_bestSizeForImageSizeInfo:(id)a3 catalog:(id)a4
{
  id v6 = a3;
  [a4 scaledFittingSize];
  double v8 = v7;
  double v10 = v9;
  MSVGetMaximumScreenSize();
  double v12 = v11;
  double v14 = v13;
  int v15 = MGGetBoolAnswer();
  double v16 = 3384.0;
  if (!v15) {
    double v16 = v14;
  }
  double v17 = 6016.0;
  if (!v15) {
    double v17 = v12;
  }
  if (v17 >= v16) {
    double v16 = v17;
  }
  uint64_t v18 = (uint64_t)v16;
  if (!(uint64_t)v16) {
    uint64_t v18 = 1024;
  }
  -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v8, v10, (double)(unint64_t)v18, (double)(unint64_t)v18);
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [v6 type];
  if (v23 == 2)
  {
    uint64_t v24 = [v6 supportedSizes];
    double v20 = MPArtworkRepresentationBestSizeMatchingSize(v24, v20, v22);
    double v22 = v25;
  }
  else if (v23 == 1)
  {
    if ([v6 hasMaxSupportedSize])
    {
      [v6 maxSupportedSize];
      -[MPStoreArtworkDataSource _clampImageSize:toMaxSupportedSize:](self, "_clampImageSize:toMaxSupportedSize:", v20, v22, v26, v27);
      double v20 = v28;
      double v22 = v29;
    }
  }
  else if (v23)
  {
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v20 = *MEMORY[0x1E4F1DB30];
  }

  double v30 = v20;
  double v31 = v22;
  result.height = v31;
  result.width = v30;
  return result;
}

- (CGSize)_clampImageSize:(CGSize)a3 toMaxSupportedSize:(CGSize)a4
{
  double width = ceil(a3.width);
  double height = ceil(a3.height);
  if (width > a4.width + 0.00000011920929)
  {
    double height = round(height * (a4.width / width));
    double width = a4.width;
  }
  if (height > a4.height + 0.00000011920929)
  {
    double width = round(width * (a4.height / height));
    double height = a4.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return MSVCurrentProcessIsNonUIPlaybackService() ^ 1;
}

void __56__MPStoreArtworkDataSource_sharedStoreArtworkDataSource__block_invoke()
{
  v0 = objc_alloc_init(MPStoreArtworkDataSource);
  v1 = (void *)sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource;
  sharedStoreArtworkDataSource_sSharedStoreArtworkDataSource = (uint64_t)v0;
}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  double v5 = [a4 token];
  id v6 = v5;
  if (a3 == 1)
  {
    double v7 = [v5 videoArtworkInfo];
  }
  else
  {
    if (a3)
    {
      BOOL v8 = 0;
      goto LABEL_7;
    }
    double v7 = [v5 imageArtworkInfo];
  }
  BOOL v8 = v7 != 0;

LABEL_7:
  return v8;
}

- (void)getExportableArtworkPropertiesForCatalog:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, MPExportableArtworkProperties *, void *))a4;
  double v7 = objc_alloc_init(MPExportableArtworkProperties);
  BOOL v8 = [v19 token];
  double v9 = [v8 imageArtworkInfo];
  double v10 = [v9 responseArray];

  if (v10)
  {
    double v11 = [v9 responseArray];
  }
  else
  {
    double v11 = [v9 responseDictionary];

    if (v11)
    {
      double v12 = (void *)MEMORY[0x1E4F1C978];
      double v13 = [v9 responseDictionary];
      double v11 = [v12 arrayWithObject:v13];
    }
  }
  [(MPExportableArtworkProperties *)v7 setArtworkTemplateItems:v11];
  [v19 fittingSize];
  double v14 = -[MPStoreArtworkDataSource _bestURLForCatalog:kind:size:](self, "_bestURLForCatalog:kind:size:", v19, 0);
  int v15 = [v14 absoluteString];
  [(MPExportableArtworkProperties *)v7 setResolvedURLString:v15];

  double v16 = [(MPExportableArtworkProperties *)v7 artworkTemplateItems];
  if (v16)
  {

    goto LABEL_8;
  }
  double v17 = [(MPExportableArtworkProperties *)v7 resolvedURLString];

  if (v17)
  {
LABEL_8:
    uint64_t v18 = 0;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPErrorDomain" code:4 userInfo:0];
  if (v6) {
LABEL_9:
  }
    v6[2](v6, v7, v18);
LABEL_10:
}

- (BOOL)hasExportableArtworkPropertiesForCatalog:(id)a3
{
  return [(MPStoreArtworkDataSource *)self areRepresentationsOfKind:0 availableForCatalog:a3];
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  id v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)MPStoreArtworkDataSource;
  double v9 = [(MPAbstractNetworkArtworkDataSource *)&v55 existingArtworkEffectResultForEffectType:a3 catalog:v8 options:a5];
  if (a3 != 4)
  {
    if (a3 != 1) {
      goto LABEL_40;
    }
    double v10 = [v8 token];
    uint64_t v11 = [v10 artworkInfoType];
    v51 = v10;
    v53 = v9;
    if (v11 == 1)
    {
      [v8 fittingSize];
      double v16 = v15;
      [v8 fittingSize];
      double v18 = v16 / v17;
      id v19 = [v10 videoArtworkInfo];
      double v12 = [v19 previewFrameArtworkInfoMatchingAspectRatio:v18];
    }
    else if (v11)
    {
      double v12 = 0;
    }
    else
    {
      double v12 = [v10 imageArtworkInfo];
    }
    double v20 = (CGColor *)[v12 copyColorWithKind:*MEMORY[0x1E4FB8448]];
    double v21 = (CGColor *)[v12 copyColorWithKind:*MEMORY[0x1E4FB8450]];
    double v22 = (CGColor *)[v12 copyColorWithKind:*MEMORY[0x1E4FB8458]];
    uint64_t v23 = (CGColor *)[v12 copyColorWithKind:*MEMORY[0x1E4FB8460]];
    if (v20)
    {
      uint64_t v24 = [MEMORY[0x1E4FB1618] colorWithCGColor:v20];
      if (v21) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v24 = 0;
      if (v21)
      {
LABEL_13:
        double v25 = [MEMORY[0x1E4FB1618] colorWithCGColor:v21];
        if (v22) {
          goto LABEL_14;
        }
        goto LABEL_18;
      }
    }
    double v25 = 0;
    if (v22)
    {
LABEL_14:
      double v26 = [MEMORY[0x1E4FB1618] colorWithCGColor:v22];
      if (v23)
      {
LABEL_15:
        double v27 = [MEMORY[0x1E4FB1618] colorWithCGColor:v23];
LABEL_20:
        CGColorRelease(v20);
        CGColorRelease(v21);
        CGColorRelease(v22);
        CGColorRelease(v23);
        if (v24 || v25 || v26)
        {
          double v9 = objc_alloc_init(MPMutableArtworkColorAnalysis);
          [(MPMutableArtworkColorAnalysis *)v9 setBackgroundColor:v24];
          -[MPMutableArtworkColorAnalysis setBackgroundColorLight:](v9, "setBackgroundColorLight:", objc_msgSend(v24, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));
          [(MPMutableArtworkColorAnalysis *)v9 setPrimaryTextColor:v25];
          -[MPMutableArtworkColorAnalysis setPrimaryTextColorLight:](v9, "setPrimaryTextColorLight:", objc_msgSend(v25, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));
          [(MPMutableArtworkColorAnalysis *)v9 setSecondaryTextColor:v26];
          [(MPMutableArtworkColorAnalysis *)v9 setSecondaryTextColorLight:[(MPArtworkGradientInfo *)v26 MP_isArtworkColorAnalyzerLightColorForAlgorithm:1]];
          [(MPMutableArtworkColorAnalysis *)v9 setTertiaryTextColor:v27];
          -[MPMutableArtworkColorAnalysis setTertiaryTextColorLight:](v9, "setTertiaryTextColorLight:", objc_msgSend(v27, "MP_isArtworkColorAnalyzerLightColorForAlgorithm:", 1));

          double v13 = v51;
        }
        else
        {
          double v25 = 0;
          uint64_t v24 = 0;
          double v13 = v51;
          double v9 = v53;
        }
        goto LABEL_38;
      }
LABEL_19:
      double v27 = 0;
      goto LABEL_20;
    }
LABEL_18:
    double v26 = 0;
    if (v23) {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  double v13 = [v8 token];
  uint64_t v14 = [v13 artworkInfoType];
  if (v14 == 1)
  {
    [v8 fittingSize];
    double v29 = v28;
    [v8 fittingSize];
    double v31 = v29 / v30;
    v32 = [v13 videoArtworkInfo];
    double v12 = [v32 previewFrameArtworkInfoMatchingAspectRatio:v31];
  }
  else if (v14)
  {
    double v12 = 0;
  }
  else
  {
    double v12 = [v13 imageArtworkInfo];
  }
  uint64_t v24 = [v12 textGradient];
  char v33 = [v12 imageTraits];
  if ([v24 count])
  {
    v34 = (void *)MEMORY[0x1E4FB1618];
    v35 = [v24 firstObject];
    double v25 = [v34 colorWithCGColor:v35];
  }
  else
  {
    double v25 = 0;
  }
  v36 = [v12 gradientInfo];
  if (v36)
  {
    v37 = [MPArtworkGradientInfo alloc];
    v54 = v9;
    v38 = (void *)MEMORY[0x1E4FB1618];
    v39 = [v12 gradientInfo];
    v40 = objc_msgSend(v38, "colorWithCGColor:", objc_msgSend(v39, "color"));
    [v12 gradientInfo];
    id v50 = v8;
    v52 = v24;
    v42 = v41 = v13;
    [v42 y1];
    double v44 = v43;
    [v12 gradientInfo];
    v46 = char v45 = v33;
    [v46 y2];
    double v26 = [(MPArtworkGradientInfo *)v37 initWithColor:v40 y1:v44 y2:v47];

    char v33 = v45;
    double v13 = v41;
    id v8 = v50;
    uint64_t v24 = v52;

    double v9 = v54;
  }
  else
  {
    double v26 = 0;
  }

  if (v25 || (v33 & 1) != 0 || v26)
  {
    v48 = [[MPArtworkImageAttachments alloc] initWithTextColor:v25 gradientInfo:v26 hasTitle:v33 & 1];
    double v27 = v9;
    double v9 = (MPMutableArtworkColorAnalysis *)v48;
LABEL_38:

    goto LABEL_39;
  }
  double v25 = 0;
LABEL_39:

LABEL_40:

  return v9;
}

@end