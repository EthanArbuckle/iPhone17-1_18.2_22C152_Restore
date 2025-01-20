@interface HKSleepStageChartPoint
+ (BOOL)_segment:(id)a3 isAdjacentToSegment:(id)a4;
+ (id)chartPointsForSummaries:(id)a3 context:(id)a4;
- (NSArray)asleepCoreOffsets;
- (NSArray)asleepDeepOffsets;
- (NSArray)asleepRemOffsets;
- (NSArray)asleepUnspecifiedOffsets;
- (NSArray)awakeOffsets;
- (id)allYValues;
- (id)yValuesForSleepAnalysis:(int64_t)a3;
- (void)setAsleepCoreOffsets:(id)a3;
- (void)setAsleepDeepOffsets:(id)a3;
- (void)setAsleepRemOffsets:(id)a3;
- (void)setAsleepUnspecifiedOffsets:(id)a3;
- (void)setAwakeOffsets:(id)a3;
@end

@implementation HKSleepStageChartPoint

- (id)yValuesForSleepAnalysis:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v3 = [(HKSleepPeriodChartPoint *)self inBedOffsets];
      goto LABEL_9;
    case 1:
      uint64_t v3 = [(HKSleepStageChartPoint *)self asleepUnspecifiedOffsets];
      goto LABEL_9;
    case 2:
      uint64_t v3 = [(HKSleepStageChartPoint *)self awakeOffsets];
      goto LABEL_9;
    case 3:
      uint64_t v3 = [(HKSleepStageChartPoint *)self asleepCoreOffsets];
      goto LABEL_9;
    case 4:
      uint64_t v3 = [(HKSleepStageChartPoint *)self asleepDeepOffsets];
      goto LABEL_9;
    case 5:
      uint64_t v3 = [(HKSleepStageChartPoint *)self asleepRemOffsets];
LABEL_9:
      v4 = (void *)v3;
      break;
    default:
      v4 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }
  v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_540);

  return v5;
}

uint64_t __50__HKSleepStageChartPoint_yValuesForSleepAnalysis___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (id)allYValues
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HKSleepStageChartPoint *)self asleepUnspecifiedOffsets];
  [v3 addObjectsFromArray:v4];

  v5 = [(HKSleepStageChartPoint *)self asleepDeepOffsets];
  [v3 addObjectsFromArray:v5];

  v6 = [(HKSleepStageChartPoint *)self asleepCoreOffsets];
  [v3 addObjectsFromArray:v6];

  v7 = [(HKSleepStageChartPoint *)self asleepRemOffsets];
  [v3 addObjectsFromArray:v7];

  v8 = [(HKSleepStageChartPoint *)self awakeOffsets];
  [v3 addObjectsFromArray:v8];

  v9 = [(HKSleepPeriodChartPoint *)self inBedOffsets];
  [v3 addObjectsFromArray:v9];

  v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"value" ascending:0];
  v14[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 sortUsingDescriptors:v11];

  v12 = objc_msgSend(v3, "hk_map:", &__block_literal_global_542);

  return v12;
}

uint64_t __36__HKSleepStageChartPoint_allYValues__block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

+ (id)chartPointsForSummaries:(id)a3 context:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__HKSleepStageChartPoint_chartPointsForSummaries_context___block_invoke;
  v10[3] = &unk_1E6D54118;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  v8 = objc_msgSend(a3, "hk_map:", v10);

  return v8;
}

