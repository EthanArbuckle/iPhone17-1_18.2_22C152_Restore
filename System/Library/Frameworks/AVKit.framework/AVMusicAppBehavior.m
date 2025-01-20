@interface AVMusicAppBehavior
+ (Class)behaviorContextClass;
- (AVMusicAppBehaviorContext)behaviorContext;
- (void)setBehaviorContext:(id)a3;
@end

@implementation AVMusicAppBehavior

- (AVMusicAppBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVMusicAppBehaviorContext *)WeakRetained;
}

- (void)setBehaviorContext:(id)a3
{
}

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end