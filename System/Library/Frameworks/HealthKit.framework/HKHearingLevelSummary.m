@interface HKHearingLevelSummary
+ (HKHearingLevelSummary)emptySummary;
+ (id)_roundWithPositiveZeroForSensitivity:(uint64_t)a1;
+ (id)summaryForAudiogramSample:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKHearingLevelMetrics)leftEarMetrics;
- (HKHearingLevelMetrics)overallMetrics;
- (HKHearingLevelMetrics)rightEarMetrics;
- (HKHearingLevelSummary)initWithLeftEarMetrics:(id)a3 rightEarMetrics:(id)a4;
- (id)description;
- (uint64_t)isEqualToHearingLevelSummary:(void *)a1;
- (unint64_t)hash;
@end

@implementation HKHearingLevelSummary

- (HKHearingLevelSummary)initWithLeftEarMetrics:(id)a3 rightEarMetrics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHearingLevelSummary;
  v9 = [(HKHearingLevelSummary *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_leftEarMetrics, a3);
    objc_storeStrong((id *)&v10->_rightEarMetrics, a4);
    uint64_t v11 = +[HKHearingLevelMetrics _overallMetricsFromLeftEarMetrics:rightEarMetrics:]((uint64_t)HKHearingLevelMetrics, v7, v8);
    overallMetrics = v10->_overallMetrics;
    v10->_overallMetrics = (HKHearingLevelMetrics *)v11;
  }
  return v10;
}

+ (HKHearingLevelSummary)emptySummary
{
  self;
  v0 = [[HKHearingLevelSummary alloc] initWithLeftEarMetrics:0 rightEarMetrics:0];

  return v0;
}

+ (id)summaryForAudiogramSample:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 sensitivityPoints];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v54 = a1;
    id v7 = +[HKUnit decibelHearingLevelUnit];
    id v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:1.79769313e308];

    v9 = +[HKUnit decibelHearingLevelUnit];
    v10 = +[HKQuantity quantityWithUnit:v9 doubleValue:-1.79769313e308];

    id v11 = v8;
    id v12 = v10;
    v59 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    id v13 = v11;
    id v14 = v12;
    v58 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v55 = v4;
    id obj = [v4 sensitivityPoints];
    v64 = v14;
    v15 = v13;
    v56 = v14;
    v57 = v13;
    uint64_t v62 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v62)
    {
      uint64_t v61 = *(void *)v67;
      v64 = v14;
      v15 = v13;
      do
      {
        for (uint64_t i = 0; i != v62; ++i)
        {
          if (*(void *)v67 != v61) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v18 = NSNumber;
          v19 = [v17 frequency];
          v20 = +[HKUnit hertzUnit];
          [v19 doubleValueForUnit:v20];
          v65 = objc_msgSend(v18, "numberWithDouble:");

          v21 = [v17 tests];
          v22 = objc_msgSend(v21, "hk_filter:", &__block_literal_global_22);

          v23 = [v17 tests];
          v24 = objc_msgSend(v23, "hk_filter:", &__block_literal_global_67);

          if ([v22 count])
          {
            v25 = [v22 firstObject];
            v26 = [v25 clampedSensitivity];
            v27 = v26;
            if (v26)
            {
              id v28 = v26;
            }
            else
            {
              v29 = [v22 firstObject];
              id v28 = [v29 sensitivity];
            }
            v30 = +[HKHearingLevelSummary _roundWithPositiveZeroForSensitivity:]((uint64_t)HKHearingLevelSummary, v28);
            uint64_t v31 = HKQuantityMin(v13, v30);

            uint64_t v32 = HKQuantityMax(v14, v30);

            v33 = HKHearingLevelClassificationPureToneAverageFrequencies();
            int v34 = [v33 containsObject:v65];

            if (v34) {
              [v59 addObject:v30];
            }

            id v14 = (id)v32;
            id v13 = (id)v31;
          }
          if ([v24 count])
          {
            id v63 = v13;
            v35 = [v24 firstObject];
            v36 = [v35 clampedSensitivity];
            v37 = v36;
            id v38 = v14;
            if (v36)
            {
              id v39 = v36;
            }
            else
            {
              v40 = [v24 firstObject];
              id v39 = [v40 sensitivity];
            }
            v41 = +[HKHearingLevelSummary _roundWithPositiveZeroForSensitivity:]((uint64_t)HKHearingLevelSummary, v39);
            uint64_t v42 = HKQuantityMin(v15, v41);

            uint64_t v43 = HKQuantityMax(v64, v41);

            v44 = HKHearingLevelClassificationPureToneAverageFrequencies();
            int v45 = [v44 containsObject:v65];

            if (v45) {
              [v58 addObject:v41];
            }

            v64 = (void *)v43;
            v15 = (void *)v42;
            id v14 = v38;
            id v13 = v63;
          }
        }
        uint64_t v62 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v62);
    }

    v46 = HKPureToneAverageFromPureToneSensitivityPoints(v59);
    v47 = HKPureToneAverageFromPureToneSensitivityPoints(v58);
    v48 = +[HKHearingLevelSummary _roundWithPositiveZeroForSensitivity:]((uint64_t)v54, v46);

    v49 = +[HKHearingLevelSummary _roundWithPositiveZeroForSensitivity:]((uint64_t)v54, v47);

    v50 = [[HKHearingLevelMetrics alloc] initWithAverageSensitivity:v48 minimumSensitivity:v13 maximumSensitivity:v14];
    v51 = [[HKHearingLevelMetrics alloc] initWithAverageSensitivity:v49 minimumSensitivity:v15 maximumSensitivity:v64];
    v52 = [[HKHearingLevelSummary alloc] initWithLeftEarMetrics:v50 rightEarMetrics:v51];

    id v4 = v55;
  }
  else
  {
    +[HKHearingLevelSummary emptySummary]();
    v52 = (HKHearingLevelSummary *)objc_claimAutoreleasedReturnValue();
  }

  return v52;
}

