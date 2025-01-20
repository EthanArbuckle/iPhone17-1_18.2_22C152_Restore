@interface VNImageAnalyzerMultiDetectorSceneClassificationConfiguration
- (VNClassificationCustomHierarchy)customHierarchy;
- (VNDisallowedList)disallowedList;
- (VNImageAnalyzerMultiDetectorSceneClassificationConfiguration)initWithObservationsRecipient:(id)a3;
- (float)minimumConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumHierarchicalLabels;
- (unint64_t)maximumLeafLabels;
- (unsigned)analysisTypes;
- (unsigned)labelsListType;
- (void)setCustomHierarchy:(id)a3;
- (void)setDisallowedList:(id)a3;
- (void)setMaximumHierarchicalLabels:(unint64_t)a3;
- (void)setMaximumLeafLabels:(unint64_t)a3;
- (void)setMinimumConfidence:(float)a3;
@end

@implementation VNImageAnalyzerMultiDetectorSceneClassificationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHierarchy, 0);

  objc_storeStrong((id *)&self->_disallowedList, 0);
}

- (void)setCustomHierarchy:(id)a3
{
}

- (VNClassificationCustomHierarchy)customHierarchy
{
  return self->_customHierarchy;
}

- (void)setMaximumHierarchicalLabels:(unint64_t)a3
{
  self->_maximumHierarchicalLabels = a3;
}

- (unint64_t)maximumHierarchicalLabels
{
  return self->_maximumHierarchicalLabels;
}

- (void)setMaximumLeafLabels:(unint64_t)a3
{
  self->_maximumLeafLabels = a3;
}

- (unint64_t)maximumLeafLabels
{
  return self->_maximumLeafLabels;
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
  v7.super_class = (Class)VNImageAnalyzerMultiDetectorSceneClassificationConfiguration;
  v4 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = self->_maximumLeafLabels;
    v5[5] = self->_maximumHierarchicalLabels;
    objc_storeStrong(v5 + 6, self->_customHierarchy);
  }
  return v5;
}

- (unsigned)labelsListType
{
  return 2;
}

- (unsigned)analysisTypes
{
  return 2;
}

- (VNImageAnalyzerMultiDetectorSceneClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNImageAnalyzerMultiDetectorSceneClassificationConfiguration;
  v5 = [(VNImageAnalyzerMultiDetectorAnalysisConfiguration *)&v11 initWithObservationsRecipient:v4];
  v6 = v5;
  if (v5)
  {
    v5->_maximumLeafLabels = 0x7FFFFFFFFFFFFFFFLL;
    v5->_maximumHierarchicalLabels = 0x7FFFFFFFFFFFFFFFLL;
    objc_super v7 = [v4 originatingRequestSpecifier];
    if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      v6->_maximumLeafLabels = 5;
      v6->_maximumHierarchicalLabels = 5;
    }
    else if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v8 = +[VNImageAnalyzerMultiDetector disallowedListForModel:](VNImageAnalyzerMultiDetector, "disallowedListForModel:", +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:](VNImageAnalyzerMultiDetector, "modelForRequestClass:revision:", [v7 requestClassAndReturnError:0], objc_msgSend(v7, "requestRevision")));
      disallowedList = v6->_disallowedList;
      v6->_disallowedList = (VNDisallowedList *)v8;
    }
  }

  return v6;
}

@end