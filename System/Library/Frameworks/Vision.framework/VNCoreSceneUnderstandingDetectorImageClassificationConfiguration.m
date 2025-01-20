@interface VNCoreSceneUnderstandingDetectorImageClassificationConfiguration
- (BOOL)isEqual:(id)a3;
- (VNCoreSceneUnderstandingDetectorImageClassificationConfiguration)initWithObservationsRecipient:(id)a3;
- (VNDisallowedList)disallowedList;
- (float)minimumConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumHierarchicalClassifications;
- (unint64_t)maximumLeafClassifications;
- (void)setDisallowedList:(id)a3;
- (void)setMaximumHierarchicalClassifications:(unint64_t)a3;
- (void)setMaximumLeafClassifications:(unint64_t)a3;
- (void)setMinimumConfidence:(float)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorImageClassificationConfiguration

- (void).cxx_destruct
{
}

- (void)setMaximumHierarchicalClassifications:(unint64_t)a3
{
  self->_maximumHierarchicalClassifications = a3;
}

- (unint64_t)maximumHierarchicalClassifications
{
  return self->_maximumHierarchicalClassifications;
}

- (void)setMaximumLeafClassifications:(unint64_t)a3
{
  self->_maximumLeafClassifications = a3;
}

- (unint64_t)maximumLeafClassifications
{
  return self->_maximumLeafClassifications;
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
  return (VNDisallowedList *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
  v4 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = self->_maximumLeafClassifications;
    v5[5] = self->_maximumHierarchicalClassifications;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v15.receiver = self;
      v15.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
      if ([(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v15 isEqual:v5]
        && ([(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)self minimumConfidence], float v7 = v6, [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)v5 minimumConfidence], v7 == v8)&& (v9 = [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)self maximumLeafClassifications], v9 == [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)v5 maximumLeafClassifications])&& (v10 = [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)self maximumHierarchicalClassifications], v10 == [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)v5 maximumHierarchicalClassifications]))
      {
        v11 = [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)self disallowedList];
        v12 = [(VNCoreSceneUnderstandingDetectorImageClassificationConfiguration *)v5 disallowedList];
        char v13 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (VNCoreSceneUnderstandingDetectorImageClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VNCoreSceneUnderstandingDetectorImageClassificationConfiguration;
  v5 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v11 initWithObservationsRecipient:v4];
  float v6 = v5;
  if (v5)
  {
    v5->_maximumLeafClassifications = 0x7FFFFFFFFFFFFFFFLL;
    v5->_maximumHierarchicalClassifications = 0x7FFFFFFFFFFFFFFFLL;
    float v7 = [v4 originatingRequestSpecifier];
    if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      v6->_maximumLeafClassifications = 5;
      v6->_maximumHierarchicalClassifications = 5;
    }
    else if ([v7 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v8 = +[VNDisallowedList sceneNetV5];
      disallowedList = v6->_disallowedList;
      v6->_disallowedList = (VNDisallowedList *)v8;
    }
  }

  return v6;
}

@end