@interface VCPFaceUtils
+ (BOOL)isBestResourceForFaceProcessing:(id)a3 fromResources:(id)a4;
+ (CGRect)faceRectFromNormalizedCenterX:(double)a3 normalizedCenterY:(double)a4 normalizedSize:(double)a5 sourceWidth:(double)a6 sourceHeight:(double)a7;
+ (id)_firstLocallyAvailableResourceFromResources:(id)a3;
+ (id)_vnFaceAttributeAgeToPHFaceAgeTypeMap;
+ (id)_vnFaceAttributeEthnicityToPHFaceEthnicityType;
+ (id)_vnFaceAttributeEyesToPHEyesStateMap;
+ (id)_vnFaceAttributeFacialHairToPHFaceExpressionType;
+ (id)_vnFaceAttributeFacialHairToPHFacialHairTypeMap;
+ (id)_vnFaceAttributeGlassesToPHFaceGlassesTypeMap;
+ (id)_vnFaceAttributeHairColorToPHFaceHairColorTypeMap;
+ (id)_vnFaceAttributeHairTypeToPHFaceHairType;
+ (id)_vnFaceAttributeHeadGearToPHFaceHeadGearType;
+ (id)_vnFaceAttributePoseToPHFacePoseType;
+ (id)_vnFaceAttributeSexToPHFaceSexTypeMap;
+ (id)_vnFaceAttributeSkintoneToPHFaceSkintoneType;
+ (id)_vnFaceAttributeSmileToPHFaceSmileTypeMap;
+ (id)_vnFaceGazeDirectionToPHFaceGazeType;
+ (id)imageCreationOptions;
+ (id)mad_PHFaceGazeTypeDescription:(unsigned __int16)a3;
+ (id)mad_VNFaceGazeDirectionDescription:(int64_t)a3;
+ (id)phFaceFromVCPPhotosFace:(id)a3 withFetchOptions:(id)a4;
+ (id)phFacesFromVCPPhotosFaces:(id)a3 withFetchOptions:(id)a4;
+ (id)preferredResourcesForFaceProcessingWithAsset:(id)a3;
+ (id)resourceForFaceProcessing:(id)a3 allowStreaming:(BOOL)a4;
+ (id)resourceForFaceProcessingWithAsset:(id)a3 allowStreaming:(BOOL)a4;
+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andProcessingVersion:(int)a5;
+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andVisionRevision:(unint64_t)a5;
+ (unsigned)mad_PHValueFromVNAgeCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNEthnicityCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNExpressionCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNEyesCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNFaceGazeDirection:(int64_t)a3;
+ (unsigned)mad_PHValueFromVNFaceHairCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNFaceHairCategoryV2Label:(id)a3;
+ (unsigned)mad_PHValueFromVNGlassesCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNHairColorCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNHeadgearCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNPoseCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNSexCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNSkintoneCategoryLabel:(id)a3;
+ (unsigned)mad_PHValueFromVNSmilingCategoryLabel:(id)a3;
+ (void)assignPropertiesOfVCPPhotosFace:(id)a3 toPHFaceChangeRequest:(id)a4;
@end

@implementation VCPFaceUtils

+ (id)imageCreationOptions
{
  if (+[VCPFaceUtils imageCreationOptions]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils imageCreationOptions]::onceToken, &__block_literal_global_15);
  }
  v2 = (void *)+[VCPFaceUtils imageCreationOptions]::kImageCreationOptions;
  return v2;
}

void __36__VCPFaceUtils_imageCreationOptions__block_invoke()
{
  v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F2FF88];
  v3[0] = *MEMORY[0x1E4F2FF80];
  v3[1] = v0;
  v4[0] = MEMORY[0x1E4F1CC38];
  v4[1] = MEMORY[0x1E4F1CC28];
  v3[2] = *MEMORY[0x1E4F2FF48];
  v4[2] = MEMORY[0x1E4F1CC38];
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)+[VCPFaceUtils imageCreationOptions]::kImageCreationOptions;
  +[VCPFaceUtils imageCreationOptions]::kImageCreationOptions = v1;
}

