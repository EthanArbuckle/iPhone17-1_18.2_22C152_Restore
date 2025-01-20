@interface MTCoreMaterialVisualStyling
- (CAFilter)_composedFilter;
- (CGColor)tintColor;
- (MTCoreMaterialVisualStyling)initWithVisualStyleSet:(id)a3 styleName:(id)a4 description:(id)a5 andDescendantDescriptions:(id)a6;
- (NSDictionary)tintColorDescription;
- (NSString)description;
- (NSString)tintColorName;
- (NSString)visualStyleName;
- (NSString)visualStyleSetName;
- (double)tintAlpha;
- (id)_preProcessFilteringDescription:(id)a3;
- (id)compositingFilter;
- (id)filterProperties;
- (id)filterType;
- (id)userInfo;
- (int64_t)tintColorUIStyle;
- (void)_applyToLayer:(id)a3 withColorBlock:(id)a4;
- (void)_getCompositingFilter:(id *)a3 tintColor:(CGColor *)a4;
- (void)_getFilterType:(id *)a3 vibrantColor:(CGColor *)a4 tintColor:(CGColor *)a5 inputReversed:(BOOL *)a6;
- (void)_processBlendingDescription:(id)a3;
- (void)_processFilteringDescription:(id)a3;
- (void)_processTintingDescription:(id)a3;
- (void)_processUserInfoDescription:(id)a3;
- (void)dealloc;
@end

@implementation MTCoreMaterialVisualStyling

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (NSString)tintColorName
{
  return self->_tintColorName;
}

- (void)_applyToLayer:(id)a3 withColorBlock:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_tintColor) {
    (*((void (**)(id))v6 + 2))(v6);
  }
  double tintAlpha = self->_tintAlpha;
  *(float *)&double tintAlpha = tintAlpha;
  [v16 setOpacity:tintAlpha];
  if (self->_compositingFilter || self->_filterType)
  {
    v9 = [v16 superlayer];
    [v9 setAllowsGroupBlending:0];

    if (self->_compositingFilter)
    {
      v10 = [(MTCoreMaterialVisualStyling *)self _composedFilter];
      [v16 setCompositingFilter:v10];
    }
    else
    {
      uint64_t v11 = [v16 filters];
      v12 = (void *)v11;
      v13 = (void *)MEMORY[0x1E4F1CBF0];
      if (v11) {
        v13 = (void *)v11;
      }
      id v14 = v13;

      v10 = [(MTCoreMaterialVisualStyling *)self _composedFilter];
      v15 = [v14 arrayByAddingObject:v10];

      [v16 setFilters:v15];
    }
  }
}

