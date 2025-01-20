@interface CEKSmartStyle
+ (BOOL)canCustomizeCastIntensityForCastType:(int64_t)a3;
+ (BOOL)isCustomizablePresetType:(int64_t)a3;
+ (CEKSmartStyle)identityStyle;
+ (CEKSmartStyle)systemStyle;
+ (id)defaultStylesIncludingSystemStyles:(BOOL)a3 systemStylePlaceholder:(BOOL)a4 creativeStyles:(BOOL)a5;
+ (id)displayNameForPresetType:(int64_t)a3;
+ (id)persistenceStringForPresetType:(int64_t)a3;
+ (id)styleWithDictionary:(id)a3 error:(id *)a4;
+ (int64_t)castTypeForPresetType:(int64_t)a3;
+ (int64_t)presetTypeFromPersistenceString:(id)a3 success:(BOOL *)a4;
+ (unint64_t)_indexForPresetString:(id)a3;
+ (void)_getPresetValuesForPresetType:(int64_t)a3 castIntensity:(double *)a4 toneBias:(double *)a5 colorBias:(double *)a6;
- (BOOL)isCustomizable;
- (BOOL)isCustomized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSmartStyle:(id)a3;
- (BOOL)isNeutral;
- (CEKSmartStyle)initWithPresetType:(int64_t)a3;
- (CEKSmartStyle)initWithPresetType:(int64_t)a3 castIntensity:(double)a4 toneBias:(double)a5 colorBias:(double)a6;
- (NSDictionary)analyticsDictionaryForCapture;
- (NSDictionary)analyticsDictionaryForPreferences;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)presetDisplayName;
- (double)castIntensity;
- (double)colorBias;
- (double)toneBias;
- (id)_analyticsDictionaryForCapture:(BOOL)a3;
- (int64_t)castType;
- (int64_t)presetType;
@end

@implementation CEKSmartStyle

- (CEKSmartStyle)initWithPresetType:(int64_t)a3
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  [(id)objc_opt_class() _getPresetValuesForPresetType:a3 castIntensity:&v8 toneBias:&v7 colorBias:&v6];
  return [(CEKSmartStyle *)self initWithPresetType:a3 castIntensity:v8 toneBias:v7 colorBias:v6];
}

+ (void)_getPresetValuesForPresetType:(int64_t)a3 castIntensity:(double *)a4 toneBias:(double *)a5 colorBias:(double *)a6
{
  if ((unint64_t)a3 > 0xF) {
    id v10 = 0;
  }
  else {
    id v10 = **((id **)&unk_1E63CDCF0 + a3);
  }
  v11 = [MEMORY[0x1E4F55F08] defaultStyleForCastType:v10];
  if (!v11)
  {
    v12 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[CEKSmartStyle _getPresetValuesForPresetType:castIntensity:toneBias:colorBias:](a3, v12);
    }
  }
  if (a4)
  {
    [v11 castIntensity];
    *a4 = v13;
  }
  if (a5)
  {
    [v11 toneBias];
    *a5 = v14;
  }
  if (a6)
  {
    [v11 colorBias];
    *a6 = v15;
  }
}

- (CEKSmartStyle)initWithPresetType:(int64_t)a3 castIntensity:(double)a4 toneBias:(double)a5 colorBias:(double)a6
{
  double v18 = a5;
  double v19 = a4;
  double v17 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CEKSmartStyle;
  double v7 = [(CEKSmartStyle *)&v16 init];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() castTypeForPresetType:a3];
    char v9 = [(id)objc_opt_class() isCustomizablePresetType:a3];
    id v10 = objc_opt_class();
    if (v9)
    {
      if ([v10 canCustomizeCastIntensityForCastType:v8])
      {
LABEL_7:
        v7->_presetType = a3;
        v7->_castType = v8;
        v7->_castIntensity = CEKClamp(v19, 0.0, 1.0);
        v7->_toneBias = CEKClamp(v18, -1.0, 1.0);
        v7->_colorBias = CEKClamp(v17, -1.0, 1.0);
        float v14 = v7;
        goto LABEL_8;
      }
      id v10 = objc_opt_class();
      int64_t v11 = a3;
      v12 = 0;
      float v13 = 0;
    }
    else
    {
      v12 = &v18;
      float v13 = &v17;
      int64_t v11 = a3;
    }
    [v10 _getPresetValuesForPresetType:v11 castIntensity:&v19 toneBias:v12 colorBias:v13];
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

