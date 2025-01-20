@interface MTRecipeMaterialSettings
+ (id)styleSetNameForStyleSetFromRecipeWithName:(id)a3;
- (MTRecipeMaterialSettings)initWithRecipeName:(id)a3 andDescription:(id)a4 descendantDescriptions:(id)a5 bundle:(id)a6;
- (MTTinting)baseMaterialSettings;
- (NSDictionary)styles;
- (NSString)description;
- (NSString)recipeName;
- (id)_newVisualStyleSet;
- (id)_platformColorsStyleSetName;
- (id)_visualStyleSetDescription;
- (id)styleNameForCategory:(id)a3;
- (int64_t)materialSettingsVersion;
- (void)setStyles:(id)a3;
@end

@implementation MTRecipeMaterialSettings

- (NSString)recipeName
{
  return self->_recipeName;
}

- (MTTinting)baseMaterialSettings
{
  return self->_baseMaterialSettings;
}

- (id)styleNameForCategory:(id)a3
{
  if (@"platformColor" == a3) {
    [(MTRecipeMaterialSettings *)self _platformColorsStyleSetName];
  }
  else {
  v3 = -[NSDictionary objectForKey:](self->_styles, "objectForKey:");
  }
  return v3;
}

- (MTRecipeMaterialSettings)initWithRecipeName:(id)a3 andDescription:(id)a4 descendantDescriptions:(id)a5 bundle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MTRecipeMaterialSettings;
  v14 = [(MTRecipeMaterialSettings *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    recipeName = v14->_recipeName;
    v14->_recipeName = (NSString *)v15;

    v17 = [v11 objectForKey:@"materialSettingsVersion"];
    v14->_materialSettingsVersion = [v17 integerValue];

    uint64_t v18 = [v11 objectForKey:@"styles"];
    styles = v14->_styles;
    v14->_styles = (NSDictionary *)v18;

    v20 = [MTTintingFilteringMaterialSettings alloc];
    v21 = [v11 objectForKey:@"baseMaterial"];
    v22 = [v12 valueForKey:@"baseMaterial"];
    uint64_t v23 = [(MTTintingFilteringMaterialSettings *)v20 initWithMaterialDescription:v21 andDescendantDescriptions:v22 bundle:v13];
    baseMaterialSettings = v14->_baseMaterialSettings;
    v14->_baseMaterialSettings = (MTTinting *)v23;
  }
  return v14;
}

+ (id)styleSetNameForStyleSetFromRecipeWithName:(id)a3
{
  return (id)[a3 stringByAppendingString:@".generatedStyleSet"];
}

