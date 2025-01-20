@interface HKSleepComparisonContext
@end

@implementation HKSleepComparisonContext

HKInteractiveChartSinglePointEventIdentifierData *__151___HKSleepComparisonContext__generateSleepDistributionDisplayTypeForStackedSampleType_currentCalendarOverride_overlayChartController_applicationItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 32) & 2) != 0)
  {
    id v9 = a3;
    id v10 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointEventIdentifierData);
    v11 = [v10 minimumValue];
    [v11 doubleValueForUnit:v9];
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    v12 = [v10 maximumValue];
    [v12 doubleValueForUnit:v9];
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    [(HKInteractiveChartSinglePointData *)v6 setUnit:v9];
    [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
    v13 = [v10 contextIdentifiers];

    [(HKInteractiveChartSinglePointEventIdentifierData *)v6 setIdentifiers:v13];
  }
  else
  {
    id v4 = a3;
    id v5 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
    v7 = [v5 minimumValue];
    [v7 doubleValueForUnit:v4];
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    v8 = [v5 maximumValue];

    [v8 doubleValueForUnit:v4];
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    [(HKInteractiveChartSinglePointData *)v6 setUnit:v4];
    [(HKInteractiveChartSinglePointData *)v6 setRepresentsRange:1];
  }
  return v6;
}

id __144___HKSleepComparisonContext__defaultStackedInteractiveChartDisplayTypeForSampleType_overlayChartController_applicationItems_formatterTimeScope___block_invoke(void *a1, uint64_t a2)
{
  return +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:a1[4] sampleType:a1[5] applicationItems:a1[6] currentTimeScope:a2];
}

@end