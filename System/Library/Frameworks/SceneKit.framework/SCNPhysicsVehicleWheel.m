@interface SCNPhysicsVehicleWheel
+ (BOOL)supportsSecureCoding;
+ (SCNPhysicsVehicleWheel)wheelWithNode:(SCNNode *)node;
- (BOOL)isFront;
- (CGFloat)frictionSlip;
- (CGFloat)maximumSuspensionForce;
- (CGFloat)maximumSuspensionTravel;
- (CGFloat)radius;
- (CGFloat)suspensionCompression;
- (CGFloat)suspensionDamping;
- (CGFloat)suspensionRestLength;
- (CGFloat)suspensionStiffness;
- (SCNNode)node;
- (SCNPhysicsVehicleWheel)init;
- (SCNPhysicsVehicleWheel)initWithCoder:(id)a3;
- (SCNVector3)axle;
- (SCNVector3)connectionPosition;
- (SCNVector3)steeringAxis;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setVehicle:(id)a3;
- (void)_setWheelIndex:(int)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAxle:(SCNVector3)axle;
- (void)setConnectionPosition:(SCNVector3)connectionPosition;
- (void)setFrictionSlip:(CGFloat)frictionSlip;
- (void)setIsFront:(BOOL)a3;
- (void)setMaximumSuspensionForce:(CGFloat)maximumSuspensionForce;
- (void)setMaximumSuspensionTravel:(CGFloat)maximumSuspensionTravel;
- (void)setNode:(id)a3;
- (void)setRadius:(CGFloat)radius;
- (void)setSteeringAxis:(SCNVector3)steeringAxis;
- (void)setSuspensionCompression:(CGFloat)suspensionCompression;
- (void)setSuspensionDamping:(CGFloat)suspensionDamping;
- (void)setSuspensionRestLength:(CGFloat)suspensionRestLength;
- (void)setSuspensionStiffness:(CGFloat)suspensionStiffness;
@end

@implementation SCNPhysicsVehicleWheel

- (SCNPhysicsVehicleWheel)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVehicleWheel;
  result = [(SCNPhysicsVehicleWheel *)&v3 init];
  if (result)
  {
    result->_suspensionRestLength = 1.6;
    *(_OWORD *)&result->_suspensionStiffness = xmmword_20B5EE560;
    *(_OWORD *)&result->_suspensionDamping = xmmword_20B5EE570;
    *(_OWORD *)&result->_frictionSlip = xmmword_20B5EE580;
    result->_axle.y = 0.0;
    result->_axle.z = 0.0;
    *(_OWORD *)&result->_steeringAxis.x = xmmword_20B5EE590;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsVehicleWheel;
  [(SCNPhysicsVehicleWheel *)&v3 dealloc];
}

- (void)setNode:(id)a3
{
  node = self->_node;
  if (node != a3)
  {

    self->_node = (SCNNode *)a3;
  }
}

- (void)_setVehicle:(id)a3
{
  if (a3)
  {
    vehicle = self->_vehicle;
    if (vehicle) {
      BOOL v6 = vehicle == a3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNPhysicsVehicleWheel _setVehicle:](v7);
      }
    }
  }
  self->_vehicle = (SCNPhysicsVehicle *)a3;
}

- (void)_setWheelIndex:(int)a3
{
  self->_wheelIndex = a3;
}

+ (SCNPhysicsVehicleWheel)wheelWithNode:(SCNNode *)node
{
  v4 = objc_alloc_init(SCNPhysicsVehicleWheel);
  [(SCNPhysicsVehicleWheel *)v4 setNode:node];
  [(SCNNode *)node position];
  -[SCNPhysicsVehicleWheel setConnectionPosition:](v4, "setConnectionPosition:");
  [(SCNNode *)node getBoundingBoxMin:&v10 max:&v8];
  float32x2_t v5 = vsub_f32(v8, v10);
  float32x2_t v8 = v5;
  float v6 = *(float *)&v9 - v11;
  *(float *)&uint64_t v9 = *(float *)&v9 - v11;
  if (v5.f32[0] < v5.f32[1]) {
    v5.f32[0] = v5.f32[1];
  }
  if (v5.f32[0] < v6) {
    v5.f32[0] = v6;
  }
  -[SCNPhysicsVehicleWheel setRadius:](v4, "setRadius:", (float)(v5.f32[0] * 0.5), *(void *)&v8, v9);
  return v4;
}

- (SCNNode)node
{
  return self->_node;
}

- (CGFloat)suspensionStiffness
{
  return self->_suspensionStiffness;
}

- (void)setSuspensionStiffness:(CGFloat)suspensionStiffness
{
  self->_suspensionStiffness = suspensionStiffness;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__SCNPhysicsVehicleWheel_setSuspensionStiffness___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionStiffness;
    [v6 _postCommandWithBlock:v7];
  }
}

