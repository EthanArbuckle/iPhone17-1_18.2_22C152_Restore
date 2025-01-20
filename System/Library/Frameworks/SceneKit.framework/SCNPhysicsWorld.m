@interface SCNPhysicsWorld
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDefault;
- (BOOL)_needsRedraw;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5;
- (CGFloat)speed;
- (NSArray)allBehaviors;
- (NSArray)contactTestBetweenBody:(SCNPhysicsBody *)bodyA andBody:(SCNPhysicsBody *)bodyB options:(NSDictionary *)options;
- (NSArray)contactTestWithBody:(SCNPhysicsBody *)body options:(NSDictionary *)options;
- (NSArray)convexSweepTestWithShape:(SCNPhysicsShape *)shape fromTransform:(SCNMatrix4 *)from toTransform:(SCNMatrix4 *)to options:(NSDictionary *)options;
- (NSArray)rayTestWithSegmentFromPoint:(SCNVector3)origin toPoint:(SCNVector3)dest options:(NSDictionary *)options;
- (NSTimeInterval)timeStep;
- (SCNPhysicsWorld)initWithCoder:(id)a3;
- (SCNPhysicsWorld)initWithScene:(id)a3;
- (SCNVector3)gravity;
- (btVehicleRaycaster)_defaultVehicleRayCaster;
- (double)scale;
- (id).cxx_construct;
- (id)_findFieldAttachedToNode:(id)a3;
- (id)_physicsContact;
- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5;
- (id)contactDelegate;
- (id)objectInAllBehaviorsAtIndex:(unint64_t)a3;
- (id)removeBehavior_unsafe:(id *)result;
- (id)scene;
- (id)valueForUndefinedKey:(id)a3;
- (void)_addFieldToWorld:(id)a3;
- (void)_aetherHandle;
- (void)_allowGhostObjects;
- (void)_createDynamicWorldIfNeeded;
- (void)_customEncodingOfSCNPhysicsWorld:(id)a3;
- (void)_didDecodeSCNPhysicsWorld:(id)a3;
- (void)_drawDebugInAuthoringEnvironment:(void *)a3;
- (void)_handle;
- (void)_postCommandWithBlock:(id)a3;
- (void)_preTick:(double)a3;
- (void)_removeFieldFromWorld:(id)a3;
- (void)_reset;
- (void)_step:(double)a3;
- (void)_updatePhysicsFieldsTransforms;
- (void)addBehavior:(SCNPhysicsBehavior *)behavior;
- (void)addPhysicsBody:(id)a3 nodeRef:(__C3DNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateBodiesUsingBlock:(id)a3;
- (void)removeAllBehaviors;
- (void)removeBehavior:(SCNPhysicsBehavior *)behavior;
- (void)removePhysicsBody:(id)a3 handle:(void *)a4;
- (void)sceneWillDie;
- (void)setContactDelegate:(id)contactDelegate;
- (void)setGravity:(SCNVector3)gravity;
- (void)setScale:(double)a3;
- (void)setScene:(id)a3;
- (void)setSpeed:(CGFloat)speed;
- (void)setTimeStep:(NSTimeInterval)timeStep;
- (void)updateCollisionPairs;
- (void)wakeUpAllBodies;
@end

@implementation SCNPhysicsWorld

- (void)_preTick:(double)a3
{
  self->_float elapsedTime = self->_elapsedTime + a3;
  if (self->_hasActiveFields)
  {
    btAlignedObjectArray<btRigidBody *>::btAlignedObjectArray((uint64_t)&v13, (uint64_t)self->_world + 320);
    if (SHIDWORD(v13) >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = 8 * HIDWORD(v13);
      do
      {
        uint64_t v6 = *(void *)((char *)v14 + v4);
        int v7 = *(_DWORD *)(v6 + 244);
        if (v7 != 2 && v7 != 5)
        {
          uint64_t v9 = *(void *)(v6 + 200);
          if (v9) {
            uint64_t v10 = *(void *)(v9 + 8);
          }
          else {
            LODWORD(v10) = -1;
          }
          float elapsedTime = self->_elapsedTime;
          c3dAether::evalForce((uint64_t)&self->_aether, v10, *(__n128 *)(v6 + 64), *(__n128 *)(v6 + 352), 1.0 / *(float *)(v6 + 384), *(float *)(v6 + 532), elapsedTime);
          v12.i32[3] = 0;
          *(float32x4_t *)(v6 + 464) = vaddq_f32(*(float32x4_t *)(v6 + 464), vmulq_f32(v12, *(float32x4_t *)(v6 + 400)));
        }
        v4 += 8;
      }
      while (v5 != v4);
    }
    if (v14)
    {
      if (v15) {
        btAlignedFreeInternal((void **)v14);
      }
    }
  }
}

- (void)_createDynamicWorldIfNeeded
{
  if (!self->_world)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_world) {
      operator new();
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_physicsContact
{
  id result = self->_contact;
  if (!result)
  {
    id result = objc_alloc_init(SCNPhysicsContact);
    self->_contact = (SCNPhysicsContact *)result;
  }
  return result;
}

- (void)commonInit
{
  if (-[SCNPhysicsWorld commonInit]::onceToken != -1) {
    dispatch_once(&-[SCNPhysicsWorld commonInit]::onceToken, &__block_literal_global_67);
  }
  self->_lock._os_unfair_lock_opaque = 0;
  self->_bodies = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
}

void __29__SCNPhysicsWorld_commonInit__block_invoke()
{
  gContactAddedCallback = btC3DSupportInternalEdgesCustomCallback;
}

- (SCNPhysicsWorld)initWithScene:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SCNPhysicsWorld;
  uint64_t v4 = [(SCNPhysicsWorld *)&v12 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(SCNPhysicsWorld *)v4 commonInit];
    *(void *)&v5->_gravity.x = 0xC11CCCCD00000000;
    v5->_gravity.z = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v5->_speed = _Q0;
    v5->_timeStep = 0.0166666667;
    v5->_scene = (SCNScene *)a3;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  behaviors = self->_behaviors;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __26__SCNPhysicsWorld_dealloc__block_invoke;
  v34[3] = &unk_2640051E0;
  v34[4] = self;
  [(NSMutableArray *)behaviors enumerateObjectsUsingBlock:v34];
  id v4 = (id)[(NSMutableArray *)self->_fields copy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) _willRemoveFromPhysicsWorld];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }
  if (self->_world)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    bodies = self->_bodies;
    uint64_t v10 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(bodies);
          }
          uint64_t v14 = [*(id *)(*((void *)&v26 + 1) + 8 * j) _handle];
          if (v14) {
            (*(void (**)(void *, uint64_t))(*(void *)self->_world + 184))(self->_world, v14);
          }
        }
        uint64_t v11 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v11);
    }
  }

  vehicleRayCaster = self->_vehicleRayCaster;
  if (vehicleRayCaster) {
    (*((void (**)(btVehicleRaycaster *))vehicleRayCaster->var0 + 1))(vehicleRayCaster);
  }
  debugDrawer = self->_debugDrawer;
  if (debugDrawer) {
    (*((void (**)(btC3DDebugDraw *))debugDrawer->var0 + 1))(debugDrawer);
  }
  world = self->_world;
  if (world)
  {
    v18 = (void *)world[5];
    uint64_t v19 = v18[1311];
    uint64_t v20 = world[12];
    uint64_t v21 = (*(uint64_t (**)(void *))(*world + 200))(world);
    if (self->_ghostPairCallback)
    {
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 72))(v20);
      (*(void (**)(uint64_t, void))(*(void *)v22 + 120))(v22, 0);
      ghostPairCallback = self->_ghostPairCallback;
      if (ghostPairCallback) {
        (*((void (**)(btOverlappingPairCallback *))ghostPairCallback->var0 + 1))(ghostPairCallback);
      }
      self->_ghostPairCallback = 0;
    }
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
    }
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
    }
    (*(void (**)(void *))(*v18 + 8))(v18);
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    }
    v24 = self->_world;
    if (v24) {
      (*(void (**)(void *))(*(void *)v24 + 8))(v24);
    }
  }
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v25.receiver = self;
  v25.super_class = (Class)SCNPhysicsWorld;
  [(SCNPhysicsWorld *)&v25 dealloc];
}

