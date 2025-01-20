@interface BKSButtonHapticsDefinition
+ (BOOL)supportsSecureCoding;
+ (id)definitionForHomeButton;
- (BKSButtonHapticsDefinition)init;
- (BKSButtonHapticsDefinition)initWithCoder:(id)a3;
- (BOOL)representsHomeButton;
- (BSSettings)_BSSettings;
- (double)maximumLongPressTimeInterval;
- (double)maximumMultiplePressTimeInterval;
- (double)minimumLongPressTimeInterval;
- (double)minimumMultiplePressTimeInterval;
- (id)_initWithBSSettings:(id)a3;
- (id)description;
- (int64_t)clickHapticAssetType;
- (int64_t)isLongPressEnabled;
- (int64_t)maximumPressCount;
- (int64_t)maximumTapCount;
- (void)encodeWithCoder:(id)a3;
- (void)setClickHapticAssetType:(int64_t)a3;
- (void)setMaximumLongPressTimeInterval:(double)a3;
- (void)setMaximumMultiplePressTimeInterval:(double)a3;
- (void)setMaximumPressCount:(int64_t)a3;
- (void)setMaximumTapCount:(int64_t)a3;
- (void)setMinimumLongPressTimeInterval:(double)a3;
- (void)setMinimumMultiplePressTimeInterval:(double)a3;
- (void)setRepresentsHomeButton:(BOOL)a3;
- (void)updateFromDefinition:(id)a3 withChangeInspectorBlock:(id)a4;
@end

@implementation BKSButtonHapticsDefinition

- (void).cxx_destruct
{
}

- (void)setRepresentsHomeButton:(BOOL)a3
{
  self->_representsHomeButton = a3;
}

- (BOOL)representsHomeButton
{
  return self->_representsHomeButton;
}

- (BSSettings)_BSSettings
{
  return self->_settings;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(BKSButtonHapticsDefinition *)self minimumMultiplePressTimeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minimumMultiplePressTimeInterval");
  [(BKSButtonHapticsDefinition *)self maximumMultiplePressTimeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maximumMultiplePressTimeInterval");
  [(BKSButtonHapticsDefinition *)self minimumLongPressTimeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minimumLongPressTimeInterval");
  [(BKSButtonHapticsDefinition *)self maximumLongPressTimeInterval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maximumLongPressTimeInterval");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition maximumTapCount](self, "maximumTapCount"), @"maximumTapCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition maximumPressCount](self, "maximumPressCount"), @"maximumPressCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BKSButtonHapticsDefinition clickHapticAssetType](self, "clickHapticAssetType"), @"clickHapticAssetType");
  [v4 encodeBool:self->_representsHomeButton forKey:@"representsHomeButton"];
}

- (BKSButtonHapticsDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BKSButtonHapticsDefinition *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"minimumMultiplePressTimeInterval"];
    -[BKSButtonHapticsDefinition setMinimumMultiplePressTimeInterval:](v5, "setMinimumMultiplePressTimeInterval:");
    [v4 decodeDoubleForKey:@"maximumMultiplePressTimeInterval"];
    -[BKSButtonHapticsDefinition setMaximumMultiplePressTimeInterval:](v5, "setMaximumMultiplePressTimeInterval:");
    [v4 decodeDoubleForKey:@"minimumLongPressTimeInterval"];
    -[BKSButtonHapticsDefinition setMinimumLongPressTimeInterval:](v5, "setMinimumLongPressTimeInterval:");
    [v4 decodeDoubleForKey:@"maximumLongPressTimeInterval"];
    -[BKSButtonHapticsDefinition setMaximumLongPressTimeInterval:](v5, "setMaximumLongPressTimeInterval:");
    -[BKSButtonHapticsDefinition setMaximumTapCount:](v5, "setMaximumTapCount:", [v4 decodeIntegerForKey:@"maximumTapCount"]);
    -[BKSButtonHapticsDefinition setMaximumPressCount:](v5, "setMaximumPressCount:", [v4 decodeIntegerForKey:@"maximumPressCount"]);
    -[BKSButtonHapticsDefinition setClickHapticAssetType:](v5, "setClickHapticAssetType:", [v4 decodeIntegerForKey:@"clickHapticAssetType"]);
    v5->_representsHomeButton = [v4 decodeBoolForKey:@"representsHomeButton"];
  }

  return v5;
}

