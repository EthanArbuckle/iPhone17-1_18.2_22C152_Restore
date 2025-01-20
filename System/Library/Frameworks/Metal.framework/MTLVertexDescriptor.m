@interface MTLVertexDescriptor
+ (MTLVertexDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLVertexDescriptor)vertexDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
@end

@implementation MTLVertexDescriptor

+ (MTLVertexDescriptor)vertexDescriptor
{
  v2 = objc_alloc_init(MTLVertexDescriptorInternal);

  return (MTLVertexDescriptor *)v2;
}

+ (MTLVertexDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLVertexDescriptor *)+[MTLVertexDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLVertexDescriptor;
    return (MTLVertexDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  return 0;
}

@end