@interface SNSoundPrintAEmbeddingModelInput
- (MLMultiArray)audioSamples;
- (NSSet)featureNames;
- (SNSoundPrintAEmbeddingModelInput)initWithAudioSamples:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setAudioSamples:(id)a3;
@end

@implementation SNSoundPrintAEmbeddingModelInput

- (SNSoundPrintAEmbeddingModelInput)initWithAudioSamples:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNSoundPrintAEmbeddingModelInput;
  v6 = [(SNSoundPrintAEmbeddingModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_audioSamples, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3818FF0];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"audioSamples"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNSoundPrintAEmbeddingModelInput *)self audioSamples];
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