- (void)updateFromDefinition:(id)a3 withChangeInspectorBlock:(id)a4
{
  id v6 = a4;
  v7 = self->_settings;
  v8 = [a3 _BSSettings];
  v9 = [MEMORY[0x1E4F4F828] diffFromSettings:v7 toSettings:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__BKSButtonHapticsDefinition_updateFromDefinition_withChangeInspectorBlock___block_invoke;
  v13[3] = &unk_1E54414F8;
  v15 = v7;
  id v16 = v6;
  id v14 = v8;
  v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v9 inspectChangesWithBlock:v13];
}

uint64_t __76__BKSButtonHapticsDefinition_updateFromDefinition_withChangeInspectorBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForSetting:a2];
  if (v4)
  {
    uint64_t v6 = v4;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) setObject:v6 forSetting:a2];
  }
  return MEMORY[0x1F4181820]();
}

- (void)setClickHapticAssetType:(int64_t)a3
{
  if (a3 < 0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 230, @"Invalid parameter not satisfying: %@", @"assetType >= BKSButtonHapticAssetTypeUndefined" object file lineNumber description];

    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_5:
  id v8 = (id)v5;
  [(BSMutableSettings *)self->_settings setObject:v5 forSetting:16];
}

- (int64_t)clickHapticAssetType
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:16];
  v3 = v2;
  if (v2 && [v2 integerValue]) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)isLongPressEnabled
{
  [(BKSButtonHapticsDefinition *)self minimumLongPressTimeInterval];
  double v4 = v3;
  [(BKSButtonHapticsDefinition *)self maximumLongPressTimeInterval];
  int64_t v6 = v5 > 0.0 || v4 > 0.0;
  if (v5 < 0.0 && v4 < 0.0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

- (void)setMaximumLongPressTimeInterval:(double)a3
{
  if (a3 > 30.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 195, @"Invalid parameter not satisfying: %@", @"longPressTimeInterval <= BK_MAX_TIMEOUT_SECONDS" object file lineNumber description];
  }
  if (a3 < -1.0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 196, @"Invalid parameter not satisfying: %@", @"longPressTimeInterval >= BKSButtonDefinitionUnspecifiedValue" object file lineNumber description];
  }
  if (a3 == -1.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
  }
  id v9 = (id)v6;
  [(BSMutableSettings *)self->_settings setObject:v6 forSetting:15];
}

- (double)maximumLongPressTimeInterval
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:15];
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)setMinimumLongPressTimeInterval:(double)a3
{
  if (a3 > 30.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 178, @"Invalid parameter not satisfying: %@", @"longPressTimeInterval <= BK_MAX_TIMEOUT_SECONDS" object file lineNumber description];
  }
  if (a3 < -1.0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 179, @"Invalid parameter not satisfying: %@", @"longPressTimeInterval >= BKSButtonDefinitionUnspecifiedValue" object file lineNumber description];
  }
  if (a3 == -1.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
  }
  id v9 = (id)v6;
  [(BSMutableSettings *)self->_settings setObject:v6 forSetting:14];
}

- (double)minimumLongPressTimeInterval
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:14];
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)setMaximumMultiplePressTimeInterval:(double)a3
{
  if (a3 > 30.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 161, @"Invalid parameter not satisfying: %@", @"multiplePressTimeInterval <= BK_MAX_TIMEOUT_SECONDS" object file lineNumber description];
  }
  if (a3 < -1.0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 162, @"Invalid parameter not satisfying: %@", @"multiplePressTimeInterval >= BKSButtonDefinitionUnspecifiedValue" object file lineNumber description];
  }
  if (a3 == -1.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
  }
  id v9 = (id)v6;
  [(BSMutableSettings *)self->_settings setObject:v6 forSetting:13];
}

