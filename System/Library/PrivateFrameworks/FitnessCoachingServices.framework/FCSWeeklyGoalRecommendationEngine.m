@interface FCSWeeklyGoalRecommendationEngine
+ (BOOL)_isMoveGoalAchievedForActivitySummary:(id)a3;
+ (double)_averageMoveFromActivitySummaries:(id)a3 forNumberOfSamples:(int64_t)a4;
+ (double)_minThresholdForActivityMoveMode:(int64_t)a3;
+ (double)recommendedNewWeeklyGoalForActivitySummaries:(id)a3;
+ (id)_activitySummariesSortedByEnergyBurn:(id)a3;
+ (id)_activitySummariesSortedByMoveMinutes:(id)a3;
+ (id)_activitySummariesSortedByMoveValue:(id)a3 activityMoveMode:(int64_t)a4;
+ (int64_t)_numberOfDaysGoalAchievedInSummaries:(id)a3;
+ (unint64_t)_numSamplesWithMoveGreaterThanTheGoalByPercent:(double)a3 forSummaries:(id)a4;
+ (unint64_t)_numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate:(id)a3;
+ (unint64_t)_numberOfInvalidDaysFromActivitySummaries:(id)a3 forExpectedNumberOfSamples:(unint64_t)a4;
@end

@implementation FCSWeeklyGoalRecommendationEngine

+ (id)_activitySummariesSortedByEnergyBurn:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global];
}

uint64_t __74__FCSWeeklyGoalRecommendationEngine__activitySummariesSortedByEnergyBurn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 activeEnergyBurned];
  v6 = [v4 activeEnergyBurned];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_activitySummariesSortedByMoveValue:(id)a3 activityMoveMode:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_opt_class();
  if (a4 == 2) {
    [v6 _activitySummariesSortedByMoveMinutes:v5];
  }
  else {
  uint64_t v7 = [v6 _activitySummariesSortedByEnergyBurn:v5];
  }

  return v7;
}

+ (id)_activitySummariesSortedByMoveMinutes:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_282];
}

uint64_t __75__FCSWeeklyGoalRecommendationEngine__activitySummariesSortedByMoveMinutes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 appleMoveTime];
  v6 = [v4 appleMoveTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (double)_minThresholdForActivityMoveMode:(int64_t)a3
{
  double result = 10.0;
  if (a3 == 2) {
    return 1.0;
  }
  return result;
}

+ (double)_averageMoveFromActivitySummaries:(id)a3 forNumberOfSamples:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count] < (unint64_t)a4) {
    a4 = [v6 count];
  }
  if (a4 < 1) {
    goto LABEL_12;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  double v9 = 0.0;
  do
  {
    v10 = [v6 objectAtIndexedSubscript:v7];
    double v11 = MoveValueAsDoubleWithSummary(v10);
    objc_msgSend(a1, "_minThresholdForActivityMoveMode:", objc_msgSend(v10, "activityMoveMode"));
    BOOL v13 = v11 < v12;
    double v14 = -0.0;
    if (!v13) {
      double v14 = v11;
    }
    double v9 = v9 + v14;
    if (!v13) {
      ++v8;
    }

    ++v7;
  }
  while (a4 != v7);
  if (v8) {
    double v15 = v9 / (double)v8;
  }
  else {
LABEL_12:
  }
    double v15 = 0.0;

  return v15;
}

+ (unint64_t)_numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __101__FCSWeeklyGoalRecommendationEngine__numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate___block_invoke;
    v8[3] = &unk_1E69B9DD0;
    v8[4] = &v9;
    v8[5] = a1;
    [v4 enumerateObjectsWithOptions:2 usingBlock:v8];
    unint64_t v6 = v10[3];
  }
  else
  {
    unint64_t v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __101__FCSWeeklyGoalRecommendationEngine__numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = [(id)objc_opt_class() _isMoveGoalAchievedForActivitySummary:v6];

  if (v7) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else {
    *a4 = 1;
  }
}

+ (BOOL)_isMoveGoalAchievedForActivitySummary:(id)a3
{
  id v3 = a3;
  double v4 = MoveValueAsDoubleWithSummary(v3);
  double v5 = MoveGoalValueAsDoubleWithSummary(v3);

  return v4 >= v5;
}