uint64_t __26__SCNPhysicsWorld_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _willRemoveFromPhysicsWorld:*(void *)(a1 + 32)];
}

- (void)sceneWillDie
{
  self->_scene = 0;
  world = self->_world;
  if (world)
  {
    v3 = (void **)*((void *)world + 3);
    if (v3)
    {
      if (*((unsigned char *)world + 32)) {
        btAlignedFreeInternal(v3);
      }
    }
    *((unsigned char *)world + 32) = 1;
    *((void *)world + 3) = 0;
    *((_DWORD *)world + 3) = 0;
    *((_DWORD *)world + 4) = 0;
  }
}

- (BOOL)_isDefault
{
  v5.y = -9.8;
  v5.x = 0.0;
  v5.z = 0.0;
  BOOL v3 = SCNVector3EqualToVector3(self->_gravity, v5);
  if (v3) {
    LOBYTE(v3) = self->_speed == 1.0
  }
              && self->_scale == 1.0
              && self->_timeStep == 0.0166666667
              && [(NSMutableArray *)self->_behaviors count] == 0;
  return v3;
}

- (void)wakeUpAllBodies
{
  world = (btCollisionObject *)self->_world;
  if (world) {
    btDiscreteDynamicsWorld::activateAllBodies(world);
  }
}

