@interface _DKPredictionTimeline
+ (BOOL)supportsSecureCoding;
+ (id)predictionUnavailable;
+ (id)timelineWithValues:(id)a3 eachWithDuration:(double)a4 startingAt:(id)a5;
+ (id)timelineWithValues:(id)a3 forDurations:(id)a4 startingAt:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnavailable;
- (NSArray)transitionDates;
- (NSDate)endDate;
- (NSDate)startDate;
- (_DKHistogram)endHistogram;
- (_DKHistogram)startHistogram;
- (_DKPredictionTimeline)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initWithValues:(void *)a3 eachWithDuration:(double)a4 startingAt:;
- (id)largestDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5;
- (id)nextDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5;
- (id)valueAtDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithValues:(void *)a3 forDurations:(void *)a4 startingAt:;
- (void)setEndHistogram:(id)a3;
- (void)setStartDate:(uint64_t)a1;
- (void)setStartHistogram:(id)a3;
@end

@implementation _DKPredictionTimeline

- (id)valueAtDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSDate *)self->_startDate timeIntervalSinceDate:v4];
  if (v5 <= 0.0)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_transitionDates;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10 + v9;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "timeIntervalSinceDate:", v4, (void)v16);
          if (v14 > 0.0)
          {
            v6 = [(NSArray *)self->_values objectAtIndexedSubscript:v10 + v12];
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    v6 = 0;
LABEL_13:
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isUnavailable
{
  return [(NSArray *)self->_values count] == 0;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (_DKPredictionTimeline)initWithCoder:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192FB2F20]();
  id v50 = objc_alloc_init((Class)objc_opt_class());
  v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"start"];
  double v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
  uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"values"];
  if ([v12 count])
  {
    uint64_t v13 = [v12 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v46 = v11;
      v47 = self;
      id v48 = v4;
      v15 = [MEMORY[0x1E4F1CA48] array];
      long long v16 = [v12 firstObject];
      id v17 = (id)[v16 mutableCopy];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obuint64_t j = v12;
      uint64_t v18 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v60 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x192FB2F20]();
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __39___DKPredictionTimeline_initWithCoder___block_invoke;
            v57[3] = &unk_1E560E620;
            id v24 = v17;
            id v58 = v24;
            [v22 enumerateKeysAndObjectsUsingBlock:v57];
            v25 = (void *)[v24 copy];
            [v15 addObject:v25];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
        }
        while (v19);
      }

      uint64_t v12 = (void *)[v15 copy];
      uint64_t v11 = v46;
      self = v47;
    }
    else
    {
      v26 = [v12 firstObject];
      objc_opt_class();
      char v27 = objc_opt_isKindOfClass();

      if ((v27 & 1) == 0) {
        goto LABEL_21;
      }
      id v48 = v4;
      v15 = [MEMORY[0x1E4F1CA48] array];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v17 = v12;
      uint64_t v28 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v54 != v30) {
              objc_enumerationMutation(v17);
            }
            v32 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            v33 = (void *)MEMORY[0x192FB2F20]();
            v34 = objc_msgSend(v32, "dk_dedup");
            [v15 addObject:v34];
          }
          uint64_t v29 = [v17 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v29);
      }

      uint64_t v12 = (void *)[v15 copy];
    }

    id v4 = v48;
  }
LABEL_21:
  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);

  v38 = [v4 decodeObjectOfClasses:v37 forKey:@"transitions"];
  v39 = (void *)[v38 mutableCopy];

  if ([v39 count])
  {
    unint64_t v40 = 0;
    do
    {
      v41 = [v39 objectAtIndexedSubscript:v40];
      v42 = objc_msgSend(v41, "dk_dedup");
      [v39 setObject:v42 atIndexedSubscript:v40];

      ++v40;
    }
    while (v40 < [v39 count]);
  }
  v43 = 0;
  if (v49 && v12 && v39)
  {
    -[_DKPredictionTimeline setStartDate:]((uint64_t)v50, v49);
    -[_DKSyncType setXpcActivity:]((uint64_t)v50, v12);
    v44 = (void *)[v39 copy];
    -[_DKSyncWindow setStartDate:]((uint64_t)v50, v44);

    v43 = (_DKPredictionTimeline *)v50;
  }

  return v43;
}

- (void)setStartDate:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

+ (id)predictionUnavailable
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___DKPredictionTimeline_predictionUnavailable__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (predictionUnavailable_onceToken != -1) {
    dispatch_once(&predictionUnavailable_onceToken, block);
  }
  v2 = (void *)predictionUnavailable_prediction;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_endHistogram, 0);
  objc_storeStrong((id *)&self->_startHistogram, 0);
  objc_storeStrong((id *)&self->_transitionDates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"start"];
  [v5 encodeObject:self->_values forKey:@"values"];
  [v5 encodeObject:self->_transitionDates forKey:@"transitions"];
}

