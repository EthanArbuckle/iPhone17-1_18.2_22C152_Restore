@interface MLAppleAudioFeatureExtractorParameters
- (MLAppleAudioFeatureExtractorParameters)initWithSoundPrintParameters:(id)a3;
- (id)featureExtractorParameters;
@end

@implementation MLAppleAudioFeatureExtractorParameters

- (void).cxx_destruct
{
}

- (id)featureExtractorParameters
{
  return objc_getProperty(self, a2, 8, 1);
}

- (MLAppleAudioFeatureExtractorParameters)initWithSoundPrintParameters:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLAppleAudioFeatureExtractorParameters;
  v6 = [(MLAppleAudioFeatureExtractorParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_featureExtractorParameters, a3);
  }

  return v7;
}

@end