@interface DataSourceTrain
- (DataSourceTrain)init;
- (DataSourceTrain)initWithNumDataPoints:(unint64_t)a3 sequenceLength:(unint64_t)a4 noiseSize:(unint64_t)a5 batchSize:(unint64_t)a6 vocabSize:(unint64_t)a7 contextKey:(id)a8 targetKey:(id)a9 maskKey:(id)a10 noiseKey:(id)a11;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)setNumBatches:(int)a3;
- (void)setVectorsWithProcessor:(id)a3;
@end

@implementation DataSourceTrain

- (DataSourceTrain)init
{
  return 0;
}

- (DataSourceTrain)initWithNumDataPoints:(unint64_t)a3 sequenceLength:(unint64_t)a4 noiseSize:(unint64_t)a5 batchSize:(unint64_t)a6 vocabSize:(unint64_t)a7 contextKey:(id)a8 targetKey:(id)a9 maskKey:(id)a10 noiseKey:(id)a11
{
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  v36.receiver = self;
  v36.super_class = (Class)DataSourceTrain;
  v17 = [(DataSourceTrain *)&v36 init];
  id v18 = v17;
  if (!v17)
  {
LABEL_8:
    v20 = (DataSourceTrain *)v18;
    goto LABEL_9;
  }
  v19 = (uint64_t *)(v17 + 8);
  std::vector<std::vector<float>>::resize((uint64_t *)v17 + 1, 1uLL);
  std::vector<std::vector<float>>::resize((uint64_t *)v18 + 4, 1uLL);
  std::vector<float>::resize(*v19, a4);
  std::vector<float>::resize(*((void *)v18 + 4), a4);
  v20 = 0;
  *((void *)v18 + 13) = a4;
  if (a3 && a6)
  {
    *((void *)v18 + 14) = (a3 + a6 - 1) / a6;
    *((void *)v18 + 15) = a5;
    *((void *)v18 + 16) = a6;
    v21 = [[NoiseSampler alloc] initWithZipfOfSize:a7];
    v22 = (void *)*((void *)v18 + 17);
    *((void *)v18 + 17) = v21;

    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 1, *((void *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 4, *((void *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 7, *((void *)v18 + 14));
    std::vector<std::vector<float>>::resize((uint64_t *)v18 + 10, *((void *)v18 + 14));
    if (*((void *)v18 + 14))
    {
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = *((void *)v18 + 16) * a4;
      do
      {
        uint64_t v26 = *v19 + v23;
        int v35 = 0;
        std::vector<float>::resize(v26, v25, &v35);
        uint64_t v27 = *((void *)v18 + 4) + v23;
        int v35 = 0;
        std::vector<float>::resize(v27, v25, &v35);
        uint64_t v28 = *((void *)v18 + 7) + v23;
        int v35 = 0;
        std::vector<float>::resize(v28, v25, &v35);
        std::vector<float>::resize(*((void *)v18 + 10) + v23, *((void *)v18 + 15));
        ++v24;
        v23 += 24;
      }
      while (v24 < *((void *)v18 + 14));
    }
    objc_storeStrong((id *)v18 + 18, a8);
    objc_storeStrong((id *)v18 + 19, a9);
    objc_storeStrong((id *)v18 + 20, a10);
    objc_storeStrong((id *)v18 + 21, a11);
    goto LABEL_8;
  }
LABEL_9:

  return v20;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v43[5] = *MEMORY[0x1E4F143B8];
  if (self->_numBatches <= a3)
  {
    id v39 = (id)MEMORY[0x1E4F1CC08];
  }
  else
  {
    id v39 = (id)objc_opt_new();
    unint64_t batchSize = self->_batchSize;
    unint64_t sequenceLength = self->_sequenceLength;
    v43[0] = &unk_1F0A740E8;
    v43[1] = &unk_1F0A740E8;
    v43[2] = &unk_1F0A740E8;
    v8 = [NSNumber numberWithUnsignedInteger:batchSize];
    v43[3] = v8;
    v9 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
    v43[4] = v9;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];

    unint64_t v10 = sequenceLength * batchSize;
    v11 = [NSNumber numberWithUnsignedInteger:sequenceLength * batchSize];
    v42[0] = v11;
    v12 = [NSNumber numberWithUnsignedInteger:v10];
    v42[1] = v12;
    v13 = [NSNumber numberWithUnsignedInteger:v10];
    v42[2] = v13;
    v14 = [NSNumber numberWithUnsignedInteger:self->_sequenceLength];
    v42[3] = v14;
    v42[4] = &unk_1F0A740E8;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:5];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F61198]) initWithData:*((void *)self->_contextData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v15 forKeyedSubscript:self->_contextKey];

    v16 = [NSNumber numberWithUnsignedInteger:v10];
    v17 = [v39 objectForKeyedSubscript:self->_contextKey];
    [v17 setMaxNumberOfElements:v16];

    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F61198]) initWithData:*((void *)self->_targetData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v18 forKeyedSubscript:self->_targetKey];

    v19 = [NSNumber numberWithUnsignedInteger:v10];
    v20 = [v39 objectForKeyedSubscript:self->_targetKey];
    [v20 setMaxNumberOfElements:v19];

    v21 = (void *)[objc_alloc(MEMORY[0x1E4F61198]) initWithData:*((void *)self->_maskData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v21 forKeyedSubscript:self->_maskKey];

    v22 = [NSNumber numberWithUnsignedInteger:v10];
    uint64_t v23 = [v39 objectForKeyedSubscript:self->_maskKey];
    [v23 setMaxNumberOfElements:v22];

    id v24 = objc_alloc(MEMORY[0x1E4F61198]);
    uint64_t v25 = *((void *)self->_noiseData.__begin_ + 3 * a3);
    v41[0] = &unk_1F0A740E8;
    v41[1] = &unk_1F0A740E8;
    v41[2] = &unk_1F0A740E8;
    v41[3] = &unk_1F0A740E8;
    objc_super v36 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v41[4] = v36;
    uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
    uint64_t v27 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[0] = v27;
    uint64_t v28 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[1] = v28;
    v29 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[2] = v29;
    v30 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[3] = v30;
    v40[4] = &unk_1F0A740E8;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];
    id v32 = (void *)[v24 initWithData:v25 type:2 shape:v26 strides:v31];
    [v39 setObject:v32 forKeyedSubscript:self->_noiseKey];

    id v33 = [NSNumber numberWithUnsignedInteger:self->_noiseSize];
    id v34 = [v39 objectForKeyedSubscript:self->_noiseKey];
    [v34 setMaxNumberOfElements:v33];
  }
  return v39;
}

