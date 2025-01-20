@interface AVEditBehavior
+ (Class)behaviorContextClass;
- (AVEditBehaviorContext)behaviorContext;
- (AVEditBehaviorDelegate)delegate;
- (void)setBehaviorContext:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVEditBehavior

+ (Class)behaviorContextClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_behaviorContext);
}

- (void)setDelegate:(id)a3
{
}

- (AVEditBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVEditBehaviorDelegate *)WeakRetained;
}

- (void)setBehaviorContext:(id)a3
{
}

- (AVEditBehaviorContext)behaviorContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorContext);

  return (AVEditBehaviorContext *)WeakRetained;
}

@end