@interface NSMutableDictionary(MTMaterialDescriptionInternal)
- (uint64_t)setValue:()MTMaterialDescriptionInternal forProperty:ofFilterInFiltersArray:;
- (void)_processAdditionalInfo:()MTMaterialDescriptionInternal forFilterInFiltersArray:;
- (void)setAverageColorEnabled:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:;
- (void)setBlurRadius:()MTMaterialDescriptionInternal inputMaskImage:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setBrightness:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setColorMatrix:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setCurvesInputValues:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setLuminanceAmount:()MTMaterialDescriptionInternal values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setSaturation:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)setTintColor:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:;
- (void)setValue:()MTMaterialDescriptionInternal forProperty:ofFilter:isCompositingFilter:;
- (void)setZoom:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:;
- (void)sortFiltersWithOrder:()MTMaterialDescriptionInternal;
@end

@implementation NSMutableDictionary(MTMaterialDescriptionInternal)

- (void)setValue:()MTMaterialDescriptionInternal forProperty:ofFilter:isCompositingFilter:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    if (a6)
    {
      id v13 = [a1 objectForKey:@"compositingFilter"];
      id v14 = 0;
      if (v13) {
        goto LABEL_22;
      }
    }
    else
    {
      id v15 = [a1 objectForKey:@"filters"];
      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [a1 setObject:v15 forKey:@"filters"];
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v14 = v15;
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v23 = a6;
        v24 = a1;
        id v25 = v11;
        uint64_t v18 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v14);
            }
            v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v21 = [v20 objectForKey:@"type"];
            int v22 = [v12 isEqualToString:v21];

            if (v22)
            {
              id v13 = v20;
              goto LABEL_17;
            }
          }
          uint64_t v17 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        id v13 = 0;
LABEL_17:
        a1 = v24;
        id v11 = v25;
        a6 = v23;
      }
      else
      {
        id v13 = 0;
      }

      if (v13) {
        goto LABEL_22;
      }
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setObject:v12 forKey:@"type"];
    if (!a6)
    {
      [v14 addObject:v13];
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
    [a1 setObject:v13 forKey:@"compositingFilter"];
LABEL_22:
    if (!v10)
    {
LABEL_24:

      goto LABEL_25;
    }
LABEL_23:
    [v13 setObject:v10 forKey:v11];
    goto LABEL_24;
  }
LABEL_25:
}

- (void)setBrightness:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  id v12 = a6;
  uint64_t v9 = *MEMORY[0x1E4F3A000];
  if (!a4 || MTIdentityValueForFilter((void *)*MEMORY[0x1E4F3A000]) != a2)
  {
    id v10 = [NSNumber numberWithDouble:a2];
    [a1 setValue:v10 forProperty:@"inputAmount" ofFilterInFiltersArray:v9];

    if (v12)
    {
      id v11 = v12[2]();
      [a1 _processAdditionalInfo:v11 forFilterInFiltersArray:v9];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v9];
    }
  }
}

- (void)setLuminanceAmount:()MTMaterialDescriptionInternal values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  id v17 = a4;
  id v11 = a7;
  id v12 = (void *)*MEMORY[0x1E4F3A268];
  if (!a5 || MTIdentityValueForFilter((void *)*MEMORY[0x1E4F3A268]) != a2)
  {
    id v13 = (void *)*MEMORY[0x1E4F3A260];
    if (!v17) {
      id v13 = v12;
    }
    id v14 = v13;
    id v15 = [NSNumber numberWithDouble:a2];
    [a1 setValue:v15 forProperty:@"inputAmount" ofFilterInFiltersArray:v14];

    if ([v17 count] == 4) {
      [a1 setValue:v17 forProperty:@"inputValues" ofFilterInFiltersArray:v14];
    }
    if (v11)
    {
      uint64_t v16 = v11[2](v11);
      [a1 _processAdditionalInfo:v16 forFilterInFiltersArray:v14];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v14];
    }
  }
}

- (uint64_t)setValue:()MTMaterialDescriptionInternal forProperty:ofFilterInFiltersArray:
{
  return [a1 setValue:a3 forProperty:a4 ofFilter:a5 isCompositingFilter:0];
}

- (void)setBlurRadius:()MTMaterialDescriptionInternal inputMaskImage:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  int v23 = a7;
  id v12 = (void *)*MEMORY[0x1E4F3A0D0];
  if (!a5 || MTIdentityValueForFilter((void *)*MEMORY[0x1E4F3A0D0]) != a2)
  {
    BOOL v13 = a2 > 29.5;
    if (a2 >= 35.0) {
      BOOL v13 = 0;
    }
    if ((v13 & a6) != 0) {
      a2 = 29.5;
    }
    uint64_t v14 = *MEMORY[0x1E4F3A348];
    if (a4) {
      id v15 = (void *)*MEMORY[0x1E4F3A348];
    }
    else {
      id v15 = v12;
    }
    id v16 = v15;
    id v17 = [NSNumber numberWithDouble:a2];
    [a1 setValue:v17 forProperty:@"inputRadius" ofFilterInFiltersArray:v16];

    if (a4) {
      [a1 setValue:a4 forProperty:@"inputMaskImage" ofFilterInFiltersArray:v14];
    }
    if (v23)
    {
      uint64_t v18 = v23[2]();
      id v19 = v18;
      if (a6)
      {
        if (v18)
        {
          uint64_t v20 = [v18 mutableCopy];

          id v19 = (id)v20;
LABEL_18:
          v21 = _MTGetCoreMaterialPlatformConfiguration();
          if (objc_opt_respondsToSelector())
          {
            int v22 = [v21 blurEdgesOptimization];
            [v19 setObject:MEMORY[0x1E4F1CC38] forKey:v22];
          }
          if ((objc_opt_respondsToSelector() & 1) == 0
            || [v21 isDitherOptimizationSupported])
          {
            [v19 setObject:MEMORY[0x1E4F1CC38] forKey:@"inputDither"];
          }

          goto LABEL_25;
        }
LABEL_17:
        id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        goto LABEL_18;
      }
    }
    else
    {
      if (a6) {
        goto LABEL_17;
      }
      id v19 = 0;
    }
LABEL_25:
    [a1 _processAdditionalInfo:v19 forFilterInFiltersArray:v16];
  }
}

