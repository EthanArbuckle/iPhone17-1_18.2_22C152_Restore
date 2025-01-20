@interface UIFont(CSAdditions)
- (BOOL)cs_supportsVariantWeights;
- (id)cs_fontWithVariantWeight:()CSAdditions;
- (uint64_t)cs_variantWeight;
- (uint64_t)cs_variantWeightRange;
@end

@implementation UIFont(CSAdditions)

- (BOOL)cs_supportsVariantWeights
{
  CFDictionaryRef v1 = CTFontCopyVariation(a1);
  if (v1)
  {
    v2 = [NSNumber numberWithDouble:2003265650.0];
    v3 = [(__CFDictionary *)v1 objectForKeyedSubscript:v2];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)cs_variantWeight
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "cs_cachedVariantWeight");

  if (v2)
  {
    v3 = objc_msgSend(a1, "cs_cachedVariantWeight");
    uint64_t v4 = [v3 unsignedIntegerValue];

    return v4;
  }
  else
  {
    CFDictionaryRef v6 = CTFontCopyVariation((CTFontRef)a1);
    if (v6
      && ([NSNumber numberWithDouble:2003265650.0],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(__CFDictionary *)v6 objectForKeyedSubscript:v7],
          v8 = objc_claimAutoreleasedReturnValue(),
          v7,
          v8))
    {
      objc_msgSend(a1, "cs_setCachedVariantWeight:", v8);
      uint64_t v9 = [v8 unsignedIntegerValue];
    }
    else
    {
      CFDictionaryRef v22 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      CFArrayRef v10 = CTFontCopyVariationAxes((CTFontRef)a1);
      uint64_t v11 = [(__CFArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        uint64_t v14 = *MEMORY[0x1E4F24680];
        uint64_t v15 = *MEMORY[0x1E4F24678];
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            v18 = [v17 objectForKeyedSubscript:v14];
            v19 = v18;
            if (v18)
            {
              if ([v18 unsignedIntegerValue] == 2003265652)
              {
                uint64_t v20 = [v17 objectForKeyedSubscript:v15];
                if (v20)
                {
                  v21 = (void *)v20;
                  objc_msgSend(a1, "cs_setCachedVariantWeight:", v20);
                  uint64_t v9 = [v21 unsignedIntegerValue];

                  goto LABEL_18;
                }
              }
            }
          }
          uint64_t v12 = [(__CFArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      objc_msgSend(a1, "cs_setCachedVariantWeight:", &unk_1F0480BE0);
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      CFDictionaryRef v6 = v22;
    }

    return v9;
  }
}

- (uint64_t)cs_variantWeightRange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CFArrayRef v1 = CTFontCopyVariationAxes(a1);
  uint64_t v2 = [(__CFArray *)v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v17;
    uint64_t v4 = *MEMORY[0x1E4F24680];
    uint64_t v15 = *MEMORY[0x1E4F24690];
    uint64_t v5 = *MEMORY[0x1E4F24688];
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v17 != v3) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v8 = [v7 objectForKeyedSubscript:v4];
        uint64_t v9 = v8;
        if (v8 && [v8 unsignedIntegerValue] == 2003265652)
        {
          CFArrayRef v10 = [v7 objectForKeyedSubscript:v15];
          uint64_t v11 = [v7 objectForKeyedSubscript:v5];
          uint64_t v12 = v11;
          if (v10) {
            BOOL v13 = v11 == 0;
          }
          else {
            BOOL v13 = 1;
          }
          if (!v13)
          {
            uint64_t v2 = [v10 unsignedIntValue] + 1;
            [v12 unsignedIntValue];

            goto LABEL_16;
          }
        }
      }
      uint64_t v2 = [(__CFArray *)v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v2);
  }
LABEL_16:

  return v2;
}

- (id)cs_fontWithVariantWeight:()CSAdditions
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4F24670];
  uint64_t v5 = [NSNumber numberWithDouble:2003265650.0];
  uint64_t v14 = v5;
  CFDictionaryRef v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v15 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

  uint64_t v9 = [a1 fontDescriptor];
  CFArrayRef v10 = [v9 fontDescriptorByAddingAttributes:v8];

  uint64_t v11 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  uint64_t v12 = objc_msgSend(v11, "fontWithDescriptor:size:", v10);

  return v12;
}

@end