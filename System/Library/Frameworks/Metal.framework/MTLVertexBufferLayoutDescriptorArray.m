@interface MTLVertexBufferLayoutDescriptorArray
+ (MTLVertexBufferLayoutDescriptorArray)allocWithZone:(_NSZone *)a3;
- (MTLVertexBufferLayoutDescriptor)objectAtIndexedSubscript:(NSUInteger)index;
@end

@implementation MTLVertexBufferLayoutDescriptorArray

+ (MTLVertexBufferLayoutDescriptorArray)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLVertexBufferLayoutDescriptorArray *)+[MTLVertexBufferLayoutDescriptorArray allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLVertexBufferLayoutDescriptorArray;
    return (MTLVertexBufferLayoutDescriptorArray *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLVertexBufferLayoutDescriptor)objectAtIndexedSubscript:(NSUInteger)index
{
  return 0;
}

@end