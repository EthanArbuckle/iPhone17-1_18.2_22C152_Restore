uint64_t MTCompareObjectsWithOrder(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = a3;
  v6 = a2;
  v7 = [v5 indexOfObject:a1];
  v8 = [v5 indexOfObject:v6];

  if (v7 < v8) {
    return -1;
  }
  else {
    return v7 > v8;
  }
}

BOOL MTFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a2, a1) < 2.22044605e-16;
}

void sub_1AE9D93EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MTComposedFilterCreateDictionaryRepresentation(void *a1, void *a2, uint64_t a3)
{
  v101[7] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v74 = a3;
  [v7 setValue:0 forProperty:0 ofFilter:v5 isCompositingFilter:a3];
  v70 = v6;
  v8 = (void *)[v6 mutableCopy];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = v5;
  id v11 = v8;
  id v12 = v9;
  v13 = v10;
  id v14 = v12;
  v71 = v11;
  if ([v10 isEqualToString:*MEMORY[0x1E4F3A360]])
  {
    [v14 setObject:@"inputColor0" forKeyedSubscript:@"colorDodge"];
    v15 = kMTCAFilterPropertyNameInputColorLighten;
  }
  else
  {
    if (![v10 isEqualToString:*MEMORY[0x1E4F3A368]])
    {
      if ([v10 isEqualToString:*MEMORY[0x1E4F3A350]])
      {
        id obja = v7;
        id v68 = objc_alloc(MEMORY[0x1E4F1C978]);
        v39 = objc_msgSend(v11, "objectForKeyedSubscript:");
        v40 = v11;
        uint64_t v41 = (uint64_t)v39;
        if (!v39)
        {
          uint64_t v41 = [v11 objectForKeyedSubscript:@"darkenShadows"];
        }
        id v69 = v14;
        v42 = objc_msgSend(v11, "objectForKeyedSubscript:");
        uint64_t v43 = (uint64_t)v42;
        if (!v42)
        {
          uint64_t v43 = [v40 objectForKeyedSubscript:@"increaseSaturation"];
        }
        v44 = objc_msgSend(v40, "objectForKeyedSubscript:");
        v45 = objc_msgSend(v40, "objectForKeyedSubscript:");
        v46 = [v40 objectForKeyedSubscript:@"redGreenContrast"];
        v47 = (void *)v43;
        uint64_t v67 = v43;
        v48 = (void *)v41;
        v49 = objc_msgSend(v68, "initWithObjects:", v41, v67, v44, v45, v46, 0);

        if (!v42) {
        id v14 = v69;
        }
        if (!v39) {

        }
        v101[0] = @"darkenShadowHighlights";
        v101[1] = @"darkenShadows";
        v101[2] = @"saturationAdjustment";
        v101[3] = @"increaseSaturation";
        v101[4] = @"darkenAll";
        v101[5] = @"blueYellowContrast";
        v101[6] = @"redGreenContrast";
        v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:7];
        id v11 = v71;
        [v71 removeObjectsForKeys:v50];

        id v7 = obja;
        if ((unint64_t)[v49 count] >= 3)
        {
          long long v51 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
          long long v92 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
          long long v93 = v51;
          long long v94 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
          long long v52 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
          float32x4_t v90 = *(float32x4_t *)MEMORY[0x1E4F39AD8];
          long long v91 = v52;
          v53 = [v49 firstObject];
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v55 = v49;
            uint64_t v56 = [v55 countByEnumeratingWithState:&v86 objects:&v96 count:16];
            if (v56)
            {
              uint64_t v57 = v56;
              uint64_t v58 = *(void *)v87;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v87 != v58) {
                    objc_enumerationMutation(v55);
                  }
                  MTCAColorMatrixMakeWithDictionaryRepresentation(*(void **)(*((void *)&v86 + 1) + 8 * i), (uint64_t)v85);
                  long long v82 = v92;
                  long long v83 = v93;
                  long long v84 = v94;
                  float32x4_t v80 = v90;
                  long long v81 = v91;
                  CAColorMatrixConcat();
                }
                uint64_t v57 = [v55 countByEnumeratingWithState:&v86 objects:&v96 count:16];
              }
              while (v57);
            }
          }
          else
          {
            id v55 = [v49 objectAtIndexedSubscript:0];
            [v55 floatValue];
            float v61 = v60;
            v62 = [v49 objectAtIndexedSubscript:1];
            [v62 floatValue];
            v63 = [v49 objectAtIndexedSubscript:2];
            [v63 floatValue];
            unint64_t v64 = [v49 count];
            if (v64 >= 4)
            {
              uint64_t isKindOfClass = [v49 objectAtIndexedSubscript:3];
              [(id)isKindOfClass floatValue];
            }
            if ((unint64_t)[v49 count] <= 4)
            {
              MTCAColorMatrixMakeWithVibrantShadowAttributes(&v96, v61);
              long long v92 = v98;
              long long v93 = v99;
              long long v94 = v100;
              float32x4_t v90 = v96;
              long long v91 = v97;
            }
            else
            {
              v65 = [v49 objectAtIndexedSubscript:4];
              [v65 floatValue];
              MTCAColorMatrixMakeWithVibrantShadowAttributes(&v96, v61);
              long long v92 = v98;
              long long v93 = v99;
              long long v94 = v100;
              float32x4_t v90 = v96;
              long long v91 = v97;
            }
            if (v64 >= 4) {

            }
            id v7 = obja;
            id v14 = v69;
          }

          long long v82 = v92;
          long long v83 = v93;
          long long v84 = v94;
          float32x4_t v80 = v90;
          long long v81 = v91;
          v66 = MTCAColorMatrixCreateDictionaryRepresentation(&v80, *(double *)&v91);
          [v71 setObject:v66 forKeyedSubscript:@"inputColorMatrix"];
        }
      }
      goto LABEL_6;
    }
    [v14 setObject:@"inputColor0" forKeyedSubscript:@"colorBurn"];
    v15 = kMTCAFilterPropertyNameInputColorDarken;
  }
  [v14 setObject:@"inputColor1" forKeyedSubscript:*v15];
LABEL_6:

  v16 = [v11 allKeys];
  v17 = [v14 allKeys];
  v18 = [v16 arrayByAddingObjectsFromArray:v17];

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v95 count:16];
  if (!v19) {
    goto LABEL_25;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v77;
  do
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      if (*(void *)v77 != v21) {
        objc_enumerationMutation(obj);
      }
      v23 = *(void **)(*((void *)&v76 + 1) + 8 * j);
      id v24 = v14;
      uint64_t v25 = [v14 objectForKey:v23];
      v26 = (void *)v25;
      if (v25) {
        v27 = (void *)v25;
      }
      else {
        v27 = v23;
      }
      id v28 = v27;

      uint64_t v29 = [v11 objectForKey:v23];
      if (v29)
      {
        v30 = (void *)v29;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v31 = v13;
          id v32 = v7;
          v33 = +[MTColor colorWithDescription:v30];
          v34 = v33;
          if (v33)
          {
            uint64_t v35 = [v33 CGColor];
            goto LABEL_20;
          }
          if (MTCAColorMatrixIsDictionaryRepresentation(v30))
          {
            v36 = (void *)MEMORY[0x1E4F29238];
            MTCAColorMatrixMakeWithDictionaryRepresentation(v30, (uint64_t)v75);
            uint64_t v35 = [v36 valueWithBytes:v75 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
LABEL_20:
            v37 = (void *)v35;

            v30 = v37;
          }

          id v7 = v32;
          v13 = v31;
          id v11 = v71;
        }
        [v7 setValue:v30 forProperty:v28 ofFilter:v13 isCompositingFilter:v74];
      }
      id v14 = v24;
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v76 objects:v95 count:16];
  }
  while (v20);
LABEL_25:

  return v7;
}

id _MTGetCoreMaterialPlatformConfiguration()
{
  v0 = (void *)__platformConfiguration;
  if (!__platformConfiguration)
  {
    v1 = objc_alloc_init(MTCoreMaterialDefaultPlatformConfiguration);
    v2 = (void *)__platformConfiguration;
    __platformConfiguration = (uint64_t)v1;

    v0 = (void *)__platformConfiguration;
  }
  return v0;
}

double MTIdentityValueForFilter(void *a1)
{
  int v1 = [a1 isEqualToString:*MEMORY[0x1E4F3A048]];
  double result = 0.0;
  if (v1) {
    return 1.0;
  }
  return result;
}

