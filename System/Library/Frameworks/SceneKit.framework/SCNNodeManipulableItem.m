@interface SCNNodeManipulableItem
+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(double)a4;
+ (void)addItems:(id)a3 toScene:(id)a4;
+ (void)removeItemsFromScene:(id)a3;
- (BOOL)isNodeManipulator;
- (SCNMatrix4)transform;
- (SCNMatrix4)worldTransform;
- (SCNVector3)scale;
- (id)cloneForManipulators;
- (id)parentItem;
- (void)setPosition:(SCNVector3)a3;
- (void)setTransform:(SCNMatrix4 *)a3;
- (void)setWorldTransform:(SCNMatrix4 *)a3;
- (void)validateClone;
@end

@implementation SCNNodeManipulableItem

+ (id)nodeManipulatorItemWithNode:(id)a3 screenSize:(double)a4
{
  v6 = objc_alloc_init(SCNNodeManipulableItem);
  [(SCNManipulableItem *)v6 setScreenSize:a4];
  [(SCNManipulableItem *)v6 setNode:a3];

  return v6;
}

- (BOOL)isNodeManipulator
{
  return 1;
}

- (SCNMatrix4)transform
{
  result = [(SCNManipulableItem *)self node];
  if (result)
  {
    return (SCNMatrix4 *)[(SCNMatrix4 *)result transform];
  }
  else
  {
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
  }
  return result;
}

- (void)setTransform:(SCNMatrix4 *)a3
{
  [(SCNNode *)[(SCNManipulableItem *)self node] setTransform:&v3];
}

- (void)setWorldTransform:(SCNMatrix4 *)a3
{
  [(SCNNode *)[(SCNManipulableItem *)self node] setWorldTransform:&v3];
}

- (SCNMatrix4)worldTransform
{
  result = [(SCNManipulableItem *)self node];
  if (result)
  {
    return (SCNMatrix4 *)[(SCNMatrix4 *)result worldTransform];
  }
  else
  {
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
  }
  return result;
}

- (SCNVector3)scale
{
  v2 = [(SCNManipulableItem *)self node];

  [(SCNNode *)v2 scale];
  result.z = v5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setPosition:(SCNVector3)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v6 = [(SCNManipulableItem *)self node];
  *(float *)&double v7 = x;
  *(float *)&double v8 = y;
  *(float *)&double v9 = z;

  -[SCNNode setPosition:](v6, "setPosition:", v7, v8, v9);
}

- (id)parentItem
{
  id result = [(SCNNode *)[(SCNManipulableItem *)self node] parentNode];
  if (result)
  {
    float v4 = [(SCNNode *)[(SCNManipulableItem *)self node] parentNode];
    [(SCNManipulableItem *)self screenSize];
    return +[SCNNodeManipulableItem nodeManipulatorItemWithNode:screenSize:](SCNNodeManipulableItem, "nodeManipulatorItemWithNode:screenSize:", v4);
  }
  return result;
}

- (id)cloneForManipulators
{
  float v3 = [(SCNNode *)[(SCNManipulableItem *)self node] clone];
  [(SCNNode *)v3 opacity];
  [(SCNNode *)v3 setOpacity:v4 * 0.5];
  [(SCNNode *)v3 setGizmo:1];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  float v5 = [(SCNManipulableItem *)self node];
  if (v5)
  {
    SCNMatrix4 v8 = SCNMatrix4Identity;
    [(SCNNode *)v5 convertTransform:&v8 toNode:0];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  v7[3] = v12;
  [(SCNNode *)v3 setTransform:v7];
  [(SCNManipulableItem *)self screenSize];
  return +[SCNNodeManipulableItem nodeManipulatorItemWithNode:screenSize:](SCNNodeManipulableItem, "nodeManipulatorItemWithNode:screenSize:", v3);
}

+ (void)addItems:(id)a3 toScene:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend((id)objc_msgSend(a4, "rootNode"), "addChildNode:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "node"));
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (void)removeItemsFromScene:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "node"), "removeFromParentNode");
      }
      while (v5 != v7);
      uint64_t v5 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)validateClone
{
  [(SCNNode *)[(SCNManipulableItem *)self node] setGizmo:0];
  float v3 = [(SCNManipulableItem *)self node];
  [(SCNNode *)v3 opacity];
  double v5 = v4 + v4;

  [(SCNNode *)v3 setOpacity:v5];
}

@end