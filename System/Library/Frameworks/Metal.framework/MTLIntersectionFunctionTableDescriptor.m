@interface MTLIntersectionFunctionTableDescriptor
+ (MTLIntersectionFunctionTableDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLIntersectionFunctionTableDescriptor)intersectionFunctionTableDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLIntersectionFunctionTableDescriptor

+ (MTLIntersectionFunctionTableDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLIntersectionFunctionTableDescriptor *)+[MTLIntersectionFunctionTableDescriptorInternal allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLIntersectionFunctionTableDescriptor;
    return (MTLIntersectionFunctionTableDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLIntersectionFunctionTableDescriptor)intersectionFunctionTableDescriptor
{
  v2 = objc_alloc_init(MTLIntersectionFunctionTableDescriptorInternal);

  return (MTLIntersectionFunctionTableDescriptor *)v2;
}

@end