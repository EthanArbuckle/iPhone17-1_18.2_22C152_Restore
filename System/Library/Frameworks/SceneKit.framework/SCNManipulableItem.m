@interface SCNManipulableItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isNodeManipulator;
- (SCNMatrix4)transform;
- (SCNMatrix4)worldTransform;
- (SCNNode)node;
- (SCNVector3)elementPosition;
- (SCNVector3)scale;
- (double)screenSize;
- (id)cloneForManipulators;
- (id)component;
- (id)parentItem;
- (unint64_t)elementIndex;
- (unint64_t)hash;
- (void)dealloc;
- (void)setComponent:(id)a3;
- (void)setElementIndex:(unint64_t)a3;
- (void)setNode:(id)a3;
- (void)setPosition:(SCNVector3)a3;
- (void)setScreenSize:(double)a3;
- (void)setTransform:(SCNMatrix4 *)a3;
- (void)setWorldTransform:(SCNMatrix4 *)a3;
@end

@implementation SCNManipulableItem

- (void)setScreenSize:(double)a3
{
  self->_screenSize = a3;
}

- (double)screenSize
{
  return self->_screenSize;
}

- (void)dealloc
{
  [(SCNManipulableItem *)self setNode:0];
  [(SCNManipulableItem *)self setComponent:0];
  v3.receiver = self;
  v3.super_class = (Class)SCNManipulableItem;
  [(SCNManipulableItem *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SCNManipulableItem *)self node];
    if (v5 == (SCNNode *)[a3 node]
      && (unint64_t v6 = -[SCNManipulableItem elementIndex](self, "elementIndex"), v6 == [a3 elementIndex]))
    {
      uint64_t v7 = [a3 component];
      return v7 == [a3 component];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCNManipulableItem;
    return [(SCNManipulableItem *)&v9 isEqual:a3];
  }
}

- (unint64_t)hash
{
  v2 = [(SCNManipulableItem *)self node];

  return [(SCNNode *)v2 hash];
}

- (BOOL)isNodeManipulator
{
  return 0;
}

- (SCNMatrix4)transform
{
  *retstr = SCNMatrix4Identity;
  return self;
}

- (void)setTransform:(SCNMatrix4 *)a3
{
  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SCNManipulableItem setTransform:]((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)setWorldTransform:(SCNMatrix4 *)a3
{
  v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SCNManipulableItem setWorldTransform:]((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (SCNMatrix4)worldTransform
{
  *retstr = SCNMatrix4Identity;
  return self;
}

- (SCNVector3)scale
{
  float v2 = 1.0;
  float v3 = 1.0;
  float v4 = 1.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  float v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SCNManipulableItem setPosition:]((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)parentItem
{
  return 0;
}

- (SCNVector3)elementPosition
{
  float v2 = 0.0;
  float v3 = 0.0;
  float v4 = 0.0;
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)cloneForManipulators
{
  return 0;
}

- (SCNNode)node
{
  return self->node;
}

- (void)setNode:(id)a3
{
}

- (id)component
{
  return self->component;
}

- (void)setComponent:(id)a3
{
}

- (unint64_t)elementIndex
{
  return self->elementIndex;
}

- (void)setElementIndex:(unint64_t)a3
{
  self->elementIndex = a3;
}

- (void)setTransform:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setWorldTransform:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPosition:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end