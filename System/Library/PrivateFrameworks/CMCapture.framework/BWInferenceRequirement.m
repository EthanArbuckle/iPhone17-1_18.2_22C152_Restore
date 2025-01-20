@interface BWInferenceRequirement
- (BWInferenceConfiguration)configuration;
- (BWInferenceProvider)provider;
- (BWInferenceRequirement)initWithProvider:(id)a3 configuration:(id)a4;
- (void)dealloc;
@end

@implementation BWInferenceRequirement

- (BWInferenceProvider)provider
{
  return self->_provider;
}

- (BWInferenceRequirement)initWithProvider:(id)a3 configuration:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceRequirement;
  v6 = [(BWInferenceRequirement *)&v8 init];
  if (v6)
  {
    v6->_provider = (BWInferenceProvider *)a3;
    v6->_configuration = (BWInferenceConfiguration *)a4;
  }
  return v6;
}

- (BWInferenceConfiguration)configuration
{
  return self->_configuration;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceRequirement;
  [(BWInferenceRequirement *)&v3 dealloc];
}

@end