@interface HKSleepComparisonFactorContext
@end

@implementation HKSleepComparisonFactorContext

void __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = WeakRetained;
  if (a4)
  {
    v14 = [WeakRetained displayType];
    v29 = +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, 0, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:*(void *)(a1 + 32)]);

    uint64_t v15 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 40);
    v17 = [*(id *)(a1 + 32) currentCalendar];
    v18 = +[HKOverlayRoomFactorContext factorDateIntervalsWithChartPoints:v9 dateInterval:v16 timeScope:v15 calendar:v17 intersection:1];

    if ([v18 count])
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 72);
      uint64_t v21 = *(void *)(a1 + 80);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      v32[3] = &unk_1E6D560A8;
      v22 = *(void **)(a1 + 56);
      v32[4] = *(void *)(a1 + 48);
      uint64_t v34 = v20;
      id v33 = v22;
      [v13 chartPointsForChartPointType:0 dateIntervals:v18 overlayChartController:v19 dateIntervalMustMatchView:0 timeScope:v20 resolution:v21 completion:v32];
    }
    else
    {
      v23 = [v13 displayType];
      uint64_t v24 = *(void *)(a1 + 72);
      v25 = [v13 applicationItems];
      v26 = [v25 unitController];
      v27 = [v29 valueFromChartPoints:MEMORY[0x1E4F1CBF0] unit:v10 displayType:v23 timeScope:v24 unitPreferenceController:v26];

      uint64_t v28 = *(void *)(a1 + 72);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4;
      v30[3] = &unk_1E6D52FB8;
      id v31 = *(id *)(a1 + 56);
      [v13 setLastUpdatedItemFromPillValue:v27 timeScope:v28 completion:v30];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    objc_msgSend(a2, "hk_map:", &__block_literal_global_77);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [*(id *)(a1 + 32) sleepChartFormatter];
    v6 = [v5 formattedSelectedRangeLabelDataWithChartData:v15 context:1];

    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v8 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v10 = (void *)[v7 initWithString:v9];

    id v11 = [v6 lastObject];
    v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 attributedString];

      id v10 = (void *)v13;
    }
    [*(id *)(a1 + 32) _setContextItem:v10 timeScope:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
  else
  {
    v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v14();
  }
}

uint64_t __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userInfo];
}

uint64_t __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72___HKSleepComparisonFactorContext__setContextItem_timeScope_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end