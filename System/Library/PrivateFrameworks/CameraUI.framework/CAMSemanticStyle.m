@interface CAMSemanticStyle
+ (BOOL)isCustomizablePresetType:(int64_t)a3;
+ (CAMSemanticStyle)standardStyle;
+ (CAMSemanticStyle)styleWithDictionary:(id)a3 error:(id *)a4;
+ (id)defaultStyles;
+ (id)persistenceStringForPresetType:(int64_t)a3;
+ (unint64_t)_indexForPresetString:(id)a3;
+ (void)getSceneBias:(double *)a3 warmthBias:(double *)a4 forPresetType:(int64_t)a5;
- (AVSemanticStyle)avSemanticStyle;
- (BOOL)isCustomizable;
- (BOOL)isCustomized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSemanticStyle:(id)a3;
- (BOOL)isNeutral;
- (CAMSemanticStyle)initWithPresetType:(int64_t)a3;
- (CAMSemanticStyle)initWithPresetType:(int64_t)a3 sceneBias:(double)a4 warmthBias:(double)a5;
- (NSDictionary)analyticsDictionaryForCapture;
- (NSDictionary)analyticsDictionaryForPreferences;
- (NSDictionary)dictionaryRepresentation;
- (NSString)description;
- (NSString)displayName;
- (NSString)presetDisplayName;
- (double)sceneBias;
- (double)warmthBias;
- (id)_analyticsDictionaryForCapture:(BOOL)a3;
- (int64_t)_makerPresetWithSceneBias:(double)a3 warmthBias:(double)a4;
- (int64_t)makerPreset;
- (int64_t)presetType;
@end

@implementation CAMSemanticStyle

- (CAMSemanticStyle)initWithPresetType:(int64_t)a3 sceneBias:(double)a4 warmthBias:(double)a5
{
  double v12 = a5;
  double v13 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAMSemanticStyle;
  v6 = [(CAMSemanticStyle *)&v11 init];
  if (v6)
  {
    if (([(id)objc_opt_class() isCustomizablePresetType:a3] & 1) == 0) {
      [(id)objc_opt_class() getSceneBias:&v13 warmthBias:&v12 forPresetType:a3];
    }
    CEKClamp();
    v6->_sceneBias = v7;
    CEKClamp();
    v6->_warmthBias = v8;
    v6->_presetType = a3;
    v9 = v6;
  }

  return v6;
}

- (CAMSemanticStyle)initWithPresetType:(int64_t)a3
{
  double v6 = 0.0;
  double v7 = 0.0;
  [(id)objc_opt_class() getSceneBias:&v7 warmthBias:&v6 forPresetType:a3];
  return [(CAMSemanticStyle *)self initWithPresetType:a3 sceneBias:v7 warmthBias:v6];
}

+ (CAMSemanticStyle)standardStyle
{
  if (standardStyle_onceToken != -1) {
    dispatch_once(&standardStyle_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)standardStyle_style;
  return (CAMSemanticStyle *)v2;
}

uint64_t __33__CAMSemanticStyle_standardStyle__block_invoke()
{
  v0 = [[CAMSemanticStyle alloc] initWithPresetType:0];
  uint64_t v1 = standardStyle_style;
  standardStyle_style = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)getSceneBias:(double *)a3 warmthBias:(double *)a4 forPresetType:(int64_t)a5
{
  if ((unint64_t)a5 <= 4)
  {
    uint64_t v5 = qword_209C79910[a5];
    *a3 = dbl_209C798E8[a5];
    *(void *)a4 = v5;
  }
}

+ (id)persistenceStringForPresetType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_263FA3278[a3];
  }
}

+ (CAMSemanticStyle)styleWithDictionary:(id)a3 error:(id *)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"CAMSemanticStylePresetTypeKey"];
  double v8 = [v6 objectForKeyedSubscript:@"CAMSemanticStyleSceneBiasKey"];
  v9 = [v6 objectForKeyedSubscript:@"CAMSemanticStyleWarmthBiasKey"];

  if (!v7 || !v8 || !v9)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37 = @"Unexpected CAMSemanticStyle dictionary structure, missing required keys";
    id v12 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v24 = [v23 errorWithDomain:@"CAMSemanticStyleErrorDomain" code:-1 userInfo:v12];
    v25 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    objc_super v11 = v7;
  }
  else {
    objc_super v11 = 0;
  }
  id v12 = v11;
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();
  if (v13) {
    v14 = v8;
  }
  else {
    v14 = 0;
  }
  id v34 = v14;
  objc_opt_class();
  char v15 = objc_opt_isKindOfClass();
  if (v15) {
    v16 = v9;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;
  if (isKindOfClass & 1) != 0 && (v13 & 1) != 0 && (v15)
  {
    uint64_t v18 = [a1 _indexForPresetString:v12];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v28 = [&unk_26BDDFE78 objectAtIndexedSubscript:v18];
      uint64_t v29 = [v28 integerValue];

      v27 = v34;
      [v34 floatValue];
      double v31 = v30;
      [v17 floatValue];
      v25 = [[CAMSemanticStyle alloc] initWithPresetType:v29 sceneBias:v31 warmthBias:v32];
      v24 = 0;
      goto LABEL_22;
    }
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41[0] = @"Unexpected CAMSemanticStyle dictionary structure, incorrect value for CAMSemanticStylePresetTypeKey: no preset match found";
    v20 = NSDictionary;
    v21 = (__CFString **)v41;
    v22 = &v40;
  }
  else
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v39 = @"Unexpected CAMSemanticStyle dictionary structure, incorrect type for values of known keys";
    v20 = NSDictionary;
    v21 = &v39;
    v22 = &v38;
  }
  v26 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1, v34);
  v24 = [v19 errorWithDomain:@"CAMSemanticStyleErrorDomain" code:-2 userInfo:v26];

  v25 = 0;
  v27 = v35;