uint64_t MTCompareBlurInputQualities(void *a1, void *a2)
{
  v3 = a2;
  v4 = a1;
  if (!MTIsValidBlurInputQuality(v4) || (MTIsValidBlurInputQuality(v3) & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = objc_msgSend(NSString, "stringWithUTF8String:", "NSComparisonResult MTCompareBlurInputQualities(NSString *__strong, NSString *__strong)");
    [v11 handleFailureInFunction:v12, @"MTUtilities.m", 53, @"Invalid parameter not satisfying: %@", @"MTIsValidBlurInputQuality(inputQuality1) && MTIsValidBlurInputQuality(inputQuality2)" file lineNumber description];
  }
  if ([(__CFString *)v4 isEqualToString:@"default"]) {
    id v5 = @"medium";
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;

  if ([(__CFString *)v3 isEqualToString:@"default"]) {
    id v7 = @"medium";
  }
  else {
    id v7 = v3;
  }
  v8 = v7;

  if ([(__CFString *)v6 isEqualToString:v8])
  {
    uint64_t v9 = 0;
  }
  else if ([(__CFString *)v6 isEqualToString:@"low"])
  {
    uint64_t v9 = -1;
  }
  else if ([(__CFString *)v6 isEqualToString:@"high"])
  {
    uint64_t v9 = 1;
  }
  else if ([(__CFString *)v8 isEqualToString:@"low"])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t MTIsValidBlurInputQuality(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"default"] & 1) != 0
    || ([v1 isEqualToString:@"low"] & 1) != 0
    || ([v1 isEqualToString:@"medium"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"high"];
  }

  return v2;
}

id __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = [*(id *)(a1 + 32) blurInputQuality];
    char v4 = [v3 isEqualToString:@"default"];

    if ((v4 & 1) == 0)
    {
      id v5 = [*(id *)(a1 + 32) blurInputQuality];
      [v2 setObject:v5 forKey:@"inputQuality"];
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id MTAllPlatformColorVisualStyles()
{
  if (MTAllPlatformColorVisualStyles_onceToken != -1) {
    dispatch_once(&MTAllPlatformColorVisualStyles_onceToken, &__block_literal_global_194);
  }
  v0 = (void *)MTAllPlatformColorVisualStyles___systemColorVisualStyles;
  return v0;
}

id MTAllOrdinalVisualStyles()
{
  if (MTAllOrdinalVisualStyles_onceToken != -1) {
    dispatch_once(&MTAllOrdinalVisualStyles_onceToken, &__block_literal_global_192);
  }
  v0 = (void *)MTAllOrdinalVisualStyles___visualStyles;
  return v0;
}

id MTTintingFilteringSettingsCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    id v6 = [v4 objectForKey:@"MTDictionaryRepresentationOptionsIncludeOptimizationsKey"];
    uint64_t v7 = [v6 BOOLValue];

    id v8 = v3;
    uint64_t v9 = +[MTColor colorWithCGColor:](MTColor, "colorWithCGColor:", [v8 tintColor]);
    [v8 tintAlpha];
    id v10 = objc_msgSend(v9, "colorWithAlphaComponent:");
    [v5 setTintColor:v10 includingOptimizations:v7 withAdditionalInfoPromise:0];

    id v11 = [v8 luminanceValues];
    [v8 luminanceAmount];
    if (v11) {
      id v12 = 0;
    }
    else {
      id v12 = &__block_literal_global_7;
    }
    objc_msgSend(v5, "setLuminanceAmount:values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v11, 1, v7, v12);
    v13 = [v4 objectForKey:@"MTDictionaryRepresentationOptionsReduceTransparencyKey"];
    char v14 = [v13 BOOLValue];

    if (v14)
    {
      [v8 saturation];
      uint64_t v15 = 1;
      objc_msgSend(v5, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      [v8 brightness];
      objc_msgSend(v5, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
    }
    else
    {
      [v8 blurRadius];
      double v17 = v16;
      id v18 = v8;
      uint64_t v19 = [v18 variableBlurInputMask];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke_2;
      v31[3] = &unk_1E5F1B8F0;
      char v33 = v7;
      id v20 = v18;
      id v32 = v20;
      [v5 setBlurRadius:v19 inputMaskImage:1 ignoringIdentity:v7 includingOptimizations:v31 withAdditionalInfoPromise:v17];

      [v20 saturation];
      objc_msgSend(v5, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      [v20 brightness];
      objc_msgSend(v5, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
      uint64_t v15 = [v20 isAverageColorEnabled];
    }
    [v5 setAverageColorEnabled:v15 includingOptimizations:v7 withAdditionalInfoPromise:0];
    [v8 zoom];
    objc_msgSend(v5, "setZoom:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 1, v7, 0);
    [v8 colorMatrix];
    [v5 setColorMatrix:&v30 ignoringIdentity:1 includingOptimizations:v7 withAdditionalInfoPromise:0];
    uint64_t v21 = [v8 curvesValues];
    [v5 setCurvesInputValues:v21 ignoringIdentity:1 includingOptimizations:v7 withAdditionalInfoPromise:0];

    if (v7)
    {
      v22 = NSNumber;
      [v8 backdropScale];
      v23 = objc_msgSend(v22, "numberWithDouble:");
      char v24 = objc_msgSend(v23, "mt_isIdentityValueForMaterialSettingsProperty:", @"backdropScale");

      if ((v24 & 1) == 0)
      {
        uint64_t v25 = NSNumber;
        [v8 backdropScale];
        v26 = objc_msgSend(v25, "numberWithDouble:");
        [v5 setObject:v26 forKey:@"scale"];
      }
    }
    if ([v8 isBlurAtEnd]) {
      objc_msgSend(MEMORY[0x1E4F39B40], "mt_orderedFilterTypesBlurAtEnd");
    }
    else {
    v27 = objc_msgSend(MEMORY[0x1E4F39B40], "mt_orderedFilterTypes");
    }
    [v5 sortFiltersWithOrder:v27];
    id v28 = [v8 userInfo];
    if (v28) {
      [v5 setObject:v28 forKey:@"userInfo"];
    }
  }
  return v5;
}

id MTFilterKeyPathForFilter(void *a1)
{
  id v1 = a1;
  id v2 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
  if (!MTFilterKeyPathForFilter___filterKeyCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
    MTFilterKeyPathForFilter___filterKeyCache = (uint64_t)v3;

    id v2 = (void *)MTFilterKeyPathForFilter___filterKeyCache;
  }
  id v5 = [v2 objectForKeyedSubscript:v1];
  if (!v5)
  {
    id v5 = [@"filters" stringByAppendingFormat:@".%@", v1];
    [(id)MTFilterKeyPathForFilter___filterKeyCache setObject:v5 forKeyedSubscript:v1];
  }

  return v5;
}

uint64_t _IsIdentityProperty(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(MEMORY[0x1E4F39B40], "mt_orderedFilterTypes");
  if ([v5 containsObject:v3])
  {
    id v6 = _IdentityPropertyForFilterType(v3);
    uint64_t v7 = [v4 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

__CFString *_IdentityPropertyForFilterType(void *a1)
{
  id v1 = a1;
  id v2 = @"inputAmount";
  if (([v1 isEqualToString:*MEMORY[0x1E4F3A0D0]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x1E4F3A348]] & 1) != 0)
  {
    id v3 = kMTCAFilterPropertyNameInputRadius;
LABEL_4:
    id v4 = *v3;
LABEL_5:

    id v2 = v4;
    goto LABEL_6;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F3A038]])
  {
    id v3 = kMTCAFilterPropertyNameInputColorMatrix;
    goto LABEL_4;
  }
  if ([v1 isEqualToString:*MEMORY[0x1E4F3A068]])
  {
    id v4 = 0;
    goto LABEL_5;
  }
LABEL_6:

  return v2;
}

uint64_t MTCAColorMatrixIsDictionaryRepresentation(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"m11"];
  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v2, v2))
  {
    id v3 = [v1 objectForKeyedSubscript:@"m12"];
    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v3, v3))
    {
      id v4 = [v1 objectForKeyedSubscript:@"m13"];
      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v4, v4))
      {
        id v5 = [v1 objectForKeyedSubscript:@"m14"];
        if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v5, v5))
        {
          id v6 = [v1 objectForKeyedSubscript:@"m15"];
          if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v6, v6))
          {
            uint64_t v7 = [v1 objectForKeyedSubscript:@"m21"];
            if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v7, v7))
            {
              id v8 = [v1 objectForKeyedSubscript:@"m22"];
              if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v8, v8))
              {
                uint64_t v9 = [v1 objectForKeyedSubscript:@"m23"];
                if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v9, v9))
                {
                  v23 = [v1 objectForKeyedSubscript:@"m24"];
                  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v23, v23))
                  {
                    v22 = [v1 objectForKeyedSubscript:@"m25"];
                    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v22, v22))
                    {
                      uint64_t v21 = [v1 objectForKeyedSubscript:@"m31"];
                      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v21, v21))
                      {
                        id v20 = [v1 objectForKeyedSubscript:@"m32"];
                        if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v20, v20))
                        {
                          uint64_t v19 = [v1 objectForKeyedSubscript:@"m33"];
                          if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v19, v19))
                          {
                            id v18 = [v1 objectForKeyedSubscript:@"m34"];
                            if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v18, v18))
                            {
                              double v17 = [v1 objectForKeyedSubscript:@"m35"];
                              if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v17, v17))
                              {
                                double v16 = [v1 objectForKeyedSubscript:@"m41"];
                                if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v16, v16))
                                {
                                  uint64_t v15 = [v1 objectForKeyedSubscript:@"m42"];
                                  if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v15, v15))
                                  {
                                    char v14 = [v1 objectForKeyedSubscript:@"m43"];
                                    if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v14, v14))
                                    {
                                      v13 = [v1 objectForKeyedSubscript:@"m44"];
                                      if (__MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v13, v13))
                                      {
                                        id v12 = [v1 objectForKeyedSubscript:@"m45"];
                                        uint64_t v10 = __MTCAColorMatrixIsDictionaryRepresentation_block_invoke((uint64_t)v12, v12);
                                      }
                                      else
                                      {
                                        uint64_t v10 = 0;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t v10 = 0;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t v10 = 0;
                                  }
                                }
                                else
                                {
                                  uint64_t v10 = 0;
                                }
                              }
                              else
                              {
                                uint64_t v10 = 0;
                              }
                            }
                            else
                            {
                              uint64_t v10 = 0;
                            }
                          }
                          else
                          {
                            uint64_t v10 = 0;
                          }
                        }
                        else
                        {
                          uint64_t v10 = 0;
                        }
                      }
                      else
                      {
                        uint64_t v10 = 0;
                      }
                    }
                    else
                    {
                      uint64_t v10 = 0;
                    }
                  }
                  else
                  {
                    uint64_t v10 = 0;
                  }
                }
                else
                {
                  uint64_t v10 = 0;
                }
              }
              else
              {
                uint64_t v10 = 0;
              }
            }
            else
            {
              uint64_t v10 = 0;
            }
          }
          else
          {
            uint64_t v10 = 0;
          }
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __MTCAColorMatrixIsDictionaryRepresentation_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void MTCAColorMatrixMakeWithDictionaryRepresentation(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  id v4 = (_OWORD *)MEMORY[0x1E4F39AD8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  *(_OWORD *)(a2 + 48) = v5;
  *(_OWORD *)(a2 + 64) = v4[4];
  long long v6 = v4[1];
  *(_OWORD *)a2 = *v4;
  *(_OWORD *)(a2 + 16) = v6;
  if (v3)
  {
    id v67 = v3;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"m11"];
    if (v7)
    {
      id v8 = [v67 objectForKeyedSubscript:@"m11"];
      [v8 floatValue];
      *(_DWORD *)a2 = v9;
    }
    uint64_t v10 = [v67 objectForKeyedSubscript:@"m12"];
    if (v10)
    {
      id v11 = [v67 objectForKeyedSubscript:@"m12"];
      [v11 floatValue];
      *(_DWORD *)(a2 + 4) = v12;
    }
    v13 = [v67 objectForKeyedSubscript:@"m13"];
    if (v13)
    {
      char v14 = [v67 objectForKeyedSubscript:@"m13"];
      [v14 floatValue];
      *(_DWORD *)(a2 + 8) = v15;
    }
    double v16 = [v67 objectForKeyedSubscript:@"m14"];
    if (v16)
    {
      double v17 = [v67 objectForKeyedSubscript:@"m14"];
      [v17 floatValue];
      *(_DWORD *)(a2 + 12) = v18;
    }
    uint64_t v19 = [v67 objectForKeyedSubscript:@"m15"];
    if (v19)
    {
      id v20 = [v67 objectForKeyedSubscript:@"m15"];
      [v20 floatValue];
      *(_DWORD *)(a2 + 16) = v21;
    }
    v22 = [v67 objectForKeyedSubscript:@"m21"];
    if (v22)
    {
      v23 = [v67 objectForKeyedSubscript:@"m21"];
      [v23 floatValue];
      *(_DWORD *)(a2 + 20) = v24;
    }
    uint64_t v25 = [v67 objectForKeyedSubscript:@"m22"];
    if (v25)
    {
      v26 = [v67 objectForKeyedSubscript:@"m22"];
      [v26 floatValue];
      *(_DWORD *)(a2 + 24) = v27;
    }
    id v28 = [v67 objectForKeyedSubscript:@"m23"];
    if (v28)
    {
      uint64_t v29 = [v67 objectForKeyedSubscript:@"m23"];
      [v29 floatValue];
      *(_DWORD *)(a2 + 28) = v30;
    }
    v31 = [v67 objectForKeyedSubscript:@"m24"];
    if (v31)
    {
      id v32 = [v67 objectForKeyedSubscript:@"m24"];
      [v32 floatValue];
      *(_DWORD *)(a2 + 32) = v33;
    }
    v34 = [v67 objectForKeyedSubscript:@"m25"];
    if (v34)
    {
      uint64_t v35 = [v67 objectForKeyedSubscript:@"m25"];
      [v35 floatValue];
      *(_DWORD *)(a2 + 36) = v36;
    }
    v37 = [v67 objectForKeyedSubscript:@"m31"];
    if (v37)
    {
      v38 = [v67 objectForKeyedSubscript:@"m31"];
      [v38 floatValue];
      *(_DWORD *)(a2 + 40) = v39;
    }
    v40 = [v67 objectForKeyedSubscript:@"m32"];
    if (v40)
    {
      uint64_t v41 = [v67 objectForKeyedSubscript:@"m32"];
      [v41 floatValue];
      *(_DWORD *)(a2 + 44) = v42;
    }
    uint64_t v43 = [v67 objectForKeyedSubscript:@"m33"];
    if (v43)
    {
      v44 = [v67 objectForKeyedSubscript:@"m33"];
      [v44 floatValue];
      *(_DWORD *)(a2 + 48) = v45;
    }
    v46 = [v67 objectForKeyedSubscript:@"m34"];
    if (v46)
    {
      v47 = [v67 objectForKeyedSubscript:@"m34"];
      [v47 floatValue];
      *(_DWORD *)(a2 + 52) = v48;
    }
    v49 = [v67 objectForKeyedSubscript:@"m35"];
    if (v49)
    {
      v50 = [v67 objectForKeyedSubscript:@"m35"];
      [v50 floatValue];
      *(_DWORD *)(a2 + 56) = v51;
    }
    long long v52 = [v67 objectForKeyedSubscript:@"m41"];
    if (v52)
    {
      v53 = [v67 objectForKeyedSubscript:@"m41"];
      [v53 floatValue];
      *(_DWORD *)(a2 + 60) = v54;
    }
    id v55 = [v67 objectForKeyedSubscript:@"m42"];
    if (v55)
    {
      uint64_t v56 = [v67 objectForKeyedSubscript:@"m42"];
      [v56 floatValue];
      *(_DWORD *)(a2 + 64) = v57;
    }
    uint64_t v58 = [v67 objectForKeyedSubscript:@"m43"];
    if (v58)
    {
      v59 = [v67 objectForKeyedSubscript:@"m43"];
      [v59 floatValue];
      *(_DWORD *)(a2 + 68) = v60;
    }
    float v61 = [v67 objectForKeyedSubscript:@"m44"];
    if (v61)
    {
      v62 = [v67 objectForKeyedSubscript:@"m44"];
      [v62 floatValue];
      *(_DWORD *)(a2 + 72) = v63;
    }
    unint64_t v64 = [v67 objectForKeyedSubscript:@"m45"];
    if (v64)
    {
      v65 = [v67 objectForKeyedSubscript:@"m45"];
      [v65 floatValue];
      *(_DWORD *)(a2 + 76) = v66;
    }
    id v3 = v67;
  }
}