- (void)setGravity:(SCNVector3)gravity
{
  self->_gravity = gravity;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __30__SCNPhysicsWorld_setGravity___block_invoke;
  v3[3] = &unk_264005038;
  v3[4] = self;
  SCNVector3 v4 = gravity;
  [(SCNPhysicsWorld *)self _postCommandWithBlock:v3];
}

uint64_t __30__SCNPhysicsWorld_setGravity___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(_DWORD *)(a1 + 48);
    int v5 = 0;
    (*(void (**)(uint64_t, uint64_t *))(*(void *)result + 144))(result, &v3);
    return [*(id *)(a1 + 32) wakeUpAllBodies];
  }
  return result;
}

- (SCNVector3)gravity
{
  float x = self->_gravity.x;
  float y = self->_gravity.y;
  float z = self->_gravity.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setSpeed:(CGFloat)speed
{
  self->_speed = speed;
}

- (CGFloat)speed
{
  return self->_speed;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_float scale = a3;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__SCNPhysicsWorld_setScale___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    [(SCNPhysicsWorld *)self _postCommandWithBlock:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNPhysicsWorld_setScale___block_invoke_2;
    v7[3] = &__block_descriptor_40_e28_v24__0__SCNPhysicsBody_8_B16l;
    *(double *)&v7[4] = a3;
    [(SCNPhysicsWorld *)self enumerateBodiesUsingBlock:v7];
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      float scale = self->_scale;
      debugDrawer->var2 = 1.0 / scale;
    }
  }
}

float __28__SCNPhysicsWorld_setScale___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v1)
  {
    float result = *(double *)(a1 + 40);
    *(float *)(v1 + 228) = result;
  }
  return result;
}

uint64_t __28__SCNPhysicsWorld_setScale___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateGlobalScale:*(double *)(a1 + 32)];
}

- (double)scale
{
  return self->_scale;
}

- (void)setTimeStep:(NSTimeInterval)timeStep
{
  self->_timeStep = timeStep;
}

- (NSTimeInterval)timeStep
{
  return self->_timeStep;
}

- (id)contactDelegate
{
  return objc_loadWeak((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)contactDelegate
{
  p_contactDelegate = &self->_contactDelegate;
  if (objc_loadWeak((id *)&self->_contactDelegate) != contactDelegate) {
    objc_storeWeak((id *)p_contactDelegate, contactDelegate);
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__SCNPhysicsWorld_setContactDelegate___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = contactDelegate;
  [(SCNPhysicsWorld *)self _postCommandWithBlock:v6];
}

uint64_t __38__SCNPhysicsWorld_setContactDelegate___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (v1) {
    return btC3DCollisionDispatcher::setDelegate(*(void *)(v1 + 40), *(void *)(result + 40));
  }
  return result;
}

- (void)addBehavior:(SCNPhysicsBehavior *)behavior
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  behaviors = self->_behaviors;
  if (!behaviors)
  {
    behaviors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_behaviors = behaviors;
  }
  [(NSMutableArray *)behaviors addObject:behavior];
  self->_activeBehaviorsValid = 0;
  os_unfair_lock_unlock(p_lock);
  [(SCNPhysicsBehavior *)behavior _copyDefinition:__src];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__SCNPhysicsWorld_addBehavior___block_invoke;
  v7[3] = &unk_264008300;
  v7[4] = behavior;
  void v7[5] = self;
  memcpy(v8, __src, sizeof(v8));
  [(SCNPhysicsWorld *)self _postCommandWithBlock:v7];
}

uint64_t __31__SCNPhysicsWorld_addBehavior___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  memcpy(v5, (const void *)(a1 + 48), sizeof(v5));
  [v2 _addToPhysicsWorld:v3 definition:v5];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyA"), "_activate");
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyB"), "_activate");
}

