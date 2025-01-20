@interface SCNLookAtConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNLookAtConstraint)lookAtConstraintWithTarget:(SCNNode *)target;
- (BOOL)gimbalLockEnabled;
- (SCNLookAtConstraint)initWithCoder:(id)a3;
- (SCNLookAtConstraint)initWithTarget:(id)a3;
- (SCNNode)target;
- (SCNVector3)localFront;
- (SCNVector3)targetOffset;
- (SCNVector3)worldUp;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_customDecodingOfSCNLookAtConstraint:(id)a3;
- (void)_customEncodingOfSCNLookAtConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGimbalLockEnabled:(BOOL)gimbalLockEnabled;
- (void)setLocalFront:(SCNVector3)localFront;
- (void)setTarget:(SCNNode *)target;
- (void)setTargetOffset:(SCNVector3)targetOffset;
- (void)setWorldUp:(SCNVector3)worldUp;
@end

@implementation SCNLookAtConstraint

- (SCNLookAtConstraint)initWithTarget:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNLookAtConstraint;
  v4 = [(SCNConstraint *)&v7 init];
  if (v4)
  {
    id v5 = a3;
    *((void *)v4 + 7) = v5;
    if (v5) {
      id v5 = (id)[v5 nodeRef];
    }
    v4[64] = 0;
    *((_DWORD *)v4 + 19) = 0;
    *(void *)(v4 + 68) = 0;
    *(void *)(v4 + 92) = 0;
    *((_DWORD *)v4 + 25) = -1082130432;
    *((void *)v4 + 10) = 0x3F80000000000000;
    *((_DWORD *)v4 + 22) = 0;
    *((void *)v4 + 1) = C3DConstraintCreateLookAt(v5);
  }
  return (SCNLookAtConstraint *)v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNLookAtConstraint;
  [(SCNConstraint *)&v3 dealloc];
}

+ (SCNLookAtConstraint)lookAtConstraintWithTarget:(SCNNode *)target
{
  objc_super v3 = [[SCNLookAtConstraint alloc] initWithTarget:target];

  return v3;
}

- (BOOL)gimbalLockEnabled
{
  return self->_gimbalLockEnabled;
}

