@interface SNLanguageAlignedAudioEncoderInput
- (MLMultiArray)specgram;
- (NSSet)featureNames;
- (SNLanguageAlignedAudioEncoderInput)initWithSpecgram:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setSpecgram:(id)a3;
@end

@implementation SNLanguageAlignedAudioEncoderInput

- (SNLanguageAlignedAudioEncoderInput)initWithSpecgram:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNLanguageAlignedAudioEncoderInput;
  v6 = [(SNLanguageAlignedAudioEncoderInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specgram, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819050];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"specgram"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNLanguageAlignedAudioEncoderInput *)self specgram];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)specgram
{
  return self->_specgram;
}

- (void)setSpecgram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end