- (void)initWithValues:(void *)a3 forDurations:(void *)a4 startingAt:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)_DKPredictionTimeline;
    id v10 = objc_msgSendSuper2(&v31, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 1, a4);
      id v26 = v7;
      uint64_t v11 = [v7 copy];
      uint64_t v12 = (void *)a1[5];
      a1[5] = v11;

      uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v14 = v8;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        double v18 = 0.0;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * v19) doubleValue];
            double v18 = v18 + v20;
            uint64_t v21 = [v9 dateByAddingTimeInterval:v18];
            v22 = objc_msgSend(v21, "dk_dedup");
            [v13 addObject:v22];

            ++v19;
          }
          while (v16 != v19);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v16);
      }

      uint64_t v23 = [v13 copy];
      id v24 = (void *)a1[2];
      a1[2] = v23;

      id v7 = v26;
    }
  }

  return a1;
}

- (id)initWithValues:(void *)a3 eachWithDuration:(double)a4 startingAt:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v28.receiver = a1;
    v28.super_class = (Class)_DKPredictionTimeline;
    a1 = (id *)objc_msgSendSuper2(&v28, sel_init);
    if (a1)
    {
      uint64_t v9 = objc_msgSend(v8, "dk_dedup");
      id v10 = a1[1];
      a1[1] = (id)v9;

      uint64_t v11 = (void *)[v7 mutableCopy];
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      id v13 = a1[1];
      if ((unint64_t)[v11 count] < 2)
      {
        double v15 = a4;
      }
      else
      {
        unint64_t v14 = 1;
        double v15 = a4;
        do
        {
          uint64_t v16 = [v11 objectAtIndexedSubscript:v14];
          uint64_t v17 = [v11 objectAtIndexedSubscript:v14 - 1];
          int v18 = [v16 isEqual:v17];

          if (v18)
          {
            double v15 = v15 + a4;
            [v11 removeObjectAtIndex:v14];
          }
          else
          {
            uint64_t v19 = [v13 dateByAddingTimeInterval:v15];
            uint64_t v20 = objc_msgSend(v19, "dk_dedup");

            [v12 addObject:v20];
            ++v14;
            double v15 = a4;
            id v13 = (id)v20;
          }
        }
        while (v14 < [v11 count]);
      }
      uint64_t v21 = [v13 dateByAddingTimeInterval:v15];
      v22 = objc_msgSend(v21, "dk_dedup");
      [v12 addObject:v22];

      uint64_t v23 = [v12 copy];
      id v24 = a1[2];
      a1[2] = (id)v23;

      uint64_t v25 = [v11 copy];
      id v26 = a1[5];
      a1[5] = (id)v25;
    }
  }

  return a1;
}

+ (id)timelineWithValues:(id)a3 forDurations:(id)a4 startingAt:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = -[_DKPredictionTimeline initWithValues:forDurations:startingAt:](objc_alloc((Class)a1), v10, v9, v8);

  return v11;
}

+ (id)timelineWithValues:(id)a3 eachWithDuration:(double)a4 startingAt:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = -[_DKPredictionTimeline initWithValues:eachWithDuration:startingAt:]((id *)objc_alloc((Class)a1), v9, v8, a4);

  return v10;
}

- (NSDate)endDate
{
  v2 = [(NSArray *)self->_transitionDates lastObject];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v5 = v4;

  return (NSDate *)v5;
}

- (id)largestDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(_DKPredictionTimeline *)self isUnavailable])
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:]();
    }
