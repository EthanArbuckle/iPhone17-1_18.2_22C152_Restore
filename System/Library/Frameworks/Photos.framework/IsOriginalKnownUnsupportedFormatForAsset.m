@interface IsOriginalKnownUnsupportedFormatForAsset
@end

@implementation IsOriginalKnownUnsupportedFormatForAsset

void ___IsOriginalKnownUnsupportedFormatForAsset_block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedAssetForPhotoLibrary:*(void *)(a1 + 40)];
  v3 = v2;
  if (*(unsigned char *)(a1 + 64)) {
    [v2 originalVideoComplementUniformTypeIdentifier];
  }
  else {
  v4 = [v2 originalUniformTypeIdentifier];
  }
  if ([v3 isVideo])
  {
    BOOL v5 = 1;
    if (!v4)
    {
LABEL_9:
      if (v5)
      {
        if (*(unsigned char *)(a1 + 65))
        {
          id v16 = 0;
          char v8 = [v3 isPlayableVideo:&v16];
          id v9 = v16;
        }
        else
        {
          char v8 = [v3 isPlayableVideo:0];
          id v9 = 0;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8 ^ 1;
        if (*(unsigned char *)(a1 + 65))
        {
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
            BOOL v12 = v9 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12)
          {
            v17 = @"CodecName";
            id v18 = v9;
            uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
            uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
            v15 = *(void **)(v14 + 40);
            *(void *)(v14 + 40) = v13;
          }
        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v5 = *(unsigned char *)(a1 + 64) != 0;
    if (!v4) {
      goto LABEL_9;
    }
  }
  v6 = (void *)MEMORY[0x1E4F8CC38];
  v7 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
  LOBYTE(v6) = [v6 canGenerateImageDerivativesFromType:v7];

  if (v6) {
    goto LABEL_9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  if (*(unsigned char *)(a1 + 65) && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v19 = @"UTI";
    v20[0] = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(id *)(v11 + 40);
    *(void *)(v11 + 40) = v10;
LABEL_22:
  }
LABEL_23:
}

@end