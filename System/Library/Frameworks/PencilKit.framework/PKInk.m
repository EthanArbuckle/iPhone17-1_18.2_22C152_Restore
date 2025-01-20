@interface PKInk
+ (BOOL)supportsSecureCoding;
+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4;
+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 variant:(id)a5;
+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6;
+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 weight:(double)a5;
+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4;
+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4 inkVersion:(int64_t)a5;
+ (PKInk)inkWithType:(id)a3 color:(id)a4 weight:(double)a5;
+ (double)defaultOpacityForIdentifier:(id)a3;
+ (double)defaultWeightForIdentifier:(id)a3;
+ (id)colorForLassoStroke;
+ (id)identifierForCommandType:(unsigned int)a3 wantsObjectErase:(BOOL)a4;
+ (id)identifierForInkType:(id)a3;
+ (id)inkFromDictionary:(id)a3 color:(id)a4 identifier:(id)a5;
+ (id)inkFromInk:(id)a3 color:(id)a4;
+ (id)inkFromInk:(id)a3 weight:(double)a4;
+ (id)inkFromInk:(id)a3 withBehavior:(id)a4;
+ (int64_t)currentInkVersionForInkIdentifier:(id)a3;
+ (void)_clearCachedInks;
- (BOOL)_isCrayonInk;
- (BOOL)_isCustomInk;
- (BOOL)_isEraserInk;
- (BOOL)_isFountainPenInk;
- (BOOL)_isFountainPenInkV2;
- (BOOL)_isGenerationTool;
- (BOOL)_isHandwritingInk;
- (BOOL)_isLassoInk;
- (BOOL)_isMarkerInk;
- (BOOL)_isMonolineInk;
- (BOOL)_isPenInk;
- (BOOL)_isPencilInk;
- (BOOL)_isStrokeGeneratingInk;
- (BOOL)_isWatercolorInk;
- (BOOL)_shouldSaveRequiredContentVersionOverride;
- (BOOL)_shouldSaveSixChannelAddColor;
- (BOOL)_shouldSaveSixChannelMultiplyColor;
- (BOOL)_supportsCombiningStrokes;
- (BOOL)_weightIsUndefined;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualInk:(id)a3;
- (BOOL)isEqualUnweightedInk:(id)a3;
- (NSData)rawValue;
- (NSString)identifier;
- (NSString)variant;
- (PKContentVersion)requiredContentVersion;
- (PKInk)init;
- (PKInk)initWithArchive:(const void *)a3;
- (PKInk)initWithBehavior:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7;
- (PKInk)initWithCoder:(id)a3;
- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6;
- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7;
- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7 behavior:(id)a8;
- (PKInk)initWithInkType:(PKInkType)type color:(UIColor *)color;
- (PKInk)initWithRawValue:(id)a3;
- (PKInk)initWithUncheckedIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7;
- (PKInk)initWithV1Archive:(const void *)a3 serializationVersion:(unint64_t)a4;
- (PKInkBehavior)behavior;
- (UIColor)color;
- (__n128)_sixChannelAddColor;
- (__n128)_sixChannelMultiplyColor;
- (double)_weight;
- (double)weight;
- (float32x2_t)_defaultSixChannelAddColor;
- (float32x2_t)_defaultSixChannelMultiplyColor;
- (id).cxx_construct;
- (id)_copyWithOriginalRequiredContentVersion;
- (id)_copyWithVariant:(id)a3;
- (id)_dataInUnknownFields;
- (id)_shadowModel;
- (id)_sixChannelVersion;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifierForArchiving;
- (id)properties;
- (id)variantForArchiving;
- (int64_t)_numPaintFramebuffers;
- (int64_t)_requiredContentVersion;
- (int64_t)_requiredContentVersionOverride;
- (int64_t)inkFormatVersion;
- (unint64_t)hash;
- (unint64_t)hashValueForFloat:(double)a3;
- (unint64_t)particleRotation;
- (unint64_t)version;
- (void)_addTestDataToUnknownFields;
- (void)_setupCustomizedSixChannelColors;
- (void)_setupDefaultSixChannelAddAndMultiplyColors;
- (void)_setupRequiredContentVersion;
- (void)encodeWithCoder:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)saveToV1Archive:(void *)a3;
- (void)setBehavior:(id)a3;
- (void)setWeight:(double)a3;
- (void)set_requiredContentVersionOverride:(int64_t)a3;
- (void)set_sixChannelAddColor:(PKInk *)self;
- (void)set_sixChannelMultiplyColor:(PKInk *)self;
- (void)set_weightIsUndefined:(BOOL)a3;
@end

@implementation PKInk

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (PKInk)init
{
  +[PKInk defaultWeightForIdentifier:@"com.apple.ink.pen"];
  double v4 = v3;
  v5 = [MEMORY[0x1E4FB1618] blackColor];
  v6 = [(PKInk *)self initWithIdentifier:@"com.apple.ink.pen" color:v5 version:+[PKInk currentInkVersionForInkIdentifier:@"com.apple.ink.pen"] variant:0 weight:v4];

  return v6;
}

- (id)_sixChannelVersion
{
  double v3 = [PKInk alloc];
  double v4 = [(PKInk *)self identifier];
  v5 = [(PKInk *)self color];
  unint64_t v6 = [(PKInk *)self version];
  v7 = [(PKInk *)self variant];
  [(PKInk *)self weight];
  v8 = -[PKInk initWithIdentifier:color:version:variant:weight:](v3, "initWithIdentifier:color:version:variant:weight:", v4, v5, v6, v7);

  [(PKInk *)v8 _setupCustomizedSixChannelColors];
  [(PKInk *)v8 set_weightIsUndefined:[(PKInk *)self _weightIsUndefined]];

  return v8;
}

- (double)weight
{
  return self->_weight;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSString)variant
{
  return self->_variant;
}

- (void)set_weightIsUndefined:(BOOL)a3
{
  self->__weightIsUndefined = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)_weightIsUndefined
{
  return self->__weightIsUndefined;
}

- (void)_setupCustomizedSixChannelColors
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIColor *)self->_color CGColor];
  long long v18 = __const_DKUColorGetVectorFloat3_rgba;
  *(_OWORD *)v19 = unk_1C482B3B8;
  DKUColorGetRGBAComponents(v3, &v18);
  float64x2_t v17 = (float64x2_t)v18;
  double v4 = v19[0];
  v5 = [(PKInk *)self behavior];
  unint64_t v6 = [v5 renderingDescriptor];
  unint64_t v7 = [v6 blendMode];

  v9.i64[0] = 0;
  v9.i32[2] = 0;
  if (v7 > 4)
  {
    v12.i64[0] = 0;
    v12.i32[2] = 0;
  }
  else
  {
    *(float32x2_t *)v8.f32 = vcvt_f32_f64(v17);
    float v10 = v4;
    float32x4_t v11 = v8;
    v11.f32[2] = v10;
    if (((1 << v7) & 0x15) != 0)
    {
      float32x4_t v12 = v11;
    }
    else
    {
      double v13 = (fminf(v8.f32[0], fminf(v8.f32[1], v10)) + -0.9) / 0.1;
      double v14 = 0.0;
      if (v13 >= 0.0)
      {
        double v14 = v13;
        if (v13 > 1.0) {
          double v14 = 1.0;
        }
      }
      double v15 = v14 * 0.85 + 0.15;
      float v16 = v15;
      float32x4_t v12 = vmulq_n_f32(v11, v16);
      *(float *)&double v15 = 1.0 - v15;
      float32x4_t v9 = vmulq_n_f32(v11, *(float *)&v15);
    }
  }
  v12.i32[3] = 1.0;
  v9.i32[3] = 1.0;
  *(float32x4_t *)self->_sixChannelAddColor = v12;
  *(float32x4_t *)self->_sixChannelMultiplyColor = v9;
}

