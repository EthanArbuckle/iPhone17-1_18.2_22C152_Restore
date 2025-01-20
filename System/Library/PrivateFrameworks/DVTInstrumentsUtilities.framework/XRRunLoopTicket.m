@interface XRRunLoopTicket
- (BOOL)stopWhenDone;
- (OS_dispatch_group)group;
- (void)setGroup:(id)a3;
- (void)setStopWhenDone:(BOOL)a3;
@end

@implementation XRRunLoopTicket

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (BOOL)stopWhenDone
{
  return self->_stopWhenDone;
}

- (void)setStopWhenDone:(BOOL)a3
{
  self->_stopWhenDone = a3;
}

- (void).cxx_destruct
{
}

@end