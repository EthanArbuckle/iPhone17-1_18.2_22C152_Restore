@interface MTLVertexAttributeDescriptorArray
+ (MTLVertexAttributeDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLVertexAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index;
@end

@implementation MTLVertexAttributeDescriptorArray

+ (MTLVertexAttributeDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLVertexAttributeDescriptorArray *)+[MTLVertexAttributeDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLVertexAttributeDescriptorArray;
    return (MTLVertexAttributeDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLVertexAttributeDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end