- (BOOL)_isEraserInk
{
  double v3 = [(PKInk *)self identifier];
  if ([v3 isEqualToString:@"com.apple.ink.eraser"])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(PKInk *)self identifier];
    char v4 = [v5 isEqualToString:@"com.apple.ink.objectEraser"];
  }
  return v4;
}

- (BOOL)_isLassoInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.lasso"];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (double)defaultWeightForIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = -0.5;
  if (([v3 isEqual:@"com.apple.ink.marker"] & 1) == 0)
  {
    if ([v3 isEqual:@"com.apple.ink.pencil"])
    {
      double v4 = -1.0;
    }
    else if (([v3 isEqual:@"com.apple.ink.pen"] & 1) == 0)
    {
      if (([v3 isEqual:@"com.apple.ink.watercolor"] & 1) != 0
        || ([v3 isEqual:@"com.apple.ink.fountainpen"] & 1) != 0
        || ([v3 isEqual:@"com.apple.ink.monoline"] & 1) != 0
        || (double v4 = -1.0, [v3 isEqual:@"com.apple.ink.crayon"]))
      {
        +[PKInkingTool defaultWidthForInkType:v3];
        double v4 = v5;
      }
    }
  }

  return v4;
}

+ (int64_t)currentInkVersionForInkIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.ink.eraser"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"com.apple.ink.objectEraser"])
  {
    int64_t v4 = 4;
  }
  else
  {
    int64_t v4 = 3;
  }

  return v4;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  double v15 = +[PKInkManager defaultInkManager];
  float v16 = [v15 supportedInkIdentifierFromIdentifier:v12];

  float64x2_t v17 = [(PKInk *)self initWithUncheckedIdentifier:v16 color:v13 version:a5 variant:v14 weight:a7];
  return v17;
}

- (PKInk)initWithUncheckedIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v30.receiver = self;
  v30.super_class = (Class)PKInk;
  float v16 = [(PKInk *)&v30 init];
  if (v16)
  {
    if (v14)
    {
      ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB([v14 CGColor]);
      uint64_t v18 = [MEMORY[0x1E4FB1618] colorWithCGColor:ConvertedToSRGB];
      color = v16->_color;
      v16->_color = (UIColor *)v18;

      CGColorRelease(ConvertedToSRGB);
    }
    else
    {
      uint64_t v20 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_FAULT, "Ink must not be initialized with a nil color", v29, 2u);
      }

      uint64_t v21 = [MEMORY[0x1E4FB1618] blackColor];
      v22 = v16->_color;
      v16->_color = (UIColor *)v21;
    }
    objc_storeStrong((id *)&v16->_identifier, a3);
    v16->_version = a5;
    if (v15)
    {
      uint64_t v23 = [v15 copy];
      variant = v16->_variant;
      v16->_variant = (NSString *)v23;
    }
    else
    {
      variant = v16->_variant;
      v16->_variant = (NSString *)@"default";
    }

    v25 = +[PKInkManager defaultInkManager];
    uint64_t v26 = [v25 inkBehaviorForIdentifier:v13 version:a5 variant:v15];
    behavior = v16->_behavior;
    v16->_behavior = (PKInkBehavior *)v26;

    [(PKInk *)v16 setWeight:a7];
    [(PKInk *)v16 _setupDefaultSixChannelAddAndMultiplyColors];
    [(PKInk *)v16 _setupRequiredContentVersion];
  }

  return v16;
}

- (void)set_requiredContentVersionOverride:(int64_t)a3
{
  self->__requiredContentVersionOverride = a3;
}

- (void)setWeight:(double)a3
{
  double v3 = a3;
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    double v5 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_ERROR, "Weight must be a finite number", buf, 2u);
    }

    unint64_t v6 = [(PKInk *)self identifier];
    +[PKInk defaultWeightForIdentifier:v6];
    double v3 = v7;
  }
  float32x4_t v8 = [(PKInk *)self identifier];
  if ([v8 isEqualToString:@"com.apple.ink.custom"])
  {
  }
  else
  {
    float32x4_t v9 = [(PKInk *)self behavior];
    char v10 = [v9 useUnclampedWeight];

    if ((v10 & 1) == 0)
    {
      if (v3 > 1.0 || v3 < -1.0)
      {
        float32x4_t v11 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v13 = 0;
          _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "Ink expects an adjustment size between -1 and 1", v13, 2u);
        }
      }
      double v12 = 1.0;
      if (v3 <= 1.0) {
        double v12 = v3;
      }
      if (v3 >= -1.0) {
        double v3 = v12;
      }
      else {
        double v3 = -1.0;
      }
    }
  }
  self->_weight = v3;
}

- (void)_setupRequiredContentVersion
{
  if ([(PKInk *)self _isFountainPenInk]
    && (+[PKContentVersionUtility sharedUtility](),
        double v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = -[PKContentVersionUtility programLinkedOnOrAfterDawnburstE]((BOOL)v3),
        v3,
        v4))
  {
    double v5 = self;
    int64_t v6 = 3;
  }
  else
  {
    if (!self) {
      return;
    }
    int64_t v6 = [(PKInk *)self _requiredContentVersion];
    double v5 = self;
  }

  [(PKInk *)v5 set_requiredContentVersionOverride:v6];
}

- (void)_setupDefaultSixChannelAddAndMultiplyColors
{
  [(PKInk *)self _defaultSixChannelAddColor];
  *(_OWORD *)self->_sixChannelAddColor = v3;
  [(PKInk *)self _defaultSixChannelMultiplyColor];
  *(_OWORD *)self->_sixChannelMultiplyColor = v4;
}

- (int64_t)_requiredContentVersion
{
  long long v3 = [(PKInk *)self identifier];
  if ([v3 isEqualToString:@"com.apple.ink.pen"]) {
    goto LABEL_8;
  }
  long long v4 = [(PKInk *)self identifier];
  if ([v4 isEqualToString:@"com.apple.ink.pencil"])
  {
LABEL_7:

LABEL_8:
    return 1;
  }
  double v5 = [(PKInk *)self identifier];
  if ([v5 isEqualToString:@"com.apple.ink.marker"])
  {
LABEL_6:

    goto LABEL_7;
  }
  int64_t v6 = [(PKInk *)self identifier];
  if ([v6 isEqualToString:@"com.apple.ink.eraser"])
  {

    goto LABEL_6;
  }
  float32x4_t v8 = [(PKInk *)self identifier];
  char v9 = [v8 isEqualToString:@"com.apple.ink.lasso"];

  if (v9) {
    return 1;
  }
  char v10 = [(PKInk *)self identifier];
  if ([v10 isEqualToString:@"com.apple.ink.fountainpen"]) {
    goto LABEL_16;
  }
  float32x4_t v11 = [(PKInk *)self identifier];
  if ([v11 isEqualToString:@"com.apple.ink.watercolor"])
  {
LABEL_15:

LABEL_16:
    return 2;
  }
  double v12 = [(PKInk *)self identifier];
  if ([v12 isEqualToString:@"com.apple.ink.crayon"])
  {

    goto LABEL_15;
  }
  id v13 = [(PKInk *)self identifier];
  char v14 = [v13 isEqualToString:@"com.apple.ink.monoline"];

  if (v14) {
    return 2;
  }
  return 250;
}

