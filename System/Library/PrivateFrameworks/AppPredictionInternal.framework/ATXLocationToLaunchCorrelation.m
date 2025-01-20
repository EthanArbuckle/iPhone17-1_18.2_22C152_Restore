@interface ATXLocationToLaunchCorrelation
+ (BOOL)supportsSecureCoding;
+ (double)_launchProbabilityForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5 locationTotals:(id)a6;
+ (double)_totalLaunchesAtLocation:(id)a3 locationTotals:(id)a4;
+ (double)_totalLaunchesForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5;
- (ATXLocationToLaunchCorrelation)init;
- (ATXLocationToLaunchCorrelation)initWithCoder:(id)a3;
- (ATXLocationToLaunchCorrelation)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4;
- (double)launchProbabilityForEvent:(id)a3 atLocation:(id)a4;
- (double)launchProbabilityForEvent:(id)a3 atLocationsWithProbabilities:(id)a4;
- (double)totalLaunches;
- (double)totalLaunchesAtLocation:(id)a3;
- (double)totalLaunchesForEvent:(id)a3 atLocation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addVisitForLocation:(id)a3 event:(id)a4 value:(double)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXLocationToLaunchCorrelation

- (ATXLocationToLaunchCorrelation)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXLocationToLaunchCorrelation *)self initWithCorrelationMatrix:v3 locationTotals:v4];

  return v5;
}

- (ATXLocationToLaunchCorrelation)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXLocationToLaunchCorrelation;
  v8 = [(ATXLocationToLaunchCorrelation *)&v13 init];
  if (v8)
  {
    v9 = [[ATXCorrelationMatrixGuardedData alloc] initWithCorrelationMatrix:v6 locationTotals:v7];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    lock = v8->_lock;
    v8->_lock = (_PASLock *)v10;
  }
  return v8;
}

- (void)addVisitForLocation:(id)a3 event:(id)a4 value:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__ATXLocationToLaunchCorrelation_addVisitForLocation_event_value___block_invoke;
  v13[3] = &unk_1E68AE5A8;
  id v14 = v8;
  id v15 = v9;
  double v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(_PASLock *)lock runWithLockAcquired:v13];
}

void __66__ATXLocationToLaunchCorrelation_addVisitForLocation_event_value___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [v15[1] objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (!v3)
  {
    v4 = objc_opt_new();
    [v15[1] setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
  }
  v5 = NSNumber;
  id v6 = [v15[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v7 doubleValue];
  id v9 = [v5 numberWithDouble:v8 + *(double *)(a1 + 48)];
  uint64_t v10 = [v15[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];

  id v11 = NSNumber;
  id v12 = [v15[2] objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v12 doubleValue];
  id v14 = [v11 numberWithDouble:v13 + *(double *)(a1 + 48)];
  [v15[2] setObject:v14 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (double)launchProbabilityForEvent:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocation___block_invoke;
  v13[3] = &unk_1E68AE5D0;
  double v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(_PASLock *)lock runWithLockAcquired:v13];
  double v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __71__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocation___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:a1[4] atLocation:a1[5] correlationMatrix:*(void *)(a2 + 8) locationTotals:*(void *)(a2 + 16)];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  return result;
}

- (double)totalLaunchesForEvent:(id)a3 atLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ATXLocationToLaunchCorrelation_totalLaunchesForEvent_atLocation___block_invoke;
  v13[3] = &unk_1E68AE5D0;
  double v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(_PASLock *)lock runWithLockAcquired:v13];
  double v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __67__ATXLocationToLaunchCorrelation_totalLaunchesForEvent_atLocation___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = +[ATXLocationToLaunchCorrelation _totalLaunchesForEvent:a1[4] atLocation:a1[5] correlationMatrix:*(void *)(a2 + 8)];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v4;
  return result;
}

