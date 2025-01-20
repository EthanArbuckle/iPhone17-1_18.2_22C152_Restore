@interface SKPhysicsBody
+ (BOOL)supportsSecureCoding;
+ (SKPhysicsBody)allocWithZone:(_NSZone *)a3;
+ (SKPhysicsBody)bodyWithBodies:(NSArray *)bodies;
+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r;
+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r center:(CGPoint)center;
+ (SKPhysicsBody)bodyWithEdgeChainFromPath:(CGPathRef)path;
+ (SKPhysicsBody)bodyWithEdgeFromPoint:(CGPoint)p1 toPoint:(CGPoint)p2;
+ (SKPhysicsBody)bodyWithEdgeLoopFromPath:(CGPathRef)path;
+ (SKPhysicsBody)bodyWithEdgeLoopFromRect:(CGRect)rect;
+ (SKPhysicsBody)bodyWithPolygonFromPath:(CGPathRef)path;
+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s;
+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s center:(CGPoint)center;
+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture alphaThreshold:(float)alphaThreshold size:(CGSize)size;
+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture size:(CGSize)size;
+ (SKPhysicsBody)bodyWithTexture:(id)a3 alphaThreshold:(float)a4 size:(CGSize)a5 accuracy:(float)a6;
+ (id)copyWithZone:(_NSZone *)a3;
- (BOOL)affectedByGravity;
- (BOOL)allowsRotation;
- (BOOL)isDynamic;
- (BOOL)isResting;
- (BOOL)pinned;
- (BOOL)usesPreciseCollisionDetection;
- (CGFloat)angularDamping;
- (CGFloat)angularVelocity;
- (CGFloat)area;
- (CGFloat)charge;
- (CGFloat)density;
- (CGFloat)friction;
- (CGFloat)linearDamping;
- (CGFloat)mass;
- (CGFloat)restitution;
- (CGVector)velocity;
- (NSArray)allContactedBodies;
- (NSArray)joints;
- (SKNode)node;
- (SKPhysicsBody)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (uint32_t)categoryBitMask;
- (uint32_t)collisionBitMask;
- (uint32_t)contactTestBitMask;
- (uint32_t)fieldBitMask;
- (void)setAffectedByGravity:(BOOL)affectedByGravity;
- (void)setAllowsRotation:(BOOL)allowsRotation;
- (void)setAngularDamping:(CGFloat)angularDamping;
- (void)setAngularVelocity:(CGFloat)angularVelocity;
- (void)setCategoryBitMask:(uint32_t)categoryBitMask;
- (void)setCharge:(CGFloat)charge;
- (void)setCollisionBitMask:(uint32_t)collisionBitMask;
- (void)setContactTestBitMask:(uint32_t)contactTestBitMask;
- (void)setDensity:(CGFloat)density;
- (void)setDynamic:(BOOL)dynamic;
- (void)setFieldBitMask:(uint32_t)fieldBitMask;
- (void)setFriction:(CGFloat)friction;
- (void)setLinearDamping:(CGFloat)linearDamping;
- (void)setMass:(CGFloat)mass;
- (void)setPinned:(BOOL)pinned;
- (void)setResting:(BOOL)resting;
- (void)setRestitution:(CGFloat)restitution;
- (void)setUsesPreciseCollisionDetection:(BOOL)usesPreciseCollisionDetection;
- (void)setVelocity:(CGVector)velocity;
@end

@implementation SKPhysicsBody

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (SKPhysicsBody)initWithCoder:(id)a3
{
  return 0;
}

- (NSArray)allContactedBodies
{
  return 0;
}

+ (SKPhysicsBody)allocWithZone:(_NSZone *)a3
{
  v3 = (PKPhysicsBody *)[MEMORY[0x263F5E4F0] allocWithZone:a3];
  setSKPhysicsDefaults(v3);
  return (SKPhysicsBody *)v3;
}

+ (id)copyWithZone:(_NSZone *)a3
{
  v3 = (PKPhysicsBody *)[MEMORY[0x263F5E4F0] copyWithZone:a3];
  setSKPhysicsDefaults(v3);
  return v3;
}

