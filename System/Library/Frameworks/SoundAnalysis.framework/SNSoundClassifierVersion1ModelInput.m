@interface SNSoundClassifierVersion1ModelInput
- (MLMultiArray)audioSamples;
- (NSSet)featureNames;
- (SNSoundClassifierVersion1ModelInput)initWithAudioSamples:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setAudioSamples:(id)a3;
@end

@implementation SNSoundClassifierVersion1ModelInput

- (SNSoundClassifierVersion1ModelInput)initWithAudioSamples:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNSoundClassifierVersion1ModelInput;
  v6 = [(SNSoundClassifierVersion1ModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioSamples, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819080];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"audioSamples"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNSoundClassifierVersion1ModelInput *)self audioSamples];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)audioSamples
{
  return self->_audioSamples;
}

- (void)setAudioSamples:(id)a3
{
}

- (void).cxx_destruct
{
}

@end