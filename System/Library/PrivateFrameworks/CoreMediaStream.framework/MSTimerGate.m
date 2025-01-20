@interface MSTimerGate
- (BOOL)enabled;
- (MSTimerGate)init;
- (void)disable;
- (void)enable;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MSTimerGate

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)enable
{
  self->_enabled = 1;
}

- (void)disable
{
  self->_enabled = 0;
}

- (MSTimerGate)init
{
  v3.receiver = self;
  v3.super_class = (Class)MSTimerGate;
  result = [(MSTimerGate *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

@end