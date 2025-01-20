@interface LPApplePhotosMomentMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPApplePhotosMomentMetadata)initWithCoder:(id)a3;
- (LPImage)keyPhoto;
- (NSDate)earliestAssetDate;
- (NSDate)expirationDate;
- (NSDate)latestAssetDate;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (id)previewImageForTransformer:(id)a3;
- (id)previewSummaryForTransformer:(id)a3;
- (unint64_t)hash;
- (unint64_t)otherItemCount;
- (unint64_t)photoCount;
- (unint64_t)videoCount;
- (void)_enumerateAsynchronousFields:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateMetadataForBackwardCompatibility:(id)a3;
- (void)setEarliestAssetDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setKeyPhoto:(id)a3;
- (void)setLatestAssetDate:(id)a3;
- (void)setOtherItemCount:(unint64_t)a3;
- (void)setPhotoCount:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setVideoCount:(unint64_t)a3;
@end

@implementation LPApplePhotosMomentMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPApplePhotosMomentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPApplePhotosMomentMetadata;
  v5 = [(LPApplePhotosMomentMetadata *)&v18 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"title");
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_photoCount = [v4 decodeInt64ForKey:@"photoCount"];
    v5->_videoCount = [v4 decodeInt64ForKey:@"videoCount"];
    v5->_otherItemCount = [v4 decodeInt64ForKey:@"otherItemCount"];
    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", @"keyPhoto");
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (LPImage *)v8;

    uint64_t v10 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"expirationDate");
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    uint64_t v12 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"earliestAssetDate");
    earliestAssetDate = v5->_earliestAssetDate;
    v5->_earliestAssetDate = (NSDate *)v12;

    uint64_t v14 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"latestAssetDate");
    latestAssetDate = v5->_latestAssetDate;
    v5->_latestAssetDate = (NSDate *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_title, @"title");
  [v4 encodeInt64:self->_photoCount forKey:@"photoCount"];
  [v4 encodeInt64:self->_videoCount forKey:@"videoCount"];
  [v4 encodeInt64:self->_otherItemCount forKey:@"otherItemCount"];
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_keyPhoto, @"keyPhoto");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_expirationDate, @"expirationDate");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_earliestAssetDate, @"earliestAssetDate");
  objc_msgSend(v4, "_lp_encodeObjectIfNotNil:forKey:", self->_latestAssetDate, @"latestAssetDate");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPApplePhotosMomentMetadata allocWithZone:a3];
  if (v4)
  {
    v5 = [(LPApplePhotosMomentMetadata *)self title];
    [(LPApplePhotosMomentMetadata *)v4 setTitle:v5];

    [(LPApplePhotosMomentMetadata *)v4 setPhotoCount:[(LPApplePhotosMomentMetadata *)self photoCount]];
    [(LPApplePhotosMomentMetadata *)v4 setVideoCount:[(LPApplePhotosMomentMetadata *)self videoCount]];
    [(LPApplePhotosMomentMetadata *)v4 setOtherItemCount:[(LPApplePhotosMomentMetadata *)self otherItemCount]];
    uint64_t v6 = [(LPApplePhotosMomentMetadata *)self keyPhoto];
    [(LPApplePhotosMomentMetadata *)v4 setKeyPhoto:v6];

    v7 = [(LPApplePhotosMomentMetadata *)self expirationDate];
    [(LPApplePhotosMomentMetadata *)v4 setExpirationDate:v7];

    uint64_t v8 = [(LPApplePhotosMomentMetadata *)self earliestAssetDate];
    [(LPApplePhotosMomentMetadata *)v4 setEarliestAssetDate:v8];

    v9 = [(LPApplePhotosMomentMetadata *)self latestAssetDate];
    [(LPApplePhotosMomentMetadata *)v4 setLatestAssetDate:v9];

    uint64_t v10 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPApplePhotosMomentMetadata;
  if ([(LPApplePhotosMomentMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_0(v6[2], self->_title) & 1) != 0
        && v6[3] == (void *)self->_photoCount
        && v6[4] == (void *)self->_videoCount
        && v6[5] == (void *)self->_otherItemCount
        && objectsAreEqual_0(v6[6], self->_keyPhoto)
        && objectsAreEqual_0(v6[7], self->_expirationDate)
        && objectsAreEqual_0(v6[8], self->_earliestAssetDate))
      {
        char v5 = objectsAreEqual_0(v6[9], self->_latestAssetDate);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_title hash];
}

- (void)_enumerateAsynchronousFields:(id)a3
{
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"photoCount", @"videoCount", @"otherItemCount", @"keyPhoto", @"expirationDate", @"earliestAssetDate", @"latestAssetDate", 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

- (unint64_t)otherItemCount
{
  return self->_otherItemCount;
}

- (void)setOtherItemCount:(unint64_t)a3
{
  self->_otherItemCount = a3;
}

- (LPImage)keyPhoto
{
  return self->_keyPhoto;
}

- (void)setKeyPhoto:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)earliestAssetDate
{
  return self->_earliestAssetDate;
}

- (void)setEarliestAssetDate:(id)a3
{
}

- (NSDate)latestAssetDate
{
  return self->_latestAssetDate;
}

- (void)setLatestAssetDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAssetDate, 0);
  objc_storeStrong((id *)&self->_earliestAssetDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 commonPresentationPropertiesForStyle:36];
  uint64_t v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  [v5 setCaptionBar:v6];

  v7 = [(LPApplePhotosMomentMetadata *)self keyPhoto];
  [v4 _populateProperties:v5 withPrimaryImage:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__LPApplePhotosMomentMetadata_Transformers__presentationPropertiesForTransformer___block_invoke;
  aBlock[3] = &unk_1E5B04E18;
  id v8 = v5;
  id v61 = v8;
  v62 = self;
  v9 = (void (**)(void))_Block_copy(aBlock);
  if (TCCAccessPreflight()
    && !+[LPTestingOverrides forceIgnoreAllTCCChecks])
  {
    v9[2](v9);
    id v38 = v8;
    goto LABEL_26;
  }
  v63 = 0;
  if (!PhotoLibraryLibraryCore_frameworkLibrary)
  {
    uint64_t v64 = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    v66 = __PhotoLibraryLibraryCore_block_invoke;
    v67 = &__block_descriptor_40_e5_v8__0l;
    v68 = &v63;
    long long v69 = xmmword_1E5B06FE8;
    uint64_t v70 = 0;
    PhotoLibraryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotoLibraryLibraryCore_frameworkLibrary)
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    v51 = [NSString stringWithUTF8String:"void *PhotoLibraryLibrary(void)"];
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"LPApplePhotosTransformers.m", 37, @"%s", v63);

    goto LABEL_32;
  }
  if (v63) {
    free(v63);
  }
  uint64_t v10 = [(LPApplePhotosMomentMetadata *)self title];
  v11 = [(LPApplePhotosMomentMetadata *)self earliestAssetDate];
  uint64_t v12 = [(LPApplePhotosMomentMetadata *)self latestAssetDate];
  id v58 = 0;
  id v59 = 0;
  LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(v10, v11, v12, (uint64_t)&v59, (uint64_t)&v58);
  id v57 = v59;
  id v56 = v58;

  unint64_t v13 = [(LPApplePhotosMomentMetadata *)self photoCount];
  unint64_t v14 = [(LPApplePhotosMomentMetadata *)self videoCount];
  unint64_t v15 = [(LPApplePhotosMomentMetadata *)self otherItemCount];
  *(void *)&long long v69 = 0;
  *((void *)&v69 + 1) = &v69;
  uint64_t v70 = 0x2020000000;
  v16 = (void (*)(unint64_t, unint64_t, unint64_t, uint64_t, void))getPLLocalizedCountDescriptionSymbolLoc_ptr;
  v71 = getPLLocalizedCountDescriptionSymbolLoc_ptr;
  if (!getPLLocalizedCountDescriptionSymbolLoc_ptr)
  {
    uint64_t v64 = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    v66 = __getPLLocalizedCountDescriptionSymbolLoc_block_invoke;
    v67 = &unk_1E5B04EB8;
    v68 = (void **)&v69;
    __getPLLocalizedCountDescriptionSymbolLoc_block_invoke(&v64);
    v16 = *(void (**)(unint64_t, unint64_t, unint64_t, uint64_t, void))(*((void *)&v69 + 1) + 24);
  }
  _Block_object_dispose(&v69, 8);
  if (!v16)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    v53 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *LPPLLocalizedCountDescription(NSUInteger, NSUInteger, NSUInteger, BOOL, BOOL)");
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, @"LPApplePhotosTransformers.m", 30, @"%s", dlerror());

    goto LABEL_32;
  }
  v17 = v16(v13, v14, v15, 1, 0);
  id v18 = [(LPApplePhotosMomentMetadata *)self expirationDate];
  *(void *)&long long v69 = 0;
  *((void *)&v69 + 1) = &v69;
  uint64_t v70 = 0x2020000000;
  v19 = (void (*)(id))getPXCMMStringForExpiryDateSymbolLoc_ptr;
  v71 = getPXCMMStringForExpiryDateSymbolLoc_ptr;
  if (!getPXCMMStringForExpiryDateSymbolLoc_ptr)
  {
    uint64_t v64 = MEMORY[0x1E4F143A8];
    uint64_t v65 = 3221225472;
    v66 = __getPXCMMStringForExpiryDateSymbolLoc_block_invoke;
    v67 = &unk_1E5B04EB8;
    v68 = (void **)&v69;
    __getPXCMMStringForExpiryDateSymbolLoc_block_invoke(&v64);
    v19 = *(void (**)(id))(*((void *)&v69 + 1) + 24);
  }
  _Block_object_dispose(&v69, 8);
  if (!v19)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    v55 = [NSString stringWithUTF8String:"NSString *LPPXCMMStringForExpiryDate(NSDate *__strong)"];
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, @"LPApplePhotosTransformers.m", 40, @"%s", dlerror());