float __49__SCNPhysicsVehicleWheel_setSuspensionStiffness___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 236) = result;
  return result;
}

- (CGFloat)suspensionCompression
{
  return self->_suspensionCompression;
}

- (void)setSuspensionCompression:(CGFloat)suspensionCompression
{
  self->_suspensionCompression = suspensionCompression;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__SCNPhysicsVehicleWheel_setSuspensionCompression___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionCompression;
    [v6 _postCommandWithBlock:v7];
  }
}

float __51__SCNPhysicsVehicleWheel_setSuspensionCompression___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 240) = result;
  return result;
}

- (CGFloat)suspensionDamping
{
  return self->_suspensionDamping;
}

- (void)setSuspensionDamping:(CGFloat)suspensionDamping
{
  self->_suspensionDamping = suspensionDamping;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__SCNPhysicsVehicleWheel_setSuspensionDamping___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionDamping;
    [v6 _postCommandWithBlock:v7];
  }
}

float __47__SCNPhysicsVehicleWheel_setSuspensionDamping___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 244) = result;
  return result;
}

- (CGFloat)maximumSuspensionTravel
{
  return self->_maximumSuspensionTravel;
}

- (void)setMaximumSuspensionTravel:(CGFloat)maximumSuspensionTravel
{
  self->_maximumSuspensionTravel = maximumSuspensionTravel;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__SCNPhysicsVehicleWheel_setMaximumSuspensionTravel___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumSuspensionTravel;
    [v6 _postCommandWithBlock:v7];
  }
}

float __53__SCNPhysicsVehicleWheel_setMaximumSuspensionTravel___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 228) = result;
  return result;
}

- (CGFloat)frictionSlip
{
  return self->_frictionSlip;
}

- (void)setFrictionSlip:(CGFloat)frictionSlip
{
  self->_frictionSlip = frictionSlip;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__SCNPhysicsVehicleWheel_setFrictionSlip___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = frictionSlip;
    [v6 _postCommandWithBlock:v7];
  }
}

float __42__SCNPhysicsVehicleWheel_setFrictionSlip___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40) * 10.5;
  *(float *)(WheelInfo + 248) = result;
  return result;
}

- (CGFloat)maximumSuspensionForce
{
  return self->_maximumSuspensionForce;
}

- (void)setMaximumSuspensionForce:(CGFloat)maximumSuspensionForce
{
  self->_maximumSuspensionForce = maximumSuspensionForce;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__SCNPhysicsVehicleWheel_setMaximumSuspensionForce___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = maximumSuspensionForce;
    [v6 _postCommandWithBlock:v7];
  }
}

float __52__SCNPhysicsVehicleWheel_setMaximumSuspensionForce___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 268) = result;
  return result;
}

- (SCNVector3)connectionPosition
{
  float x = self->_connectionPosition.x;
  float y = self->_connectionPosition.y;
  float z = self->_connectionPosition.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setConnectionPosition:(SCNVector3)connectionPosition
{
  self->_connectionPosition = connectionPosition;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    float z = connectionPosition.z;
    float y = connectionPosition.y;
    float x = connectionPosition.x;
    id v8 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__SCNPhysicsVehicleWheel_setConnectionPosition___block_invoke;
    v9[3] = &unk_264005038;
    v9[4] = self;
    float v10 = x;
    float v11 = y;
    float v12 = z;
    [v8 _postCommandWithBlock:v9];
  }
}

float __48__SCNPhysicsVehicleWheel_setConnectionPosition___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  *(void *)&long long v3 = *(void *)(a1 + 40);
  *((void *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 176) = v3;
  return *(float *)&v3;
}

- (SCNVector3)steeringAxis
{
  float x = self->_steeringAxis.x;
  float y = self->_steeringAxis.y;
  float z = self->_steeringAxis.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setSteeringAxis:(SCNVector3)steeringAxis
{
  self->_steeringAxis = steeringAxis;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    float z = steeringAxis.z;
    float y = steeringAxis.y;
    float x = steeringAxis.x;
    id v8 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__SCNPhysicsVehicleWheel_setSteeringAxis___block_invoke;
    v9[3] = &unk_264005038;
    v9[4] = self;
    float v10 = x;
    float v11 = y;
    float v12 = z;
    [v8 _postCommandWithBlock:v9];
  }
}

float __42__SCNPhysicsVehicleWheel_setSteeringAxis___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  *(void *)&long long v3 = *(void *)(a1 + 40);
  *((void *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 192) = v3;
  return *(float *)&v3;
}

