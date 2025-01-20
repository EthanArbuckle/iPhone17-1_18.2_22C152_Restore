@interface SMTDataSourceTrain
- (SMTDataSourceTrain)init;
- (SMTDataSourceTrain)initWithNumDataPoints:(unint64_t)a3 sequenceLength:(unint64_t)a4 noiseSize:(unint64_t)a5 batchSize:(unint64_t)a6 vocabSize:(unint64_t)a7 contextKey:(id)a8 targetKey:(id)a9 maskKey:(id)a10 noiseKey:(id)a11;
- (id).cxx_construct;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)setNumBatches:(int)a3;
- (void)setVectorsWithProcessor:(id)a3;
@end

@implementation SMTDataSourceTrain

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noiseKey, 0);
  objc_storeStrong((id *)&self->_maskKey, 0);
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_contextKey, 0);
  objc_storeStrong((id *)&self->_sampler, 0);
  p_noiseData = &self->_noiseData;
  sub_100022794((void ***)&p_noiseData);
  p_noiseData = &self->_maskData;
  sub_100022794((void ***)&p_noiseData);
  p_noiseData = &self->_targetData;
  sub_100022794((void ***)&p_noiseData);
  p_noiseData = &self->_contextData;
  sub_100022794((void ***)&p_noiseData);
}

- (void)setNumBatches:(int)a3
{
  self->_numBatches = a3;
}

- (unint64_t)numberOfDataPoints
{
  return self->_numBatches;
}

