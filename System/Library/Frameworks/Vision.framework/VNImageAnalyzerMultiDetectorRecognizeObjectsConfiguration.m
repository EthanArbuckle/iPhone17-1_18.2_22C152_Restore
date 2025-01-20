@interface VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration
- (VNDisallowedList)disallowedList;
- (VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3;
- (float)minimumDetectionConfidence;
- (float)nonMaximumSuppressionThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)analysisTypes;
- (unsigned)labelsListType;
- (void)setDisallowedList:(id)a3;
- (void)setMinimumDetectionConfidence:(float)a3;
- (void)setNonMaximumSuppressionThreshold:(float)a3;
@end

@implementation VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration

- (void).cxx_destruct
{
}

- (void)setNonMaximumSuppressionThreshold:(float)a3
{
  self->_nonMaximumSuppressionThreshold = a3;
}

- (float)nonMaximumSuppressionThreshold
{
  return self->_nonMaximumSuppressionThreshold;
}

- (void)setMinimumDetectionConfidence:(float)a3
{
  self->_minimumDetectionConfidence = a3;
}

- (float)minimumDetectionConfidence
{
  return self->_minimumDetectionConfidence;
}

- (void)setDisallowedList:(id)a3
{
}

- (VNDisallowedList)disallowedList
{
  return self->_disallowedList;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration;
  v4 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v7 copyWithZone:a3];
  v5 = (float *)v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    v5[4] = self->_minimumDetectionConfidence;
    v5[5] = self->_nonMaximumSuppressionThreshold;
  }
  return v5;
}

- (unsigned)labelsListType
{
  return 64;
}

- (unsigned)analysisTypes
{
  return 64;
}

- (VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetectorRecognizeObjectsConfiguration;
  result = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v4 initWithObservationsRecipient:a3];
  if (result)
  {
    result->_minimumDetectionConfidence = 0.1;
    result->_nonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

@end