HKSleepStageChartPoint *__58__HKSleepStageChartPoint_chartPointsForSummaries_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v64 = v2;
  id obj = [v2 periods];
  uint64_t v54 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v54)
  {
    uint64_t v53 = *(void *)v66;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v66 != v53) {
          objc_enumerationMutation(obj);
        }
        uint64_t v55 = v3;
        v4 = *(void **)(*((void *)&v65 + 1) + 8 * v3);
        v5 = [v4 segments];
        uint64_t v6 = [v5 count];

        if (v6)
        {
          unint64_t v7 = 0;
          do
          {
            unint64_t v8 = v7;
            v9 = [v4 segments];
            v10 = [v9 objectAtIndexedSubscript:v7];

            ++v7;
            id v11 = [v4 segments];
            if ([v11 count] <= v7)
            {
              v13 = 0;
            }
            else
            {
              id v12 = [v4 segments];
              v13 = [v12 objectAtIndexedSubscript:v7];
            }
            if (v8)
            {
              v14 = [v4 segments];
              uint64_t v15 = [v14 objectAtIndexedSubscript:(v8 - 1)];
            }
            else
            {
              uint64_t v15 = 0;
            }
            v16 = [v10 dateInterval];
            v17 = [v16 startDate];
            v18 = [v64 dateInterval];
            v19 = [v18 startDate];
            v63 = (void *)v15;
            if (objc_msgSend(v17, "hk_isBeforeDate:", v19)) {
              uint64_t v20 = 1;
            }
            else {
              uint64_t v20 = [*(id *)(a1 + 40) _segment:v10 isAdjacentToSegment:v15];
            }

            v21 = [v10 dateInterval];
            v22 = [v21 endDate];
            v23 = [v64 dateInterval];
            v24 = [v23 endDate];
            if (objc_msgSend(v22, "hk_isAfterDate:", v24)) {
              uint64_t v25 = 1;
            }
            else {
              uint64_t v25 = [*(id *)(a1 + 40) _segment:v10 isAdjacentToSegment:v13];
            }

            v26 = [v64 dateInterval];
            v27 = [v10 dateInterval];
            v28 = [v26 intersectionWithDateInterval:v27];

            v29 = [v28 startDate];
            v30 = [v64 dateInterval];
            v31 = [v30 startDate];
            [v29 timeIntervalSinceDate:v31];
            double v33 = v32;

            [v28 duration];
            double v35 = v33 + v34;
            v36 = [NSNumber numberWithDouble:v33];
            v37 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v36 continuation:v20];
            v69[0] = v37;
            v38 = [NSNumber numberWithDouble:v35];
            v39 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v38 continuation:v25];
            v69[1] = v39;
            v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];

            [v10 category];
            v41 = v61;
            switch((unint64_t)v61)
            {
              case 0uLL:
                char v42 = [v64 hasSleepStageData];
                v41 = v56;
                if ((v42 & 1) == 0) {
                  goto LABEL_28;
                }
                break;
              case 1uLL:
                goto LABEL_28;
              case 2uLL:
                char v43 = [v64 hasSleepStageData];
                v41 = v60;
                if ((v43 & 1) == 0) {
                  break;
                }
                goto LABEL_28;
              case 3uLL:
                v41 = v58;
                goto LABEL_28;
              case 4uLL:
                v41 = v59;
                goto LABEL_28;
              case 5uLL:
                v41 = v57;
LABEL_28:
                [v41 addObjectsFromArray:v40];
                break;
              default:
                break;
            }

            v44 = [v4 segments];
            unint64_t v45 = [v44 count];
          }
          while (v45 > v7);
        }
        uint64_t v3 = v55 + 1;
      }
      while (v55 + 1 != v54);
      uint64_t v54 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v54);
  }

  v46 = objc_alloc_init(HKSleepStageChartPoint);
  [(HKSleepStageChartPoint *)v46 setAwakeOffsets:v60];
  [(HKSleepStageChartPoint *)v46 setAsleepUnspecifiedOffsets:v61];
  [(HKSleepStageChartPoint *)v46 setAsleepDeepOffsets:v59];
  [(HKSleepStageChartPoint *)v46 setAsleepCoreOffsets:v58];
  [(HKSleepStageChartPoint *)v46 setAsleepRemOffsets:v57];
  [(HKSleepPeriodChartPoint *)v46 setInBedOffsets:v56];
  v47 = +[HKSleepUtilities sleepDaySummaryNoonAlignedXValue:v64];
  [(HKSleepPeriodChartPoint *)v46 setXValue:v47];

  [(HKSleepPeriodChartPoint *)v46 setHighlighted:0];
  v48 = objc_msgSend(v64, "hk_bedtimeGoalValue");
  [(HKSleepPeriodChartPoint *)v46 setLowerGoal:v48];

  v49 = objc_msgSend(v64, "hk_wakeTimeGoalValue");
  [(HKSleepPeriodChartPoint *)v46 setUpperGoal:v49];

  v50 = -[HKSleepChartPointUserInfo initWithSeriesType:sleepDaySummary:]([HKSleepChartPointUserInfo alloc], "initWithSeriesType:sleepDaySummary:", [*(id *)(a1 + 32) chartType], v64);
  [(HKSleepPeriodChartPoint *)v46 setUserInfo:v50];

  return v46;
}

+ (BOOL)_segment:(id)a3 isAdjacentToSegment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  char v8 = 0;
  if (v5 && v6)
  {
    if ([v5 category] && objc_msgSend(v7, "category"))
    {
      v9 = [v5 dateInterval];
      v10 = [v9 endDate];
      id v11 = [v7 dateInterval];
      id v12 = [v11 startDate];
      if ([v10 isEqualToDate:v12])
      {
        char v8 = 1;
      }
      else
      {
        v17 = [v5 dateInterval];
        v13 = [v17 startDate];
        v14 = [v7 dateInterval];
        uint64_t v15 = [v14 endDate];
        char v8 = [v13 isEqualToDate:v15];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSArray)awakeOffsets
{
  return self->_awakeOffsets;
}

- (void)setAwakeOffsets:(id)a3
{
}

- (NSArray)asleepUnspecifiedOffsets
{
  return self->_asleepUnspecifiedOffsets;
}

- (void)setAsleepUnspecifiedOffsets:(id)a3
{
}

- (NSArray)asleepDeepOffsets
{
  return self->_asleepDeepOffsets;
}

- (void)setAsleepDeepOffsets:(id)a3
{
}

- (NSArray)asleepCoreOffsets
{
  return self->_asleepCoreOffsets;
}

- (void)setAsleepCoreOffsets:(id)a3
{
}

- (NSArray)asleepRemOffsets
{
  return self->_asleepRemOffsets;
}

- (void)setAsleepRemOffsets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asleepRemOffsets, 0);
  objc_storeStrong((id *)&self->_asleepCoreOffsets, 0);
  objc_storeStrong((id *)&self->_asleepDeepOffsets, 0);
  objc_storeStrong((id *)&self->_asleepUnspecifiedOffsets, 0);
  objc_storeStrong((id *)&self->_awakeOffsets, 0);
}

@end