@interface HFTemperatureItemUtilities
+ (id)currentHeatingCoolingModeValueInResponse:(id)a3;
+ (id)integerTemperatureRangeWithinNumberRange:(id)a3 representsCelsius:(BOOL)a4;
+ (id)targetHeatingCoolingModeValueInResponse:(id)a3;
+ (id)targetTemperatureValueInResponse:(id)a3;
+ (int64_t)_heatingCoolingValueForCurrentHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4;
+ (int64_t)_heatingCoolingValueForTargetHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4;
@end

@implementation HFTemperatureItemUtilities

+ (id)targetHeatingCoolingModeValueInResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C4D8]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  if (!v6)
  {
    v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C4D0]];
    v8 = [v7 characteristic];
    v9 = [v8 service];

    if (v9)
    {
      v10 = [v7 valueWithExpectedClass:objc_opt_class()];
      v11 = [v4 responseForCharacteristicType:*MEMORY[0x263F0BEF8] inService:v9];
      v12 = [v11 valueWithExpectedClass:objc_opt_class()];

      v6 = 0;
      if (v10 && v12)
      {
        v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "_heatingCoolingValueForTargetHeaterCoolerState:isActive:", objc_msgSend(v10, "integerValue"), objc_msgSend(v12, "BOOLValue")));
      }
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

+ (id)currentHeatingCoolingModeValueInResponse:(id)a3
{
  id v4 = a3;
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C068]];
  v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  if (!v6)
  {
    v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C058]];
    v8 = [v7 characteristic];
    v9 = [v8 service];

    if (v9)
    {
      v10 = [v7 valueWithExpectedClass:objc_opt_class()];
      v11 = [v4 responseForCharacteristicType:*MEMORY[0x263F0BEF8] inService:v9];
      v12 = [v11 valueWithExpectedClass:objc_opt_class()];

      v6 = 0;
      if (v10 && v12)
      {
        v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "_heatingCoolingValueForCurrentHeaterCoolerState:isActive:", objc_msgSend(v10, "integerValue"), objc_msgSend(v12, "BOOLValue")));
      }
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

+ (id)targetTemperatureValueInResponse:(id)a3
{
  id v4 = a3;
  v5 = [a1 currentHeatingCoolingModeValueInResponse:v4];
  uint64_t v6 = [a1 targetHeatingCoolingModeValueInResponse:v4];
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    unint64_t v9 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", [v5 integerValue]);
    unint64_t v10 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", [v7 integerValue]);
    v11 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C1A0]];
    v12 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C020]];
    v13 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C550]];
    v8 = +[HFTargetRangeUtilities targetValueWithTargetMode:v10 currentMode:v9 rawTargetResponse:v13 minimumThresholdResponse:v11 maximumThresholdResponse:v12];
  }
  return v8;
}

+ (int64_t)_heatingCoolingValueForTargetHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4
{
  int64_t result = 0;
  if ((unint64_t)a3 <= 2 && a4) {
    return qword_20BD13998[a3];
  }
  return result;
}

+ (int64_t)_heatingCoolingValueForCurrentHeaterCoolerState:(int64_t)a3 isActive:(BOOL)a4
{
  int64_t v4 = a3 == 2;
  if (a3 == 3) {
    int64_t v4 = 2;
  }
  if (a4) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (id)integerTemperatureRangeWithinNumberRange:(id)a3 representsCelsius:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 minValue];
  [v6 doubleValue];
  if (v4)
  {
    double v8 = ceil(v7);

    unint64_t v9 = [v5 maxValue];

    [v9 doubleValue];
    double v11 = floor(v10);
  }
  else
  {
    double v12 = ceil(v7 * 9.0 / 5.0 + 32.0);

    double v8 = (v12 + -32.0) * 5.0 / 9.0;
    v13 = [v5 maxValue];

    [v13 doubleValue];
    double v15 = floor(v14 * 9.0 / 5.0 + 32.0);

    double v11 = (v15 + -32.0) * 5.0 / 9.0;
  }
  v16 = [NSNumber numberWithDouble:v11];
  v17 = [NSNumber numberWithDouble:v8];
  v18 = +[HFNumberRange rangeWithMaxValue:v16 minValue:v17];

  return v18;
}

@end