@interface VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration
- (VNDisallowedList)disallowedList;
- (VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3;
- (float)minimumConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumLabels;
- (unsigned)analysisTypes;
- (unsigned)labelsListType;
- (void)setDisallowedList:(id)a3;
- (void)setMaximumLabels:(unint64_t)a3;
- (void)setMinimumConfidence:(float)a3;
@end

@implementation VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration

- (void).cxx_destruct
{
}

- (void)setMaximumLabels:(unint64_t)a3
{
  self->_maximumLabels = a3;
}

- (unint64_t)maximumLabels
{
  return self->_maximumLabels;
}

- (void)setMinimumConfidence:(float)a3
{
  self->_minimumConfidence = a3;
}

- (float)minimumConfidence
{
  return self->_minimumConfidence;
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
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration;
  v4 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = self->_maximumLabels;
  }
  return v5;
}

- (unsigned)labelsListType
{
  return 4096;
}

- (unsigned)analysisTypes
{
  return 4096;
}

- (VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetectorEntityNetClassificationConfiguration;
  result = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v4 initWithObservationsRecipient:a3];
  if (result)
  {
    result->_minimumConfidence = 0.00000011921;
    result->_maximumLabels = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end