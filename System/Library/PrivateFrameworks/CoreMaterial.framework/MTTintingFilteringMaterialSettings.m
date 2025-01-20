@interface MTTintingFilteringMaterialSettings
- (BOOL)isAverageColorEnabled;
- (BOOL)isBlurAtEnd;
- (CAColorMatrix)colorMatrix;
- (CGImage)variableBlurInputMask;
- (MTTintingFilteringMaterialSettings)initWithMaterialDescription:(id)a3 andDescendantDescriptions:(id)a4 bundle:(id)a5;
- (NSArray)luminanceValues;
- (NSDictionary)curvesValues;
- (NSDictionary)userInfo;
- (NSString)blurInputQuality;
- (NSString)variableBlurInputMaskName;
- (double)backdropScale;
- (double)blurRadius;
- (double)brightness;
- (double)luminanceAmount;
- (double)saturation;
- (double)zoom;
- (void)_processMaterialFilteringDescription:(id)a3 defaultingToIdentity:(BOOL)a4 bundle:(id)a5;
- (void)_processUserInfoDescription:(id)a3;
- (void)dealloc;
@end

@implementation MTTintingFilteringMaterialSettings

- (NSString)blurInputQuality
{
  return self->_blurInputQuality;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)backdropScale
{
  return self->_backdropScale;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)luminanceAmount
{
  return self->_luminanceAmount;
}

- (CAColorMatrix)colorMatrix
{
  long long v3 = *(_OWORD *)&self[2].m31;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[2].m22;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[2].m35;
  long long v4 = *(_OWORD *)&self[2].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m44;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (double)brightness
{
  return self->_brightness;
}

- (double)zoom
{
  return self->_zoom;
}

- (NSDictionary)curvesValues
{
  return self->_curvesValues;
}

- (CGImage)variableBlurInputMask
{
  return self->_variableBlurInputMask;
}

- (BOOL)isBlurAtEnd
{
  return self->_blurAtEnd;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (BOOL)isAverageColorEnabled
{
  return self->_averageColorEnabled;
}

- (void)_processMaterialFilteringDescription:(id)a3 defaultingToIdentity:(BOOL)a4 bundle:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectForKey:@"luminanceAmount"];
  if (v10)
  {
    v11 = [v8 objectForKey:@"luminanceAmount"];
LABEL_5:
    v12 = v11;
    [v11 floatValue];
    self->_luminanceAmount = v13;

    goto LABEL_6;
  }
  if (v6)
  {
    v11 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"luminanceAmount");
    goto LABEL_5;
  }
LABEL_6:

  v14 = [v8 objectForKey:@"luminanceValues"];
  luminanceValues = v14;
  if (!v14)
  {
    luminanceValues = 0;
    if (!v6) {
      luminanceValues = self->_luminanceValues;
    }
  }
  objc_storeStrong((id *)&self->_luminanceValues, luminanceValues);

  v16 = [v8 objectForKey:@"blurRadius"];
  if (v16)
  {
    v17 = [v8 objectForKey:@"blurRadius"];
  }
  else
  {
    if (!v6) {
      goto LABEL_14;
    }
    v17 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"blurRadius");
  }
  v18 = v17;
  [v17 floatValue];
  self->_blurRadius = v19;

LABEL_14:
  v20 = [v8 objectForKey:@"averageColorEnabled"];
  if (v20)
  {
    v21 = [v8 objectForKey:@"averageColorEnabled"];
  }
  else
  {
    if (!v6) {
      goto LABEL_19;
    }
    v21 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"averageColorEnabled");
  }
  v22 = v21;
  self->_averageColorEnabled = [v21 BOOLValue];

LABEL_19:
  v23 = [v8 objectForKey:@"saturation"];
  if (v23)
  {
    v24 = [v8 objectForKey:@"saturation"];
  }
  else
  {
    if (!v6) {
      goto LABEL_24;
    }
    v24 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"saturation");
  }
  v25 = v24;
  [v24 floatValue];
  self->_saturation = v26;

LABEL_24:
  v27 = [v8 objectForKey:@"brightness"];
  if (v27)
  {
    v28 = [v8 objectForKey:@"brightness"];
  }
  else
  {
    if (!v6) {
      goto LABEL_29;
    }
    v28 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"brightness");
  }
  v29 = v28;
  [v28 floatValue];
  self->_brightness = v30;

LABEL_29:
  v31 = [v8 objectForKey:@"colorMatrix"];
  if (v31)
  {
    v32 = [v8 objectForKey:@"colorMatrix"];
    MTCAColorMatrixMakeWithDictionaryRepresentation(v32, (uint64_t)&v55);
LABEL_31:
    long long v33 = v58;
    *(_OWORD *)&self->_colorMatrix.m24 = v57;
    *(_OWORD *)&self->_colorMatrix.m33 = v33;
    *(_OWORD *)&self->_colorMatrix.m42 = v59;
    long long v34 = v56;
    *(_OWORD *)&self->_colorMatrix.m11 = v55;
    *(_OWORD *)&self->_colorMatrix.m15 = v34;

    goto LABEL_32;
  }
  if (v6)
  {
    v37 = objc_msgSend(MEMORY[0x1E4F29238], "mt_identityValueForFilter:", *MEMORY[0x1E4F3A038]);
    v32 = v37;
    if (v37)
    {
      [v37 CAColorMatrixValue];
    }
    else
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v55 = 0u;
    }
    goto LABEL_31;
  }
