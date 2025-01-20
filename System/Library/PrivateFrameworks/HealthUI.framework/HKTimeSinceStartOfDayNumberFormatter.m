@interface HKTimeSinceStartOfDayNumberFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKTimeSinceStartOfDayNumberFormatter

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 currentCalendar];
  objc_msgSend(v7, "hk_startOfDayTransform");
  v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  v12 = ((void (**)(void, void *, void *))v10)[2](v10, v9, v11);
  [v8 doubleValue];
  double v14 = v13;

  v15 = [v12 dateByAddingTimeInterval:v14];
  v16 = HKLocalizedStringForDateAndTemplate(v15, 23);

  return v16;
}

@end