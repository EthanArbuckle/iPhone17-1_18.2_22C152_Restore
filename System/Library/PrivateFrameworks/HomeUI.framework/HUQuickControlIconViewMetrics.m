@interface HUQuickControlIconViewMetrics
- (HUIntrinsicSizeDescriptor)sizeDescriptor;
- (HUQuickControlIconViewMetrics)initWithSizeDescriptor:(id)a3;
@end

@implementation HUQuickControlIconViewMetrics

- (HUQuickControlIconViewMetrics)initWithSizeDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlIconViewMetrics;
  v6 = [(HUQuickControlIconViewMetrics *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sizeDescriptor, a3);
  }

  return v7;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (void).cxx_destruct
{
}

@end