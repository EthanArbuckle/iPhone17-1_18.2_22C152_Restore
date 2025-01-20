@interface CABackdropLayer(CoreMaterial)
+ (id)mt_orderedFilterTypes;
+ (id)mt_orderedFilterTypesBlurAtEnd;
- (double)mt_colorMatrixDrivenInoperativeOpacity;
- (double)mt_colorMatrixDrivenOpacity;
- (uint64_t)_mt_removeFilterOfTypeIfNecessary:()CoreMaterial;
- (uint64_t)mt_setColorMatrixDrivenInoperativeOpacity:()CoreMaterial removingIfIdentity:;
- (uint64_t)mt_setColorMatrixDrivenOpacity:()CoreMaterial removingIfIdentity:;
- (void)_mt_applyFilterDescription:()CoreMaterial remainingExistingFilters:filterOrder:removingIfIdentity:;
- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithFilterOrder:;
- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithName:andFilterOrder:;
- (void)_mt_removeFilterOfType:()CoreMaterial ifNecessaryWithName:;
- (void)_mt_setColorMatrix:()CoreMaterial withName:filterOrder:removingIfIdentity:;
- (void)_mt_setValue:()CoreMaterial forFilterOfType:valueKey:filterOrder:removingIfIdentity:;
- (void)mt_applyMaterialDescription:()CoreMaterial removingIfIdentity:;
@end

@implementation CABackdropLayer(CoreMaterial)

- (void)_mt_applyFilterDescription:()CoreMaterial remainingExistingFilters:filterOrder:removingIfIdentity:
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v37 = a5;
  v11 = [v9 allKeys];
  v12 = (void *)[v11 mutableCopy];

  v13 = v9;
  v14 = [v9 objectForKey:@"type"];
  v15 = MTFilterKeyPathForFilter(v14);
  v16 = a1;
  v17 = [a1 valueForKeyPath:v15];
  v36 = v10;
  [v10 removeObject:v17];

  [v12 removeObject:@"type"];
  if ([v14 isEqualToString:*MEMORY[0x1E4F3A068]])
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
    id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v20 = MTCAFilterCurvesInputValuesKeys();
    v21 = (void *)[v19 initWithArray:v20];
    int v22 = [v18 intersectsSet:v21];

    uint64_t v23 = a6;
    if (!a6 || v22) {
      objc_msgSend(v16, "_mt_configureFilterOfType:ifNecessaryWithFilterOrder:", v14, v37);
    }
    else {
      objc_msgSend(v16, "_mt_removeFilterOfTypeIfNecessary:", v14);
    }
  }
  else
  {
    v24 = _IdentityPropertyForFilterType(v14);
    [v12 removeObject:v24];
    if (v24)
    {
      v25 = [v9 objectForKey:v24];
      v26 = a1;
      uint64_t v23 = a6;
      objc_msgSend(v26, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", v25, v14, v24, v37, a6);
    }
    else
    {
      v27 = a1;
      uint64_t v23 = a6;
      objc_msgSend(v27, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", 0, v14, 0, v37, a6);
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v28 = v12;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v34 = [v13 objectForKey:v33];
        objc_msgSend(v16, "_mt_setValue:forFilterOfType:valueKey:filterOrder:removingIfIdentity:", v34, v14, v33, v37, v23);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v30);
  }
}

- (void)_mt_setValue:()CoreMaterial forFilterOfType:valueKey:filterOrder:removingIfIdentity:
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  int IsIdentityProperty = _IsIdentityProperty(v12, v13);
  if (v24)
  {
    if ((a7 & IsIdentityProperty) != 1) {
      goto LABEL_8;
    }
  }
  else
  {
    int v16 = [v12 isEqualToString:*MEMORY[0x1E4F39FD0]];
    if ((v16 & a7 & IsIdentityProperty & 1) == 0)
    {
      if (!v16) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  if (_IsValueIdentity(v24, v12, v13))
  {
LABEL_6:
    objc_msgSend(a1, "_mt_removeFilterOfTypeIfNecessary:", v12);
    goto LABEL_18;
  }
LABEL_8:
  if (IsIdentityProperty) {
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithFilterOrder:", v12, v14);
  }
  v17 = MTFilterKeyPathForFilter(v12);
  v18 = [v17 stringByAppendingFormat:@".%@", v13];
  uint64_t v19 = [a1 valueForKeyPath:v17];
  if (v19)
  {
    v20 = (void *)v19;
    id v21 = [a1 valueForKeyPath:v18];
    id v22 = v24;
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
      char v23 = [v21 isEqual:v22];
    }
    else {
      char v23 = v21 == v22;
    }

    if ((v23 & 1) == 0) {
      [a1 setValue:v22 forKeyPath:v18];
    }
  }

LABEL_18:
}

+ (id)mt_orderedFilterTypes
{
  if (mt_orderedFilterTypes_onceToken != -1) {
    dispatch_once(&mt_orderedFilterTypes_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)mt_orderedFilterTypes___sortedFilterTypes;
  return v0;
}

- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithFilterOrder:
{
  id v9 = a3;
  id v6 = a4;
  v7 = MTFilterKeyPathForFilter(v9);
  v8 = [a1 valueForKeyPath:v7];

  if (!v8) {
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithName:andFilterOrder:", v9, 0, v6);
  }
}

- (uint64_t)mt_setColorMatrixDrivenOpacity:()CoreMaterial removingIfIdentity:
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  v7 = objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "mt_colorMatrixForOpacity:", a2);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", *MEMORY[0x1E4F3A038], @"opacityColorMatrix");
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  return objc_msgSend(a1, "_mt_setColorMatrix:withName:filterOrder:removingIfIdentity:", v9, @"opacityColorMatrix", 0, a4);
}