- (BOOL)_isFountainPenInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.fountainpen"];

  return v3;
}

- (float32x2_t)_defaultSixChannelMultiplyColor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [a1 behavior];
  char v3 = [v2 renderingDescriptor];
  uint64_t v4 = [v3 blendMode];

  if ((v4 | 2) == 3)
  {
    double v5 = (CGColor *)[a1[6] CGColor];
    v7[0] = (float64x2_t)__const_DKUColorGetVectorFloat3_rgba;
    v7[1] = (float64x2_t)unk_1C482B3B8;
    DKUColorGetRGBAComponents(v5, v7);
    return vcvt_f32_f64(v7[0]);
  }
  else
  {
    return 0;
  }
}

- (float32x2_t)_defaultSixChannelAddColor
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [a1 behavior];
  char v3 = [v2 renderingDescriptor];
  unint64_t v4 = [v3 blendMode];

  float32x2_t result = 0;
  if (v4 <= 4 && ((1 << v4) & 0x15) != 0)
  {
    int64_t v6 = (CGColor *)objc_msgSend(a1[6], "CGColor", 0.0);
    v7[0] = (float64x2_t)__const_DKUColorGetVectorFloat3_rgba;
    v7[1] = (float64x2_t)unk_1C482B3B8;
    DKUColorGetRGBAComponents(v6, v7);
    return vcvt_f32_f64(v7[0]);
  }
  return result;
}

- (PKInkBehavior)behavior
{
  return self->_behavior;
}

- (PKInk)initWithArchive:(const void *)a3
{
  double v5 = (float *)*((void *)a3 + 1);
  if (v5)
  {
    double v6 = v5[5];
    double v7 = v5[4];
    double v8 = v5[3];
    double v9 = v5[2];
  }
  else
  {
    double v9 = 1.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
  }
  CGColorRef RGBA = CGColorCreateRGBA(v6, v7, v8, v9);
  float32x4_t v11 = (uint64_t *)*((void *)a3 + 2);
  if (*((char *)v11 + 23) < 0) {
    float32x4_t v11 = (uint64_t *)*v11;
  }
  double v12 = [NSString stringWithUTF8String:v11];
  id v13 = v12;
  if ((*((unsigned char *)a3 + 72) & 2) != 0)
  {
    uint64_t v14 = *((void *)a3 + 7);
    if (v14 == 3)
    {
      if ([(__CFString *)v12 isEqualToString:@"com.apple.ink.calligraphy"])
      {
        id v15 = @"com.apple.ink.fountainpen";

        uint64_t v14 = 3;
        id v13 = v15;
      }
      else
      {
        uint64_t v14 = 3;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  float v16 = @"default";
  float64x2_t v17 = (uint64_t *)*((void *)a3 + 6);
  if (v17)
  {
    if (*((char *)v17 + 23) < 0) {
      float64x2_t v17 = (uint64_t *)*v17;
    }
    uint64_t v18 = [NSString stringWithUTF8String:v17];

    float v16 = (__CFString *)v18;
  }
  v19 = [MEMORY[0x1E4FB1618] colorWithCGColor:RGBA];
  uint64_t v20 = [(PKInk *)self initWithIdentifier:v13 color:v19 version:v14 variant:v16];

  if ((*((unsigned char *)a3 + 72) & 4) != 0) {
    [(PKInk *)v20 setWeight:*((double *)a3 + 8)];
  }
  else {
    [(PKInk *)v20 set_weightIsUndefined:1];
  }
  uint64_t v21 = *((void *)a3 + 4);
  if (v21)
  {
    int8x16_t v22 = (int8x16_t)vrev64q_s32(*(int32x4_t *)(v21 + 8));
    [(PKInk *)v20 set_sixChannelAddColor:*(double *)vextq_s8(v22, v22, 8uLL).i64];
  }
  uint64_t v23 = *((void *)a3 + 5);
  if (v23)
  {
    int8x16_t v24 = (int8x16_t)vrev64q_s32(*(int32x4_t *)(v23 + 8));
    [(PKInk *)v20 set_sixChannelMultiplyColor:*(double *)vextq_s8(v24, v24, 8uLL).i64];
  }
  if ((*((unsigned char *)a3 + 72) & 1) == 0 && v20) {
    [(PKInk *)v20 set_requiredContentVersionOverride:[(PKInk *)v20 _requiredContentVersion]];
  }
  uint64_t v26 = (PKProtobufUnknownFields *)*((void *)a3 + 10);
  uint64_t v25 = *((void *)a3 + 11);
  if (v25) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v20->_unknownFields.__cntrl_;
  v20->_unknownFields.__ptr_ = v26;
  v20->_unknownFields.__cntrl_ = (__shared_weak_count *)v25;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }

  return v20;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKInk *)self color];
  double v6 = (CGColor *)[v5 CGColor];

  long long v44 = xmmword_1C4829728;
  *(_OWORD *)v45 = unk_1C4829738;
  if (DKUColorGetRGBAComponents(v6, &v44))
  {
    drawing::Ink::makeColor((uint64_t)a3);
    uint64_t v7 = *((void *)a3 + 1);
    double v8 = *((double *)&v44 + 1);
    float v9 = *(double *)&v44;
    *(float *)(v7 + 20) = v9;
    *(unsigned char *)(v7 + 24) |= 8u;
    uint64_t v10 = *((void *)a3 + 1);
    float v11 = v8;
    *(unsigned char *)(v10 + 24) |= 4u;
    *(float *)(v10 + 16) = v11;
    uint64_t v12 = *((void *)a3 + 1);
    float v13 = v45[0];
    *(unsigned char *)(v12 + 24) |= 2u;
    *(float *)(v12 + 12) = v13;
    uint64_t v14 = *((void *)a3 + 1);
    float Alpha = CGColorGetAlpha(v6);
    *(unsigned char *)(v14 + 24) |= 1u;
    *(float *)(v14 + 8) = Alpha;
  }
  id v16 = [(PKInk *)self identifierForArchiving];
  std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[v16 UTF8String]);
  uint64_t v17 = *((void *)a3 + 2);
  if (!v17) {
    operator new();
  }
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  long long v18 = v42;
  *(void *)(v17 + 16) = v43;
  *(_OWORD *)uint64_t v17 = v18;
  HIBYTE(v43) = 0;
  LOBYTE(v42) = 0;

  unint64_t v19 = [(PKInk *)self version];
  *((unsigned char *)a3 + 72) |= 2u;
  *((void *)a3 + 7) = v19;
  uint64_t v20 = [(PKInk *)self variantForArchiving];
  BOOL v21 = v20 == 0;

  if (!v21)
  {
    id v22 = [(PKInk *)self variantForArchiving];
    std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[v22 UTF8String]);
    uint64_t v23 = *((void *)a3 + 6);
    if (!v23) {
      operator new();
    }
    if (*(char *)(v23 + 23) < 0) {
      operator delete(*(void **)v23);
    }
    long long v24 = v42;
    *(void *)(v23 + 16) = v43;
    *(_OWORD *)uint64_t v23 = v24;
    HIBYTE(v43) = 0;
    LOBYTE(v42) = 0;
  }
  if (![(PKInk *)self _weightIsUndefined])
  {
    [(PKInk *)self _weight];
    *((unsigned char *)a3 + 72) |= 4u;
    *((void *)a3 + 8) = v25;
  }
  if ([(PKInk *)self _shouldSaveSixChannelAddColor])
  {
    [(PKInk *)self _sixChannelAddColor];
    long long v40 = v26;
    drawing::Ink::makeSixChannelAddColor((uint64_t)a3);
    uint64_t v27 = *((void *)a3 + 4);
    *(unsigned char *)(v27 + 24) |= 8u;
    *(_DWORD *)(v27 + 20) = v40;
    uint64_t v28 = *((void *)a3 + 4);
    *(unsigned char *)(v28 + 24) |= 4u;
    *(_DWORD *)(v28 + 16) = DWORD1(v40);
    uint64_t v29 = *((void *)a3 + 4);
    *(unsigned char *)(v29 + 24) |= 2u;
    *(_DWORD *)(v29 + 12) = DWORD2(v40);
    uint64_t v30 = *((void *)a3 + 4);
    *(unsigned char *)(v30 + 24) |= 1u;
    *(_DWORD *)(v30 + 8) = HIDWORD(v40);
  }
  if ([(PKInk *)self _shouldSaveSixChannelMultiplyColor])
  {
    [(PKInk *)self _sixChannelMultiplyColor];
    long long v41 = v31;
    drawing::Ink::makeSixChannelMultiplyColor((uint64_t)a3);
    uint64_t v32 = *((void *)a3 + 5);
    *(unsigned char *)(v32 + 24) |= 8u;
    *(_DWORD *)(v32 + 20) = v41;
    uint64_t v33 = *((void *)a3 + 5);
    *(unsigned char *)(v33 + 24) |= 4u;
    *(_DWORD *)(v33 + 16) = DWORD1(v41);
    uint64_t v34 = *((void *)a3 + 5);
    *(unsigned char *)(v34 + 24) |= 2u;
    *(_DWORD *)(v34 + 12) = DWORD2(v41);
    uint64_t v35 = *((void *)a3 + 5);
    *(unsigned char *)(v35 + 24) |= 1u;
    *(_DWORD *)(v35 + 8) = HIDWORD(v41);
  }
  if ([(PKInk *)self _shouldSaveRequiredContentVersionOverride])
  {
    int64_t v36 = [(PKInk *)self _requiredContentVersionOverride];
    *((unsigned char *)a3 + 72) |= 1u;
    *((void *)a3 + 3) = v36;
  }
  ptr = self->_unknownFields.__ptr_;
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  v39 = (std::__shared_weak_count *)*((void *)a3 + 11);
  *((void *)a3 + 10) = ptr;
  *((void *)a3 + 11) = cntrl;
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
}