- (id)_visualStyleSetDescription
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v2 = [(MTRecipeMaterialSettings *)self baseMaterialSettings];
  if (!_CanGenerateVisualStylingDescriptionFromConfigurationSettings(v2))
  {
    id v14 = 0;
LABEL_24:
    id v22 = 0;
    goto LABEL_25;
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy_;
  v54 = __Block_byref_object_dispose_;
  id v55 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__MTRecipeMaterialSettings__visualStyleSetDescription__block_invoke;
  v49[3] = &unk_1E5F1B4A8;
  v49[4] = &v50;
  v3 = (void (**)(void))MEMORY[0x1B3E741F0](v49);
  v4 = [v2 tintColorDescription];

  if (v4)
  {
    v5 = v3[2](v3);
    v6 = [v2 tintColorDescription];
    [v5 setObject:v6 forKey:@"tinting"];
  }
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
  long long v47 = v29;
  long long v48 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
  long long v44 = *MEMORY[0x1E4F39AD8];
  long long v45 = v26;
  v7 = NSNumber;
  objc_msgSend(v2, "saturation", v44, v26, v48, v29, v46);
  v8 = objc_msgSend(v7, "numberWithDouble:");
  char v9 = objc_msgSend(v8, "mt_isIdentityValueForMaterialSettingsProperty:", @"saturation");

  if ((v9 & 1) == 0)
  {
    [v2 saturation];
    CAColorMatrixMakeSaturation();
    long long v36 = v31;
    long long v37 = v30;
    long long v38 = v28;
    long long v34 = v25;
    long long v35 = v27;
    CAColorMatrixConcat();
    long long v46 = v41;
    long long v47 = v42;
    long long v48 = v43;
    long long v44 = v39;
    long long v45 = v40;
  }
  id v10 = NSNumber;
  [v2 brightness];
  id v11 = objc_msgSend(v10, "numberWithDouble:");
  char v12 = objc_msgSend(v11, "mt_isIdentityValueForMaterialSettingsProperty:", @"brightness");

  if ((v12 & 1) == 0)
  {
    [v2 brightness];
    CAColorMatrixMakeBrightness();
    long long v36 = v46;
    long long v37 = v47;
    long long v38 = v48;
    long long v34 = v44;
    long long v35 = v45;
    CAColorMatrixConcat();
    long long v46 = v41;
    long long v47 = v42;
    long long v48 = v43;
    long long v44 = v39;
    long long v45 = v40;
  }
  id v13 = (void *)MEMORY[0x1E4F29238];
  if (v2) {
    [v2 colorMatrix];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  uint64_t v15 = [v13 valueWithBytes:v33 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  char v16 = objc_msgSend(v15, "mt_isIdentityValueForMaterialSettingsProperty:", @"colorMatrix");

  if ((v16 & 1) == 0)
  {
    if (v2) {
      [v2 colorMatrix];
    }
    else {
      memset(&v32[5], 0, 80);
    }
    long long v36 = v46;
    long long v37 = v47;
    long long v38 = v48;
    long long v34 = v44;
    long long v35 = v45;
    CAColorMatrixConcat();
    long long v46 = v41;
    long long v47 = v42;
    long long v48 = v43;
    long long v44 = v39;
    long long v45 = v40;
  }
  long long v41 = v46;
  long long v42 = v47;
  long long v43 = v48;
  long long v39 = v44;
  long long v40 = v45;
  if (!MTCAColorMatrixIsIdentity(&v39))
  {
    v17 = v3[2](v3);
    uint64_t v18 = *MEMORY[0x1E4F3A350];
    v58[1] = @"filterProperties";
    v59[0] = v18;
    v58[0] = @"filterType";
    v56 = @"inputColorMatrix";
    v32[2] = v46;
    v32[3] = v47;
    v32[4] = v48;
    v32[0] = v44;
    v32[1] = v45;
    v19 = [MEMORY[0x1E4F29238] valueWithBytes:v32 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
    v57 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v59[1] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
    [v17 setObject:v21 forKey:@"filtering"];
  }
  if (v51[5])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:v51[5] forKey:@"secondary"];
  }
  else
  {
    id v14 = 0;
  }

  _Block_object_dispose(&v50, 8);
  if (!v14) {
    goto LABEL_24;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v22 setObject:v14 forKey:@"styles"];
  [v22 setObject:&unk_1F06A5498 forKey:@"visualStyleSetVersion"];
LABEL_25:
  id v23 = v22;

  return v23;
}

id __54__MTRecipeMaterialSettings__visualStyleSetDescription__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

- (id)_newVisualStyleSet
{
  id v3 = [(MTRecipeMaterialSettings *)self _visualStyleSetDescription];
  if (v3)
  {
    uint64_t v4 = [MTVisualStyleSet alloc];
    v5 = objc_opt_class();
    v6 = [(MTRecipeMaterialSettings *)self recipeName];
    v7 = [v5 styleSetNameForStyleSetFromRecipeWithName:v6];
    v8 = [(MTVisualStyleSet *)v4 initWithName:v7 visualStyleSetDescription:v3 andDescendantDescriptions:0];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_platformColorsStyleSetName
{
  BOOL v2 = [(NSString *)self->_recipeName hasSuffix:@"Dark"];
  id v3 = &kMTCoreMaterialStyleNamePlatformColorsDark;
  if (!v2) {
    id v3 = &kMTCoreMaterialStyleNamePlatformColorsLight;
  }
  uint64_t v4 = *v3;
  return v4;
}

- (NSString)description
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; recipeName: %@; materialSettingsVersion: %ld; styles: %@",
    objc_opt_class(),
    self,
    self->_recipeName,
    self->_materialSettingsVersion,
  id v3 = self->_styles);
  uint64_t v4 = [(MTRecipeMaterialSettings *)self baseMaterialSettings];
  v5 = (void *)v4;
  if (v4) {
    [v3 appendFormat:@"; baseMaterialSettings: %@", v4];
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (int64_t)materialSettingsVersion
{
  return self->_materialSettingsVersion;
}

- (NSDictionary)styles
{
  return self->_styles;
}

- (void)setStyles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMaterialSettings, 0);
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_recipeName, 0);
}

@end