- (void)setVectorsWithProcessor:(id)a3
{
  id v25 = a3;
  [v25 textSequence];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v28)
  {
    LODWORD(v30) = 0;
    uint64_t v27 = *(void *)v32;
    do
    {
      v29 = 0;
      unint64_t v30 = (int)v30;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v29);
        unint64_t batchSize = self->_batchSize;
        v6 = [v4 sequence];
        v7 = [v4 target];
        v8 = [v4 mask];
        unint64_t v9 = 0;
        uint64_t v10 = (int)(v30 % batchSize);
        int v11 = v30 / batchSize;
        while (v9 < (unint64_t)[v6 count])
        {
          unint64_t sequenceLength = self->_sequenceLength;
          v13 = [v6 objectAtIndexedSubscript:v9];
          [v13 floatValue];
          unint64_t v14 = v9 + sequenceLength * v10;
          *(_DWORD *)(*((void *)self->_contextData.__begin_ + 3 * v11) + 4 * v14) = v15;

          v16 = [v7 objectAtIndexedSubscript:v9];
          [v16 floatValue];
          *(_DWORD *)(*((void *)self->_targetData.__begin_ + 3 * v11) + 4 * v14) = v17;

          v18 = [v8 objectAtIndexedSubscript:v9];
          [v18 floatValue];
          *(_DWORD *)(*((void *)self->_maskData.__begin_ + 3 * v11) + 4 * v14) = v19;

          ++v9;
        }

        v29 = (char *)v29 + 1;
        ++v30;
      }
      while (v29 != v28);
      id v28 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
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
          *(float *)(*(void *)((char *)self->_noiseData.__begin_ + v23) + 4 * v21) = (float)[(SMTNoiseSampler *)self->_sampler drawNoise];
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

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  if (self->_numBatches <= a3)
  {
    id v39 = &__NSDictionary0__struct;
  }
  else
  {
    id v39 = (id)objc_opt_new();
    unint64_t batchSize = self->_batchSize;
    unint64_t sequenceLength = self->_sequenceLength;
    v43[0] = &off_10003F268;
    v43[1] = &off_10003F268;
    v43[2] = &off_10003F268;
    v8 = +[NSNumber numberWithUnsignedInteger:batchSize];
    v43[3] = v8;
    unint64_t v9 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
    v43[4] = v9;
    v37 = +[NSArray arrayWithObjects:v43 count:5];

    unint64_t v10 = sequenceLength * batchSize;
    int v11 = +[NSNumber numberWithUnsignedInteger:sequenceLength * batchSize];
    v42[0] = v11;
    v12 = +[NSNumber numberWithUnsignedInteger:v10];
    v42[1] = v12;
    v13 = +[NSNumber numberWithUnsignedInteger:v10];
    v42[2] = v13;
    unint64_t v14 = +[NSNumber numberWithUnsignedInteger:self->_sequenceLength];
    v42[3] = v14;
    v42[4] = &off_10003F268;
    v38 = +[NSArray arrayWithObjects:v42 count:5];

    id v15 = [objc_alloc((Class)ETDataTensor) initWithData:*((void *)self->_contextData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v15 forKeyedSubscript:self->_contextKey];

    v16 = +[NSNumber numberWithUnsignedInteger:v10];
    int v17 = [v39 objectForKeyedSubscript:self->_contextKey];
    [v17 setMaxNumberOfElements:v16];

    id v18 = [objc_alloc((Class)ETDataTensor) initWithData:*((void *)self->_targetData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v18 forKeyedSubscript:self->_targetKey];

    int v19 = +[NSNumber numberWithUnsignedInteger:v10];
    v20 = [v39 objectForKeyedSubscript:self->_targetKey];
    [v20 setMaxNumberOfElements:v19];

    id v21 = [objc_alloc((Class)ETDataTensor) initWithData:*((void *)self->_maskData.__begin_ + 3 * a3) type:2 shape:v37 strides:v38];
    [v39 setObject:v21 forKeyedSubscript:self->_maskKey];

    v22 = +[NSNumber numberWithUnsignedInteger:v10];
    uint64_t v23 = [v39 objectForKeyedSubscript:self->_maskKey];
    [v23 setMaxNumberOfElements:v22];

    id v24 = objc_alloc((Class)ETDataTensor);
    uint64_t v25 = *((void *)self->_noiseData.__begin_ + 3 * a3);
    v41[0] = &off_10003F268;
    v41[1] = &off_10003F268;
    v41[2] = &off_10003F268;
    v41[3] = &off_10003F268;
    v36 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v41[4] = v36;
    v26 = +[NSArray arrayWithObjects:v41 count:5];
    uint64_t v27 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[0] = v27;
    id v28 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[1] = v28;
    v29 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[2] = v29;
    unint64_t v30 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    v40[3] = v30;
    v40[4] = &off_10003F268;
    long long v31 = +[NSArray arrayWithObjects:v40 count:5];
    id v32 = [v24 initWithData:v25 type:2 shape:v26 strides:v31];
    [v39 setObject:v32 forKeyedSubscript:self->_noiseKey];

    long long v33 = +[NSNumber numberWithUnsignedInteger:self->_noiseSize];
    long long v34 = [v39 objectForKeyedSubscript:self->_noiseKey];
    [v34 setMaxNumberOfElements:v33];
  }
  return v39;
}

- (SMTDataSourceTrain)initWithNumDataPoints:(unint64_t)a3 sequenceLength:(unint64_t)a4 noiseSize:(unint64_t)a5 batchSize:(unint64_t)a6 vocabSize:(unint64_t)a7 contextKey:(id)a8 targetKey:(id)a9 maskKey:(id)a10 noiseKey:(id)a11
{
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  v36.receiver = self;
  v36.super_class = (Class)SMTDataSourceTrain;
  int v17 = [(SMTDataSourceTrain *)&v36 init];
  id v18 = v17;
  if (!v17)
  {
LABEL_8:
    v20 = v18;
    goto LABEL_9;
  }
  p_contextData = (char ***)&v17->_contextData;
  sub_100022DEC((uint64_t)&v17->_contextData, 1uLL);
  sub_100022DEC((uint64_t)&v18->_targetData, 1uLL);
  sub_100023008(*p_contextData, a4);
  sub_100023008((char **)v18->_targetData.__begin_, a4);
  v20 = 0;
  v18->_unint64_t sequenceLength = a4;
  if (a3 && a6)
  {
    v18->_unint64_t numBatches = (a3 + a6 - 1) / a6;
    v18->_unint64_t noiseSize = a5;
    v18->_unint64_t batchSize = a6;
    id v21 = [[SMTNoiseSampler alloc] initWithZipfOfSize:a7];
    sampler = v18->_sampler;
    v18->_sampler = v21;

    sub_100022DEC((uint64_t)&v18->_contextData, v18->_numBatches);
    sub_100022DEC((uint64_t)&v18->_targetData, v18->_numBatches);
    sub_100022DEC((uint64_t)&v18->_maskData, v18->_numBatches);
    sub_100022DEC((uint64_t)&v18->_noiseData, v18->_numBatches);
    if (v18->_numBatches)
    {
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = v18->_batchSize * a4;
      do
      {
        v26 = &(*p_contextData)[v23 / 8];
        int v35 = 0;
        sub_100006E7C(v26, v25, &v35);
        uint64_t v27 = (char **)((char *)v18->_targetData.__begin_ + v23);
        int v35 = 0;
        sub_100006E7C(v27, v25, &v35);
        id v28 = (char **)((char *)v18->_maskData.__begin_ + v23);
        int v35 = 0;
        sub_100006E7C(v28, v25, &v35);
        sub_100023008((char **)((char *)v18->_noiseData.__begin_ + v23), v18->_noiseSize);
        ++v24;
        v23 += 24;
      }
      while (v24 < v18->_numBatches);
    }
    objc_storeStrong((id *)&v18->_contextKey, a8);
    objc_storeStrong((id *)&v18->_targetKey, a9);
    objc_storeStrong((id *)&v18->_maskKey, a10);
    objc_storeStrong((id *)&v18->_noiseKey, a11);
    goto LABEL_8;
  }
LABEL_9:

  return v20;
}

- (SMTDataSourceTrain)init
{
  return 0;
}

@end