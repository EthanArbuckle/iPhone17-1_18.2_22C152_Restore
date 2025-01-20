@interface BWInferenceDataDependency
- (BWInferenceDataDependency)initWithInferenceRequirement:(id)a3 dependentOnDataRequirement:(id)a4;
- (BWInferenceDataRequirement)dataRequirement;
- (BWInferenceRequirement)inferenceRequirement;
- (void)dealloc;
@end

@implementation BWInferenceDataDependency

- (BWInferenceDataDependency)initWithInferenceRequirement:(id)a3 dependentOnDataRequirement:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceDataDependency;
  v6 = [(BWInferenceDataDependency *)&v8 init];
  if (v6)
  {
    v6->_dataRequirement = (BWInferenceDataRequirement *)a4;
    v6->_inferenceRequirement = (BWInferenceRequirement *)a3;
  }
  return v6;
}

- (BWInferenceDataRequirement)dataRequirement
{
  return self->_dataRequirement;
}

- (BWInferenceRequirement)inferenceRequirement
{
  return self->_inferenceRequirement;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceDataDependency;
  [(BWInferenceDataDependency *)&v3 dealloc];
}

@end