+ (unint64_t)_numSamplesWithMoveGreaterThanTheGoalByPercent:(double)a3 forSummaries:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    double v9 = a3 + 1.0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        double v13 = MoveValueAsDoubleWithSummary(v12);
        if (v13 > v9 * MoveGoalValueAsDoubleWithSummary(v12)) {
          ++v8;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (double)recommendedNewWeeklyGoalForActivitySummaries:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v4 lastObject];
  uint64_t v7 = [v6 activityMoveMode];
  double v8 = MoveGoalValueAsDoubleWithSummary(v6);
  double v9 = v8;
  if (v5 < 7) {
    goto LABEL_44;
  }
  double v10 = v8;
  uint64_t v77 = v7;
  id v78 = a1;
  v72 = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v76 = [v4 firstObject];
  v74 = [v76 _gregorianDateComponents];
  v73 = objc_msgSend(v11, "dateFromComponents:");
  v84 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 6);
  v80 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  v79 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  uint64_t v12 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 7);
  v85 = [MEMORY[0x1E4F1CA48] array];
  v82 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  v83 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    double v13 = 0;
    double v14 = 0;
    long long v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      long long v17 = v15;
      long long v18 = v14;
      v19 = v13;
      uint64_t v20 = (void *)MEMORY[0x1D943D3C0]();
      double v13 = [v4 objectAtIndexedSubscript:v16];

      double v14 = [v13 dateComponentsForCalendar:v11];

      long long v15 = [v11 dateFromComponents:v14];

      v21 = [v15 earlierDate:v84];
      LOBYTE(v19) = [v21 isEqualToDate:v15];

      if ((v19 & 1) == 0) {
        break;
      }
      [v85 addObject:v13];
      if (++v16 >= [v4 count]) {
        goto LABEL_11;
      }
    }
  }
  else
  {
    unint64_t v16 = 0;
    long long v15 = 0;
    double v14 = 0;
    double v13 = 0;
  }
LABEL_11:
  while (v16 < [v4 count])
  {
    v22 = v15;
    v23 = v14;
    v24 = v13;
    v25 = (void *)MEMORY[0x1D943D3C0]();
    double v13 = [v4 objectAtIndexedSubscript:v16];

    double v14 = [v13 dateComponentsForCalendar:v11];

    long long v15 = [v11 dateFromComponents:v14];

    v26 = [v15 earlierDate:v80];
    LOBYTE(v24) = [v26 isEqualToDate:v15];

    if ((v24 & 1) == 0)
    {
      break;
    }
    [v82 addObject:v13];
    ++v16;
  }
  while (v16 < [v4 count])
  {
    v27 = v15;
    v28 = v14;
    v29 = v13;
    v30 = (void *)MEMORY[0x1D943D3C0]();
    double v13 = [v4 objectAtIndexedSubscript:v16];

    double v14 = [v13 dateComponentsForCalendar:v11];

    long long v15 = [v11 dateFromComponents:v14];

    v31 = [v15 earlierDate:v79];
    LOBYTE(v29) = [v31 isEqualToDate:v15];

    if ((v29 & 1) == 0)
    {
      break;
    }
    [v81 addObject:v13];
    ++v16;
  }
  if (v16 >= [v4 count])
  {
    v35 = v15;
    v34 = v14;
  }
  else
  {
    do
    {
      v32 = v13;
      v33 = (void *)MEMORY[0x1D943D3C0]();
      double v13 = [v4 objectAtIndexedSubscript:v16];

      v34 = [v13 dateComponentsForCalendar:v11];

      v35 = [v11 dateFromComponents:v34];

      v36 = [v35 earlierDate:v12];
      int v37 = [v36 isEqualToDate:v35];

      if (v37) {
        [v83 addObject:v13];
      }
      ++v16;
      double v14 = v34;
      long long v15 = v35;
    }
    while (v16 < [v4 count]);
  }
  v75 = (void *)v12;
  uint64_t v70 = [v85 count];
  v38 = v82;
  uint64_t v69 = [v82 count];
  v39 = v81;
  uint64_t v68 = [v81 count];
  uint64_t v40 = [v83 count];
  unint64_t v67 = [v78 _numberOfInvalidDaysFromActivitySummaries:v85 forExpectedNumberOfSamples:7];
  uint64_t v41 = [v78 _numberOfInvalidDaysFromActivitySummaries:v82 forExpectedNumberOfSamples:7];
  uint64_t v42 = [v78 _numberOfInvalidDaysFromActivitySummaries:v81 forExpectedNumberOfSamples:7];
  if (v40)
  {
    v43 = [MEMORY[0x1E4F1CA48] arrayWithArray:v82];
    [v43 addObjectsFromArray:v81];
    [v43 addObjectsFromArray:v83];
    uint64_t v44 = [v78 _numberOfDaysGoalAchievedInSummaries:v43];
    uint64_t v6 = v72;
    if (v44 > 8)
    {
      v45 = v75;
      if ((unint64_t)v44 >= 0x12)
      {
        if ((unint64_t)[(id)objc_opt_class() _numSamplesWithMoveGreaterThanTheGoalByPercent:v43 forSummaries:0.1] <= 0xD)double v9 = v10; {
        else
        }
          double v9 = v10 * 1.1;
      }
    }
    else
    {
      if ((unint64_t)[(id)objc_opt_class() _numberOfDaysInMostRecentWinningStreakForSummariesOrderedByDate:v43] >= 4)double v9 = v10; {
      else
      }
        double v9 = v10 * 0.9;
      v45 = v75;
    }

    v38 = v82;
LABEL_39:
    v46 = v76;
    goto LABEL_40;
  }
  uint64_t v66 = v41;
  if (v68)
  {
    uint64_t v71 = v42;
    v39 = v81;
    v45 = v75;
    uint64_t v6 = v72;
    v46 = v76;
    switch([v78 _numberOfDaysGoalAchievedInSummaries:v81])
    {
      case 0:
      case 1:
      case 2:
        double v47 = 0.9;
        goto LABEL_62;
      case 3:
        if (v71) {
          double v9 = v10;
        }
        else {
          double v9 = v10 * 0.9;
        }
        goto LABEL_40;
      case 4:
        v58 = [v78 _activitySummariesSortedByMoveValue:v81 activityMoveMode:v77];
        [v78 _averageMoveFromActivitySummaries:v58 forNumberOfSamples:3];
        if (!v71)
        {
          if (v59 / v10 >= 0.75) {
            double v60 = 1.1;
          }
          else {
            double v60 = 0.9;
          }
          double v9 = v10 * v60;
        }

        v38 = v82;
        v46 = v76;
        v45 = v75;
        goto LABEL_40;
      case 5:
      case 6:
        goto LABEL_40;
      case 7:
        double v47 = 1.1;
LABEL_62:
        double v9 = v10 * v47;
        break;
      default:
        double v9 = 0.0;
        uint64_t v6 = v72;
        goto LABEL_39;
    }
    goto LABEL_40;
  }
  uint64_t v51 = v70 != 0;
  if (v69) {
    uint64_t v51 = 2;
  }
  v45 = v75;
  if (v51 == 1)
  {
    uint64_t v55 = [v78 _numberOfDaysGoalAchievedInSummaries:v85];
    v53 = [v78 _activitySummariesSortedByMoveValue:v85 activityMoveMode:v77];
    uint64_t v56 = v55;
    uint64_t v6 = v72;
    v46 = v76;
    v39 = v81;
    switch(v56)
    {
      case 0:
        if (v67 <= 6) {
          goto LABEL_52;
        }
        break;
      case 1:
      case 2:
LABEL_52:
        objc_msgSend(v78, "_averageMoveFromActivitySummaries:forNumberOfSamples:", v53, 4, v66);
        double v9 = v57;
        break;
      case 3:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:4];
        if (!v67)
        {
LABEL_81:
          double v9 = v61;
          if (v61 / v10 >= 0.75) {
            double v9 = v10 * 0.9;
          }
        }
        break;
      case 4:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:3];
        if (v64 / v10 >= 0.75) {
          double v64 = v10;
        }
        if (v67) {
          double v9 = v10;
        }
        else {
          double v9 = v64;
        }
        break;
      case 5:
      case 6:
        goto LABEL_76;
      case 7:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:7];
        if (v65 / v10 >= 1.25) {
          double v9 = v65;
        }
        else {
          double v9 = v10 * 1.1;
        }
        break;
      default:
        double v9 = 0.0;
        v39 = v81;
        break;
    }
    goto LABEL_76;
  }
  uint64_t v6 = v72;
  v46 = v76;
  if (v51 == 2)
  {
    uint64_t v52 = [v78 _numberOfDaysGoalAchievedInSummaries:v82];
    v53 = [v78 _activitySummariesSortedByMoveValue:v82 activityMoveMode:v77];
    switch(v52)
    {
      case 0:
      case 1:
      case 2:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:4];
        double v9 = v54;
        goto LABEL_75;
      case 3:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:4];
        v39 = v81;
        v46 = v76;
        if (!v66) {
          goto LABEL_81;
        }
        break;
      case 4:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:3];
        if (v62 / v10 >= 0.75) {
          double v62 = v10;
        }
        if (v66) {
          double v9 = v10;
        }
        else {
          double v9 = v62;
        }
        goto LABEL_75;
      case 5:
      case 6:
        double v9 = v10 * 1.1;
        goto LABEL_75;
      case 7:
        [v78 _averageMoveFromActivitySummaries:v53 forNumberOfSamples:7];
        if (v63 / v10 >= 1.25) {
          double v9 = v63;
        }
        else {
          double v9 = v10 * 1.1;
        }
        goto LABEL_75;
      default:
        double v9 = 0.0;