- (MTCoreMaterialVisualStyling)initWithVisualStyleSet:(id)a3 styleName:(id)a4 description:(id)a5 andDescendantDescriptions:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v71.receiver = self;
  v71.super_class = (Class)MTCoreMaterialVisualStyling;
  id v14 = [(MTCoreMaterialVisualStyling *)&v71 init];
  v15 = v14;
  if (v14)
  {
    id v51 = v11;
    id v53 = v10;
    objc_storeWeak((id *)&v14->_visualStyleSet, v10);
    objc_storeStrong((id *)&v15->_visualStyleName, a4);
    id v16 = [v12 objectForKey:@"tinting"];
    [(MTCoreMaterialVisualStyling *)v15 _processTintingDescription:v16];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v17 = [v13 valueForKey:@"tinting"];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v68;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v68 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v67 + 1) + 8 * v21);
          v23 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v51, v53);

          if (v22 != v23) {
            [(MTCoreMaterialVisualStyling *)v15 _processTintingDescription:v22];
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v19);
    }

    v24 = [v12 objectForKey:@"blending"];
    [(MTCoreMaterialVisualStyling *)v15 _processBlendingDescription:v24];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v25 = [v13 valueForKey:@"blending"];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v64;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v63 + 1) + 8 * v29);
          v31 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v51, v53);

          if (v30 != v31) {
            [(MTCoreMaterialVisualStyling *)v15 _processBlendingDescription:v30];
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v27);
    }

    if (!v15->_compositingFilter)
    {
      v32 = [v12 objectForKey:@"filtering"];
      v33 = [(MTCoreMaterialVisualStyling *)v15 _preProcessFilteringDescription:v32];
      [(MTCoreMaterialVisualStyling *)v15 _processFilteringDescription:v33];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v34 = [v13 valueForKey:@"filtering"];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v73 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v60;
        do
        {
          uint64_t v38 = 0;
          do
          {
            if (*(void *)v60 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = *(void **)(*((void *)&v59 + 1) + 8 * v38);
            v40 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v51, v53);

            if (v39 != v40)
            {
              v41 = [(MTCoreMaterialVisualStyling *)v15 _preProcessFilteringDescription:v39];
              [(MTCoreMaterialVisualStyling *)v15 _processFilteringDescription:v41];
            }
            ++v38;
          }
          while (v36 != v38);
          uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v73 count:16];
        }
        while (v36);
      }
    }
    v42 = objc_msgSend(v12, "objectForKey:", @"userInfo", v51, v53);
    [(MTCoreMaterialVisualStyling *)v15 _processUserInfoDescription:v42];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v43 = [v13 valueForKey:@"userInfo"];
    uint64_t v44 = [v43 countByEnumeratingWithState:&v55 objects:v72 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v56;
      do
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v56 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = *(void **)(*((void *)&v55 + 1) + 8 * v47);
          v49 = [MEMORY[0x1E4F1CA98] null];

          if (v48 != v49) {
            [(MTCoreMaterialVisualStyling *)v15 _processUserInfoDescription:v48];
          }
          ++v47;
        }
        while (v45 != v47);
        uint64_t v45 = [v43 countByEnumeratingWithState:&v55 objects:v72 count:16];
      }
      while (v45);
    }

    id v11 = v52;
    id v10 = v54;
  }

  return v15;
}

- (void)_processFilteringDescription:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"filterType"];
  filterType = self->_filterType;
  self->_filterType = v5;

  v7 = [v4 objectForKey:@"filterProperties"];

  filterProperties = self->_filterProperties;
  self->_filterProperties = v7;

  if (self->_filterType && self->_filterProperties)
  {
    compositingFilter = self->_compositingFilter;
    self->_compositingFilter = 0;
  }
}