+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r
{
  v3 = [MEMORY[0x263F5E4F0] bodyWithCircleOfRadius:r];
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithCircleOfRadius:(CGFloat)r center:(CGPoint)center
{
  objc_msgSend(MEMORY[0x263F5E4F0], "bodyWithCircleOfRadius:center:", r, center.x, center.y);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);

  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s
{
  objc_msgSend(MEMORY[0x263F5E4F0], "bodyWithRectangleOfSize:edgeRadius:", s.width, s.height, 0.001);
  v3 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithRectangleOfSize:(CGSize)s center:(CGPoint)center
{
  objc_msgSend(MEMORY[0x263F5E4F0], "bodyWithRectangleOfSize:center:edgeRadius:", s.width, s.height, center.x, center.y, 0.001);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);

  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithPolygonFromPath:(CGPathRef)path
{
  v3 = [MEMORY[0x263F5E4F0] bodyWithPolygonFromPath:path];
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeFromPoint:(CGPoint)p1 toPoint:(CGPoint)p2
{
  objc_msgSend(MEMORY[0x263F5E4F0], "bodyWithEdgeFromPoint:toPoint:", p1.x, p1.y, p2.x, p2.y);
  v4 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v4);

  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithEdgeChainFromPath:(CGPathRef)path
{
  v3 = [MEMORY[0x263F5E4F0] bodyWithEdgeChainFromPath:path];
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeLoopFromPath:(CGPathRef)path
{
  v3 = [MEMORY[0x263F5E4F0] bodyWithEdgeLoopFromPath:path];
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

+ (SKPhysicsBody)bodyWithEdgeLoopFromRect:(CGRect)rect
{
  v3 = CGPathCreateWithRect(rect, 0);
  v4 = [MEMORY[0x263F5E4F0] bodyWithEdgeLoopFromPath:v3];
  CGPathRelease(v3);
  setSKPhysicsDefaults(v4);

  return (SKPhysicsBody *)v4;
}

+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  v6 = texture;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = v6;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__5;
    v21 = __Block_byref_object_dispose__5;
    id v22 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__SKPhysicsBody_bodyWithTexture_size___block_invoke;
    v12[3] = &unk_263FEA5D8;
    v14 = &v17;
    v9 = v8;
    v13 = v9;
    double v15 = width;
    double v16 = height;
    [(SKTexture *)v9 modifyPixelDataWithBlock:v12];
    setSKPhysicsDefaults((PKPhysicsBody *)v18[5]);
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    LODWORD(v7) = 1028443341;
    +[SKPhysicsBody bodyWithTexture:alphaThreshold:size:](SKPhysicsBody, "bodyWithTexture:alphaThreshold:size:", v6, v7, width, height);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (SKPhysicsBody *)v10;
}

void __38__SKPhysicsBody_bodyWithTexture_size___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x263F5E558];
  [*(id *)(a1 + 32) size];
  uint64_t v6 = (int)v5;
  [*(id *)(a1 + 32) size];
  id v11 = [v4 gridFromOccupancyArray:a2 bytePitch:4 width:v6 height:(int)v7];
  uint64_t v8 = objc_msgSend(v11, "physicsBodyFromLVS0:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

+ (SKPhysicsBody)bodyWithTexture:(SKTexture *)texture alphaThreshold:(float)alphaThreshold size:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  double v7 = +[SKPhysicsGrid gridFromTexture:alphaThreshold:accuracy:](SKPhysicsGrid, "gridFromTexture:alphaThreshold:accuracy:", texture);
  objc_msgSend(v7, "physicsBodyFromSmoothedOutline:size:", 1.0, width, height);
  uint64_t v8 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v8);

  return (SKPhysicsBody *)v8;
}

+ (SKPhysicsBody)bodyWithTexture:(id)a3 alphaThreshold:(float)a4 size:(CGSize)a5 accuracy:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v8 = +[SKPhysicsGrid gridFromTexture:alphaThreshold:accuracy:](SKPhysicsGrid, "gridFromTexture:alphaThreshold:accuracy:", a3);
  objc_msgSend(v8, "physicsBodyFromSmoothedOutline:size:", 1.0, width, height);
  uint64_t v9 = (PKPhysicsBody *)objc_claimAutoreleasedReturnValue();
  setSKPhysicsDefaults(v9);

  return (SKPhysicsBody *)v9;
}

+ (SKPhysicsBody)bodyWithBodies:(NSArray *)bodies
{
  v3 = [MEMORY[0x263F5E4F0] bodyWithBodies:bodies];
  setSKPhysicsDefaults(v3);

  return (SKPhysicsBody *)v3;
}

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (void)setDynamic:(BOOL)dynamic
{
  self->_dynamic = dynamic;
}

- (BOOL)usesPreciseCollisionDetection
{
  return self->_usesPreciseCollisionDetection;
}

- (void)setUsesPreciseCollisionDetection:(BOOL)usesPreciseCollisionDetection
{
  self->_usesPreciseCollisionDetection = usesPreciseCollisionDetection;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  self->_allowsRotation = allowsRotation;
}

- (BOOL)pinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)pinned
{
  self->_pinned = pinned;
}

