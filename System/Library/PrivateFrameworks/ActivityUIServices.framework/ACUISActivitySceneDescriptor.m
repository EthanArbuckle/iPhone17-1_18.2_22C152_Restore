@interface ACUISActivitySceneDescriptor
- (ACActivityDescriptor)activityDescriptor;
- (ACUISActivityMetricsRequest)metricsRequest;
- (ACUISActivitySceneDescriptor)initWithActivityDescriptor:(id)a3 payloadIdentifier:(id)a4 activitySceneType:(int64_t)a5 metricsRequest:(id)a6;
- (ACUISActivitySceneDescriptor)initWithActivitySceneDescriptor:(id)a3 acActivityDescriptor:(id)a4;
- (ACUISActivitySceneMetrics)metrics;
- (BOOL)useFallbackMetrics;
- (NSData)activityDescriptorData;
- (NSString)activityIdentifier;
- (NSString)payloadIdentifier;
- (id)_activitySceneDescriptor;
- (int64_t)activitySceneType;
- (void)setUseFallbackMetrics:(BOOL)a3;
@end

@implementation ACUISActivitySceneDescriptor

- (ACUISActivitySceneDescriptor)initWithActivitySceneDescriptor:(id)a3 acActivityDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ACUISActivitySceneDescriptor;
  v8 = [(ACUISActivitySceneDescriptor *)&v20 init];
  if (v8)
  {
    uint64_t v9 = [v6 activityDescriptorData];
    activityDescriptorData = v8->_activityDescriptorData;
    v8->_activityDescriptorData = (NSData *)v9;

    unint64_t v11 = [v6 activitySceneType];
    if (v11 >= 4) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    v8->_activitySceneType = v12;
    objc_storeStrong((id *)&v8->_activityDescriptor, a4);
    v13 = [ACUISActivityMetricsRequest alloc];
    v14 = [v6 metricsRequest];
    uint64_t v15 = [(ACUISActivityMetricsRequest *)v13 _initWithMetricsRequest:v14];
    metricsRequest = v8->_metricsRequest;
    v8->_metricsRequest = (ACUISActivityMetricsRequest *)v15;

    uint64_t v17 = [v6 payloadID];
    payloadIdentifier = v8->_payloadIdentifier;
    v8->_payloadIdentifier = (NSString *)v17;
  }
  return v8;
}

- (ACUISActivitySceneDescriptor)initWithActivityDescriptor:(id)a3 payloadIdentifier:(id)a4 activitySceneType:(int64_t)a5 metricsRequest:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ACUISActivitySceneDescriptor;
  uint64_t v12 = [(ACUISActivitySceneDescriptor *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v10 descriptorData];
    activityDescriptorData = v12->_activityDescriptorData;
    v12->_activityDescriptorData = (NSData *)v13;

    v12->_activitySceneType = a5;
    objc_storeStrong((id *)&v12->_activityDescriptor, a3);
    objc_storeStrong((id *)&v12->_metricsRequest, a6);
    uint64_t v15 = [(NSString *)v12->_payloadIdentifier copy];
    payloadIdentifier = v12->_payloadIdentifier;
    v12->_payloadIdentifier = (NSString *)v15;
  }
  return v12;
}

- (NSString)activityIdentifier
{
  return (NSString *)[(ACActivityDescriptor *)self->_activityDescriptor activityIdentifier];
}

- (ACUISActivitySceneMetrics)metrics
{
  BOOL v2 = [(ACUISActivitySceneDescriptor *)self useFallbackMetrics];
  v3 = [ACUISActivitySceneMetrics alloc];
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v2)
  {
    double v4 = 370.0;
    double v5 = 200.0;
  }
  id v6 = -[ACUISActivitySceneMetrics initWithSize:cornerRadius:](v3, "initWithSize:cornerRadius:", v4, v5, 12.0);
  return v6;
}

- (id)_activitySceneDescriptor
{
  v3 = [_TtC18ActivityUIServices23ActivitySceneDescriptor alloc];
  activityDescriptorData = self->_activityDescriptorData;
  if (self->_activitySceneType >= 4uLL) {
    int64_t activitySceneType = 1;
  }
  else {
    int64_t activitySceneType = self->_activitySceneType;
  }
  id v6 = [(ACUISActivityMetricsRequest *)self->_metricsRequest _activityMetricsRequest];
  id v7 = [(ActivitySceneDescriptor *)v3 initWithActivitySceneType:activitySceneType activityDescriptor:activityDescriptorData metricsRequest:v6 payloadID:self->_payloadIdentifier];

  return v7;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (int64_t)activitySceneType
{
  return self->_activitySceneType;
}

- (ACActivityDescriptor)activityDescriptor
{
  return self->_activityDescriptor;
}

- (ACUISActivityMetricsRequest)metricsRequest
{
  return self->_metricsRequest;
}

- (NSData)activityDescriptorData
{
  return self->_activityDescriptorData;
}

- (BOOL)useFallbackMetrics
{
  return self->_useFallbackMetrics;
}

- (void)setUseFallbackMetrics:(BOOL)a3
{
  self->_useFallbackMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_metricsRequest, 0);
  objc_storeStrong((id *)&self->_activityDescriptor, 0);
  objc_storeStrong((id *)&self->_activityDescriptorData, 0);
}

@end