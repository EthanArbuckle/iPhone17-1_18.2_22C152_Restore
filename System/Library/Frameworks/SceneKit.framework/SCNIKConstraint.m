@interface SCNIKConstraint
+ (BOOL)supportsSecureCoding;
+ (SCNIKConstraint)inverseKinematicsConstraintWithChainRootNode:(SCNNode *)chainRootNode;
- (CGFloat)maxAllowedRotationAngleForJoint:(SCNNode *)node;
- (SCNIKConstraint)init;
- (SCNIKConstraint)initWithChainRootNode:(SCNNode *)chainRootNode;
- (SCNIKConstraint)initWithCoder:(id)a3;
- (SCNNode)chainRootNode;
- (SCNVector3)targetPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jointForNode:(id)a3;
- (void)_customDecodingOfSCNIKConstraint:(id)a3;
- (void)_customEncodingOfSCNIKConstraint:(id)a3;
- (void)_didDecodeSCNIKConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setChainRootNode:(id)a3;
- (void)setMaxAllowedRotationAngle:(CGFloat)angle forJoint:(SCNNode *)node;
- (void)setTargetPosition:(SCNVector3)targetPosition;
@end

@implementation SCNIKConstraint

- (SCNIKConstraint)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNIKConstraint;
  v2 = [(SCNConstraint *)&v4 init];
  if (v2)
  {
    v2->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateIK();
    v2->_jointsPerNode = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionary];
  }
  return v2;
}

- (void)dealloc
{
  self->_chainRootNode = 0;

  v3.receiver = self;
  v3.super_class = (Class)SCNIKConstraint;
  [(SCNConstraint *)&v3 dealloc];
}

+ (SCNIKConstraint)inverseKinematicsConstraintWithChainRootNode:(SCNNode *)chainRootNode
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithChainRootNode:chainRootNode];

  return (SCNIKConstraint *)v3;
}

- (SCNIKConstraint)initWithChainRootNode:(SCNNode *)chainRootNode
{
  objc_super v4 = [(SCNIKConstraint *)self init];
  v5 = v4;
  if (v4) {
    [(SCNIKConstraint *)v4 setChainRootNode:chainRootNode];
  }
  return v5;
}

- (SCNNode)chainRootNode
{
  return self->_chainRootNode;
}

- (void)setChainRootNode:(id)a3
{
  if (self->_chainRootNode != a3)
  {
    self->_chainRootNode = (SCNNode *)a3;
    v5 = [(SCNConstraint *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNIKConstraint_setChainRootNode___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __36__SCNIKConstraint_setChainRootNode___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [*(id *)(a1 + 40) nodeRef];

  C3DConstraintIKSetChainRoot(v1, v2);
}

- (SCNVector3)targetPosition
{
  float x = self->_ikTarget.x;
  float y = self->_ikTarget.y;
  float z = self->_ikTarget.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setTargetPosition:(SCNVector3)targetPosition
{
  float z = targetPosition.z;
  float y = targetPosition.y;
  float x = targetPosition.x;
  self->_ikTarget = targetPosition;
  v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SCNIKConstraint_setTargetPosition___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  +[SCNTransaction postCommandWithContext:v7 object:self key:@"targetPosition" applyBlock:v8];
}

void __37__SCNIKConstraint_setTargetPosition___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u64[0] = *(void *)(a1 + 40);
  a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
  C3DConstraintIKSetTarget(*(__n128 **)(*(void *)(a1 + 32) + 8), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SCNIKConstraint *)self targetPosition];
  objc_msgSend(v4, "setTargetPosition:");
  objc_msgSend(v4, "setChainRootNode:", -[SCNIKConstraint chainRootNode](self, "chainRootNode"));
  [(SCNConstraint *)self copyTo:v4];
  return v4;
}

- (id)jointForNode:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithPointer:");
  v6 = (SCNIKJoint *)[(NSMutableDictionary *)self->_jointsPerNode objectForKey:v5];
  if (!v6)
  {
    v6 = objc_alloc_init(SCNIKJoint);
    [(SCNIKJoint *)v6 setJoint:a3];
    [(SCNIKJoint *)v6 setMaxAllowedRotationAngle:180.0];
    [(NSMutableDictionary *)self->_jointsPerNode setObject:v6 forKey:v5];
  }
  return v6;
}

- (void)setMaxAllowedRotationAngle:(CGFloat)angle forJoint:(SCNNode *)node
{
  objc_msgSend(-[SCNIKConstraint jointForNode:](self, "jointForNode:"), "setMaxAllowedRotationAngle:", angle);
  v7 = [(SCNConstraint *)self sceneRef];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__SCNIKConstraint_setMaxAllowedRotationAngle_forJoint___block_invoke;
  v8[3] = &unk_264004E20;
  *(CGFloat *)&v8[6] = angle;
  v8[4] = self;
  void v8[5] = node;
  +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
}

void __55__SCNIKConstraint_setMaxAllowedRotationAngle_forJoint___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  float v2 = *(double *)(a1 + 48) / 180.0 * 3.14159265;
  objc_super v3 = (void *)[*(id *)(a1 + 40) nodeRef];

  C3DConstraintIKSetMaxRotationForNode(v1, v3, v2);
}