- (void)setVectorsWithProcessor:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  [v25 textSequence];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v28)
  {
    LODWORD(v30) = 0;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v29 = 0;
      unint64_t v30 = (int)v30;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v31 + 1) + 8 * v29);
        unint64_t batchSize = self->_batchSize;
        v6 = [v4 sequence];
        v7 = [v4 target];
        v8 = [v4 mask];
        unint64_t v9 = 0;
        uint64_t v10 = (int)(v30 % batchSize);
        int v11 = v30 / batchSize;
        while (v9 < [v6 count])
        {
          unint64_t sequenceLength = self->_sequenceLength;
          v13 = [v6 objectAtIndexedSubscript:v9];
          [v13 floatValue];
          unint64_t v14 = v9 + sequenceLength * v10;
          *(_DWORD *)(*((void *)self->_contextData.__begin_ + 3 * v11) + 4 * v14) = v15;

          v16 = [v7 objectAtIndexedSubscript:v9];
          [v16 floatValue];
          *(_DWORD *)(*((void *)self->_targetData.__begin_ + 3 * v11) + 4 * v14) = v17;

          id v18 = [v8 objectAtIndexedSubscript:v9];
          [v18 floatValue];
          *(_DWORD *)(*((void *)self->_maskData.__begin_ + 3 * v11) + 4 * v14) = v19;

          ++v9;
        }

        ++v29;
        ++v30;
      }
      while (v29 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v28);
  }

  unint64_t noiseSize = self->_noiseSize;
  if (noiseSize)
  {
    unint64_t v21 = 0;
    unint64_t numBatches = self->_numBatches;
    do
    {
      if (numBatches)
      {
        uint64_t v23 = 0;
        for (unint64_t i = 0; i < numBatches; ++i)
        {
          *(float *)(*(void *)((char *)self->_noiseData.__begin_ + v23) + 4 * v21) = (float)[(NoiseSampler *)self->_sampler drawNoise];
          unint64_t numBatches = self->_numBatches;
          v23 += 24;
        }
        unint64_t noiseSize = self->_noiseSize;
      }
      ++v21;
    }
    while (v21 < noiseSize);
  }
}

- (unint64_t)numberOfDataPoints
{
  return self->_numBatches;
}

- (void)setNumBatches:(int)a3
{
  self->_unint64_t numBatches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseKey, 0);
  objc_storeStrong((id *)&self->_maskKey, 0);
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  p_noiseData = &self->_noiseData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_maskData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_targetData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
  p_noiseData = &self->_contextData;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_noiseData);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end