@interface NLModelImplL
- (NLModelImplL)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplL)initWithModelTrainer:(id)a3 error:(id *)a4;
- (NLModelImplL)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 numberOfTrainingInstances:(unint64_t)a8;
- (id)configuration;
- (id)documentFrequencyMap;
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

@implementation NLModelImplL

- (NLModelImplL)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 numberOfTrainingInstances:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)NLModelImplL;
    v18 = [(NLModelImplL *)&v28 init];
    self = v18;
    if (v18)
    {
      v18->_maxEntModel = a3;
      v19 = (NLModelConfiguration *)[v14 copy];
      configuration = self->_configuration;
      self->_configuration = v19;

      v21 = (NSDictionary *)[v15 copy];
      labelMap = self->_labelMap;
      self->_labelMap = v21;

      v23 = (NSDictionary *)[v16 copy];
      vocabularyMap = self->_vocabularyMap;
      self->_vocabularyMap = v23;

      v25 = (NSDictionary *)[v17 copy];
      documentFrequencyMap = self->_documentFrequencyMap;
      self->_documentFrequencyMap = v25;

      self->_numberOfTrainingInstances = a8;
    }
  }

  return self;
}

- (NLModelImplL)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  createMaxEntModelFromData(a3);
}

- (NLModelImplL)initWithModelTrainer:(id)a3 error:(id *)a4
{
  id v4 = a3;
  [v4 configuration];
  objc_claimAutoreleasedReturnValue();
  v5 = [v4 dataSet];
  v9[0] = xmmword_1A646D4D0;
  v9[1] = vdupq_n_s64(0x400uLL);
  v9[2] = xmmword_1A646D4E0;
  v6 = +[NLDataSet dataSetWithDataSet:v5 constraintParameters:v9 modelTrainer:v4];
  [v6 inverseLabelMap];
  objc_claimAutoreleasedReturnValue();
  [v6 vocabularyMap];
  objc_claimAutoreleasedReturnValue();
  [v6 documentFrequencyMap];
  objc_claimAutoreleasedReturnValue();
  [v5 numberOfTrainingInstances];
  v7 = [v4 options];
  unsignedIntegerForKey(v7, @"MaximumIterations", 150);

  createMaxEntModelFromTrainingDataSet(v6, v4);
}

- (void)dealloc
{
  maxEntModel = (ME_Model *)self->_maxEntModel;
  if (maxEntModel) {
    releaseMaxEntModel(maxEntModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplL;
  [(NLModelImplL *)&v4 dealloc];
}

- (id)modelData
{
  maxEntModel = self->_maxEntModel;
  if (maxEntModel)
  {
    maxEntModel = dataFromMaxEntModel(maxEntModel);
  }

  return maxEntModel;
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

- (id)documentFrequencyMap
{
  return self->_documentFrequencyMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)predictedLabelForString:(id)a3
{
  maxEntModel = (ME_Model *)self->_maxEntModel;
  id v5 = a3;
  v6 = [(NLModelImplL *)self labelMap];
  v7 = [(NLModelImplL *)self vocabularyMap];
  v8 = [(NLModelImplL *)self documentFrequencyMap];
  v9 = predictedMaxEntModelLabelForString(maxEntModel, v6, v7, v8, (NSDictionary *)[(NLModelImplL *)self numberOfTrainingInstances], v5);

  return v9;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsJoinedByString:@" "];
  v6 = [(NLModelImplL *)self predictedLabelForString:v5];

  v7 = [MEMORY[0x1E4F1CA48] array];
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
  maxEntModel = (ME_Model *)self->_maxEntModel;
  id v7 = a3;
  unint64_t v8 = [(NLModelImplL *)self labelMap];
  v9 = [(NLModelImplL *)self vocabularyMap];
  v10 = [(NLModelImplL *)self documentFrequencyMap];
  v11 = predictedMaxEntModelLabelHypothesesForString(maxEntModel, v8, v9, v10, (NSDictionary *)[(NLModelImplL *)self numberOfTrainingInstances], v7);

  v12 = topHypotheses(v11, a4);

  return v12;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 componentsJoinedByString:@" "];
  unint64_t v8 = [(NLModelImplL *)self predictedLabelHypothesesForString:v7 maximumCount:a4];

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
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end