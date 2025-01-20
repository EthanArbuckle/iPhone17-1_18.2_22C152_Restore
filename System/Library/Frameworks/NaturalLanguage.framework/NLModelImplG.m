@interface NLModelImplG
- (NLModelImplG)initWithGazetteer:(id)a3;
- (NLModelImplG)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplG)initWithModelTrainer:(id)a3 error:(id *)a4;
- (id)gazetteer;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelsForTokens:(id)a3;
- (unint64_t)systemVersion;
@end

@implementation NLModelImplG

- (NLModelImplG)initWithGazetteer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLModelImplG;
  v6 = [(NLModelImplG *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gazetteer, a3);
  }

  return v7;
}

- (NLModelImplG)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v11 = a3;
  v12 = [[NLGazetteer alloc] initWithData:v11 error:a10];

  if (v12)
  {
    self = [(NLModelImplG *)self initWithGazetteer:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (NLModelImplG)initWithModelTrainer:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)systemVersion
{
  return 2;
}

- (id)gazetteer
{
  return self->_gazetteer;
}

- (id)modelData
{
  return [(NLGazetteer *)self->_gazetteer data];
}

- (id)predictedLabelForString:(id)a3
{
  return [(NLGazetteer *)self->_gazetteer labelForString:a3];
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsJoinedByString:@" "];
  v6 = [(NLModelImplG *)self predictedLabelForString:v5];

  v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    if (v6) {
      objc_super v9 = v6;
    }
    else {
      objc_super v9 = &stru_1EFB303D0;
    }
    do
    {
      [v7 addObject:v9];
      ++v8;
    }
    while (v8 < [v4 count]);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end