@interface SCNBillboardConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNBillboardConstraint)billboardConstraint;
- (BOOL)preserveScale;
- (SCNBillboardAxis)freeAxes;
- (SCNBillboardConstraint)init;
- (SCNBillboardConstraint)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFreeAxes:(SCNBillboardAxis)freeAxes;
- (void)setPreserveScale:(BOOL)a3;
@end

@implementation SCNBillboardConstraint

- (SCNBillboardConstraint)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNBillboardConstraint;
  id v2 = [(SCNConstraint *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 1) = C3DConstraintCreateBillboard();
    [v2 setFreeAxes:7];
    *((unsigned char *)v2 + 64) = C3DConstraintBillboardGetPreserveScale(*((void *)v2 + 1));
  }
  return (SCNBillboardConstraint *)v2;
}

+ (SCNBillboardConstraint)billboardConstraint
{
  id v2 = objc_alloc_init(SCNBillboardConstraint);

  return v2;
}

- (SCNBillboardAxis)freeAxes
{
  return self->_freeAxes;
}

- (void)setFreeAxes:(SCNBillboardAxis)freeAxes
{
  self->_freeAxes = freeAxes;
  v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNBillboardConstraint_setFreeAxes___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  v6[5] = freeAxes;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __38__SCNBillboardConstraint_setFreeAxes___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetType(*(void *)(*(void *)(a1 + 32) + 8), *(_DWORD *)(a1 + 40));
}

- (void)setPreserveScale:(BOOL)a3
{
  self->_preserveScale = a3;
  v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SCNBillboardConstraint_setPreserveScale___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __43__SCNBillboardConstraint_setPreserveScale___block_invoke(uint64_t a1)
{
  return C3DConstraintBillboardSetPreserveScale(*(void *)(*(void *)(a1 + 32) + 8), *(unsigned char *)(a1 + 40));
}

- (BOOL)preserveScale
{
  return self->_preserveScale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SCNConstraint *)self copyTo:v4];
  objc_msgSend(v4, "setFreeAxes:", -[SCNBillboardConstraint freeAxes](self, "freeAxes"));
  objc_msgSend(v4, "setPreserveScale:", -[SCNBillboardConstraint preserveScale](self, "preserveScale"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNBillboardConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_freeAxes forKey:@"freeAxes"];
  [a3 encodeBool:self->_preserveScale forKey:@"preserveScale"];
}

- (SCNBillboardConstraint)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNBillboardConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    v4->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateBillboard();
    -[SCNBillboardConstraint setFreeAxes:](v4, "setFreeAxes:", [a3 decodeIntegerForKey:@"freeAxes"]);
    -[SCNBillboardConstraint setPreserveScale:](v4, "setPreserveScale:", [a3 decodeBoolForKey:@"preserveScale"]);
    [(SCNConstraint *)v4 finalizeDecodeConstraint:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end