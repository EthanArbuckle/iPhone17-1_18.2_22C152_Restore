@interface MTLCounterSampleBufferDescriptor
+ (MTLCounterSampleBufferDescriptor)allocWithZone:(_NSZone *)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLCounterSampleBufferDescriptor

+ (MTLCounterSampleBufferDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLCounterSampleBufferDescriptor *)+[MTLCounterSampleBufferDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLCounterSampleBufferDescriptor;
    return (MTLCounterSampleBufferDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

@end