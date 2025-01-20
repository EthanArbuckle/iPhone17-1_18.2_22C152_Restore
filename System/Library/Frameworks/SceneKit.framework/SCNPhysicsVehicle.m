@interface SCNPhysicsVehicle
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsVehicle)vehicleWithChassisBody:(SCNPhysicsBody *)chassisBody wheels:(NSArray *)wheels;
- (BOOL)hasReferenceToPhysicsBody:(id)a3;
- (CGFloat)speedInKilometersPerHour;
- (NSArray)wheels;
- (SCNPhysicsBody)chassisBody;
- (SCNPhysicsVehicle)initWithChassisBody:(id)a3 wheels:(id)a4;
- (SCNPhysicsVehicle)initWithCoder:(id)a3;
- (id)physicsWorld;
- (id)valueForKeyPath:(id)a3;
- (id)wheelAtIndex:(unint64_t)a3;
- (void)_addToPhysicsWorld:(id)a3 definition:(id *)a4;
- (void)_createWheel:(id)a3;
- (void)_handleCreateIfNeeded:(BOOL)a3;
- (void)_initializeWheelsArray;
- (void)_update;
- (void)_willRemoveFromPhysicsWorld:(id)a3;
- (void)applyBrakingForce:(CGFloat)value forWheelAtIndex:(NSInteger)index;
- (void)applyEngineForce:(CGFloat)value forWheelAtIndex:(NSInteger)index;
- (void)btVehicle;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSteeringAngle:(CGFloat)value forWheelAtIndex:(NSInteger)index;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation SCNPhysicsVehicle

- (void)_initializeWheelsArray
{
  wheels = self->_wheels;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__SCNPhysicsVehicle__initializeWheelsArray__block_invoke;
  v3[3] = &unk_26400B198;
  v3[4] = self;
  [(NSArray *)wheels enumerateObjectsUsingBlock:v3];
}

uint64_t __43__SCNPhysicsVehicle__initializeWheelsArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 _setVehicle:*(void *)(a1 + 32)];

  return [a2 _setWheelIndex:a3];
}

- (SCNPhysicsVehicle)initWithChassisBody:(id)a3 wheels:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsVehicle;
  v6 = [(SCNPhysicsVehicle *)&v8 init];
  if (v6)
  {
    v6->_chassisBody = (SCNPhysicsBody *)a3;
    v6->_wheels = (NSArray *)[a4 copy];
    [(SCNPhysicsVehicle *)v6 _initializeWheelsArray];
  }
  return v6;
}

+ (SCNPhysicsVehicle)vehicleWithChassisBody:(SCNPhysicsBody *)chassisBody wheels:(NSArray *)wheels
{
  v4 = (void *)[objc_alloc((Class)a1) initWithChassisBody:chassisBody wheels:wheels];

  return (SCNPhysicsVehicle *)v4;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  wheels = self->_wheels;
  uint64_t v4 = [(NSArray *)wheels countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(wheels);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) _setVehicle:0];
      }
      uint64_t v5 = [(NSArray *)wheels countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SCNPhysicsVehicle;
  [(SCNPhysicsVehicle *)&v8 dealloc];
}

- (SCNPhysicsBody)chassisBody
{
  return self->_chassisBody;
}

- (NSArray)wheels
{
  v2 = (void *)[(NSArray *)self->_wheels copy];

  return (NSArray *)v2;
}

- (void)btVehicle
{
  return self->_vehicle;
}

- (id)physicsWorld
{
  return self->_world;
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
    objc_super v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNPhysicsHingeJoint _addToPhysicsWorld:definition:](v8);
    }
  }
  self->_world = (SCNPhysicsWorld *)a3;
  [(SCNPhysicsVehicle *)self _handleCreateIfNeeded:1];
  long long v9 = [(SCNPhysicsWorld *)self->_world _handle];
  if (self->_vehicle) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10) {
    (*(void (**)(void *))(*(void *)v9 + 248))(v9);
  }
}

- (void)_willRemoveFromPhysicsWorld:(id)a3
{
  if (self->_vehicle)
  {
    uint64_t v4 = [a3 _handle];
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 256))(v4, self->_vehicle);
    vehicle = self->_vehicle;
    if (vehicle) {
      (*(void (**)(void *))(*(void *)vehicle + 8))(vehicle);
    }
    self->_vehicle = 0;
  }
}