+ (id)phFacesFromVCPPhotosFaces:(id)a3 withFetchOptions:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v13 = [v12 localIdentifier];
        BOOL v14 = v13 == 0;

        if (!v14)
        {
          v15 = [v12 localIdentifier];
          [v7 addObject:v15];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  if ([v7 count])
  {
    v16 = [MEMORY[0x1E4F39048] fetchFacesWithLocalIdentifiers:v7 options:v6];
    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__VCPFaceUtils_phFacesFromVCPPhotosFaces_withFetchOptions___block_invoke;
    v20[3] = &unk_1E6298228;
    id v18 = v17;
    id v21 = v18;
    [v16 enumerateObjectsUsingBlock:v20];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __59__VCPFaceUtils_phFacesFromVCPPhotosFaces_withFetchOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)_vnFaceAttributeAgeToPHFaceAgeTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::onceToken, &__block_literal_global_381);
  }
  v2 = (void *)+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap;
  return v2;
}

void __53__VCPFaceUtils__vnFaceAttributeAgeToPHFaceAgeTypeMap__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45BF0];
  v4[0] = *MEMORY[0x1E4F45BE8];
  v4[1] = v0;
  v5[0] = &unk_1F15EB508;
  v5[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F45BE0];
  v4[2] = *MEMORY[0x1E4F45C00];
  v4[3] = v1;
  v5[2] = &unk_1F15EB538;
  v5[3] = &unk_1F15EB550;
  void v4[4] = *MEMORY[0x1E4F45BF8];
  v5[4] = &unk_1F15EB568;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  v3 = (void *)+[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeAgeToPHFaceAgeTypeMap]::categoryMap = v2;
}

+ (unsigned)mad_PHValueFromVNAgeCategoryLabel:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _vnFaceAttributeAgeToPHFaceAgeTypeMap];
  id v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeSexToPHFaceSexTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::onceToken, &__block_literal_global_392);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap;
  return v2;
}

void __53__VCPFaceUtils__vnFaceAttributeSexToPHFaceSexTypeMap__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45AE0];
  v3[0] = *MEMORY[0x1E4F459C0];
  v3[1] = v0;
  v4[0] = &unk_1F15EB508;
  v4[1] = &unk_1F15EB520;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSexToPHFaceSexTypeMap]::categoryMap = v1;
}

+ (unsigned)mad_PHValueFromVNSexCategoryLabel:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _vnFaceAttributeSexToPHFaceSexTypeMap];
  id v6 = [v5 objectForKeyedSubscript:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeEyesToPHEyesStateMap
{
  if (+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::onceToken, &__block_literal_global_394);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap;
  return v2;
}

void __52__VCPFaceUtils__vnFaceAttributeEyesToPHEyesStateMap__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45C08];
  v3[0] = *MEMORY[0x1E4F45C10];
  v3[1] = v0;
  v4[0] = &unk_1F15EB520;
  v4[1] = &unk_1F15EB508;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeEyesToPHEyesStateMap]::categoryMap = v1;
}

+ (unsigned)mad_PHValueFromVNEyesCategoryLabel:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _vnFaceAttributeEyesToPHEyesStateMap];
  id v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeSmileToPHFaceSmileTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::onceToken, &__block_literal_global_396_0);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap;
  return v2;
}

void __57__VCPFaceUtils__vnFaceAttributeSmileToPHFaceSmileTypeMap__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45C90];
  v3[0] = *MEMORY[0x1E4F45C98];
  v3[1] = v0;
  v4[0] = &unk_1F15EB520;
  v4[1] = &unk_1F15EB508;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSmileToPHFaceSmileTypeMap]::categoryMap = v1;
}

