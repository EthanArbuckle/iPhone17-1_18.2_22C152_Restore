@interface MTLCommandQueueDescriptor
+ (MTLCommandQueueDescriptor)allocWithZone:(_NSZone *)a3;
+ (id)commandQueueDescriptor;
- (MTLLogState)logState;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maxCommandBufferCount;
- (void)setLogState:(id)a3;
- (void)setMaxCommandBufferCount:(unint64_t)a3;
@end

@implementation MTLCommandQueueDescriptor

+ (MTLCommandQueueDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLCommandQueueDescriptor *)+[MTLCommandQueueDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLCommandQueueDescriptor;
    return (MTLCommandQueueDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

+ (id)commandQueueDescriptor
{
  v2 = objc_alloc_init(MTLCommandQueueDescriptorInternal);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)maxCommandBufferCount
{
  return self->_maxCommandBufferCount;
}

- (void)setMaxCommandBufferCount:(unint64_t)a3
{
  self->_maxCommandBufferCount = a3;
}

- (MTLLogState)logState
{
  return self->_logState;
}

- (void)setLogState:(id)a3
{
}

@end