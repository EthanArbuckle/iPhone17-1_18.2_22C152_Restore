@interface AVSeymourBehavior
+ (Class)behaviorContextClass;
- (AVSeymourBehaviorContext)behaviorContext;
- (void)setBehaviorContext:(id)a3;
@end

@implementation AVSeymourBehavior

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

- (AVSeymourBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVSeymourBehaviorContext *)WeakRetained;
}

@end