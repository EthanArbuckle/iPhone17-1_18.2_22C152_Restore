@interface AVHomeIPCameraBehavior
+ (Class)behaviorContextClass;
- (AVHomeIPCameraBehaviorContext)behaviorContext;
- (void)setBehaviorContext:(id)a3;
@end

@implementation AVHomeIPCameraBehavior

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

- (AVHomeIPCameraBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVHomeIPCameraBehaviorContext *)WeakRetained;
}

@end