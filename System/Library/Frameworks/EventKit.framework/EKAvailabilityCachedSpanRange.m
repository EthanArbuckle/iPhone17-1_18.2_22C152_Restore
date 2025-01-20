@interface EKAvailabilityCachedSpanRange
+ (id)_clampDateRangeForSpans:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (BOOL)_rangeCompletelyCoversPeriodBetweenStartDate:(id)a3 endDate:(id)a4;
- (BOOL)spanType:(int64_t)a3 isSimilarToSpanType:(int64_t)a4;
- (EKAvailabilityCachedSpanRange)init;
- (id)cachedSpansFromSpans:(id)a3;
- (id)description;
- (id)gatherFreshlyCachedSpansBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)mergeSpansOfSameType:(id)a3;
- (id)spans;
- (int64_t)_currentMaxSpanTypeIn:(id)a3;
- (void)insertSpans:(id)a3;
- (void)sanitizeAndInsertResults:(id)a3 inRange:(id)a4;
@end

@implementation EKAvailabilityCachedSpanRange

- (EKAvailabilityCachedSpanRange)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKAvailabilityCachedSpanRange;
  v2 = [(EKAvailabilityCachedSpanRange *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cachedSpans = v2->_cachedSpans;
    v2->_cachedSpans = v3;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v8.receiver = self;
  v8.super_class = (Class)EKAvailabilityCachedSpanRange;
  v4 = [(EKAvailabilityCachedSpanRange *)&v8 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"_cachedSpans" withArray:self->_cachedSpans];
  objc_super v6 = [v5 build];

  return v6;
}

- (id)gatherFreshlyCachedSpansBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKAvailabilityCachedSpanRange gatherFreshlyCachedSpansBetweenStartDate:endDate:]();
  }
  if ([(EKAvailabilityCachedSpanRange *)self _rangeCompletelyCoversPeriodBetweenStartDate:v6 endDate:v7])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = [MEMORY[0x1E4F1C9C8] date];
    cachedSpans = self->_cachedSpans;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __82__EKAvailabilityCachedSpanRange_gatherFreshlyCachedSpansBetweenStartDate_endDate___block_invoke;
    v20 = &unk_1E5B97B38;
    id v11 = v7;
    id v21 = v11;
    id v12 = v6;
    id v22 = v12;
    id v23 = v9;
    id v13 = v8;
    id v24 = v13;
    id v14 = v9;
    [(NSMutableArray *)cachedSpans enumerateObjectsUsingBlock:&v17];
    if (objc_msgSend(v13, "count", v17, v18, v19, v20))
    {
      v15 = [(id)objc_opt_class() _clampDateRangeForSpans:v13 startDate:v12 endDate:v11];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __82__EKAvailabilityCachedSpanRange_gatherFreshlyCachedSpansBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  id v6 = [v16 span];
  id v7 = [v6 startDate];
  id v8 = [v6 endDate];
  if ([*(id *)(a1 + 32) CalIsBeforeOrSameAsDate:v7])
  {
    *a4 = 1;
  }
  else if ([*(id *)(a1 + 40) CalIsBeforeDate:v8])
  {
    v9 = [v16 creationDate];
    [*(id *)(a1 + 48) timeIntervalSinceDate:v9];
    double v11 = v10;
    id v12 = +[EKDebugPreferences shared];
    [v12 availabilityFreshnessWindow];
    double v14 = v13;

    v15 = *(void **)(a1 + 56);
    if (v11 <= v14)
    {
      [v15 addObject:v6];
    }
    else
    {
      [v15 removeAllObjects];
      *a4 = 1;
    }
  }
}

- (int64_t)_currentMaxSpanTypeIn:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    uint64_t v5 = -1;
    int64_t v6 = 2;
    do
    {
      id v7 = [v3 objectAtIndexedSubscript:v4];
      if ([v7 integerValue] >= 1)
      {
        unsigned int v8 = +[EKAvailabilitySpanDate valueForSpanType:v4];
        BOOL v9 = v5 < v8;
        if (v5 <= v8) {
          uint64_t v5 = v8;
        }
        if (v9) {
          int64_t v6 = v4;
        }
      }

      ++v4;
    }
    while (v4 < [v3 count]);
  }
  else
  {
    int64_t v6 = 2;
  }

  return v6;
}

