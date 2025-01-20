@interface __NSMessageBuilder
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation __NSMessageBuilder

- (void)forwardInvocation:(id)a3
{
  if (self->_addr) {
    *self->_addr = a3;
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

@end