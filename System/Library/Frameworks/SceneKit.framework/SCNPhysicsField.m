@interface SCNPhysicsField
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsField)customFieldWithEvaluationBlock:(SCNFieldForceEvaluator)block;
+ (SCNPhysicsField)dragField;
+ (SCNPhysicsField)electricField;
+ (SCNPhysicsField)linearGravityField;
+ (SCNPhysicsField)magneticField;
+ (SCNPhysicsField)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (SCNPhysicsField)radialGravityField;
+ (SCNPhysicsField)springField;
+ (SCNPhysicsField)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed;
+ (SCNPhysicsField)vortexField;
+ (double)_displayScaleFactor;
+ (id)field;
+ (void)_setDisplayScaleFactor:(double)a3;
- (BOOL)isActive;
- (BOOL)isExclusive;
- (BOOL)supportsDirection;
- (BOOL)supportsOffset;
- (BOOL)usesEllipsoidalExtent;
- (CGFloat)falloffExponent;
- (CGFloat)minimumDistance;
- (CGFloat)strength;
- (NSUInteger)categoryBitMask;
- (SCNPhysicsField)init;
- (SCNPhysicsField)initWithCoder:(id)a3;
- (SCNPhysicsFieldScope)scope;
- (SCNVector3)direction;
- (SCNVector3)evalAtLocation:(SCNVector3)a3;
- (SCNVector3)halfExtent;
- (SCNVector3)offset;
- (c3dPhysicsField)_createField;
- (c3dPhysicsField)_handle;
- (id)_owner;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_commonInit;
- (void)_removeOwner;
- (void)_setOwner:(id)a3;
- (void)_setWorld:(id)a3;
- (void)_setupCommonProperties;
- (void)_willRemoveFromPhysicsWorld;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)active;
- (void)setCategoryBitMask:(NSUInteger)categoryBitMask;
- (void)setDirection:(SCNVector3)direction;
- (void)setExclusive:(BOOL)exclusive;
- (void)setFalloffExponent:(CGFloat)falloffExponent;
- (void)setHalfExtent:(SCNVector3)halfExtent;
- (void)setMinimumDistance:(CGFloat)minimumDistance;
- (void)setOffset:(SCNVector3)offset;
- (void)setScope:(SCNPhysicsFieldScope)scope;
- (void)setStrength:(CGFloat)strength;
- (void)setUsesEllipsoidalExtent:(BOOL)usesEllipsoidalExtent;
@end

@implementation SCNPhysicsField

- (void)_commonInit
{
  self->_active = 1;
  self->_minimumDistance = 0.000001;
  *(int32x2_t *)&self->_halfExtent.x = vdup_n_s32(0x7F7FFFFFu);
  self->_halfExtent.z = 3.4028e38;
  self->_strength = 1.0;
  self->_direction.y = -1.0;
  self->_scope = 0;
  self->_categoryBitMask = -1;
}

- (SCNPhysicsField)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNPhysicsField;
  v2 = [(SCNPhysicsField *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SCNPhysicsField *)v2 _commonInit];
  }
  return v3;
}

- (void)dealloc
{
  if (self->_field) {
    [(SCNPhysicsField *)self _removeOwner];
  }
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsField;
  [(SCNPhysicsField *)&v3 dealloc];
}

+ (id)field
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (SCNPhysicsField)dragField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)customFieldWithEvaluationBlock:(SCNFieldForceEvaluator)block
{
  v4 = +[SCNPhysicsField field];
  [(SCNPhysicsField *)v4 setBlock:block];
  return v4;
}

+ (SCNPhysicsField)vortexField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)radialGravityField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)linearGravityField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)noiseFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  v6 = +[SCNPhysicsField field];
  [(SCNPhysicsField *)v6 setSmoothness:smoothness];
  [(SCNPhysicsField *)v6 setAnimationSpeed:speed];
  return v6;
}

+ (SCNPhysicsField)turbulenceFieldWithSmoothness:(CGFloat)smoothness animationSpeed:(CGFloat)speed
{
  v6 = +[SCNPhysicsField field];
  [(SCNPhysicsField *)v6 setSmoothness:smoothness];
  [(SCNPhysicsField *)v6 setAnimationSpeed:speed];
  return v6;
}

+ (SCNPhysicsField)springField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)electricField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

