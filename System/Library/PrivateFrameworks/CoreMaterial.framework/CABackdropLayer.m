@interface CABackdropLayer
@end

@implementation CABackdropLayer

uint64_t __94__CABackdropLayer_CoreMaterial___mt_configureFilterOfType_ifNecessaryWithName_andFilterOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 type];
  v7 = [v5 type];

  uint64_t v8 = MTCompareObjectsWithOrder((uint64_t)v6, v7, *(void **)(a1 + 32));
  return v8;
}

void __63__CABackdropLayer_CoreMaterial__mt_orderedFilterTypesBlurAtEnd__block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "mt_orderedFilterTypes");
  v2 = (void *)[v1 mutableCopy];

  uint64_t v3 = *MEMORY[0x1E4F3A0D0];
  [v2 removeObject:*MEMORY[0x1E4F3A0D0]];
  uint64_t v4 = *MEMORY[0x1E4F3A348];
  [v2 removeObject:*MEMORY[0x1E4F3A348]];
  [v2 addObject:v3];
  [v2 addObject:v4];
  id v5 = (void *)mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd;
  mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd = (uint64_t)v2;
}

void __54__CABackdropLayer_CoreMaterial__mt_orderedFilterTypes__block_invoke()
{
  v6[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3A268];
  v6[0] = *MEMORY[0x1E4F39FD0];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F3A068];
  v6[2] = *MEMORY[0x1E4F3A260];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F3A348];
  v6[4] = *MEMORY[0x1E4F3A0D0];
  v6[5] = v2;
  uint64_t v3 = *MEMORY[0x1E4F3A048];
  v6[6] = *MEMORY[0x1E4F3A038];
  v6[7] = v3;
  v6[8] = *MEMORY[0x1E4F3A000];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:9];
  id v5 = (void *)mt_orderedFilterTypes___sortedFilterTypes;
  mt_orderedFilterTypes___sortedFilterTypes = v4;
}

@end