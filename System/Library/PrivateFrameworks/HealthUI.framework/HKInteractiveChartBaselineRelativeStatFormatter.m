@interface HKInteractiveChartBaselineRelativeStatFormatter
- (id)_establishingBaselineSelectedRangeData;
- (id)_unavailableSelectedRangeData;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
- (id)valueStringFromNumber:(id)a3;
@end

@implementation HKInteractiveChartBaselineRelativeStatFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(v6, "hk_filter:", &__block_literal_global_34);
  if ([v7 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)HKInteractiveChartBaselineRelativeStatFormatter;
    v8 = [(HKInteractiveChartGenericStatFormatter *)&v13 formattedSelectedRangeLabelDataWithChartData:v7 context:a4];
  }
  else
  {
    if (objc_msgSend(v6, "hk_containsObjectPassingTest:", &__block_literal_global_279))
    {
      v9 = [(HKInteractiveChartBaselineRelativeStatFormatter *)self _establishingBaselineSelectedRangeData];
      v15[0] = v9;
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = (void **)v15;
    }
    else
    {
      v9 = [(HKInteractiveChartBaselineRelativeStatFormatter *)self _unavailableSelectedRangeData];
      v14 = v9;
      v10 = (void *)MEMORY[0x1E4F1C978];
      v11 = &v14;
    }
    v8 = [v10 arrayWithObjects:v11 count:1];
  }
  return v8;
}

BOOL __104__HKInteractiveChartBaselineRelativeStatFormatter_formattedSelectedRangeLabelDataWithChartData_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 relativeValueState];
  BOOL v3 = [v2 integerValue] == 3;

  return v3;
}

BOOL __104__HKInteractiveChartBaselineRelativeStatFormatter_formattedSelectedRangeLabelDataWithChartData_context___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 relativeValueState];
  BOOL v3 = [v2 integerValue] == 2;

  return v3;
}

- (id)_establishingBaselineSelectedRangeData
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
  [(HKSelectedRangeData *)v3 setDataType:0];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"ESTABLISHING_BASELINE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  v12[0] = *MEMORY[0x1E4FB06F8];
  v7 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4FB0700];
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v4 initWithString:v6 attributes:v9];
  [(HKSelectedRangeData *)v3 setAttributedString:v10];

  return v3;
}

- (id)_unavailableSelectedRangeData
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [[HKSelectedRangeData alloc] initWithStatisticsType:0];
  [(HKSelectedRangeData *)v3 setDataType:0];
  id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"NOT_ENOUGH_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  v12[0] = *MEMORY[0x1E4FB06F8];
  v7 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4FB0700];
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = (void *)[v4 initWithString:v6 attributes:v9];
  [(HKSelectedRangeData *)v3 setAttributedString:v10];

  return v3;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4 = a3;
  v5 = [(HKInteractiveChartDataFormatter *)self displayType];
  id v6 = [(HKInteractiveChartDataFormatter *)self unitController];
  v7 = objc_alloc_init(HKRelativeNumberFormatter);
  v8 = HKFormattedStringFromValue(v4, v5, v6, 0, v7);

  return v8;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v5 = a4;
  id v6 = [(HKInteractiveChartDataFormatter *)self unitController];
  v7 = [(HKInteractiveChartDataFormatter *)self displayType];
  v8 = [v6 localizedDisplayNameForDisplayType:v7 value:v5];

  v9 = NSString;
  v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"%@_DEGREES_FROM_BASELINE_UNIT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);

  return v12;
}

@end