- (id)removeBehavior_unsafe:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __41__SCNPhysicsWorld_removeBehavior_unsafe___block_invoke;
    v4[3] = &unk_264006160;
    v4[4] = a2;
    v4[5] = result;
    [result _postCommandWithBlock:v4];
    float result = (id *)[v3[23] removeObject:a2];
    *((unsigned char *)v3 + 200) = 0;
  }
  return result;
}

uint64_t __41__SCNPhysicsWorld_removeBehavior_unsafe___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _willRemoveFromPhysicsWorld:*(void *)(a1 + 40)];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "bodyA"), "_activate");
  v2 = (void *)[*(id *)(a1 + 32) bodyB];

  return [v2 _activate];
}

- (void)removeBehavior:(SCNPhysicsBehavior *)behavior
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, (uint64_t)behavior);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllBehaviors
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int v4 = (void *)[(NSMutableArray *)self->_behaviors copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)objectInAllBehaviorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_behaviors objectAtIndexedSubscript:a3];
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  uint64_t v8 = objc_msgSend(a3, "rangeOfString:", @"[", a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = v8 + 1;
  if (v8 + 1 >= (unint64_t)[a3 length]) {
    return 0;
  }
  uint64_t v11 = [a3 substringToIndex:v9];
  long long v12 = (void *)[a3 substringFromIndex:v10];
  uint64_t v13 = [v12 rangeOfString:@"]"];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int v14 = objc_msgSend((id)objc_msgSend(v12, "substringToIndex:", v13), "intValue");
  char v15 = (void *)[(SCNPhysicsWorld *)self valueForKey:v11];
  if ([v15 count] <= (unint64_t)v14) {
    return 0;
  }
  *a5 = (id)[v15 objectAtIndex:v14];
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v7 = 0;
  if ([(SCNPhysicsWorld *)self parseSpecialKey:a3 withPath:a3 intoDestination:&v7])
  {
    return v7;
  }
  v6.receiver = self;
  v6.super_class = (Class)SCNPhysicsWorld;
  return [(SCNPhysicsWorld *)&v6 valueForUndefinedKey:a3];
}

- (NSArray)allBehaviors
{
  if (self->_behaviors) {
    return &self->_behaviors->super;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (NSArray)rayTestWithSegmentFromPoint:(SCNVector3)origin toPoint:(SCNVector3)dest options:(NSDictionary *)options
{
  *(void *)&long long v5 = *(void *)&origin.x;
  *((void *)&v5 + 1) = LODWORD(origin.z);
  *(void *)&long long v6 = *(void *)&dest.x;
  *((void *)&v6 + 1) = LODWORD(dest.z);
  long long v8 = v6;
  long long v9 = v5;
  float result = [(SCNPhysicsWorld *)self _rayTestWithSegmentFromPoint:&v9 toPoint:&v8 options:options];
  if (!result) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  return result;
}

- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5
{
  uint64_t v7 = v6;
  long long v8 = v5;
  uint64_t v11 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene", *(double *)a3.var0.var0, *(double *)&a3.var0.var0[1], *(double *)&a3.var0.var0[2], *(double *)&a3.var0.var0[3], *(double *)a4.var0.var0, *(double *)&a4.var0.var0[1], *(double *)&a4.var0.var0[2], *(double *)&a4.var0.var0[3]), "sceneRef");
  if (!v11 || !self->_world) {
    return 0;
  }
  uint64_t v12 = v11;
  btC3DRayResultCallback::btC3DRayResultCallback((btC3DRayResultCallback *)v25, (const btVector3 *)a5, v8);
  uint64_t v13 = (void *)[v7 objectForKey:@"backfaceCulling"];
  if (!v13 || [v13 BOOLValue]) {
    v26 |= 1u;
  }
  int v14 = (void *)[v7 objectForKey:@"results"];
  if ([v14 isEqualToString:@"all"]) {
    int v15 = 2;
  }
  else {
    int v15 = [v14 isEqualToString:@"closest"] ^ 1;
  }
  int v27 = v15;
  v16 = (void *)[v7 objectForKey:@"collisionBitMask"];
  if (v16) {
    uint64_t v17 = [v16 unsignedIntegerValue];
  }
  else {
    uint64_t v17 = -1;
  }
  v25[4] = v17;
  C3DSceneLock(v12);
  (*(void (**)(void *, id, const btVector3 *, void *))(*(void *)self->_world + 64))(self->_world, a5, v8, v25);
  C3DSceneUnlock(v12);
  if (v27 == 2)
  {
    int v18 = v30;
    uint64_t v19 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v30];
    if (v18 >= 1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        uint64_t v21 = _hitTestResult(*((const btCollisionObject **)v31 + i), (float32x4_t *)v39 + i, (float32x4_t *)v35 + i);
        if (v21) {
          [v19 addObject:v21];
        }
      }
    }
  }
  else
  {
    uint64_t v22 = _hitTestResult((const btCollisionObject *)v25[2], &v29, &v28);
    if (!v22)
    {
      uint64_t v19 = 0;
      char v23 = 0;
      goto LABEL_22;
    }
    uint64_t v19 = (void *)[MEMORY[0x263EFF8C0] arrayWithObject:v22];
  }
  char v23 = 1;
LABEL_22:
  v25[0] = &unk_26BF6B438;
  if (v43 && v44) {
    btAlignedFreeInternal((void **)v43);
  }
  char v44 = 1;
  v43 = 0;
  int v41 = 0;
  int v42 = 0;
  if (v39 && v40) {
    btAlignedFreeInternal((void **)v39);
  }
  char v40 = 1;
  v39 = 0;
  int v37 = 0;
  int v38 = 0;
  if (v35 && v36) {
    btAlignedFreeInternal((void **)v35);
  }
  char v36 = 1;
  v35 = 0;
  int v33 = 0;
  int v34 = 0;
  if (v31 && v32) {
    btAlignedFreeInternal((void **)v31);
  }
  if ((v23 & 1) == 0) {
    return 0;
  }
  return v19;
}

