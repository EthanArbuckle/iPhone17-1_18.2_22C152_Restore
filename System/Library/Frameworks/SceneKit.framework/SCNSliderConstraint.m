@interface SCNSliderConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNSliderConstraint)sliderConstraint;
- (CGFloat)radius;
- (NSUInteger)collisionCategoryBitMask;
- (SCNSliderConstraint)init;
- (SCNSliderConstraint)initWithCoder:(id)a3;
- (SCNVector3)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCollisionCategoryBitMask:(NSUInteger)collisionCategoryBitMask;
- (void)setOffset:(SCNVector3)offset;
- (void)setRadius:(CGFloat)radius;
@end

@implementation SCNSliderConstraint

- (SCNSliderConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNSliderConstraint;
  v2 = [(SCNConstraint *)&v5 init];
  if (v2)
  {
    uint64_t Slider = C3DConstraintCreateSlider();
    v2->_categoryBitMask = 0;
    v2->super._constraintRef = (__C3DConstraint *)Slider;
    v2->_radius = 1.0;
  }
  return v2;
}

+ (SCNSliderConstraint)sliderConstraint
{
  v2 = objc_alloc_init(SCNSliderConstraint);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCollisionCategoryBitMask:", -[SCNSliderConstraint collisionCategoryBitMask](self, "collisionCategoryBitMask"));
  [(SCNSliderConstraint *)self offset];
  objc_msgSend(v4, "setOffset:");
  [(SCNSliderConstraint *)self radius];
  objc_msgSend(v4, "setRadius:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (NSUInteger)collisionCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCollisionCategoryBitMask:(NSUInteger)collisionCategoryBitMask
{
  self->_categoryBitMask = collisionCategoryBitMask;
  objc_super v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SCNSliderConstraint_setCollisionCategoryBitMask___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  v6[5] = collisionCategoryBitMask;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __51__SCNSliderConstraint_setCollisionCategoryBitMask___block_invoke(uint64_t a1)
{
}

- (CGFloat)radius
{
  return self->_radius;
}

- (void)setRadius:(CGFloat)radius
{
  float v5 = radius;
  self->_radius = v5;
  v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SCNSliderConstraint_setRadius___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = radius;
  +[SCNTransaction postCommandWithContext:v6 object:self key:@"radius" applyBlock:v7];
}

float __33__SCNSliderConstraint_setRadius___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstaintSliderSetRadius(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
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
  self->_offset = offset;
  id v4 = [(SCNConstraint *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__SCNSliderConstraint_setOffset___block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self key:@"offset" applyBlock:v5];
}

double __33__SCNSliderConstraint_setOffset___block_invoke(uint64_t a1, __n128 a2)
{
  v2 = *(unint64_t **)(a1 + 32);
  v3 = (__n128 *)v2[1];
  v2 += 8;
  a2.n128_u64[0] = *v2;
  a2.n128_u32[2] = *((_DWORD *)v2 + 2);
  *(void *)&double result = C3DConstaintSliderSetOffset(v3, a2).n128_u64[0];
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNSliderConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_categoryBitMask forKey:@"collisionCategoryBitMask"];
  *(float *)&double v5 = self->_radius;
  [a3 encodeFloat:@"radius" forKey:v5];
  SCNEncodeVector3(a3, @"offset", self->_offset.x, self->_offset.y, self->_offset.z);
}

- (SCNSliderConstraint)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNSliderConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v9, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateSlider();
    [(SCNConstraint *)v4 finalizeDecodeConstraint:a3];
    -[SCNSliderConstraint setCollisionCategoryBitMask:](v4, "setCollisionCategoryBitMask:", [a3 decodeIntegerForKey:@"collisionCategoryBitMask"]);
    [a3 decodeFloatForKey:@"radius"];
    [(SCNSliderConstraint *)v4 setRadius:v6];
    *(float *)&double v7 = SCNDecodeVector3(a3, @"offset");
    [(SCNSliderConstraint *)v4 setOffset:v7];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end