+ (unsigned)mad_PHValueFromVNSmilingCategoryLabel:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _vnFaceAttributeSmileToPHFaceSmileTypeMap];
  id v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeFacialHairToPHFacialHairTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::onceToken, &__block_literal_global_398);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap;
  return v2;
}

void __63__VCPFaceUtils__vnFaceAttributeFacialHairToPHFacialHairTypeMap__block_invoke()
{
  v9[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45C20];
  v8[0] = *MEMORY[0x1E4F45C18];
  v8[1] = v0;
  v9[0] = &unk_1F15EB520;
  v9[1] = &unk_1F15EB538;
  uint64_t v1 = *MEMORY[0x1E4F45C30];
  v8[2] = *MEMORY[0x1E4F45C28];
  v8[3] = v1;
  v9[2] = &unk_1F15EB568;
  v9[3] = &unk_1F15EB550;
  uint64_t v2 = *MEMORY[0x1E4F45A40];
  v8[4] = *MEMORY[0x1E4F45C38];
  v8[5] = v2;
  v9[4] = &unk_1F15EB508;
  v9[5] = &unk_1F15EB520;
  uint64_t v3 = *MEMORY[0x1E4F45AA0];
  v8[6] = *MEMORY[0x1E4F45B30];
  v8[7] = v3;
  v9[6] = &unk_1F15EB538;
  v9[7] = &unk_1F15EB580;
  uint64_t v4 = *MEMORY[0x1E4F45A70];
  v8[8] = *MEMORY[0x1E4F45A30];
  v8[9] = v4;
  v9[8] = &unk_1F15EB598;
  v9[9] = &unk_1F15EB568;
  uint64_t v5 = *MEMORY[0x1E4F45A80];
  v8[10] = *MEMORY[0x1E4F45A10];
  v8[11] = v5;
  v9[10] = &unk_1F15EB5B0;
  v9[11] = &unk_1F15EB550;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:12];
  v7 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeFacialHairToPHFacialHairTypeMap]::categoryMap = v6;
}

+ (unsigned)mad_PHValueFromVNFaceHairCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeFacialHairToPHFacialHairTypeMap];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeHairColorToPHFaceHairColorTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::onceToken, &__block_literal_global_406);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap;
  return v2;
}

void __65__VCPFaceUtils__vnFaceAttributeHairColorToPHFaceHairColorTypeMap__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45C68];
  v5[0] = *MEMORY[0x1E4F45C60];
  v5[1] = v0;
  v6[0] = &unk_1F15EB508;
  v6[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F45C78];
  v5[2] = *MEMORY[0x1E4F45C70];
  v5[3] = v1;
  v6[2] = &unk_1F15EB538;
  v6[3] = &unk_1F15EB568;
  uint64_t v2 = *MEMORY[0x1E4F45C88];
  v5[4] = *MEMORY[0x1E4F45C80];
  v5[5] = v2;
  v6[4] = &unk_1F15EB550;
  v6[5] = &unk_1F15EB5B0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)+[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHairColorToPHFaceHairColorTypeMap]::categoryMap = v3;
}

+ (unsigned)mad_PHValueFromVNHairColorCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeHairColorToPHFaceHairColorTypeMap];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeGlassesToPHFaceGlassesTypeMap
{
  if (+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::onceToken, &__block_literal_global_408);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap;
  return v2;
}

void __61__VCPFaceUtils__vnFaceAttributeGlassesToPHFaceGlassesTypeMap__block_invoke()
{
  void v4[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45C58];
  v3[0] = *MEMORY[0x1E4F45C50];
  v3[1] = v0;
  v4[0] = &unk_1F15EB508;
  v4[1] = &unk_1F15EB520;
  void v3[2] = *MEMORY[0x1E4F45C48];
  v4[2] = &unk_1F15EB538;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeGlassesToPHFaceGlassesTypeMap]::categoryMap = v1;
}