- (PKInk)initWithV1Archive:(const void *)a3 serializationVersion:(unint64_t)a4
{
  double v6 = (float *)*((void *)a3 + 1);
  if (v6)
  {
    double v7 = v6[5];
    double v8 = v6[4];
    double v9 = v6[3];
    double v10 = v6[2];
  }
  else
  {
    double v10 = 1.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
  }
  CGColorRef RGBA = CGColorCreateRGBA(v7, v8, v9, v10);
  uint64_t v12 = (uint64_t *)*((void *)a3 + 2);
  if (*((char *)v12 + 23) < 0) {
    uint64_t v12 = (uint64_t *)*v12;
  }
  float v13 = [NSString stringWithUTF8String:v12];
  if ((*((unsigned char *)a3 + 32) & 1) == 0)
  {
    uint64_t v14 = @"default";
    id v15 = v14;
LABEL_11:
    long long v18 = v15;

    uint64_t v16 = 0;
    uint64_t v14 = v18;
    goto LABEL_12;
  }
  uint64_t v16 = *((void *)a3 + 3);
  uint64_t v17 = @"default";
  uint64_t v14 = v17;
  if ((v16 | 2) == 2)
  {
    id v15 = @"thick";
    if (v16 != 2) {
      id v15 = v17;
    }
    goto LABEL_11;
  }
LABEL_12:
  unint64_t v19 = [MEMORY[0x1E4FB1618] colorWithCGColor:RGBA];
  uint64_t v20 = [(PKInk *)self initWithIdentifier:v13 color:v19 version:v16 variant:v14];

  return v20;
}

- (void)saveToV1Archive:(void *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKInk *)self color];
  double v6 = (CGColor *)[v5 CGColor];

  long long v22 = xmmword_1C4829728;
  *(_OWORD *)uint64_t v23 = unk_1C4829738;
  if (DKUColorGetRGBAComponents(v6, &v22))
  {
    drawingV1::Ink::makeColor((uint64_t)a3);
    uint64_t v7 = *((void *)a3 + 1);
    double v8 = *((double *)&v22 + 1);
    float v9 = *(double *)&v22;
    *(float *)(v7 + 20) = v9;
    *(unsigned char *)(v7 + 24) |= 8u;
    uint64_t v10 = *((void *)a3 + 1);
    float v11 = v8;
    *(unsigned char *)(v10 + 24) |= 4u;
    *(float *)(v10 + 16) = v11;
    uint64_t v12 = *((void *)a3 + 1);
    float v13 = v23[0];
    *(unsigned char *)(v12 + 24) |= 2u;
    *(float *)(v12 + 12) = v13;
    uint64_t v14 = *((void *)a3 + 1);
    float Alpha = CGColorGetAlpha(v6);
    *(unsigned char *)(v14 + 24) |= 1u;
    *(float *)(v14 + 8) = Alpha;
  }
  id v16 = [(PKInk *)self identifier];
  std::string::basic_string[abi:ne180100]<0>(&v20, (char *)[v16 UTF8String]);
  uint64_t v17 = *((void *)a3 + 2);
  if (!v17) {
    operator new();
  }
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  long long v18 = v20;
  *(void *)(v17 + 16) = v21;
  *(_OWORD *)uint64_t v17 = v18;
  HIBYTE(v21) = 0;
  LOBYTE(v20) = 0;

  unint64_t v19 = [(PKInk *)self version];
  *((unsigned char *)a3 + 32) |= 1u;
  *((void *)a3 + 3) = v19;
}

- (PKInk)initWithRawValue:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  int v10 = 0;
  v9[0] = &unk_1F1FB0778;
  v9[1] = 0;
  v9[2] = 0;
  memset(&v9[4], 0, 24);
  id v4 = a3;
  id v5 = (const unsigned __int8 *)[v4 bytes];
  [v4 length];
  PB::Reader::Reader((PB::Reader *)v8, v5);
  if (drawing::Ink::readFrom((drawing::Ink *)v9, (PB::Reader *)v8))
  {
    self = [(PKInk *)self initWithArchive:v9];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }
  drawing::Ink::~Ink((drawing::Ink *)v9);

  return v6;
}

- (NSData)rawValue
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  int v7 = 0;
  v6[0] = &unk_1F1FB0778;
  v6[1] = 0;
  v6[2] = 0;
  memset(&v6[4], 0, 24);
  [(PKInk *)self saveToArchive:v6];
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::Ink::writeTo((drawing::Ink *)v6, (PB::Writer *)&v4);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v4 - v5];
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::Ink::~Ink((drawing::Ink *)v6);

  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKInk *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"representation"];
}

- (PKInk)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
  int v7 = objc_msgSend(v4, "setWithArray:", v6, v14, v15);
  uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"representation"];

  if (v8)
  {
    uint64_t v9 = [v8 objectForKey:@"identifier"];
    int v10 = [v8 objectForKey:@"properties"];
    uint64_t v11 = +[PKInk inkWithIdentifier:v9 properties:v10];

    self = v11;
    uint64_t v12 = self;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)identifierForInkType:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (PKInk)inkWithType:(id)a3 color:(id)a4 weight:(double)a5
{
  id v7 = a4;
  uint64_t v8 = +[PKInk identifierForInkType:a3];
  uint64_t v9 = +[PKInk inkWithIdentifier:v8 color:v7 weight:a5];

  return (PKInk *)v9;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 weight:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [[PKInk alloc] initWithIdentifier:v7 color:v8 version:+[PKInk currentInkVersionForInkIdentifier:v7] variant:0 weight:a5];

  return v9;
}

