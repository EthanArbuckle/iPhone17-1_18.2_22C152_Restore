@interface FBWatchdogTransitionContext
- (BOOL)runIndependently;
- (FBProcessWatchdogProviding)watchdogProvider;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)watchdogBehavior;
- (void)setRunIndependently:(BOOL)a3;
- (void)setWatchdogBehavior:(int64_t)a3;
- (void)setWatchdogProvider:(id)a3;
@end

@implementation FBWatchdogTransitionContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(FBWatchdogTransitionContext);
  [(FBWatchdogTransitionContext *)v4 setWatchdogBehavior:self->_watchdogBehavior];
  [(FBWatchdogTransitionContext *)v4 setWatchdogProvider:self->_watchdogProvider];
  [(FBWatchdogTransitionContext *)v4 setRunIndependently:self->_runIndependently];
  return v4;
}

- (int64_t)watchdogBehavior
{
  return self->_watchdogBehavior;
}

- (void)setWatchdogBehavior:(int64_t)a3
{
  self->_watchdogBehavior = a3;
}

- (FBProcessWatchdogProviding)watchdogProvider
{
  return self->_watchdogProvider;
}

- (void)setWatchdogProvider:(id)a3
{
}

- (BOOL)runIndependently
{
  return self->_runIndependently;
}

- (void)setRunIndependently:(BOOL)a3
{
  self->_runIndependently = a3;
}

- (void).cxx_destruct
{
}

@end