+ (SCNPhysicsField)magneticField
{
  return (SCNPhysicsField *)+[SCNPhysicsField field];
}

- (c3dPhysicsField)_createField
{
  result = (c3dPhysicsField *)[(SCNPhysicsField *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (void)_setupCommonProperties
{
  field = self->_field;
  if (field)
  {
    *(void *)&long long v2 = *(void *)&self->_halfExtent.x;
    DWORD2(v2) = LODWORD(self->_halfExtent.z);
    *(_OWORD *)&field[5].var5 = v2;
    v4 = self->_field;
    *(float *)&long long v2 = self->_strength;
    LODWORD(v4[5].var0) = v2;
    LOBYTE(v4[6].var4) = self->_active;
    BYTE2(v4[6].var4) = self->_exclusive;
    BYTE1(v4[6].var4) = self->_scope == 1;
    HIBYTE(v4[6].var4) = self->_usesEllipsoidalExtent;
    *(float *)&long long v2 = self->_minimumDistance;
    HIDWORD(v4[6].var0) = v2;
    *(void *)&long long v2 = *(void *)&self->_offset.x;
    DWORD2(v2) = LODWORD(self->_offset.z);
    *(_OWORD *)&v4[4].var5 = v2;
    LODWORD(self->_field[6].var3) = self->_categoryBitMask;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:0 error:0];
  v4 = (void *)[MEMORY[0x263F08928] unarchiveObjectWithData:v3];

  return v4;
}

- (id)copy
{
  return [(SCNPhysicsField *)self copyWithZone:0];
}

- (CGFloat)strength
{
  return self->_strength;
}

- (void)setStrength:(CGFloat)strength
{
  self->_strength = strength;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SCNPhysicsField_setStrength___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(CGFloat *)&v6[5] = strength;
  [v5 _postCommandWithBlock:v6];
}

float __31__SCNPhysicsField_setStrength___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 160) = result;
  }
  return result;
}

- (NSUInteger)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  self->_categoryBitMask = categoryBitMask;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setCategoryBitMask___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  v6[5] = categoryBitMask;
  [v5 _postCommandWithBlock:v6];
}

uint64_t __38__SCNPhysicsField_setCategoryBitMask___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 120);
  if (v1) {
    *(_DWORD *)(v1 + 200) = *(void *)(result + 40);
  }
  return result;
}

- (CGFloat)falloffExponent
{
  return self->_falloffExponent;
}

- (void)setFalloffExponent:(CGFloat)falloffExponent
{
  self->_falloffExponent = falloffExponent;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setFalloffExponent___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(CGFloat *)&v6[5] = falloffExponent;
  [v5 _postCommandWithBlock:v6];
}

float __38__SCNPhysicsField_setFalloffExponent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 192) = result;
  }
  return result;
}

- (CGFloat)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(CGFloat)minimumDistance
{
  self->_minimumDistance = minimumDistance;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsField_setMinimumDistance___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  *(CGFloat *)&v6[5] = minimumDistance;
  [v5 _postCommandWithBlock:v6];
}

float __38__SCNPhysicsField_setMinimumDistance___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 120);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 196) = result;
  }
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)active
{
  self->_active = active;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__SCNPhysicsField_setActive___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = active;
  [v5 _postCommandWithBlock:v6];
}

void __29__SCNPhysicsField_setActive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 120);
  if (v2)
  {
    *(unsigned char *)(v2 + 204) = *(unsigned char *)(a1 + 40);
    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v3 = (c3dAether *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "scene"), "physicsWorld"), "_aetherHandle");
  if (v3)
  {
    c3dAether::fieldsModeHaveChanged(v3);
  }
}

- (SCNPhysicsFieldScope)scope
{
  return self->_scope;
}

- (void)setScope:(SCNPhysicsFieldScope)scope
{
  self->_scope = scope;
  v4 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SCNPhysicsField_setScope___block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  [v4 _postCommandWithBlock:v5];
}

uint64_t __28__SCNPhysicsField_setScope___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 120);
  if (v2) {
    *(unsigned char *)(v2 + 205) = *(void *)(v1 + 56) == 1;
  }
  return result;
}

