@interface HMProxyObjectIVar
- (HMProxyObjectIVar)self;
- (void)dealloc;
@end

@implementation HMProxyObjectIVar

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)HMProxyObjectIVar;
  [(HMProxyObjectIVar *)&v3 dealloc];
}

- (HMProxyObjectIVar)self
{
  return (HMProxyObjectIVar *)self->_target;
}

@end