@interface HDQuantitySampleOverlapProcessor
- ($1EB0DF88EDF1A34CBFAADF2FA3FC3584)exportCurrentState;
- (BOOL)fetchFinalOverlapSamplesWithErrorOut:(id *)a3 handler:(id)a4;
- (BOOL)fetchOverlapProcessSamplesFrom:(id *)a3 setAnchorTime:(BOOL)a4 errorOut:(id *)a5 handler:(id)a6;
- (BOOL)loggedDuplicatedSample;
- (HDQuantitySampleOverlapProcessor)initWithOverlapFunction:(unint64_t)a3;
- (HDQuantitySampleOverlapProcessor)initWithState:(id *)a3;
- (NSError)unitTesting_DuplicateSampleError;
- (double)_overlapSampleToEdge:(double)result;
- (int64_t)addSample:(id *)a3 outputSamples:(id)a4[8] error:(id *)a5;
- (int64_t)finishWithRemainingSamples:(id)a3[8] error:(id *)a4;
- (void)resetAnchorTime:(double)a3;
@end

@implementation HDQuantitySampleOverlapProcessor

- (HDQuantitySampleOverlapProcessor)initWithOverlapFunction:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDQuantitySampleOverlapProcessor;
  result = [(HDQuantitySampleOverlapProcessor *)&v5 init];
  if (result)
  {
    result->_anchorTime = 0.0;
    result->_workingSetCount = 0;
    result->_overlapFunction = a3;
    result->_loggedDuplicatedSample = 0;
  }
  return result;
}

- (HDQuantitySampleOverlapProcessor)initWithState:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HDQuantitySampleOverlapProcessor;
  result = [(HDQuantitySampleOverlapProcessor *)&v10 init];
  if (result)
  {
    result->_overlapFunction = a3->var1;
    result->_anchorTime = a3->var0;
    result->_workingSetCount = a3->var2;
    result->_loggedDuplicatedSample = a3->var3;
    if (a3->var2 >= 1)
    {
      int64_t v5 = 0;
      workingSet = result->_workingSet;
      var4 = a3->var4;
      do
      {
        long long v8 = *(_OWORD *)&var4->var0;
        long long v9 = *(_OWORD *)&var4->var2;
        workingSet->sourceID = var4->var4;
        *(_OWORD *)&workingSet->startTime = v8;
        *(_OWORD *)&workingSet->sampleValue = v9;
        ++v5;
        ++var4;
        ++workingSet;
      }
      while (v5 < a3->var2);
    }
  }
  return result;
}

- ($1EB0DF88EDF1A34CBFAADF2FA3FC3584)exportCurrentState
{
  bzero(&retstr->var3, 0x1408uLL);
  retstr->var0 = self->_anchorTime;
  uint64_t workingSetCount = self->_workingSetCount;
  retstr->var1 = self->_overlapFunction;
  retstr->var2 = workingSetCount;
  retstr->var3 = self->_loggedDuplicatedSample;
  if (workingSetCount >= 1)
  {
    return ($1EB0DF88EDF1A34CBFAADF2FA3FC3584 *)memcpy(retstr->var4, self->_workingSet, 40 * workingSetCount);
  }
  return result;
}

- (void)resetAnchorTime:(double)a3
{
  self->_anchorTime = a3;
  self->_uint64_t workingSetCount = 0;
}