LABEL_32:

  v35 = [v8 objectForKey:@"zoom"];
  if (v35)
  {
    v36 = [v8 objectForKey:@"zoom"];
  }
  else
  {
    if (!v6) {
      goto LABEL_40;
    }
    v36 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"zoom");
  }
  v38 = v36;
  objc_msgSend(v36, "floatValue", v55, v56, v57, v58, v59);
  self->_zoom = v39;

LABEL_40:
  v40 = [v8 objectForKey:@"backdropScale"];
  if (v40)
  {
    v41 = [v8 objectForKey:@"backdropScale"];
LABEL_44:
    v42 = v41;
    objc_msgSend(v41, "floatValue", v55, v56, v57, v58, v59);
    self->_backdropScale = v43;

    goto LABEL_45;
  }
  if (v6)
  {
    v41 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"backdropScale");
    goto LABEL_44;
  }
LABEL_45:

  uint64_t v44 = [v8 objectForKey:@"blurInputQuality"];
  v45 = (void *)v44;
  if (v44 || v6)
  {
    if (v44) {
      blurInputQuality = (__CFString *)v44;
    }
    else {
      blurInputQuality = @"default";
    }
  }
  else
  {
    blurInputQuality = (__CFString *)self->_blurInputQuality;
  }
  objc_storeStrong((id *)&self->_blurInputQuality, blurInputQuality);

  v47 = [v8 objectForKey:@"blurAtEnd"];
  if (v47)
  {
    v48 = [v8 objectForKey:@"blurAtEnd"];
LABEL_55:
    v49 = v48;
    self->_blurAtEnd = objc_msgSend(v48, "BOOLValue", v55, v56, v57, v58, v59);

    goto LABEL_56;
  }
  if (v6)
  {
    v48 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"blurAtEnd");
    goto LABEL_55;
  }
LABEL_56:

  v50 = [v8 objectForKey:@"variableBlurInputMaskName"];
  variableBlurInputMaskName = v50;
  if (!v50)
  {
    variableBlurInputMaskName = 0;
    if (!v6) {
      variableBlurInputMaskName = self->_variableBlurInputMaskName;
    }
  }
  objc_storeStrong((id *)&self->_variableBlurInputMaskName, variableBlurInputMaskName);

  v52 = self->_variableBlurInputMaskName;
  if (v52)
  {
    if (self->_variableBlurInputMask)
    {
      CGImageRelease(self->_variableBlurInputMask);
      v52 = self->_variableBlurInputMaskName;
    }
    self->_variableBlurInputMask = MTCGImageCreateWithName(v52, v9, 0.0);
  }
  objc_msgSend(v8, "objectForKey:", @"curvesValues", v55, v56, v57, v58, v59);
  v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  curvesValues = v53;
  if (!v53)
  {
    curvesValues = 0;
    if (!v6) {
      curvesValues = self->_curvesValues;
    }
  }
  objc_storeStrong((id *)&self->_curvesValues, curvesValues);
}

- (MTTintingFilteringMaterialSettings)initWithMaterialDescription:(id)a3 andDescendantDescriptions:(id)a4 bundle:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 objectForKey:@"tinting"];
  v12 = [v9 valueForKey:@"tinting"];
  v40.receiver = self;
  v40.super_class = (Class)MTTintingFilteringMaterialSettings;
  float v13 = [(MTTintingMaterialSettings *)&v40 initWithTintingDescription:v11 andDescendantDescriptions:v12];

  if (v13)
  {
    v31 = v8;
    v14 = [v8 objectForKey:@"materialFiltering"];
    [(MTTintingFilteringMaterialSettings *)v13 _processMaterialFilteringDescription:v14 defaultingToIdentity:1 bundle:v10];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v15 = [v9 valueForKey:@"materialFiltering"];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
          v21 = [MEMORY[0x1E4F1CA98] null];

          if (v20 != v21) {
            [(MTTintingFilteringMaterialSettings *)v13 _processMaterialFilteringDescription:v20 defaultingToIdentity:0 bundle:v10];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v17);
    }

    v22 = [v31 objectForKey:@"userInfo"];
    [(MTTintingFilteringMaterialSettings *)v13 _processUserInfoDescription:v22];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = [v9 valueForKey:@"userInfo"];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v32 + 1) + 8 * v27);
          v29 = [MEMORY[0x1E4F1CA98] null];

          if (v28 != v29) {
            [(MTTintingFilteringMaterialSettings *)v13 _processUserInfoDescription:v28];
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v25);
    }

    id v8 = v31;
  }

  return v13;
}

- (void)_processUserInfoDescription:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    userInfo = self->_userInfo;
    if (userInfo) {
      BOOL v6 = (NSDictionary *)[(NSDictionary *)userInfo mutableCopy];
    }
    else {
      BOOL v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
          v14 = objc_msgSend(v8, "objectForKey:", v13, (void)v16);
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

- (NSArray)luminanceValues
{
  return self->_luminanceValues;
}

- (void)dealloc
{
  variableBlurInputMask = self->_variableBlurInputMask;
  if (variableBlurInputMask) {
    CGImageRelease(variableBlurInputMask);
  }
  v4.receiver = self;
  v4.super_class = (Class)MTTintingFilteringMaterialSettings;
  [(MTTintingMaterialSettings *)&v4 dealloc];
}

- (NSString)variableBlurInputMaskName
{
  return self->_variableBlurInputMaskName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_curvesValues, 0);
  objc_storeStrong((id *)&self->_variableBlurInputMaskName, 0);
  objc_storeStrong((id *)&self->_blurInputQuality, 0);
  objc_storeStrong((id *)&self->_luminanceValues, 0);
}

@end