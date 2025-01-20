@interface NLModelImplM
- (NLModelImplM)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplM)initWithModelTrainer:(id)a3 error:(id *)a4;
- (NLModelImplM)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 numberOfTrainingInstances:(unint64_t)a7;
- (id)configuration;
- (id)labelMap;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelsForTokens:(id)a3;
- (id)vocabularyMap;
- (unint64_t)numberOfTrainingInstances;
- (void)dealloc;
@end

@implementation NLModelImplM

- (NLModelImplM)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 numberOfTrainingInstances:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)NLModelImplM;
    v15 = [(NLModelImplM *)&v23 init];
    self = v15;
    if (v15)
    {
      v15->_mrlModel = a3;
      v16 = (NLModelConfiguration *)[v12 copy];
      configuration = self->_configuration;
      self->_configuration = v16;

      v18 = (NSDictionary *)[v13 copy];
      labelMap = self->_labelMap;
      self->_labelMap = v18;

      v20 = (NSDictionary *)[v14 copy];
      vocabularyMap = self->_vocabularyMap;
      self->_vocabularyMap = v20;

      self->_numberOfTrainingInstances = a7;
    }
  }

  return self;
}

- (NLModelImplM)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  uint64_t MRLModelFromData = createMRLModelFromData(a3);
  uint64_t v19 = unsignedIntegerForKey(v17, 0x1EFB30650, 0);

  if (MRLModelFromData)
  {
    self = [(NLModelImplM *)self initWithOwnedModelObject:MRLModelFromData configuration:v14 labelMap:v15 vocabularyMap:v16 numberOfTrainingInstances:v19];
    v20 = self;
  }
  else
  {
    if (a10)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = @"Failed to load model file, invalid RNN model data";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      *a10 = [v21 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v22];
    }
    v20 = 0;
  }

  return v20;
}

- (NLModelImplM)initWithModelTrainer:(id)a3 error:(id *)a4
{
  memset(&v12[1], 0, 7);
  id v4 = a3;
  [v4 configuration];
  objc_claimAutoreleasedReturnValue();
  v5 = [v4 dataSet];
  v12[0] = 1;
  long long v13 = xmmword_1A646D8D0;
  long long v14 = xmmword_1A646D8E0;
  uint64_t v15 = 0x7FFFLL;
  v6 = +[NLDataSet dataSetWithDataSet:v5 constraintParameters:v12 modelTrainer:v4];
  [v6 inverseLabelMap];
  objc_claimAutoreleasedReturnValue();
  [v6 vocabularyMap];
  objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v5 numberOfTrainingInstances];
  v8 = [v4 configuration];
  v9 = [v8 options];
  uint64_t v10 = BOOLForKeyWithDefault(v9, @"UseBidirectionalNeuralNetwork");

  createMRLModelFromTrainingDataSet(v6, v10, v7, v4);
}

- (void)dealloc
{
  if (self->_mrlModel) {
    releaseMRLModel();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLModelImplM;
  [(NLModelImplM *)&v3 dealloc];
}

- (id)modelData
{
  mrlModel = (void *)self->_mrlModel;
  if (mrlModel)
  {
    mrlModel = dataFromMRLModel();
  }

  return mrlModel;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)vocabularyMap
{
  return self->_vocabularyMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)predictedLabelForString:(id)a3
{
  id v4 = a3;
  v5 = [(NLModelImplM *)self configuration];
  v6 = [v5 options];
  uint64_t v7 = BOOLForKeyWithDefault(v6, @"UseBidirectionalNeuralNetwork");

  mrlModel = self->_mrlModel;
  v9 = [(NLModelImplM *)self labelMap];
  uint64_t v10 = [(NLModelImplM *)self vocabularyMap];
  predictedMRLModelLabelForString((uint64_t)mrlModel, v7, v9, v10, v4);
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentsJoinedByString:@" "];
  v6 = [(NLModelImplM *)self predictedLabelForString:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    if (v6) {
      v9 = v6;
    }
    else {
      v9 = &stru_1EFB303D0;
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

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(NLModelImplM *)self configuration];
  uint64_t v7 = [v6 options];
  uint64_t v8 = BOOLForKeyWithDefault(v7, @"UseBidirectionalNeuralNetwork");

  mrlModel = self->_mrlModel;
  uint64_t v10 = [(NLModelImplM *)self labelMap];
  v11 = [(NLModelImplM *)self vocabularyMap];
  predictedMRLModelLabelHypothesesForString((uint64_t)mrlModel, v8, v10, v11, v5);
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 componentsJoinedByString:@" "];
  uint64_t v8 = [(NLModelImplM *)self predictedLabelHypothesesForString:v7 maximumCount:a4];

  v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v10 = 0;
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    do
    {
      [v9 addObject:v11];
      ++v10;
    }
    while (v10 < [v6 count]);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end