- (NSArray)contactTestBetweenBody:(SCNPhysicsBody *)bodyA andBody:(SCNPhysicsBody *)bodyB options:(NSDictionary *)options
{
  uint64_t v9 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (v9)
  {
    world = (NSArray *)self->_world;
    if (world)
    {
      uint64_t v11 = v9;
      id v12 = [(NSDictionary *)options objectForKey:@"collisionBitMask"];
      if (v12) {
        uint64_t v13 = [v12 unsignedIntegerValue];
      }
      else {
        uint64_t v13 = -1;
      }
      uint64_t v17 = &unk_26BF6BDB8;
      long long v18 = xmmword_20B5CD040;
      long long v19 = xmmword_20B5CC140;
      uint64_t v20 = v13;
      uint64_t v21 = 0;
      C3DSceneLock(v11);
      int v14 = [(SCNPhysicsBody *)bodyA _handle];
      int v15 = [(SCNPhysicsBody *)bodyB _handle];
      if (v14 && v15) {
        btCollisionWorld::contactPairTest((uint64_t)self->_world, (uint64_t)v14, (uint64_t)v15, (uint64_t)&v17);
      }
      C3DSceneUnlock(v11);
      world = v21;
    }
  }
  else
  {
    world = 0;
  }
  if (world) {
    return world;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (NSArray)contactTestWithBody:(SCNPhysicsBody *)body options:(NSDictionary *)options
{
  uint64_t v7 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (v7)
  {
    world = (NSArray *)self->_world;
    if (world)
    {
      uint64_t v9 = v7;
      id v10 = [(NSDictionary *)options objectForKey:@"collisionBitMask"];
      if (v10) {
        uint64_t v11 = [v10 unsignedIntegerValue];
      }
      else {
        uint64_t v11 = -1;
      }
      int v14 = &unk_26BF6BDB8;
      long long v15 = xmmword_20B5CD040;
      long long v16 = xmmword_20B5CC140;
      uint64_t v17 = v11;
      long long v18 = 0;
      C3DSceneLock(v9);
      id v12 = [(SCNPhysicsBody *)body _handle];
      if (v12) {
        btCollisionWorld::contactTest((uint64_t)self->_world, (uint64_t)v12, (uint64_t)&v14);
      }
      C3DSceneUnlock(v9);
      world = v18;
    }
  }
  else
  {
    world = 0;
  }
  if (world) {
    return world;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (NSArray)convexSweepTestWithShape:(SCNPhysicsShape *)shape fromTransform:(SCNMatrix4 *)from toTransform:(SCNMatrix4 *)to options:(NSDictionary *)options
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend(-[SCNPhysicsWorld scene](self, "scene"), "sceneRef");
  if (!v11) {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
  id v12 = (NSArray *)MEMORY[0x263EFFA68];
  if (self->_world)
  {
    uint64_t v13 = v11;
    id v14 = [(NSDictionary *)options objectForKey:@"ccdPenetration"];
    if (v14)
    {
      [v14 floatValue];
      float v16 = v15;
    }
    else
    {
      float v16 = 0.0;
    }
    id v17 = [(NSDictionary *)options objectForKey:@"collisionBitMask"];
    if (v17) {
      uint64_t v18 = [v17 unsignedIntegerValue];
    }
    else {
      uint64_t v18 = -1;
    }
    id v19 = [(NSDictionary *)options objectForKey:@"results"];
    if ([v19 isEqualToString:@"all"]) {
      int v20 = 2;
    }
    else {
      int v20 = [v19 isEqualToString:@"closest"] ^ 1;
    }
    C3DSceneLock(v13);
    uint64_t v21 = [(SCNPhysicsShape *)shape _handle];
    if (v21)
    {
      if (v21->var1 > 19)
      {
        int v41 = scn_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          -[SCNPhysicsWorld convexSweepTestWithShape:fromTransform:toTransform:options:](v41);
        }
      }
      else
      {
        float m12 = from->m12;
        float m13 = from->m13;
        float m21 = from->m21;
        float m22 = from->m22;
        float m23 = from->m23;
        float m31 = from->m31;
        float m32 = from->m32;
        float m33 = from->m33;
        float m43 = from->m43;
        v46[0] = LODWORD(from->m11);
        *(float *)&v46[1] = m21;
        *(float *)&v46[2] = m31;
        v46[3] = 0;
        *(float *)&v46[4] = m12;
        *(float *)&v46[5] = m22;
        *(float *)&v46[6] = m32;
        v46[7] = 0;
        *(float *)&v46[8] = m13;
        *(float *)&v46[9] = m23;
        *(float *)&v46[10] = m33;
        v46[11] = 0;
        *(void *)&long long v47 = *(void *)&from->m41;
        *((void *)&v47 + 1) = LODWORD(m43);
        float v31 = to->m12;
        float v32 = to->m13;
        float v33 = to->m21;
        float v34 = to->m22;
        float v35 = to->m23;
        float v36 = to->m31;
        float v37 = to->m32;
        float v38 = to->m33;
        float v39 = to->m43;
        v44[0] = LODWORD(to->m11);
        *(float *)&v44[1] = v33;
        *(float *)&v44[2] = v36;
        v44[3] = 0;
        *(float *)&v44[4] = v31;
        *(float *)&v44[5] = v34;
        *(float *)&v44[6] = v37;
        v44[7] = 0;
        *(float *)&v44[8] = v32;
        *(float *)&v44[9] = v35;
        *(float *)&v44[10] = v38;
        v44[11] = 0;
        *(void *)&long long v45 = *(void *)&to->m41;
        *((void *)&v45 + 1) = LODWORD(v39);
        float v49 = 1.0;
        uint64_t v50 = 1;
        uint64_t v51 = v18;
        uint64_t v52 = 0;
        long long v53 = v47;
        long long v54 = v45;
        v56 = 0;
        v59 = 0;
        v48 = &unk_26BF6BB50;
        int v55 = v20;
        btCollisionWorld::convexSweepTest((uint64_t)self->_world, v21, (uint64_t)v46, (uint64_t)v44, (float *)&v48, v16);
        if (v49 < 1.0)
        {
          if (v20 == 2)
          {
            char v40 = v59;
            goto LABEL_21;
          }
          v43 = __contact(v56, 0, &v58, &v57, 0.0, v49);
          if (v43)
          {
            char v40 = (NSArray *)[MEMORY[0x263EFF8C0] arrayWithObject:v43];
LABEL_21:
            C3DSceneUnlock(v13);
            if (v40) {
              return v40;
            }
            return v12;
          }
        }
      }
    }
    char v40 = 0;
    goto LABEL_21;
  }
  return v12;
}

- (void)updateCollisionPairs
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__SCNPhysicsWorld_updateCollisionPairs__block_invoke;
  v2[3] = &unk_264005010;
  v2[4] = self;
  [(SCNPhysicsWorld *)self _postCommandWithBlock:v2];
}

uint64_t __39__SCNPhysicsWorld_updateCollisionPairs__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    (*(void (**)(uint64_t))(*(void *)result + 16))(result);
    uint64_t v3 = *(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 8) + 24);
    return v3();
  }
  return result;
}