+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4
{
  id v4 = [a1 inkWithIdentifier:a3 properties:a4 inkVersion:-1];

  return (PKInk *)v4;
}

+ (PKInk)inkWithIdentifier:(id)a3 properties:(id)a4 inkVersion:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  int64_t v58 = a5;
  if (a5 < 0) {
    int64_t v58 = [a1 currentInkVersionForInkIdentifier:v9];
  }
  uint64_t v11 = [v10 objectForKeyedSubscript:@"PKInkWeightProperty"];
  if (v11
    && ([v10 objectForKeyedSubscript:@"PKInkWeightProperty"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"PKInkWeightProperty"];
    [v12 floatValue];
    double v14 = v13;
  }
  else
  {
    +[PKInk defaultWeightForIdentifier:v9];
    double v14 = v15;
    if (!v11) {
      goto LABEL_8;
    }
  }

LABEL_8:
  if ([v9 isEqualToString:@"com.apple.ink.eraser"])
  {
    uint64_t v16 = [v10 objectForKeyedSubscript:@"PKInkVersionProperty"];
    if (v16)
    {
    }
    else if (fabs(v14 + -1.0) < 0.00999999978)
    {
      [a1 defaultWeightForIdentifier:v9];
      double v14 = v17;
    }
  }
  long long v18 = [v10 objectForKeyedSubscript:@"PKInkOpacityProperty"];
  if (v18
    && ([v10 objectForKeyedSubscript:@"PKInkOpacityProperty"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v19 = [v10 objectForKeyedSubscript:@"PKInkOpacityProperty"];
    [v19 floatValue];
    double v21 = v20;
  }
  else
  {
    +[PKInk defaultOpacityForIdentifier:v9];
    double v21 = v22;
    if (!v18) {
      goto LABEL_18;
    }
  }

LABEL_18:
  uint64_t v23 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
  if (v23)
  {
    uint64_t v24 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
    objc_opt_class();
    double v25 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      long long v26 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
      uint64_t v27 = [v26 objectForKeyedSubscript:@"PKInkRedComponentProperty"];
      if (v27)
      {
        uint64_t v28 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
        uint64_t v29 = [v28 objectForKeyedSubscript:@"PKInkRedComponentProperty"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v30 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
          long long v31 = [v30 objectForKeyedSubscript:@"PKInkRedComponentProperty"];
          [v31 doubleValue];
          double v25 = v32;
        }
      }
    }
  }
  else
  {
    double v25 = 0.0;
  }

  uint64_t v33 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
  if (v33)
  {
    uint64_t v34 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
    objc_opt_class();
    double v35 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      int64_t v36 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
      v37 = [v36 objectForKeyedSubscript:@"PKInkGreenComponentProperty"];
      if (v37)
      {
        v38 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
        v39 = [v38 objectForKeyedSubscript:@"PKInkGreenComponentProperty"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v40 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
          long long v41 = [v40 objectForKeyedSubscript:@"PKInkGreenComponentProperty"];
          [v41 doubleValue];
          double v35 = v42;
        }
      }
    }
  }
  else
  {
    double v35 = 0.0;
  }

  uint64_t v43 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
  if (v43)
  {
    long long v44 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
    objc_opt_class();
    double v45 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v46 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
      v47 = [v46 objectForKeyedSubscript:@"PKInkBlueComponentProperty"];
      if (v47)
      {
        v48 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
        v49 = [v48 objectForKeyedSubscript:@"PKInkBlueComponentProperty"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v50 = [v10 objectForKeyedSubscript:@"PKInkColorProperty"];
          v51 = [v50 objectForKeyedSubscript:@"PKInkBlueComponentProperty"];
          [v51 doubleValue];
          double v45 = v52;
        }
      }
    }
  }
  else
  {
    double v45 = 0.0;
  }

  v53 = [MEMORY[0x1E4FB1618] colorWithRed:v25 green:v35 blue:v45 alpha:v21];
  v54 = [PKInk alloc];
  v55 = [v10 objectForKeyedSubscript:@"PKInkVariantProperty"];
  v56 = [(PKInk *)v54 initWithIdentifier:v9 color:v53 version:v58 variant:v55 weight:v14];

  return v56;
}

- (PKInk)initWithInkType:(PKInkType)type color:(UIColor *)color
{
  double v6 = color;
  id v7 = +[PKInk identifierForInkType:type];
  id v8 = [(PKInk *)self initWithIdentifier:v7 color:v6 version:+[PKInk currentInkVersionForInkIdentifier:v7] variant:0 weight:0.0];

  return v8;
}

- (id)_copyWithVariant:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  double v6 = [(PKInk *)self identifier];
  id v7 = [(PKInk *)self color];
  unint64_t v8 = [(PKInk *)self version];
  [(PKInk *)self weight];
  id v9 = objc_msgSend(v5, "initWithIdentifier:color:version:variant:weight:", v6, v7, v8, v4);

  objc_msgSend(v9, "set_weightIsUndefined:", -[PKInk _weightIsUndefined](self, "_weightIsUndefined"));
  return v9;
}

- (id)_copyWithOriginalRequiredContentVersion
{
  v2 = self;
  objc_sync_enter(v2);
  cachedInkWithOriginalRequiredContentVersion = v2->_cachedInkWithOriginalRequiredContentVersion;
  if (!cachedInkWithOriginalRequiredContentVersion)
  {
    id v4 = objc_alloc((Class)objc_opt_class());
    id v5 = [(PKInk *)v2 identifier];
    double v6 = [(PKInk *)v2 color];
    uint64_t v7 = [(PKInk *)v2 version];
    unint64_t v8 = [(PKInk *)v2 variant];
    [(PKInk *)v2 weight];
    id v9 = (PKInk *)objc_msgSend(v4, "initWithIdentifier:color:version:variant:weight:", v5, v6, v7, v8);

    if (v9) {
      [(PKInk *)v9 set_requiredContentVersionOverride:[(PKInk *)v9 _requiredContentVersion]];
    }
    [(PKInk *)v9 set_weightIsUndefined:[(PKInk *)v2 _weightIsUndefined]];
    id v10 = v2->_cachedInkWithOriginalRequiredContentVersion;
    v2->_cachedInkWithOriginalRequiredContentVersion = v9;

    cachedInkWithOriginalRequiredContentVersion = v2->_cachedInkWithOriginalRequiredContentVersion;
  }
  uint64_t v11 = cachedInkWithOriginalRequiredContentVersion;
  objc_sync_exit(v2);

  return v11;
}

- (BOOL)_isHandwritingInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.handwriting"];

  return v3;
}

- (BOOL)_isPenInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.pen"];

  return v3;
}

- (BOOL)_isPencilInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.pencil"];

  return v3;
}

- (BOOL)_isMarkerInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.marker"];

  return v3;
}

