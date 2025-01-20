@interface MTLCommandBufferDescriptor
+ (MTLCommandBufferDescriptor)allocWithZone:(_NSZone *)a3;
- (MTLLogState)logState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLogState:(id)a3;
@end

@implementation MTLCommandBufferDescriptor

+ (MTLCommandBufferDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLCommandBufferDescriptor *)+[MTLCommandBufferDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLCommandBufferDescriptor;
    return (MTLCommandBufferDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (MTLLogState)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
}

@end