+ (BOOL)isCustomizablePresetType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xF;
}

+ (int64_t)castTypeForPresetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 0xE) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

- (double)toneBias
{
  return self->_toneBias;
}

- (double)colorBias
{
  return self->_colorBias;
}

+ (BOOL)canCustomizeCastIntensityForCastType:(int64_t)a3
{
  return a3 != 0;
}

+ (CEKSmartStyle)identityStyle
{
  if (identityStyle_onceToken != -1) {
    dispatch_once(&identityStyle_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)identityStyle_style;
  return (CEKSmartStyle *)v2;
}

uint64_t __30__CEKSmartStyle_identityStyle__block_invoke()
{
  v0 = [[CEKSmartStyle alloc] initWithPresetType:1];
  uint64_t v1 = identityStyle_style;
  identityStyle_style = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (CEKSmartStyle)systemStyle
{
  if (systemStyle_onceToken != -1) {
    dispatch_once(&systemStyle_onceToken, &__block_literal_global_81);
  }
  v2 = (void *)systemStyle_style;
  return (CEKSmartStyle *)v2;
}

uint64_t __28__CEKSmartStyle_systemStyle__block_invoke()
{
  v0 = [[CEKSmartStyle alloc] initWithPresetType:0];
  uint64_t v1 = systemStyle_style;
  systemStyle_style = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)persistenceStringForPresetType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF) {
    return 0;
  }
  else {
    return off_1E63CDDF0[a3];
  }
}

+ (int64_t)presetTypeFromPersistenceString:(id)a3 success:(BOOL *)a4
{
  uint64_t v5 = [a1 _indexForPresetString:a3];
  BOOL v6 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = [&unk_1F1A0FF50 objectAtIndexedSubscript:v5];
    int64_t v8 = [v7 integerValue];

    if (!a4) {
      return v8;
    }
    goto LABEL_5;
  }
  int64_t v8 = 1;
  if (a4) {
LABEL_5:
  }
    *a4 = v6;
  return v8;
}

+ (id)defaultStylesIncludingSystemStyles:(BOOL)a3 systemStylePlaceholder:(BOOL)a4 creativeStyles:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [&unk_1F1A0FF68 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(&unk_1F1A0FF68);
          }
          float v13 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", [*(id *)(*((void *)&v25 + 1) + 8 * i) integerValue]);
          [v8 addObject:v13];
        }
        uint64_t v10 = [&unk_1F1A0FF68 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
  }
  if (v6)
  {
    float v14 = [[CEKSmartStyle alloc] initWithPresetType:0];
    [v8 addObject:v14];
  }
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v15 = [&unk_1F1A0FF80 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(&unk_1F1A0FF80);
          }
          double v19 = -[CEKSmartStyle initWithPresetType:]([CEKSmartStyle alloc], "initWithPresetType:", [*(id *)(*((void *)&v21 + 1) + 8 * j) integerValue]);
          [v8 addObject:v19];
        }
        uint64_t v16 = [&unk_1F1A0FF80 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }
  }
  return v8;
}