LABEL_12:

    uint64_t v21 = [MEMORY[0x1E4F1C9C8] distantFuture];
    int v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v23 = +[_CDDateRange periodWithStart:v21 end:v18];
    goto LABEL_13;
  }
  id v10 = [(NSArray *)self->_transitionDates lastObject];
  [v10 timeIntervalSinceDate:self->_startDate];
  double v12 = v11;

  if (v12 < a5)
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = [NSNumber numberWithDouble:a5];
      startDate = self->_startDate;
      double v15 = [(NSArray *)self->_transitionDates lastObject];
      *(_DWORD *)buf = 138412802;
      v46 = v13;
      __int16 v47 = 2112;
      id v48 = startDate;
      __int16 v49 = 2112;
      id v50 = v15;
      _os_log_error_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_ERROR, "Unable to satisfy minimum duration %@ between %@ and %@", buf, 0x20u);
    }
    goto LABEL_12;
  }
  uint64_t v16 = [(NSArray *)self->_values firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:]((uint64_t *)&self->_values, v9);
    }
    goto LABEL_12;
  }
  int v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_startDate];
  [v18 addObjectsFromArray:self->_transitionDates];
  if ([v18 count] == 1)
  {
    uint64_t v19 = 0;
    id v20 = 0;
    uint64_t v21 = 0;
    double v22 = 0.0;
    goto LABEL_40;
  }
  unint64_t v25 = 0;
  id v26 = 0;
  id v20 = 0;
  v44 = 0;
  double v27 = 0.0;
  double v22 = 0.0;
  do
  {
    objc_super v28 = [v18 objectAtIndexedSubscript:v25];
    long long v29 = [v18 objectAtIndexedSubscript:v25 + 1];
    long long v30 = [(NSArray *)self->_values objectAtIndexedSubscript:v25];
    [v30 doubleValue];
    if (v31 < a3 || v31 > a4)
    {
      if (v20)
      {
        if (v27 > v22)
        {
          id v33 = v20;

          v44 = v33;
          double v22 = v27;
        }

        double v27 = 0.0;
      }
      v34 = v26;
      v35 = 0;
      id v20 = 0;
      id v26 = v28;
      if (!v34)
      {
LABEL_29:
        id v37 = v28;
        id v20 = v35;
        v34 = v26;
      }
    }
    else
    {
      [v29 timeIntervalSinceDate:v28];
      double v27 = v27 + v36;
      v35 = v28;
      v34 = v26;
      if (!v20) {
        goto LABEL_29;
      }
    }
    id v26 = v34;

    ++v25;
  }
  while (v25 < [v18 count] - 1);
  if (v27 <= 0.0 || v26 == 0)
  {
    BOOL v40 = v27 <= 0.0;
  }
  else
  {
    [v26 timeIntervalSinceDate:self->_startDate];
    double v27 = v27 + v39;
    BOOL v40 = v27 <= v22;
  }
  uint64_t v21 = v44;
  if (!v40)
  {
    id v20 = v20;

    uint64_t v21 = v20;
    double v22 = v27;
  }
  uint64_t v19 = v26;
LABEL_40:
  if (v22 >= a5)
  {
    uint64_t v23 = +[_CDDateRange periodWithStart:v21 duration:v22];
  }
  else
  {
    v41 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:]();
    }

    v42 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v43 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v23 = +[_CDDateRange periodWithStart:v42 end:v43];
  }
LABEL_13:

  return v23;
}

- (id)nextDateRangeWithValuesBetween:(double)a3 and:(double)a4 ofMinimumDuration:(double)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(_DKPredictionTimeline *)self isUnavailable])
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:]();
    }
LABEL_12:

    int v18 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v20 = [MEMORY[0x1E4F1C9C8] distantFuture];
    double v22 = +[_CDDateRange periodWithStart:v18 end:v20];
    goto LABEL_13;
  }
  id v10 = [(NSArray *)self->_transitionDates lastObject];
  [v10 timeIntervalSinceDate:self->_startDate];
  double v12 = v11;

  if (v12 < a5)
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v13 = [NSNumber numberWithDouble:a5];
      startDate = self->_startDate;
      double v15 = [(NSArray *)self->_transitionDates lastObject];
      *(_DWORD *)buf = 138412802;
      v43 = v13;
      __int16 v44 = 2112;
      v45 = startDate;
      __int16 v46 = 2112;
      __int16 v47 = v15;
      _os_log_error_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_ERROR, "Unable to satisfy minimum duration %@ between %@ and %@", buf, 0x20u);
    }
    goto LABEL_12;
  }
  p_values = (uint64_t *)&self->_values;
  uint64_t v16 = [(NSArray *)self->_values firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:](p_values, v9);
    }
    goto LABEL_12;
  }
  int v18 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_startDate];
  [v18 addObjectsFromArray:self->_transitionDates];
  if ([v18 count] == 1)
  {
    uint64_t v19 = 0;
    id v20 = 0;
    double v21 = 0.0;
    goto LABEL_35;
  }
  unint64_t v24 = 0;
  unint64_t v25 = 0;
  id v20 = 0;
  double v21 = 0.0;
  do
  {
    id v26 = [v18 objectAtIndexedSubscript:v24];
    double v27 = [v18 objectAtIndexedSubscript:v24 + 1];
    objc_super v28 = [(id)*p_values objectAtIndexedSubscript:v24];
    [v28 doubleValue];
    if (v29 < a3 || v29 > a4)
    {
      if (v20)
      {
        if (v21 >= a5)
        {
          double v22 = +[_CDDateRange periodWithStart:v20 duration:v21];

          goto LABEL_42;
        }

        double v21 = 0.0;
      }
      double v31 = 0;
      id v20 = 0;
      v32 = v26;
      if (!v25)
      {
LABEL_28:
        id v34 = v26;
        id v20 = v31;
        unint64_t v25 = v32;
      }
    }
    else
    {
      [v27 timeIntervalSinceDate:v26];
      double v21 = v21 + v33;
      double v31 = v26;
      v32 = v25;
      if (!v20) {
        goto LABEL_28;
      }
    }

    ++v24;
  }
  while (v24 < [v18 count] - 1);
  uint64_t v19 = v25;
  if (v21 > 0.0 && v25 != 0)
  {
    [v25 timeIntervalSinceDate:self->_startDate];
    double v37 = v21 + v38;
    if (v37 < a5) {
      goto LABEL_38;
    }
    double v36 = v20;
LABEL_44:
    double v22 = +[_CDDateRange periodWithStart:v36 duration:v37];
    goto LABEL_45;
  }
