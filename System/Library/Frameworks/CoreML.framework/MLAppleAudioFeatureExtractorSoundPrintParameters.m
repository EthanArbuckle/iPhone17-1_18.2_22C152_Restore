@interface MLAppleAudioFeatureExtractorSoundPrintParameters
- (id)initSoundPrintParameters:(int64_t)a3;
- (int64_t)soundPrintVersion;
@end

@implementation MLAppleAudioFeatureExtractorSoundPrintParameters

- (int64_t)soundPrintVersion
{
  return self->_soundPrintVersion;
}

- (id)initSoundPrintParameters:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLAppleAudioFeatureExtractorSoundPrintParameters;
  id result = [(MLAppleAudioFeatureExtractorSoundPrintParameters *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

@end