- (void)_processAdditionalInfo:()MTMaterialDescriptionInternal forFilterInFiltersArray:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v14 = [v6 objectForKey:v13];
            [a1 setValue:v14 forProperty:v13 ofFilter:v8 isCompositingFilter:0];
          }
          uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)setTintColor:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:
{
  id v7 = a5;
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    [a3 sourceOverColorMatrix];
    v11[2] = v14;
    v11[3] = v15;
    v11[4] = v16;
    v11[0] = v12;
    v11[1] = v13;
    v8 = [MEMORY[0x1E4F29238] valueWithBytes:v11 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    uint64_t v9 = *MEMORY[0x1E4F3A038];
    [a1 setValue:v8 forProperty:@"inputColorMatrix" ofFilterInFiltersArray:*MEMORY[0x1E4F3A038]];

    if (v7)
    {
      uint64_t v10 = v7[2](v7);
      [a1 _processAdditionalInfo:v10 forFilterInFiltersArray:v9];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v9];
    }
  }
}

- (void)sortFiltersWithOrder:()MTMaterialDescriptionInternal
{
  id v4 = a3;
  v5 = [a1 objectForKey:@"filters"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__NSMutableDictionary_MTMaterialDescriptionInternal__sortFiltersWithOrder___block_invoke;
  v7[3] = &unk_1E5F1B918;
  id v8 = v4;
  id v6 = v4;
  [v5 sortUsingComparator:v7];
}

- (void)setCurvesInputValues:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = a6;
  if (!a4 || [v9 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      uint64_t v15 = *MEMORY[0x1E4F3A068];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          long long v18 = objc_msgSend(v11, "objectForKeyedSubscript:", v17, (void)v20);
          [a1 setValue:v18 forProperty:v17 ofFilterInFiltersArray:v15];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    if (v10)
    {
      id v19 = v10[2](v10);
      [a1 _processAdditionalInfo:v19 forFilterInFiltersArray:*MEMORY[0x1E4F3A068]];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:*MEMORY[0x1E4F3A068]];
    }
  }
}

- (void)setSaturation:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  uint64_t v12 = a6;
  uint64_t v9 = *MEMORY[0x1E4F3A048];
  if (!a4 || MTIdentityValueForFilter((void *)*MEMORY[0x1E4F3A048]) != a2)
  {
    uint64_t v10 = [NSNumber numberWithDouble:a2];
    [a1 setValue:v10 forProperty:@"inputAmount" ofFilterInFiltersArray:v9];

    if (v12)
    {
      id v11 = v12[2]();
      [a1 _processAdditionalInfo:v11 forFilterInFiltersArray:v9];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v9];
    }
  }
}

- (void)setZoom:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  if (a2 != 0.0 || (a4 & 1) == 0)
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [a1 setObject:v5 forKey:@"zoom"];
  }
}

- (void)setColorMatrix:()MTMaterialDescriptionInternal ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:
{
  uint64_t v9 = a6;
  if (!a4
    || (long long v10 = a3[3],
        v18[2] = a3[2],
        v18[3] = v10,
        v18[4] = a3[4],
        long long v11 = a3[1],
        v18[0] = *a3,
        v18[1] = v11,
        !MTCAColorMatrixIsIdentity(v18)))
  {
    long long v12 = a3[3];
    v17[2] = a3[2];
    v17[3] = v12;
    v17[4] = a3[4];
    long long v13 = a3[1];
    v17[0] = *a3;
    v17[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F29238] valueWithBytes:v17 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    uint64_t v15 = *MEMORY[0x1E4F3A038];
    [a1 setValue:v14 forProperty:@"inputColorMatrix" ofFilterInFiltersArray:*MEMORY[0x1E4F3A038]];

    if (v9)
    {
      long long v16 = v9[2](v9);
      [a1 _processAdditionalInfo:v16 forFilterInFiltersArray:v15];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v15];
    }
  }
}

- (void)setAverageColorEnabled:()MTMaterialDescriptionInternal includingOptimizations:withAdditionalInfoPromise:
{
  id v8 = a5;
  if (a3)
  {
    long long v11 = v8;
    uint64_t v9 = *MEMORY[0x1E4F39FD0];
    [a1 setValue:0 forProperty:0 ofFilterInFiltersArray:*MEMORY[0x1E4F39FD0]];
    if (a4) {
      [a1 setObject:&unk_1F06A5580 forKey:@"scale"];
    }
    if (v11)
    {
      long long v10 = v11[2](v11);
      [a1 _processAdditionalInfo:v10 forFilterInFiltersArray:v9];
    }
    else
    {
      [a1 _processAdditionalInfo:0 forFilterInFiltersArray:v9];
    }
    id v8 = v11;
  }
}

@end