LABEL_75:
        v39 = v81;
        v46 = v76;
        break;
    }
LABEL_76:

    v38 = v82;
    goto LABEL_40;
  }
  v39 = v81;
LABEL_40:
  double v48 = floor(v9 / 10.0) * 10.0;
  double v49 = floor(v9);
  if (v77 == 2) {
    double v9 = v49;
  }
  else {
    double v9 = v48;
  }

LABEL_44:
  return v9;
}

+ (int64_t)_numberOfDaysGoalAchievedInSummaries:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [(id)objc_opt_class() _isMoveGoalAchievedForActivitySummary:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (unint64_t)_numberOfInvalidDaysFromActivitySummaries:(id)a3 forExpectedNumberOfSamples:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = 0;
  if ([v6 count])
  {
    unint64_t v8 = 0;
    do
    {
      double v9 = [v6 objectAtIndexedSubscript:v8];
      double v10 = MoveValueAsDoubleWithSummary(v9);
      objc_msgSend(a1, "_minThresholdForActivityMoveMode:", objc_msgSend(v9, "activityMoveMode"));
      if (v10 < v11) {
        ++v7;
      }

      ++v8;
    }
    while (v8 < [v6 count]);
  }
  unint64_t v12 = v7 + a4 - [v6 count];

  return v12;
}

@end