@interface SKFieldNode
+ (BOOL)supportsSecureCoding;
+ (SKFieldNode)customFieldWithEvaluationBlock:(SKFieldForceEvaluator)block;
+ (SKFieldNode)dragField;
+ (SKFieldNode)electricField;
+ (SKFieldNode)linearGravityFieldWithVector:(vector_float3)direction;
+ (SKFieldNode)magneticField;
+ (SKFieldNode)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (SKFieldNode)radialGravityField;
+ (SKFieldNode)springField;
+ (SKFieldNode)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (SKFieldNode)velocityFieldWithTexture:(SKTexture *)velocityTexture;
+ (SKFieldNode)velocityFieldWithVector:(vector_float3)direction;
+ (SKFieldNode)vortexField;
- (BOOL)isEnabled;
- (BOOL)isEqualToNode:(id)a3;
- (BOOL)isExclusive;
- (SKFieldNode)init;
- (SKFieldNode)initWithCoder:(id)a3;
- (SKFieldNode)initWithCoder:(id)a3 field:(id)a4;
- (SKRegion)region;
- (SKTexture)texture;
- (float)animationSpeed;
- (float)falloff;
- (float)minimumRadius;
- (float)smoothness;
- (float)strength;
- (id)_descriptionClassName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)field;
- (uint32_t)categoryBitMask;
- (vector_float3)direction;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationSpeed:(float)animationSpeed;
- (void)setCategoryBitMask:(uint32_t)categoryBitMask;
- (void)setDirection:(vector_float3)direction;
- (void)setEnabled:(BOOL)enabled;
- (void)setExclusive:(BOOL)exclusive;
- (void)setFalloff:(float)falloff;
- (void)setMinimumRadius:(float)minimumRadius;
- (void)setPhysicsField:(id)a3;
- (void)setRegion:(SKRegion *)region;
- (void)setSmoothness:(float)smoothness;
- (void)setStrength:(float)strength;
- (void)setTexture:(SKTexture *)texture;
@end

@implementation SKFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setPhysicsField:(id)a3
{
  id v5 = a3;
  v6 = [(SKNode *)self scene];
  p_field = &self->_field;
  field = self->_field;
  if (field)
  {
    [(PKPhysicsField *)field setRepresentedObject:0];
    if (v6)
    {
      v9 = [v6 physicsWorld];
      [v9 removeField:*p_field];
    }
  }
  objc_storeStrong((id *)&self->_field, a3);
  if (v5)
  {
    [v5 setRepresentedObject:self];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    SKCNode::resolveWorldPositionRotationAndScale((_OWORD *)self->super._skcNode, &v14, &v13, &v12);
    [(PKPhysicsField *)*p_field setPosition:*(double *)&v14];
    LODWORD(v10) = DWORD2(v13);
    [(PKPhysicsField *)*p_field setRotation:v10];
    [(PKPhysicsField *)*p_field setScale:*(double *)&v12];
    if (v6)
    {
      v11 = [v6 physicsWorld];
      [v11 addField:v5];
    }
  }
}

- (id)field
{
  return self->_field;
}

- (uint32_t)categoryBitMask
{
  return [(PKPhysicsField *)self->_field categoryBitMask];
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
}

- (vector_float3)direction
{
  uint64_t v2 = [(PKPhysicsField *)self->_field direction];
  result.i64[1] = v3;
  result.i64[0] = v2;
  return result;
}

- (void)setDirection:(vector_float3)direction
{
}

- (float)smoothness
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return self->_smoothness;
  }
  field = self->_field;

  [(PKPhysicsField *)field smoothness];
  return result;
}

- (void)setSmoothness:(float)smoothness
{
  if (objc_opt_respondsToSelector())
  {
    field = self->_field;
    *(float *)&double v5 = smoothness;
    [(PKPhysicsField *)field setSmoothness:v5];
  }
  else
  {
    self->_smoothness = smoothness;
  }
}

- (float)animationSpeed
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return self->_animationSpeed;
  }
  field = self->_field;

  [(PKPhysicsField *)field animationSpeed];
  return result;
}

- (void)setAnimationSpeed:(float)animationSpeed
{
  if (objc_opt_respondsToSelector())
  {
    field = self->_field;
    *(float *)&double v5 = animationSpeed;
    [(PKPhysicsField *)field setAnimationSpeed:v5];
  }
  else
  {
    self->_animationSpeed = animationSpeed;
  }
}