LABEL_35:
  unint64_t v25 = v19;
  if (v21 >= a5)
  {
    double v36 = v20;
    double v37 = v21;
    goto LABEL_44;
  }
LABEL_38:
  double v39 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    -[_DKPredictionTimeline largestDateRangeWithValuesBetween:and:ofMinimumDuration:]();
  }

  id v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
  BOOL v40 = [MEMORY[0x1E4F1C9C8] distantFuture];
  double v22 = +[_CDDateRange periodWithStart:v26 end:v40];

LABEL_42:
LABEL_45:

LABEL_13:
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[_DKPredictionTimeline setStartDate:]((uint64_t)v4, self->_startDate);
  id v5 = (void *)[(NSArray *)self->_values copy];
  -[_DKSyncType setXpcActivity:]((uint64_t)v4, v5);

  uint64_t v6 = (void *)[(NSArray *)self->_transitionDates copy];
  -[_DKSyncWindow setStartDate:]((uint64_t)v4, v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DKPredictionTimeline *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int v6 = [(_DKPredictionTimeline *)self isUnavailable];
      int v7 = [(_DKPredictionTimeline *)v5 isUnavailable];
      if (v6 && (v7 & 1) != 0)
      {
        char v8 = 1;
      }
      else if (v6 == v7)
      {
        startDate = self->_startDate;
        id v10 = [(_DKPredictionTimeline *)v5 startDate];
        if ([(NSDate *)startDate isEqual:v10])
        {
          values = self->_values;
          if (v5) {
            double v12 = v5->_values;
          }
          else {
            double v12 = 0;
          }
          id v13 = v12;
          if ([(NSArray *)values isEqual:v13])
          {
            transitionDates = self->_transitionDates;
            double v15 = [(_DKPredictionTimeline *)v5 transitionDates];
            char v8 = [(NSArray *)transitionDates isEqual:v15];
          }
          else
          {
            char v8 = 0;
          }
        }
        else
        {
          char v8 = 0;
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(_DKPredictionTimeline *)self isUnavailable])
  {
    uint64_t v16 = @"<_DKPrediction> [ Prediction Unavailable ]";
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28E78] stringWithUTF8String:"<_DKPrediction>: [\n"];
    v3 = self->_startDate;
    if (description_onceToken != -1) {
      dispatch_once(&description_onceToken, &__block_literal_global_63);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obuint64_t j = self->_transitionDates;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v18;
      do
      {
        uint64_t v8 = 0;
        id v9 = v3;
        do
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
          double v11 = [(id)description_formatter stringFromDate:v9];
          double v12 = [(id)description_formatter stringFromDate:v10];
          id v13 = [(NSArray *)self->_values objectAtIndexedSubscript:v6 + v8];
          [(__CFString *)v16 appendFormat:@"\t(%@ - %@): %@\n", v11, v12, v13];

          v3 = v10;
          ++v8;
          id v9 = v3;
        }
        while (v5 != v8);
        uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        v6 += v8;
      }
      while (v5);
    }

    [(__CFString *)v16 appendString:@"]"];
  }
  return v16;
}

- (NSArray)transitionDates
{
  return self->_transitionDates;
}

- (_DKHistogram)startHistogram
{
  return self->_startHistogram;
}

- (void)setStartHistogram:(id)a3
{
}

- (_DKHistogram)endHistogram
{
  return self->_endHistogram;
}

- (void)setEndHistogram:(id)a3
{
}

- (void)largestDateRangeWithValuesBetween:and:ofMinimumDuration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Prediction is unavailable", v2, v3, v4, v5, v6);
}

- (void)largestDateRangeWithValuesBetween:and:ofMinimumDuration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Unknown prediction timeline failure", v2, v3, v4, v5, v6);
}

- (void)largestDateRangeWithValuesBetween:(uint64_t *)a1 and:(NSObject *)a2 ofMinimumDuration:.cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Values are not NSNumber... %@", (uint8_t *)&v3, 0xCu);
}

@end