@interface MCTimerContext
- (BOOL)enabled;
- (MCTimerContext)init;
- (void)disable;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MCTimerContext

- (MCTimerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCTimerContext;
  result = [(MCTimerContext *)&v3 init];
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