+ (unsigned)mad_PHValueFromVNGlassesCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeGlassesToPHFaceGlassesTypeMap];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeFacialHairToPHFaceExpressionType
{
  if (+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::onceToken, &__block_literal_global_410);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap;
  return v2;
}

void __64__VCPFaceUtils__vnFaceAttributeFacialHairToPHFaceExpressionType__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45AA8];
  v5[0] = *MEMORY[0x1E4F45B28];
  v5[1] = v0;
  v6[0] = &unk_1F15EB508;
  v6[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F459B0];
  v5[2] = *MEMORY[0x1E4F45A68];
  v5[3] = v1;
  v6[2] = &unk_1F15EB538;
  v6[3] = &unk_1F15EB568;
  uint64_t v2 = *MEMORY[0x1E4F45AE8];
  v5[4] = *MEMORY[0x1E4F459E8];
  v5[5] = v2;
  v6[4] = &unk_1F15EB550;
  v6[5] = &unk_1F15EB5B0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)+[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeFacialHairToPHFaceExpressionType]::categoryMap = v3;
}

+ (unsigned)mad_PHValueFromVNExpressionCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeFacialHairToPHFaceExpressionType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeHeadGearToPHFaceHeadGearType
{
  if (+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::onceToken, &__block_literal_global_412);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap;
  return v2;
}

void __60__VCPFaceUtils__vnFaceAttributeHeadGearToPHFaceHeadGearType__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45CC0];
  v4[0] = *MEMORY[0x1E4F45A00];
  v4[1] = v0;
  v5[0] = &unk_1F15EB508;
  v5[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F45A48];
  v4[2] = *MEMORY[0x1E4F45A78];
  void v4[3] = v1;
  v5[2] = &unk_1F15EB538;
  v5[3] = &unk_1F15EB568;
  void v4[4] = *MEMORY[0x1E4F45A18];
  v5[4] = &unk_1F15EB550;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  uint64_t v3 = (void *)+[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHeadGearToPHFaceHeadGearType]::categoryMap = v2;
}

+ (unsigned)mad_PHValueFromVNHeadgearCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeHeadGearToPHFaceHeadGearType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeHairTypeToPHFaceHairType
{
  if (+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::onceToken, &__block_literal_global_414);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap;
  return v2;
}

void __56__VCPFaceUtils__vnFaceAttributeHairTypeToPHFaceHairType__block_invoke()
{
  v6[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F459F0];
  v5[0] = *MEMORY[0x1E4F45AF0];
  v5[1] = v0;
  v6[0] = &unk_1F15EB508;
  v6[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F45A90];
  v5[2] = *MEMORY[0x1E4F45A88];
  v5[3] = v1;
  v6[2] = &unk_1F15EB538;
  v6[3] = &unk_1F15EB568;
  uint64_t v2 = *MEMORY[0x1E4F45B08];
  v5[4] = *MEMORY[0x1E4F459C8];
  v5[5] = v2;
  v6[4] = &unk_1F15EB550;
  v6[5] = &unk_1F15EB5B0;
  void v5[6] = *MEMORY[0x1E4F45AC8];
  v5[7] = v5[0];
  v6[6] = &unk_1F15EB580;
  void v6[7] = &unk_1F15EB508;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:8];
  id v4 = (void *)+[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeHairTypeToPHFaceHairType]::categoryMap = v3;
}

+ (unsigned)mad_PHValueFromVNFaceHairCategoryV2Label:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeHairTypeToPHFaceHairType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributePoseToPHFacePoseType
{
  if (+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::onceToken, &__block_literal_global_416);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap;
  return v2;
}

void __52__VCPFaceUtils__vnFaceAttributePoseToPHFacePoseType__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45B10];
  v4[0] = *MEMORY[0x1E4F45A98];
  v4[1] = v0;
  v5[0] = &unk_1F15EB508;
  v5[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F45B18];
  v4[2] = *MEMORY[0x1E4F45A38];
  void v4[3] = v1;
  v5[2] = &unk_1F15EB538;
  v5[3] = &unk_1F15EB568;
  void v4[4] = *MEMORY[0x1E4F459A0];
  v5[4] = &unk_1F15EB550;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  uint64_t v3 = (void *)+[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributePoseToPHFacePoseType]::categoryMap = v2;
}