BOOL __51__HKHearingLevelSummary_summaryForAudiogramSample___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 0;
  }

  return v3;
}

BOOL __51__HKHearingLevelSummary_summaryForAudiogramSample___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type]) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = [v2 side] == 1;
  }

  return v3;
}

+ (id)_roundWithPositiveZeroForSensitivity:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (v2)
  {
    [v2 _value];
    double v4 = round(v3);
    if (v4 == 0.0)
    {
      [v2 _value];
      double v5 = fabs(v4);
      if (v6 < 0.0) {
        double v4 = v5;
      }
    }
    id v7 = [v2 _unit];
    id v8 = +[HKQuantity quantityWithUnit:v7 doubleValue:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (HKHearingLevelSummary *)a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = -[HKHearingLevelSummary isEqualToHearingLevelSummary:](self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToHearingLevelSummary:(void *)a1
{
  id v4 = a2;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_29;
  }
  double v5 = [a1 leftEarMetrics];
  char v6 = [v4 leftEarMetrics];
  if (v5 != v6)
  {
    uint64_t v7 = [v4 leftEarMetrics];
    if (!v7)
    {
      uint64_t v16 = 0;
      goto LABEL_28;
    }
    id v2 = (void *)v7;
    id v8 = [a1 leftEarMetrics];
    v9 = [v4 leftEarMetrics];
    if (![v8 isEqual:v9])
    {
      uint64_t v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v31 = v9;
    uint64_t v32 = v8;
  }
  v10 = [a1 rightEarMetrics];
  id v11 = [v4 rightEarMetrics];
  if (v10 != v11)
  {
    uint64_t v12 = [v4 rightEarMetrics];
    if (v12)
    {
      id v13 = (void *)v12;
      id v14 = [a1 rightEarMetrics];
      v15 = [v4 rightEarMetrics];
      if ([v14 isEqual:v15])
      {
        v27 = v15;
        id v28 = v14;
        v29 = v13;
        goto LABEL_11;
      }
    }
    uint64_t v16 = 0;
LABEL_23:
    BOOL v24 = v5 == v6;
    goto LABEL_26;
  }
LABEL_11:
  v17 = [a1 overallMetrics];
  uint64_t v18 = [v4 overallMetrics];
  uint64_t v16 = v17 == (void *)v18;
  if (v17 == (void *)v18)
  {

LABEL_20:
    if (v10 != v11)
    {
    }
    goto LABEL_23;
  }
  v19 = (void *)v18;
  v30 = v10;
  uint64_t v20 = [v4 overallMetrics];
  if (!v20)
  {

    goto LABEL_20;
  }
  v21 = (void *)v20;
  v26 = v2;
  v22 = [a1 overallMetrics];
  v23 = [v4 overallMetrics];
  uint64_t v16 = [v22 isEqual:v23];

  if (v30 == v11)
  {
  }
  else
  {
  }
  BOOL v24 = v5 == v6;
  id v2 = v26;
LABEL_26:
  v9 = v31;
  id v8 = v32;
  if (!v24) {
    goto LABEL_27;
  }
LABEL_28:

LABEL_29:
  return v16;
}

- (id)description
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  char v6 = [(HKHearingLevelSummary *)self overallMetrics];
  uint64_t v7 = [(HKHearingLevelSummary *)self leftEarMetrics];
  id v8 = [(HKHearingLevelSummary *)self rightEarMetrics];
  v9 = [v3 stringWithFormat:@"<%@:%p overall = %@, left ear = %@, right ear = %@>", v5, self, v6, v7, v8];

  return v9;
}

- (HKHearingLevelMetrics)overallMetrics
{
  return self->_overallMetrics;
}

- (HKHearingLevelMetrics)leftEarMetrics
{
  return self->_leftEarMetrics;
}

- (HKHearingLevelMetrics)rightEarMetrics
{
  return self->_rightEarMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightEarMetrics, 0);
  objc_storeStrong((id *)&self->_leftEarMetrics, 0);

  objc_storeStrong((id *)&self->_overallMetrics, 0);
}

@end