id MTCAFilterCurvesInputValuesKeys()
{
  if (MTCAFilterCurvesInputValuesKeys_onceToken != -1) {
    dispatch_once(&MTCAFilterCurvesInputValuesKeys_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys;
  return v0;
}

BOOL MTFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

BOOL _IsValueIdentity(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!_IsIdentityProperty(v6, a3))
  {
LABEL_6:
    BOOL IsIdentity = 0;
    goto LABEL_10;
  }
  if (![v6 isEqualToString:*MEMORY[0x1E4F3A038]])
  {
    if (([v6 isEqualToString:*MEMORY[0x1E4F39FD0]] & 1) == 0)
    {
      [v5 floatValue];
      BOOL IsIdentity = MTIdentityValueForFilter(v6) == v8;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  if (v5) {
    [v5 CAColorMatrixValue];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  BOOL IsIdentity = MTCAColorMatrixIsIdentity(v10);
LABEL_10:

  return IsIdentity;
}

BOOL MTCAColorMatrixIsIdentity(_OWORD *a1)
{
  long long v1 = a1[3];
  v4[2] = a1[2];
  v4[3] = v1;
  v4[4] = a1[4];
  long long v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  return MTCAColorMatrixEqualToMatrix((float *)v4, MEMORY[0x1E4F39AD8]);
}

BOOL MTCAColorMatrixEqualToMatrix(float *a1, float *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7]
      && a1[8] == a2[8]
      && a1[9] == a2[9]
      && a1[10] == a2[10]
      && a1[11] == a2[11]
      && a1[12] == a2[12]
      && a1[13] == a2[13]
      && a1[14] == a2[14]
      && a1[15] == a2[15]
      && a1[16] == a2[16]
      && a1[17] == a2[17]
      && a1[18] == a2[18]
      && a1[19] == a2[19];
}

uint64_t MTDynamicBlurRadiusGraphicsQuality()
{
  if (MTDynamicBlurRadiusGraphicsQuality_onceToken != -1) {
    dispatch_once(&MTDynamicBlurRadiusGraphicsQuality_onceToken, &__block_literal_global_21);
  }
  if (MTDynamicBlurRadiusGraphicsQuality___dynamicBlurRadiusGraphicsQuality) {
    return 10;
  }
  else {
    return 100;
  }
}

id MTMaterialCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a1;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = _MTRecipeForRecipeWithOptions(v5, v3);

  float v8 = [v3 objectForKey:@"MTDictionaryRepresentationOptionsBundleKey"];
  int v9 = MTMaterialSettingsForRecipeFromBundle(v7, v8);

  if (v9)
  {
    uint64_t v10 = [v9 baseMaterialSettings];
    uint64_t v11 = MTTintingFilteringSettingsCreateDictionaryRepresentation(v10, v3);

    id v6 = (id)v11;
  }

  return v6;
}

id MTMaterialSettingsForRecipeFromBundle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  if (v5 && ([v5 isEqualToString:@"none"] & 1) == 0)
  {
    uint64_t v8 = _RecipeNameForCoreMaterialRecipe(v5);
    int v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (void *)v8;
    }
    else {
      uint64_t v10 = v5;
    }
    id v11 = v10;

    uint64_t v7 = _SharedMaterialSettingsForRecipeWithNameFromBundle(v11, v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id MTVisualStylingCreateDictionaryRepresentation(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = _MTRecipeForRecipeWithOptions(a1, v9);
  id v11 = [v9 objectForKey:@"MTDictionaryRepresentationOptionsBundleKey"];
  if (v11) {
    MTSharedVisualStyleSetForStyleNameFromBundle(v10, v11);
  }
  else {
  int v12 = MTSharedVisualStyleSetForRecipeAndCategory(v10, v7);
  }
  v13 = v12;
  if (!v12
    || ([v12 visualStylingForStyle:v8], (char v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || (int v15 = v14,
        MTVisualStylingSettingsCreateDictionaryRepresentation(v14, v9),
        id v16 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        !v16))
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }

  return v16;
}

id MTVisualStylingSettingsCreateDictionaryRepresentation(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    id v6 = [v3 tintColorDescription];

    if (v6)
    {
      id v7 = [v3 tintColorDescription];
      [v5 setObject:v7 forKey:@"tintColor"];

      id v8 = NSNumber;
      [v3 tintAlpha];
      id v9 = objc_msgSend(v8, "numberWithDouble:");
      [v5 setObject:v9 forKey:@"tintAlpha"];
    }
    uint64_t v10 = [v3 compositingFilter];
    if (v10
      && ([v4 objectForKey:@"MTDictionaryRepresentationOptionsFiltersRepresentationV2Key"],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 BOOLValue],
          v11,
          !v12))
    {
      [v5 setObject:v10 forKey:@"compositingFilter"];
    }
    else
    {
      v13 = [v3 filterType];
      char v14 = [v3 filterProperties];
      int v15 = MTComposedFilterCreateDictionaryRepresentation(v13, v14, v10 != 0);
      [v5 addEntriesFromDictionary:v15];
    }
    id v16 = [v3 userInfo];
    if (v16) {
      [v5 setObject:v16 forKey:@"userInfo"];
    }
  }
  return v5;
}

id MTSharedVisualStyleSetForRecipeAndCategory(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  id v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = _RecipeNameForCoreMaterialRecipe(v3);
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (void *)v7;
    }
    else {
      id v9 = v3;
    }
    id v10 = v9;

    id v11 = v5;
    int v12 = _SharedMaterialSettingsForRecipeWithNameFromBundle(v10, 0);
    v13 = [v12 styleNameForCategory:v11];

    id v6 = MTSharedVisualStyleSetForStyleNameFromBundle(v13, 0);

    id v3 = v10;
  }

  return v6;
}

