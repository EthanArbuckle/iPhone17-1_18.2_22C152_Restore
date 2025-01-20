@interface VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration
- (BOOL)isEqual:(id)a3;
- (NSArray)targetedIdentifiers;
- (VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3;
- (VNDisallowedList)disallowedList;
- (float)minimumDetectionConfidence;
- (float)nonMaximumSuppressionThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisallowedList:(id)a3;
- (void)setMinimumDetectionConfidence:(float)a3;
- (void)setNonMaximumSuppressionThreshold:(float)a3;
- (void)setTargetedIdentifiers:(id)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedIdentifiers, 0);

  objc_storeStrong((id *)&self->_disallowedList, 0);
}

- (void)setTargetedIdentifiers:(id)a3
{
}

- (NSArray)targetedIdentifiers
{
  return self->_targetedIdentifiers;
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
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
  v4 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumDetectionConfidence);
    *((_DWORD *)v5 + 5) = LODWORD(self->_nonMaximumSuppressionThreshold);
    objc_storeStrong(v5 + 4, self->_targetedIdentifiers);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)a3;
  if (v4 == self)
  {
    char v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v19.receiver = self;
      v19.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
      if (![(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v19 isEqual:v5]) {
        goto LABEL_10;
      }
      [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)self minimumDetectionConfidence];
      float v7 = v6;
      [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)v5 minimumDetectionConfidence];
      if (v7 != v8) {
        goto LABEL_10;
      }
      [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)self nonMaximumSuppressionThreshold];
      float v10 = v9;
      [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)v5 nonMaximumSuppressionThreshold];
      if (v10 != v11) {
        goto LABEL_10;
      }
      v12 = [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)self disallowedList];
      v13 = [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)v5 disallowedList];
      char v14 = VisionCoreEqualOrNilObjects();

      if (v14)
      {
        v15 = [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)self targetedIdentifiers];
        v16 = [(VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration *)v5 targetedIdentifiers];
        char v17 = VisionCoreEquivalentOrNilUnorderedArrays();
      }
      else
      {
LABEL_10:
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }

  return v17;
}

- (VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration)initWithObservationsRecipient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCoreSceneUnderstandingDetectorRecognizeObjectsConfiguration;
  result = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v4 initWithObservationsRecipient:a3];
  if (result)
  {
    result->_minimumDetectionConfidence = 0.1;
    result->_nonMaximumSuppressionThreshold = 0.3;
  }
  return result;
}

@end