- (double)totalLaunchesAtLocation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ATXLocationToLaunchCorrelation_totalLaunchesAtLocation___block_invoke;
  v9[3] = &unk_1E68AE5F8;
  double v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __58__ATXLocationToLaunchCorrelation_totalLaunchesAtLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = +[ATXLocationToLaunchCorrelation _totalLaunchesAtLocation:*(void *)(a1 + 32) locationTotals:*(void *)(a2 + 16)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (double)totalLaunches
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__ATXLocationToLaunchCorrelation_totalLaunches__block_invoke;
  v5[3] = &unk_1E68AE620;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __47__ATXLocationToLaunchCorrelation_totalLaunches__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3[2];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(v3[2], "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
        [v9 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (double)launchProbabilityForEvent:(id)a3 atLocationsWithProbabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocationsWithProbabilities___block_invoke;
  v13[3] = &unk_1E68AE648;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  uint64_t v16 = &v17;
  [(_PASLock *)lock runWithLockAcquired:v13];
  double v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __89__ATXLocationToLaunchCorrelation_launchProbabilityForEvent_atLocationsWithProbabilities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (void)v14);
        [v10 doubleValue];
        double v12 = v11;

        if (v12 != 0.0)
        {
          +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:*(void *)(a1 + 40) atLocation:v9 correlationMatrix:v3[1] locationTotals:v3[2]];
          *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48)
                                                                                              + 8)
                                                                                  + 24)
                                                                      + v12 * v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXLocationToLaunchCorrelation)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  double v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  long long v14 = [v5 decodeObjectOfClasses:v9 forKey:@"correlationMatrix"];
  long long v15 = [v5 decodeObjectOfClasses:v13 forKey:@"locationTotals"];

  long long v16 = [(ATXLocationToLaunchCorrelation *)self initWithCorrelationMatrix:v14 locationTotals:v15];
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ATXLocationToLaunchCorrelation_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E68AE670;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __50__ATXLocationToLaunchCorrelation_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2[1];
  id v5 = a2;
  [v3 encodeObject:v4 forKey:@"correlationMatrix"];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = v5[2];

  return [v6 encodeObject:v7 forKey:@"locationTotals"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__30;
  uint64_t v11 = __Block_byref_object_dispose__30;
  id v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ATXLocationToLaunchCorrelation_copyWithZone___block_invoke;
  v6[3] = &unk_1E68AE698;
  v6[4] = &v7;
  v6[5] = a3;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__ATXLocationToLaunchCorrelation_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v3[1], "objectForKeyedSubscript:", v10, (void)v18);
        id v12 = (void *)[v11 mutableCopy];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  double v13 = +[ATXLocationToLaunchCorrelation allocWithZone:*(void *)(a1 + 40)];
  long long v14 = (void *)[v3[2] mutableCopy];
  uint64_t v15 = [(ATXLocationToLaunchCorrelation *)v13 initWithCorrelationMatrix:v4 locationTotals:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

+ (double)_launchProbabilityForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5 locationTotals:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [a5 objectForKeyedSubscript:v10];
  double v13 = [v12 objectForKeyedSubscript:v11];

  [v13 doubleValue];
  double v15 = v14;

  uint64_t v16 = [v9 objectForKeyedSubscript:v10];

  [v16 doubleValue];
  double v18 = v17;

  if (v15 <= v18)
  {
    double result = 0.0;
    if (v18 > 0.0) {
      return v15 / v18;
    }
  }
  else
  {
    long long v19 = __atxlog_handle_default();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ATXLocationToLaunchCorrelation _launchProbabilityForEvent:atLocation:correlationMatrix:locationTotals:](v19);
    }

    return 0.0;
  }
  return result;
}

+ (double)_totalLaunchesForEvent:(id)a3 atLocation:(id)a4 correlationMatrix:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [a5 objectForKeyedSubscript:a4];
  id v9 = [v8 objectForKeyedSubscript:v7];

  [v9 doubleValue];
  double v11 = v10;

  return v11;
}

+ (double)_totalLaunchesAtLocation:(id)a3 locationTotals:(id)a4
{
  id v4 = [a4 objectForKeyedSubscript:a3];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void).cxx_destruct
{
}

+ (void)_launchProbabilityForEvent:(os_log_t)log atLocation:correlationMatrix:locationTotals:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Numerator should never be higher than denominator. There cannot be more launches at a location for a specific event than for all events at that location", v1, 2u);
}

@end