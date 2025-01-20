@interface MTLRasterizationRateLayerArray
- (MTLRasterizationRateLayerArray)init;
- (MTLRasterizationRateLayerDescriptor)objectAtIndexedSubscript:(NSUInteger)layerIndex;
@end

@implementation MTLRasterizationRateLayerArray

- (MTLRasterizationRateLayerArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerArray;
  return [(MTLRasterizationRateLayerArray *)&v3 init];
}

- (MTLRasterizationRateLayerDescriptor)objectAtIndexedSubscript:(NSUInteger)layerIndex
{
  return 0;
}

@end