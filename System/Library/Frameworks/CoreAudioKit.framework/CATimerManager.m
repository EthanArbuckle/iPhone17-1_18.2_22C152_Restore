@interface CATimerManager
+ (id)getWeakReferenceOfObject:(id)a3;
- (CATimerManager)init;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)timerSource;
- (void)forwardInvocation:(id)a3;
- (void)setTimerSource:(id)a3;
@end

@implementation CATimerManager

- (CATimerManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CATimerManager;
  return [(CATimerManager *)&v3 init];
}

+ (id)getWeakReferenceOfObject:(id)a3
{
  v4 = objc_opt_new();
  [v4 setTimerSource:a3];

  return v4;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  [(CATimerManager *)self timerSource];
  v4 = objc_opt_class();

  return (id)[v4 instanceMethodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = [(CATimerManager *)self timerSource];

  [a3 invokeWithTarget:v4];
}

- (id)timerSource
{
  return self->timerSource;
}

- (void)setTimerSource:(id)a3
{
  self->timerSource = a3;
}

@end