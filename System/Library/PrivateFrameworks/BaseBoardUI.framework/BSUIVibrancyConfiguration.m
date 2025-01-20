@interface BSUIVibrancyConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BSUIVibrancyConfiguration)blendConfiguration;
- (BSUIVibrancyConfiguration)init;
- (BSUIVibrancyConfiguration)initWithBSXPCCoder:(id)a3;
- (BSUIVibrancyConfiguration)initWithCoder:(id)a3;
- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5;
- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6;
- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6 blendConfiguration:(id)a7 blendAmount:(double)a8 alternativeVibrancyEffectLUT:(id)a9;
- (BSUIVibrancyEffectValues)effectValues;
- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT;
- (BSUIVibrancyShadowValues)shadowValues;
- (NSString)groupName;
- (UIColor)color;
- (double)blendAmount;
- (id)copyWithAlternativeVibrancyEffectLUT:(id)a3;
- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4;
- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4 alternativeVibrancyEffectLUT:(id)a5;
- (id)copyWithEffectType:(int64_t)a3 color:(id)a4;
- (id)copyWithGroupName:(id)a3;
- (id)copyWithWithBackgroundType:(int64_t)a3;
- (int64_t)backgroundType;
- (int64_t)effectType;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BSUIVibrancyConfiguration

- (BSUIVibrancyConfiguration)init
{
  v3 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.5];
  v4 = [(BSUIVibrancyConfiguration *)self initWithEffectType:0 backgroundType:0 color:v3];

  return v4;
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5
{
  return [(BSUIVibrancyConfiguration *)self initWithEffectType:a3 backgroundType:a4 color:a5 groupName:0 blendConfiguration:0 blendAmount:0 alternativeVibrancyEffectLUT:0.0];
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6
{
  return [(BSUIVibrancyConfiguration *)self initWithEffectType:a3 backgroundType:a4 color:a5 groupName:a6 blendConfiguration:0 blendAmount:0 alternativeVibrancyEffectLUT:0.0];
}

- (BSUIVibrancyConfiguration)initWithEffectType:(int64_t)a3 backgroundType:(int64_t)a4 color:(id)a5 groupName:(id)a6 blendConfiguration:(id)a7 blendAmount:(double)a8 alternativeVibrancyEffectLUT:(id)a9
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)BSUIVibrancyConfiguration;
  v20 = [(BSUIVibrancyConfiguration *)&v31 init];
  v21 = v20;
  if (v20)
  {
    v20->_effectType = a3;
    v20->_backgroundType = a4;
    uint64_t v22 = [v16 copy];
    color = v21->_color;
    v21->_color = (UIColor *)v22;

    uint64_t v24 = [v17 copy];
    groupName = v21->_groupName;
    v21->_groupName = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    blendConfiguration = v21->_blendConfiguration;
    v21->_blendConfiguration = (BSUIVibrancyConfiguration *)v26;

    v21->_blendAmount = a8;
    uint64_t v28 = [v19 copy];
    alternativeVibrancyEffectLUT = v21->_alternativeVibrancyEffectLUT;
    v21->_alternativeVibrancyEffectLUT = (BSUIVibrancyLUT *)v28;
  }
  return v21;
}

- (id)copyWithGroupName:(id)a3
{
  id v4 = a3;
  v5 = [BSUIVibrancyConfiguration alloc];
  int64_t v6 = [(BSUIVibrancyConfiguration *)self effectType];
  int64_t v7 = [(BSUIVibrancyConfiguration *)self backgroundType];
  v8 = [(BSUIVibrancyConfiguration *)self color];
  v9 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
  [(BSUIVibrancyConfiguration *)self blendAmount];
  double v11 = v10;
  v12 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  v13 = [(BSUIVibrancyConfiguration *)v5 initWithEffectType:v6 backgroundType:v7 color:v8 groupName:v4 blendConfiguration:v9 blendAmount:v12 alternativeVibrancyEffectLUT:v11];

  return v13;
}

- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4
{
  id v6 = a4;
  int64_t v7 = [BSUIVibrancyConfiguration alloc];
  int64_t v8 = [(BSUIVibrancyConfiguration *)self effectType];
  int64_t v9 = [(BSUIVibrancyConfiguration *)self backgroundType];
  double v10 = [(BSUIVibrancyConfiguration *)self color];
  double v11 = [(BSUIVibrancyConfiguration *)self groupName];
  v12 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  v13 = [(BSUIVibrancyConfiguration *)v7 initWithEffectType:v8 backgroundType:v9 color:v10 groupName:v11 blendConfiguration:v6 blendAmount:v12 alternativeVibrancyEffectLUT:a3];

  return v13;
}

- (id)copyWithBlendAmount:(double)a3 blendConfiguration:(id)a4 alternativeVibrancyEffectLUT:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [BSUIVibrancyConfiguration alloc];
  int64_t v11 = [(BSUIVibrancyConfiguration *)self effectType];
  int64_t v12 = [(BSUIVibrancyConfiguration *)self backgroundType];
  v13 = [(BSUIVibrancyConfiguration *)self color];
  v14 = [(BSUIVibrancyConfiguration *)self groupName];
  v15 = [(BSUIVibrancyConfiguration *)v10 initWithEffectType:v11 backgroundType:v12 color:v13 groupName:v14 blendConfiguration:v8 blendAmount:v9 alternativeVibrancyEffectLUT:a3];

  return v15;
}

- (id)copyWithEffectType:(int64_t)a3 color:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(BSUIVibrancyConfiguration *)self blendConfiguration];

  if (v7)
  {
    id v8 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
    id v9 = (void *)[v8 copyWithEffectType:a3 color:v6];
  }
  else
  {
    id v9 = 0;
  }
  double v10 = [BSUIVibrancyConfiguration alloc];
  int64_t v11 = [(BSUIVibrancyConfiguration *)self backgroundType];
  int64_t v12 = [(BSUIVibrancyConfiguration *)self groupName];
  [(BSUIVibrancyConfiguration *)self blendAmount];
  double v14 = v13;
  v15 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  id v16 = [(BSUIVibrancyConfiguration *)v10 initWithEffectType:a3 backgroundType:v11 color:v6 groupName:v12 blendConfiguration:v9 blendAmount:v15 alternativeVibrancyEffectLUT:v14];

  return v16;
}

- (id)copyWithWithBackgroundType:(int64_t)a3
{
  v5 = [(BSUIVibrancyConfiguration *)self blendConfiguration];

  if (v5)
  {
    id v6 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
    int64_t v7 = (void *)[v6 copyWithWithBackgroundType:a3];
  }
  else
  {
    int64_t v7 = 0;
  }
  id v8 = [BSUIVibrancyConfiguration alloc];
  int64_t v9 = [(BSUIVibrancyConfiguration *)self effectType];
  double v10 = [(BSUIVibrancyConfiguration *)self color];
  int64_t v11 = [(BSUIVibrancyConfiguration *)self groupName];
  [(BSUIVibrancyConfiguration *)self blendAmount];
  double v13 = v12;
  double v14 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  v15 = [(BSUIVibrancyConfiguration *)v8 initWithEffectType:v9 backgroundType:a3 color:v10 groupName:v11 blendConfiguration:v7 blendAmount:v14 alternativeVibrancyEffectLUT:v13];

  return v15;
}

- (id)copyWithAlternativeVibrancyEffectLUT:(id)a3
{
  id v4 = a3;
  v5 = [BSUIVibrancyConfiguration alloc];
  int64_t v6 = [(BSUIVibrancyConfiguration *)self effectType];
  int64_t v7 = [(BSUIVibrancyConfiguration *)self backgroundType];
  id v8 = [(BSUIVibrancyConfiguration *)self color];
  int64_t v9 = [(BSUIVibrancyConfiguration *)self groupName];
  double v10 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
  [(BSUIVibrancyConfiguration *)self blendAmount];
  int64_t v11 = -[BSUIVibrancyConfiguration initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:](v5, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v6, v7, v8, v9, v10, v4);

  return v11;
}

