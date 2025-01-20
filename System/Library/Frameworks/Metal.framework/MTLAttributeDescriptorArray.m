@interface MTLAttributeDescriptorArray
+ (MTLAttributeDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index;
@end

@implementation MTLAttributeDescriptorArray

+ (MTLAttributeDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLAttributeDescriptorArray *)+[MTLAttributeDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLAttributeDescriptorArray;
    return (MTLAttributeDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end