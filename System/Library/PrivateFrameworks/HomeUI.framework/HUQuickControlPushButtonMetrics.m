@interface HUQuickControlPushButtonMetrics
- (HUIntrinsicSizeDescriptor)sizeDescriptor;
- (HUQuickControlPushButtonMetrics)initWithSizeDescriptor:(id)a3;
@end

@implementation HUQuickControlPushButtonMetrics

- (HUQuickControlPushButtonMetrics)initWithSizeDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlPushButtonMetrics;
  v6 = [(HUQuickControlPushButtonMetrics *)&v9 init];
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