MTRecipeMaterialSettings *_SharedMaterialSettingsForRecipeWithNameFromBundle(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v3 || ([v3 isEqualToString:@"none"] & 1) != 0)
  {
    id v5 = 0;
    goto LABEL_47;
  }
  if (_SharedMaterialSettingsForRecipeWithNameFromBundle_onceToken != -1) {
    dispatch_once(&_SharedMaterialSettingsForRecipeWithNameFromBundle_onceToken, &__block_literal_global_219);
  }
  id v6 = _RecipeNamesToSharedInstances();
  id v5 = [v6 objectForKey:v3];

  if (!v5)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_SharedMaterialSettingsForRecipeWithNameFromBundle___lock);
    id v32 = [MEMORY[0x1E4F28B50] coreMaterialOverrideRecipeBundle];
    v31 = [MEMORY[0x1E4F28B50] coreMaterialRecipeBundle];
    id v7 = v3;
    id v8 = 0;
    id v9 = v7;
    id v30 = v7;
    while (1)
    {
      uint64_t v10 = [v4 URLForMaterialRecipeDescendant:v7];
      if (v10)
      {
        id v11 = (void *)v10;
      }
      else
      {
        int v12 = [v32 URLForMaterialRecipeDescendant:v7];
        v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [v31 URLForMaterialRecipeDescendant:v7];
        }
        id v11 = v14;

        if (!v11)
        {
          int v21 = v9;
LABEL_32:
          int v24 = [v4 URLForMaterialRecipe:v21];
          if (v24
            || ([v32 URLForMaterialRecipe:v21],
                (int v24 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([v31 URLForMaterialRecipe:v21],
                (int v24 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v33 = 0;
            uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v24 error:&v33];
            id v26 = v33;
            int v27 = v26;
            if (!v25 || v26)
            {
              if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR)) {
                _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_1();
              }
              id v5 = 0;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG)) {
                _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_3();
              }
              id v5 = [[MTRecipeMaterialSettings alloc] initWithRecipeName:v30 andDescription:v25 descendantDescriptions:v8 bundle:v4];
              if (v5)
              {
                id v28 = _RecipeNamesToSharedInstances();
                [v28 setObject:v5 forKey:v30];

                if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG)) {
                  _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_2();
                }
              }
            }
          }
          else
          {
            id v5 = 0;
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_SharedMaterialSettingsForRecipeWithNameFromBundle___lock);

          break;
        }
      }
      id v15 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v34 = 0;
      id v16 = (void *)[v15 initWithContentsOfURL:v11 error:&v34];
      id v17 = v34;
      int v18 = v17;
      uint64_t v19 = MTLogConfiguration;
      if (v16) {
        BOOL v20 = v17 == 0;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          int v36 = v11;
          _os_log_debug_impl(&dword_1AE9D6000, v19, OS_LOG_TYPE_DEBUG, "Loaded descendant material recipe plist at URL: %{public}@", buf, 0xCu);
        }
        int v21 = [v16 objectForKey:@"ancestorRecipe"];

        uint64_t v22 = [v16 objectForKey:@"descendantDescription"];
        v23 = (void *)v22;
        id v7 = 0;
        if (v21 && v22)
        {
          if (!v8) {
            id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v8 insertObject:v23 atIndex:0];
          id v7 = v21;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          int v36 = v11;
          __int16 v37 = 2114;
          v38 = v18;
          _os_log_error_impl(&dword_1AE9D6000, v19, OS_LOG_TYPE_ERROR, "Failed to load descendant material recipe plist at URL (%{public}@): %{public}@", buf, 0x16u);
        }
        id v7 = 0;
        int v21 = v9;
      }

      id v9 = v21;
      if (!v7) {
        goto LABEL_32;
      }
    }
  }
LABEL_47:

  return v5;
}

id _RecipeNamesToSharedInstances()
{
  if (_RecipeNamesToSharedInstances_onceToken != -1) {
    dispatch_once(&_RecipeNamesToSharedInstances_onceToken, &__block_literal_global_217);
  }
  v0 = (void *)_RecipeNamesToSharedInstances___recipeNamesToSharedInstances;
  return v0;
}

id _RecipeNameForCoreMaterialRecipe(void *a1)
{
  id v1 = a1;
  long long v2 = v1;
  if (v1 && ([v1 isEqualToString:@"none"] & 1) == 0)
  {
    if (_LoadCoreMaterialRecipeNames_onceToken != -1) {
      dispatch_once(&_LoadCoreMaterialRecipeNames_onceToken, &__block_literal_global_213);
    }
    if ([(id)__coreMaterialRecipeNames containsObject:v2]) {
      id v4 = v2;
    }
    else {
      id v4 = 0;
    }
    id v3 = v4;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

MTVisualStyleSet *MTSharedVisualStyleSetForStyleNameFromBundle(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    v31 = _StylesToSharedInstances();
    id v5 = [v31 objectForKey:v3];
    if (!v5)
    {
      obuint64_t j = v31;
      objc_sync_enter(obj);
      id v32 = [MEMORY[0x1E4F28B50] coreMaterialOverrideRecipeBundle];
      id v30 = [MEMORY[0x1E4F28B50] coreMaterialRecipeBundle];
      id v6 = v3;
      id v7 = 0;
      *(void *)&long long v8 = 138543362;
      long long v27 = v8;
      id v9 = v6;
      id v28 = v6;
      do
      {
        uint64_t v10 = objc_msgSend(v4, "URLForVisualStyleSetDescendant:", v6, v27);
        if (v10)
        {
        }
        else
        {
          id v11 = [v32 URLForVisualStyleSetDescendant:v6];
          int v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v13 = [v30 URLForVisualStyleSetDescendant:v6];
          }
          uint64_t v10 = v13;

          if (!v10) {
            break;
          }
        }
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        id v34 = 0;
        id v15 = (void *)[v14 initWithContentsOfURL:v10 error:&v34];
        id v16 = v34;
        id v17 = v16;
        int v18 = MTLogConfiguration;
        if (!v15 || v16)
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            int v36 = v10;
            __int16 v37 = 2114;
            v38 = v17;
            _os_log_error_impl(&dword_1AE9D6000, v18, OS_LOG_TYPE_ERROR, "Failed to load descendant style set plist at URL (%{public}@): %{public}@", buf, 0x16u);
          }
          id v6 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v27;
            int v36 = v10;
            _os_log_debug_impl(&dword_1AE9D6000, v18, OS_LOG_TYPE_DEBUG, "Loaded descendant style set plist at URL: %{public}@", buf, 0xCu);
          }
          uint64_t v19 = [v15 objectForKey:@"ancestorStyleSet"];

          uint64_t v20 = [v15 objectForKey:@"descendantDescription"];
          int v21 = (void *)v20;
          id v6 = 0;
          if (v19 && v20)
          {
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v7 insertObject:v21 atIndex:0];
            id v6 = v19;
          }

          id v9 = v19;
        }
      }
      while (v6);
      uint64_t v22 = [v4 URLForVisualStyleSet:v9];
      if (v22
        || ([v32 URLForVisualStyleSet:v9], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([v30 URLForVisualStyleSet:v9], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v33 = 0;
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v22 error:&v33];
        id v24 = v33;
        uint64_t v25 = v24;
        if (!v23 || v24)
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_ERROR)) {
            MTSharedVisualStyleSetForStyleNameFromBundle_cold_1();
          }
          id v5 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG)) {
            MTSharedVisualStyleSetForStyleNameFromBundle_cold_3();
          }
          id v5 = [[MTVisualStyleSet alloc] initWithName:v28 visualStyleSetDescription:v23 andDescendantDescriptions:v7];
          if (v5)
          {
            [obj setObject:v5 forKey:v28];
            if (os_log_type_enabled((os_log_t)MTLogConfiguration, OS_LOG_TYPE_DEBUG)) {
              MTSharedVisualStyleSetForStyleNameFromBundle_cold_2();
            }
          }
        }
      }
      else
      {
        id v5 = 0;
      }

      objc_sync_exit(obj);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1AE9E1DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

id _StylesToSharedInstances()
{
  if (_StylesToSharedInstances_onceToken != -1) {
    dispatch_once(&_StylesToSharedInstances_onceToken, &__block_literal_global_224);
  }
  v0 = (void *)_StylesToSharedInstances___stylesToSharedInstances;
  return v0;
}

__CFString *_MTRecipeForRecipeWithOptions(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (__CFString *)v3;
  id v6 = [v4 objectForKey:@"MTDictionaryRepresentationOptionsReduceTransparencyKey"];
  int v7 = [v6 BOOLValue];

  long long v8 = v5;
  if (v7)
  {
    if ([(__CFString *)v5 isEqualToString:@"platformChromeLight"])
    {
      id v9 = MTCoreMaterialRecipePlatformChromeLightReduceTransparency;
    }
    else
    {
      long long v8 = v5;
      if (![(__CFString *)v5 isEqualToString:@"platformChromeDark"]) {
        goto LABEL_8;
      }
      uint64_t v10 = [v4 objectForKey:@"MTDictionaryRepresentationOptionsUserInterfaceLevelKey"];
      uint64_t v11 = [v10 integerValue];

      id v9 = MTCoreMaterialRecipePlatformChromeDarkReduceTransparency;
      if (v11 == 1) {
        id v9 = MTCoreMaterialRecipePlatformChromeDarkReduceTransparencyLayer1;
      }
    }
    long long v8 = *v9;
  }
LABEL_8:

  return v8;
}

CGColorSpaceRef __GrayColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBB8]);
  GrayColorSpace___GrayColorSpace = (uint64_t)result;
  return result;
}

void __MTAllPlatformColorVisualStyles_block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"platformGray";
  v2[1] = @"platformBlue";
  v2[2] = @"platformTeal";
  v2[3] = @"platformOrange";
  v2[4] = @"platformGreen";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  id v1 = (void *)MTAllPlatformColorVisualStyles___systemColorVisualStyles;
  MTAllPlatformColorVisualStyles___systemColorVisualStyles = v0;
}