- (BOOL)_needsRedraw
{
  return self->_speed != 0.0 && (world = self->_world) != 0 && world[448] != 0;
}

- (void)enumerateBodiesUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  bodies = self->_bodies;
  uint64_t v7 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(bodies);
      }
      (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v11 + 1) + 8 * v10), &v15);
      if (v15) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  bodies = self->_bodies;
  uint64_t v5 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(bodies);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v9 clearAllForces];
        [v9 resetTransform];
        LODWORD(v10) = 0;
        LODWORD(v11) = 0;
        LODWORD(v12) = 0;
        objc_msgSend(v9, "setVelocity:", v10, v11, v12);
        LODWORD(v13) = 0;
        LODWORD(v14) = 0;
        LODWORD(v15) = 0;
        LODWORD(v16) = 0;
        objc_msgSend(v9, "setAngularVelocity:", v13, v14, v15, v16);
      }
      uint64_t v6 = [(NSMutableSet *)bodies countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)_findFieldAttachedToNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fields = self->_fields;
  uint64_t v5 = [(NSMutableArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(fields);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)[v9 _owner] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)fields countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)_addFieldToWorld:(id)a3
{
  fields = self->_fields;
  if (!fields)
  {
    fields = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_fields = fields;
  }
  [(NSMutableArray *)fields addObject:a3];
  [a3 _setWorld:self];
  uint64_t v6 = (c3dPhysicsField *)[a3 _handle];
  if (v6)
  {
    c3dAether::addField(&self->_aether, v6);
  }
}

