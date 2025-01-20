@interface SCNPhysicsVortexField
- (SCNPhysicsVortexField)init;
- (c3dPhysicsField)_createField;
- (void)setDirection:(SCNVector3)a3;
@end

@implementation SCNPhysicsVortexField

- (SCNPhysicsVortexField)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVortexField;
  return [(SCNPhysicsField *)&v3 init];
}

- (c3dPhysicsField)_createField
{
}

- (void)setDirection:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)SCNPhysicsVortexField;
  -[SCNPhysicsField setDirection:](&v12, sel_setDirection_);
  v7 = objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SCNPhysicsVortexField_setDirection___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  [v7 _postCommandWithBlock:v8];
}

__n128 __38__SCNPhysicsVortexField_setDirection___block_invoke(uint64_t a1, __n128 a2)
{
  v2 = *(__n128 **)(*(void *)(a1 + 32) + 120);
  if (v2)
  {
    a2.n128_u64[0] = *(void *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    v2[15] = a2;
  }
  result.n128_u64[0] = a2.n128_u64[0];
  result.n128_u32[2] = a2.n128_u32[2];
  return result;
}

@end