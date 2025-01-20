@interface MTLBufferLayoutDescriptorArray
+ (MTLBufferLayoutDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLBufferLayoutDescriptor)objectAtIndexedSubscript:(NSUInteger)index;
@end

@implementation MTLBufferLayoutDescriptorArray

+ (MTLBufferLayoutDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLBufferLayoutDescriptorArray *)+[MTLBufferLayoutDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLBufferLayoutDescriptorArray;
    return (MTLBufferLayoutDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLBufferLayoutDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end