- (NSString)description
{
  BOOL v3 = [(CEKSmartStyle *)self isCustomized];
  v4 = NSString;
  uint64_t v5 = CEKDebugStringForSmartStylePresetType([(CEKSmartStyle *)self presetType]);
  BOOL v6 = (void *)v5;
  if (v3)
  {
    BOOL v7 = CEKDebugStringForSmartStyleCastType([(CEKSmartStyle *)self castType]);
    [(CEKSmartStyle *)self castIntensity];
    uint64_t v9 = v8;
    [(CEKSmartStyle *)self toneBias];
    uint64_t v11 = v10;
    [(CEKSmartStyle *)self colorBias];
    float v13 = [v4 stringWithFormat:@"SmartStyle(Preset:%@, Cast:%@, Intensity:%.2f, Tone:%.2f, Color:%.2f)", v6, v7, v9, v11, v12];
  }
  else
  {
    float v13 = [v4 stringWithFormat:@"SmartStyle(Preset:%@)", v5];
  }

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(CEKSmartStyle *)self isEqualToSmartStyle:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToSmartStyle:(id)a3
{
  id v4 = (CEKSmartStyle *)a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (v4 == self)
  {
    BOOL v17 = 1;
    goto LABEL_10;
  }
  int64_t v6 = [(CEKSmartStyle *)self presetType];
  if (v6 != [(CEKSmartStyle *)v5 presetType]) {
    goto LABEL_8;
  }
  int64_t v7 = [(CEKSmartStyle *)self castType];
  if (v7 == [(CEKSmartStyle *)v5 castType]
    && ([(CEKSmartStyle *)self castIntensity],
        double v9 = v8,
        [(CEKSmartStyle *)v5 castIntensity],
        vabdd_f64(v9, v10) < 0.005)
    && ([(CEKSmartStyle *)self toneBias],
        double v12 = v11,
        [(CEKSmartStyle *)v5 toneBias],
        vabdd_f64(v12, v13) < 0.005))
  {
    [(CEKSmartStyle *)self colorBias];
    double v15 = v14;
    [(CEKSmartStyle *)v5 colorBias];
    BOOL v17 = vabdd_f64(v15, v16) < 0.005;
  }
  else
  {
LABEL_8:
    BOOL v17 = 0;
  }
LABEL_10:

  return v17;
}

- (BOOL)isNeutral
{
  if ([(CEKSmartStyle *)self castType]) {
    return 0;
  }
  [(CEKSmartStyle *)self toneBias];
  if (fabs(v3) >= 0.005) {
    return 0;
  }
  [(CEKSmartStyle *)self colorBias];
  return fabs(v4) < 0.005;
}

- (BOOL)isCustomizable
{
  double v3 = objc_opt_class();
  int64_t v4 = [(CEKSmartStyle *)self presetType];
  return [v3 isCustomizablePresetType:v4];
}

- (BOOL)isCustomized
{
  v2 = self;
  double v3 = [[CEKSmartStyle alloc] initWithPresetType:[(CEKSmartStyle *)self presetType]];
  LOBYTE(v2) = ![(CEKSmartStyle *)v2 isEqualToSmartStyle:v3];

  return (char)v2;
}

- (NSString)presetDisplayName
{
  double v3 = objc_opt_class();
  int64_t v4 = [(CEKSmartStyle *)self presetType];
  return (NSString *)[v3 displayNameForPresetType:v4];
}

+ (id)displayNameForPresetType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xF) {
    double v3 = 0;
  }
  else {
    double v3 = off_1E63CDD70[a3];
  }
  return CEKLocalizedFrameworkString(v3, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  double v17 = 0.0;
  double v18 = 0.0;
  double v16 = 0.0;
  objc_msgSend((id)objc_opt_class(), "_getPresetValuesForPresetType:castIntensity:toneBias:colorBias:", -[CEKSmartStyle presetType](self, "presetType"), &v18, &v17, &v16);
  unint64_t v4 = [(CEKSmartStyle *)self presetType];
  BOOL v5 = 0;
  if (v4 <= 0xF) {
    BOOL v5 = off_1E63CDDF0[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"PresetType"];
  [(CEKSmartStyle *)self castIntensity];
  if (v6 != v18)
  {
    int64_t v7 = (void *)MEMORY[0x1E4F28ED0];
    [(CEKSmartStyle *)self castIntensity];
    double v8 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v8 forKeyedSubscript:@"CastIntensity"];
  }
  [(CEKSmartStyle *)self toneBias];
  if (v9 != v17)
  {
    double v10 = (void *)MEMORY[0x1E4F28ED0];
    [(CEKSmartStyle *)self toneBias];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"ToneBias"];
  }
  [(CEKSmartStyle *)self colorBias];
  if (v12 != v16)
  {
    double v13 = (void *)MEMORY[0x1E4F28ED0];
    [(CEKSmartStyle *)self colorBias];
    double v14 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v14 forKeyedSubscript:@"ColorBias"];
  }
  return (NSDictionary *)v3;
}

