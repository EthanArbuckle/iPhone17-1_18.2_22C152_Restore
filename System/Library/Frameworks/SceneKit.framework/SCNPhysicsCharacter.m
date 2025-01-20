@interface SCNPhysicsCharacter
- (BOOL)canJump;
- (SCNPhysicsCharacter)initWithCharacter:(id)a3;
- (double)jumpSpeed;
- (double)velocity;
- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4;
- (void)_handleCreateIfNeeded:(BOOL)a3;
- (void)_update;
- (void)_willRemoveFromPhysicsWorld:(id)a3;
- (void)dealloc;
- (void)jump;
- (void)setJumpSpeed:(double)a3;
- (void)setVelocity:(double)a3;
- (void)setWalkingDirection:(SCNVector3)a3;
@end

@implementation SCNPhysicsCharacter

- (SCNPhysicsCharacter)initWithCharacter:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNPhysicsCharacter;
  v4 = [(SCNPhysicsCharacter *)&v6 init];
  if (v4)
  {
    v4->_definition.characterBody = (SCNPhysicsBody *)a3;
    v4->_definition.velocity = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  characterController = self->_characterController;
  if (characterController) {
    (*((void (**)(btCharacterControllerInterface *))characterController->var0 + 1))(characterController);
  }
  ghostObject = self->_ghostObject;
  if (ghostObject) {
    (*(void (**)(void *))(*(void *)ghostObject + 16))(ghostObject);
  }
  filterCallback = self->_filterCallback;
  if (filterCallback) {
    (*((void (**)(btOverlapFilterCallback *))filterCallback->var0 + 1))(filterCallback);
  }
  capsuleShape = self->_capsuleShape;
  if (capsuleShape) {
    (*((void (**)(btCapsuleShape *))capsuleShape->var0 + 1))(capsuleShape);
  }
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsCharacter;
  [(SCNPhysicsCharacter *)&v7 dealloc];
}

- (void)setWalkingDirection:(SCNVector3)a3
{
  self->_definition.direction = a3;
  double velocity = self->_definition.velocity;
  float y = a3.y;
  *(float32x2_t *)&long long v5 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&a3.x), velocity));
  *(float *)&unsigned int v6 = velocity * a3.z;
  *((void *)&v5 + 1) = v6;
  world = self->_world;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3321888768;
  v8[2] = __43__SCNPhysicsCharacter_setWalkingDirection___block_invoke;
  v8[3] = &unk_26BF6EE78;
  v10 = self;
  long long v9 = v5;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v8];
}

uint64_t __43__SCNPhysicsCharacter_setWalkingDirection___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 48) + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 32))(result, a1 + 32);
  }
  return result;
}

- (BOOL)canJump
{
  return 0;
}

- (void)jump
{
  world = self->_world;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__SCNPhysicsCharacter_jump__block_invoke;
  v3[3] = &unk_264005010;
  v3[4] = self;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v3];
}

uint64_t __27__SCNPhysicsCharacter_jump__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 88))();
  }
  return result;
}

- (void)setVelocity:(double)a3
{
  self->_definition.double velocity = a3;
  *(float32x2_t *)&long long v3 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_definition.direction.x), a3));
  *(float *)&unsigned int v4 = self->_definition.direction.z * a3;
  *((void *)&v3 + 1) = v4;
  world = self->_world;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3321888768;
  v6[2] = __35__SCNPhysicsCharacter_setVelocity___block_invoke;
  v6[3] = &unk_26BF6EE78;
  v8 = self;
  long long v7 = v3;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v6];
}

uint64_t __35__SCNPhysicsCharacter_setVelocity___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 48) + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 32))(result, a1 + 32);
  }
  return result;
}

- (double)velocity
{
  return self->_definition.velocity;
}

- (void)setJumpSpeed:(double)a3
{
  self->_definition.jumpSpeed = a3;
  world = self->_world;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__SCNPhysicsCharacter_setJumpSpeed___block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v4];
}

- (double)jumpSpeed
{
  return self->_definition.jumpSpeed;
}