- (id)_preProcessFilteringDescription:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v3;
  if (!v4)
  {
    long long v28 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
    long long v51 = v29;
    long long v52 = v28;
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
    long long v53 = v27;
    long long v25 = *MEMORY[0x1E4F39AD8];
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
    long long v49 = *MEMORY[0x1E4F39AD8];
    long long v50 = v26;
    id v30 = v3;
    id v6 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v46;
      uint64_t v12 = *MEMORY[0x1E4F3A048];
      uint64_t v32 = *MEMORY[0x1E4F3A000];
      uint64_t v31 = *MEMORY[0x1E4F3A350];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "objectForKey:", @"filterType", v25, v26, v27, v28, v29);
          if ([v15 isEqualToString:v12])
          {
            id v16 = [v14 objectForKey:@"filterProperties"];
            v17 = [v16 objectForKey:@"inputAmount"];
            [v17 floatValue];

            CAColorMatrixMakeSaturation();
            long long v42 = v51;
            long long v43 = v52;
            long long v44 = v53;
            long long v40 = v49;
            long long v41 = v50;
            CAColorMatrixConcat();
          }
          else if ([v15 isEqualToString:v32])
          {
            uint64_t v18 = [v14 objectForKey:@"filterProperties"];
            uint64_t v19 = [v18 objectForKey:@"inputAmount"];
            [v19 floatValue];

            CAColorMatrixMakeBrightness();
            long long v37 = v51;
            long long v38 = v52;
            long long v39 = v53;
            long long v35 = v49;
            long long v36 = v50;
            CAColorMatrixConcat();
            long long v51 = v42;
            long long v52 = v43;
            long long v53 = v44;
            long long v49 = v40;
            long long v50 = v41;
          }
          else
          {
            if (![v15 isEqualToString:v31])
            {
              long long v51 = v29;
              long long v52 = v28;
              long long v53 = v27;
              long long v49 = v25;
              long long v50 = v26;

              goto LABEL_25;
            }
            uint64_t v20 = [v14 objectForKey:@"filterProperties"];
            uint64_t v21 = [v20 objectForKey:@"inputColorMatrix"];

            if (MTCAColorMatrixIsDictionaryRepresentation(v21))
            {
              MTCAColorMatrixMakeWithDictionaryRepresentation(v21, (uint64_t)v34);
              long long v37 = v51;
              long long v38 = v52;
              long long v39 = v53;
              long long v35 = v49;
              long long v36 = v50;
              CAColorMatrixConcat();
              long long v51 = v42;
              long long v52 = v43;
              long long v53 = v44;
              long long v49 = v40;
              long long v50 = v41;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_25:

    long long v42 = v51;
    long long v43 = v52;
    long long v44 = v53;
    long long v40 = v49;
    long long v41 = v50;
    if (MTCAColorMatrixIsIdentity(&v40))
    {
      v5 = 0;
    }
    else
    {
      v57[0] = *MEMORY[0x1E4F3A350];
      v56[0] = @"filterType";
      v56[1] = @"filterProperties";
      v54 = @"inputColorMatrix";
      long long v42 = v51;
      long long v43 = v52;
      long long v44 = v53;
      long long v40 = v49;
      long long v41 = v50;
      v22 = MTCAColorMatrixCreateDictionaryRepresentation(&v40, *(double *)&v50);
      long long v55 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v57[1] = v23;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    }
    id v3 = v30;
  }
  return v5;
}

- (void)_processUserInfoDescription:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    userInfo = self->_userInfo;
    if (userInfo) {
      id v6 = (NSDictionary *)[(NSDictionary *)userInfo mutableCopy];
    }
    else {
      id v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v7 = v6;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v16);
          [(NSDictionary *)v7 setObject:v14 forKey:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    v15 = self->_userInfo;
    self->_userInfo = v7;
  }
}

- (void)_processBlendingDescription:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"compositingFilter"];
  compositingFilter = self->_compositingFilter;
  self->_compositingFilter = v5;

  objc_storeStrong((id *)&self->_filterType, self->_compositingFilter);
  v7 = [v4 objectForKey:@"filterProperties"];

  filterProperties = self->_filterProperties;
  self->_filterProperties = v7;
}

- (void)_processTintingDescription:(id)a3
{
  id v15 = a3;
  id v4 = [v15 objectForKey:@"tintColor"];
  tintColorDescription = self->_tintColorDescription;
  self->_tintColorDescription = v4;

  tintColor = self->_tintColor;
  if (tintColor) {
    CGColorRelease(tintColor);
  }
  if (self->_tintColorDescription)
  {
    +[MTColor colorWithDescription:](MTColor, "colorWithDescription:");
    id v7 = objc_claimAutoreleasedReturnValue();
    self->_tintColor = CGColorRetain((CGColorRef)[v7 CGColor]);
  }
  else
  {
    self->_tintColor = 0;
  }
  id v8 = [v15 objectForKey:@"tintAlpha"];
  if (v8)
  {
    uint64_t v9 = [v15 objectForKey:@"tintAlpha"];
    [v9 floatValue];
    self->_double tintAlpha = v10;
  }
  else
  {
    self->_double tintAlpha = 1.0;
  }

  uint64_t v11 = [v15 objectForKey:@"tintColorName"];
  tintColorName = self->_tintColorName;
  self->_tintColorName = v11;

  uint64_t v13 = [v15 objectForKey:@"tintColorUIStyle"];
  if (v13)
  {
    id v14 = [v15 objectForKey:@"tintColorUIStyle"];
    self->_tintColorUIStyle = [v14 integerValue];
  }
  else
  {
    self->_tintColorUIStyle = 0;
  }
}

