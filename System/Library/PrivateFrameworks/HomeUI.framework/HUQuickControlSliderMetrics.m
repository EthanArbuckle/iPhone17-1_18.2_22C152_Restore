@interface HUQuickControlSliderMetrics
- (HUIntrinsicSizeDescriptor)sizeDescriptor;
- (HUQuickControlSliderMetrics)initWithSizeDescriptor:(id)a3 cornerRadius:(double)a4 widthToCornerRadiusRatio:(double)a5;
- (double)cornerRadius;
- (double)widthToCornerRadiusRatio;
@end

@implementation HUQuickControlSliderMetrics

- (HUQuickControlSliderMetrics)initWithSizeDescriptor:(id)a3 cornerRadius:(double)a4 widthToCornerRadiusRatio:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlSliderMetrics;
  v10 = [(HUQuickControlSliderMetrics *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sizeDescriptor, a3);
    v11->_cornerRadius = a4;
    v11->_widthToCornerRadiusRatio = a5;
  }

  return v11;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (double)widthToCornerRadiusRatio
{
  return self->_widthToCornerRadiusRatio;
}

- (void).cxx_destruct
{
}

@end