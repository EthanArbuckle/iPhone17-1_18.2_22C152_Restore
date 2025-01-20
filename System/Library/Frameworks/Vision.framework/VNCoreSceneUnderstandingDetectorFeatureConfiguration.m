@interface VNCoreSceneUnderstandingDetectorFeatureConfiguration
- (BOOL)isEqual:(id)a3;
- (VNCoreSceneUnderstandingDetectorFeatureConfiguration)initWithObservationsRecipient:(id)a3;
- (VNObservationsRecipient)observationsRecipient;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorFeatureConfiguration

- (void).cxx_destruct
{
}

- (VNObservationsRecipient)observationsRecipient
{
  return self->_observationsRecipient;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorFeatureConfiguration *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)self observationsRecipient];
      v7 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)v5 observationsRecipient];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  observationsRecipient = self->_observationsRecipient;

  return (id)[v4 initWithObservationsRecipient:observationsRecipient];
}

- (VNCoreSceneUnderstandingDetectorFeatureConfiguration)initWithObservationsRecipient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingDetectorFeatureConfiguration;
  v6 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_observationsRecipient, a3);
  }

  return v7;
}

@end