void __MTAllOrdinalVisualStyles_block_invoke()
{
  void v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"primary";
  v2[1] = @"secondary";
  v2[2] = @"tertiary";
  v2[3] = @"quaternary";
  v2[4] = @"highlight";
  v2[5] = @"separator";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  id v1 = (void *)MTAllOrdinalVisualStyles___visualStyles;
  MTAllOrdinalVisualStyles___visualStyles = v0;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

float32x4_t MTCAColorMatrixInterpolate@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X8>, double a4@<D0>)
{
  double v4 = fmax(fmin(a4, 1.0), 0.0);
  float32x4_t v5 = a1[1];
  float32x4_t v6 = vsubq_f32(*a2, *a1);
  float64x2_t v7 = vcvtq_f64_f32(*(float32x2_t *)v5.f32);
  float64x2_t v8 = vcvt_hight_f64_f32(v5);
  float32x4_t v9 = vsubq_f32(a2[1], v5);
  *a3 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)a1->f32), vcvtq_f64_f32(*(float32x2_t *)v6.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(*a1), vcvt_hight_f64_f32(v6), v4));
  a3[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v7, vcvtq_f64_f32(*(float32x2_t *)v9.f32), v4)), vmlaq_n_f64(v8, vcvt_hight_f64_f32(v9), v4));
  float32x4_t v10 = a1[2];
  float32x4_t v11 = a1[3];
  float32x4_t v12 = vsubq_f32(a2[2], v10);
  float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v10.f32), vcvtq_f64_f32(*(float32x2_t *)v12.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(v10), vcvt_hight_f64_f32(v12), v4));
  float32x4_t v14 = vsubq_f32(a2[3], v11);
  a3[2] = v13;
  a3[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(*(float32x2_t *)v11.f32), vcvtq_f64_f32(*(float32x2_t *)v14.f32), v4)), vmlaq_n_f64(vcvt_hight_f64_f32(v11), vcvt_hight_f64_f32(v14), v4));
  float32x4_t v15 = a1[4];
  float64x2_t v16 = vcvtq_f64_f32(*(float32x2_t *)v15.f32);
  float64x2_t v17 = vcvt_hight_f64_f32(v15);
  float32x4_t v18 = vsubq_f32(a2[4], v15);
  float32x4_t result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v16, vcvtq_f64_f32(*(float32x2_t *)v18.f32), v4)), vmlaq_n_f64(v17, vcvt_hight_f64_f32(v18), v4));
  a3[4] = result;
  return result;
}

id MTCAColorMatrixCreateDictionaryRepresentation(_DWORD *a1, double a2)
{
  v45[20] = *MEMORY[0x1E4F143B8];
  v44[0] = @"m11";
  LODWORD(a2) = *a1;
  uint64_t v43 = [NSNumber numberWithFloat:a2];
  v45[0] = v43;
  v44[1] = @"m12";
  LODWORD(v3) = a1[1];
  int v42 = [NSNumber numberWithFloat:v3];
  v45[1] = v42;
  v44[2] = @"m13";
  LODWORD(v4) = a1[2];
  uint64_t v41 = [NSNumber numberWithFloat:v4];
  v45[2] = v41;
  v44[3] = @"m14";
  LODWORD(v5) = a1[3];
  v40 = [NSNumber numberWithFloat:v5];
  v45[3] = v40;
  v44[4] = @"m15";
  LODWORD(v6) = a1[4];
  uint64_t v39 = [NSNumber numberWithFloat:v6];
  v45[4] = v39;
  v44[5] = @"m21";
  LODWORD(v7) = a1[5];
  v38 = [NSNumber numberWithFloat:v7];
  v45[5] = v38;
  v44[6] = @"m22";
  LODWORD(v8) = a1[6];
  __int16 v37 = [NSNumber numberWithFloat:v8];
  v45[6] = v37;
  v44[7] = @"m23";
  LODWORD(v9) = a1[7];
  int v36 = [NSNumber numberWithFloat:v9];
  v45[7] = v36;
  v44[8] = @"m24";
  LODWORD(v10) = a1[8];
  uint64_t v35 = [NSNumber numberWithFloat:v10];
  v45[8] = v35;
  v44[9] = @"m25";
  LODWORD(v11) = a1[9];
  id v34 = [NSNumber numberWithFloat:v11];
  v45[9] = v34;
  v44[10] = @"m31";
  LODWORD(v12) = a1[10];
  id v33 = [NSNumber numberWithFloat:v12];
  v45[10] = v33;
  v44[11] = @"m32";
  LODWORD(v13) = a1[11];
  float32x4_t v14 = [NSNumber numberWithFloat:v13];
  v45[11] = v14;
  v44[12] = @"m33";
  LODWORD(v15) = a1[12];
  float64x2_t v16 = [NSNumber numberWithFloat:v15];
  v45[12] = v16;
  v44[13] = @"m34";
  LODWORD(v17) = a1[13];
  float32x4_t v18 = [NSNumber numberWithFloat:v17];
  v45[13] = v18;
  v44[14] = @"m35";
  LODWORD(v19) = a1[14];
  uint64_t v20 = [NSNumber numberWithFloat:v19];
  v45[14] = v20;
  v44[15] = @"m41";
  LODWORD(v21) = a1[15];
  uint64_t v22 = [NSNumber numberWithFloat:v21];
  v45[15] = v22;
  v44[16] = @"m42";
  LODWORD(v23) = a1[16];
  id v24 = [NSNumber numberWithFloat:v23];
  v45[16] = v24;
  v44[17] = @"m43";
  LODWORD(v25) = a1[17];
  id v26 = [NSNumber numberWithFloat:v25];
  v45[17] = v26;
  v44[18] = @"m44";
  LODWORD(v27) = a1[18];
  id v28 = [NSNumber numberWithFloat:v27];
  v45[18] = v28;
  v44[19] = @"m45";
  LODWORD(v29) = a1[19];
  id v30 = [NSNumber numberWithFloat:v29];
  v45[19] = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:20];

  return v31;
}

CGFloat MTCGColorPerceivedLightness(CGColor *a1)
{
  size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
  Components = CGColorGetComponents(a1);
  if (NumberOfComponents == 4) {
    return sqrt(Components[1] * (Components[1] * 0.587)+ *Components * 0.299 * *Components+ Components[2] * 0.114 * Components[2]);
  }
  CGFloat result = 0.0;
  if (NumberOfComponents == 2) {
    return *Components;
  }
  return result;
}

BOOL MTCGColorIsPerceivedLight(CGColor *a1)
{
  return MTCGColorPerceivedLightness(a1) > 0.83;
}

BOOL MTCanGenerateVisualStylingDescriptionFromRecipeSettings(void *a1)
{
  id v1 = [a1 baseMaterialSettings];
  long long v2 = v1;
  if (v1) {
    BOOL VisualStylingDescriptionFromConfigurationSettings = _CanGenerateVisualStylingDescriptionFromConfigurationSettings(v1);
  }
  else {
    BOOL VisualStylingDescriptionFromConfigurationSettings = 0;
  }

  return VisualStylingDescriptionFromConfigurationSettings;
}

BOOL _CanGenerateVisualStylingDescriptionFromConfigurationSettings(void *a1)
{
  id v1 = a1;
  long long v2 = NSNumber;
  [v1 luminanceAmount];
  double v3 = objc_msgSend(v2, "numberWithDouble:");
  char v4 = objc_msgSend(v3, "mt_isIdentityValueForMaterialSettingsProperty:", @"luminanceAmount");

  double v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v1, "isAverageColorEnabled"));
  char v6 = objc_msgSend(v5, "mt_isIdentityValueForMaterialSettingsProperty:", @"averageColorEnabled");

  double v7 = [v1 curvesValues];

  double v8 = NSNumber;
  [v1 saturation];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = objc_msgSend(v9, "mt_isIdentityValueForMaterialSettingsProperty:", @"saturation");

  double v11 = NSNumber;
  [v1 brightness];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  char v13 = objc_msgSend(v12, "mt_isIdentityValueForMaterialSettingsProperty:", @"brightness");

  float32x4_t v14 = [v1 tintColorDescription];

  double v15 = (void *)MEMORY[0x1E4F29238];
  if (v1) {
    [v1 colorMatrix];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  float64x2_t v16 = [v15 valueWithBytes:v23 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  char v17 = objc_msgSend(v16, "mt_isIdentityValueForMaterialSettingsProperty:", @"colorMatrix");

  char v18 = v4 ^ 1;
  if (!v1) {
    char v18 = 1;
  }
  char v19 = v18 | v6 ^ 1;
  if (v7) {
    char v19 = 1;
  }
  if (v14) {
    char v20 = 1;
  }
  else {
    char v20 = v19;
  }
  if (v20 & 1 | ((v17 & 1) == 0)) {
    char v21 = v19;
  }
  else {
    char v21 = v10 & v13;
  }

  return (v21 & 1) == 0;
}

void sub_1AE9E6E64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __MTCAFilterCurvesInputValuesKeys_block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F3A190];
  v4[0] = *MEMORY[0x1E4F3A1E0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F3A0F8];
  v4[2] = *MEMORY[0x1E4F3A138];
  v4[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  double v3 = (void *)MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys;
  MTCAFilterCurvesInputValuesKeys___curvesFilterInputValuesKeys = v2;
}

void MTRegisterCoreMaterialLogging()
{
  if (MTRegisterCoreMaterialLogging_onceToken != -1) {
    dispatch_once(&MTRegisterCoreMaterialLogging_onceToken, &__block_literal_global_2);
  }
}

uint64_t __MTRegisterCoreMaterialLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)MTLogSubsystem, "Materials");
  uint64_t v1 = (void *)MTLogMaterials;
  MTLogMaterials = (uint64_t)v0;

  MTLogConfiguration = (uint64_t)os_log_create((const char *)MTLogSubsystem, "Configuration");
  return MEMORY[0x1F41817F8]();
}

float32x4_t _MTCAColorMatrixFloydRound@<Q0>(float32x4_t *a1@<X0>, float32x4_t *a2@<X8>)
{
  v2.i64[0] = 0x4300000043000000;
  v2.i64[1] = 0x4300000043000000;
  v3.i64[0] = 0x3C0000003C000000;
  v3.i64[1] = 0x3C0000003C000000;
  float32x4_t v4 = vmulq_f32(vrndaq_f32(vmulq_f32(a1[1], v2)), v3);
  *a2 = vmulq_f32(vrndaq_f32(vmulq_f32(*a1, v2)), v3);
  a2[1] = v4;
  float32x4_t v5 = vmulq_f32(vrndaq_f32(vmulq_f32(a1[3], v2)), v3);
  a2[2] = vmulq_f32(vrndaq_f32(vmulq_f32(a1[2], v2)), v3);
  a2[3] = v5;
  float32x4_t result = vmulq_f32(vrndaq_f32(vmulq_f32(a1[4], v2)), v3);
  a2[4] = result;
  return result;
}