- (void)_removeFieldFromWorld:(id)a3
{
  -[NSMutableArray removeObject:](self->_fields, "removeObject:");
  uint64_t v5 = (c3dPhysicsField *)[a3 _handle];

  c3dAether::removeField(&self->_aether, v5);
}

- (void)_aetherHandle
{
  return &self->_aether;
}

- (void)_updatePhysicsFieldsTransforms
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  self->_hasActiveFields = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  fields = self->_fields;
  uint64_t v4 = [(NSMutableArray *)fields countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(fields);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        self->_hasActiveFields |= [v8 isActive];
        uint64_t v9 = (float32x4_t *)objc_msgSend((id)objc_msgSend(v8, "_owner"), "nodeRef");
        double v10 = (_OWORD *)[v8 _handle];
        WorldMatrifloat x = C3DNodeGetWorldMatrix(v9);
        C3DMatrix4x4Invert((simd_float4x4 *)WorldMatrix, &v19);
        float32x4_t v12 = WorldMatrix[1];
        float32x4_t v13 = WorldMatrix[2];
        float32x4_t v14 = WorldMatrix[3];
        simd_float4 v15 = v19.columns[0];
        simd_float4 v16 = v19.columns[1];
        simd_float4 v17 = v19.columns[2];
        simd_float4 v18 = v19.columns[3];
        v10[1] = *WorldMatrix;
        v10[2] = v12;
        v10[3] = v13;
        v10[4] = v14;
        v10[5] = v15;
        v10[6] = v16;
        v10[7] = v17;
        v10[8] = v18;
        (*(void (**)(_OWORD *))(*(void *)v10 + 40))(v10);
      }
      uint64_t v5 = [(NSMutableArray *)fields countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)_step:(double)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  world = self->_world;
  if (world)
  {
    float timeStep = self->_timeStep;
    double speed = self->_speed;
    a3 = speed * a3;
    *(float *)&a3 = a3;
    *(float *)&double speed = speed * (float)((float)(1.0 / timeStep) / 15.0);
    int v7 = vcvtps_s32_f32(*(float *)&speed);
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = (btC3DCollisionDispatcher *)world[5];
    if (!self->_firstSimulationDone)
    {
      self->_firstSimulationDone = 1;
      if (timeStep >= *(float *)&a3) {
        *(float *)&a3 = timeStep;
      }
    }
    (*(void (**)(void *, uint64_t, __n128))(*world + 104))(world, v8, *(__n128 *)&a3);
    if (objc_loadWeak((id *)&self->_contactDelegate)) {
      btC3DCollisionDispatcher::dispatchContactsToDelegate(v9);
    }
    if (!self->_activeBehaviorsValid)
    {
      os_unfair_lock_lock(&self->_lock);
      self->_activeBehaviorsValid = 1;

      self->_activeBehaviors = (NSArray *)[(NSMutableArray *)self->_behaviors copy];
      os_unfair_lock_unlock(&self->_lock);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    activeBehaviors = self->_activeBehaviors;
    uint64_t v11 = [(NSArray *)activeBehaviors countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(activeBehaviors);
          }
          simd_float4 v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v15 _update];
          }
        }
        uint64_t v12 = [(NSArray *)activeBehaviors countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (btVehicleRaycaster)_defaultVehicleRayCaster
{
  uint64_t result = self->_vehicleRayCaster;
  if (!result)
  {
    [(SCNPhysicsWorld *)self _createDynamicWorldIfNeeded];
    operator new();
  }
  return result;
}

- (void)_handle
{
  return self->_world;
}

- (void)_allowGhostObjects
{
  if (!self->_ghostPairCallback)
  {
    [(SCNPhysicsWorld *)self _createDynamicWorldIfNeeded];
    operator new();
  }
}

- (id)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  self->_scene = (SCNScene *)a3;
}

