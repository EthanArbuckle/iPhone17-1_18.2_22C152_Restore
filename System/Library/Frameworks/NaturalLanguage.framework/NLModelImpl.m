@interface NLModelImpl
- (NLEmbedding)embedding;
- (NLGazetteer)gazetteer;
- (NLModelConfiguration)configuration;
- (NLModelImpl)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImpl)initWithModelTrainer:(id)a3 error:(id *)a4;
- (NSData)customEmbeddingData;
- (NSData)embeddingData;
- (NSDictionary)documentFrequencyMap;
- (NSDictionary)labelMap;
- (NSDictionary)trainingInfo;
- (NSDictionary)vocabularyMap;
- (id)modelData;
- (id)predictedLabelArraysForTokenArrays:(id)a3;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelsForTokens:(id)a3;
- (unint64_t)numberOfTrainingInstances;
- (unint64_t)systemVersion;
@end

@implementation NLModelImpl

- (NLModelImpl)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  return 0;
}

- (NLModelImpl)initWithModelTrainer:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)modelData
{
  return 0;
}

- (NLModelConfiguration)configuration
{
  return 0;
}

- (unint64_t)systemVersion
{
  return 1;
}

- (NSDictionary)labelMap
{
  return 0;
}

- (NSDictionary)vocabularyMap
{
  return 0;
}

- (NSDictionary)documentFrequencyMap
{
  return 0;
}

- (NSData)customEmbeddingData
{
  return 0;
}

- (unint64_t)numberOfTrainingInstances
{
  return 0;
}

- (NSDictionary)trainingInfo
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"NumberOfTrainingInstances";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NLModelImpl numberOfTrainingInstances](self, "numberOfTrainingInstances"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NLGazetteer)gazetteer
{
  return 0;
}

- (NLEmbedding)embedding
{
  return 0;
}

- (NSData)embeddingData
{
  return 0;
}

- (id)predictedLabelForString:(id)a3
{
  return 0;
}

- (id)predictedLabelsForTokens:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)predictedLabelArraysForTokenArrays:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NLModelImpl predictedLabelsForTokens:](self, "predictedLabelsForTokens:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end