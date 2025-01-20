@interface HDQuantitySampleAttenuationProvider
- (HDQuantitySampleAttenuationProvider)initWithQuantityType:(id)a3 profile:(id)a4;
- (int64_t)loadAttenuationSamples:(id *)a3 anchorTime:(double)a4 errorOut:(id *)a5;
@end

@implementation HDQuantitySampleAttenuationProvider

- (HDQuantitySampleAttenuationProvider)initWithQuantityType:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDQuantitySampleAttenuationProvider;
  v9 = [(HDQuantitySampleAttenuationProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_quantityType, a3);
    objc_storeStrong((id *)&v10->_profile, a4);
    v11 = [[HDQuantitySampleOverlapProcessor alloc] initWithOverlapFunction:0];
    overlapProcessor = v10->_overlapProcessor;
    v10->_overlapProcessor = v11;
  }
  return v10;
}

- (int64_t)loadAttenuationSamples:(id *)a3 anchorTime:(double)a4 errorOut:(id *)a5
{
  v48[3] = *MEMORY[0x1E4F143B8];
  -[HDQuantitySampleOverlapProcessor resetAnchorTime:](self->_overlapProcessor, "resetAnchorTime:");
  id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a4];
  v35 = HDSampleEntityPredicateForDataType(self->_quantityType);
  v34 = HDSampleEntityPredicateForEndDate(5);
  v36 = [(HKQuantityType *)self->_quantityType _earliestAllowedStartDateForSampleOverlappingDate:v8];
  v9 = HDSampleEntityPredicateForStartDate(5);
  v10 = (void *)MEMORY[0x1E4F65D08];
  v48[0] = v35;
  v48[1] = v34;
  v48[2] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  v12 = [v10 predicateMatchingAllPredicates:v11];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  profile = self->_profile;
  v38[7] = a3;
  id v39 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __82__HDQuantitySampleAttenuationProvider_loadAttenuationSamples_anchorTime_errorOut___block_invoke;
  v38[3] = &unk_1E62FAA60;
  *(double *)&v38[6] = a4;
  v38[4] = self;
  v38[5] = &v40;
  LOBYTE(v10) = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v12 profile:profile options:4 error:&v39 handler:v38];
  id v14 = v39;
  v15 = v14;
  if ((v10 & 1) == 0)
  {
    id v26 = v14;
    v27 = v26;
    if (v26)
    {
      if (a5) {
        *a5 = v26;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v30 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = v27;
      _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", buf, 0xCu);
    }
LABEL_26:
    int64_t v16 = -1;
    goto LABEL_27;
  }
  int64_t v16 = v41[3];
  if (v16 <= 1023)
  {
    v17 = 0;
    while (1)
    {
      overlapProcessor = self->_overlapProcessor;
      id v37 = v17;
      uint64_t v19 = [(HDQuantitySampleOverlapProcessor *)overlapProcessor finishWithRemainingSamples:buf error:&v37];
      id v20 = v37;

      if (v19 == -1) {
        break;
      }
      if (!v19)
      {

        int64_t v16 = v41[3];
        goto LABEL_27;
      }
      v17 = v20;
      if (v19 >= 1)
      {
        v21 = v41;
        uint64_t v22 = v41[3];
        v23 = buf;
        do
        {
          if (v22 <= 1023)
          {
            v24 = &a3[v22];
            long long v25 = *((_OWORD *)v23 + 1);
            *(_OWORD *)&v24->var0 = *(_OWORD *)v23;
            *(_OWORD *)&v24->var2 = v25;
            v24->var4 = *((void *)v23 + 4);
            uint64_t v22 = v21[3] + 1;
            v21[3] = v22;
          }
          v23 += 40;
          --v19;
        }
        while (v19);
        v17 = v20;
      }
    }
    id v28 = v20;
    v29 = v28;
    if (v28)
    {
      if (a5) {
        *a5 = v28;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v31 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138543362;
      v45 = v29;
      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "Unable to fetch hearing protection samples: %{public}@", v44, 0xCu);
    }

    goto LABEL_26;
  }
LABEL_27:
  _Block_object_dispose(&v40, 8);

  return v16;
}

uint64_t __82__HDQuantitySampleAttenuationProvider_loadAttenuationSamples_anchorTime_errorOut___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 48) <= a6)
  {
    int64_t v16 = *(void **)(*(void *)(a1 + 32) + 24);
    v29[4] = 0;
    id v30 = 0;
    *(double *)v29 = a5;
    *(double *)&v29[1] = a6;
    *(double *)&v29[2] = a4;
    v29[3] = 0;
    uint64_t v17 = [v16 addSample:v29 outputSamples:v31 error:&v30];
    id v18 = v30;
    uint64_t v19 = v18;
    if (v17 == -1)
    {
      id v27 = v18;
      if (v27)
      {
        if (a13) {
          *a13 = v27;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      if (v17 < 1)
      {
        BOOL v13 = 1;
LABEL_17:

        return v13;
      }
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v20 <= 1023)
      {
        v21 = v31;
        uint64_t v22 = 1;
        do
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)(a1 + 56) + 40 * v20;
          long long v25 = *(_OWORD *)v21;
          long long v26 = *((_OWORD *)v21 + 1);
          *(void *)(v24 + 32) = *((void *)v21 + 4);
          *(_OWORD *)uint64_t v24 = v25;
          *(_OWORD *)(v24 + 16) = v26;
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          if (v17 == v22) {
            break;
          }
          uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          v21 += 40;
          ++v22;
        }
        while (v20 <= 1023);
        BOOL v13 = v23 >= v17;
        goto LABEL_17;
      }
    }
    BOOL v13 = 0;
    goto LABEL_17;
  }
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlapProcessor, 0);
  objc_storeStrong((id *)&self->_profile, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end