@interface DBAnalyticsScreenInfo
@end

@implementation DBAnalyticsScreenInfo

void __74___DBAnalyticsScreenInfo_analytics_sessionStartedDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  [v29 unadjustedSafeFrame];
  double v6 = v5;
  double v8 = v7;
  [v29 visibleFrame];
  if (v6 != v10 || v8 != v9) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if ([v29 displaysTransitionControl]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  [v29 visibleFrame];
  double v13 = v12;
  double v15 = v14;
  v16 = [*(id *)(a1 + 32) screenInfo];
  [v16 pixelSize];
  double v18 = v17;
  double v20 = v19;

  if (v13 == v18 && v15 == v20) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(void *)(v22 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v22 + 24) = a3;
  }
  else
  {
    v23 = [*(id *)(a1 + 32) screenInfo];
    v24 = [v23 viewAreas];
    v25 = [v24 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];

    [v25 visibleFrame];
    double Width = CGRectGetWidth(v31);
    [v25 visibleFrame];
    unint64_t v27 = (unint64_t)(Width * CGRectGetHeight(v32));
    [v29 visibleFrame];
    double v28 = CGRectGetWidth(v33);
    [v29 visibleFrame];
    if ((unint64_t)(v28 * CGRectGetHeight(v34)) > v27) {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    }
  }
}

void __72___DBAnalyticsScreenInfo_analytics_sessionEndedDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v31 = a2;
  double v5 = [*(id *)(a1 + 32) _identifierForViewArea:v31];
  [*(id *)(a1 + 32) accumulatedTimeForKey:v5];
  double v7 = v6;
  [v31 unadjustedSafeFrame];
  double v9 = v8;
  double v11 = v10;
  [v31 visibleFrame];
  if (v9 != v13 || v11 != v12) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  if ([v31 displaysTransitionControl]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  [v31 visibleFrame];
  double v16 = v15;
  double v18 = v17;
  double v19 = [*(id *)(a1 + 32) screenInfo];
  [v19 pixelSize];
  double v21 = v20;
  double v23 = v22;

  if (v16 == v21 && v18 == v23) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(void *)(v25 + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v25 + 24) = a3;
  }
  else
  {
    v26 = [*(id *)(a1 + 32) screenInfo];
    unint64_t v27 = [v26 viewAreas];
    double v28 = [v27 objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];

    id v29 = [*(id *)(a1 + 32) _identifierForViewArea:v28];
    [*(id *)(a1 + 32) accumulatedTimeForKey:v29];
    if (v7 > v30) {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    }
  }
}

@end