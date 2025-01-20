@interface AXFBFakeProcessState
- (int)pid;
- (void)setPid:(int)a3;
@end

@implementation AXFBFakeProcessState

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

@end