- (void)_update
{
  id v3 = [(SCNPhysicsBody *)self->_definition.characterBody _owner];
  ghostObject = (int8x16_t *)self->_ghostObject;
  int8x16_t v5 = ghostObject[1];
  int8x16_t v6 = ghostObject[2];
  int8x16_t v7 = ghostObject[3];
  int8x16_t v8 = ghostObject[4];
  int32x2_t v9 = vzip1_s32(*(int32x2_t *)v5.i8, *(int32x2_t *)v6.i8);
  __int32 v10 = v7.i32[0];
  int v11 = 0;
  int32x2_t v12 = vzip2_s32(*(int32x2_t *)v5.i8, *(int32x2_t *)v6.i8);
  __int32 v13 = v7.i32[1];
  int v14 = 0;
  int32x2_t v15 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v5, v5, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  uint64_t v16 = vextq_s8(v7, v7, 8uLL).u32[0];
  uint64_t v17 = v8.i64[0];
  __int32 v18 = v8.i32[2];
  int v19 = 1065353216;
  [v3 setWorldTransform:&v9];
}

- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4
{
  world = self->_world;
  if (world) {
    BOOL v7 = world == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    int8x16_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:](v8);
    }
  }
  self->_world = (SCNPhysicsWorld *)a3;
  [(SCNPhysicsCharacter *)self _handleCreateIfNeeded:1];
  int32x2_t v9 = [(SCNPhysicsWorld *)self->_world _handle];
  if (self->_characterController) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    int v11 = v9;
    (*(void (**)(void *))(*(void *)v9 + 264))(v9);
    if (self->_ghostObject)
    {
      [(SCNPhysicsWorld *)self->_world _allowGhostObjects];
      (*(void (**)(void *, void *, uint64_t, uint64_t, void))(*(void *)v11 + 72))(v11, self->_ghostObject, 32, 3, 0);
    }
  }
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  self->_world = 0;
}

- (void)_handleCreateIfNeeded:(BOOL)a3
{
  if (a3 && !self->_characterController)
  {
    unsigned int v4 = [(SCNPhysicsBody *)self->_definition.characterBody _handle];
    if (v4)
    {
      int8x16_t v5 = v4;
      btCollisionObject::setActivationState(v4, 4);
      if ((*((unsigned char *)v5 + 232) & 2) == 0) {
        operator new();
      }
      long long v13 = *((_OWORD *)v5 + 2);
      *(_OWORD *)buf = *((_OWORD *)v5 + 1);
      long long v14 = *(_OWORD *)buf;
      long long v18 = v13;
      long long v11 = *((_OWORD *)v5 + 4);
      long long v19 = *((_OWORD *)v5 + 3);
      long long v12 = v19;
      long long v20 = v11;
      BOOL v7 = (btPairCachingGhostObject *)btAlignedAllocInternal(336, 16);
      btPairCachingGhostObject::btPairCachingGhostObject(v7);
      self->_ghostObject = v7;
      *((_OWORD *)v7 + 1) = v14;
      *((_OWORD *)v7 + 2) = v13;
      *((_OWORD *)v7 + 3) = v12;
      *((_OWORD *)v7 + 4) = v11;
      int8x16_t v8 = (btCapsuleShape *)*((void *)v5 + 26);
      if (v8->var1 != 10)
      {
        (*((void (**)(void, uint8_t *, float *, float *))v8->var0 + 2))(*((void *)v5 + 26), buf, v16, v15);
        float v9 = v15[1] - v16[1];
        float v10 = v15[0] - v16[0];
        int8x16_t v8 = (btCapsuleShape *)btAlignedAllocInternal(80, 16);
        btCapsuleShape::btCapsuleShape(v8, v10, v9);
        self->_capsuleShape = v8;
      }
      (*(void (**)(void *, btCapsuleShape *))(*(void *)self->_ghostObject + 24))(self->_ghostObject, v8);
      *((_DWORD *)self->_ghostObject + 58) = 16;
      operator new();
    }
    int8x16_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B249000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Character should already have a body", buf, 2u);
    }
  }
}

@end