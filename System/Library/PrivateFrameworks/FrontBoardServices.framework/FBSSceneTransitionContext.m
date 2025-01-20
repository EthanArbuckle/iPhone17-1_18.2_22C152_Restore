@interface FBSSceneTransitionContext
+ (Class)_baseClass;
+ (Class)immutableSubclass;
+ (Class)subclassExtension;
+ (id)_settingsExtensionsForSceneExtension:(Class)a3;
+ (id)transitionContext;
- (FBSSceneTransitionContext)initWithSettings:(id)a3;
- (void)addAction:(id)a3;
- (void)addActions:(id)a3;
- (void)removeAction:(id)a3;
- (void)removeActions:(id)a3;
@end

@implementation FBSSceneTransitionContext

+ (id)transitionContext
{
  v2 = (void *)[objc_alloc((Class)a1) initWithSettings:0];

  return v2;
}

- (FBSSceneTransitionContext)initWithSettings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBSSceneTransitionContext;
  v5 = [(FBSSettings *)&v10 initWithSettings:v4];
  v6 = v5;
  if (v4 && v5)
  {
    [(FBSSceneTransitionContext *)v5 setUpdateContext:0];
    v7 = [v4 animationFence];
    v8 = (void *)[v7 copy];
    [(FBSSceneTransitionContext *)v6 setAnimationFence:v8];
  }
  return v6;
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

+ (Class)immutableSubclass
{
  return 0;
}

- (void)addAction:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(FBSSceneTransitionContext *)self addActions:v4];
}

- (void)addActions:(id)a3
{
  id v9 = a3;
  if ([v9 count])
  {
    id v4 = [(FBSSceneTransitionContext *)self actions];
    v5 = (void *)[v4 mutableCopy];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA80] set];
    }
    v8 = v7;

    [v8 unionSet:v9];
    [(FBSSceneTransitionContext *)self setActions:v8];
  }
}

- (void)removeAction:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(FBSSceneTransitionContext *)self removeActions:v4];
}

- (void)removeActions:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    id v4 = [(FBSSceneTransitionContext *)self actions];
    v5 = (void *)[v4 mutableCopy];

    if ([v5 count])
    {
      [v5 minusSet:v6];
      [(FBSSceneTransitionContext *)self setActions:v5];
    }
  }
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)[(objc_class *)a3 transitionContextExtensions];
}

@end