- (BOOL)_isMonolineInk
{
  id v4 = [(PKInk *)self identifier];
  int v5 = [v4 isEqualToString:@"com.apple.ink.pen"];
  if (v5)
  {
    v2 = [(PKInk *)self variant];
    if ([v2 isEqualToString:@"fixed-width"])
    {
      char v6 = 1;
      goto LABEL_6;
    }
  }
  uint64_t v7 = [(PKInk *)self identifier];
  if (([v7 isEqualToString:@"com.apple.ink.monoline"] & 1) == 0)
  {
    id v9 = [(PKInk *)self identifier];
    char v6 = [v9 isEqualToString:@"com.apple.ink.micronpen"];

    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  char v6 = 1;
  if (v5) {
LABEL_6:
  }

LABEL_7:
  return v6;
}

- (BOOL)_isFountainPenInkV2
{
  BOOL v3 = [(PKInk *)self _isFountainPenInk];
  if (v3) {
    LOBYTE(v3) = [(PKInk *)self requiredContentVersion] > PKContentVersion2;
  }
  return v3;
}

- (BOOL)_isWatercolorInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.watercolor"];

  return v3;
}

- (BOOL)_isCrayonInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.crayon"];

  return v3;
}

- (BOOL)_isGenerationTool
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.generationtool"];

  return v3;
}

- (BOOL)_isCustomInk
{
  v2 = [(PKInk *)self identifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.custom"];

  return v3;
}

- (int64_t)inkFormatVersion
{
  char v3 = [(PKInk *)self identifier];
  if ([v3 isEqualToString:@"com.apple.ink.pen"]) {
    goto LABEL_8;
  }
  id v4 = [(PKInk *)self identifier];
  if ([v4 isEqualToString:@"com.apple.ink.pencil"])
  {
LABEL_7:

LABEL_8:
    return 0;
  }
  int v5 = [(PKInk *)self identifier];
  if ([v5 isEqualToString:@"com.apple.ink.marker"])
  {
LABEL_6:

    goto LABEL_7;
  }
  char v6 = [(PKInk *)self identifier];
  if ([v6 isEqualToString:@"com.apple.ink.eraser"])
  {

    goto LABEL_6;
  }
  unint64_t v8 = [(PKInk *)self identifier];
  char v9 = [v8 isEqualToString:@"com.apple.ink.lasso"];

  if (v9) {
    return 0;
  }
  id v10 = [(PKInk *)self identifier];
  if ([v10 isEqualToString:@"com.apple.ink.fountainpen"]) {
    goto LABEL_14;
  }
  uint64_t v11 = [(PKInk *)self identifier];
  if ([v11 isEqualToString:@"com.apple.ink.watercolor"])
  {

LABEL_14:
    return 1;
  }
  uint64_t v12 = [(PKInk *)self identifier];
  char v13 = [v12 isEqualToString:@"com.apple.ink.monoline"];

  if (v13) {
    return 1;
  }
  double v14 = [(PKInk *)self identifier];
  int v15 = [v14 isEqualToString:@"com.apple.ink.crayon"];

  if (v15) {
    return 2;
  }
  else {
    return 250;
  }
}

- (PKContentVersion)requiredContentVersion
{
  int64_t v3 = [(PKInk *)self _requiredContentVersionOverride];
  PKContentVersion result = [(PKInk *)self _requiredContentVersion];
  if (v3 > result) {
    return v3;
  }
  return result;
}

- (id)identifierForArchiving
{
  int64_t v3 = [(PKInk *)self identifier];
  char v4 = [v3 isEqualToString:@"com.apple.ink.monoline"];

  if (v4)
  {
    int v5 = @"com.apple.ink.pen";
  }
  else
  {
    int v5 = [(PKInk *)self identifier];
  }

  return v5;
}

- (id)variantForArchiving
{
  int64_t v3 = [(PKInk *)self identifier];
  char v4 = [v3 isEqualToString:@"com.apple.ink.monoline"];

  if (v4)
  {
    int v5 = @"fixed-width";
  }
  else
  {
    char v6 = [(PKInk *)self variant];
    char v7 = [v6 isEqualToString:@"default"];

    if (v7)
    {
      int v5 = 0;
    }
    else
    {
      int v5 = [(PKInk *)self variant];
    }
  }

  return v5;
}

- (id)properties
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKInk *)self color];
  char v4 = (CGColor *)[v3 CGColor];

  long long v22 = xmmword_1C482C078;
  long long v23 = unk_1C482C088;
  if (DKUColorGetRGBAComponents(v4, &v22))
  {
    long long v5 = v22;
    long long v6 = v23;
    v20[0] = @"PKInkColorProperty";
    char v7 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)&v22, @"PKInkRedComponentProperty");
    v19[0] = v7;
    v18[1] = @"PKInkGreenComponentProperty";
    unint64_t v8 = [NSNumber numberWithDouble:*((double *)&v5 + 1)];
    v19[1] = v8;
    v18[2] = @"PKInkBlueComponentProperty";
    char v9 = [NSNumber numberWithDouble:*(double *)&v6];
    v19[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    v21[0] = v10;
    v20[1] = @"PKInkWeightProperty";
    uint64_t v11 = NSNumber;
    [(PKInk *)self weight];
    uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
    v21[1] = v12;
    v20[2] = @"PKInkOpacityProperty";
    char v13 = [NSNumber numberWithDouble:*((double *)&v6 + 1)];
    v21[2] = v13;
    v20[3] = @"PKInkVersionProperty";
    double v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKInk version](self, "version"));
    v21[3] = v14;
    v20[4] = @"PKInkVariantProperty";
    int v15 = [(PKInk *)self variant];
    v21[4] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:5];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)_supportsCombiningStrokes
{
  v2 = [(PKInk *)self behavior];
  char v3 = [v2 supportsCombiningStrokes];

  return v3;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[PKInk defaultWeightForIdentifier:v5];
  unint64_t v8 = [[PKInk alloc] initWithIdentifier:v5 color:v6 version:+[PKInk currentInkVersionForInkIdentifier:v5] variant:0 weight:v7];

  return v8;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  +[PKInk defaultWeightForIdentifier:v9];
  char v13 = [[PKInk alloc] initWithIdentifier:v9 color:v10 version:a5 variant:v11 weight:v12];

  return v13;
}

+ (PKInk)inkWithIdentifier:(id)a3 color:(id)a4 variant:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  +[PKInk defaultWeightForIdentifier:v6];
  id v9 = [[PKInk alloc] initWithIdentifier:v6 color:v7 version:1 variant:0 weight:v8];

  return v9;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  +[PKInk defaultWeightForIdentifier:v10];
  char v13 = -[PKInk initWithIdentifier:color:version:variant:weight:](self, "initWithIdentifier:color:version:variant:weight:", v10, v11, a5, v12);

  return v13;
}

- (PKInk)initWithBehavior:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  int v15 = +[PKInkManager defaultInkManager];
  uint64_t v16 = [v12 identifier];
  [v15 addInkBehavior:v12 forIdentifier:v16];

  double v17 = [v12 identifier];
  long long v18 = [(PKInk *)self initWithUncheckedIdentifier:v17 color:v13 version:a5 variant:v14 weight:a7];

  return v18;
}

+ (id)inkFromDictionary:(id)a3 color:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[PKInk currentInkVersionForInkIdentifier:v9];
  id v11 = [NSString stringWithFormat:@"%@.%lu", v9, v10];
  id v12 = [NSString stringWithFormat:@"%@.%lu.%@", v9, v10, @"default"];
  id v13 = +[PKInkParser inkBehaviorFromDictionary:identifier:version:variant:]((uint64_t)PKInkParser, v7, v11, v10, v12);
  id v14 = [[PKInk alloc] initWithIdentifier:v9 color:v8 version:v10 variant:@"default" weight:v13 behavior:-1.0];
  [(PKInk *)v14 _setupRequiredContentVersion];

  return v14;
}