- (SCNVector3)halfExtent
{
  float x = self->_halfExtent.x;
  float y = self->_halfExtent.y;
  float z = self->_halfExtent.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setHalfExtent:(SCNVector3)halfExtent
{
  float z = halfExtent.z;
  float y = halfExtent.y;
  float x = halfExtent.x;
  self->_halfExtent = halfExtent;
  BOOL v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SCNPhysicsField_setHalfExtent___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  [v7 _postCommandWithBlock:v8];
}

__n128 __33__SCNPhysicsField_setHalfExtent___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(void *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[11] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

- (BOOL)usesEllipsoidalExtent
{
  return self->_usesEllipsoidalExtent;
}

- (void)setUsesEllipsoidalExtent:(BOOL)usesEllipsoidalExtent
{
  self->_usesEllipsoidalExtent = usesEllipsoidalExtent;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNPhysicsField_setUsesEllipsoidalExtent___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = usesEllipsoidalExtent;
  [v5 _postCommandWithBlock:v6];
}

uint64_t __44__SCNPhysicsField_setUsesEllipsoidalExtent___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 120);
  if (v1) {
    *(unsigned char *)(v1 + 207) = *(unsigned char *)(result + 40);
  }
  return result;
}

- (BOOL)isExclusive
{
  return self->_exclusive;
}

- (void)setExclusive:(BOOL)exclusive
{
  self->_exclusive = exclusive;
  objc_super v5 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SCNPhysicsField_setExclusive___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = exclusive;
  [v5 _postCommandWithBlock:v6];
}

void __32__SCNPhysicsField_setExclusive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 120);
  if (v2)
  {
    *(unsigned char *)(v2 + 206) = *(unsigned char *)(a1 + 40);
    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v3 = (c3dAether *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "scene"), "physicsWorld"), "_aetherHandle");
  if (v3)
  {
    c3dAether::fieldsModeHaveChanged(v3);
  }
}