- (BSUIVibrancyEffectValues)effectValues
{
  v2 = self;
  objc_sync_enter(v2);
  effectValues = v2->_effectValues;
  if (!effectValues)
  {
    id v4 = [(BSUIVibrancyValues *)[BSUIVibrancyEffectValues alloc] initWithConfiguration:v2];
    v5 = v2->_effectValues;
    v2->_effectValues = v4;

    effectValues = v2->_effectValues;
  }
  int64_t v6 = effectValues;
  objc_sync_exit(v2);

  return v6;
}

- (BSUIVibrancyShadowValues)shadowValues
{
  v2 = self;
  objc_sync_enter(v2);
  shadowValues = v2->_shadowValues;
  if (!shadowValues)
  {
    id v4 = [(BSUIVibrancyValues *)[BSUIVibrancyShadowValues alloc] initWithConfiguration:v2];
    v5 = v2->_shadowValues;
    v2->_shadowValues = v4;

    shadowValues = v2->_shadowValues;
  }
  int64_t v6 = shadowValues;
  objc_sync_exit(v2);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSUIVibrancyConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v25 = 1;
  }
  else
  {
    int64_t v6 = v4;
    int64_t v7 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_10;
    }
    int64_t v9 = [(BSUIVibrancyConfiguration *)self color];
    double v10 = [(BSUIVibrancyConfiguration *)v6 color];
    int v11 = BSEqualObjects();

    if (!v11) {
      goto LABEL_10;
    }
    double v12 = [(BSUIVibrancyConfiguration *)self groupName];
    double v13 = [(BSUIVibrancyConfiguration *)v6 groupName];
    int v14 = BSEqualObjects();

    if (!v14) {
      goto LABEL_10;
    }
    int64_t v15 = [(BSUIVibrancyConfiguration *)self effectType];
    if (v15 != [(BSUIVibrancyConfiguration *)v6 effectType]) {
      goto LABEL_10;
    }
    int64_t v16 = [(BSUIVibrancyConfiguration *)self backgroundType];
    if (v16 != [(BSUIVibrancyConfiguration *)v6 backgroundType]) {
      goto LABEL_10;
    }
    id v17 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
    id v18 = [(BSUIVibrancyConfiguration *)v6 blendConfiguration];
    int v19 = BSEqualObjects();

    if (!v19) {
      goto LABEL_10;
    }
    [(BSUIVibrancyConfiguration *)self blendAmount];
    double v21 = v20;
    [(BSUIVibrancyConfiguration *)v6 blendAmount];
    if (v21 == v22)
    {
      v23 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
      uint64_t v24 = [(BSUIVibrancyConfiguration *)v6 alternativeVibrancyEffectLUT];
      char v25 = BSEqualObjects();
    }
    else
    {
LABEL_10:
      char v25 = 0;
    }
  }
  return v25;
}

- (unint64_t)hash
{
  v3 = [(BSUIVibrancyConfiguration *)self color];
  uint64_t v4 = [v3 hash];

  v5 = [(BSUIVibrancyConfiguration *)self groupName];
  uint64_t v6 = [v5 hash];

  int64_t v7 = [(BSUIVibrancyConfiguration *)self effectType];
  int64_t v8 = [(BSUIVibrancyConfiguration *)self backgroundType];
  int64_t v9 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
  uint64_t v10 = [v9 hash];

  [(BSUIVibrancyConfiguration *)self blendAmount];
  double v12 = v11;
  double v13 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  uint64_t v14 = [v13 hash];
  uint64_t v15 = v7 - (v6 - v4 + 32 * v4) + 32 * (v6 - v4 + 32 * v4);
  unint64_t v16 = (unint64_t)((double)(unint64_t)(31 * (v10 - (v8 - v15 + 32 * v15) + 32 * (v8 - v15 + 32 * v15))
                                                    + 887503681)
                         + v12 * 100.0);
  unint64_t v17 = v14 - v16 + 32 * v16;

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_effectType forKey:@"effectType"];
  [v5 encodeInt64:self->_backgroundType forKey:@"backgroundType"];
  [v5 encodeObject:self->_color forKey:@"color"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_blendConfiguration forKey:@"blendConfiguration"];
  double blendAmount = self->_blendAmount;
  *(float *)&double blendAmount = blendAmount;
  [v5 encodeFloat:@"blendAmount" forKey:blendAmount];
  [v5 encodeObject:self->_alternativeVibrancyEffectLUT forKey:@"alternativeVibrancyEffectLUT"];
}