+ (unsigned)mad_PHValueFromVNPoseCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributePoseToPHFacePoseType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeSkintoneToPHFaceSkintoneType
{
  if (+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::onceToken, &__block_literal_global_418);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap;
  return v2;
}

void __60__VCPFaceUtils__vnFaceAttributeSkintoneToPHFaceSkintoneType__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F45AB8];
  v5[0] = *MEMORY[0x1E4F45BC8];
  v5[1] = v0;
  v6[0] = &unk_1F15EB508;
  v6[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F459B8];
  v5[2] = *MEMORY[0x1E4F45998];
  v5[3] = v1;
  v6[2] = &unk_1F15EB538;
  v6[3] = &unk_1F15EB568;
  uint64_t v2 = *MEMORY[0x1E4F45A60];
  v5[4] = *MEMORY[0x1E4F459A8];
  v5[5] = v2;
  v6[4] = &unk_1F15EB550;
  v6[5] = &unk_1F15EB5B0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)+[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeSkintoneToPHFaceSkintoneType]::categoryMap = v3;
}

+ (unsigned)mad_PHValueFromVNSkintoneCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeSkintoneToPHFaceSkintoneType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceAttributeEthnicityToPHFaceEthnicityType
{
  if (+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::onceToken, &__block_literal_global_420);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap;
  return v2;
}

void __62__VCPFaceUtils__vnFaceAttributeEthnicityToPHFaceEthnicityType__block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F459F8];
  v4[0] = *MEMORY[0x1E4F45B38];
  v4[1] = v0;
  v5[0] = &unk_1F15EB508;
  v5[1] = &unk_1F15EB520;
  uint64_t v1 = *MEMORY[0x1E4F459D8];
  v4[2] = *MEMORY[0x1E4F45AD8];
  void v4[3] = v1;
  v5[2] = &unk_1F15EB538;
  v5[3] = &unk_1F15EB568;
  void v4[4] = *MEMORY[0x1E4F45AF8];
  v5[4] = &unk_1F15EB550;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  uint64_t v3 = (void *)+[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap;
  +[VCPFaceUtils _vnFaceAttributeEthnicityToPHFaceEthnicityType]::categoryMap = v2;
}

+ (unsigned)mad_PHValueFromVNEthnicityCategoryLabel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _vnFaceAttributeEthnicityToPHFaceEthnicityType];
  uint64_t v6 = [v5 valueForKey:v4];
  v7 = v6;
  if (v6) {
    unsigned __int16 v8 = [v6 integerValue];
  }
  else {
    unsigned __int16 v8 = 0;
  }

  return v8;
}

+ (id)_vnFaceGazeDirectionToPHFaceGazeType
{
  if (+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::onceToken != -1) {
    dispatch_once(&+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::onceToken, &__block_literal_global_422);
  }
  uint64_t v2 = (void *)+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap;
  return v2;
}

void __52__VCPFaceUtils__vnFaceGazeDirectionToPHFaceGazeType__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F15EB5C8;
  v2[1] = &unk_1F15EB5E0;
  v3[0] = &unk_1F15EB550;
  v3[1] = &unk_1F15EB508;
  v2[2] = &unk_1F15EB5F8;
  v2[3] = &unk_1F15EB610;
  void v3[2] = &unk_1F15EB520;
  void v3[3] = &unk_1F15EB538;
  v2[4] = &unk_1F15EB628;
  v2[5] = &unk_1F15EB640;
  v3[4] = &unk_1F15EB568;
  v3[5] = &unk_1F15EB550;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)+[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap;
  +[VCPFaceUtils _vnFaceGazeDirectionToPHFaceGazeType]::categoryMap = v0;
}