- (BOOL)isResting
{
  return self->_resting;
}

- (void)setResting:(BOOL)resting
{
  self->_resting = resting;
}

- (CGFloat)friction
{
  return self->_friction;
}

- (void)setFriction:(CGFloat)friction
{
  self->_friction = friction;
}

- (CGFloat)charge
{
  return self->_charge;
}

- (void)setCharge:(CGFloat)charge
{
  self->_charge = charge;
}

- (CGFloat)restitution
{
  return self->_restitution;
}

- (void)setRestitution:(CGFloat)restitution
{
  self->_restitution = restitution;
}

- (CGFloat)linearDamping
{
  return self->_linearDamping;
}

- (void)setLinearDamping:(CGFloat)linearDamping
{
  self->_linearDamping = linearDamping;
}

- (CGFloat)angularDamping
{
  return self->_angularDamping;
}

- (void)setAngularDamping:(CGFloat)angularDamping
{
  self->_angularDamping = angularDamping;
}

- (CGFloat)density
{
  return self->_density;
}

- (void)setDensity:(CGFloat)density
{
  self->_density = density;
}

- (CGFloat)mass
{
  return self->_mass;
}

- (void)setMass:(CGFloat)mass
{
  self->_mass = mass;
}

- (CGFloat)area
{
  return self->_area;
}

- (BOOL)affectedByGravity
{
  return self->_affectedByGravity;
}

- (void)setAffectedByGravity:(BOOL)affectedByGravity
{
  self->_affectedByGravity = affectedByGravity;
}

- (uint32_t)fieldBitMask
{
  return self->_fieldBitMask;
}

- (void)setFieldBitMask:(uint32_t)fieldBitMask
{
  self->_fieldBitMask = fieldBitMask;
}

- (uint32_t)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(uint32_t)categoryBitMask
{
  self->_categoryBitMask = categoryBitMask;
}

- (uint32_t)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(uint32_t)collisionBitMask
{
  self->_collisionBitMask = collisionBitMask;
}

- (uint32_t)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(uint32_t)contactTestBitMask
{
  self->_contactTestBitMask = contactTestBitMask;
}

- (NSArray)joints
{
  return self->_joints;
}

- (SKNode)node
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_node);

  return (SKNode *)WeakRetained;
}

- (CGVector)velocity
{
  double dx = self->_velocity.dx;
  double dy = self->_velocity.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (void)setVelocity:(CGVector)velocity
{
  self->_velocity = velocity;
}

- (CGFloat)angularVelocity
{
  return self->_angularVelocity;
}

- (void)setAngularVelocity:(CGFloat)angularVelocity
{
  self->_angularVelocity = angularVelocity;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_node);

  objc_storeStrong((id *)&self->_joints, 0);
}

@end