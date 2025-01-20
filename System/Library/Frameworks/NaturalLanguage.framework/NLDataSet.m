@interface NLDataSet
+ (id)dataSetWithDataSet:(id)a3 constraintParameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5;
- (NLDataSet)initWithConfiguration:(id)a3 dataProvider:(id)a4 validationSplit:(double)a5 testingSplit:(double)a6;
- (NLDataSet)initWithConfiguration:(id)a3 trainingDataProvider:(id)a4 validationDataProvider:(id)a5 testDataProvider:(id)a6;
- (NLDataSet)initWithConfiguration:(id)a3 trainingDataURL:(id)a4 validationDataURL:(id)a5 testDataURL:(id)a6;
- (NLModelConfiguration)configuration;
- (id)dataProviderOfType:(int64_t)a3;
- (id)documentFrequencyMap;
- (id)inverseLabelMap;
- (id)labelMap;
- (id)testInstanceAtIndex:(unint64_t)a3;
- (id)trainingInstanceAtIndex:(unint64_t)a3;
- (id)validationInstanceAtIndex:(unint64_t)a3;
- (id)vocabularyMap;
- (unint64_t)numberOfLabels;
- (unint64_t)numberOfTestInstances;
- (unint64_t)numberOfTrainingInstances;
- (unint64_t)numberOfValidationInstances;
- (unint64_t)numberOfVocabularyEntries;
@end

@implementation NLDataSet

- (NLDataSet)initWithConfiguration:(id)a3 trainingDataProvider:(id)a4 validationDataProvider:(id)a5 testDataProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NLDataSet;
  v14 = [(NLDataSet *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    configuration = v14->_configuration;
    v14->_configuration = (NLModelConfiguration *)v15;

    objc_storeStrong((id *)&v14->_trainingDataProvider, a4);
    objc_storeStrong((id *)&v14->_validationDataProvider, a5);
    objc_storeStrong((id *)&v14->_testDataProvider, a6);
  }

  return v14;
}

- (NLDataSet)initWithConfiguration:(id)a3 trainingDataURL:(id)a4 validationDataURL:(id)a5 testDataURL:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[NLDataProvider alloc] initWithConfiguration:v13 dataURL:v12];

  uint64_t v15 = [[NLDataProvider alloc] initWithConfiguration:v13 dataURL:v11];
  v16 = [[NLDataProvider alloc] initWithConfiguration:v13 dataURL:v10];

  v17 = [(NLDataSet *)self initWithConfiguration:v13 trainingDataProvider:v14 validationDataProvider:v15 testDataProvider:v16];
  return v17;
}

- (NLDataSet)initWithConfiguration:(id)a3 dataProvider:(id)a4 validationSplit:(double)a5 testingSplit:(double)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = splitIndexes([v10 numberOfInstances], a5, a6);
  id v13 = [NLSplitDataProvider alloc];
  v14 = [v12 objectAtIndex:0];
  uint64_t v15 = [(NLSplitDataProvider *)v13 initWithDataProvider:v10 indexes:v14];

  v16 = [NLSplitDataProvider alloc];
  v17 = [v12 objectAtIndex:1];
  objc_super v18 = [(NLSplitDataProvider *)v16 initWithDataProvider:v10 indexes:v17];

  v19 = [NLSplitDataProvider alloc];
  v20 = [v12 objectAtIndex:2];
  v21 = [(NLSplitDataProvider *)v19 initWithDataProvider:v10 indexes:v20];

  v22 = [(NLDataSet *)self initWithConfiguration:v11 trainingDataProvider:v15 validationDataProvider:v18 testDataProvider:v21];
  return v22;
}

+ (id)dataSetWithDataSet:(id)a3 constraintParameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [NLConstrainedDataProvider alloc];
  id v10 = [v8 dataProviderOfType:0];
  long long v11 = *(_OWORD *)&a4->maxSplitTokens;
  v19[0] = *(_OWORD *)&a4->splitSentences;
  v19[1] = v11;
  v19[2] = *(_OWORD *)&a4->maxLabels;
  id v12 = [(NLConstrainedDataProvider *)v9 initWithDataProvider:v10 parameters:v19 modelTrainer:v7];

  id v13 = [v8 dataProviderOfType:1];
  v14 = [v8 dataProviderOfType:2];
  uint64_t v15 = [NLDataSet alloc];
  v16 = [v8 configuration];

  v17 = [(NLDataSet *)v15 initWithConfiguration:v16 trainingDataProvider:v12 validationDataProvider:v13 testDataProvider:v14];

  return v17;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (id)dataProviderOfType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self = (NLDataSet *)*((id *)&self->_trainingDataProvider + a3);
  }
  return self;
}

- (unint64_t)numberOfTrainingInstances
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 numberOfInstances];

  return v3;
}

- (unint64_t)numberOfValidationInstances
{
  v2 = [(NLDataSet *)self dataProviderOfType:1];
  unint64_t v3 = [v2 numberOfInstances];

  return v3;
}

- (unint64_t)numberOfTestInstances
{
  v2 = [(NLDataSet *)self dataProviderOfType:2];
  unint64_t v3 = [v2 numberOfInstances];

  return v3;
}

- (id)trainingInstanceAtIndex:(unint64_t)a3
{
  v4 = [(NLDataSet *)self dataProviderOfType:0];
  v5 = [v4 instanceAtIndex:a3];

  return v5;
}

- (id)validationInstanceAtIndex:(unint64_t)a3
{
  v4 = [(NLDataSet *)self dataProviderOfType:1];
  v5 = [v4 instanceAtIndex:a3];

  return v5;
}

- (id)testInstanceAtIndex:(unint64_t)a3
{
  v4 = [(NLDataSet *)self dataProviderOfType:2];
  v5 = [v4 instanceAtIndex:a3];

  return v5;
}

- (id)labelMap
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 labelMap];

  return v3;
}

- (id)inverseLabelMap
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 inverseLabelMap];

  return v3;
}

- (id)vocabularyMap
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 vocabularyMap];

  return v3;
}

- (id)documentFrequencyMap
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 documentFrequencyMap];

  return v3;
}

- (unint64_t)numberOfLabels
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 numberOfLabels];

  return v3;
}

- (unint64_t)numberOfVocabularyEntries
{
  v2 = [(NLDataSet *)self dataProviderOfType:0];
  unint64_t v3 = [v2 numberOfVocabularyEntries];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDataProvider, 0);
  objc_storeStrong((id *)&self->_validationDataProvider, 0);
  objc_storeStrong((id *)&self->_trainingDataProvider, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end