- (int64_t)addSample:(id *)a3 outputSamples:(id)a4[8] error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int64_t workingSetCount = self->_workingSetCount;
  if (workingSetCount < 1) {
    goto LABEL_24;
  }
  objc_super v10 = (double *)((char *)self + 40 * workingSetCount);
  double var0 = a3->var0;
  double var1 = a3->var1;
  BOOL v14 = *v10 == a3->var0 && *((double *)&self->_overlapFunction + 5 * workingSetCount) == var1 && v10[2] == a3->var2;
  if (v14 && *((unsigned __int8 *)v10 + 24) == a3->var3)
  {
    if (self->_loggedDuplicatedSample)
    {
      unitTesting_DuplicateSampleError = self->_unitTesting_DuplicateSampleError;
      self->_unitTesting_DuplicateSampleError = 0;
    }
    else
    {
      v28 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 115, @"Received duplicate quantity sample");
      objc_storeStrong((id *)&self->_unitTesting_DuplicateSampleError, v28);
      _HKInitializeLogging();
      v29 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        LODWORD(v32) = 138543362;
        *(void *)((char *)&v32 + 4) = v28;
        _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "Failed to process overlapping samples: %{public}@", (uint8_t *)&v32, 0xCu);
      }
      self->_loggedDuplicatedSample = 1;
    }
    return 0;
  }
  if (workingSetCount == 1)
  {
    double endTime = self->_workingSet[0].endTime;
    if (endTime > var0)
    {
      if (vabdd_f64(endTime, var0) > 0.000001 || var1 - var0 <= 0.000001) {
        goto LABEL_24;
      }
LABEL_23:
      a4->double var0 = self->_anchorTime;
      a4->double var1 = endTime;
      a4->var2 = self->_workingSet[0].sampleValue;
      a4->var3 = self->_workingSet[0].shouldContributeToCount;
      a4->var4 = self->_workingSet[0].sourceID;
      self->_anchorTime = a3->var0;
      long long v18 = *(_OWORD *)&a3->var0;
      long long v19 = *(_OWORD *)&a3->var2;
      self->_workingSet[0].sourceID = a3->var4;
      *(_OWORD *)&self->_workingSet[0].startTime = v18;
      *(_OWORD *)&self->_workingSet[0].sampleValue = v19;
      return 1;
    }
    if (var1 - var0 > 0.000001) {
      goto LABEL_23;
    }
  }
  else if ((unint64_t)workingSetCount >= 0x80)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 130, @"Overlap processing exceeded working set size.");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v30 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v32) = 138543362;
      *(void *)((char *)&v32 + 4) = v17;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Failed to process overlapping samples: %{public}@", (uint8_t *)&v32, 0xCu);
    }

    return -1;
  }
LABEL_24:
  v21 = (char *)self + 40 * workingSetCount;
  self->_int64_t workingSetCount = workingSetCount + 1;
  long long v22 = *(_OWORD *)&a3->var0;
  long long v23 = *(_OWORD *)&a3->var2;
  *((void *)v21 + 9) = a3->var4;
  *(_OWORD *)(v21 + 56) = v23;
  *(_OWORD *)(v21 + 40) = v22;
  double v24 = a3->var0;
  if (self->_anchorTime >= a3->var0) {
    return 0;
  }
  int64_t v20 = 0;
  do
  {
    int64_t v34 = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    [(HDQuantitySampleOverlapProcessor *)(uint64_t)&v32 _overlapSampleToEdge:v24];
    if (*((double *)&v32 + 1) - *(double *)&v32 > 0.000001)
    {
      v25 = &a4[v20++];
      long long v26 = v33;
      *(_OWORD *)&v25->double var0 = v32;
      *(_OWORD *)&v25->var2 = v26;
      v25->var4 = v34;
    }
    double v24 = a3->var0;
  }
  while (self->_anchorTime < a3->var0 && v20 < 8);
  return v20;
}

- (double)_overlapSampleToEdge:(double)result
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a2 + 24);
    if (v3 < 1) {
      goto LABEL_36;
    }
    double v4 = *(double *)(a2 + 16);
    int64_t v5 = (double *)(a2 + 48);
    double v6 = *(double *)(a2 + 24);
    do
    {
      double v7 = *(v5 - 1);
      if (v7 < result && v7 > v4) {
        result = *(v5 - 1);
      }
      double v9 = *v5;
      v5 += 5;
      double v10 = v9;
      if (v9 < result && v10 > v4) {
        result = v10;
      }
      --*(void *)&v6;
    }
    while (v6 != 0.0);
    double v12 = 0.0;
    v13 = (double *)(a2 + 72);
    BOOL v14 = 1;
    double v15 = -1.79769313e308;
    double v16 = 1.79769313e308;
    uint64_t v17 = *(void *)(a2 + 24);
    BOOL v18 = 1;
    do
    {
      if (*(v13 - 4) <= v4 && *(v13 - 3) >= result)
      {
        double v19 = *(v13 - 2);
        if (v16 >= v19) {
          double v16 = *(v13 - 2);
        }
        if (v15 < v19) {
          double v15 = *(v13 - 2);
        }
        if (v16 == v19)
        {
          double v6 = *v13;
          BOOL v14 = *((unsigned char *)v13 - 8) != 0;
        }
        if (v15 == v19)
        {
          double v12 = *v13;
          BOOL v18 = *((unsigned char *)v13 - 8) != 0;
        }
      }
      v13 += 5;
      --v17;
    }
    while (v17);
    if (v16 >= 1.79769313e308)
    {
LABEL_36:
      *(void *)(a1 + 32) = 0;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
    }
    else
    {
      uint64_t v20 = *(void *)(a2 + 8);
      if (v20 != 1)
      {
        double v15 = 0.0;
        if (v20)
        {
          double v12 = 0.0;
        }
        else
        {
          double v15 = v16;
          double v12 = v6;
        }
        if (v20) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v14;
        }
      }
      *(double *)a1 = v4;
      *(double *)(a1 + 8) = result;
      *(double *)(a1 + 16) = v15;
      *(void *)(a1 + 24) = 0;
      *(double *)(a1 + 32) = v12;
      *(unsigned char *)(a1 + 24) = v18;
    }
    if (v3 >= 1)
    {
      uint64_t v21 = 0;
      uint64_t v22 = a2 + 40;
      do
      {
        if (*(double *)(v22 + 40 * v21 + 8) <= result)
        {
          uint64_t v23 = v22 + 40 * v21;
          uint64_t v24 = v22 + 40 * v3;
          long long v25 = *(_OWORD *)(v24 - 40);
          long long v26 = *(_OWORD *)(v24 - 24);
          *(void *)(v23 + 32) = *(void *)(v24 - 8);
          *(_OWORD *)uint64_t v23 = v25;
          *(_OWORD *)(v23 + 16) = v26;
          uint64_t v3 = *(void *)(a2 + 24) - 1;
          *(void *)(a2 + 24) = v3;
        }
        else
        {
          ++v21;
        }
      }
      while (v21 < v3);
    }
    *(double *)(a2 + 16) = result;
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