- (double)maximumMultiplePressTimeInterval
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:13];
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)setMinimumMultiplePressTimeInterval:(double)a3
{
  if (a3 > 30.0)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 144, @"Invalid parameter not satisfying: %@", @"multiplePressTimeInterval <= BK_MAX_TIMEOUT_SECONDS" object file lineNumber description];
  }
  if (a3 < -1.0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 145, @"Invalid parameter not satisfying: %@", @"multiplePressTimeInterval >= BKSButtonDefinitionUnspecifiedValue" object file lineNumber description];
  }
  if (a3 == -1.0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [NSNumber numberWithDouble:a3];
  }
  id v9 = (id)v6;
  [(BSMutableSettings *)self->_settings setObject:v6 forSetting:12];
}

- (double)minimumMultiplePressTimeInterval
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:12];
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = -1.0;
  }

  return v5;
}

- (void)setMaximumPressCount:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3 == -1)
    {
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 129, @"Invalid parameter not satisfying: %@", @"maximumPressCount == BKSButtonDefinitionUnspecifiedValue || (maximumPressCount >= 1 && maximumPressCount <= BKSButtonDefinitionMaximumSupportedPressCount)" object file lineNumber description];
  }
  uint64_t v5 = [NSNumber numberWithInteger:a3];
LABEL_6:
  id v8 = (id)v5;
  [(BSMutableSettings *)self->_settings setObject:v5 forSetting:10];
}

- (int64_t)maximumPressCount
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:10];
  double v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setMaximumTapCount:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFALL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BKSButtonHapticsDefinition.m", 114, @"Invalid parameter not satisfying: %@", @"maximumTapCount == BKSButtonDefinitionUnspecifiedValue || (maximumTapCount >= 0 && maximumTapCount <= BKSButtonDefinitionMaximumSupportedPressCount)" object file lineNumber description];

    goto LABEL_3;
  }
  if (a3 != -1)
  {
LABEL_3:
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_5:
  id v8 = (id)v5;
  [(BSMutableSettings *)self->_settings setObject:v5 forSetting:11];
}

- (int64_t)maximumTapCount
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:11];
  double v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_representsHomeButton withName:@"representsHomeButton"];
  id v5 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition maximumTapCount](self, "maximumTapCount"), @"maximumTapCount");
  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition maximumPressCount](self, "maximumPressCount"), @"maximumPressCount");
  [(BKSButtonHapticsDefinition *)self minimumMultiplePressTimeInterval];
  id v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"minimumMultiplePressTimeInterval", 2);
  [(BKSButtonHapticsDefinition *)self maximumMultiplePressTimeInterval];
  id v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"maximumMultiplePressTimeInterval", 2);
  [(BKSButtonHapticsDefinition *)self minimumLongPressTimeInterval];
  id v9 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"minimumLongPressTimeInterval", 2);
  [(BKSButtonHapticsDefinition *)self maximumLongPressTimeInterval];
  id v10 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"maximumLongPressTimeInterval", 2);
  id v11 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BKSButtonHapticsDefinition clickHapticAssetType](self, "clickHapticAssetType"), @"clickHapticAssetType");
  id v12 = [v3 build];

  return v12;
}

- (BKSButtonHapticsDefinition)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKSButtonHapticsDefinition;
  v2 = [(BKSButtonHapticsDefinition *)&v6 init];
  if (v2)
  {
    double v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    settings = v2->_settings;
    v2->_settings = v3;
  }
  return v2;
}

- (id)_initWithBSSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSButtonHapticsDefinition;
  id v5 = [(BKSButtonHapticsDefinition *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)definitionForHomeButton
{
  v2 = objc_alloc_init(BKSButtonHapticsDefinition);
  [(BKSButtonHapticsDefinition *)v2 setRepresentsHomeButton:1];
  return v2;
}

@end