LABEL_32:
    __break(1u);
  }
  v20 = v19(v18);

  v21 = [(LPApplePhotosMomentMetadata *)self keyPhoto];
  if (v21)
  {
    int v22 = sizeClassAllowsMedia([v4 effectiveSizeClass]);

    if (v22)
    {
      v23 = [v8 captionBar];
      v24 = [v23 top];
      v25 = [v24 leading];
      [v25 setText:v17];

      v26 = [v8 captionBar];
      v27 = [v26 bottom];
      v28 = [v27 leading];
      [v28 setText:v20];

      v29 = [v8 captionBar];
      [v29 setTrailingAccessoryType:1];

      v30 = objc_alloc_init(LPCaptionBarPresentationProperties);
      [v8 setMediaTopCaptionBar:v30];

      v31 = [v8 mediaTopCaptionBar];
      v32 = [v31 top];
      v33 = [v32 leading];
      [v33 setText:v57];

      v34 = [v8 mediaTopCaptionBar];
      v35 = [v34 bottom];
      v36 = [v35 leading];
      [v36 setText:v56];
LABEL_24:

      goto LABEL_25;
    }
  }
  uint64_t v37 = objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v8, "style"));
  if ((unint64_t)(v37 - 2) < 2)
  {
    v39 = [v8 captionBar];
    v40 = [v39 aboveTop];
    v41 = [v40 leading];
    [v41 setText:v57];

    v42 = [v8 captionBar];
    v43 = [v42 top];
    v44 = [v43 leading];
    [v44 setText:v17];

    v34 = [v8 captionBar];
    v35 = [v34 bottom];
    v36 = [v35 leading];
    [v36 setText:v20];
    goto LABEL_24;
  }
  if (v37 == 1)
  {
    v45 = [v8 captionBar];
    v46 = [v45 top];
    v47 = [v46 leading];
    [v47 setText:v57];

    v34 = [v8 captionBar];
    v35 = [v34 bottom];
    v36 = [v35 leading];
    [v36 setText:v56];
    goto LABEL_24;
  }
  if (!v37)
  {
    v34 = [v8 captionBar];
    v35 = [v34 top];
    v36 = [v35 leading];
    [v36 setText:v57];
    goto LABEL_24;
  }