- (SCNVector3)axle
{
  float x = self->_axle.x;
  float y = self->_axle.y;
  float z = self->_axle.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)setAxle:(SCNVector3)axle
{
  self->_axle = axle;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    float z = axle.z;
    float y = axle.y;
    float x = axle.x;
    id v8 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__SCNPhysicsVehicleWheel_setAxle___block_invoke;
    v9[3] = &unk_264005038;
    v9[4] = self;
    float v10 = x;
    float v11 = y;
    float v12 = z;
    [v8 _postCommandWithBlock:v9];
  }
}

float __34__SCNPhysicsVehicleWheel_setAxle___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  *(void *)&long long v3 = *(void *)(a1 + 40);
  *((void *)&v3 + 1) = *(unsigned int *)(a1 + 48);
  *(_OWORD *)(WheelInfo + 208) = v3;
  return *(float *)&v3;
}

- (CGFloat)radius
{
  return self->_radius;
}

- (void)setRadius:(CGFloat)radius
{
  self->_radius = radius;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNPhysicsVehicleWheel_setRadius___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = radius;
    [v6 _postCommandWithBlock:v7];
  }
}

float __36__SCNPhysicsVehicleWheel_setRadius___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 232) = result;
  return result;
}

- (CGFloat)suspensionRestLength
{
  return self->_suspensionRestLength;
}

- (void)setSuspensionRestLength:(CGFloat)suspensionRestLength
{
  self->_suspensionRestLength = suspensionRestLength;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__SCNPhysicsVehicleWheel_setSuspensionRestLength___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = suspensionRestLength;
    [v6 _postCommandWithBlock:v7];
  }
}

float __50__SCNPhysicsVehicleWheel_setSuspensionRestLength___block_invoke(uint64_t a1)
{
  uint64_t WheelInfo = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  float result = *(double *)(a1 + 40);
  *(float *)(WheelInfo + 224) = result;
  return result;
}

- (BOOL)isFront
{
  return self->_isFront;
}

- (void)setIsFront:(BOOL)a3
{
  self->_isFront = a3;
  vehicle = self->_vehicle;
  if (vehicle)
  {
    id v6 = [(SCNPhysicsVehicle *)vehicle physicsWorld];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNPhysicsVehicleWheel_setIsFront___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = a3;
    [v6 _postCommandWithBlock:v7];
  }
}

uint64_t __37__SCNPhysicsVehicleWheel_setIsFront___block_invoke(uint64_t a1)
{
  uint64_t result = btRaycastVehicle::getWheelInfo((btRaycastVehicle *)[*(id *)(*(void *)(a1 + 32) + 16) btVehicle], *(_DWORD *)(*(void *)(a1 + 32) + 24));
  *(unsigned char *)(result + 280) = *(unsigned char *)(a1 + 40);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float32x2_t v5 = +[SCNPhysicsVehicleWheel wheelWithNode:self->_node];
  [(SCNPhysicsVehicleWheel *)self suspensionStiffness];
  -[SCNPhysicsVehicleWheel setSuspensionStiffness:](v5, "setSuspensionStiffness:");
  [(SCNPhysicsVehicleWheel *)self suspensionCompression];
  -[SCNPhysicsVehicleWheel setSuspensionCompression:](v5, "setSuspensionCompression:");
  [(SCNPhysicsVehicleWheel *)self suspensionDamping];
  -[SCNPhysicsVehicleWheel setSuspensionDamping:](v5, "setSuspensionDamping:");
  [(SCNPhysicsVehicleWheel *)self maximumSuspensionTravel];
  -[SCNPhysicsVehicleWheel setMaximumSuspensionTravel:](v5, "setMaximumSuspensionTravel:");
  [(SCNPhysicsVehicleWheel *)self frictionSlip];
  -[SCNPhysicsVehicleWheel setFrictionSlip:](v5, "setFrictionSlip:");
  [(SCNPhysicsVehicleWheel *)self maximumSuspensionForce];
  -[SCNPhysicsVehicleWheel setMaximumSuspensionForce:](v5, "setMaximumSuspensionForce:");
  [(SCNPhysicsVehicleWheel *)self connectionPosition];
  -[SCNPhysicsVehicleWheel setConnectionPosition:](v5, "setConnectionPosition:");
  [(SCNPhysicsVehicleWheel *)self steeringAxis];
  -[SCNPhysicsVehicleWheel setSteeringAxis:](v5, "setSteeringAxis:");
  [(SCNPhysicsVehicleWheel *)self axle];
  -[SCNPhysicsVehicleWheel setAxle:](v5, "setAxle:");
  [(SCNPhysicsVehicleWheel *)self radius];
  -[SCNPhysicsVehicleWheel setRadius:](v5, "setRadius:");
  [(SCNPhysicsVehicleWheel *)self suspensionRestLength];
  -[SCNPhysicsVehicleWheel setSuspensionRestLength:](v5, "setSuspensionRestLength:");
  [(SCNPhysicsVehicleWheel *)v5 setIsFront:[(SCNPhysicsVehicleWheel *)self isFront]];

  return v5;
}