void MTCAColorMatrixMakeWithVibrantShadowAttributes(float32x4_t *a1@<X8>, float a2@<S0>)
{
  MTFloatIsZero(fmaxf(fminf(a2, 0.99902), -0.99902));
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  long long v13 = v3;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  float32x4_t v10 = *(float32x4_t *)MEMORY[0x1E4F39AD8];
  long long v7 = v12;
  long long v8 = v3;
  long long v9 = v14;
  float32x4_t v5 = v10;
  long long v6 = v4;
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  CAColorMatrixConcat();
  long long v13 = v8;
  long long v11 = v6;
  _MTCAColorMatrixFloydRound(&v5, a1);
}

CGColorSpaceRef __RGBColorSpace_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  RGBColorSpace___RGBColorSpace = (uint64_t)result;
  return result;
}

BOOL _CanGenerateMaterialDescriptionForFilteringFromVisualStyling(void *a1)
{
  id v1 = a1;
  float32x4_t v2 = [v1 filterType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F3A350]])
  {
    long long v3 = [v1 filterProperties];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

id _MTLowQualityDevicesForDynamicBlurRadius()
{
  os_log_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"iPad5,1", @"iPad5,2", @"iPad5,3", @"iPad5,4", @"iPad7,1", @"iPad7,2", 0);
  return v0;
}

id _MTCurrentProduct()
{
  if (_MTCurrentProduct_onceToken != -1) {
    dispatch_once(&_MTCurrentProduct_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)_MTCurrentProduct___currentProduct;
  return v0;
}

void __MTDynamicBlurRadiusGraphicsQuality_block_invoke()
{
  os_log_t v0 = _MTLowQualityDevicesForDynamicBlurRadius();
  id v1 = _MTCurrentProduct();
  int v2 = [v0 containsObject:v1];

  if (v2) {
    MTDynamicBlurRadiusGraphicsQuality___dynamicBlurRadiusGraphicsQuality = 1;
  }
}

double _MTDefaultBackdropScaleAdjustmentForWeighting()
{
  return 1.5 / MTPreferredDisplayModeScale();
}

uint64_t MTSupportsDeepColor()
{
  if (MTSupportsDeepColor_onceToken != -1) {
    dispatch_once(&MTSupportsDeepColor_onceToken, &__block_literal_global_23);
  }
  return MTSupportsDeepColor___supportsDeepColor;
}

uint64_t __MTSupportsDeepColor_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  MTSupportsDeepColor___supportsDeepColor = result;
  return result;
}

double MTBuiltInScreenScale()
{
  if (MTBuiltInScreenScale_onceToken != -1) {
    dispatch_once(&MTBuiltInScreenScale_onceToken, &__block_literal_global_28);
  }
  return *(double *)&MTBuiltInScreenScale___builtInScreenScale;
}

double __MTBuiltInScreenScale_block_invoke()
{
  MGGetFloat32Answer();
  double result = v0;
  MTBuiltInScreenScale___builtInScreenScale = *(void *)&result;
  return result;
}

double MTEdgeOutsetsForCoreMaterialShadowProperties(uint64_t a1, double a2)
{
  double v2 = *(double *)(a1 + 24);
  double v3 = *(double *)(a1 + 16) * a2;
  if (-(v3 - v2 * a2) >= 1.0) {
    return -(v3 - v2 * a2);
  }
  else {
    return 1.0;
  }
}

uint64_t MTDimensionsForContinuousCornerRadiusInBounds(uint64_t result)
{
  if (result) {
    return objc_msgSend(MEMORY[0x1E4F39BE8], "cornerCurveExpansionFactor:", *MEMORY[0x1E4F39EA8], 1.0);
  }
  return result;
}

double MTResizableAreaForCornerDimensionsInBounds(double a1, double a2, double a3, double a4, double a5)
{
  double v7 = 1.0 / a3;
  if (MTFloatEqualToFloat(a1 + a1, a4)) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7;
  }
  MTFloatEqualToFloat(a2 + a2, a5);
  return v8;
}

CGImageRef MTShadowImageCreateWithCoreMaterialShadowProperties(uint64_t a1, int a2, double *a3, CGFloat a4, double a5, double a6, double a7)
{
  if (*(double *)(a1 + 24) <= 0.0) {
    return 0;
  }
  long long v14 = (uint64_t *)MEMORY[0x1E4F39EA8];
  double v15 = 1.0;
  if (a2) {
    objc_msgSend(MEMORY[0x1E4F39BE8], "cornerCurveExpansionFactor:", *MEMORY[0x1E4F39EA8], 1.0);
  }
  double v55 = a5;
  double v16 = ceil(v15 * a5 * a4) / a4;
  if (v16 >= a6 * 0.5) {
    double v17 = a6 * 0.5;
  }
  else {
    double v17 = v16;
  }
  if (v16 >= a7 * 0.5) {
    double v18 = a7 * 0.5;
  }
  else {
    double v18 = v16;
  }
  if (MTFloatEqualToFloat(v17 + v17, a6)) {
    double v19 = 0.0;
  }
  else {
    double v19 = 1.0 / a4;
  }
  double v54 = v19;
  if (MTFloatEqualToFloat(v18 + v18, a7)) {
    double v20 = 0.0;
  }
  else {
    double v20 = 1.0 / a4;
  }
  double v21 = *(double *)(a1 + 24);
  double v22 = *(double *)(a1 + 16) * a4;
  if (-(v22 - v21 * a4) >= 1.0) {
    double v23 = -(v22 - v21 * a4);
  }
  else {
    double v23 = 1.0;
  }
  double v24 = *(double *)(a1 + 8) * a4;
  if (-(v24 - v21 * a4) >= 1.0) {
    double v25 = -(v24 - v21 * a4);
  }
  else {
    double v25 = 1.0;
  }
  double v26 = v22 + v21 * a4;
  if (v26 >= 1.0) {
    double v27 = v26;
  }
  else {
    double v27 = 1.0;
  }
  double v28 = v24 + v21 * a4;
  if (v28 >= 1.0) {
    double v29 = v28;
  }
  else {
    double v29 = 1.0;
  }
  double v50 = v17;
  CGFloat v30 = v54 + v17 * 2.0;
  double v31 = v20 + v18 * 2.0;
  double v51 = -v25;
  v57.origin.x = v25;
  v57.origin.y = v23;
  v57.size.width = v30;
  v57.size.height = v31;
  double v49 = v29;
  double v32 = v29 + CGRectGetWidth(v57) + v25;
  double v52 = v30;
  double v53 = v25;
  v58.origin.x = v25;
  v58.origin.y = v23;
  v58.size.width = v30;
  v58.size.height = v31;
  double v33 = v27 + CGRectGetHeight(v58) + v23;
  size_t v34 = (unint64_t)(v33 * a4);
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  int v36 = CGBitmapContextCreate(0, (unint64_t)(v32 * a4), v34, 8uLL, AlignedBytesPerRow, 0, 7u);
  __int16 v37 = v36;
  if (v36)
  {
    v59.size.width = (double)(unint64_t)(v32 * a4);
    v59.origin.x = 0.0;
    v59.origin.y = 0.0;
    v59.size.height = (double)v34;
    CGContextClearRect(v36, v59);
    CGContextTranslateCTM(v37, 0.0, (double)v34);
    CGContextScaleCTM(v37, a4, -a4);
    CGContextGetCTM(&v56, v37);
    CGContextSetBaseCTM();
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  v60.origin.x = -v25;
  v60.origin.y = -v23;
  v60.size.width = v32;
  v60.size.height = v33;
  double Width = CGRectGetWidth(v60);
  v61.origin.x = v51;
  v61.origin.y = -v23;
  v61.size.width = v32;
  v61.size.height = v33;
  objc_msgSend(v38, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v61));
  id v40 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  [v38 addSublayer:v40];
  objc_msgSend(v40, "setFrame:", v53, v23, v52, v31);
  id v41 = +[MTColor blackColor];
  objc_msgSend(v40, "setBackgroundColor:", objc_msgSend(v41, "CGColor"));

  int v42 = (uint64_t *)MEMORY[0x1E4F39EA0];
  if (a2) {
    int v42 = v14;
  }
  uint64_t v43 = *v42;
  [v40 setCornerCurve:*v42];
  [v40 setCornerRadius:v55];
  LODWORD(v44) = *(_DWORD *)a1;
  [v40 setShadowOpacity:v44];
  objc_msgSend(v40, "setShadowOffset:", *(double *)(a1 + 8), *(double *)(a1 + 16));
  [v40 setShadowRadius:*(double *)(a1 + 24)];
  [v38 renderInContext:v37];
  id v45 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  objc_msgSend(v45, "setFrame:", v53, v23, v52, v31);
  id v46 = +[MTColor blackColor];
  objc_msgSend(v45, "setBackgroundColor:", objc_msgSend(v46, "CGColor"));

  [v45 setCornerCurve:v43];
  [v45 setCornerRadius:v55];
  CGContextSetBlendMode(v37, kCGBlendModeClear);
  [v40 removeFromSuperlayer];
  [v38 addSublayer:v45];
  [v38 renderInContext:v37];
  CGImageRef Image = CGBitmapContextCreateImage(v37);
  CGContextRelease(v37);
  if (a3)
  {
    *a3 = v18 + v23;
    a3[1] = v50 + v53;
    a3[2] = v18 + v27;
    a3[3] = v50 + v49;
  }

  return Image;
}

