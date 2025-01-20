@interface SCNAvoidOccluderConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNAvoidOccluderConstraint)avoidOccluderConstraintWithTarget:(SCNNode *)target;
+ (id)avoidOccluderConstraint;
- (CGFloat)bias;
- (NSUInteger)occluderCategoryBitMask;
- (SCNAvoidOccluderConstraint)init;
- (SCNAvoidOccluderConstraint)initWithCoder:(id)a3;
- (SCNNode)target;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (void)_customDecodingOfSCNAvoidOccluderConstraint:(id)a3;
- (void)_customEncodingOfSCNAvoidOccluderConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBias:(CGFloat)bias;
- (void)setDelegate:(id)delegate;
- (void)setOccluderCategoryBitMask:(NSUInteger)occluderCategoryBitMask;
- (void)setTarget:(SCNNode *)target;
@end

@implementation SCNAvoidOccluderConstraint

- (SCNAvoidOccluderConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNAvoidOccluderConstraint;
  v2 = [(SCNConstraint *)&v5 init];
  if (v2)
  {
    uint64_t AvoidOccluder = C3DConstraintCreateAvoidOccluder();
    v2->_categoryBitMask = 1;
    v2->super._constraintRef = (__C3DConstraint *)AvoidOccluder;
    v2->_offset = 0.00001;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_delegate)
  {
    v3 = [(SCNNode *)self->_target sceneRef];
    if (v3)
    {
      uint64_t v4 = (uint64_t)v3;
      C3DSceneLock((uint64_t)v3);
      C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
      C3DSceneUnlock(v4);
    }
    else
    {
      C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNAvoidOccluderConstraint;
  [(SCNConstraint *)&v5 dealloc];
}

+ (id)avoidOccluderConstraint
{
  v2 = objc_alloc_init(SCNAvoidOccluderConstraint);

  return v2;
}

+ (SCNAvoidOccluderConstraint)avoidOccluderConstraintWithTarget:(SCNNode *)target
{
  uint64_t v4 = objc_alloc_init(SCNAvoidOccluderConstraint);
  [(SCNAvoidOccluderConstraint *)v4 setTarget:target];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNAvoidOccluderConstraint target](self, "target"));
  objc_msgSend(v4, "setOccluderCategoryBitMask:", -[SCNAvoidOccluderConstraint occluderCategoryBitMask](self, "occluderCategoryBitMask"));
  [(SCNAvoidOccluderConstraint *)self bias];
  objc_msgSend(v4, "setBias:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (void)setDelegate:(id)delegate
{
  if (self->_delegate != delegate)
  {
    self->_delegate = delegate;
    if (delegate)
    {
      if (objc_opt_respondsToSelector()) {
        id v4 = __C3DAvoidOccluderConstraintDelegateShouldAvoidOccluderCallback;
      }
      else {
        id v4 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        objc_super v5 = __C3DAvoidOccluderConstraintDelegateDidAvoidOccluderCallback;
      }
      else {
        objc_super v5 = 0;
      }
      v6 = [(SCNConstraint *)self sceneRef];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __42__SCNAvoidOccluderConstraint_setDelegate___block_invoke;
      v10[3] = &unk_264007A28;
      v10[4] = self;
      v10[5] = v4;
      v10[6] = v5;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v10];
    }
    else
    {
      v7 = [(SCNNode *)self->_target sceneRef];
      if (v7)
      {
        uint64_t v8 = (uint64_t)v7;
        C3DSceneLock((uint64_t)v7);
        C3DConstraintAvoidOccluderSetDelegate((uint64_t)self->super._constraintRef, 0);
        C3DSceneUnlock(v8);
      }
      else
      {
        constraintRef = self->super._constraintRef;
        C3DConstraintAvoidOccluderSetDelegate((uint64_t)constraintRef, 0);
      }
    }
  }
}

void __42__SCNAvoidOccluderConstraint_setDelegate___block_invoke(uint64_t *a1)
{
  v2 = C3DAvoidOccluderConstraintDelegateCreate(a1[4], a1[5], a1[6]);
  C3DConstraintAvoidOccluderSetDelegate(*(void *)(a1[4] + 8), v2);

  CFRelease(v2);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setTarget:(SCNNode *)target
{
  objc_super v5 = target;
  self->_target = v5;
  if (v5) {
    uint64_t v6 = [(SCNNode *)v5 nodeRef];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SCNAvoidOccluderConstraint_setTarget___block_invoke;
  v8[3] = &unk_264004FC0;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

CFTypeRef __40__SCNAvoidOccluderConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(void *)(*(void *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setOccluderCategoryBitMask:(NSUInteger)occluderCategoryBitMask
{
  self->_categoryBitMask = occluderCategoryBitMask;
  objc_super v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__SCNAvoidOccluderConstraint_setOccluderCategoryBitMask___block_invoke;
  v6[3] = &unk_264004FC0;
  v6[4] = self;
  v6[5] = occluderCategoryBitMask;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __57__SCNAvoidOccluderConstraint_setOccluderCategoryBitMask___block_invoke(uint64_t a1)
{
}

- (NSUInteger)occluderCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setBias:(CGFloat)bias
{
  float v5 = bias;
  self->_offset = v5;
  uint64_t v6 = [(SCNConstraint *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__SCNAvoidOccluderConstraint_setBias___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(CGFloat *)&v7[5] = bias;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

float __38__SCNAvoidOccluderConstraint_setBias___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DConstraintAvoidOccluderSetOffset(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)bias
{
  return self->_offset;
}

- (void)_customEncodingOfSCNAvoidOccluderConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    [a3 encodeObject:target forKey:@"target"];
  }
}

- (void)_customDecodingOfSCNAvoidOccluderConstraint:(id)a3
{
  self->_target = (SCNNode *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
  uint64_t AvoidOccluder = (__C3DConstraint *)C3DConstraintCreateAvoidOccluder();
  self->super._constraintRef = AvoidOccluder;
  C3DConstraintAvoidOccluderSetTarget((uint64_t)AvoidOccluder, [(SCNNode *)self->_target nodeRef]);

  [(SCNConstraint *)self finalizeDecodeConstraint:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNAvoidOccluderConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  [(SCNAvoidOccluderConstraint *)self _customEncodingOfSCNAvoidOccluderConstraint:a3];
  [a3 encodeInteger:self->_categoryBitMask forKey:@"categoryBitMask"];
  *(float *)&double v5 = self->_offset;
  [a3 encodeFloat:@"bias" forKey:v5];
}

- (SCNAvoidOccluderConstraint)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNAvoidOccluderConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNAvoidOccluderConstraint *)v4 _customDecodingOfSCNAvoidOccluderConstraint:a3];
    -[SCNAvoidOccluderConstraint setOccluderCategoryBitMask:](v4, "setOccluderCategoryBitMask:", [a3 decodeIntegerForKey:@"categoryBitMask"]);
    [a3 decodeFloatForKey:@"bias"];
    [(SCNAvoidOccluderConstraint *)v4 setBias:v6];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end