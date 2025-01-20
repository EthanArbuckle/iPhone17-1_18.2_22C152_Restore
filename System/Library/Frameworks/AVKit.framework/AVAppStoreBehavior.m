@interface AVAppStoreBehavior
+ (AVAppStoreBehavior)behaviorWithFirstGenerationEmbeddedPlayer;
+ (Class)behaviorContextClass;
- (AVAppStoreBehaviorContext)behaviorContext;
- (BOOL)prefersFirstGenerationControlsWhenEmbeddedInline;
- (void)setBehaviorContext:(id)a3;
- (void)willMoveToContext:(id)a3;
@end

@implementation AVAppStoreBehavior

- (void).cxx_destruct
{
}

- (BOOL)prefersFirstGenerationControlsWhenEmbeddedInline
{
  return self->_prefersFirstGenerationControlsWhenEmbeddedInline;
}

- (void)setBehaviorContext:(id)a3
{
}

- (AVAppStoreBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVAppStoreBehaviorContext *)WeakRetained;
}

- (void)willMoveToContext:(id)a3
{
  id v5 = a3;
  if ([(AVAppStoreBehavior *)self prefersFirstGenerationControlsWhenEmbeddedInline])
  {
    v4 = [v5 playerViewController];
    [v4 setControlsGeneration:0];
  }
}

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

+ (AVAppStoreBehavior)behaviorWithFirstGenerationEmbeddedPlayer
{
  v2 = objc_alloc_init(AVAppStoreBehavior);
  v2->_prefersFirstGenerationControlsWhenEmbeddedInline = 1;

  return v2;
}

@end