+ (id)styleWithDictionary:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 objectForKeyedSubscript:@"PresetType"];
  int64_t v7 = [v5 objectForKeyedSubscript:@"CastIntensity"];
  double v8 = [v5 objectForKeyedSubscript:@"ToneBias"];
  double v9 = [v5 objectForKeyedSubscript:@"ColorBias"];

  double v10 = (uint64_t *)MEMORY[0x1E4F28568];
  if (!v6)
  {
    long long v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    v41[0] = @"Unexpected CEKSmartStyle dictionary structure, missing required keys";
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    double v13 = [v28 errorWithDomain:@"CEKSmartStyleErrorDomain" code:-1 userInfo:v29];

    if (v13) {
      goto LABEL_17;
    }
  }
  if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && v7
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) && v9)
  {
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *v10;
    v39 = @"Unexpected CEKSmartStyle dictionary structure, incorrect type for values of known keys";
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    double v13 = [v11 errorWithDomain:@"CEKSmartStyleErrorDomain" code:-2 userInfo:v12];

    if (v13) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = [a1 _indexForPresetString:v6];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v36 = *v10;
    v37 = @"Unexpected CEKSmartStyle dictionary structure, incorrect value for PresetTypeKey: no preset match found";
    double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    double v13 = [v15 errorWithDomain:@"CEKSmartStyleErrorDomain" code:-2 userInfo:v16];

    if (v13)
    {
LABEL_17:
      v30 = 0;
      if (!a4) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  double v17 = [&unk_1F1A0FF50 objectAtIndexedSubscript:v14];
  uint64_t v18 = [v17 integerValue];

  id v19 = v7;
  id v20 = v8;
  id v21 = v9;
  double v34 = 0.0;
  double v35 = 0.0;
  double v33 = 0.0;
  [a1 _getPresetValuesForPresetType:v18 castIntensity:&v35 toneBias:&v34 colorBias:&v33];
  if (v19)
  {
    [v19 floatValue];
    double v23 = v22;
    if (v20) {
      goto LABEL_14;
    }
LABEL_23:
    double v25 = v34;
    if (v21) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
  double v23 = v35;
  if (!v20) {
    goto LABEL_23;
  }
LABEL_14:
  [v20 floatValue];
  double v25 = v24;
  if (v21)
  {
LABEL_15:
    [v21 floatValue];
    double v27 = v26;
    goto LABEL_25;
  }
LABEL_24:
  double v27 = v33;
LABEL_25:
  v30 = [[CEKSmartStyle alloc] initWithPresetType:v18 castIntensity:v23 toneBias:v25 colorBias:v27];

  double v13 = 0;
  if (a4) {
LABEL_18:
  }
    *a4 = v13;
LABEL_19:

  return v30;
}

+ (unint64_t)_indexForPresetString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_indexForPresetString__onceToken != -1) {
      dispatch_once(&_indexForPresetString__onceToken, &__block_literal_global_153);
    }
    unint64_t v4 = [(id)_indexForPresetString__indexesByString objectForKeyedSubscript:v3];
    id v5 = v4;
    if (v4) {
      unint64_t v6 = [v4 unsignedIntegerValue];
    }
    else {
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

void __39__CEKSmartStyle__indexForPresetString___block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(&unk_1F1A0FF50, "count"));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CEKSmartStyle__indexForPresetString___block_invoke_2;
  v4[3] = &unk_1E63CDC58;
  id v1 = v0;
  id v5 = v1;
  [&unk_1F1A0FF50 enumerateObjectsUsingBlock:v4];
  v2 = (void *)_indexForPresetString__indexesByString;
  _indexForPresetString__indexesByString = (uint64_t)v1;
  id v3 = v1;
}