CGImageRef MTCGImageCreateWithName(void *a1, void *a2, double a3)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreMaterial"];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  double v8 = v7;
  if (v7)
  {
    v30[0] = v7;
    long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    if (a3 <= 0.0) {
      a3 = MTBuiltInScreenScale();
    }
    if (a3 == 0.0)
    {
      float32x4_t v10 = v9;
    }
    else
    {
      float32x4_t v10 = (void *)[v9 mutableCopy];
      uint64_t v11 = (uint64_t)a3;
      if ((uint64_t)a3 >= 1)
      {
        long long v12 = objc_msgSend(v8, "stringByAppendingFormat:", @"@%ldx", 1);
        if (v11 != 1)
        {
          uint64_t v13 = 1;
          do
          {
            [v10 insertObject:v12 atIndex:0];

            long long v12 = objc_msgSend(v8, "stringByAppendingFormat:", @"@%ldx", ++v13);
          }
          while (v11 != v13);
        }
        if (v12)
        {
          [v10 insertObject:v12 atIndex:0];
        }
      }
    }
  }
  else
  {
    float32x4_t v10 = 0;
  }
  long long v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    long long v14 = v10;
  }
  id v15 = v14;

  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = [v6 URLForResource:*(void *)(*((void *)&v25 + 1) + 8 * i) withExtension:@"png"];
        if (v20)
        {
          CFURLRef v21 = (const __CFURL *)v20;
          goto LABEL_28;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  CFURLRef v21 = 0;
LABEL_28:

  double v22 = CGDataProviderCreateWithURL(v21);
  CGImageRef v23 = CGImageCreateWithPNGDataProvider(v22, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v22);

  return v23;
}

CGImageRef _MTCreateDefaultLuminanceColorMap()
{
  return MTCGImageCreateWithName(@"luminanceColorMap", 0, 0.0);
}

uint64_t MTDefaultLuminanceColorMap()
{
  if (MTDefaultLuminanceColorMap_onceToken != -1) {
    dispatch_once(&MTDefaultLuminanceColorMap_onceToken, &__block_literal_global_5);
  }
  return MTDefaultLuminanceColorMap___defaultLuminanceColorMap;
}

CGImageRef __MTDefaultLuminanceColorMap_block_invoke()
{
  CGImageRef result = MTCGImageCreateWithName(@"luminanceColorMap", 0, 0.0);
  MTDefaultLuminanceColorMap___defaultLuminanceColorMap = (uint64_t)result;
  return result;
}

IOSurfaceRef MTIOSurfaceCreate(char a1, double a2, double a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  int v6 = MTSupportsDeepColor();
  float v7 = a2;
  if (v6)
  {
    if ((a1 & 1) == 0)
    {
      uint64_t v24 = llroundf(v7);
      float v25 = a3;
      uint64_t v26 = llroundf(v25);
      uint64_t v27 = *MEMORY[0x1E4F2EFE0];
      uint64_t v28 = MEMORY[0x1B3E73F10](*MEMORY[0x1E4F2EFE0], 4 * v24);
      uint64_t v29 = v28 * v26;
      uint64_t v13 = _makeIOSurfacePlaneProperties(v24, v26, v28, 0, v28 * v26);
      uint64_t v30 = MEMORY[0x1B3E73F10](v27, v24);
      uint64_t v31 = v30 * v26;
      long long v14 = _makeIOSurfacePlaneProperties(v24, v26, v30, v29, v30 * v26);
      uint64_t v32 = v31 + v29;
      uint64_t v40 = *MEMORY[0x1E4F2F2C0];
      CFURLRef v21 = [NSNumber numberWithLong:v24];
      id v46 = v21;
      uint64_t v41 = *MEMORY[0x1E4F2F0E8];
      double v22 = [NSNumber numberWithLong:v26];
      uint64_t v33 = *MEMORY[0x1E4F2F150];
      v47 = v22;
      int v48 = &unk_1F06A5510;
      uint64_t v34 = *MEMORY[0x1E4F2F238];
      uint64_t v42 = v33;
      uint64_t v43 = v34;
      v39[0] = v13;
      v39[1] = v14;
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      double v49 = v35;
      uint64_t v44 = *MEMORY[0x1E4F2EFB8];
      int v36 = [NSNumber numberWithUnsignedLong:v32];
      double v50 = v36;
      CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v40 count:5];

      goto LABEL_7;
    }
    unint64_t v8 = llroundf(v7);
    float v9 = a3;
    unint64_t v10 = llroundf(v9);
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    uint64_t v12 = (AlignedBytesPerRow * v10);
    uint64_t v40 = *MEMORY[0x1E4F2F2C0];
    uint64_t v13 = [NSNumber numberWithInt:v8];
    id v46 = v13;
    uint64_t v41 = *MEMORY[0x1E4F2F0E8];
    long long v14 = [NSNumber numberWithInt:v10];
    v47 = v14;
    int v48 = &unk_1F06A54E0;
    uint64_t v15 = *MEMORY[0x1E4F2EFD8];
    uint64_t v42 = *MEMORY[0x1E4F2F150];
    uint64_t v43 = v15;
    uint64_t v16 = &unk_1F06A54F8;
  }
  else
  {
    unint64_t v17 = llroundf(v7);
    float v18 = a3;
    unint64_t v19 = llroundf(v18);
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    uint64_t v12 = (AlignedBytesPerRow * v19);
    uint64_t v40 = *MEMORY[0x1E4F2F2C0];
    uint64_t v13 = [NSNumber numberWithLong:v17];
    id v46 = v13;
    uint64_t v41 = *MEMORY[0x1E4F2F0E8];
    long long v14 = [NSNumber numberWithLong:v19];
    v47 = v14;
    int v48 = &unk_1F06A5528;
    uint64_t v20 = *MEMORY[0x1E4F2EFD8];
    uint64_t v42 = *MEMORY[0x1E4F2F150];
    uint64_t v43 = v20;
    uint64_t v16 = &unk_1F06A5540;
  }
  double v49 = v16;
  uint64_t v44 = *MEMORY[0x1E4F2EFE0];
  CFURLRef v21 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
  double v50 = v21;
  uint64_t v45 = *MEMORY[0x1E4F2EFB8];
  double v22 = [NSNumber numberWithInt:v12];
  double v51 = v22;
  CFDictionaryRef v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v40 count:6];
LABEL_7:

  IOSurfaceRef v37 = IOSurfaceCreate(v23);
  return v37;
}

id _makeIOSurfacePlaneProperties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F2F258];
  float v9 = [NSNumber numberWithUnsignedLong:a1];
  v17[0] = v9;
  v16[1] = *MEMORY[0x1E4F2F220];
  unint64_t v10 = [NSNumber numberWithUnsignedLong:a2];
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E4F2F178];
  uint64_t v11 = [NSNumber numberWithUnsignedLong:a3];
  v17[2] = v11;
  v16[3] = *MEMORY[0x1E4F2F240];
  uint64_t v12 = [NSNumber numberWithUnsignedLong:a4];
  v17[3] = v12;
  v16[4] = *MEMORY[0x1E4F2F248];
  uint64_t v13 = [NSNumber numberWithUnsignedLong:a5];
  v17[4] = v13;
  long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  return v14;
}

id MTMaterialSettingsForRecipe(void *a1)
{
  return MTMaterialSettingsForRecipeFromBundle(a1, 0);
}

id MTDiscoveredMaterialRecipes()
{
  if (MTDiscoveredMaterialRecipes_onceToken != -1) {
    dispatch_once(&MTDiscoveredMaterialRecipes_onceToken, &__block_literal_global_6);
  }
  float v0 = (void *)MTDiscoveredMaterialRecipes___materialRecipes;
  return v0;
}

void __MTDiscoveredMaterialRecipes_block_invoke()
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  if (_DiscoveredMaterialRecipeURLs_onceToken != -1) {
    dispatch_once(&_DiscoveredMaterialRecipeURLs_onceToken, &__block_literal_global_211);
  }
  obuint64_t j = (id)_DiscoveredMaterialRecipeURLs___discoveredMaterialRecipeURLs;
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      uint64_t v1 = 0;
      do
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(obj);
        }
        double v2 = [*(id *)(*((void *)&v22 + 1) + 8 * v1) lastPathComponent];
        double v3 = [v2 stringByDeletingPathExtension];

        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        if (_LoadCoreMaterialRecipeNames_onceToken != -1) {
          dispatch_once(&_LoadCoreMaterialRecipeNames_onceToken, &__block_literal_global_213);
        }
        id v4 = (id)__coreMaterialRecipeNames;
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (!v5)
        {

LABEL_22:
          [v0 addObject:v3];
          goto LABEL_23;
        }
        uint64_t v6 = v5;
        uint64_t v17 = v1;
        char v7 = 0;
        uint64_t v8 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v19 != v8) {
              objc_enumerationMutation(v4);
            }
            unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v11 = _RecipeNameForCoreMaterialRecipe(v10);
            int v12 = [v3 isEqualToString:v11];

            if (v12)
            {
              [v0 addObject:v10];
              char v7 = 1;
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v6);

        uint64_t v1 = v17;
        if ((v7 & 1) == 0) {
          goto LABEL_22;
        }
LABEL_23:

        ++v1;
      }
      while (v1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }

  uint64_t v13 = (void *)MTDiscoveredMaterialRecipes___materialRecipes;
  MTDiscoveredMaterialRecipes___materialRecipes = (uint64_t)v0;
}

id MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundle(void *a1, void *a2, void *a3)
{
  return _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(a1, a2, a3, 0);
}

id _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = 0;
  if (v7 && v8)
  {
    int v12 = MTSharedVisualStyleSetForStyleNameFromBundle(v8, v9);
    id v13 = v7;
    id v14 = v12;
    id v15 = v10;
    if (v14)
    {
      uint64_t v16 = [v14 visualStyleSetName];
      uint64_t v17 = +[MTVisualStyleSet recipeNameForRecipeFromStyle:v13 fromStyleSetWithName:v16];

      long long v18 = _RecipeNamesToSharedInstances();
      long long v19 = [v18 objectForKey:v17];
      if (!v19)
      {
        if (objc_opt_respondsToSelector())
        {
          long long v19 = (void *)[v14 _newMaterialSettingsForStyle:v13 withProvidedStyles:v15];
          if (v19)
          {
            obuint64_t j = v18;
            objc_sync_enter(obj);
            [obj setObject:v19 forKey:v17];
            objc_sync_exit(obj);
          }
        }
        else
        {
          long long v19 = 0;
        }
      }
    }
    else
    {
      long long v19 = 0;
    }

    if (v19)
    {
      uint64_t v11 = [v19 recipeName];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  return v11;
}

void sub_1AE9EAC10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id MTCoreMaterialRecipeForVisualStyleFromStyleWithName(void *a1, void *a2)
{
  return _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(a1, a2, 0, 0);
}

id MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = _SharedMaterialSettingsForRecipeWithNameFromBundle(a1, v7);
  uint64_t v11 = [v10 styleNameForCategory:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle_block_invoke;
  v17[3] = &unk_1E5F1B870;
  id v18 = v10;
  id v12 = v10;
  id v13 = (void (**)(void, void, void))MEMORY[0x1B3E741F0](v17);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  ((void (**)(void, __CFString *, void *))v13)[2](v13, @"stroke", v14);
  ((void (**)(void, __CFString *, void *))v13)[2](v13, @"fill", v14);
  ((void (**)(void, __CFString *, void *))v13)[2](v13, @"overlay", v14);
  id v15 = _MTCoreMaterialRecipeForVisualStyleFromStyleWithNameFromBundleWithProvidedStyles(v8, v11, v7, v14);

  return v15;
}

void __MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) styleNameForCategory:v7];
  if (v6) {
    [v5 setObject:v6 forKey:v7];
  }
}

