@interface VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration
- (BOOL)isEqual:(id)a3;
- (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3;
- (VNDisallowedList)disallowedList;
- (float)minimumConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumClassifications;
- (void)setDisallowedList:(id)a3;
- (void)setMaximumClassifications:(unint64_t)a3;
- (void)setMinimumConfidence:(float)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration

- (void).cxx_destruct
{
}

- (void)setMaximumClassifications:(unint64_t)a3
{
  self->_maximumClassifications = a3;
}

- (unint64_t)maximumClassifications
{
  return self->_maximumClassifications;
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
  v7.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
  v4 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 3, self->_disallowedList);
    *((_DWORD *)v5 + 4) = LODWORD(self->_minimumConfidence);
    v5[4] = self->_maximumClassifications;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v14.receiver = self;
      v14.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
      if ([(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v14 isEqual:v5]
        && ([(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)self minimumConfidence], float v7 = v6, [(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)v5 minimumConfidence], v7 == v8)&& (v9 = [(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)self maximumClassifications], v9 == [(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)v5 maximumClassifications]))
      {
        v10 = [(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)self disallowedList];
        v11 = [(VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration *)v5 disallowedList];
        char v12 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration)initWithObservationsRecipient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCoreSceneUnderstandingDetectorEntityNetClassificationConfiguration;
  result = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v4 initWithObservationsRecipient:a3];
  if (result) {
    result->_maximumClassifications = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

@end