void __39__CEKSmartStyle__indexForPresetString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = [a2 integerValue];
  if (v5 > 0xF) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = off_1E63CDDF0[v5];
  }
  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (NSDictionary)analyticsDictionaryForCapture
{
  return (NSDictionary *)[(CEKSmartStyle *)self _analyticsDictionaryForCapture:1];
}

- (NSDictionary)analyticsDictionaryForPreferences
{
  return (NSDictionary *)[(CEKSmartStyle *)self _analyticsDictionaryForCapture:0];
}

- (id)_analyticsDictionaryForCapture:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3) {
    unint64_t v6 = @"smartStylePreset";
  }
  else {
    unint64_t v6 = @"SmartStylePreset";
  }
  if (v3) {
    id v7 = @"smartStyleCastIntensity";
  }
  else {
    id v7 = @"SmartStyleCastIntensity";
  }
  if (v3) {
    double v8 = @"smartStyleToneBias";
  }
  else {
    double v8 = @"SmartStyleToneBias";
  }
  if (v3) {
    double v9 = @"smartStyleColorBias";
  }
  else {
    double v9 = @"SmartStyleColorBias";
  }
  double v10 = @"SmartStyleCustomized";
  if (v3) {
    double v10 = @"smartStyleCustomized";
  }
  double v11 = v10;
  double v12 = v9;
  double v13 = v8;
  uint64_t v14 = v7;
  double v15 = v6;
  unint64_t v16 = [(CEKSmartStyle *)self presetType];
  if (v16 > 0xF) {
    double v17 = 0;
  }
  else {
    double v17 = off_1E63CDDF0[v16];
  }
  [v5 setObject:v17 forKeyedSubscript:v15];

  uint64_t v18 = (void *)MEMORY[0x1E4F28ED0];
  [(CEKSmartStyle *)self castIntensity];
  id v19 = objc_msgSend(v18, "numberWithDouble:");
  [v5 setObject:v19 forKeyedSubscript:v14];

  id v20 = (void *)MEMORY[0x1E4F28ED0];
  [(CEKSmartStyle *)self toneBias];
  id v21 = objc_msgSend(v20, "numberWithDouble:");
  [v5 setObject:v21 forKeyedSubscript:v13];

  float v22 = (void *)MEMORY[0x1E4F28ED0];
  [(CEKSmartStyle *)self colorBias];
  double v23 = objc_msgSend(v22, "numberWithDouble:");
  [v5 setObject:v23 forKeyedSubscript:v12];

  float v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[CEKSmartStyle isCustomized](self, "isCustomized"));
  [v5 setObject:v24 forKeyedSubscript:v11];

  return v5;
}

- (int64_t)presetType
{
  return self->_presetType;
}

- (int64_t)castType
{
  return self->_castType;
}

- (double)castIntensity
{
  return self->_castIntensity;
}

+ (void)_getPresetValuesForPresetType:(unint64_t)a1 castIntensity:(NSObject *)a2 toneBias:colorBias:.cold.1(unint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1 > 0xF) {
    v2 = 0;
  }
  else {
    v2 = off_1E63CDDF0[a1];
  }
  int v3 = 138543362;
  unint64_t v4 = v2;
  _os_log_error_impl(&dword_1BEE2D000, a2, OS_LOG_TYPE_ERROR, "Failed to get defaults for SmartStyle preset type %{public}@", (uint8_t *)&v3, 0xCu);
}

@end