+ (id)mad_VNFaceGazeDirectionDescription:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Error VNFaceGazeDirection: %lu", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E6298248[a3];
  }
  return v3;
}

+ (id)mad_PHFaceGazeTypeDescription:(unsigned __int16)a3
{
  if ((a3 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Error PHFaceGazeType: %d", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E6298278[(__int16)(a3 - 1)];
  }
  return v3;
}

+ (unsigned)mad_PHValueFromVNFaceGazeDirection:(int64_t)a3
{
  id v4 = [a1 _vnFaceGazeDirectionToPHFaceGazeType];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6) {
    unsigned __int16 v7 = [v6 integerValue];
  }
  else {
    unsigned __int16 v7 = 0;
  }

  return v7;
}

+ (void)assignPropertiesOfVCPPhotosFace:(id)a3 toPHFaceChangeRequest:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  objc_msgSend(v5, "setSourceWidth:", objc_msgSend(v14, "sourceWidth"));
  objc_msgSend(v5, "setSourceHeight:", objc_msgSend(v14, "sourceHeight"));
  objc_msgSend(v5, "setDetectionType:", objc_msgSend(v14, "detectionType"));
  [v14 centerX];
  objc_msgSend(v5, "setCenterX:");
  [v14 centerY];
  objc_msgSend(v5, "setCenterY:");
  [v14 size];
  objc_msgSend(v5, "setSize:");
  [v14 bodyCenterX];
  objc_msgSend(v5, "setBodyCenterX:");
  [v14 bodyCenterY];
  objc_msgSend(v5, "setBodyCenterY:");
  [v14 bodyWidth];
  objc_msgSend(v5, "setBodyWidth:");
  [v14 bodyHeight];
  objc_msgSend(v5, "setBodyHeight:");
  objc_msgSend(v5, "setHasSmile:", objc_msgSend(v14, "hasSmile"));
  [v14 blurScore];
  objc_msgSend(v5, "setBlurScore:");
  objc_msgSend(v5, "setLeftEyeClosed:", objc_msgSend(v14, "isLeftEyeClosed"));
  objc_msgSend(v5, "setRightEyeClosed:", objc_msgSend(v14, "isRightEyeClosed"));
  [v14 poseYaw];
  objc_msgSend(v5, "setPoseYaw:");
  objc_msgSend(v5, "setFaceAlgorithmVersion:", objc_msgSend(v14, "algorithmVersion"));
  objc_msgSend(v5, "setQualityMeasure:", objc_msgSend(v14, "qualityMeasure"));
  objc_msgSend(v5, "setAgeType:", objc_msgSend(v14, "ageType"));
  objc_msgSend(v5, "setSexType:", objc_msgSend(v14, "sexType"));
  objc_msgSend(v5, "setEyesState:", objc_msgSend(v14, "eyesState"));
  objc_msgSend(v5, "setSmileType:", objc_msgSend(v14, "smileType"));
  objc_msgSend(v5, "setFacialHairType:", objc_msgSend(v14, "facialHairType"));
  objc_msgSend(v5, "setHairColorType:", objc_msgSend(v14, "hairColorType"));
  objc_msgSend(v5, "setGlassesType:", objc_msgSend(v14, "glassesType"));
  objc_msgSend(v5, "setFaceExpressionType:", objc_msgSend(v14, "expressionType"));
  objc_msgSend(v5, "setHeadgearType:", objc_msgSend(v14, "headgearType"));
  objc_msgSend(v5, "setHairType:", objc_msgSend(v14, "hairType"));
  objc_msgSend(v5, "setPoseType:", objc_msgSend(v14, "poseType"));
  objc_msgSend(v5, "setSkintoneType:", objc_msgSend(v14, "skintoneType"));
  objc_msgSend(v5, "setEthnicityType:", objc_msgSend(v14, "ethnicityType"));
  [v14 roll];
  objc_msgSend(v5, "setRoll:");
  [v14 quality];
  objc_msgSend(v5, "setQuality:");
  objc_msgSend(v5, "setGazeType:", objc_msgSend(v14, "gazeType"));
  objc_msgSend(v5, "setHasFaceMask:", objc_msgSend(v14, "hasFaceMask"));
  [v14 gazeCenterX];
  objc_msgSend(v5, "setGazeCenterX:");
  [v14 gazeCenterY];
  objc_msgSend(v5, "setGazeCenterY:");
  [v14 gazeRect];
  objc_msgSend(v5, "setGazeRect:");
  [v14 gazeAngle];
  objc_msgSend(v5, "setGazeAngle:");
  [v14 gazeConfidence];
  objc_msgSend(v5, "setGazeConfidence:");
  objc_msgSend(v5, "setHidden:", objc_msgSend(v14, "hidden"));
  objc_msgSend(v5, "setInTrash:", objc_msgSend(v14, "isInTrash"));
  objc_msgSend(v5, "setManual:", objc_msgSend(v14, "manual"));
  uint64_t v6 = [v14 adjustmentVersion];
  [v5 setAdjustmentVersion:v6];

  unsigned __int16 v7 = [v14 groupingIdentifier];
  [v5 setGroupingIdentifier:v7];

  objc_msgSend(v5, "setNameSource:", objc_msgSend(v14, "nameSource"));
  objc_msgSend(v5, "setClusterSequenceNumber:", objc_msgSend(v14, "clusterSequenceNumber"));
  objc_msgSend(v5, "setVuObservationID:", objc_msgSend(v14, "vuObservationID"));
  unsigned __int16 v8 = [v14 imageprintWrapper];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F39090]);
    uint64_t v10 = [v14 imageprintWrapper];
    v11 = [v10 data];
    v12 = [v14 imageprintWrapper];
    v13 = objc_msgSend(v9, "initWithFaceprintData:faceprintVersion:", v11, (int)objc_msgSend(v12, "version"));

    [v5 setFaceprint:v13];
  }
}

