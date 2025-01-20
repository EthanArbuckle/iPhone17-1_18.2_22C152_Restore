@interface NLModelImplE
- (NLModelImplE)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplE)initWithModelTrainer:(id)a3 error:(id *)a4;
- (id)embedding;
- (id)embeddingData;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelsForTokens:(id)a3;
- (unint64_t)systemVersion;
@end

@implementation NLModelImplE

- (NLModelImplE)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v12 = a3;
  v13 = [[NLEmbedding alloc] initWithData:v12 error:a10];
  if (v13
    && (v17.receiver = self,
        v17.super_class = (Class)NLModelImplE,
        v14 = [(NLModelImplE *)&v17 init],
        (self = v14) != 0))
  {
    objc_storeStrong((id *)&v14->_embedding, v13);
    objc_storeStrong((id *)&self->_embeddingData, a3);
    self = self;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NLModelImplE)initWithModelTrainer:(id)a3 error:(id *)a4
{
  return 0;
}

- (unint64_t)systemVersion
{
  return 2;
}

- (id)embedding
{
  return self->_embedding;
}

- (id)embeddingData
{
  return self->_embeddingData;
}

- (id)modelData
{
  return self->_embeddingData;
}

- (id)predictedLabelForString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(NLEmbedding *)self->_embedding vectorForString:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((v9 & 1) == 0) {
            [v4 appendString:@","];
          }
          [v11 floatValue];
          objc_msgSend(v4, "appendFormat:", @"%f", v12);
          char v9 = 0;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        char v9 = 0;
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsJoinedByString:@" "];
  uint64_t v6 = [(NLModelImplE *)self predictedLabelForString:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    if (v6) {
      char v9 = v6;
    }
    else {
      char v9 = &stru_1EFB303D0;
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
  objc_storeStrong((id *)&self->_embeddingData, 0);

  objc_storeStrong((id *)&self->_embedding, 0);
}

@end