- (void)setSteeringAngle:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  world = self->_world;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SCNPhysicsVehicle_setSteeringAngle_forWheelAtIndex___block_invoke;
  v5[3] = &unk_264007A28;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v5];
}

uint64_t __54__SCNPhysicsVehicle_setSteeringAngle_forWheelAtIndex___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32))
  {
    float v1 = *(double *)(result + 40);
    return btRaycastVehicle::setSteeringValue(*(void *)(*(void *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)applyEngineForce:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  world = self->_world;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SCNPhysicsVehicle_applyEngineForce_forWheelAtIndex___block_invoke;
  v5[3] = &unk_264007A28;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v5];
}

uint64_t __54__SCNPhysicsVehicle_applyEngineForce_forWheelAtIndex___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32))
  {
    float v1 = *(double *)(result + 40);
    return btRaycastVehicle::applyEngineForce(*(void *)(*(void *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)applyBrakingForce:(CGFloat)value forWheelAtIndex:(NSInteger)index
{
  world = self->_world;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SCNPhysicsVehicle_applyBrakingForce_forWheelAtIndex___block_invoke;
  v5[3] = &unk_264007A28;
  v5[4] = self;
  *(CGFloat *)&v5[5] = value;
  v5[6] = index;
  [(SCNPhysicsWorld *)world _postCommandWithBlock:v5];
}

uint64_t __55__SCNPhysicsVehicle_applyBrakingForce_forWheelAtIndex___block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 32))
  {
    float v1 = *(double *)(result + 40);
    return btRaycastVehicle::setBrake(*(void *)(*(void *)(result + 32) + 32), v1, *(_DWORD *)(result + 48));
  }
  return result;
}

- (void)_createWheel:(id)a3
{
  vehicle = self->_vehicle;
  [a3 suspensionStiffness];
  *(float *)&double v5 = v5;
  LODWORD(v34) = LODWORD(v5);
  [a3 suspensionCompression];
  *(float *)&double v6 = v6;
  HIDWORD(v34) = LODWORD(v6);
  [a3 suspensionDamping];
  *(float *)&double v7 = v7;
  int v35 = LODWORD(v7);
  [a3 frictionSlip];
  *(float *)&double v8 = v8 * 10.5;
  int v37 = LODWORD(v8);
  [a3 maximumSuspensionForce];
  *(float *)&double v9 = v9;
  int v38 = LODWORD(v9);
  [a3 maximumSuspensionTravel];
  *(float *)&double v10 = v10;
  int v36 = LODWORD(v10);
  [a3 steeringAxis];
  unsigned int v12 = v11;
  unsigned int v14 = v13;
  unsigned int v16 = v15;
  [a3 axle];
  unsigned int v18 = v17;
  unsigned int v20 = v19;
  unsigned int v22 = v21;
  [a3 connectionPosition];
  objc_msgSend(a3, "suspensionRestLength", __PAIR64__(v20, v18), v22, __PAIR64__(v14, v12), v16, __PAIR64__(v25, v24), v23);
  float v27 = v26;
  [a3 radius];
  float v29 = v28;
  uint64_t v30 = btRaycastVehicle::addWheel((uint64_t)vehicle, &v33, &v32, &v31, &v34, [a3 isFront], v27, v29);
  *(void *)(v30 + 288) = objc_msgSend((id)objc_msgSend(a3, "node"), "nodeRef");
}

- (void)_handleCreateIfNeeded:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a3 && !self->_vehicle)
  {
    if ([(SCNPhysicsBody *)self->_chassisBody sceneRef])
    {
      uint64_t v4 = [(SCNPhysicsBody *)self->_chassisBody _handle];
      if (v4)
      {
        btCollisionObject::setActivationState(v4, 4);
        [(SCNPhysicsWorld *)self->_world _defaultVehicleRayCaster];
        *(_OWORD *)buf = xmmword_20B5EFCB0;
        uint64_t v8 = 0x45BB800041280000;
        operator new();
      }
      double v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B249000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Chassis should already have a body", buf, 2u);
      }
    }
    else
    {
      double v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SCNPhysicsVehicle _handleCreateIfNeeded:](v5);
      }
    }
  }
}