- (void)setGimbalLockEnabled:(BOOL)gimbalLockEnabled
{
  self->_gimbalLockEnabled = gimbalLockEnabled;
  id v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNLookAtConstraint_setGimbalLockEnabled___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = gimbalLockEnabled;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __44__SCNLookAtConstraint_setGimbalLockEnabled___block_invoke(uint64_t a1)
{
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setTarget:(SCNNode *)target
{
  id v5 = target;
  self->_target = v5;
  if (v5) {
    uint64_t v6 = [(SCNNode *)v5 nodeRef];
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SCNLookAtConstraint_setTarget___block_invoke;
  v8[3] = &unk_264004FC0;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

CFTypeRef __33__SCNLookAtConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(void *)(*(void *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNVector3)targetOffset
{
  float x = self->_targetOffset.x;
  float y = self->_targetOffset.y;
  float z = self->_targetOffset.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setTargetOffset:(SCNVector3)targetOffset
{
  float z = targetOffset.z;
  float y = targetOffset.y;
  float x = targetOffset.x;
  self->_targetOffset = targetOffset;
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__SCNLookAtConstraint_setTargetOffset___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"targetOffset" applyBlock:v8];
}

double __39__SCNLookAtConstraint_setTargetOffset___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  *(void *)&double result = C3DConstraintLookAtSetTargetOffset((__n128 *)*(void *)(*(void *)(a1 + 32) + 8), a2).n128_u64[0];
  return result;
}

- (SCNVector3)worldUp
{
  float x = self->_upVector.x;
  float y = self->_upVector.y;
  float z = self->_upVector.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setWorldUp:(SCNVector3)worldUp
{
  float z = worldUp.z;
  float y = worldUp.y;
  float x = worldUp.x;
  self->_upVector = worldUp;
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SCNLookAtConstraint_setWorldUp___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"worldUp" applyBlock:v8];
}

double __34__SCNLookAtConstraint_setWorldUp___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  *(void *)&double result = C3DConstraintLookAtSetUpVector((__n128 *)*(void *)(*(void *)(a1 + 32) + 8), a2).n128_u64[0];
  return result;
}

- (SCNVector3)localFront
{
  float x = self->_localFront.x;
  float y = self->_localFront.y;
  float z = self->_localFront.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setLocalFront:(SCNVector3)localFront
{
  float z = localFront.z;
  float y = localFront.y;
  float x = localFront.x;
  self->_localFront = localFront;
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SCNLookAtConstraint_setLocalFront___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"localFront" applyBlock:v8];
}

void __37__SCNLookAtConstraint_setLocalFront___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintLookAtSetLocalFront(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTarget:self->_target];
  objc_msgSend(v4, "setGimbalLockEnabled:", -[SCNLookAtConstraint gimbalLockEnabled](self, "gimbalLockEnabled"));
  [(SCNLookAtConstraint *)self targetOffset];
  objc_msgSend(v4, "setTargetOffset:");
  [(SCNLookAtConstraint *)self upVector];
  objc_msgSend(v4, "setUpVector:");
  [(SCNLookAtConstraint *)self localFront];
  objc_msgSend(v4, "setLocalFront:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (void)_customEncodingOfSCNLookAtConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    [a3 encodeObject:target forKey:@"target"];
  }
}

- (void)_customDecodingOfSCNLookAtConstraint:(id)a3
{
  id v5 = (SCNNode *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
  self->_target = v5;
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateLookAt([(SCNNode *)v5 nodeRef]);

  [(SCNConstraint *)self finalizeDecodeConstraint:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNLookAtConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [(SCNLookAtConstraint *)self _customEncodingOfSCNLookAtConstraint:a3];
  [a3 encodeBool:self->_gimbalLockEnabled forKey:@"gimbalLockEnabled"];
  SCNEncodeVector3(a3, @"targetOffset", self->_targetOffset.x, self->_targetOffset.y, self->_targetOffset.z);
  SCNEncodeVector3(a3, @"upVector", self->_upVector.x, self->_upVector.y, self->_upVector.z);
  SCNEncodeVector3(a3, @"localFront", self->_localFront.x, self->_localFront.y, self->_localFront.z);
}

- (SCNLookAtConstraint)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SCNLookAtConstraint;
  v4 = -[SCNConstraint initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNLookAtConstraint *)v4 _customDecodingOfSCNLookAtConstraint:a3];
    -[SCNLookAtConstraint setGimbalLockEnabled:](v4, "setGimbalLockEnabled:", [a3 decodeBoolForKey:@"gimbalLockEnabled"]);
    if ([a3 containsValueForKey:@"targetOffset"])
    {
      *(float *)&double v6 = SCNDecodeVector3(a3, @"targetOffset");
      [(SCNLookAtConstraint *)v4 setTargetOffset:v6];
    }
    if ([a3 containsValueForKey:@"upVector"])
    {
      *(float *)&double v8 = SCNDecodeVector3(a3, @"upVector");
    }
    else
    {
      double v8 = 0.0;
      LODWORD(v7) = 1.0;
      double v9 = 0.0;
    }
    -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", v8, v7, v9);
    if ([a3 containsValueForKey:@"localFront"])
    {
      *(float *)&double v11 = SCNDecodeVector3(a3, @"localFront");
      [(SCNLookAtConstraint *)v4 setLocalFront:v11];
    }
    else
    {
      LODWORD(v10) = -1.0;
      -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", 0.0, 0.0, v10);
    }
    [(SCNLookAtConstraint *)v4 upVector];
    v18.float x = 0.0;
    v18.float y = 0.0;
    v18.float z = 0.0;
    if (SCNVector3EqualToVector3(v16, v18))
    {
      LODWORD(v12) = 1.0;
      -[SCNLookAtConstraint setUpVector:](v4, "setUpVector:", 0.0, v12, 0.0);
    }
    [(SCNLookAtConstraint *)v4 localFront];
    v19.float x = 0.0;
    v19.float y = 0.0;
    v19.float z = 0.0;
    if (SCNVector3EqualToVector3(v17, v19))
    {
      LODWORD(v13) = -1.0;
      -[SCNLookAtConstraint setLocalFront:](v4, "setLocalFront:", 0.0, 0.0, v13);
    }
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end