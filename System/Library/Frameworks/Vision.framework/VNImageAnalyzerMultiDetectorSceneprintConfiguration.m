@interface VNImageAnalyzerMultiDetectorSceneprintConfiguration
- (BOOL)includeLabelsAndConfidences;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)analysisTypes;
- (void)setIncludeLabelsAndConfidences:(BOOL)a3;
@end

@implementation VNImageAnalyzerMultiDetectorSceneprintConfiguration

- (void)setIncludeLabelsAndConfidences:(BOOL)a3
{
  self->_includeLabelsAndConfidences = a3;
}

- (BOOL)includeLabelsAndConfidences
{
  return self->_includeLabelsAndConfidences;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VNImageAnalyzerMultiDetectorSceneprintConfiguration;
  id result = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v5 copyWithZone:a3];
  if (result) {
    *((unsigned char *)result + 16) = self->_includeLabelsAndConfidences;
  }
  return result;
}

- (unsigned)analysisTypes
{
  if ([(VNImageAnalyzerMultiDetectorSceneprintConfiguration *)self includeLabelsAndConfidences])
  {
    return 3;
  }
  else
  {
    return 1;
  }
}

@end