LABEL_25:
  id v48 = v8;

LABEL_26:

  return v8;
}

void __82__LPApplePhotosMomentMetadata_Transformers__presentationPropertiesForTransformer___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 40) title];
  v2 = [*(id *)(a1 + 32) captionBar];
  v3 = [v2 top];
  id v4 = [v3 leading];
  [v4 setText:v8];

  LPLocalizedString(@"Photos");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = [*(id *)(a1 + 32) captionBar];
  uint64_t v6 = [v5 bottom];
  v7 = [v6 leading];
  [v7 setText:v9];
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isiCloudURL:a3];
}

- (id)previewSummaryForTransformer:(id)a3
{
  id v4 = NSString;
  char v5 = LPLocalizedString(@"Photos: %@");
  uint64_t v6 = [(LPApplePhotosMomentMetadata *)self title];
  v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

  return v7;
}

- (id)previewImageForTransformer:(id)a3
{
  v3 = [(LPApplePhotosMomentMetadata *)self keyPhoto];

  return v3;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  id v4 = a3;
  char v5 = [(LPApplePhotosMomentMetadata *)self title];
  uint64_t v6 = [(LPApplePhotosMomentMetadata *)self earliestAssetDate];
  v7 = [(LPApplePhotosMomentMetadata *)self latestAssetDate];
  id v12 = 0;
  id v13 = 0;
  LPPLCMMTitleAndSubtitleForTitleAndFallbackDates(v5, v6, v7, (uint64_t)&v13, (uint64_t)&v12);
  id v8 = v13;
  id v9 = v12;

  if (v9)
  {
    uint64_t v10 = joinedByEmDash(v8, v9);
    [v4 setTitle:v10];
  }
  else
  {
    [v4 setTitle:v8];
  }
  v11 = [(LPApplePhotosMomentMetadata *)self keyPhoto];
  [v4 setImage:v11];
}

@end