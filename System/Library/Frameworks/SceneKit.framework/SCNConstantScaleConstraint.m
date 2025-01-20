@interface SCNConstantScaleConstraint
+ (BOOL)supportsSecureCoding;
+ (id)constantScaleConstraint;
- (BOOL)screenSpace;
- (SCNConstantScaleConstraint)init;
- (SCNConstantScaleConstraint)initWithCoder:(id)a3;
- (float)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setScale:(float)a3;
- (void)setScreenSpace:(BOOL)a3;
@end

@implementation SCNConstantScaleConstraint

- (SCNConstantScaleConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNConstantScaleConstraint;
  v2 = [(SCNConstraint *)&v5 init];
  if (v2)
  {
    uint64_t ConstantScale = C3DConstraintCreateConstantScale();
    v2->_scale = 1.0;
    v2->super._constraintRef = (__C3DConstraint *)ConstantScale;
    v2->_screenSpace = 1;
  }
  return v2;
}

+ (id)constantScaleConstraint
{
  v2 = objc_alloc_init(SCNConstantScaleConstraint);

  return v2;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
  objc_super v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__SCNConstantScaleConstraint_setScale___block_invoke;
  v6[3] = &unk_264009038;
  v6[4] = self;
  float v7 = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __39__SCNConstantScaleConstraint_setScale___block_invoke(uint64_t a1)
{
  return C3DConstraintConstantScaleSetScale(*(void *)(*(void *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (BOOL)screenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  self->_screenSpace = a3;
  objc_super v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SCNConstantScaleConstraint_setScreenSpace___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __45__SCNConstantScaleConstraint_setScreenSpace___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetPreserveScale(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned char *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  [(SCNConstraint *)self copyTo:v4];
  v4[14] = LODWORD(self->_scale);
  *((unsigned char *)v4 + 60) = self->_screenSpace;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNConstantScaleConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  [a3 encodeBool:self->_screenSpace forKey:@"screenSpace"];
  *(float *)&double v5 = self->_scale;
  [a3 encodeFloat:@"scale" forKey:v5];
}

- (SCNConstantScaleConstraint)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNConstantScaleConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateConstantScale();
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    -[SCNConstantScaleConstraint setScreenSpace:](v4, "setScreenSpace:", [a3 decodeBoolForKey:@"screenSpace"]);
    [a3 decodeFloatForKey:@"scale"];
    -[SCNConstantScaleConstraint setScale:](v4, "setScale:");
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end