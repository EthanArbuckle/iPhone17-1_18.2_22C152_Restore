@interface BKSMousePointerDevicePreferences
+ (BOOL)supportsSecureCoding;
+ (id)defaultPreferencesForHardwareType:(int64_t)a3;
+ (id)protobufSchema;
- (BKSMousePointerDevicePreferences)init;
- (BKSMousePointerDevicePreferences)initWithCoder:(id)a3;
- (BOOL)enableNaturalScrolling;
- (BOOL)enableTapToClick;
- (BOOL)enableTwoFingerSecondaryClick;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (float)pointerAccelerationFactor;
- (float)scrollAccelerationFactor;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (int64_t)buttonConfigurationForHardwareButtonMice;
- (int64_t)buttonConfigurationForVirtualButtonMice;
- (int64_t)clickHapticStrength;
- (int64_t)doubleTapDragMode;
- (unint64_t)hash;
- (void)_fixMissingButtonConfigurations;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonConfigurationForHardwareButtonMice:(int64_t)a3;
- (void)setButtonConfigurationForVirtualButtonMice:(int64_t)a3;
- (void)setClickHapticStrength:(int64_t)a3;
- (void)setDoubleTapDragMode:(int64_t)a3;
- (void)setEnableNaturalScrolling:(BOOL)a3;
- (void)setEnableTapToClick:(BOOL)a3;
- (void)setEnableTwoFingerSecondaryClick:(BOOL)a3;
- (void)setPointerAccelerationFactor:(float)a3;
- (void)setScrollAccelerationFactor:(float)a3;
@end

@implementation BKSMousePointerDevicePreferences

- (void)setButtonConfigurationForVirtualButtonMice:(int64_t)a3
{
  self->_buttonConfigurationForVirtualButtonMice = a3;
}

- (int64_t)buttonConfigurationForVirtualButtonMice
{
  return self->_buttonConfigurationForVirtualButtonMice;
}

- (void)setButtonConfigurationForHardwareButtonMice:(int64_t)a3
{
  self->_buttonConfigurationForHardwareButtonMice = a3;
}

- (int64_t)buttonConfigurationForHardwareButtonMice
{
  return self->_buttonConfigurationForHardwareButtonMice;
}

- (void)setDoubleTapDragMode:(int64_t)a3
{
  self->_doubleTapDragMode = a3;
}

- (int64_t)doubleTapDragMode
{
  return self->_doubleTapDragMode;
}

- (void)setClickHapticStrength:(int64_t)a3
{
  self->_clickHapticStrength = a3;
}

- (int64_t)clickHapticStrength
{
  return self->_clickHapticStrength;
}

- (void)setEnableTwoFingerSecondaryClick:(BOOL)a3
{
  self->_enableTwoFingerSecondaryClick = a3;
}

- (BOOL)enableTwoFingerSecondaryClick
{
  return self->_enableTwoFingerSecondaryClick;
}

- (void)setEnableTapToClick:(BOOL)a3
{
  self->_enableTapToClick = a3;
}

- (BOOL)enableTapToClick
{
  return self->_enableTapToClick;
}

- (void)setEnableNaturalScrolling:(BOOL)a3
{
  self->_enableNaturalScrolling = a3;
}

- (BOOL)enableNaturalScrolling
{
  return self->_enableNaturalScrolling;
}

- (void)setScrollAccelerationFactor:(float)a3
{
  self->_scrollAccelerationFactor = a3;
}

- (float)scrollAccelerationFactor
{
  return self->_scrollAccelerationFactor;
}

- (void)setPointerAccelerationFactor:(float)a3
{
  self->_pointerAccelerationFactor = a3;
}

- (float)pointerAccelerationFactor
{
  return self->_pointerAccelerationFactor;
}

- (void)_fixMissingButtonConfigurations
{
  if (!self->_buttonConfigurationForVirtualButtonMice) {
    self->_buttonConfigurationForVirtualButtonMice = 1;
  }
  if (!self->_buttonConfigurationForHardwareButtonMice) {
    self->_buttonConfigurationForHardwareButtonMice = 2;
  }
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v7.receiver = self;
  v7.super_class = (Class)BKSMousePointerDevicePreferences;
  v4 = [(BKSMousePointerDevicePreferences *)&v7 description];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@" ptrAccel:%g scrollAceel:%g enableTapToClick:%d enableTwoFingerSecondaryClick:%d doubleTapDragMode:%d enableNaturalScrolling:%d virtualButtonConfig:%d, hardwareButtonConfig:%d", self->_pointerAccelerationFactor, self->_scrollAccelerationFactor, self->_enableTapToClick, self->_enableTwoFingerSecondaryClick, self->_doubleTapDragMode, self->_enableNaturalScrolling, self->_buttonConfigurationForVirtualButtonMice, self->_buttonConfigurationForHardwareButtonMice];
  objc_msgSend(v5, "appendFormat:", @" clickHapticStrength:%d", self->_clickHapticStrength);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKSMousePointerDevicePreferences *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && self->_pointerAccelerationFactor == v4->_pointerAccelerationFactor
      && self->_scrollAccelerationFactor == v4->_scrollAccelerationFactor
      && self->_enableTapToClick == v4->_enableTapToClick
      && self->_enableTwoFingerSecondaryClick == v4->_enableTwoFingerSecondaryClick
      && self->_clickHapticStrength == v4->_clickHapticStrength
      && self->_enableNaturalScrolling == v4->_enableNaturalScrolling
      && self->_doubleTapDragMode == v4->_doubleTapDragMode
      && self->_buttonConfigurationForVirtualButtonMice == v4->_buttonConfigurationForVirtualButtonMice
      && self->_buttonConfigurationForHardwareButtonMice == v4->_buttonConfigurationForHardwareButtonMice;
  }

  return v6;
}