- (void)_update
{
  vehicle = (float *)self->_vehicle;
  if (vehicle)
  {
    int v4 = *((_DWORD *)vehicle + 51);
    if (v4 >= 1)
    {
      for (int i = 0; i != v4; ++i)
      {
        btRaycastVehicle::updateWheelTransform((btRaycastVehicle *)self->_vehicle, i, 1);
        uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)self->_vehicle, i);
        double v7 = *(float32x4_t **)(WheelInfo + 288);
        Parent = (float32x4_t *)C3DNodeGetParent((uint64_t)v7);
        if (Parent)
        {
          WorldMatrix = (simd_float4x4 *)C3DNodeGetWorldMatrix(Parent);
          C3DMatrix4x4Invert(WorldMatrix, &v21);
          int32x4_t v10 = *(int32x4_t *)(WheelInfo + 112);
          int32x4_t v11 = *(int32x4_t *)(WheelInfo + 128);
          int8x16_t v12 = *(int8x16_t *)(WheelInfo + 144);
          long long v13 = *(_OWORD *)(WheelInfo + 160);
          int8x16_t v14 = (int8x16_t)vtrn1q_s32(v10, v11);
          *(void *)&long long v15 = vextq_s8(v14, v14, 8uLL).u64[0];
          v14.i64[1] = v12.u32[0];
          *(int32x2_t *)v10.i8 = vzip2_s32(*(int32x2_t *)v10.i8, *(int32x2_t *)v11.i8);
          v10.u64[1] = (unint64_t)vzip2_s32(*(int32x2_t *)v12.i8, 0);
          *((void *)&v15 + 1) = vextq_s8(v12, v12, 8uLL).u32[0];
          v17[0] = v14;
          v17[1] = v10;
          v17[2] = v15;
          uint64_t v18 = v13;
          int v19 = DWORD2(v13);
          int v20 = 1065353216;
          C3DMatrix4x4Mult((uint64_t)v17, (float32x4_t *)&v21, v16);
          C3DNodeSetMatrix(v7, (uint64_t)v16);
        }
      }
      vehicle = (float *)self->_vehicle;
    }
    self->_speedKmHour = vehicle[42];
  }
}

- (CGFloat)speedInKilometersPerHour
{
  return self->_speedKmHour;
}

- (BOOL)hasReferenceToPhysicsBody:(id)a3
{
  return [(SCNPhysicsVehicle *)self chassisBody] == a3;
}

- (id)wheelAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_wheels count] <= a3) {
    return 0;
  }
  wheels = self->_wheels;

  return [(NSArray *)wheels objectAtIndex:a3];
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  if ([a4 hasPrefix:@"wheel"])
  {
    uint64_t v9 = 0;
    id v10 = 0;
    SCNKitSplitKVCPath(a4, &v10, &v9);
    if (v9)
    {
      id v7 = -[SCNPhysicsVehicle wheelAtIndex:](self, "wheelAtIndex:", (int)[(id)objc_msgSend(v10 substringFromIndex:objc_msgSend(@"wheel", "length")), "intValue"]);
      [v7 setValue:a3 forKey:v9];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SCNPhysicsVehicle;
    [(SCNPhysicsVehicle *)&v8 setValue:a3 forKeyPath:a4];
  }
}

- (id)valueForKeyPath:(id)a3
{
  if ([a3 hasPrefix:@"wheel"])
  {
    uint64_t v8 = 0;
    id v9 = 0;
    SCNKitSplitKVCPath(a3, &v9, &v8);
    if (v8)
    {
      id v5 = -[SCNPhysicsVehicle wheelAtIndex:](self, "wheelAtIndex:", (int)[(id)objc_msgSend(v9 substringFromIndex:objc_msgSend(@"wheel", "length")), "intValue"]);
      return (id)[v5 valueForKey:v8];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SCNPhysicsVehicle;
    return [(SCNPhysicsVehicle *)&v7 valueForKeyPath:a3];
  }
}

- (void)encodeWithCoder:(id)a3
{
  chassisBody = self->_chassisBody;
  if (chassisBody) {
    [a3 encodeObject:chassisBody forKey:@"chassisBody"];
  }
  if (self->_wheels)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (SCNPhysicsVehicle)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNPhysicsVehicle;
  int v4 = -[SCNPhysicsBehavior initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNPhysicsVehicle *)v4 _customDecodingOfSCNPhysicsVehicle:a3];
    v4->_chassisBody = (SCNPhysicsBody *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"chassisBody"];
    v4->_wheels = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"wheels");
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_handleCreateIfNeeded:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)float v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Can't create a vehicle with this chassis because it is not in the scene yet", v1, 2u);
}

@end