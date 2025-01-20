@interface VNImageAnalyzerMultiDetectorAnalysisConfiguration
- (VNImageAnalyzerMultiDetectorAnalysisConfiguration)initWithObservationsRecipient:(id)a3;
- (VNObservationsRecipient)observationsRecipient;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)analysisTypes;
- (unsigned)labelsListType;
@end

@implementation VNImageAnalyzerMultiDetectorAnalysisConfiguration

- (void).cxx_destruct
{
}

- (VNObservationsRecipient)observationsRecipient
{
  return self->_observationsRecipient;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  observationsRecipient = self->_observationsRecipient;

  return (id)[v4 initWithObservationsRecipient:observationsRecipient];
}

- (unsigned)labelsListType
{
  return 0;
}

- (unsigned)analysisTypes
{
  return 0;
}

- (VNImageAnalyzerMultiDetectorAnalysisConfiguration)initWithObservationsRecipient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNImageAnalyzerMultiDetectorAnalysisConfiguration;
  v6 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);
  }

  return v7;
}

@end