- (void)sanitizeAndInsertResults:(id)a3 inRange:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v23 = 0;
LABEL_10:
    id v24 = [EKAvailabilitySpan alloc];
    v25 = [v7 startDate];
    v26 = [v7 endDate];
    unsigned int v8 = [(EKAvailabilitySpan *)v24 initWithStartDate:v25 endDate:v26 type:v23];

    v27[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [(EKAvailabilityCachedSpanRange *)self insertSpans:v10];
    goto LABEL_11;
  }
  if (![v6 count])
  {
    uint64_t v23 = 2;
    goto LABEL_10;
  }
  unsigned int v8 = (EKAvailabilitySpan *)objc_opt_new();
  BOOL v9 = [v6 firstObject];
  double v10 = [v9 startDate];

  double v11 = [v7 startDate];
  int v12 = [v11 isBeforeDate:v10];

  if (v12)
  {
    double v13 = [EKAvailabilitySpan alloc];
    double v14 = [v7 startDate];
    v15 = [(EKAvailabilitySpan *)v13 initWithStartDate:v14 endDate:v10 type:2];
    [(EKAvailabilitySpan *)v8 addObject:v15];
  }
  [(EKAvailabilitySpan *)v8 addObjectsFromArray:v6];
  id v16 = [v6 lastObject];
  uint64_t v17 = [v16 endDate];

  uint64_t v18 = [v7 endDate];
  int v19 = [v18 isAfterDate:v17];

  if (v19)
  {
    v20 = [EKAvailabilitySpan alloc];
    id v21 = [v7 endDate];
    id v22 = [(EKAvailabilitySpan *)v20 initWithStartDate:v17 endDate:v21 type:2];
    [(EKAvailabilitySpan *)v8 addObject:v22];
  }
  [(EKAvailabilityCachedSpanRange *)self insertSpans:v8];

LABEL_11:
}

- (id)cachedSpansFromSpans:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v11 = [EKAvailabilityCachedSpan alloc];
        int v12 = -[EKAvailabilityCachedSpan initWithSpan:](v11, "initWithSpan:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)spanType:(int64_t)a3 isSimilarToSpanType:(int64_t)a4
{
  if (a3 == a4) {
    return 1;
  }
  uint64_t v13 = v5;
  uint64_t v14 = v4;
  return a3 == 1 && a4 == 5
      || a3 == 5 && a4 == 1
      || +[EKAvailabilityUtilities showTypeAsUnavailable:](EKAvailabilityUtilities, "showTypeAsUnavailable:", a3, v7, v6, v13, v14, v8, v9)&& +[EKAvailabilityUtilities showTypeAsUnavailable:](EKAvailabilityUtilities, "showTypeAsUnavailable:", a4)|| !+[EKAvailabilityUtilities showTypeAsBusy:](EKAvailabilityUtilities, "showTypeAsBusy:", a3)&& !+[EKAvailabilityUtilities showTypeAsBusy:a4];
}

- (id)mergeSpansOfSameType:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  uint64_t v4 = 0;
  do
  {
    uint64_t v25 = v4;
    uint64_t v5 = qword_1A4F8FEC0[v4];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v24;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v29;
      uint64_t v27 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          int v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (-[EKAvailabilityCachedSpanRange spanType:isSimilarToSpanType:](self, "spanType:isSimilarToSpanType:", v5, [v12 type]))
          {
            if (!v9) {
              goto LABEL_13;
            }
            uint64_t v13 = [v9 endDate];
            [v12 startDate];
            uint64_t v14 = v5;
            long long v15 = self;
            long long v17 = v16 = v6;
            int v18 = [v13 isAfterDate:v17];

            id v6 = v16;
            self = v15;
            uint64_t v5 = v14;

            uint64_t v10 = v27;
            if (v18)
            {
              uint64_t v19 = [v12 endDate];
              [v9 setEndDate:v19];

              int64_t v20 = +[EKAvailabilityUtilities orderForType:](EKAvailabilityUtilities, "orderForType:", [v12 type]);
              if (v20 > +[EKAvailabilityUtilities orderForType:](EKAvailabilityUtilities, "orderForType:", [v9 type]))objc_msgSend(v9, "setType:", objc_msgSend(v12, "type")); {
              [v26 removeObject:v12];
              }
              uint64_t v5 = v14;
              uint64_t v10 = v27;
            }
            else
            {
LABEL_13:
              id v21 = v12;

              uint64_t v9 = v21;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    uint64_t v4 = v25 + 1;
  }
  while (v25 != 2);
  id v22 = [(EKAvailabilityCachedSpanRange *)self cachedSpansFromSpans:v26];

  return v22;
}

- (void)insertSpans:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKAvailabilityCachedSpanRange insertSpans:]((uint64_t)v4, v5);
    if (!v4)
    {
LABEL_35:
      v59 = EKAvailabilityHandle;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR)) {
        -[EKAvailabilityCachedSpanRange insertSpans:](v59);
      }
      goto LABEL_37;
    }
  }
  else if (!v4)
  {
    goto LABEL_35;
  }
  if (![v4 count]) {
    goto LABEL_35;
  }
  id v63 = v4;
  v62 = [v4 sortedArrayUsingComparator:&__block_literal_global_31];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  uint64_t v7 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v64 = self;
  uint64_t v8 = self->_cachedSpans;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v72 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v71 + 1) + 8 * i) span];
        [v7 addObject:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v10);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F576D0]);
  long long v15 = [v6 firstObject];
  id v16 = [v15 startDate];
  v61 = v6;
  long long v17 = [v6 lastObject];
  int v18 = [v17 endDate];
  uint64_t v19 = (void *)[v14 initWithStartDate:v16 endDate:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F576D0]);
  id v21 = [v7 firstObject];
  id v22 = [v21 startDate];
  uint64_t v23 = [v7 lastObject];
  id v24 = [v23 endDate];
  uint64_t v25 = [v20 initWithStartDate:v22 endDate:v24];

  v60 = (void *)v25;
  if (!-[NSMutableArray count](v64->_cachedSpans, "count") || [v19 containsRange:v25])
  {
    v26 = v61;
    uint64_t v27 = [(EKAvailabilityCachedSpanRange *)v64 mergeSpansOfSameType:v61];
    cachedSpans = v64->_cachedSpans;
    v64->_cachedSpans = (NSMutableArray *)v27;
    goto LABEL_33;
  }
  v66 = (NSMutableArray *)objc_opt_new();
  v65 = (NSMutableArray *)objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v29 = v7;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (!v30) {
    goto LABEL_32;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v68;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v68 != v32) {
        objc_enumerationMutation(v29);
      }
      v34 = *(void **)(*((void *)&v67 + 1) + 8 * v33);
      v35 = [v34 endDate];
      v36 = [v19 startDate];
      int v37 = [v35 CalIsBeforeOrSameAsDate:v36];

      if (v37)
      {
        v38 = v66;
LABEL_23:
        [(NSMutableArray *)v38 addObject:v34];
        goto LABEL_24;
      }
      v39 = [v19 endDate];
      v40 = [v34 startDate];
      int v41 = [v39 CalIsBeforeOrSameAsDate:v40];

      if (v41)
      {
        v38 = v65;
        goto LABEL_23;
      }
      if ([v19 intersectsRange:v34])
      {
        v42 = [v34 startDate];
        v43 = [v19 startDate];
        int v44 = [v42 CalIsBeforeDate:v43];

        if (v44)
        {
          v45 = [EKAvailabilitySpan alloc];
          v46 = [v34 startDate];
          v47 = [v19 startDate];
          v48 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v45, "initWithStartDate:endDate:type:", v46, v47, [v34 type]);

          [(NSMutableArray *)v66 addObject:v48];
        }
        v49 = [v19 endDate];
        v50 = [v34 endDate];
        int v51 = [v49 CalIsBeforeDate:v50];

        if (v51)
        {
          v52 = [EKAvailabilitySpan alloc];
          v53 = [v19 endDate];
          v54 = [v34 endDate];
          v55 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v52, "initWithStartDate:endDate:type:", v53, v54, [v34 type]);

          [(NSMutableArray *)v65 addObject:v55];
        }
      }
