@interface MTLRasterizationRateMapDescriptor
+ (MTLRasterizationRateMapDescriptor)allocWithZone:(_NSZone *)a3;
+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize;
+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layer:(MTLRasterizationRateLayerDescriptor *)layer;
+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layerCount:(NSUInteger)layerCount layers:(MTLRasterizationRateLayerDescriptor *const *)layers;
- (MTLRasterizationRateLayerDescriptor)layerAtIndex:(NSUInteger)layerIndex;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLRasterizationRateMapDescriptor

+ (MTLRasterizationRateMapDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRasterizationRateMapDescriptor *)+[MTLRasterizationRateMapDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRasterizationRateMapDescriptor;
    return (MTLRasterizationRateMapDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize
{
  MTLSize v4 = *screenSize;
  return +[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:&v4 layerCount:0 layers:0];
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layer:(MTLRasterizationRateLayerDescriptor *)layer
{
  objc_super v6 = layer;
  MTLSize v5 = *screenSize;
  return +[MTLRasterizationRateMapDescriptor rasterizationRateMapDescriptorWithScreenSize:&v5 layerCount:1 layers:&v6];
}

+ (MTLRasterizationRateMapDescriptor)rasterizationRateMapDescriptorWithScreenSize:(MTLSize *)screenSize layerCount:(NSUInteger)layerCount layers:(MTLRasterizationRateLayerDescriptor *const *)layers
{
  v8 = [MTLRasterizationRateMapDescriptorInternal alloc];
  MTLSize v12 = *screenSize;
  v9 = [(MTLRasterizationRateMapDescriptorInternal *)v8 initWithScreenSize:&v12];
  if (layerCount)
  {
    NSUInteger v10 = layerCount - 1;
    do
    {
      [(MTLRasterizationRateMapDescriptorInternal *)v9 setLayer:layers[v10] atIndex:v10];
      --v10;
    }
    while (v10 != -1);
  }
  return (MTLRasterizationRateMapDescriptor *)v9;
}

- (MTLRasterizationRateLayerDescriptor)layerAtIndex:(NSUInteger)layerIndex
{
  return 0;
}

@end