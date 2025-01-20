@interface CEKLightingEffectManager
+ (id)aggdNameForLightingType:(int64_t)a3;
+ (id)ciFilterNameForLightingType:(int64_t)a3 version:(int64_t)a4;
+ (id)displayImageForLightingType:(int64_t)a3;
+ (id)displayNameForLightingType:(int64_t)a3;
+ (id)filtersForLightingType:(int64_t)a3 applyDepthEffect:(BOOL)a4 version:(int64_t)a5;
+ (id)portraitOriginalPhotoFilters;
+ (int64_t)ciLightingTypeForFilterName:(id)a3;
@end

@implementation CEKLightingEffectManager

+ (id)ciFilterNameForLightingType:(int64_t)a3 version:(int64_t)a4
{
  if ((unint64_t)(a3 - 2) > 4) {
    v4 = 0;
  }
  else {
    v4 = off_1E63CDF28[a3 - 2];
  }
  if (a4 == 2)
  {
    if (a3 != 6)
    {
      v4 = [(__CFString *)v4 stringByAppendingString:@"V2"];
    }
  }
  else if (!a4)
  {
    v4 = 0;
  }
  return v4;
}

+ (id)filtersForLightingType:(int64_t)a3 applyDepthEffect:(BOOL)a4 version:(int64_t)a5
{
  BOOL v6 = a4;
  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v10 = v9;
  if (v6) {
    [v9 addObject:@"CIDepthEffect"];
  }
  v11 = [a1 ciFilterNameForLightingType:a3 version:a5];
  if (v11) {
    [v10 addObject:v11];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __76__CEKLightingEffectManager_filtersForLightingType_applyDepthEffect_version___block_invoke;
  v18 = &unk_1E63CD808;
  v20 = &v21;
  id v12 = v10;
  id v19 = v12;
  [v12 enumerateObjectsUsingBlock:&v15];
  v13 = objc_msgSend((id)v22[5], "copy", v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
  return v13;
}

uint64_t __76__CEKLightingEffectManager_filtersForLightingType_applyDepthEffect_version___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F1E040] filterWithName:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v4;
    if (!v5)
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    uint64_t v3 = [v5 addObject:v10];
    uint64_t v4 = v10;
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (int64_t)ciLightingTypeForFilterName:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"V2" withString:&stru_1F1A048B0];
  if ([v3 isEqualToString:@"CIPortraitEffectStudio"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"CIPortraitEffectContour"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"CIPortraitEffectStage"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CIPortraitEffectStageMono"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"CIPortraitEffectStageWhite"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = [v3 isEqualToString:@"CIDepthEffect"];
  }

  return v4;
}

+ (id)displayNameForLightingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = CEKLocalizedFrameworkString(off_1E63CDF50[a3 - 1], 0);
  }
  return v4;
}

+ (id)aggdNameForLightingType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E63CDF80[a3 - 1];
  }
}

+ (id)displayImageForLightingType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
      int64_t v4 = CEKFrameworkBundle();
      v5 = @"CEKLightingEffectNatural";
      goto LABEL_8;
    case 2:
    case 6:
      uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
      int64_t v4 = CEKFrameworkBundle();
      v5 = @"CEKLightingEffectStudio";
      goto LABEL_8;
    case 3:
      uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
      int64_t v4 = CEKFrameworkBundle();
      v5 = @"CEKLightingEffectContour";
      goto LABEL_8;
    case 4:
      uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
      int64_t v4 = CEKFrameworkBundle();
      v5 = @"CEKLightingEffectStage";
      goto LABEL_8;
    case 5:
      uint64_t v3 = (void *)MEMORY[0x1E4FB1818];
      int64_t v4 = CEKFrameworkBundle();
      v5 = @"CEKLightingEffectStageMono";
LABEL_8:
      uint64_t v6 = [v3 imageNamed:v5 inBundle:v4];

      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

+ (id)portraitOriginalPhotoFilters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1E040] filterWithName:@"CIPortraitEffectLight"];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end