+ (id)inkFromInk:(id)a3 color:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [PKInk alloc];
  id v8 = [v5 identifier];
  uint64_t v9 = [v5 version];
  uint64_t v10 = [v5 variant];
  [v5 weight];
  double v12 = v11;
  id v13 = [v5 behavior];
  id v14 = [(PKInk *)v7 initWithIdentifier:v8 color:v6 version:v9 variant:v10 weight:v13 behavior:v12];

  if ([v5 _shouldSaveRequiredContentVersionOverride]) {
    -[PKInk set_requiredContentVersionOverride:](v14, "set_requiredContentVersionOverride:", [v5 _requiredContentVersionOverride]);
  }
  -[PKInk set_weightIsUndefined:](v14, "set_weightIsUndefined:", [v5 _weightIsUndefined]);

  return v14;
}

+ (id)inkFromInk:(id)a3 weight:(double)a4
{
  id v5 = a3;
  id v6 = [PKInk alloc];
  id v7 = [v5 identifier];
  id v8 = [v5 color];
  uint64_t v9 = [v5 version];
  uint64_t v10 = [v5 variant];
  double v11 = [v5 behavior];
  double v12 = [(PKInk *)v6 initWithIdentifier:v7 color:v8 version:v9 variant:v10 weight:v11 behavior:a4];

  if ([v5 _shouldSaveRequiredContentVersionOverride]) {
    -[PKInk set_requiredContentVersionOverride:](v12, "set_requiredContentVersionOverride:", [v5 _requiredContentVersionOverride]);
  }
  -[PKInk set_weightIsUndefined:](v12, "set_weightIsUndefined:", [v5 _weightIsUndefined]);

  return v12;
}

- (PKInk)initWithIdentifier:(id)a3 color:(id)a4 version:(unint64_t)a5 variant:(id)a6 weight:(double)a7 behavior:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKInk;
  unint64_t v19 = [(PKInk *)&v30 init];
  if (v19)
  {
    if (v16)
    {
      ConvertedToSRGB = DKUCGColorCreateConvertedToSRGB([v16 CGColor]);
      uint64_t v21 = [MEMORY[0x1E4FB1618] colorWithCGColor:ConvertedToSRGB];
      color = v19->_color;
      v19->_color = (UIColor *)v21;

      CGColorRelease(ConvertedToSRGB);
    }
    else
    {
      long long v23 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v29 = 0;
        _os_log_fault_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_FAULT, "Ink must not be initialized with a nil color", v29, 2u);
      }

      uint64_t v24 = [MEMORY[0x1E4FB1618] blackColor];
      double v25 = v19->_color;
      v19->_color = (UIColor *)v24;
    }
    objc_storeStrong((id *)&v19->_identifier, a3);
    v19->_version = a5;
    uint64_t v26 = [v17 copy];
    variant = v19->_variant;
    v19->_variant = (NSString *)v26;

    objc_storeStrong((id *)&v19->_behavior, a8);
    v19->_weight = a7;
    [(PKInk *)v19 _setupDefaultSixChannelAddAndMultiplyColors];
    [(PKInk *)v19 set_requiredContentVersionOverride:[(PKInk *)v19 _requiredContentVersion]];
  }

  return v19;
}

+ (id)inkFromInk:(id)a3 withBehavior:(id)a4
{
  id v4 = a3;

  return v4;
}

+ (void)_clearCachedInks
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PKInk *)self isEqualInk:v4];

  return v5;
}

- (unint64_t)hashValueForFloat:(double)a3
{
  unint64_t v3 = vcvtmd_u64_f64(a3 * 1000.0);
  unint64_t v4 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v3 ^ (v3 >> 30))) >> 27));
  return v4 ^ (v4 >> 31);
}

- (BOOL)isEqualInk:(id)a3
{
  unint64_t v4 = (PKInk *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else if ([(PKInk *)self isEqualUnweightedInk:v4])
  {
    [(PKInk *)self weight];
    double v6 = v5;
    [(PKInk *)v4 weight];
    BOOL v8 = floor(v6 * 1000.0) == floor(v7 * 1000.0);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualUnweightedInk:(id)a3
{
  unint64_t v4 = (PKInk *)a3;
  if (self == v4) {
    goto LABEL_27;
  }
  double v5 = [(PKInk *)self identifier];
  double v6 = [(PKInk *)v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(PKInk *)self color];
    BOOL v8 = (CGColor *)[v7 CGColor];
    id v9 = [(PKInk *)v4 color];
    if (!DKUColorIsEqualToColorIgnoringOpacity(v8, (CGColor *)[v9 CGColor], 0)) {
      goto LABEL_17;
    }
    unint64_t v10 = [(PKInk *)self version];
    if (v10 != [(PKInk *)v4 version]) {
      goto LABEL_17;
    }
    [(PKInk *)self _sixChannelAddColor];
    float32x4_t v26 = v11;
    [(PKInk *)v4 _sixChannelAddColor];
    float32x4_t v13 = vsubq_f32(v26, v12);
    if (fabsf(v13.f32[0]) >= 0.01
      || fabsf(v13.f32[1]) >= 0.01
      || fabsf(v13.f32[2]) >= 0.01
      || fabsf(v13.f32[3]) >= 0.01
      || ([(PKInk *)self _sixChannelMultiplyColor],
          float32x4_t v27 = v14,
          [(PKInk *)v4 _sixChannelMultiplyColor],
          float32x4_t v16 = vsubq_f32(v27, v15),
          fabsf(v16.f32[0]) >= 0.01)
      || fabsf(v16.f32[1]) >= 0.01
      || fabsf(v16.f32[2]) >= 0.01
      || fabsf(v16.f32[3]) >= 0.01)
    {
LABEL_17:
      char v20 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int64_t v17 = [(PKInk *)self _requiredContentVersionOverride];
    uint64_t v18 = [(PKInk *)v4 _requiredContentVersionOverride];

    if (v17 != v18)
    {
      char v20 = 0;
      goto LABEL_28;
    }
    unint64_t v19 = [(PKInk *)self variant];
    if (v19)
    {

LABEL_22:
      long long v22 = [(PKInk *)self variant];
      long long v23 = [(PKInk *)v4 variant];
      id v7 = v22;
      id v24 = v23;
      if (v7 == v24)
      {
        char v20 = 1;
        id v9 = v7;
        double v6 = v7;
      }
      else
      {
        id v9 = v24;
        char v20 = 0;
        if (v7 && v24) {
          char v20 = [v7 isEqualToString:v24];
        }
        double v6 = v9;
      }
      double v5 = v7;
      goto LABEL_18;
    }
    uint64_t v21 = [(PKInk *)v4 variant];

    if (v21) {
      goto LABEL_22;
    }
LABEL_27:
    char v20 = 1;
    goto LABEL_28;
  }
  char v20 = 0;
LABEL_19:

LABEL_28:
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PKInk *)self identifier];
  uint64_t v4 = [v3 hash];
  double v5 = [(PKInk *)self color];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = [(PKInk *)self version];
  BOOL v8 = [(PKInk *)self variant];
  uint64_t v9 = [v8 hash];
  [(PKInk *)self weight];
  unint64_t v11 = [(PKInk *)self hashValueForFloat:v10 + 1.0];
  unint64_t v12 = v6 ^ v4 ^ v7 ^ v9 ^ [(PKInk *)self _requiredContentVersionOverride] ^ v11;

  return v12;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PKInk *)self identifier];
  unint64_t v7 = [(PKInk *)self color];
  BOOL v8 = [(PKInk *)self variant];
  uint64_t v9 = [v3 stringWithFormat:@"<%@ %p %@ %@ %@ %lu>", v5, self, v6, v7, v8, -[PKInk version](self, "version")];

  return v9;
}