- (BSUIVibrancyConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"effectType"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"backgroundType"];
  int64_t v7 = self;
  int64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"color"];

  int64_t v9 = self;
  uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"groupName"];

  double v11 = self;
  double v12 = [v4 decodeObjectOfClass:v11 forKey:@"blendConfiguration"];

  [v4 decodeFloatForKey:@"blendAmount"];
  float v14 = v13;
  uint64_t v15 = self;
  unint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"alternativeVibrancyEffectLUT"];

  unint64_t v17 = [(BSUIVibrancyConfiguration *)self initWithEffectType:v5 backgroundType:v6 color:v8 groupName:v10 blendConfiguration:v12 blendAmount:v16 alternativeVibrancyEffectLUT:v14];
  return v17;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_effectType forKey:@"effectType"];
  [v4 encodeInt64:self->_backgroundType forKey:@"backgroundType"];
  [v4 encodeObject:self->_color forKey:@"color"];
  [v4 encodeObject:self->_groupName forKey:@"groupName"];
  [v4 encodeObject:self->_blendConfiguration forKey:@"blendConfiguration"];
  [v4 encodeDouble:@"blendAmount" forKey:self->_blendAmount];
  [v4 encodeObject:self->_alternativeVibrancyEffectLUT forKey:@"alternativeVibrancyEffectLUT"];
}

- (BSUIVibrancyConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"effectType"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"backgroundType"];
  int64_t v7 = self;
  int64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"color"];

  int64_t v9 = self;
  uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"groupName"];

  double v11 = self;
  double v12 = [v4 decodeObjectOfClass:v11 forKey:@"blendConfiguration"];

  [v4 decodeDoubleForKey:@"blendAmount"];
  double v14 = v13;
  uint64_t v15 = self;
  unint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"alternativeVibrancyEffectLUT"];

  unint64_t v17 = [(BSUIVibrancyConfiguration *)self initWithEffectType:v5 backgroundType:v6 color:v8 groupName:v10 blendConfiguration:v12 blendAmount:v16 alternativeVibrancyEffectLUT:v14];
  return v17;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v15 = a3;
  id v4 = (id)objc_msgSend(v15, "appendInt64:withName:", -[BSUIVibrancyConfiguration effectType](self, "effectType"), @"effectType");
  id v5 = (id)objc_msgSend(v15, "appendInt64:withName:", -[BSUIVibrancyConfiguration backgroundType](self, "backgroundType"), @"backgroundType");
  uint64_t v6 = [(BSUIVibrancyConfiguration *)self color];
  id v7 = (id)[v15 appendObject:v6 withName:@"color"];

  int64_t v8 = [(BSUIVibrancyConfiguration *)self groupName];
  id v9 = (id)[v15 appendObject:v8 withName:@"groupName"];

  uint64_t v10 = [(BSUIVibrancyConfiguration *)self blendConfiguration];
  id v11 = (id)[v15 appendObject:v10 withName:@"blendConfiguration"];

  [(BSUIVibrancyConfiguration *)self blendAmount];
  id v12 = (id)objc_msgSend(v15, "appendFloat:withName:", @"blendAmount");
  double v13 = [(BSUIVibrancyConfiguration *)self alternativeVibrancyEffectLUT];
  id v14 = (id)[v15 appendObject:v13 withName:@"alternativeVibrancyEffectLUT"];
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (int64_t)effectType
{
  return self->_effectType;
}

- (int64_t)backgroundType
{
  return self->_backgroundType;
}

- (BSUIVibrancyConfiguration)blendConfiguration
{
  return self->_blendConfiguration;
}

- (double)blendAmount
{
  return self->_blendAmount;
}

- (BSUIVibrancyLUT)alternativeVibrancyEffectLUT
{
  return self->_alternativeVibrancyEffectLUT;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeVibrancyEffectLUT, 0);
  objc_storeStrong((id *)&self->_blendConfiguration, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_effectValues, 0);

  objc_storeStrong((id *)&self->_shadowValues, 0);
}

@end