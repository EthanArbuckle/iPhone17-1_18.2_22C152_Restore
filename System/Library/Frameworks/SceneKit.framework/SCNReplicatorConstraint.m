@interface SCNReplicatorConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNReplicatorConstraint)replicatorConstraintWithTarget:(SCNNode *)target;
+ (id)replicatorConstraint;
- (BOOL)replicatesOrientation;
- (BOOL)replicatesPosition;
- (BOOL)replicatesScale;
- (SCNNode)target;
- (SCNQuaternion)orientationOffset;
- (SCNReplicatorConstraint)init;
- (SCNReplicatorConstraint)initWithCoder:(id)a3;
- (SCNVector3)positionOffset;
- (SCNVector3)scaleOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_customDecodingOfSCNReplicatorConstraint:(id)a3;
- (void)_customEncodingOfSCNReplicatorConstraint:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setOrientationOffset:(SCNQuaternion)orientationOffset;
- (void)setPositionOffset:(SCNVector3)positionOffset;
- (void)setReplicatesOrientation:(BOOL)replicatesOrientation;
- (void)setReplicatesPosition:(BOOL)replicatesPosition;
- (void)setReplicatesScale:(BOOL)replicatesScale;
- (void)setScaleOffset:(SCNVector3)scaleOffset;
- (void)setTarget:(SCNNode *)target;
@end

@implementation SCNReplicatorConstraint

- (SCNReplicatorConstraint)init
{
  v10.receiver = self;
  v10.super_class = (Class)SCNReplicatorConstraint;
  v2 = [(SCNConstraint *)&v10 init];
  if (v2)
  {
    uint64_t Replicator = C3DConstraintCreateReplicator();
    v2[64] = 1;
    v2[65] = 1;
    *((void *)v2 + 1) = Replicator;
    v2[66] = 1;
    *(_OWORD *)(v2 + 68) = xmmword_20B5CB530;
    *(void *)(v2 + 84) = 0;
    *((_DWORD *)v2 + 23) = 0;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)v2 + 12) = _D0;
    *((_DWORD *)v2 + 26) = 1065353216;
  }
  return (SCNReplicatorConstraint *)v2;
}

+ (id)replicatorConstraint
{
  v2 = objc_alloc_init(SCNReplicatorConstraint);

  return v2;
}