LABEL_22:

LABEL_23:
  if (a4) {
    *a4 = v24;
  }

  return v25;
}

+ (unint64_t)_indexForPresetString:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CAMSemanticStyle__indexForPresetString___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_indexForPresetString__onceToken != -1) {
    dispatch_once(&_indexForPresetString__onceToken, block);
  }
  uint64_t v5 = [(id)_indexForPresetString__indexesByPresetString objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

void __42__CAMSemanticStyle__indexForPresetString___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(&unk_26BDDFE78, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CAMSemanticStyle__indexForPresetString___block_invoke_2;
  v6[3] = &unk_263FA3258;
  uint64_t v8 = *(void *)(a1 + 32);
  id v3 = v2;
  id v7 = v3;
  [&unk_26BDDFE78 enumerateObjectsUsingBlock:v6];
  id v4 = (void *)_indexForPresetString__indexesByPresetString;
  _indexForPresetString__indexesByPresetString = (uint64_t)v3;
  id v5 = v3;
}

void __42__CAMSemanticStyle__indexForPresetString___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 40), "persistenceStringForPresetType:", objc_msgSend(a2, "integerValue"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

+ (id)defaultStyles
{
  v9[5] = *MEMORY[0x263EF8340];
  v2 = [[CAMSemanticStyle alloc] initWithPresetType:0];
  id v3 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", 2, v2);
  v9[1] = v3;
  id v4 = [[CAMSemanticStyle alloc] initWithPresetType:1];
  v9[2] = v4;
  id v5 = [[CAMSemanticStyle alloc] initWithPresetType:3];
  v9[3] = v5;
  id v6 = [[CAMSemanticStyle alloc] initWithPresetType:4];
  v9[4] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:5];

  return v7;
}

- (BOOL)isNeutral
{
  [(CAMSemanticStyle *)self sceneBias];
  if (fabs(v3) >= 0.005) {
    return 0;
  }
  [(CAMSemanticStyle *)self warmthBias];
  return fabs(v4) < 0.005;
}

- (BOOL)isCustomizable
{
  double v3 = objc_opt_class();
  int64_t v4 = [(CAMSemanticStyle *)self presetType];
  return [v3 isCustomizablePresetType:v4];
}

+ (BOOL)isCustomizablePresetType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 4;
}

- (BOOL)isCustomized
{
  v2 = self;
  double v3 = [[CAMSemanticStyle alloc] initWithPresetType:[(CAMSemanticStyle *)self presetType]];
  LOBYTE(v2) = ![(CAMSemanticStyle *)v2 isEqualToSemanticStyle:v3];

  return (char)v2;
}

- (NSDictionary)dictionaryRepresentation
{
  double v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  int64_t v4 = +[CAMSemanticStyle persistenceStringForPresetType:[(CAMSemanticStyle *)self presetType]];
  [v3 setObject:v4 forKeyedSubscript:@"CAMSemanticStylePresetTypeKey"];

  id v5 = NSNumber;
  [(CAMSemanticStyle *)self sceneBias];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"CAMSemanticStyleSceneBiasKey"];

  id v7 = NSNumber;
  [(CAMSemanticStyle *)self warmthBias];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"CAMSemanticStyleWarmthBiasKey"];

  return (NSDictionary *)v3;
}

- (NSString)displayName
{
  [(CAMSemanticStyle *)self makerPreset];
  return (NSString *)CEKDisplayStringForSemanticStyleMakerPreset();
}

- (NSString)presetDisplayName
{
  double v5 = 0.0;
  double v6 = 0.0;
  objc_msgSend((id)objc_opt_class(), "getSceneBias:warmthBias:forPresetType:", &v6, &v5, -[CAMSemanticStyle presetType](self, "presetType"));
  [(CAMSemanticStyle *)self _makerPresetWithSceneBias:v6 warmthBias:v5];
  double v3 = CEKDisplayStringForSemanticStyleMakerPreset();
  return (NSString *)v3;
}