- (CGFloat)maxAllowedRotationAngleForJoint:(SCNNode *)node
{
  id v3 = [(SCNIKConstraint *)self jointForNode:node];
  if (!v3) {
    return 180.0;
  }

  [v3 maxAllowedRotationAngle];
  return result;
}

- (void)_didDecodeSCNIKConstraint:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class(), objc_msgSend(NSString, "stringWithFormat:", @"node%d", 0) forKey];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      [a3 decodeFloatForKey:objc_msgSend(NSString, "stringWithFormat:", @"angle%d", 0)];
      [(SCNIKConstraint *)self setMaxAllowedRotationAngle:v6 forJoint:v7];
      uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class(), objc_msgSend(NSString, "stringWithFormat:", @"node%d", 0) forKey];
    }
    while (v6);
  }
}

- (void)_customEncodingOfSCNIKConstraint:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)[(NSMutableDictionary *)self->_jointsPerNode allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        float v10 = (void *)[(NSMutableDictionary *)self->_jointsPerNode objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * v9)];
        [v10 maxAllowedRotationAngle];
        float v12 = v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"angle%d", v7 + v9);
        *(float *)&double v14 = v12;
        [a3 encodeFloat:v13 forKey:v14];
        uint64_t v15 = [v10 joint];
        [a3 encodeObject:v15, objc_msgSend(NSString, "stringWithFormat:", @"node%d", v7 + v9++) forKey];
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = (v7 + v9);
    }
    while (v6);
  }
  SCNEncodeVector3(a3, @"ikTarget", self->_ikTarget.x, self->_ikTarget.y, self->_ikTarget.z);
}

- (void)_customDecodingOfSCNIKConstraint:(id)a3
{
  self->super._constraintRef = (__C3DConstraint *)C3DConstraintCreateIK();
  *(float *)&double v5 = SCNDecodeVector3(a3, @"ikTarget");
  [(SCNIKConstraint *)self setTargetPosition:v5];

  [(SCNConstraint *)self finalizeDecodeConstraint:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNIKConstraint;
  -[SCNConstraint encodeWithCoder:](&v6, sel_encodeWithCoder_);
  [(SCNIKConstraint *)self _customEncodingOfSCNIKConstraint:a3];
  chainRootNode = self->_chainRootNode;
  if (chainRootNode) {
    [a3 encodeObject:chainRootNode forKey:@"chainRootNode"];
  }
}

- (SCNIKConstraint)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNIKConstraint;
  id v4 = -[SCNConstraint initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNIKConstraint *)v4 _customDecodingOfSCNIKConstraint:a3];
    -[SCNIKConstraint setChainRootNode:](v4, "setChainRootNode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"chainRootNode"]);
    [(SCNIKConstraint *)v4 _didDecodeSCNIKConstraint:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end