+ (double)defaultOpacityForIdentifier:(id)a3
{
  id v3 = a3;
  double v4 = 0.5;
  if (([v3 isEqual:@"com.apple.ink.pencil"] & 1) == 0)
  {
    double v4 = 1.0;
    if (([v3 isEqual:@"com.apple.ink.pen"] & 1) == 0)
    {
      if ([v3 isEqual:@"com.apple.ink.marker"]) {
        double v4 = 0.8;
      }
      else {
        double v4 = 1.0;
      }
    }
  }

  return v4;
}

- (BOOL)_shouldSaveSixChannelAddColor
{
  float32x4_t v5 = *(float32x4_t *)self->_sixChannelAddColor;
  [(PKInk *)self _defaultSixChannelAddColor];
  float32x4_t v3 = vsubq_f32(v5, v2);
  return fabsf(v3.f32[0]) >= 0.01 || fabsf(v3.f32[1]) >= 0.01 || fabsf(v3.f32[2]) >= 0.01 || fabsf(v3.f32[3]) >= 0.01;
}

- (BOOL)_shouldSaveSixChannelMultiplyColor
{
  float32x4_t v5 = *(float32x4_t *)self->_sixChannelMultiplyColor;
  [(PKInk *)self _defaultSixChannelMultiplyColor];
  float32x4_t v3 = vsubq_f32(v5, v2);
  return fabsf(v3.f32[0]) >= 0.01 || fabsf(v3.f32[1]) >= 0.01 || fabsf(v3.f32[2]) >= 0.01 || fabsf(v3.f32[3]) >= 0.01;
}

- (BOOL)_shouldSaveRequiredContentVersionOverride
{
  int64_t v3 = [(PKInk *)self _requiredContentVersionOverride];
  return v3 > [(PKInk *)self _requiredContentVersion];
}

- (int64_t)_numPaintFramebuffers
{
  float32x4_t v2 = [(PKInk *)self behavior];
  int64_t v3 = [v2 secondaryParticleDescriptor];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unint64_t)particleRotation
{
  int64_t v3 = [(PKInk *)self behavior];
  double v4 = [v3 particleDescriptor];

  if (!v4) {
    return self && [(PKInk *)self _isFountainPenInkV2];
  }
  unint64_t v5 = [v4 particleRotation];

  return v5;
}

- (double)_weight
{
  return self->_weight;
}

- (BOOL)_isStrokeGeneratingInk
{
  float32x4_t v2 = [(PKInk *)self identifier];
  if (([v2 isEqualToString:@"com.apple.ink.lasso"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.ink.eraser"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.ink.objectEraser"] & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = [v2 isEqualToString:@"com.apple.ink.generationtool"] ^ 1;
  }

  return v3;
}

+ (id)colorForLassoStroke
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:0.466666667 green:0.466666667 blue:0.466666667 alpha:1.0];
}

- (void)_addTestDataToUnknownFields
{
}

- (id)_dataInUnknownFields
{
  ptr = self->_unknownFields.__ptr_;
  if (ptr && (int v3 = *(void **)ptr) != 0 && *v3 != v3[1])
  {
    double v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  }
  else
  {
    double v4 = [MEMORY[0x1E4F1C9B8] data];
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"identifier";
  int v3 = [(PKInk *)self identifier];
  v8[0] = v3;
  v7[1] = @"properties";
  double v4 = [(PKInk *)self properties];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)setBehavior:(id)a3
{
}

- (__n128)_sixChannelAddColor
{
  return a1[6];
}

- (void)set_sixChannelAddColor:(PKInk *)self
{
  *(_OWORD *)self->_sixChannelAddColor = v2;
}

- (__n128)_sixChannelMultiplyColor
{
  return a1[7];
}

- (void)set_sixChannelMultiplyColor:(PKInk *)self
{
  *(_OWORD *)self->_sixChannelMultiplyColor = v2;
}

- (int64_t)_requiredContentVersionOverride
{
  return self->__requiredContentVersionOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedInkWithOriginalRequiredContentVersion, 0);
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

+ (id)identifierForCommandType:(unsigned int)a3 wantsObjectErase:(BOOL)a4
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    double v4 = @"com.apple.ink.eraser";
    if (a4) {
      double v4 = @"com.apple.ink.objectEraser";
    }
    unint64_t v5 = v4;
  }
  else if (a3 > 4)
  {
    BOOL v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = a3;
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Unknown command type for ink: %d", (uint8_t *)v10, 8u);
    }

    unint64_t v5 = @"com.apple.ink.pen";
  }
  else
  {
    v11[0] = @"com.apple.ink.pencil";
    v11[1] = @"com.apple.ink.pen";
    v11[2] = @"com.apple.ink.marker";
    v11[3] = @"com.apple.ink.eraser";
    v11[4] = @"com.apple.ink.lasso";
    unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
    unint64_t v5 = [v7 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_shadowModel
{
  if ([(PKInk *)self _isMonolineInk])
  {
    int v3 = @"Micron";
  }
  else
  {
    if (qword_1EB3C63C8 != -1) {
      dispatch_once(&qword_1EB3C63C8, &__block_literal_global_99);
    }
    double v4 = (void *)_MergedGlobals_169;
    unint64_t v5 = [(PKInk *)self identifier];
    uint64_t v6 = [v4 objectForKeyedSubscript:v5];

    unint64_t v7 = @"BallpointPen3";
    if (v6) {
      unint64_t v7 = v6;
    }
    int v3 = v7;
  }

  return v3;
}

uint64_t __34__PKInk_ShadowModel___shadowModel__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v1 = (void *)_MergedGlobals_169;
  _MergedGlobals_169 = v0;

  [(id)_MergedGlobals_169 setObject:@"Highlighter" forKeyedSubscript:@"com.apple.ink.marker"];
  [(id)_MergedGlobals_169 setObject:@"FountainV3Pen" forKeyedSubscript:@"com.apple.ink.fountainpen"];
  [(id)_MergedGlobals_169 setObject:@"Crayon" forKeyedSubscript:@"com.apple.ink.crayon"];
  [(id)_MergedGlobals_169 setObject:@"Eraser" forKeyedSubscript:@"com.apple.ink.eraser"];
  [(id)_MergedGlobals_169 setObject:@"Eraser" forKeyedSubscript:@"com.apple.ink.objectEraser"];
  [(id)_MergedGlobals_169 setObject:@"WatercolorPen1" forKeyedSubscript:@"com.apple.ink.watercolor"];
  [(id)_MergedGlobals_169 setObject:@"SelectionTool" forKeyedSubscript:@"com.apple.ink.lasso"];
  [(id)_MergedGlobals_169 setObject:@"BallpointPen3" forKeyedSubscript:@"com.apple.ink.pen"];
  [(id)_MergedGlobals_169 setObject:@"BallpointPen3" forKeyedSubscript:@"com.apple.ink.handwriting"];
  [(id)_MergedGlobals_169 setObject:@"Pencil" forKeyedSubscript:@"com.apple.ink.pencil"];
  long long v2 = (void *)_MergedGlobals_169;

  return [v2 setObject:@"Wand" forKeyedSubscript:@"com.apple.ink.generationtool"];
}

@end