- (int64_t)makerPreset
{
  [(CAMSemanticStyle *)self sceneBias];
  double v4 = v3;
  [(CAMSemanticStyle *)self warmthBias];
  return [(CAMSemanticStyle *)self _makerPresetWithSceneBias:v4 warmthBias:v5];
}

- (int64_t)_makerPresetWithSceneBias:(double)a3 warmthBias:(double)a4
{
  if (a3 < -0.005)
  {
    if (a4 < -0.005) {
      return 9;
    }
    BOOL v5 = a4 <= 0.005;
    int64_t v6 = 3;
    int64_t v7 = 8;
LABEL_11:
    if (v5) {
      return v6;
    }
    else {
      return v7;
    }
  }
  if (a3 > 0.005)
  {
    if (a4 < -0.005) {
      return 7;
    }
    BOOL v5 = a4 <= 0.005;
    int64_t v6 = 2;
    int64_t v7 = 6;
    goto LABEL_11;
  }
  if (a4 >= -0.005) {
    return 4 * (a4 > 0.005);
  }
  else {
    return 5;
  }
}

- (NSString)description
{
  double v3 = NSString;
  unint64_t v4 = [(CAMSemanticStyle *)self presetType];
  if (v4 > 4) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = off_263FA3278[v4];
  }
  [(CAMSemanticStyle *)self sceneBias];
  uint64_t v7 = v6;
  [(CAMSemanticStyle *)self warmthBias];
  return (NSString *)[v3 stringWithFormat:@"SemanticStyle(Preset: %@, Scn: %.01f, Wrm: %.01f)", v5, v7, v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(CAMSemanticStyle *)self isEqualToSemanticStyle:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToSemanticStyle:(id)a3
{
  id v4 = (CAMSemanticStyle *)a3;
  BOOL v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (v4 == self)
  {
    BOOL v13 = 1;
    goto LABEL_8;
  }
  int64_t v6 = [(CAMSemanticStyle *)self presetType];
  if (v6 == [(CAMSemanticStyle *)v5 presetType]
    && ([(CAMSemanticStyle *)self sceneBias],
        double v8 = v7,
        [(CAMSemanticStyle *)v5 sceneBias],
        vabdd_f64(v8, v9) < 0.005))
  {
    [(CAMSemanticStyle *)self warmthBias];
    double v11 = v10;
    [(CAMSemanticStyle *)v5 warmthBias];
    BOOL v13 = vabdd_f64(v11, v12) < 0.005;
  }
  else
  {
LABEL_6:
    BOOL v13 = 0;
  }
LABEL_8:

  return v13;
}

- (AVSemanticStyle)avSemanticStyle
{
  double v3 = (void *)MEMORY[0x263EFA898];
  [(CAMSemanticStyle *)self sceneBias];
  float v5 = v4;
  [(CAMSemanticStyle *)self warmthBias];
  *(float *)&double v6 = v7;
  *(float *)&double v7 = v5;
  return (AVSemanticStyle *)[v3 semanticStyleWithToneBias:v7 warmthBias:v6];
}

- (NSDictionary)analyticsDictionaryForCapture
{
  return (NSDictionary *)[(CAMSemanticStyle *)self _analyticsDictionaryForCapture:1];
}

- (NSDictionary)analyticsDictionaryForPreferences
{
  return (NSDictionary *)[(CAMSemanticStyle *)self _analyticsDictionaryForCapture:0];
}

- (id)_analyticsDictionaryForCapture:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v3) {
    double v6 = @"semanticStylePreset";
  }
  else {
    double v6 = @"SemanticStylePreset";
  }
  if (v3) {
    double v7 = @"semanticStyleToneBias";
  }
  else {
    double v7 = @"SemanticStyleToneBias";
  }
  if (v3) {
    double v8 = @"semanticStyleWarmthBias";
  }
  else {
    double v8 = @"SemanticStyleWarmthBias";
  }
  double v9 = @"SemanticStyleCustomized";
  if (v3) {
    double v9 = @"semanticStyleCustomized";
  }
  double v10 = v9;
  double v11 = v8;
  double v12 = v7;
  BOOL v13 = v6;
  unint64_t v14 = [(CAMSemanticStyle *)self presetType];
  if (v14 > 4) {
    char v15 = 0;
  }
  else {
    char v15 = off_263FA32A0[v14];
  }
  [v5 setObject:v15 forKeyedSubscript:v13];

  v16 = NSNumber;
  [(CAMSemanticStyle *)self sceneBias];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [v5 setObject:v17 forKeyedSubscript:v12];

  uint64_t v18 = NSNumber;
  [(CAMSemanticStyle *)self warmthBias];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  [v5 setObject:v19 forKeyedSubscript:v11];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMSemanticStyle isCustomized](self, "isCustomized"));
  [v5 setObject:v20 forKeyedSubscript:v10];

  return v5;
}

- (double)sceneBias
{
  return self->_sceneBias;
}

- (double)warmthBias
{
  return self->_warmthBias;
}

- (int64_t)presetType
{
  return self->_presetType;
}

@end