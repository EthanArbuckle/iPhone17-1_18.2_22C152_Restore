@interface MTVisualStyleSet
+ (id)recipeNameForRecipeFromStyle:(id)a3 fromStyleSetWithName:(id)a4;
- (MTVisualStyleSet)initWithName:(id)a3 visualStyleSetDescription:(id)a4 andDescendantDescriptions:(id)a5;
- (NSString)description;
- (NSString)visualStyleSetName;
- (id)_materialDescriptionForStyle:(id)a3 withProvidedStyles:(id)a4;
- (id)_newMaterialSettingsForStyle:(id)a3 withProvidedStyles:(id)a4;
- (id)visualStylingForStyle:(id)a3;
- (int64_t)visualStyleSetVersion;
@end

@implementation MTVisualStyleSet

- (MTVisualStyleSet)initWithName:(id)a3 visualStyleSetDescription:(id)a4 andDescendantDescriptions:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v78.receiver = self;
  v78.super_class = (Class)MTVisualStyleSet;
  v11 = [(MTVisualStyleSet *)&v78 init];
  if (v11)
  {
    id v54 = v8;
    uint64_t v12 = [v8 copy];
    visualStyleSetName = v11->_visualStyleSetName;
    v11->_visualStyleSetName = (NSString *)v12;

    v14 = [v9 objectForKey:@"visualStyleSetVersion"];
    v11->_visualStyleSetVersion = [v14 integerValue];

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    visualStylesToStyleNames = v11->_visualStylesToStyleNames;
    v11->_visualStylesToStyleNames = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    styleNamesToVisualStylings = v11->_styleNamesToVisualStylings;
    v11->_styleNamesToVisualStylings = v17;

    id v60 = v9;
    v19 = [v9 objectForKey:@"styles"];
    id v20 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v55 = v19;
    v21 = [v19 allKeys];
    v22 = (void *)[v20 initWithArray:v21];

    id v59 = v10;
    [v10 valueForKey:@"styles"];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v75 != v25) {
            objc_enumerationMutation(obj);
          }
          v27 = [*(id *)(*((void *)&v74 + 1) + 8 * i) allKeys];
          [v22 addObjectsFromArray:v27];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
      }
      while (v24);
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v57 = v22;
    uint64_t v28 = [v57 countByEnumeratingWithState:&v70 objects:v82 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v71 != v30) {
            objc_enumerationMutation(v57);
          }
          uint64_t v32 = *(void *)(*((void *)&v70 + 1) + 8 * j);
          v33 = [v55 objectForKey:v32];
          v34 = [obj valueForKey:v32];
          v35 = v34;
          if (v33 || [v34 count])
          {
            v36 = [[MTCoreMaterialVisualStyling alloc] initWithVisualStyleSet:v11 styleName:v32 description:v33 andDescendantDescriptions:v35];
            if (v36)
            {
              v37 = v36;
              [(NSMutableDictionary *)v11->_styleNamesToVisualStylings setObject:v36 forKey:v32];
            }
          }
        }
        uint64_t v29 = [v57 countByEnumeratingWithState:&v70 objects:v82 count:16];
      }
      while (v29);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v38 = MTAllOrdinalVisualStyles();
    v39 = MTAllPlatformColorVisualStyles();
    v40 = [v38 arrayByAddingObjectsFromArray:v39];

    id v56 = v40;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v81 count:16];
    id v10 = v59;
    id v9 = v60;
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v58 = *(void *)v67;
      do
      {
        for (uint64_t k = 0; k != v42; ++k)
        {
          if (*(void *)v67 != v58) {
            objc_enumerationMutation(v56);
          }
          uint64_t v44 = *(void *)(*((void *)&v66 + 1) + 8 * k);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v79 = v9;
          v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
          v46 = [v45 arrayByAddingObjectsFromArray:v10];

          uint64_t v47 = [v46 countByEnumeratingWithState:&v62 objects:v80 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v63;
            do
            {
              for (uint64_t m = 0; m != v48; ++m)
              {
                if (*(void *)v63 != v49) {
                  objc_enumerationMutation(v46);
                }
                v51 = [*(id *)(*((void *)&v62 + 1) + 8 * m) objectForKey:v44];
                if (v51)
                {
                  v52 = [(NSMutableDictionary *)v11->_styleNamesToVisualStylings objectForKey:v51];

                  if (v52) {
                    [(NSMutableDictionary *)v11->_visualStylesToStyleNames setObject:v51 forKey:v44];
                  }
                }
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v62 objects:v80 count:16];
            }
            while (v48);
          }

          id v10 = v59;
          id v9 = v60;
        }
        uint64_t v42 = [v56 countByEnumeratingWithState:&v66 objects:v81 count:16];
      }
      while (v42);
    }

    id v8 = v54;
  }

  return v11;
}