- (NSDictionary)tintColorDescription
{
  return self->_tintColorDescription;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (double)tintAlpha
{
  return self->_tintAlpha;
}

- (id)filterType
{
  return self->_filterType;
}

- (id)filterProperties
{
  return self->_filterProperties;
}

- (id)compositingFilter
{
  return self->_compositingFilter;
}

- (void)dealloc
{
  tintColor = self->_tintColor;
  if (tintColor) {
    CGColorRelease(tintColor);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTCoreMaterialVisualStyling;
  [(MTCoreMaterialVisualStyling *)&v4 dealloc];
}

- (CAFilter)_composedFilter
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  composedFilter = self->_composedFilter;
  if (!composedFilter)
  {
    if (self->_filterType)
    {
      objc_msgSend(MEMORY[0x1E4F39BC0], "filterWithType:");
      objc_super v4 = (CAFilter *)objc_claimAutoreleasedReturnValue();
      v5 = self->_composedFilter;
      self->_composedFilter = v4;

      compositingFilter = self->_compositingFilter;
      id v7 = MTComposedFilterCreateDictionaryRepresentation(self->_filterType, self->_filterProperties, compositingFilter != 0);
      id v8 = v7;
      if (compositingFilter)
      {
        uint64_t v9 = [v7 objectForKey:@"compositingFilter"];
      }
      else
      {
        float v10 = [v7 valueForKey:@"filters"];
        uint64_t v9 = [v10 lastObject];
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEqualToString:", @"type", (void)v19) & 1) == 0)
            {
              long long v17 = [v11 objectForKey:v16];
              [(CAFilter *)self->_composedFilter setValue:v17 forKey:v16];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }

      composedFilter = self->_composedFilter;
    }
    else
    {
      composedFilter = 0;
    }
  }
  return composedFilter;
}

- (NSString)description
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v9 = @"MTDictionaryRepresentationOptionsIncludeOptimizationsKey";
  v10[0] = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = MTVisualStylingSettingsCreateDictionaryRepresentation(self, v5);
  id v7 = [v3 stringWithFormat:@"<%@: %p; dictionary representation: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (int64_t)tintColorUIStyle
{
  return self->_tintColorUIStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_filterProperties, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_tintColorName, 0);
  objc_storeStrong((id *)&self->_tintColorDescription, 0);
  objc_storeStrong((id *)&self->_composedFilter, 0);
  objc_storeStrong((id *)&self->_visualStyleName, 0);
  objc_destroyWeak((id *)&self->_visualStyleSet);
}

- (NSString)visualStyleSetName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleSet);
  id v3 = [WeakRetained visualStyleSetName];

  return (NSString *)v3;
}

- (NSString)visualStyleName
{
  return self->_visualStyleName;
}

- (void)_getCompositingFilter:(id *)a3 tintColor:(CGColor *)a4
{
  compositingFilter = self->_compositingFilter;
  if (compositingFilter)
  {
    if (a3) {
      *a3 = compositingFilter;
    }
    if (a4) {
      *a4 = self->_tintColor;
    }
  }
}

- (void)_getFilterType:(id *)a3 vibrantColor:(CGColor *)a4 tintColor:(CGColor *)a5 inputReversed:(BOOL *)a6
{
  filterType = self->_filterType;
  if (filterType)
  {
    if (a3) {
      *a3 = filterType;
    }
    if (a4)
    {
      id v11 = [(MTCoreMaterialVisualStyling *)self _composedFilter];
      *a4 = (CGColor *)[v11 valueForKey:@"inputColor0"];
    }
    if (a5)
    {
      uint64_t v12 = [(MTCoreMaterialVisualStyling *)self _composedFilter];
      *a5 = (CGColor *)[v12 valueForKey:@"inputColor1"];
    }
    if (a6)
    {
      id v14 = [(MTCoreMaterialVisualStyling *)self _composedFilter];
      uint64_t v13 = [v14 valueForKey:@"inputReversed"];
      *a6 = [v13 BOOLValue];
    }
  }
}

@end