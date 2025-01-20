@interface FBSCAContextSceneLayer
+ (id)layerWithCAContext:(id)a3;
- (FBSCAContextSceneLayer)initWithCAContext:(id)a3;
- (FBSCAContextSceneLayer)initWithCAContextID:(unsigned int)a3 level:(double)a4;
@end

@implementation FBSCAContextSceneLayer

+ (id)layerWithCAContext:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithWindowContext:v4];

  return v5;
}

- (FBSCAContextSceneLayer)initWithCAContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBSCAContextSceneLayer;
  return [(FBSSceneLayer *)&v4 initWithWindowContext:a3];
}

- (FBSCAContextSceneLayer)initWithCAContextID:(unsigned int)a3 level:(double)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FBSCAContextSceneLayer;
  return [(FBSSceneLayer *)&v5 initWithContextID:*(void *)&a3 level:a4];
}

@end