LABEL_24:
      ++v33;
    }
    while (v31 != v33);
    uint64_t v56 = [v29 countByEnumeratingWithState:&v67 objects:v75 count:16];
    uint64_t v31 = v56;
  }
  while (v56);
LABEL_32:

  cachedSpans = v66;
  v26 = v61;
  [(NSMutableArray *)v66 addObjectsFromArray:v61];
  [(NSMutableArray *)v66 addObjectsFromArray:v65];
  uint64_t v57 = [(EKAvailabilityCachedSpanRange *)v64 mergeSpansOfSameType:v66];
  v58 = v64->_cachedSpans;
  v64->_cachedSpans = (NSMutableArray *)v57;

LABEL_33:
  id v4 = v63;

LABEL_37:
}

uint64_t __45__EKAvailabilityCachedSpanRange_insertSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 startDate];
  uint64_t v7 = [v5 startDate];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 endDate];
    uint64_t v10 = [v5 endDate];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (id)spans
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  cachedSpans = self->_cachedSpans;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__EKAvailabilityCachedSpanRange_spans__block_invoke;
  v7[3] = &unk_1E5B97B80;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)cachedSpans enumerateObjectsUsingBlock:v7];

  return v5;
}

void __38__EKAvailabilityCachedSpanRange_spans__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 span];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 span];
    [v4 addObject:v5];
  }
}