- (SKTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(SKTexture *)texture
{
  v8 = texture;
  if (objc_opt_respondsToSelector())
  {
    v4 = self->_field;
    LODWORD(v5) = 1.0;
    v6 = +[SKPhysicsGrid vectorGridFromTexture:v8 accuracy:v5];
    [(PKPhysicsField *)v4 setGrid:v6];
  }
  else
  {
    v7 = v8;
    v4 = (PKPhysicsField *)self->_texture;
    self->_texture = v7;
  }
}

- (SKFieldNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKFieldNode;
  uint64_t v2 = [(SKNode *)&v6 init];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 1.0;
    [(SKFieldNode *)v2 setStrength:v3];
  }
  return v4;
}

- (id)_descriptionClassName
{
  return @"SKFieldNode";
}

- (SKFieldNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKFieldNode;
  double v5 = [(SKNode *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_region"];
    [(SKFieldNode *)v5 setRegion:v6];

    [v4 decodeFloatForKey:@"_strength"];
    -[SKFieldNode setStrength:](v5, "setStrength:");
    [v4 decodeFloatForKey:@"_falloff"];
    -[SKFieldNode setFalloff:](v5, "setFalloff:");
    [v4 decodeFloatForKey:@"_minimumRadius"];
    -[SKFieldNode setMinimumRadius:](v5, "setMinimumRadius:");
    -[SKFieldNode setEnabled:](v5, "setEnabled:", [v4 decodeBoolForKey:@"_active"]);
    -[SKFieldNode setExclusive:](v5, "setExclusive:", [v4 decodeBoolForKey:@"_exclusive"]);
    -[SKFieldNode setCategoryBitMask:](v5, "setCategoryBitMask:", [v4 decodeInt32ForKey:@"_categoryBitMask"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_direction"];
    [(SKFieldNode *)v5 setDirection:createV3fFromData(v7).n128_f64[0]];

    [v4 decodeFloatForKey:@"_smoothness"];
    -[SKFieldNode setSmoothness:](v5, "setSmoothness:");
    [v4 decodeFloatForKey:@"_animationSpeed"];
    -[SKFieldNode setAnimationSpeed:](v5, "setAnimationSpeed:");
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_texture"];
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = v5->_field;
      LODWORD(v10) = 1.0;
      v11 = +[SKPhysicsGrid vectorGridFromTexture:v8 accuracy:v10];
      [(PKPhysicsField *)v9 setGrid:v11];
    }
  }

  return v5;
}

- (SKFieldNode)initWithCoder:(id)a3 field:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKFieldNode;
  v8 = [(SKNode *)&v18 initWithCoder:v6];
  v9 = v8;
  if (v8)
  {
    p_field = (id *)&v8->_field;
    objc_storeStrong((id *)&v8->_field, a4);
    [(SKFieldNode *)v9 setPhysicsField:*p_field];
    v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_region"];
    [(SKFieldNode *)v9 setRegion:v11];

    [v6 decodeFloatForKey:@"_strength"];
    -[SKFieldNode setStrength:](v9, "setStrength:");
    [v6 decodeFloatForKey:@"_falloff"];
    -[SKFieldNode setFalloff:](v9, "setFalloff:");
    [v6 decodeFloatForKey:@"_minimumRadius"];
    -[SKFieldNode setMinimumRadius:](v9, "setMinimumRadius:");
    -[SKFieldNode setEnabled:](v9, "setEnabled:", [v6 decodeBoolForKey:@"_active"]);
    -[SKFieldNode setExclusive:](v9, "setExclusive:", [v6 decodeBoolForKey:@"_exclusive"]);
    -[SKFieldNode setCategoryBitMask:](v9, "setCategoryBitMask:", [v6 decodeInt32ForKey:@"_categoryBitMask"]);
    long long v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_direction"];
    [(SKFieldNode *)v9 setDirection:createV3fFromData(v12).n128_f64[0]];

    [v6 decodeFloatForKey:@"_smoothness"];
    -[SKFieldNode setSmoothness:](v9, "setSmoothness:");
    [v6 decodeFloatForKey:@"_animationSpeed"];
    -[SKFieldNode setAnimationSpeed:](v9, "setAnimationSpeed:");
    objc_super v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_texture"];
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v14 = *p_field;
      LODWORD(v15) = 1.0;
      v16 = +[SKPhysicsGrid vectorGridFromTexture:v13 accuracy:v15];
      [v14 setGrid:v16];
    }
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKFieldNode;
  [(SKNode *)&v14 encodeWithCoder:v4];
  double v5 = [(SKFieldNode *)self region];

  if (v5)
  {
    id v6 = [(SKFieldNode *)self region];
    [v4 encodeObject:v6 forKey:@"_region"];
  }
  [(SKFieldNode *)self strength];
  objc_msgSend(v4, "encodeFloat:forKey:", @"_strength");
  [(SKFieldNode *)self falloff];
  objc_msgSend(v4, "encodeFloat:forKey:", @"_falloff");
  [(SKFieldNode *)self minimumRadius];
  objc_msgSend(v4, "encodeFloat:forKey:", @"_minimumRadius");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKFieldNode isEnabled](self, "isEnabled"), @"_active");
  objc_msgSend(v4, "encodeBool:forKey:", -[SKFieldNode isExclusive](self, "isExclusive"), @"_exclusive");
  objc_msgSend(v4, "encodeInt32:forKey:", -[SKFieldNode categoryBitMask](self, "categoryBitMask"), @"_categoryBitMask");
  [(SKFieldNode *)self direction];
  long long v12 = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:12];
  for (int i = 0; i != 3; ++i)
  {
    long long v13 = v12;
    unsigned int v15 = bswap32(*(_DWORD *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3))));
    objc_msgSend(v8, "appendBytes:length:", &v15, 4, v12, v12);
  }
  [v4 encodeObject:v8 forKey:@"_direction"];

  [(SKFieldNode *)self smoothness];
  objc_msgSend(v4, "encodeFloat:forKey:", @"_smoothness");
  [(SKFieldNode *)self animationSpeed];
  objc_msgSend(v4, "encodeFloat:forKey:", @"_animationSpeed");
  double v10 = [(SKFieldNode *)self texture];

  if (v10)
  {
    v11 = [(SKFieldNode *)self texture];
    [v4 encodeObject:v11 forKey:@"_texture"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKFieldNode;
  id v4 = [(SKNode *)&v7 copyWithZone:a3];
  double v5 = [(SKFieldNode *)self region];
  [v4 setRegion:v5];

  [(SKFieldNode *)self strength];
  objc_msgSend(v4, "setStrength:");
  [(SKFieldNode *)self falloff];
  objc_msgSend(v4, "setFalloff:");
  [(SKFieldNode *)self minimumRadius];
  objc_msgSend(v4, "setMinimumRadius:");
  objc_msgSend(v4, "setEnabled:", -[SKFieldNode isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setExclusive:", -[SKFieldNode isExclusive](self, "isExclusive"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SKFieldNode categoryBitMask](self, "categoryBitMask"));
  [(SKFieldNode *)self direction];
  objc_msgSend(v4, "setDirection:");
  [(SKFieldNode *)self smoothness];
  objc_msgSend(v4, "setSmoothness:");
  [(SKFieldNode *)self animationSpeed];
  objc_msgSend(v4, "setAnimationSpeed:");
  return v4;
}

- (void)setStrength:(float)strength
{
  field = self->_field;
  if (field) {
    -[PKPhysicsField setStrength:](field, "setStrength:");
  }
}

- (float)strength
{
  field = self->_field;
  if (!field) {
    return 0.0;
  }
  [(PKPhysicsField *)field strength];
  return result;
}

- (void)setMinimumRadius:(float)minimumRadius
{
  field = self->_field;
  if (field) {
    -[PKPhysicsField setMinimumRadius:](field, "setMinimumRadius:");
  }
}

- (float)minimumRadius
{
  field = self->_field;
  if (!field) {
    return 0.000030518;
  }
  [(PKPhysicsField *)field minimumRadius];
  return result;
}

- (float)falloff
{
  field = self->_field;
  if (!field) {
    return 0.0;
  }
  [(PKPhysicsField *)field falloff];
  return result;
}

- (void)setFalloff:(float)falloff
{
  field = self->_field;
  if (field) {
    -[PKPhysicsField setFalloff:](field, "setFalloff:");
  }
}

- (void)setEnabled:(BOOL)enabled
{
  field = self->_field;
  if (field) {
    [(PKPhysicsField *)field setEnabled:enabled];
  }
}

- (BOOL)isEnabled
{
  field = self->_field;
  if (field) {
    LOBYTE(field) = [(PKPhysicsField *)field isEnabled];
  }
  return (char)field;
}

- (void)setExclusive:(BOOL)exclusive
{
  field = self->_field;
  if (field) {
    [(PKPhysicsField *)field setOverride:exclusive];
  }
}

- (BOOL)isExclusive
{
  field = self->_field;
  if (field) {
    LOBYTE(field) = [(PKPhysicsField *)field isOverride];
  }
  return (char)field;
}

- (SKRegion)region
{
  return self->_region;
}

- (void)setRegion:(SKRegion *)region
{
  objc_storeStrong((id *)&self->_region, region);
  double v5 = region;
  -[PKPhysicsField setRegion:](self->_field, "setRegion:");
}

- (BOOL)isEqualToNode:(id)a3
{
  v8 = (SKFieldNode *)a3;
  if (self == v8)
  {
    BOOL v17 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  v32.receiver = self;
  v32.super_class = (Class)SKFieldNode;
  if ([(SKNode *)&v32 isEqualToNode:v9])
  {
    uint64_t v10 = objc_opt_class();
    if (v10 == objc_opt_class())
    {
      [(SKFieldNode *)self animationSpeed];
      float v12 = v11;
      [(SKFieldNode *)v9 animationSpeed];
      if ((COERCE_UNSIGNED_INT(v12 - v13) & 0x60000000) == 0)
      {
        [(SKFieldNode *)self smoothness];
        float v15 = v14;
        [(SKFieldNode *)v9 smoothness];
        if ((COERCE_UNSIGNED_INT(v15 - v16) & 0x60000000) == 0)
        {
          v19 = [(SKFieldNode *)self texture];
          v20 = [v19 imageNameOrPath];
          if (v20
            || ([(SKFieldNode *)v9 texture],
                v29 = objc_claimAutoreleasedReturnValue(),
                [v29 imageNameOrPath],
                (v30 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            id v4 = [(SKFieldNode *)self texture];
            double v5 = [v4 imageNameOrPath];
            id v6 = [(SKFieldNode *)v9 texture];
            double v3 = [v6 imageNameOrPath];
            if (![v5 isEqualToString:v3])
            {
              BOOL v17 = 0;
              goto LABEL_22;
            }
            v31 = v19;
            int v21 = 1;
          }
          else
          {
            v30 = 0;
            v31 = v19;
            int v21 = 0;
          }
          uint32_t v22 = [(SKFieldNode *)self categoryBitMask];
          if (v22 == [(SKFieldNode *)v9 categoryBitMask]
            && (BOOL v23 = [(SKFieldNode *)self isEnabled], v23 == [(SKFieldNode *)v9 isEnabled]))
          {
            [(SKFieldNode *)self direction];
            float32x4_t v28 = v24;
            [(SKFieldNode *)v9 direction];
            float32x4_t v26 = vsubq_f32(v28, v25);
            float32x4_t v27 = vmulq_f32(v26, v26);
            BOOL v17 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]) == 0.0;
            if (v21) {
              goto LABEL_21;
            }
          }
          else
          {
            BOOL v17 = 0;
            if (v21)
            {
LABEL_21:
              v19 = v31;
LABEL_22:

              if (v20)
              {
LABEL_24:

                goto LABEL_8;
              }
LABEL_23:

              goto LABEL_24;
            }
          }
          v19 = v31;
          if (v20) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
      }
    }
  }
  BOOL v17 = 0;
LABEL_8:

LABEL_11:
  return v17;
}

+ (SKFieldNode)dragField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)vortexField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)radialGravityField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)linearGravityFieldWithVector:(vector_float3)direction
{
  double v6 = v3;
  id v4 = objc_opt_new();
  [v4 setDirection:v6];

  return (SKFieldNode *)v4;
}

+ (SKFieldNode)velocityFieldWithVector:(vector_float3)direction
{
  double v6 = v3;
  id v4 = objc_opt_new();
  [v4 setDirection:v6];

  return (SKFieldNode *)v4;
}

+ (SKFieldNode)velocityFieldWithTexture:(SKTexture *)velocityTexture
{
  double v3 = velocityTexture;
  id v4 = objc_opt_new();
  [v4 setTexture:v3];

  return (SKFieldNode *)v4;
}

+ (SKFieldNode)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  double v6 = objc_opt_new();
  *(float *)&double v7 = smoothness;
  [v6 setSmoothness:v7];
  *(float *)&double v8 = speed;
  [v6 setAnimationSpeed:v8];

  return (SKFieldNode *)v6;
}

+ (SKFieldNode)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  double v6 = objc_opt_new();
  *(float *)&double v7 = smoothness;
  [v6 setSmoothness:v7];
  *(float *)&double v8 = speed;
  [v6 setAnimationSpeed:v8];

  return (SKFieldNode *)v6;
}

+ (SKFieldNode)springField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)electricField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)magneticField
{
  uint64_t v2 = objc_opt_new();

  return (SKFieldNode *)v2;
}

+ (SKFieldNode)customFieldWithEvaluationBlock:(SKFieldForceEvaluator)block
{
  SKFieldForceEvaluator v3 = block;
  id v4 = objc_opt_new();
  [v4 setBlock:v3];

  return (SKFieldNode *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_texture, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end