+ (id)phFaceFromVCPPhotosFace:(id)a3 withFetchOptions:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 localIdentifier];
  unsigned __int16 v8 = (void *)v7;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x1E4F39048];
    v14[0] = v7;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v11 = [v9 fetchFacesWithLocalIdentifiers:v10 options:v6];

    if ([v11 count] == 1)
    {
      v12 = [v11 firstObject];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_firstLocallyAvailableResourceFromResources:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "vcp_isLocallyAvailable", (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)resourceForFaceProcessing:(id)a3 allowStreaming:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v6;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "Choosing asset resource from preferred list: %@", buf, 0xCu);
      }
    }
    if (v4)
    {
      unsigned __int16 v8 = [MEMORY[0x1E4F1CA48] array];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v13 analysisType] == 2 || objc_msgSend(v13, "analysisType") == 1) {
              [v8 addObject:v13];
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v10);
      }

      if (![v8 count])
      {
        uint64_t v14 = [v9 firstObject];
        [v8 addObject:v14];
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v8;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "Network is available, filtering list to remove the CPL Thumb, new list is: %@", buf, 0xCu);
        }
      }
      id v16 = [a1 _firstLocallyAvailableResourceFromResources:v8];
      if (!v16)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v17 = v8;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v25;
LABEL_26:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = *(void **)(*((void *)&v24 + 1) + 8 * v20);
            if (objc_msgSend(v21, "analysisType", (void)v24) == 1) {
              break;
            }
            if (v18 == ++v20)
            {
              uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v18) {
                goto LABEL_26;
              }
              goto LABEL_32;
            }
          }
          id v16 = v21;

          if (v16) {
            goto LABEL_37;
          }
        }
        else
        {
LABEL_32:
        }
        objc_msgSend(v17, "firstObject", (void)v24);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          long long v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v16;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "No resources locally available, returning a downloadable hi-res resource: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      id v16 = [a1 _firstLocallyAvailableResourceFromResources:v6];
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)preferredResourcesForFaceProcessingWithAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = v3;
  if (v3)
  {
    if ([v3 hasAdjustments])
    {
      int v4 = 0;
    }
    else
    {
      id v6 = [v17 photoLibrary];
      int v4 = objc_msgSend(v6, "vcp_isSyndicationLibrary") ^ 1;
    }
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(MEMORY[0x1E4F38F68], "vcp_allAcceptableResourcesForAsset:", v17);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v11 pixelWidth])
          {
            if ([v11 pixelHeight])
            {
              if ([v11 type] != 13 && objc_msgSend(v11, "type") != 8)
              {
                long long v12 = objc_msgSend(v11, "vcp_uniformTypeIdentifier");
                BOOL v13 = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:v12];

                if (v13)
                {
                  int v14 = [v11 type] == 1 ? v4 : 1;
                  if (v14 == 1) {
                    [v5 addObject:v11];
                  }
                }
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    v15 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_descendingSizeComparator");
    [v5 sortUsingComparator:v15];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)resourceForFaceProcessingWithAsset:(id)a3 allowStreaming:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a1 preferredResourcesForFaceProcessingWithAsset:a3];
  id v7 = [a1 resourceForFaceProcessing:v6 allowStreaming:v4];

  return v7;
}

