@interface ActivityBarSeries
@end

@implementation ActivityBarSeries

void __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  if (a3)
  {
    uint64_t v30 = a1;
    id v31 = v8;
    v10 = objc_alloc_init(_GoalDetailCollator);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      uint64_t v15 = -1;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v18 = [v17 userInfo];
          [(_GoalDetailCollator *)v10 processCoordinateUserInfo:v18];

          v19 = [v17 userInfo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v21 = [v17 userInfo];
            uint64_t v15 = [v21 activityValue];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v15 = -1;
    }

    if ((*(void *)(v30 + 40) & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v30 + 32) + 296));
      v24 = [WeakRetained activitySummaryForCurrentRange];

      v25 = [*(id *)(v30 + 32) unitPreferenceController];
      v26 = [(_GoalDetailCollator *)v10 activitySummaryDetailStringWithActivitySummary:v24 unitPreferenceController:v25 activityValue:v15 displayTypeController:*(void *)(*(void *)(v30 + 32) + 304)];
    }
    else
    {
      v26 = -[_GoalDetailCollator detailStringWithTimeScope:](v10, "detailStringWithTimeScope:");
    }
    v9 = v31;
    if (v26 && [v26 length])
    {
      v27 = objc_alloc_init(HKLegendEntry);
      [(HKLegendEntry *)v27 setTitle:v26];
      v28 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityLegendLabelColor");
      [(HKLegendEntry *)v27 setLabelColor:v28];

      v36 = v27;
      v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      [*(id *)(v30 + 32) setDetailLegendEntries:v29];
    }
    else
    {
      [*(id *)(v30 + 32) setDetailLegendEntries:MEMORY[0x1E4F1CBF0]];
    }
    [*(id *)(v30 + 32) setLastLegendUpdateTime:*(double *)(v30 + 48)];
  }
  else
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke_cold_1((uint64_t)v9, v22);
    }
  }
}

void __119___ActivityBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5 = a2;
  [v5 min];
  double v7 = v6;
  double v9 = v8;
  [v5 max];
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)(a1 + 80);
  if (*(double *)(a1 + 72) - v7 <= v14 && v7 - *(double *)(a1 + 88) <= v14)
  {
    id v15 = *(id *)(a1 + 32);
    v16 = [v5 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v18 = [v5 userInfo];
      if ([v18 hasActivityGoal] && (objc_msgSend(v18, "activityValueGoalMet") & 1) == 0)
      {
        id v19 = *(id *)(a1 + 40);

        id v15 = v19;
      }
      if ([v18 activityPaused])
      {
        id v20 = *(id *)(a1 + 48);

        id v15 = v20;
      }
    }
    if (*(unsigned char *)(a1 + 168))
    {
      long long v21 = a3[1];
      v37[0] = *a3;
      v37[1] = v21;
      long long v22 = *(_OWORD *)(a1 + 112);
      v36[0] = *(_OWORD *)(a1 + 96);
      v36[1] = v22;
      long long v23 = *(_OWORD *)(a1 + 144);
      v36[2] = *(_OWORD *)(a1 + 128);
      v36[3] = v23;
      if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v37, (uint64_t *)v36))
      {
        id v24 = *(id *)(a1 + 56);

        id v15 = v24;
      }
    }
    if (v7 - v11 >= 0.0) {
      double v25 = v7 - v11;
    }
    else {
      double v25 = -(v7 - v11);
    }
    if (v9 - v13 >= 0.0) {
      double v26 = v9 - v13;
    }
    else {
      double v26 = -(v9 - v13);
    }
    double v27 = v11;
    double v28 = v13;
    CGRect v38 = CGRectStandardize(*(CGRect *)(&v25 - 2));
    CGRect v39 = CGRectOffset(v38, *(double *)(a1 + 160) * -0.5, 0.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double height = v39.size.height;
    double v32 = *(double *)(a1 + 160) + v39.size.width;
    [*(id *)(a1 + 64) cornerRadii];
    long long v35 = +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, v32, height, v33, v34);
    [v15 appendPath:v35];
  }
}

void __77___ActivityBarSeries_updateLegendsForTimeScope_range_drawingDuringScrolling___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Unable to determine points for chart legend update: %@", (uint8_t *)&v2, 0xCu);
}

@end