- (void)_mt_setColorMatrix:()CoreMaterial withName:filterOrder:removingIfIdentity:
{
  id v10 = a4;
  id v11 = a5;
  long long v12 = a3[3];
  v19[2] = a3[2];
  v19[3] = v12;
  v19[4] = a3[4];
  long long v13 = a3[1];
  v19[0] = *a3;
  v19[1] = v13;
  long long v14 = [MEMORY[0x1E4F29238] valueWithBytes:v19 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  v15 = v14;
  uint64_t v16 = *MEMORY[0x1E4F3A038];
  if (a6 && _IsValueIdentity(v14, (void *)*MEMORY[0x1E4F3A038], @"inputColorMatrix"))
  {
    objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", v16, v10);
  }
  else
  {
    objc_msgSend(a1, "_mt_configureFilterOfType:ifNecessaryWithName:andFilterOrder:", v16, v10, v11);
    v17 = MTFilterKeyPathForFilter(v10);
    v18 = [v17 stringByAppendingFormat:@".%@", @"inputColorMatrix"];
    [a1 setValue:v15 forKeyPath:v18];
  }
}

- (void)mt_applyMaterialDescription:()CoreMaterial removingIfIdentity:
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = MTLogMaterials;
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
  {
    v34 = @"not ";
    *(_DWORD *)buf = 138543874;
    v59 = a1;
    if (a4) {
      v34 = &stru_1F069FDC0;
    }
    __int16 v60 = 2112;
    v61 = v34;
    __int16 v62 = 2114;
    id v63 = v6;
    _os_log_debug_impl(&dword_1AE9D6000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: applying backdrop settings (%@removing if identity): %{public}@", buf, 0x20u);
  }
  v8 = [a1 filters];
  id v9 = (void *)[v8 mutableCopy];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    v35 = @"type";
    uint64_t v36 = *(void *)v52;
    unsigned int v39 = a4;
    id v37 = v10;
    long long v38 = v9;
    do
    {
      uint64_t v14 = 0;
      uint64_t v40 = v12;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v51 + 1) + 8 * v14);
        if (objc_msgSend(v15, "isEqualToString:", @"filters", v35))
        {
          uint64_t v16 = [v10 objectForKey:@"filters"];
          v17 = [v16 valueForKey:v35];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v18 = v16;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v56 count:16];
          obuint64_t j = v18;
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v48 != v21) {
                  objc_enumerationMutation(obj);
                }
                objc_msgSend(a1, "_mt_applyFilterDescription:remainingExistingFilters:filterOrder:removingIfIdentity:", *(void *)(*((void *)&v47 + 1) + 8 * i), v9, v17, a4);
              }
              id v18 = obj;
              uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v20);
          }
          uint64_t v41 = v14;

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v23 = v9;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v44;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v44 != v26) {
                  objc_enumerationMutation(v23);
                }
                id v28 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                uint64_t v29 = [v28 name];
                if (([v29 isEqualToString:@"opacityColorMatrix"] & 1) == 0)
                {
                  uint64_t v30 = [v28 name];
                  char v31 = [v30 isEqualToString:@"inoperativeColorMatrix"];

                  if (v31) {
                    continue;
                  }
                  uint64_t v29 = [v28 type];
                  v32 = [v28 name];
                  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", v29, v32);
                }
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v55 count:16];
            }
            while (v25);
          }

          a4 = v39;
          id v10 = v37;
          id v9 = v38;
          uint64_t v13 = v36;
          uint64_t v12 = v40;
          uint64_t v14 = v41;
          uint64_t v33 = obj;
        }
        else
        {
          uint64_t v33 = [v10 objectForKey:v15];
          [a1 setValue:v33 forKey:v15];
        }

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v12);
  }
}

