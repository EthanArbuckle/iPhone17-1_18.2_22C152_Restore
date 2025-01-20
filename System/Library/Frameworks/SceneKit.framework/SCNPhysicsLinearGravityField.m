@interface SCNPhysicsLinearGravityField
- (BOOL)supportsOffset;
- (c3dPhysicsField)_createField;
- (void)setDirection:(SCNVector3)a3;
@end

@implementation SCNPhysicsLinearGravityField

- (void)setDirection:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)SCNPhysicsLinearGravityField;
  -[SCNPhysicsField setDirection:](&v12, sel_setDirection_);
  v7 = objc_msgSend(-[SCNNode scene](self->super._node, "scene"), "physicsWorld");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SCNPhysicsLinearGravityField_setDirection___block_invoke;
  v8[3] = &unk_264005038;
  v8[4] = self;
  float v9 = x;
  float v10 = y;
  float v11 = z;
  [v7 _postCommandWithBlock:v8];
}

_OWORD *__45__SCNPhysicsLinearGravityField_setDirection___block_invoke(uint64_t a1, __n128 a2)
{
  result = *(_OWORD **)(*(void *)(a1 + 32) + 120);
  if (result)
  {
    a2.n128_u64[0] = *(void *)(a1 + 40);
    a2.n128_u32[2] = *(_DWORD *)(a1 + 48);
    __n128 v4 = a2;
    return (_OWORD *)c3dPhysicsFieldLinearGravity::setGravity(result, &v4);
  }
  return result;
}

- (c3dPhysicsField)_createField
{
}

- (BOOL)supportsOffset
{
  return 0;
}

@end