- (int64_t)finishWithRemainingSamples:(id)a3[8] error:(id *)a4
{
  if (self->_workingSetCount < 1) {
    return 0;
  }
  int64_t v6 = 0;
  do
  {
    int64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    [(HDQuantitySampleOverlapProcessor *)(uint64_t)&v11 _overlapSampleToEdge:1.79769313e308];
    if (*((double *)&v11 + 1) - *(double *)&v11 > 0.000001)
    {
      double v7 = &a3[v6++];
      long long v8 = v12;
      *(_OWORD *)&v7->double var0 = v11;
      *(_OWORD *)&v7->var2 = v8;
      v7->var4 = v13;
    }
  }
  while (self->_workingSetCount >= 1 && v6 < 8);
  return v6;
}

- (BOOL)fetchOverlapProcessSamplesFrom:(id *)a3 setAnchorTime:(BOOL)a4 errorOut:(id *)a5 handler:(id)a6
{
  BOOL v7 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v10 = (uint64_t (**)(id, int64_t, unsigned char *, id *))a6;
  if (v7) {
    [(HDQuantitySampleOverlapProcessor *)self resetAnchorTime:a3->var0];
  }
  id v22 = 0;
  long long v11 = *(_OWORD *)&a3->var2;
  v20[0] = *(_OWORD *)&a3->var0;
  v20[1] = v11;
  int64_t var4 = a3->var4;
  int64_t v12 = [(HDQuantitySampleOverlapProcessor *)self addSample:v20 outputSamples:v23 error:&v22];
  id v13 = v22;
  BOOL v14 = v13;
  if (v12 == -1)
  {
    id v16 = v13;
    if (!v16)
    {
LABEL_12:

      BOOL v17 = 0;
      goto LABEL_13;
    }
    if (!a5)
    {
LABEL_11:
      _HKLogDroppedError();
      goto LABEL_12;
    }
LABEL_8:
    id v16 = v16;
    *a5 = v16;
    goto LABEL_12;
  }
  id v19 = v13;
  char v15 = v10[2](v10, v12, v23, &v19);
  id v16 = v19;

  if ((v15 & 1) == 0)
  {
    id v16 = v16;
    if (!v16) {
      goto LABEL_12;
    }
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

- (BOOL)fetchFinalOverlapSamplesWithErrorOut:(id *)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v6 = (uint64_t (**)(id, int64_t, unsigned char *, id *))a4;
  id v7 = 0;
  while (1)
  {
    id v14 = v7;
    int64_t v8 = [(HDQuantitySampleOverlapProcessor *)self finishWithRemainingSamples:v15 error:&v14];
    id v9 = v14;

    if (!v8)
    {
      BOOL v11 = 1;
      goto LABEL_13;
    }
    if (v8 == -1) {
      break;
    }
    id v13 = v9;
    char v10 = v6[2](v6, v8, v15, &v13);
    id v7 = v13;

    if ((v10 & 1) == 0)
    {
      id v9 = v7;
      if (!v9) {
        goto LABEL_12;
      }
      if (!a3) {
        goto LABEL_7;
      }
      goto LABEL_11;
    }
  }
  id v9 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_7:
    _HKLogDroppedError();
    goto LABEL_12;
  }
LABEL_11:
  id v9 = v9;
  *a3 = v9;
LABEL_12:

  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (BOOL)loggedDuplicatedSample
{
  return self->_loggedDuplicatedSample;
}

- (NSError)unitTesting_DuplicateSampleError
{
  return self->_unitTesting_DuplicateSampleError;
}

- (void).cxx_destruct
{
}

@end