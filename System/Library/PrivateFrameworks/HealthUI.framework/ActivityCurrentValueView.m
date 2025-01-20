@interface ActivityCurrentValueView
@end

@implementation ActivityCurrentValueView

uint64_t __102___ActivityCurrentValueView__computeMultiDayVisibleSummaryForGraphView_timeScope_filterDateIntervals___block_invoke(uint64_t a1, void *a2)
{
  v10 = [a2 userInfo];
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  v4 = v10;
  if (isKindOfClass)
  {
    v5 = [v10 activitySummaryData];
    if (([*(id *)(a1 + 32) _summaryOutsideRanges:*(void *)(a1 + 40) summary:v5] & 1) == 0)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v5 != *(void **)(v6 + 40))
      {
        [*(id *)(a1 + 48) combineWithActivitySummary:v5];
        uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
      id v8 = v5;

      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }

    v4 = v10;
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v4);
}

@end