- (id)visualStylingForStyle:(id)a3
{
  visualStylesToStyleNames = self->_visualStylesToStyleNames;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)visualStylesToStyleNames objectForKey:v5];
  v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  id v10 = [(NSMutableDictionary *)self->_styleNamesToVisualStylings objectForKey:v9];

  return v10;
}

+ (id)recipeNameForRecipeFromStyle:(id)a3 fromStyleSetWithName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"MTVisualStyleSet.m", 32, @"Invalid parameter not satisfying: %@", @"visualStyle" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"MTVisualStyleSet.m", 33, @"Invalid parameter not satisfying: %@", @"styleSetName" object file lineNumber description];

LABEL_3:
  id v10 = [NSString stringWithFormat:@"%@.%@.generatedRecipe", v9, v7];

  return v10;
}

- (id)_materialDescriptionForStyle:(id)a3 withProvidedStyles:(id)a4
{
  id v6 = a4;
  id v7 = [(MTVisualStyleSet *)self visualStylingForStyle:a3];
  id v8 = v7;
  if (v7
    && (([v7 tintColorDescription], id v9 = objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9)
     || _CanGenerateMaterialDescriptionForFilteringFromVisualStyling(v8)))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v11 forKey:@"baseMaterial"];
    uint64_t v12 = [v8 tintColorDescription];

    if (v12)
    {
      v13 = [v8 tintColorDescription];
      [v11 setObject:v13 forKey:@"tinting"];
    }
    if (_CanGenerateMaterialDescriptionForFilteringFromVisualStyling(v8))
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v11 setObject:v14 forKey:@"materialFiltering"];
      v15 = [v8 filterType];
      int v16 = [v15 isEqualToString:*MEMORY[0x1E4F3A350]];

      if (v16)
      {
        v17 = [v8 filterProperties];
        v18 = [v17 objectForKey:@"inputColorMatrix"];
        [v14 setObject:v18 forKey:@"colorMatrix"];
      }
    }
    [v10 setObject:&unk_1F06A54C8 forKey:@"materialSettingsVersion"];
    if (v6) {
      [v10 setObject:v6 forKey:@"styles"];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_newMaterialSettingsForStyle:(id)a3 withProvidedStyles:(id)a4
{
  id v6 = a3;
  id v7 = [(MTVisualStyleSet *)self _materialDescriptionForStyle:v6 withProvidedStyles:a4];
  if (v7)
  {
    id v8 = [MTRecipeMaterialSettings alloc];
    id v9 = objc_opt_class();
    id v10 = [(MTVisualStyleSet *)self visualStyleSetName];
    id v11 = [v9 recipeNameForRecipeFromStyle:v6 fromStyleSetWithName:v10];
    uint64_t v12 = [(MTRecipeMaterialSettings *)v8 initWithRecipeName:v11 andDescription:v7 descendantDescriptions:0 bundle:0];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; styleName: %@; visualStyleSetVersion: %ld",
    objc_opt_class(),
    self,
    self->_visualStyleSetName,
  v3 = self->_visualStyleSetVersion);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_styleNamesToVisualStylings;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->_styleNamesToVisualStylings objectForKey:v9];
        id v11 = (void *)v10;
        if (v10) {
          [v3 appendFormat:@"; %@: %@", v9, v10];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (int64_t)visualStyleSetVersion
{
  return self->_visualStyleSetVersion;
}

- (NSString)visualStyleSetName
{
  return self->_visualStyleSetName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleSetName, 0);
  objc_storeStrong((id *)&self->_styleNamesToVisualStylings, 0);
  objc_storeStrong((id *)&self->_visualStylesToStyleNames, 0);
}

@end