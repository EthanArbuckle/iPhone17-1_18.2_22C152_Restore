@interface SNSoundPrintAEmbeddingModelOutput
- (MLMultiArray)_637;
- (NSSet)featureNames;
- (SNSoundPrintAEmbeddingModelOutput)initWith_637:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)set_637:(id)a3;
@end

@implementation SNSoundPrintAEmbeddingModelOutput

- (SNSoundPrintAEmbeddingModelOutput)initWith_637:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNSoundPrintAEmbeddingModelOutput;
  v6 = [(SNSoundPrintAEmbeddingModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__637, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819008];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"637"])
  {
    id v5 = (void *)MEMORY[0x1E4F1E950];
    v6 = objc_msgSend__637(self, v4);
    v7 = [v5 featureValueWithMultiArray:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (MLMultiArray)_637
{
  return self->__637;
}

- (void)set_637:(id)a3
{
}

- (void).cxx_destruct
{
}

@end