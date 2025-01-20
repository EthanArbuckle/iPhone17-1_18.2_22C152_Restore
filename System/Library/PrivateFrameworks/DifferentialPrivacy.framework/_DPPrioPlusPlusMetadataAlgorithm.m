@interface _DPPrioPlusPlusMetadataAlgorithm
+ (id)initializeWithDimensionality:(unint64_t)a3;
- ($5213ABC0A562F41519F6B00E3FC402D5)prioMemory;
- (_DPPrioPlusPlusMetadataAlgorithm)initWithDimensionality:(unint64_t)a3;
- (id)randomize:(id)a3;
- (unint64_t)dimension;
- (void)dealloc;
@end

@implementation _DPPrioPlusPlusMetadataAlgorithm

+ (id)initializeWithDimensionality:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDimensionality:a3];
  return v3;
}

- (_DPPrioPlusPlusMetadataAlgorithm)initWithDimensionality:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_DPPrioPlusPlusMetadataAlgorithm;
  v4 = [(_DPPrioPlusPlusMetadataAlgorithm *)&v10 init];
  v5 = (uint64_t *)v4;
  if (!v4) {
    goto LABEL_8;
  }
  v4->_dimension = a3;
  if (a3 && 2 * nextPowerOfTwo(a3 + 1) <= 0x100000)
  {
    v8 = prio_memory_alloc(v5[1]);
    v5[2] = (uint64_t)v8;
    if (!v8)
    {
      v6 = +[_DPLog framework];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPlusPlusMetadataAlgorithm initWithDimensionality:](v5 + 1, v6);
      }
      goto LABEL_6;
    }
LABEL_8:
    v7 = v5;
    goto LABEL_9;
  }
  v6 = +[_DPLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[_DPPrioPlusPlusMetadataAlgorithm initWithDimensionality:](v5 + 1, v6);
  }
LABEL_6:

  v7 = 0;
LABEL_9:

  return v7;
}

- (void)dealloc
{
  prio_memory_free(self->_prioMemory);
  v3.receiver = self;
  v3.super_class = (Class)_DPPrioPlusPlusMetadataAlgorithm;
  [(_DPPrioPlusPlusMetadataAlgorithm *)&v3 dealloc];
}

- (id)randomize:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_DPPrioPlusPlusMetadataAlgorithm *)self dimension];
  unint64_t v6 = prio_share_length(v5);
  id v7 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v6];
  v8 = (int *)[v7 mutableBytes];
  id v9 = v4;
  objc_super v10 = (unsigned __int8 *)[v9 bytes];
  if (v5)
  {
    v11 = v8;
    uint64_t v12 = v5;
    while (1)
    {
      unsigned int v14 = *v10++;
      unsigned int v13 = v14;
      if (v14 >= 2) {
        break;
      }
      *v11++ = v13;
      if (!--v12) {
        goto LABEL_5;
      }
    }
    v15 = +[_DPLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPlusPlusMetadataAlgorithm randomize:](v15);
    }
    v19 = 0;
  }
  else
  {
LABEL_5:
    prio_encode(v5, v8, v6, (void *)[(_DPPrioPlusPlusMetadataAlgorithm *)self prioMemory]);
    v15 = +[_DPPrioSeedablePRNG generateSeed];
    v16 = +[_DPPrioSeedablePRNG randomDataFromSeed:v15 length:v6];
    v17 = v16;
    if (v16)
    {
      share_array_prng((unsigned int *)v8, (unsigned int *)[v16 bytes], v6);
      v21[0] = @"share1";
      v21[1] = @"share2";
      v22[0] = v7;
      v22[1] = v15;
      v21[2] = @"dimensionality";
      v18 = [NSNumber numberWithUnsignedLong:v5];
      v22[2] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    }
    else
    {
      v18 = +[_DPLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPlusPlusMetadataAlgorithm randomize:](v18);
      }
      v19 = 0;
    }
  }
  return v19;
}

- (unint64_t)dimension
{
  return self->_dimension;
}

- ($5213ABC0A562F41519F6B00E3FC402D5)prioMemory
{
  return self->_prioMemory;
}

- (void)initWithDimensionality:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 1024;
  int v6 = 0x100000;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusMetadataAlgorithm called with dimensionality %lu, need to be more than 0 and less than %u.", (uint8_t *)&v3, 0x12u);
}

- (void)initWithDimensionality:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed to allocate memory for _DPPrioPlusPlusMetadataAlgorithm with dimensionality %lu.", (uint8_t *)&v3, 0xCu);
}

- (void)randomize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusMetadataAlgorithm failed to generate random numbers from a seed.", v1, 2u);
}

- (void)randomize:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "_DPPrioPlusPlusMetadataAlgorithm received invalid bit vector.", v1, 2u);
}

@end