@interface VNRecognizeDocumentsRequestConfiguration
- (BOOL)detectionOnly;
- (BOOL)usesAlternateLineGrouping;
- (BOOL)usesFormFieldDetection;
- (VNRecognizeDocumentsRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumCandidateCount;
- (void)setDetectionOnly:(BOOL)a3;
- (void)setMaximumCandidateCount:(unint64_t)a3;
- (void)setUsesAlternateLineGrouping:(BOOL)a3;
- (void)setUsesFormFieldDetection:(BOOL)a3;
@end

@implementation VNRecognizeDocumentsRequestConfiguration

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  self->_maximumCandidateCount = a3;
}

- (unint64_t)maximumCandidateCount
{
  return self->_maximumCandidateCount;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  self->_usesFormFieldDetection = a3;
}

- (BOOL)usesFormFieldDetection
{
  return self->_usesFormFieldDetection;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  self->_usesAlternateLineGrouping = a3;
}

- (BOOL)usesAlternateLineGrouping
{
  return self->_usesAlternateLineGrouping;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)detectionOnly
{
  return self->_detectionOnly;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizeDocumentsRequestConfiguration;
  id v4 = [(VNRecognizeTextRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setDetectionOnly:self->_detectionOnly];
    [v5 setUsesAlternateLineGrouping:self->_usesAlternateLineGrouping];
    [v5 setUsesFormFieldDetection:self->_usesFormFieldDetection];
    [v5 setMaximumCandidateCount:self->_maximumCandidateCount];
  }
  return v5;
}

- (VNRecognizeDocumentsRequestConfiguration)initWithRequestClass:(Class)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizeDocumentsRequestConfiguration;
  v3 = [(VNRecognizeTextRequestConfiguration *)&v6 initWithRequestClass:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_detectionOnly = 0;
    v3->_usesAlternateLineGrouping = 0;
    v3->_usesFormFieldDetection = 0;
    v3->_maximumCandidateCount = 3;
    [(VNRecognizeTextRequestConfiguration *)v3 setAutomaticallyDetectsLanguage:1];
  }
  return v4;
}

@end