+ (BOOL)isBestResourceForFaceProcessing:(id)a3 fromResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F38F68], "vcp_descendingSizeComparator");
  uint64_t v8 = [v6 sortedArrayUsingComparator:v7];

  id v9 = [v8 firstObject];
  BOOL v10 = v9 == v5 || [v5 analysisType] == 2 || objc_msgSend(v5, "analysisType") == 1;

  return v10;
}

+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andVisionRevision:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(a4);
  *a3 = v8;
  if (a5 < 0xDECAF000)
  {
    [v8 setRevision:a5];
  }
  else
  {
    id v17 = 0;
    char v9 = [v8 setRevision:a5 error:&v17];
    id v10 = v17;
    uint64_t v11 = v10;
    if ((v9 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        BOOL v13 = VCPLogInstance();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = _os_feature_enabled_impl();
          *(_DWORD *)buf = 138412802;
          if (v14) {
            int v15 = 15;
          }
          else {
            int v15 = 11;
          }
          Class v19 = a4;
          __int16 v20 = 2112;
          long long v21 = v11;
          __int16 v22 = 1024;
          int v23 = v15;
          _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[Face] Failed setting %@ private revision: %@, umbrellaVersion: %d", buf, 0x1Cu);
        }
      }
      int v12 = -50;
      goto LABEL_16;
    }
  }
  [*a3 setMetalContextPriority:1];
  [*a3 setPreferBackgroundProcessing:1];
  if (DeviceHasANE())
  {
    uint64_t v11 = [MEMORY[0x1E4F458E8] defaultANEDevice];
    [*a3 setProcessingDevice:v11];
    int v12 = 0;
LABEL_16:

    return v12;
  }
  return 0;
}

+ (int)configureVNRequest:(id *)a3 withClass:(Class)a4 andProcessingVersion:(int)a5
{
  uint64_t v8 = VCPMAGetRevisionForVisionModel(a4, *(uint64_t *)&a5);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return -23807;
  }
  return [a1 configureVNRequest:a3 withClass:a4 andVisionRevision:v8];
}

+ (CGRect)faceRectFromNormalizedCenterX:(double)a3 normalizedCenterY:(double)a4 normalizedSize:(double)a5 sourceWidth:(double)a6 sourceHeight:(double)a7
{
  if (a6 >= a7) {
    double v7 = a6;
  }
  else {
    double v7 = a7;
  }
  double v8 = v7 * a5;
  double v9 = v8 / a6;
  double v10 = v8 / a7;
  double v11 = a3 - v9 * 0.5;
  double v12 = a4 - v8 / a7 * 0.5;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end