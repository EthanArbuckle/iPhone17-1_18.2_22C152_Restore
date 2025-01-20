@interface SCNPhysicsContact
+ (id)_contactWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4;
- (BOOL)_shouldPostUpdate;
- (CGFloat)collisionImpulse;
- (CGFloat)penetrationDistance;
- (CGFloat)sweepTestFraction;
- (SCNNode)nodeA;
- (SCNNode)nodeB;
- (SCNVector3)contactNormal;
- (SCNVector3)contactPoint;
- (id)description;
- (void)_fillNodeA:(id)a3 nodeB:(id)a4;
- (void)_fillNodeA:(id)a3 nodeB:(id)a4 contactPoint:(SCNVector3)a5 collisionImpulse:(SCNVector3)a6 distance:(double)a7 hitFraction:(double)a8;
- (void)_prepareUpdate;
- (void)_updateWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4 point:(const btManifoldPoint *)a5;
- (void)dealloc;
@end

@implementation SCNPhysicsContact

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNPhysicsContact;
  [(SCNPhysicsContact *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  [v5 appendFormat:@" '%@'", self->_nodeA];
  [v5 appendFormat:@" '%@'", self->_nodeB];
  objc_msgSend(v5, "appendFormat:", @" point(%f %f %f)", self->_contactPoint.x, self->_contactPoint.y, self->_contactPoint.z);
  objc_msgSend(v5, "appendFormat:", @" normal(%f %f %f)", self->_contactNormal.x, self->_contactNormal.y, self->_contactNormal.z);
  objc_msgSend(v5, "appendFormat:", @" impulse(%f)", *(void *)&self->_collisionImpulse);
  objc_msgSend(v5, "appendFormat:", @" distance:%f", *(void *)&self->_distance);
  [v5 appendString:@">"];
  return v5;
}

- (void)_fillNodeA:(id)a3 nodeB:(id)a4 contactPoint:(SCNVector3)a5 collisionImpulse:(SCNVector3)a6 distance:(double)a7 hitFraction:(double)a8
{
  float z = a6.z;
  float y = a6.y;
  float x = a6.x;
  float v13 = a5.z;
  float v14 = a5.y;
  float v15 = a5.x;
  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3) {
      v20 = (SCNNode *)CFRetain(a3);
    }
    else {
      v20 = 0;
    }
    self->_nodeA = v20;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4) {
      v22 = (SCNNode *)CFRetain(a4);
    }
    else {
      v22 = 0;
    }
    self->_nodeB = v22;
  }
  self->_contactPoint.float x = v15;
  self->_contactPoint.float y = v14;
  self->_contactPoint.float z = v13;
  self->_contactNormal.float x = x;
  self->_contactNormal.float y = y;
  self->_contactNormal.float z = z;
  self->_collisionImpulse = 0.0;
  self->_distance = a7;
  self->_fraction = a8;
}

- (void)_fillNodeA:(id)a3 nodeB:(id)a4
{
  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3) {
      v8 = (SCNNode *)CFRetain(a3);
    }
    else {
      v8 = 0;
    }
    self->_nodeA = v8;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4) {
      v10 = (SCNNode *)CFRetain(a4);
    }
    else {
      v10 = 0;
    }
    self->_nodeB = v10;
  }
}

- (void)_updateWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4 point:(const btManifoldPoint *)a5
{
  var3 = a3->var3;
  if (var3 && (*((unsigned char *)var3 + 264) & 2) != 0 && (uint64_t v9 = *((void *)var3 + 67)) != 0) {
    ObjCWrapper = C3DEntityGetObjCWrapper(*(id **)(v9 + 72));
  }
  else {
    ObjCWrapper = 0;
  }
  uint64_t v11 = *(void *)&a3->var4;
  if (v11 && (*(unsigned char *)(v11 + 264) & 2) != 0 && (uint64_t v12 = *(void *)(v11 + 536)) != 0) {
    float v13 = C3DEntityGetObjCWrapper(*(id **)(v12 + 72));
  }
  else {
    float v13 = 0;
  }
  nodeA = self->_nodeA;
  if (nodeA != (SCNNode *)ObjCWrapper)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (ObjCWrapper) {
      float v15 = (SCNNode *)CFRetain(ObjCWrapper);
    }
    else {
      float v15 = 0;
    }
    self->_nodeA = v15;
  }
  nodeB = self->_nodeB;
  if (nodeB != (SCNNode *)v13)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (v13) {
      v17 = (SCNNode *)CFRetain(v13);
    }
    else {
      v17 = 0;
    }
    self->_nodeB = v17;
  }
  float v18 = a5->var2.var0.var0[2];
  *(void *)&self->_contactPoint.float x = *(void *)a5->var2.var0.var0;
  self->_contactPoint.float z = v18;
  float v19 = a5->var4.var0.var0[2];
  *(void *)&self->_contactNormal.float x = *(void *)a5->var4.var0.var0;
  self->_contactNormal.float z = v19;
  double v20 = (float)-a5->var5;
  self->_collisionImpulse = a5->var15;
  self->_distance = v20;
}

+ (id)_contactWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4
{
  v4 = *(void **)&a3->var1[(int)a4].var14;
  objc_msgSend(v4, "_updateWithManifold:index:point:");
  return v4;
}

- (SCNNode)nodeA
{
  return self->_nodeA;
}

- (SCNNode)nodeB
{
  return self->_nodeB;
}

- (SCNVector3)contactPoint
{
  float x = self->_contactPoint.x;
  float y = self->_contactPoint.y;
  float z = self->_contactPoint.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (SCNVector3)contactNormal
{
  float x = self->_contactNormal.x;
  float y = self->_contactNormal.y;
  float z = self->_contactNormal.z;
  result.float z = z;
  result.float y = y;
  result.float x = x;
  return result;
}

- (CGFloat)collisionImpulse
{
  return self->_collisionImpulse;
}

- (CGFloat)penetrationDistance
{
  return self->_distance;
}

- (CGFloat)sweepTestFraction
{
  return self->_fraction;
}

- (void)_prepareUpdate
{
}

- (BOOL)_shouldPostUpdate
{
  int64_t v2 = self->_updateCount - 1;
  self->_updateCount = v2;
  return v2 == 0;
}

@end