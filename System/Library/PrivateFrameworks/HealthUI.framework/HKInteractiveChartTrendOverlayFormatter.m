@interface HKInteractiveChartTrendOverlayFormatter
- (BOOL)_displayTypeIsSleep;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
@end

@implementation HKInteractiveChartTrendOverlayFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v5 = [a3 firstObject];
  if (v5)
  {
    v6 = [[HKSelectedRangeData alloc] initWithStatisticsType:3];
    uint64_t v7 = [(HKInteractiveChartTrendOverlayFormatter *)self _displayTypeIsSleep] ^ 1;
    [v5 minValue];
    double v9 = v8;
    v10 = [v5 unit];
    v11 = [(HKInteractiveChartDataFormatter *)self attributedStringWithValue:v10 unit:v7 showUnit:v9];
    [(HKSelectedRangeData *)v6 setAttributedString:v11];

    [(HKSelectedRangeData *)v6 setDataType:0];
    v12 = NSNumber;
    [v5 minValue];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [(HKSelectedRangeData *)v6 setValueAsNumber:v13];

    v16[0] = v6;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (BOOL)_displayTypeIsSleep
{
  v3 = [(HKInteractiveChartDataFormatter *)self displayType];

  if (v3)
  {
    v4 = [(HKInteractiveChartDataFormatter *)self displayType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v6 = [(HKInteractiveChartDataFormatter *)self displayType];
    uint64_t v7 = v6;
    if (isKindOfClass)
    {
      double v8 = [v6 baseDisplayType];
      v3 = (void *)[v8 displayTypeIdentifier];
    }
    else
    {
      v3 = (void *)[v6 displayTypeIdentifier];
    }
    LOBYTE(v3) = v3 == (void *)63;
  }
  return (char)v3;
}

@end