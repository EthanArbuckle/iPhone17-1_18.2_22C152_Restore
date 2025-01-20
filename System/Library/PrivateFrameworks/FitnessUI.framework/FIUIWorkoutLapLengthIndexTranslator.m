@interface FIUIWorkoutLapLengthIndexTranslator
- (FIUIWorkoutLapLengthIndexTranslator)initWithDistanceUnit:(id)a3;
- (HKUnit)distanceUnit;
- (double)valueForIndex:(int64_t)a3;
- (double)valueTranslatedFromDistanceUnit:(double)a3;
- (double)valueTranslatedIntoDistanceUnit:(double)a3;
- (int64_t)indexForValue:(double)a3;
- (void)setDistanceUnit:(id)a3;
@end

@implementation FIUIWorkoutLapLengthIndexTranslator

- (FIUIWorkoutLapLengthIndexTranslator)initWithDistanceUnit:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutLapLengthIndexTranslator;
  v6 = [(FIUIWorkoutLapLengthIndexTranslator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_distanceUnit, a3);
  }

  return v7;
}

- (double)valueTranslatedIntoDistanceUnit:(double)a3
{
  id v5 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
  v6 = [MEMORY[0x263F0A830] meterUnit];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
    objc_super v9 = [MEMORY[0x263F0A830] yardUnit];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      return a3 * 0.9144;
    }
    else
    {
      v11 = (void *)MEMORY[0x263F0A630];
      v12 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
      v13 = [v11 quantityWithUnit:v12 doubleValue:a3];

      v14 = [MEMORY[0x263F0A830] meterUnit];
      [v13 doubleValueForUnit:v14];
      a3 = v15;
    }
  }
  return a3;
}

- (double)valueTranslatedFromDistanceUnit:(double)a3
{
  id v5 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
  v6 = [MEMORY[0x263F0A830] meterUnit];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
    objc_super v9 = [MEMORY[0x263F0A830] yardUnit];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      return a3 / 0.9144;
    }
    else
    {
      v11 = (void *)MEMORY[0x263F0A630];
      v12 = [MEMORY[0x263F0A830] meterUnit];
      v13 = [v11 quantityWithUnit:v12 doubleValue:a3];

      v14 = [(FIUIWorkoutLapLengthIndexTranslator *)self distanceUnit];
      [v13 doubleValueForUnit:v14];
      a3 = v15;
    }
  }
  return a3;
}

- (double)valueForIndex:(int64_t)a3
{
  double v3 = (double)a3;
  if (a3 > 34) {
    double v3 = (double)a3 + -1.0;
  }
  if (a3 == 34) {
    double v3 = 33.3333333;
  }
  [(FIUIWorkoutLapLengthIndexTranslator *)self valueTranslatedIntoDistanceUnit:v3];
  return result;
}

- (int64_t)indexForValue:(double)a3
{
  [(FIUIWorkoutLapLengthIndexTranslator *)self valueTranslatedFromDistanceUnit:a3];
  if (fabs(v3 + -33.3333333) < 0.01) {
    return 34;
  }
  double v5 = round(v3);
  if (v3 >= 33.3333333) {
    return (uint64_t)(v5 + 1.0);
  }
  else {
    return (uint64_t)v5;
  }
}

- (HKUnit)distanceUnit
{
  return self->_distanceUnit;
}

- (void)setDistanceUnit:(id)a3
{
}

- (void).cxx_destruct
{
}

@end