- (void)_mt_configureFilterOfType:()CoreMaterial ifNecessaryWithName:andFilterOrder:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v8;
  }
  uint64_t v12 = MTFilterKeyPathForFilter(v11);
  uint64_t v13 = [a1 valueForKeyPath:v12];
  if (!v13)
  {
    uint64_t v14 = [a1 filters];
    v15 = (void *)[v14 mutableCopy];
    uint64_t v16 = v15;
    if (v15) {
      id v17 = v15;
    }
    else {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v18 = v17;

    uint64_t v19 = [MEMORY[0x1E4F39BC0] filterWithType:v8];
    uint64_t v13 = v19;
    if (v9) {
      [v19 setName:v9];
    }
    [v18 addObject:v13];
    unint64_t v20 = [v18 count];
    if (v10 && v20 >= 2)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __94__CABackdropLayer_CoreMaterial___mt_configureFilterOfType_ifNecessaryWithName_andFilterOrder___block_invoke;
      v21[3] = &unk_1E5F1B4F0;
      id v22 = v10;
      [v18 sortUsingComparator:v21];
    }
    [a1 setFilters:v18];
  }
}

- (void)_mt_removeFilterOfType:()CoreMaterial ifNecessaryWithName:
{
  id v12 = a3;
  id v6 = a4;
  v7 = [a1 filters];
  id v8 = (void *)[v7 mutableCopy];

  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = v12;
  }
  id v10 = MTFilterKeyPathForFilter(v9);
  uint64_t v11 = [a1 valueForKeyPath:v10];
  [v8 removeObject:v11];

  [a1 setFilters:v8];
}

+ (id)mt_orderedFilterTypesBlurAtEnd
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CABackdropLayer_CoreMaterial__mt_orderedFilterTypesBlurAtEnd__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mt_orderedFilterTypesBlurAtEnd_onceToken != -1) {
    dispatch_once(&mt_orderedFilterTypesBlurAtEnd_onceToken, block);
  }
  v1 = (void *)mt_orderedFilterTypesBlurAtEnd___sortedFilterTypesBlurAtEnd;
  return v1;
}

- (double)mt_colorMatrixDrivenOpacity
{
  v2 = objc_msgSend((id)objc_opt_class(), "mt_keyPathForColorMatrixDrivenOpacity");
  v3 = [a1 valueForKeyPath:v2];

  if (v3)
  {
    [v3 CAColorMatrixValue];
    double v4 = v6;
  }
  else
  {
    double v4 = 1.0;
  }

  return v4;
}

- (double)mt_colorMatrixDrivenInoperativeOpacity
{
  v2 = objc_msgSend((id)objc_opt_class(), "mt_keyPathForColorMatrixDrivenInoperativeOpacity");
  v3 = [a1 valueForKeyPath:v2];

  if (v3)
  {
    [v3 CAColorMatrixValue];
    double v4 = v6;
  }
  else
  {
    double v4 = 1.0;
  }

  return v4;
}

- (uint64_t)mt_setColorMatrixDrivenInoperativeOpacity:()CoreMaterial removingIfIdentity:
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  v7 = objc_opt_class();
  if (v7)
  {
    objc_msgSend(v7, "mt_colorMatrixForOpacity:", a2);
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
  }
  objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", *MEMORY[0x1E4F3A038], @"inoperativeColorMatrix");
  v9[2] = v12;
  v9[3] = v13;
  v9[4] = v14;
  v9[0] = v10;
  v9[1] = v11;
  return objc_msgSend(a1, "_mt_setColorMatrix:withName:filterOrder:removingIfIdentity:", v9, @"inoperativeColorMatrix", 0, a4);
}

- (uint64_t)_mt_removeFilterOfTypeIfNecessary:()CoreMaterial
{
  return objc_msgSend(a1, "_mt_removeFilterOfType:ifNecessaryWithName:", a3, 0);
}

@end