- (BOOL)_rangeCompletelyCoversPeriodBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  cachedSpans = self->_cachedSpans;
  id v8 = a3;
  uint64_t v9 = [(NSMutableArray *)cachedSpans firstObject];
  uint64_t v10 = [(NSMutableArray *)self->_cachedSpans lastObject];
  uint64_t v11 = [v9 span];
  int v12 = [v11 startDate];
  int v13 = [v12 CalIsBeforeOrSameAsDate:v8];

  if (v13)
  {
    id v14 = [v10 span];
    long long v15 = [v14 endDate];
    char v16 = [v15 CalIsAfterOrSameAsDate:v6];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)_clampDateRangeForSpans:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:].cold.4();
  }
  id v10 = v7;
  uint64_t v11 = [v10 count];
  int v12 = v10;
  if (v10)
  {
    uint64_t v13 = v11;
    int v12 = v10;
    if (v11)
    {
      id v14 = [v10 firstObject];
      long long v15 = [v10 lastObject];
      char v16 = [v14 startDate];
      if ([v16 CalIsBeforeDate:v8])
      {
      }
      else
      {
        long long v17 = [v15 endDate];
        int v18 = [v17 CalIsAfterDate:v9];

        if (!v18)
        {
          int v37 = EKAvailabilityHandle;
          int v12 = v10;
          if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          {
            +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:](v37);
            int v12 = v10;
          }
          goto LABEL_24;
        }
      }
      uint64_t v19 = (void *)EKAvailabilityHandle;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      {
        v39 = v19;
        v40 = [v14 startDate];
        int v41 = [v15 endDate];
        *(_DWORD *)buf = 138413058;
        int v44 = v40;
        __int16 v45 = 2112;
        v46 = v41;
        __int16 v47 = 2112;
        id v48 = v8;
        __int16 v49 = 2112;
        id v50 = v9;
        _os_log_debug_impl(&dword_1A4E47000, v39, OS_LOG_TYPE_DEBUG, "Clamping date range for spans.  Original start date: [%@].  Original end date: [%@].  New start date: [%@].  New end date: [%@].", buf, 0x2Au);
      }
      uint64_t v20 = v13 - 1;
      if (v13 == 1)
      {
        unint64_t v21 = [v14 type];
        id v22 = [v14 startDate];
        uint64_t v23 = [v14 endDate];
        id v24 = [v14 startDate];
        int v25 = [v24 CalIsBeforeDate:v8];

        if (v25)
        {
          v26 = (EKAvailabilitySpan *)v8;

          id v22 = v26;
        }
        uint64_t v27 = [v14 endDate];
        int v28 = [v27 CalIsAfterDate:v9];

        if (v28)
        {
          id v29 = v9;

          uint64_t v23 = v29;
        }
        uint64_t v30 = [[EKAvailabilitySpan alloc] initWithStartDate:v22 endDate:v23 type:v21];
        uint64_t v31 = (void *)EKAvailabilityHandle;
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
          +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:](v31, v21);
        }
        v42 = v30;
        int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      }
      else
      {
        uint64_t v32 = [EKAvailabilitySpan alloc];
        uint64_t v33 = [v14 endDate];
        id v22 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v32, "initWithStartDate:endDate:type:", v8, v33, [v14 type]);

        v34 = [EKAvailabilitySpan alloc];
        v35 = [v15 startDate];
        v36 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v34, "initWithStartDate:endDate:type:", v35, v9, [v15 type]);

        int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v10];
        [v12 replaceObjectAtIndex:0 withObject:v22];
        [v12 replaceObjectAtIndex:v20 withObject:v36];
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
          +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:]();
        }
      }
LABEL_24:
    }
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (void)gatherFreshlyCachedSpansBetweenStartDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Gathering freshly cached spans between [%@] and [%@]");
}

- (void)insertSpans:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "ERROR: No span given to insert results.", v1, 2u);
}

- (void)insertSpans:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "Inserting spans [%@].", (uint8_t *)&v2, 0xCu);
}

+ (void)_clampDateRangeForSpans:(void *)a1 startDate:(unint64_t)a2 endDate:.cold.1(void *a1, unint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = EKAvailabilitySpanTypeAsString(a2);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_DEBUG, "There is only one span.  Created a new span and set its type to: [%@]", (uint8_t *)&v5, 0xCu);
}

+ (void)_clampDateRangeForSpans:startDate:endDate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Clamped the spans.  firstTruncatedSpan: [%@].  lastTruncatedSpan: [%@]");
}

+ (void)_clampDateRangeForSpans:(os_log_t)log startDate:endDate:.cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "No clamping needed.", v1, 2u);
}

+ (void)_clampDateRangeForSpans:startDate:endDate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_1A4E47000, v0, v1, "Clamping date range for spans between [%@] and [%@]");
}

@end