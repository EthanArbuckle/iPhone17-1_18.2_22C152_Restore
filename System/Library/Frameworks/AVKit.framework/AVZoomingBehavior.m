@interface AVZoomingBehavior
+ (Class)behaviorContextClass;
- (AVZoomingBehaviorContext)behaviorContext;
- (void)setBehaviorContext:(id)a3;
@end

@implementation AVZoomingBehavior

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setBehaviorContext:(id)a3
{
}

- (AVZoomingBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVZoomingBehaviorContext *)WeakRetained;
}

@end