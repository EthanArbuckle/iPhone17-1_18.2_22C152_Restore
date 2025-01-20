@interface MTLVisibleFunctionTableDescriptor
+ (MTLVisibleFunctionTableDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLVisibleFunctionTableDescriptor)visibleFunctionTableDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLVisibleFunctionTableDescriptor

+ (MTLVisibleFunctionTableDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLVisibleFunctionTableDescriptor *)+[MTLVisibleFunctionTableDescriptorInternal allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLVisibleFunctionTableDescriptor;
    return (MTLVisibleFunctionTableDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLVisibleFunctionTableDescriptor)visibleFunctionTableDescriptor
{
  v2 = objc_alloc_init(MTLVisibleFunctionTableDescriptorInternal);

  return (MTLVisibleFunctionTableDescriptor *)v2;
}

@end