- (unint64_t)hash
{
  *(float *)&double v2 = self->_pointerAccelerationFactor;
  id v3 = [NSNumber numberWithFloat:v2];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  [(BKSMousePointerDevicePreferences *)self _fixMissingButtonConfigurations];
  return self;
}

- (BKSMousePointerDevicePreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKSMousePointerDevicePreferences *)self init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"t:1"];
    v5->_pointerAccelerationFactor = v6;
    [v4 decodeFloatForKey:@"t:2"];
    v5->_scrollAccelerationFactor = v7;
    v5->_enableTapToClick = [v4 decodeBoolForKey:@"t:3"];
    v5->_enableTwoFingerSecondaryClick = [v4 decodeBoolForKey:@"t:4"];
    v5->_doubleTapDragMode = [v4 decodeIntegerForKey:@"t:8"];
    v5->_buttonConfigurationForVirtualButtonMice = [v4 decodeIntegerForKey:@"t:6"];
    v5->_buttonConfigurationForHardwareButtonMice = [v4 decodeIntegerForKey:@"t:7"];
    if ([v4 containsValueForKey:@"t:5"]) {
      v5->_enableNaturalScrolling = [v4 decodeBoolForKey:@"t:5"];
    }
    if ([v4 containsValueForKey:@"t:9"]) {
      v5->_clickHapticStrength = [v4 decodeIntegerForKey:@"t:9"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float pointerAccelerationFactor = self->_pointerAccelerationFactor;
  id v5 = a3;
  *(float *)&double v6 = pointerAccelerationFactor;
  [v5 encodeFloat:@"t:1" forKey:v6];
  *(float *)&double v7 = self->_scrollAccelerationFactor;
  [v5 encodeFloat:@"t:2" forKey:v7];
  [v5 encodeBool:self->_enableTapToClick forKey:@"t:3"];
  [v5 encodeBool:self->_enableTwoFingerSecondaryClick forKey:@"t:4"];
  [v5 encodeInteger:self->_doubleTapDragMode forKey:@"t:8"];
  [v5 encodeBool:self->_enableNaturalScrolling forKey:@"t:5"];
  [v5 encodeInteger:self->_buttonConfigurationForVirtualButtonMice forKey:@"t:6"];
  [v5 encodeInteger:self->_buttonConfigurationForHardwareButtonMice forKey:@"t:7"];
  [v5 encodeInteger:self->_clickHapticStrength forKey:@"t:9"];

  [(BKSMousePointerDevicePreferences *)self _fixMissingButtonConfigurations];
}

- (BKSMousePointerDevicePreferences)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSMousePointerDevicePreferences;
  result = [(BKSMousePointerDevicePreferences *)&v3 init];
  if (result)
  {
    *(void *)&result->_float pointerAccelerationFactor = 0x3EA000003F800000;
    result->_enableTwoFingerSecondaryClick = 1;
    *(_WORD *)&result->_enableNaturalScrolling = 1;
    result->_clickHapticStrength = 0;
    result->_doubleTapDragMode = 0;
  }
  return result;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_6564 != -1) {
    dispatch_once(&protobufSchema_onceToken_6564, block);
  }
  double v2 = (void *)protobufSchema_schema_6565;
  return v2;
}

uint64_t __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_6567];
  uint64_t v2 = protobufSchema_schema_6565;
  protobufSchema_schema_6565 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __50__BKSMousePointerDevicePreferences_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_pointerAccelerationFactor" forTag:1];
  [v2 addField:"_scrollAccelerationFactor" forTag:2];
  [v2 addField:"_enableTapToClick" forTag:3];
  [v2 addField:"_enableTwoFingerSecondaryClick" forTag:4];
  [v2 addField:"_enableNaturalScrolling" forTag:5];
  [v2 addField:"_buttonConfigurationForVirtualButtonMice" forTag:6];
  [v2 addField:"_buttonConfigurationForHardwareButtonMice" forTag:7];
  [v2 addField:"_doubleTapDragMode" forTag:8];
  [v2 addField:"_clickHapticStrength" forTag:9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultPreferencesForHardwareType:(int64_t)a3
{
  id v4 = objc_alloc_init(BKSMousePointerDevicePreferences);
  [(BKSMousePointerDevicePreferences *)v4 setButtonConfigurationForVirtualButtonMice:1];
  [(BKSMousePointerDevicePreferences *)v4 setButtonConfigurationForHardwareButtonMice:2];
  [(BKSMousePointerDevicePreferences *)v4 setClickHapticStrength:0];
  LODWORD(v5) = 1.0;
  [(BKSMousePointerDevicePreferences *)v4 setPointerAccelerationFactor:v5];
  LODWORD(v6) = 0.3125;
  [(BKSMousePointerDevicePreferences *)v4 setScrollAccelerationFactor:v6];
  [(BKSMousePointerDevicePreferences *)v4 setEnableTapToClick:0];
  [(BKSMousePointerDevicePreferences *)v4 setEnableTwoFingerSecondaryClick:a3 == 9];
  [(BKSMousePointerDevicePreferences *)v4 setDoubleTapDragMode:0];
  [(BKSMousePointerDevicePreferences *)v4 setEnableNaturalScrolling:1];
  return v4;
}

@end