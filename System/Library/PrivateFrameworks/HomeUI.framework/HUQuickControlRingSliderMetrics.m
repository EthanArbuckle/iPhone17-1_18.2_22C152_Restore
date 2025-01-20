@interface HUQuickControlRingSliderMetrics
- (HUIntrinsicSizeDescriptor)sizeDescriptor;
- (HUQuickControlRingSliderMetrics)initWithSizeDescriptor:(id)a3 outerRadius:(double)a4;
- (double)outerRadius;
@end

@implementation HUQuickControlRingSliderMetrics

- (HUQuickControlRingSliderMetrics)initWithSizeDescriptor:(id)a3 outerRadius:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUQuickControlRingSliderMetrics;
  v8 = [(HUQuickControlRingSliderMetrics *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sizeDescriptor, a3);
    v9->_outerRadius = a4;
  }

  return v9;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (double)outerRadius
{
  return self->_outerRadius;
}

- (void).cxx_destruct
{
}

@end