@interface SNLanguageAlignedAVFuserModelInput
- (MLMultiArray)audio_embedding;
- (MLMultiArray)vision_embedding;
- (NSSet)featureNames;
- (SNLanguageAlignedAVFuserModelInput)initWithVision_embedding:(id)a3 audio_embedding:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setAudio_embedding:(id)a3;
- (void)setVision_embedding:(id)a3;
@end

@implementation SNLanguageAlignedAVFuserModelInput

- (SNLanguageAlignedAVFuserModelInput)initWithVision_embedding:(id)a3 audio_embedding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNLanguageAlignedAVFuserModelInput;
  v9 = [(SNLanguageAlignedAVFuserModelInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vision_embedding, a3);
    objc_storeStrong((id *)&v10->_audio_embedding, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819110];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"vision_embedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNLanguageAlignedAVFuserModelInput *)self vision_embedding];
LABEL_5:
    id v7 = (void *)v6;
    id v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"audio_embedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNLanguageAlignedAVFuserModelInput *)self audio_embedding];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (MLMultiArray)vision_embedding
{
  return self->_vision_embedding;
}

- (void)setVision_embedding:(id)a3
{
}

- (MLMultiArray)audio_embedding
{
  return self->_audio_embedding;
}

- (void)setAudio_embedding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio_embedding, 0);

  objc_storeStrong((id *)&self->_vision_embedding, 0);
}

@end