+ (SCNReplicatorConstraint)replicatorConstraintWithTarget:(SCNNode *)target
{
  v4 = (SCNReplicatorConstraint *)[a1 replicatorConstraint];
  [(SCNReplicatorConstraint *)v4 setTarget:target];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTarget:", -[SCNReplicatorConstraint target](self, "target"));
  objc_msgSend(v4, "setReplicatesOrientation:", -[SCNReplicatorConstraint replicatesOrientation](self, "replicatesOrientation"));
  objc_msgSend(v4, "setReplicatesPosition:", -[SCNReplicatorConstraint replicatesPosition](self, "replicatesPosition"));
  objc_msgSend(v4, "setReplicatesScale:", -[SCNReplicatorConstraint replicatesScale](self, "replicatesScale"));
  [(SCNReplicatorConstraint *)self orientationOffset];
  objc_msgSend(v4, "setOrientationOffset:");
  [(SCNReplicatorConstraint *)self positionOffset];
  objc_msgSend(v4, "setPositionOffset:");
  [(SCNReplicatorConstraint *)self scaleOffset];
  objc_msgSend(v4, "setScaleOffset:");
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (void)setTarget:(SCNNode *)target
{
  v5 = target;
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
  v8[2] = __37__SCNReplicatorConstraint_setTarget___block_invoke;
  v8[3] = &unk_264004FC0;
  v8[4] = self;
  v8[5] = v6;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

CFTypeRef __37__SCNReplicatorConstraint_setTarget___block_invoke(uint64_t a1)
{
  return C3DConstraintAvoidOccluderSetTarget(*(void *)(*(void *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (SCNNode)target
{
  return self->_target;
}

- (void)setReplicatesOrientation:(BOOL)replicatesOrientation
{
  self->_replicateOrientation = replicatesOrientation;
  v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__SCNReplicatorConstraint_setReplicatesOrientation___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = replicatesOrientation;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __52__SCNReplicatorConstraint_setReplicatesOrientation___block_invoke(uint64_t a1)
{
}

- (BOOL)replicatesOrientation
{
  return self->_replicateOrientation;
}

- (void)setReplicatesPosition:(BOOL)replicatesPosition
{
  self->_replicatePosition = replicatesPosition;
  v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SCNReplicatorConstraint_setReplicatesPosition___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = replicatesPosition;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __49__SCNReplicatorConstraint_setReplicatesPosition___block_invoke(uint64_t a1)
{
}

- (BOOL)replicatesPosition
{
  return self->_replicatePosition;
}

- (void)setReplicatesScale:(BOOL)replicatesScale
{
  self->_replicateScale = replicatesScale;
  v5 = [(SCNConstraint *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__SCNReplicatorConstraint_setReplicatesScale___block_invoke;
  v6[3] = &unk_264004FE8;
  v6[4] = self;
  BOOL v7 = replicatesScale;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __46__SCNReplicatorConstraint_setReplicatesScale___block_invoke(uint64_t a1)
{
}

- (BOOL)replicatesScale
{
  return self->_replicateScale;
}

- (void)setOrientationOffset:(SCNQuaternion)orientationOffset
{
  float w = orientationOffset.w;
  float z = orientationOffset.z;
  float y = orientationOffset.y;
  float x = orientationOffset.x;
  self->_orientationOffset = orientationOffset;
  v8 = [(SCNConstraint *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__SCNReplicatorConstraint_setOrientationOffset___block_invoke;
  v9[3] = &unk_264007A28;
  v9[4] = self;
  float v10 = x;
  float v11 = y;
  float v12 = z;
  float v13 = w;
  +[SCNTransaction postCommandWithContext:v8 object:self key:@"orientationOffset" applyBlock:v9];
}

void __48__SCNReplicatorConstraint_setOrientationOffset___block_invoke(uint64_t a1)
{
}

- (SCNQuaternion)orientationOffset
{
  float x = self->_orientationOffset.x;
  float y = self->_orientationOffset.y;
  float z = self->_orientationOffset.z;
  float w = self->_orientationOffset.w;
  result.float w = w;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setPositionOffset:(SCNVector3)positionOffset
{
  float z = positionOffset.z;
  float y = positionOffset.y;
  float x = positionOffset.x;
  self->_positionOffset = positionOffset;
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SCNReplicatorConstraint_setPositionOffset___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"positionOffset" applyBlock:v8];
}

void __45__SCNReplicatorConstraint_setPositionOffset___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintReplicatorSetPositionOffset(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (SCNVector3)positionOffset
{
  float x = self->_positionOffset.x;
  float y = self->_positionOffset.y;
  float z = self->_positionOffset.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setScaleOffset:(SCNVector3)scaleOffset
{
  float z = scaleOffset.z;
  float y = scaleOffset.y;
  float x = scaleOffset.x;
  self->_scaleOffset = scaleOffset;
  BOOL v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__SCNReplicatorConstraint_setScaleOffset___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"scaleOffset" applyBlock:v8];
}

void __42__SCNReplicatorConstraint_setScaleOffset___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintDistanceSetTargetDirection(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (SCNVector3)scaleOffset
{
  float x = self->_scaleOffset.x;
  float y = self->_scaleOffset.y;
  float z = self->_scaleOffset.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)_customEncodingOfSCNReplicatorConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    [a3 encodeObject:target forKey:@"target"];
  }
}

- (void)_customDecodingOfSCNReplicatorConstraint:(id)a3
{
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateReplicator();
  -[SCNReplicatorConstraint setTarget:](self, "setTarget:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"target"]);

  [(SCNConstraint *)self finalizeDecodeConstraint:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNReplicatorConstraint;
  -[SCNConstraint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [(SCNReplicatorConstraint *)self _customEncodingOfSCNReplicatorConstraint:a3];
  [a3 encodeBool:self->_replicateOrientation forKey:@"replicatesOrientation"];
  [a3 encodeBool:self->_replicateScale forKey:@"replicatesScale"];
  [a3 encodeBool:self->_replicatePosition forKey:@"replicatesPosition"];
  SCNEncodeVector4(a3, @"orientationOffset", self->_orientationOffset.x, self->_orientationOffset.y, self->_orientationOffset.z, self->_orientationOffset.w);
  SCNEncodeVector3(a3, @"positionOffset", self->_positionOffset.x, self->_positionOffset.y, self->_positionOffset.z);
  SCNEncodeVector3(a3, @"scaleOffset", self->_scaleOffset.x, self->_scaleOffset.y, self->_scaleOffset.z);
}

- (SCNReplicatorConstraint)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNReplicatorConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNReplicatorConstraint *)v4 _customDecodingOfSCNReplicatorConstraint:a3];
    -[SCNReplicatorConstraint setReplicatesOrientation:](v4, "setReplicatesOrientation:", [a3 decodeBoolForKey:@"replicatesOrientation"]);
    -[SCNReplicatorConstraint setReplicatesScale:](v4, "setReplicatesScale:", [a3 decodeBoolForKey:@"replicatesScale"]);
    -[SCNReplicatorConstraint setReplicatesPosition:](v4, "setReplicatesPosition:", [a3 decodeBoolForKey:@"replicatesPosition"]);
    *(float *)&double v6 = SCNDecodeVector4(a3, @"orientationOffset");
    [(SCNReplicatorConstraint *)v4 setOrientationOffset:v6];
    *(float *)&double v7 = SCNDecodeVector3(a3, @"positionOffset");
    [(SCNReplicatorConstraint *)v4 setPositionOffset:v7];
    *(float *)&double v8 = SCNDecodeVector3(a3, @"scaleOffset");
    [(SCNReplicatorConstraint *)v4 setScaleOffset:v8];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end