- (SCNVector3)offset
{
  float x = self->_offset.x;
  float y = self->_offset.y;
  float z = self->_offset.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setOffset:(SCNVector3)offset
{
  float z = offset.z;
  float y = offset.y;
  float x = offset.x;
  self->_offset = offset;
  BOOL v7 = objc_msgSend(-[SCNNode scene](self->_node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__SCNPhysicsField_setOffset___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  [v7 _postCommandWithBlock:v8];
}

__n128 __29__SCNPhysicsField_setOffset___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v2 = *(__n128 **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(void *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[9] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

- (SCNVector3)direction
{
  float x = self->_direction.x;
  float y = self->_direction.y;
  float z = self->_direction.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setDirection:(SCNVector3)direction
{
  self->_direction = direction;
}

- (BOOL)supportsDirection
{
  return 1;
}

- (BOOL)supportsOffset
{
  return 1;
}

+ (void)_setDisplayScaleFactor:(double)a3
{
  *(float *)&int v3 = a3;
  _physicsFieldDisplayScaleFactor = v3;
}

+ (double)_displayScaleFactor
{
  return *(float *)&_physicsFieldDisplayScaleFactor;
}

- (void)_removeOwner
{
  node = self->_node;
  if (node)
  {
    C3DNodeSetHasPhysicsField((uint64_t)[(SCNNode *)node nodeRef], 0);
    self->_node = 0;
  }
  world = self->_world;
  if (world)
  {
    [(SCNPhysicsWorld *)world _removeFieldFromWorld:self];
    self->_world = 0;
  }
  field = self->_field;
  if (field)
  {
    (*((void (**)(c3dPhysicsField *, SEL))field->var0 + 1))(field, a2);
    self->_field = 0;
  }
}

- (void)_willRemoveFromPhysicsWorld
{
  world = self->_world;
  if (world)
  {
    [(SCNPhysicsWorld *)world _removeFieldFromWorld:self];
    self->_world = 0;
  }
}

- (void)_setOwner:(id)a3
{
  node = self->_node;
  if (node) {
    BOOL v6 = node == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    BOOL v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsField _setOwner:](v7);
    }
    node = self->_node;
  }
  if (node)
  {
    if (self->_field)
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[SCNPhysicsField _setOwner:](v8);
      }
    }
  }
  self->_node = (SCNNode *)a3;
  if (!self->_field)
  {
    self->_field = [(SCNPhysicsField *)self _createField];
    [(SCNPhysicsField *)self _setupCommonProperties];
  }
  C3DNodeSetHasPhysicsField([a3 nodeRef], 1);
  float v9 = (void *)[a3 scene];
  if (v9) {
    objc_msgSend((id)objc_msgSend(v9, "physicsWorld"), "_addFieldToWorld:", self);
  }
}

- (void)_setWorld:(id)a3
{
  self->_world = (SCNPhysicsWorld *)a3;
}

- (id)_owner
{
  return self->_node;
}

- (c3dPhysicsField)_handle
{
  return self->_field;
}

- (SCNVector3)evalAtLocation:(SCNVector3)a3
{
  float y = a3.y;
  float z = a3.z;
  __n128 v9 = *(__n128 *)&a3.x;
  if (c3dPhysicsField::contains((float32x4_t *)self->_field, (float32x2_t *)&v9))
  {
    __n128 v6 = ((__n128 (*)(c3dPhysicsField *, __n128, __n128, float, float, float))*((void *)self->_field->var0
                                                                                         + 2))(self->_field, v9, (__n128)0, 1.0, 1.0, 0.016667);
    float v7 = v6.n128_f32[2];
  }
  else
  {
    v6.n128_u64[0] = 0;
    float v7 = 0.0;
  }
  float v8 = v6.n128_f32[1];
  result.float x = v6.n128_f32[0];
  result.float z = v7;
  result.float y = v8;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  SCNEncodeVector3(a3, @"halfExtent", self->_halfExtent.x, self->_halfExtent.y, self->_halfExtent.z);
  [a3 encodeDouble:@"strength" forKey:self->_strength];
  [a3 encodeDouble:@"falloffExponent" forKey:self->_falloffExponent];
  [a3 encodeDouble:@"minimumDistance" forKey:self->_minimumDistance];
  [a3 encodeBool:self->_active forKey:@"active"];
  [a3 encodeInteger:self->_scope forKey:@"scope"];
  [a3 encodeBool:self->_usesEllipsoidalExtent forKey:@"usesEllipsoidalExtent"];
  [a3 encodeBool:self->_exclusive forKey:@"exclusive"];
  SCNEncodeVector3(a3, @"offset", self->_offset.x, self->_offset.y, self->_offset.z);
  float x = self->_direction.x;
  float y = self->_direction.y;
  float z = self->_direction.z;

  SCNEncodeVector3(a3, @"direction", x, y, z);
}

- (SCNPhysicsField)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsField;
  v4 = [(SCNPhysicsField *)&v10 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNPhysicsField *)v4 _commonInit];
    *(float *)&double v6 = SCNDecodeVector3(a3, @"halfExtent");
    [(SCNPhysicsField *)v4 setHalfExtent:v6];
    [a3 decodeDoubleForKey:@"strength"];
    -[SCNPhysicsField setStrength:](v4, "setStrength:");
    [a3 decodeDoubleForKey:@"falloffExponent"];
    -[SCNPhysicsField setFalloffExponent:](v4, "setFalloffExponent:");
    [a3 decodeDoubleForKey:@"minimumDistance"];
    -[SCNPhysicsField setMinimumDistance:](v4, "setMinimumDistance:");
    -[SCNPhysicsField setActive:](v4, "setActive:", [a3 decodeBoolForKey:@"active"]);
    -[SCNPhysicsField setScope:](v4, "setScope:", [a3 decodeIntegerForKey:@"scope"]);
    -[SCNPhysicsField setUsesEllipsoidalExtent:](v4, "setUsesEllipsoidalExtent:", [a3 decodeBoolForKey:@"usesEllipsoidalExtent"]);
    -[SCNPhysicsField setExclusive:](v4, "setExclusive:", [a3 decodeBoolForKey:@"exclusive"]);
    *(float *)&double v7 = SCNDecodeVector3(a3, @"offset");
    [(SCNPhysicsField *)v4 setOffset:v7];
    if ([a3 containsValueForKey:@"direction"])
    {
      *(float *)&double v8 = SCNDecodeVector3(a3, @"direction");
      [(SCNPhysicsField *)v4 setDirection:v8];
    }
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setOwner:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "!_node || _field == 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. SCNPhysicsField is already attached to a SCNNode", (uint8_t *)&v1, 0xCu);
}

- (void)_setOwner:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: can't share a SCNPhysicsField is already attached to a SCNNode", v1, 2u);
}

@end