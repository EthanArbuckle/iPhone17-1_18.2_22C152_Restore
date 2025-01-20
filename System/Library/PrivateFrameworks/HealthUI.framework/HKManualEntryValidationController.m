@interface HKManualEntryValidationController
- (id)supportedQuantityTypes;
- (unint64_t)_validateQuantity:(id)a3 withAbsoluteRange:(id)a4 confirmRange:(id)a5;
- (unint64_t)validateMaximumAllowedDuration:(double)a3 ofType:(id)a4;
- (unint64_t)validateMinimumAllowedDuration:(double)a3 ofType:(id)a4;
- (unint64_t)validateQuantity:(id)a3 ofType:(id)a4;
- (unint64_t)validateWorkoutDistance:(id)a3;
- (unint64_t)validateWorkoutEnergyBurned:(id)a3;
@end

@implementation HKManualEntryValidationController

- (id)supportedQuantityTypes
{
  return (id)[MEMORY[0x1E4F2B3B8] typeIdentifiersSupportingManualEntryValidation];
}

- (unint64_t)validateQuantity:(id)a3 ofType:(id)a4
{
  return [a4 validateQuantityForManualEntry:a3];
}

- (unint64_t)validateWorkoutDistance:(id)a3
{
  id v4 = a3;
  v5 = _workoutValidationRanges();
  v6 = [v5 objectForKeyedSubscript:@"_HKManualEntryWorkoutDistanceKey"];
  v7 = [v6 objectForKeyedSubscript:@"_HKManualEntryAbsoluteRangeKey"];

  v8 = _workoutValidationRanges();
  v9 = [v8 objectForKeyedSubscript:@"_HKManualEntryWorkoutDistanceKey"];
  v10 = [v9 objectForKeyedSubscript:@"_HKManualEntryConfirmRangeKey"];

  unint64_t v11 = [(HKManualEntryValidationController *)self _validateQuantity:v4 withAbsoluteRange:v7 confirmRange:v10];
  return v11;
}

- (unint64_t)validateWorkoutEnergyBurned:(id)a3
{
  id v4 = a3;
  v5 = _workoutValidationRanges();
  v6 = [v5 objectForKeyedSubscript:@"_HKManualEntryWorkoutEnergyBurnedKey"];
  v7 = [v6 objectForKeyedSubscript:@"_HKManualEntryAbsoluteRangeKey"];

  v8 = _workoutValidationRanges();
  v9 = [v8 objectForKeyedSubscript:@"_HKManualEntryWorkoutEnergyBurnedKey"];
  v10 = [v9 objectForKeyedSubscript:@"_HKManualEntryConfirmRangeKey"];

  unint64_t v11 = [(HKManualEntryValidationController *)self _validateQuantity:v4 withAbsoluteRange:v7 confirmRange:v10];
  return v11;
}

- (unint64_t)validateMaximumAllowedDuration:(double)a3 ofType:(id)a4
{
  id v5 = a4;
  if ([v5 isMaximumDurationRestricted]
    && ([v5 maximumAllowedDuration], v6 < a3))
  {
    unint64_t v7 = 2;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)validateMinimumAllowedDuration:(double)a3 ofType:(id)a4
{
  id v5 = a4;
  if ([v5 isMinimumDurationRestricted]
    && ([v5 minimumAllowedDuration], v6 > a3))
  {
    unint64_t v7 = 2;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)_validateQuantity:(id)a3 withAbsoluteRange:(id)a4 confirmRange:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([a4 containsQuantity:v7]) {
    unint64_t v9 = [v8 containsQuantity:v7] ^ 1;
  }
  else {
    unint64_t v9 = 2;
  }

  return v9;
}

@end