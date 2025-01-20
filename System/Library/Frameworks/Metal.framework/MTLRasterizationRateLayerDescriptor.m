@interface MTLRasterizationRateLayerDescriptor
+ (MTLRasterizationRateLayerDescriptor)allocWithZone:(_NSZone *)a3;
- (MTLRasterizationRateLayerDescriptor)init;
- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount;
- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount horizontal:(const float *)horizontal vertical:(const float *)vertical;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MTLRasterizationRateLayerDescriptor

+ (MTLRasterizationRateLayerDescriptor)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLRasterizationRateLayerDescriptor *)+[MTLRasterizationRateLayerDescriptor allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLRasterizationRateLayerDescriptor;
    return (MTLRasterizationRateLayerDescriptor *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (MTLRasterizationRateLayerDescriptor)init
{
  memset(v3, 0, sizeof(v3));
  return [(MTLRasterizationRateLayerDescriptor *)self initWithSampleCount:v3];
}

- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount
{
  v4.receiver = self;
  v4.super_class = (Class)MTLRasterizationRateLayerDescriptor;
  return [(MTLRasterizationRateLayerDescriptor *)&v4 init];
}

- (MTLRasterizationRateLayerDescriptor)initWithSampleCount:(MTLSize *)sampleCount horizontal:(const float *)horizontal vertical:(const float *)vertical
{
  MTLSize v6 = *sampleCount;
  return -[MTLRasterizationRateLayerDescriptor initWithSampleCount:](self, "initWithSampleCount:", &v6, horizontal, vertical);
}

@end