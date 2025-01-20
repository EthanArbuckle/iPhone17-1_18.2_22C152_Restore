@interface _DPPrioAlgorithm
+ (id)prioWithEpsilon:(double)a3 dimensionality:(unint64_t)a4;
- ($5213ABC0A562F41519F6B00E3FC402D5)prioMemory;
- (_DPBiasedCoin)coin;
- (_DPPrioAlgorithm)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4;
- (double)epsilon;
- (id)privatizeDataWithBlock:(id)a3;
- (id)privatizeDataWithLocalDP:(BOOL)a3 withBlock:(id)a4;
- (unint64_t)dimension;
- (void)dealloc;
@end

@implementation _DPPrioAlgorithm

- (_DPPrioAlgorithm)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4
{
  v5 = self;
  if (a3 < 0.0 || a3 > 16.0) {
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)_DPPrioAlgorithm;
  v8 = [(_DPPrioAlgorithm *)&v15 init];
  v5 = v8;
  if (v8)
  {
    v8->_dimension = a4;
    v8->_epsilon = a3;
    uint64_t v9 = +[_DPBiasedCoin coinWithBias:(double)(1.0 / (exp(a3) + 1.0))];
    coin = v5->_coin;
    v5->_coin = (_DPBiasedCoin *)v9;

    if (2 * nextPowerOfTwo(a4 + 1) > 0x100000)
    {
      v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioAlgorithm initWithEpsilon:dimensionality:]((uint64_t *)&v5->_dimension, v11);
      }
LABEL_14:

LABEL_15:
      v13 = 0;
      goto LABEL_16;
    }
    v12 = ($5213ABC0A562F41519F6B00E3FC402D5 *)prio_memory_alloc(v5->_dimension);
    v5->_prioMemory = v12;
    if (!v12)
    {
      v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioAlgorithm initWithEpsilon:dimensionality:]((uint64_t *)&v5->_dimension, v11);
      }
      goto LABEL_14;
    }
  }
  v5 = v5;
  v13 = v5;
LABEL_16:

  return v13;
}

- (void)dealloc
{
  prio_memory_free(self->_prioMemory);
  v3.receiver = self;
  v3.super_class = (Class)_DPPrioAlgorithm;
  [(_DPPrioAlgorithm *)&v3 dealloc];
}

+ (id)prioWithEpsilon:(double)a3 dimensionality:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 dimensionality:a3];
  return v4;
}

- (id)privatizeDataWithBlock:(id)a3
{
  return [(_DPPrioAlgorithm *)self privatizeDataWithLocalDP:1 withBlock:a3];
}

- (id)privatizeDataWithLocalDP:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  v49[3] = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t (**)(void, uint64_t, uint64_t))a4;
  uint64_t v7 = [(_DPPrioAlgorithm *)self dimension];
  unint64_t v8 = prio_share_length(v7);
  size_t v9 = +[_DPPrioSeedablePRNG seedLength];
  v10 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v8];
  if (v10)
  {
    v47 = v6;
    v11 = [MEMORY[0x1E4F1CA58] dataWithLength:v9];
    id v12 = v10;
    uint64_t v13 = [v12 mutableBytes];
    v14 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    objc_super v15 = v11;
    if (SecRandomCopyBytes(v14, v9, (void *)[v15 mutableBytes]))
    {
      v16 = +[_DPLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else
    {
      if (v47[2](v47, v13, v7))
      {
        v46 = (int *)v13;
        if (v7 && v4)
        {
          v25 = (_DWORD *)v13;
          uint64_t v26 = v7;
          do
          {
            v27 = [(_DPPrioAlgorithm *)self coin];
            int v28 = [v27 flip];

            if (v28) {
              _DWORD *v25 = *v25 == 0;
            }
            ++v25;
            --v26;
          }
          while (v26);
        }
        prio_encode(v7, v46, v8, (void *)[(_DPPrioAlgorithm *)self prioMemory]);
        v29 = +[_DPPrioSeedablePRNG randomDataFromSeed:v15 length:v8];
        v16 = v29;
        if (v29)
        {
          share_array_prng((unsigned int *)v46, (unsigned int *)[v29 bytes], v8);
          v48[0] = @"share1";
          v48[1] = @"share2";
          v49[0] = v12;
          v49[1] = v15;
          v48[2] = @"dimensionality";
          v30 = [NSNumber numberWithUnsignedLong:v7];
          v49[2] = v30;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
        }
        else
        {
          v30 = +[_DPLog framework];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:](v30, v39, v40, v41, v42, v43, v44, v45);
          }
          v24 = 0;
        }
        v6 = v47;

        goto LABEL_20;
      }
      v16 = +[_DPLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:](v16, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    v24 = 0;
    v6 = v47;
LABEL_20:

    goto LABEL_21;
  }
  objc_super v15 = +[_DPLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[_DPPrioAlgorithm privatizeDataWithLocalDP:withBlock:](v7, v15);
  }
  v24 = 0;
LABEL_21:

  return v24;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- ($5213ABC0A562F41519F6B00E3FC402D5)prioMemory
{
  return self->_prioMemory;
}

- (_DPBiasedCoin)coin
{
  return self->_coin;
}

- (void).cxx_destruct
{
}

- (void)initWithEpsilon:(uint64_t *)a1 dimensionality:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = 0x100000;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "_DPPrioAlgorithm called with dimensionality %lu, need to be less than %u.", (uint8_t *)&v3, 0x12u);
}

- (void)initWithEpsilon:(uint64_t *)a1 dimensionality:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed to allocate memory for _DPPrioAlgorithm with dimensionality %lu.", (uint8_t *)&v3, 0xCu);
}

- (void)privatizeDataWithLocalDP:(uint64_t)a1 withBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "_DPPRioAlgorithm fail to allocate memory with dimension=%zu.", (uint8_t *)&v2, 0xCu);
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)privatizeDataWithLocalDP:(uint64_t)a3 withBlock:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end