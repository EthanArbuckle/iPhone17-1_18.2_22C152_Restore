@interface HKChartAxisDimensionFactory
+ (id)dimensionWithPurpose:(int64_t)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKChartAxisDimensionFactory

+ (id)dimensionWithPurpose:(int64_t)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 == 2)
  {
    v10 = [_HKChartAxisDimensionTableForTimeOfDay alloc];
    v11 = &_timeOfDayStepSizeTable;
    uint64_t v12 = 8;
  }
  else if (a3 == 1)
  {
    v10 = [HKChartAxisDimensionUsingTable alloc];
    v11 = &_feetInchesStepSizeTable;
    uint64_t v12 = 6;
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    v10 = [HKChartAxisDimensionUsingTable alloc];
    v11 = &_durationStepSizeTable;
    uint64_t v12 = 10;
  }
  v5 = [(_HKChartAxisDimensionTableForTimeOfDay *)v10 initWithStepSizeTable:v11 stepSizeTableSize:v12 displayType:v8 unitController:v9];
LABEL_8:

  return v5;
}

@end