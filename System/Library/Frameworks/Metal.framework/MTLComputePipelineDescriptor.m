@interface MTLComputePipelineDescriptor
+ (MTLComputePipelineDescriptor)allocWithZone:(_NSZone *)a3;
- (NSArray)insertLibraries;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInsertLibraries:(NSArray *)insertLibraries;
@end

@implementation MTLComputePipelineDescriptor

+ (MTLComputePipelineDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLComputePipelineDescriptor *)+[MTLComputePipelineDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLComputePipelineDescriptor;
    return (MTLComputePipelineDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (NSArray)insertLibraries
{
  return self->_insertLibraries;
}

- (void)setInsertLibraries:(NSArray *)insertLibraries
{
}

@end