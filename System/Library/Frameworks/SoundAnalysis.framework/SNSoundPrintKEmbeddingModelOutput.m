@interface SNSoundPrintKEmbeddingModelOutput
- (MLMultiArray)fixedLengthEmbedding;
- (MLMultiArray)framewiseEmbedding;
- (NSSet)featureNames;
- (SNSoundPrintKEmbeddingModelOutput)initWithFixedLengthEmbedding:(id)a3 framewiseEmbedding:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setFixedLengthEmbedding:(id)a3;
- (void)setFramewiseEmbedding:(id)a3;
@end

@implementation SNSoundPrintKEmbeddingModelOutput

- (SNSoundPrintKEmbeddingModelOutput)initWithFixedLengthEmbedding:(id)a3 framewiseEmbedding:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNSoundPrintKEmbeddingModelOutput;
  v9 = [(SNSoundPrintKEmbeddingModelOutput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fixedLengthEmbedding, a3);
    objc_storeStrong((id *)&v10->_framewiseEmbedding, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F38191E8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"fixedLengthEmbedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintKEmbeddingModelOutput *)self fixedLengthEmbedding];
LABEL_5:
    id v7 = (void *)v6;
    id v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"framewiseEmbedding"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintKEmbeddingModelOutput *)self framewiseEmbedding];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (MLMultiArray)fixedLengthEmbedding
{
  return self->_fixedLengthEmbedding;
}

- (void)setFixedLengthEmbedding:(id)a3
{
}

- (MLMultiArray)framewiseEmbedding
{
  return self->_framewiseEmbedding;
}

- (void)setFramewiseEmbedding:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framewiseEmbedding, 0);

  objc_storeStrong((id *)&self->_fixedLengthEmbedding, 0);
}

@end