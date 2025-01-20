@interface _VNVisionCoreInferenceNetworkResourceDescriptor
- (_VNVisionCoreInferenceNetworkResourceDescriptor)initWithDescriptor:(id)a3;
- (id)modelURL;
@end

@implementation _VNVisionCoreInferenceNetworkResourceDescriptor

- (void).cxx_destruct
{
}

- (id)modelURL
{
  return (id)[(VisionCoreInferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor URL];
}

- (_VNVisionCoreInferenceNetworkResourceDescriptor)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNVisionCoreInferenceNetworkResourceDescriptor;
  v6 = [(VNResourceDescriptor *)&v9 _init];
  v7 = (_VNVisionCoreInferenceNetworkResourceDescriptor *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

@end