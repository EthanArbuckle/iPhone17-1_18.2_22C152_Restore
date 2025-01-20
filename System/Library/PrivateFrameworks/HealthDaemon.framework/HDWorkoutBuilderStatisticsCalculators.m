@interface HDWorkoutBuilderStatisticsCalculators
+ (BOOL)supportsSecureCoding;
- (HDWorkoutBuilderStatisticsCalculators)init;
- (HDWorkoutBuilderStatisticsCalculators)initWithCoder:(id)a3;
- (id)allQuantityTypes;
- (id)calculatorForQuantityType:(id)a3 activityUUID:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCalculatorsForActivityUUID:(id)a3 handler:(id)a4;
- (void)enumerateCalculatorsForQuantityType:(id)a3 handler:(id)a4;
- (void)enumerateCalculatorsWithHandler:(id)a3;
- (void)setCalculator:(id)a3 forQuantityType:(id)a4 activityUUID:(id)a5;
@end

@implementation HDWorkoutBuilderStatisticsCalculators

- (HDWorkoutBuilderStatisticsCalculators)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDWorkoutBuilderStatisticsCalculators;
  v2 = [(HDWorkoutBuilderStatisticsCalculators *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    calculatorsByTypeAndActivityUUID = v2->_calculatorsByTypeAndActivityUUID;
    v2->_calculatorsByTypeAndActivityUUID = v3;
  }
  return v2;
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID description];
}

- (id)allQuantityTypes
{
  return (id)[(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID allKeys];
}

- (id)calculatorForQuantityType:(id)a3 activityUUID:(id)a4
{
  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)calculatorsByTypeAndActivityUUID objectForKeyedSubscript:a3];
  v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)setCalculator:(id)a3 forQuantityType:(id)a4 activityUUID:(id)a5
{
  id v14 = a4;
  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  id v9 = a5;
  id v10 = a3;
  v11 = [(NSMutableDictionary *)calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v14];

  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID setObject:v12 forKeyedSubscript:v14];
  }
  v13 = [(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v14];
  [v13 setObject:v10 forKeyedSubscript:v9];
}

- (void)enumerateCalculatorsWithHandler:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, void *, uint64_t, uint64_t))a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v21 = self;
  v5 = self->_calculatorsByTypeAndActivityUUID;
  uint64_t v18 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v18)
  {
    uint64_t v6 = *(void *)v27;
    v20 = v5;
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v19 = v7;
        uint64_t v8 = *(void *)(*((void *)&v26 + 1) + 8 * v7);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [(NSMutableDictionary *)v21->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              v15 = [(NSMutableDictionary *)v21->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v8];
              v16 = [v15 objectForKeyedSubscript:v14];
              LODWORD(v14) = v4[2](v4, v16, v8, v14);

              if (!v14)
              {

                v5 = v20;
                goto LABEL_18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v19 + 1;
        v5 = v20;
        uint64_t v6 = v17;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [(NSMutableDictionary *)v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v18);
  }
LABEL_18:
}

- (void)enumerateCalculatorsForQuantityType:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (uint64_t (**)(id, void *, void))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v6];
  uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      v13 = [(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v6];
      uint64_t v14 = [v13 objectForKeyedSubscript:v12];
      LODWORD(v12) = v7[2](v7, v14, v12);

      if (!v12) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateCalculatorsForActivityUUID:(id)a3 handler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (unsigned int (**)(id, void *, void))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = self->_calculatorsByTypeAndActivityUUID;
  uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = [(NSMutableDictionary *)self->_calculatorsByTypeAndActivityUUID objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 objectForKeyedSubscript:v6];

        if (v14 && !v7[2](v7, v14, v12))
        {

          goto LABEL_12;
        }
      }
      uint64_t v9 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  calculatorsByTypeAndActivityUUID = self->_calculatorsByTypeAndActivityUUID;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)calculatorsByTypeAndActivityUUID hk_map:&__block_literal_global_209];
  [v4 encodeObject:v5 forKey:@"calculators"];
}

void __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke_2;
  v10[3] = &unk_1E630A088;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = a4;
  uint64_t v9 = objc_msgSend(a3, "hk_map:", v10);
  v8[2](v8, v7, v9);
}

void __57__HDWorkoutBuilderStatisticsCalculators_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a4;
  id v13 = 0;
  uint64_t v9 = [a3 archivedRepresentationWithError:&v13];
  id v10 = v13;
  if (v9)
  {
    v8[2](v8, v7, v9);
  }
  else
  {
    _HKInitializeLogging();
    id v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to archive statistics calculator for type %{public}@ and activity %{public}@, %{public}@", buf, 0x20u);
    }
  }
}

- (HDWorkoutBuilderStatisticsCalculators)initWithCoder:(id)a3
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)HDWorkoutBuilderStatisticsCalculators;
  id v5 = [(HDWorkoutBuilderStatisticsCalculators *)&v48 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v59[0] = objc_opt_class();
    v59[1] = objc_opt_class();
    v59[2] = objc_opt_class();
    v59[3] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
    uint64_t v8 = [v6 setWithArray:v7];

    v36 = (void *)v8;
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"calculators"];
    unint64_t v10 = 0x1E4F1C000uLL;
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    calculatorsByTypeAndActivityUUID = v5->_calculatorsByTypeAndActivityUUID;
    v5->_calculatorsByTypeAndActivityUUID = v11;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = v9;
    uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v32)
    {
      uint64_t v13 = *(void *)v45;
      v34 = v5;
      id v35 = v4;
      uint64_t v31 = *(void *)v45;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v14;
          uint64_t v15 = *(void *)(*((void *)&v44 + 1) + 8 * v14);
          id v16 = objc_alloc_init(*(Class *)(v10 + 2656));
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v37 = [obj objectForKeyedSubscript:v15];
          uint64_t v17 = [v37 countByEnumeratingWithState:&v40 objects:v57 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v41;
            while (2)
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v41 != v19) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * v20);
                long long v22 = [obj objectForKeyedSubscript:v15];
                long long v23 = [v22 objectForKeyedSubscript:v21];
                id v39 = 0;
                long long v24 = +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:v23 error:&v39];
                id v25 = v39;

                if (!v24)
                {
                  _HKInitializeLogging();
                  long long v27 = (void *)*MEMORY[0x1E4F29FB8];
                  id v5 = v34;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
                  {
                    long long v29 = v27;
                    uint64_t v30 = objc_opt_class();
                    *(_DWORD *)buf = 138544130;
                    uint64_t v50 = v30;
                    __int16 v51 = 2114;
                    uint64_t v52 = v15;
                    __int16 v53 = 2114;
                    uint64_t v54 = v21;
                    __int16 v55 = 2114;
                    id v56 = v25;
                    _os_log_error_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_ERROR, "%{public}@: Unable to unarchive calculator for type %{public}@ and activity %{public}@: %{public}@", buf, 0x2Au);
                  }
                  long long v26 = 0;
                  id v4 = v35;
                  goto LABEL_22;
                }
                [v16 setObject:v24 forKeyedSubscript:v21];

                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v37 countByEnumeratingWithState:&v40 objects:v57 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          id v5 = v34;
          [(NSMutableDictionary *)v34->_calculatorsByTypeAndActivityUUID setObject:v16 forKeyedSubscript:v15];

          uint64_t v14 = v33 + 1;
          id v4 = v35;
          unint64_t v10 = 0x1E4F1C000;
          uint64_t v13 = v31;
        }
        while (v33 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v32);
    }
  }
  long long v26 = v5;
LABEL_22:

  return v26;
}

- (void).cxx_destruct
{
}

@end