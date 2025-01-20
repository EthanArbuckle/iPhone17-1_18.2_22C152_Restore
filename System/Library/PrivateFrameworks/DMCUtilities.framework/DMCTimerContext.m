@interface DMCTimerContext
- (BOOL)enabled;
- (DMCTimerContext)init;
- (void)disable;
- (void)setEnabled:(BOOL)a3;
@end

@implementation DMCTimerContext

- (DMCTimerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMCTimerContext;
  result = [(DMCTimerContext *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)disable
{
  self->_enabled = 0;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end