- (void)_postCommandWithBlock:(id)a3
{
  uint64_t v5 = [(SCNScene *)self->_scene sceneRef];
  scene = self->_scene;

  +[SCNTransaction postCommandWithContext:v5 object:scene applyBlock:a3];
}

- (void)_drawDebugInAuthoringEnvironment:(void *)a3
{
  if (self->_world)
  {
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      debugDrawer->var3 = a3;
      (*(void (**)(void *, btC3DDebugDraw *))(*(void *)self->_world + 32))(self->_world, self->_debugDrawer);
      (*(void (**)(void *))(*(void *)self->_world + 48))(self->_world);
      (*(void (**)(void *, void))(*(void *)self->_world + 32))(self->_world, 0);
      self->_debugDrawer->var3 = 0;
    }
  }
}

- (void)addPhysicsBody:(id)a3 nodeRef:(__C3DNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7
{
  uint64_t v13 = [(SCNPhysicsWorld *)self _handle];
  if (v13)
  {
    uint64_t v14 = (uint64_t)v13;
    [a3 centerOfMassOffset];
    v16.n128_u32[1] = v15;
    v16.n128_u32[2] = v17;
    C3DPhysicsWorldAddBodyToWorld(v14, [a3 _handle], a4, a5, a6, a7, v16);
  }
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_bodies addObject:a3];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removePhysicsBody:(id)a3 handle:(void *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  world = self->_world;
  if (world) {
    (*(void (**)(void *, void *))(*(void *)world + 184))(world, a4);
  }
  os_unfair_lock_lock(&self->_lock);
  int v7 = (void *)[(NSMutableArray *)self->_behaviors copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v12 hasReferenceToPhysicsBody:a3]) {
          -[SCNPhysicsWorld removeBehavior_unsafe:]((id *)&self->super.isa, (uint64_t)v12);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(NSMutableSet *)self->_bodies removeObject:a3];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_customEncodingOfSCNPhysicsWorld:(id)a3
{
  behaviors = self->_behaviors;
  if (behaviors) {
    [a3 encodeObject:behaviors forKey:@"behaviors"];
  }
}

- (void)_didDecodeSCNPhysicsWorld:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"behaviors");
  +[SCNTransaction setImmediateMode:0];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SCNPhysicsWorld *)self addBehavior:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNPhysicsWorld _customEncodingOfSCNPhysicsWorld:](self, "_customEncodingOfSCNPhysicsWorld:");
  scene = self->_scene;
  if (scene) {
    [a3 encodeObject:scene forKey:@"scene"];
  }
  SCNEncodeVector3(a3, @"gravity", self->_gravity.x, self->_gravity.y, self->_gravity.z);
  [a3 encodeDouble:@"speed" forKey:self->_speed];
  [a3 encodeDouble:@"scale" forKey:self->_scale];
  double timeStep = self->_timeStep;

  [a3 encodeDouble:@"timeStep" forKey:timeStep];
}

- (SCNPhysicsWorld)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsWorld;
  uint64_t v4 = [(SCNPhysicsWorld *)&v8 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNPhysicsWorld *)v4 _customDecodingOfSCNPhysicsWorld:a3];
    -[SCNPhysicsWorld setScene:](v4, "setScene:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"scene"]);
    *(float *)&double v6 = SCNDecodeVector3(a3, @"gravity");
    [(SCNPhysicsWorld *)v4 setGravity:v6];
    [a3 decodeDoubleForKey:@"speed"];
    -[SCNPhysicsWorld setSpeed:](v4, "setSpeed:");
    [a3 decodeDoubleForKey:@"scale"];
    -[SCNPhysicsWorld setScale:](v4, "setScale:");
    [a3 decodeDoubleForKey:@"timeStep"];
    -[SCNPhysicsWorld setTimeStep:](v4, "setTimeStep:");
    [(SCNPhysicsWorld *)v4 _didDecodeSCNPhysicsWorld:a3];
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (void)convexSweepTestWithShape:(os_log_t)log fromTransform:toTransform:options:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: convexSweep only works with convex shapes", v1, 2u);
}

@end