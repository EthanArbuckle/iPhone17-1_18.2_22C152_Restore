@interface SNLanguageAlignedAudioEncoderOutput
- (MLMultiArray)embedding;
- (NSSet)featureNames;
- (SNLanguageAlignedAudioEncoderOutput)initWithEmbedding:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setEmbedding:(id)a3;
@end

@implementation SNLanguageAlignedAudioEncoderOutput

- (SNLanguageAlignedAudioEncoderOutput)initWithEmbedding:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNLanguageAlignedAudioEncoderOutput;
  v6 = [(SNLanguageAlignedAudioEncoderOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_embedding, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819068];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"embedding"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNLanguageAlignedAudioEncoderOutput *)self embedding];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)embedding
{
  return self->_embedding;
}

- (void)setEmbedding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end