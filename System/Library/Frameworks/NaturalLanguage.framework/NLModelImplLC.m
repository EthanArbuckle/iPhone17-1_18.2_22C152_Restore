@interface NLModelImplLC
- (NLModelImplLC)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplLC)initWithModelTrainer:(id)a3 error:(id *)a4;
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

@implementation NLModelImplLC

- (NLModelImplLC)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  uint64_t CRFSuiteMaxEntModelFromData = createCRFSuiteMaxEntModelFromData(v16);
  unint64_t v23 = unsignedIntegerForKey(v21, 0x1EFB30650, 0);

  if (CRFSuiteMaxEntModelFromData
    && (v37.receiver = self,
        v37.super_class = (Class)NLModelImplLC,
        v24 = [(NLModelImplLC *)&v37 init],
        (self = v24) != 0))
  {
    v24->_maxEntModel = (const void *)CRFSuiteMaxEntModelFromData;
    v25 = (NLModelConfiguration *)[v17 copy];
    configuration = self->_configuration;
    self->_configuration = v25;

    v27 = (NSDictionary *)[v18 copy];
    labelMap = self->_labelMap;
    self->_labelMap = v27;

    v29 = (NSDictionary *)[v19 copy];
    vocabularyMap = self->_vocabularyMap;
    self->_vocabularyMap = v29;

    v31 = (NSDictionary *)[v20 copy];
    documentFrequencyMap = self->_documentFrequencyMap;
    self->_documentFrequencyMap = v31;

    self->_numberOfTrainingInstances = v23;
    objc_storeStrong((id *)&self->_modelData, a3);
    self = self;
    v33 = self;
  }
  else
  {
    if (a10)
    {
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F28568];
      v39[0] = @"Failed to load model file, invalid MaxEnt model data";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      *a10 = [v34 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v35];
    }
    v33 = 0;
  }

  return v33;
}

- (NLModelImplLC)initWithModelTrainer:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 configuration];
  v6 = [v4 dataSet];
  v21[0] = xmmword_1A646D4D0;
  v21[1] = vdupq_n_s64(0x400uLL);
  v21[2] = xmmword_1A646D4E0;
  v7 = +[NLDataSet dataSetWithDataSet:v6 constraintParameters:v21 modelTrainer:v4];
  v8 = [v7 inverseLabelMap];
  v9 = [v7 vocabularyMap];
  v10 = [v7 documentFrequencyMap];
  uint64_t v11 = [v6 numberOfTrainingInstances];
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"Starting MaxEnt training with %llu samples", v11);
  [v4 logMessage:v12];

  double Current = CFAbsoluteTimeGetCurrent();
  v14 = createCRFSuiteMaxEntModelDataFromTrainingDataSet(v7);
  v15 = [NSString stringWithFormat:@"Finished MaxEnt training in %.2f seconds", CFAbsoluteTimeGetCurrent() - Current];
  [v4 logMessage:v15];

  uint64_t v22 = 0x1EFB30650;
  id v16 = [NSNumber numberWithUnsignedInteger:v11];
  v23[0] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v18 = [(NLModelImplLC *)self initWithModelData:v14 configuration:v5 labelMap:v8 vocabularyMap:v9 documentFrequencyMap:v10 customEmbeddingData:0 trainingInfo:v17 error:0];

  return v18;
}

- (void)dealloc
{
  if (self->_maxEntModel) {
    releaseCRFSuiteMaxEntModel();
  }
  v3.receiver = self;
  v3.super_class = (Class)NLModelImplLC;
  [(NLModelImplLC *)&v3 dealloc];
}

- (id)modelData
{
  return self->_modelData;
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
  maxEntModel = self->_maxEntModel;
  id v5 = a3;
  v6 = [(NLModelImplLC *)self labelMap];
  v7 = [(NLModelImplLC *)self vocabularyMap];
  v8 = [(NLModelImplLC *)self documentFrequencyMap];
  v9 = predictedCRFSuiteMaxEntModelLabelForString((uint64_t)maxEntModel, v6, v7, v8, (NSDictionary *)[(NLModelImplLC *)self numberOfTrainingInstances], v5);

  return v9;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsJoinedByString:@" "];
  v6 = [(NLModelImplLC *)self predictedLabelForString:v5];

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
  maxEntModel = self->_maxEntModel;
  id v7 = a3;
  unint64_t v8 = [(NLModelImplLC *)self labelMap];
  v9 = [(NLModelImplLC *)self vocabularyMap];
  v10 = [(NLModelImplLC *)self documentFrequencyMap];
  uint64_t v11 = predictedCRFSuiteMaxEntModelLabelHypothesesForString((uint64_t)maxEntModel, v8, v9, v10, (NSDictionary *)[(NLModelImplLC *)self numberOfTrainingInstances], v7);

  v12 = topHypotheses(v11, a4);

  return v12;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 componentsJoinedByString:@" "];
  unint64_t v8 = [(NLModelImplLC *)self predictedLabelHypothesesForString:v7 maximumCount:a4];

  v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v10 = 0;
    if (v8) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
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
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end