- (id)copy
{
  return [(SCNPhysicsVehicleWheel *)self copyWithZone:0];
}

- (void)encodeWithCoder:(id)a3
{
  node = self->_node;
  if (node) {
    [a3 encodeObject:node forKey:@"node"];
  }
  vehicle = self->_vehicle;
  if (vehicle) {
    [a3 encodeObject:vehicle forKey:@"vehicle"];
  }
  [a3 encodeInt:self->_wheelIndex forKey:@"wheelIndex"];
  [a3 encodeDouble:@"suspensionStiffness" forKey:self->_suspensionStiffness];
  [a3 encodeDouble:@"suspensionCompression" forKey:self->_suspensionCompression];
  [a3 encodeDouble:@"suspensionDamping" forKey:self->_suspensionDamping];
  [a3 encodeDouble:@"maximumSuspensionTravel" forKey:self->_maximumSuspensionTravel];
  [a3 encodeDouble:@"frictionSlip" forKey:self->_frictionSlip];
  [a3 encodeDouble:@"maximumSuspensionForce" forKey:self->_maximumSuspensionForce];
  SCNEncodeVector3(a3, @"connectionPosition", self->_connectionPosition.x, self->_connectionPosition.y, self->_connectionPosition.z);
  SCNEncodeVector3(a3, @"steeringAxis", self->_steeringAxis.x, self->_steeringAxis.y, self->_steeringAxis.z);
  SCNEncodeVector3(a3, @"axle", self->_axle.x, self->_axle.y, self->_axle.z);
  [a3 encodeDouble:@"radius" forKey:self->_radius];
  [a3 encodeDouble:@"suspensionRestLength" forKey:self->_suspensionRestLength];
  BOOL isFront = self->_isFront;

  [a3 encodeBool:isFront forKey:@"isFront"];
}

- (SCNPhysicsVehicleWheel)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SCNPhysicsVehicleWheel;
  v4 = [(SCNPhysicsVehicleWheel *)&v10 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    -[SCNPhysicsVehicleWheel setNode:](v4, "setNode:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"node"]);
    v4->_vehicle = (SCNPhysicsVehicle *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"vehicle"];
    v4->_wheelIndefloat x = [a3 decodeIntForKey:@"wheelIndex"];
    [a3 decodeDoubleForKey:@"suspensionStiffness"];
    -[SCNPhysicsVehicleWheel setSuspensionStiffness:](v4, "setSuspensionStiffness:");
    [a3 decodeDoubleForKey:@"suspensionCompression"];
    -[SCNPhysicsVehicleWheel setSuspensionCompression:](v4, "setSuspensionCompression:");
    [a3 decodeDoubleForKey:@"suspensionDamping"];
    -[SCNPhysicsVehicleWheel setSuspensionDamping:](v4, "setSuspensionDamping:");
    [a3 decodeDoubleForKey:@"maximumSuspensionTravel"];
    -[SCNPhysicsVehicleWheel setMaximumSuspensionTravel:](v4, "setMaximumSuspensionTravel:");
    [a3 decodeDoubleForKey:@"frictionSlip"];
    -[SCNPhysicsVehicleWheel setFrictionSlip:](v4, "setFrictionSlip:");
    [a3 decodeDoubleForKey:@"maximumSuspensionForce"];
    -[SCNPhysicsVehicleWheel setMaximumSuspensionForce:](v4, "setMaximumSuspensionForce:");
    *(float *)&double v6 = SCNDecodeVector3(a3, @"connectionPosition");
    [(SCNPhysicsVehicleWheel *)v4 setConnectionPosition:v6];
    *(float *)&double v7 = SCNDecodeVector3(a3, @"steeringAxis");
    [(SCNPhysicsVehicleWheel *)v4 setSteeringAxis:v7];
    *(float *)&double v8 = SCNDecodeVector3(a3, @"axle");
    [(SCNPhysicsVehicleWheel *)v4 setAxle:v8];
    [a3 decodeDoubleForKey:@"radius"];
    -[SCNPhysicsVehicleWheel setRadius:](v4, "setRadius:");
    [a3 decodeDoubleForKey:@"suspensionRestLength"];
    -[SCNPhysicsVehicleWheel setSuspensionRestLength:](v4, "setSuspensionRestLength:");
    -[SCNPhysicsVehicleWheel setIsFront:](v4, "setIsFront:", [a3 decodeBoolForKey:@"isFront"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setVehicle:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: attaching a single wheel to multiple vehicle is not supported", v1, 2u);
}

@end