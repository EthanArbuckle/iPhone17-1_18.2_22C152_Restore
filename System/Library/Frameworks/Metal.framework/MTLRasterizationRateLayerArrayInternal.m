@interface MTLRasterizationRateLayerArrayInternal
- (MTLRasterizationRateLayerArrayInternal)initWithParent:(id)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
@end

@implementation MTLRasterizationRateLayerArrayInternal

- (MTLRasterizationRateLayerArrayInternal)initWithParent:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLRasterizationRateLayerArrayInternal;
  result = [(MTLRasterizationRateLayerArray *)&v5 init];
  if (result) {
    result->_parent = (MTLRasterizationRateMapDescriptor *)a3;
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return [(MTLRasterizationRateMapDescriptor *)self->_parent layerAtIndex:a3];
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
}

@end