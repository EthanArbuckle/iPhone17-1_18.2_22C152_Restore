@interface HUQuickControlStepperViewMetrics
- (HUIntrinsicSizeDescriptor)sizeDescriptor;
- (HUQuickControlStepperViewMetrics)initWithSizeDescriptor:(id)a3 orientation:(unint64_t)a4 cornerRadius:(double)a5;
- (double)cornerRadius;
- (unint64_t)orientation;
@end

@implementation HUQuickControlStepperViewMetrics

- (HUQuickControlStepperViewMetrics)initWithSizeDescriptor:(id)a3 orientation:(unint64_t)a4 cornerRadius:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUQuickControlStepperViewMetrics;
  v10 = [(HUQuickControlStepperViewMetrics *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sizeDescriptor, a3);
    v11->_orientation = a4;
    v11->_cornerRadius = a5;
  }

  return v11;
}

- (HUIntrinsicSizeDescriptor)sizeDescriptor
{
  return self->_sizeDescriptor;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end