id MTSharedVisualStyleSetGeneratedFromRecipe(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    double v2 = v1;
    uint64_t v3 = _RecipeNameForCoreMaterialRecipe(v1);
    id v4 = (void *)v3;
    if (v3) {
      id v5 = (void *)v3;
    }
    else {
      id v5 = v2;
    }
    id v6 = v5;

    id v7 = +[MTRecipeMaterialSettings styleSetNameForStyleSetFromRecipeWithName:v6];
    id v8 = _StylesToSharedInstances();
    id v9 = [v8 objectForKey:v7];
    if (!v9)
    {
      id v10 = MTMaterialSettingsForRecipeFromBundle(v6, 0);
      if (objc_opt_respondsToSelector())
      {
        id v9 = (void *)[v10 _newVisualStyleSet];
        if (v9)
        {
          id v11 = v8;
          objc_sync_enter(v11);
          [v11 setObject:v9 forKey:v7];
          objc_sync_exit(v11);
        }
      }
    }
  }
  else
  {
    id v9 = 0;
    id v6 = 0;
  }

  return v9;
}

void sub_1AE9EAF68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id MTAllVisualStyleCategories()
{
  if (MTAllVisualStyleCategories_onceToken != -1) {
    dispatch_once(&MTAllVisualStyleCategories_onceToken, &__block_literal_global_189);
  }
  id v0 = (void *)MTAllVisualStyleCategories___categories;
  return v0;
}

void __MTAllVisualStyleCategories_block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"stroke";
  v2[1] = @"fill";
  v2[2] = @"overlay";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  id v1 = (void *)MTAllVisualStyleCategories___categories;
  MTAllVisualStyleCategories___categories = v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id __MTTintingFilteringSettingsCreateDictionaryRepresentation_block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  double v2 = @"inputColorMap";
  v3[0] = MTDefaultLuminanceColorMap();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

id MTMaterialCreateDictionaryRepresentationWithOptions(void *a1, uint64_t a2, void *a3)
{
  return MTMaterialCreateDictionaryRepresentation(a1, a3);
}

id MTStylingProvidingSolidColorLayerStyleDictionaryForPlusLAndWhiteTint(CGColor *a1, double a2, double a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  double v18 = 0.0;
  double v19 = 0.0;
  double v17 = 0.0;
  _ColorGetComponents(a1, &v19, &v18, &v17);
  double v5 = fmin(a2 + a3 * v19, 1.0);
  if (v5 < 0.0) {
    double v5 = 0.0;
  }
  double v6 = fmin(a2 + a3 * v18, 1.0);
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = fmin(a2 + a3 * v17, 1.0);
  if (v8 >= 0.0) {
    double v9 = v8;
  }
  else {
    double v9 = 0.0;
  }
  long long v24 = @"tinting";
  long long v22 = @"tintColor";
  v21[0] = &unk_1F06A5558;
  v20[0] = @"alpha";
  v20[1] = @"red";
  id v10 = [NSNumber numberWithDouble:v5];
  v21[1] = v10;
  v20[2] = @"green";
  id v11 = [NSNumber numberWithDouble:v7];
  v21[2] = v11;
  v20[3] = @"blue";
  id v12 = [NSNumber numberWithDouble:v9];
  v21[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  long long v23 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  return v15;
}

id MTStylingProvidingSolidColorLayerHighlightStyleDictionary(CGColor *a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  MTCGColorPerceivedLightness(a1);
  v12[0] = @"tinting";
  v12[1] = @"filtering";
  v13[0] = &unk_1F06A5658;
  v11[0] = *MEMORY[0x1E4F3A350];
  v10[0] = @"filterType";
  v10[1] = @"filterProperties";
  double v8 = @"inputColorMatrix";
  CAColorMatrixMakeBrightness();
  double v2 = MTCAColorMatrixCreateDictionaryRepresentation(v7, v1);
  double v9 = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[1] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v5;
}

id MTStylingProvidingSolidColorLayerStyleDictionaryForPlusDAmount(CGColor *a1, double a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  double v18 = 0.0;
  double v19 = 0.0;
  double v17 = 0.0;
  _ColorGetComponents(a1, &v19, &v18, &v17);
  double v3 = 1.0 - a2;
  double v4 = fmin(1.0 - a2 + 1.0 - v19, 1.0);
  if (v4 >= 0.0) {
    double v5 = 1.0 - v4;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = fmin(v3 + 1.0 - v18, 1.0);
  if (v6 >= 0.0) {
    double v7 = 1.0 - v6;
  }
  else {
    double v7 = 1.0;
  }
  double v8 = fmin(v3 + 1.0 - v17, 1.0);
  if (v8 >= 0.0) {
    double v9 = 1.0 - v8;
  }
  else {
    double v9 = 1.0;
  }
  long long v24 = @"tinting";
  long long v22 = @"tintColor";
  v21[0] = &unk_1F06A5558;
  v20[0] = @"alpha";
  v20[1] = @"red";
  id v10 = [NSNumber numberWithDouble:v5];
  v21[1] = v10;
  v20[2] = @"green";
  id v11 = [NSNumber numberWithDouble:v7];
  v21[2] = v11;
  v20[3] = @"blue";
  id v12 = [NSNumber numberWithDouble:v9];
  v21[3] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  long long v23 = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  return v15;
}

CGFloat _ColorGetComponents(CGColor *a1, void *a2, void *a3, void *a4)
{
  if (a1 && a2 && a3 && a4)
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents == 4)
    {
      *a2 = *(void *)Components;
      *a3 = *((void *)Components + 1);
      Components += 2;
    }
    else
    {
      if (NumberOfComponents != 2) {
        return result;
      }
      *a2 = *(void *)Components;
      *a3 = *(void *)Components;
    }
    CGFloat result = *Components;
    *a4 = *(void *)Components;
  }
  return result;
}

void _MTSetCoreMaterialPlatformConfiguration(void *a1)
{
  id v2 = a1;
  if ((id)__platformConfiguration != v2)
  {
    id v3 = v2;
    objc_storeStrong((id *)&__platformConfiguration, a1);
    id v2 = v3;
  }
}

void sub_1AE9EC694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

BOOL MTFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

double MTPreferredDisplayModeScale()
{
  if (MTPreferredDisplayModeScale___once != -1) {
    dispatch_once(&MTPreferredDisplayModeScale___once, &__block_literal_global_9);
  }
  return *(double *)&MTPreferredDisplayModeScale___cachedScale;
}

void __MTPreferredDisplayModeScale_block_invoke()
{
  id v1 = [MEMORY[0x1E4F39B60] mainDisplay];
  uint64_t v0 = [v1 preferredMode];
  *(double *)&MTPreferredDisplayModeScale___cachedScale = (double)(unint64_t)[v0 preferredScale];
}

id MTProtocolGetProperties(void *a1, char a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  unsigned int outCount = 0;
  if (a2) {
    double v5 = protocol_copyPropertyList2(v3, &outCount, 1, 1);
  }
  else {
    double v5 = 0;
  }
  unsigned int v13 = 0;
  if ((a2 & 2) != 0)
  {
    double v7 = protocol_copyPropertyList2(v3, &v13, 0, 1);
    unsigned int v6 = v13;
  }
  else
  {
    unsigned int v6 = 0;
    double v7 = 0;
  }
  unsigned int v8 = outCount;
  if (v6 + outCount)
  {
    unsigned int v9 = 0;
    do
    {
      if (v9 >= v8)
      {
        id v10 = v7;
      }
      else
      {
        unsigned int v8 = 0;
        id v10 = v5;
      }
      id v11 = [NSString stringWithUTF8String:property_getName(v10[v9 - v8])];
      [v4 addObject:v11];

      ++v9;
      unsigned int v8 = outCount;
    }
    while (v9 < v13 + outCount);
  }
  if (v5) {
    free(v5);
  }
  if (v7) {
    free(v7);
  }

  return v4;
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AE9D6000, v0, v1, "Failed to load material recipe plist at URL (%{public}@): %{public}@");
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE9D6000, v0, v1, "Loaded recipe material settings: %{public}@", v2, v3, v4, v5, v6);
}

void _SharedMaterialSettingsForRecipeWithNameFromBundle_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE9D6000, v0, v1, "Loaded base material recipe plist at URL: %{public}@", v2, v3, v4, v5, v6);
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_1AE9D6000, v0, v1, "Failed to load stytle set plist at URL (%{public}@): %{public}@");
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE9D6000, v0, v1, "Loaded style set settings: %{public}@", v2, v3, v4, v5, v6);
}

void MTSharedVisualStyleSetForStyleNameFromBundle_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE9D6000, v0, v1, "Loaded base style set plist at URL: %{public}@", v2, v3, v4, v5, v6);
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1F40F4A48]();
}

uint64_t CAColorMatrixMakeBrightness()
{
  return MEMORY[0x1F40F4A50]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1F40F4A80]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1F40F4CC0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1F40F4CD8](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D20](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1F40F4D30](retstr, tx, ty, tz);
}

void CFRelease(CFTypeRef cf)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA320](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8B8](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageRelease(CGImageRef image)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x1F40E92D8](property, value);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1F4181AF8](proto, outCount, isRequiredProperty, isInstanceProperty);
}