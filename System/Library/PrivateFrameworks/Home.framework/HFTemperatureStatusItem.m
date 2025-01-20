@interface HFTemperatureStatusItem
+ (BOOL)isPercentRange;
+ (BOOL)shouldShowAverageForRange:(id)a3;
+ (id)controllableServiceTypes;
+ (id)currentModeCharacteristicTypes;
+ (id)currentValueCharacteristicType;
+ (id)customValueFormatter;
+ (id)displayValueComparator;
+ (id)maximumTargetValueCharacteristicType;
+ (id)minimumTargetValueCharacteristicType;
+ (id)overrideValueDisplayRange;
+ (id)sensorServiceTypes;
+ (id)targetModeCharacteristicTypes;
+ (id)targetValueCharacteristicType;
+ (id)titleStringForState:(int64_t)a3;
+ (id)unknownValueDescriptionString;
+ (unint64_t)abstractCurrentModeInResponse:(id)a3;
+ (unint64_t)abstractTargetModeInResponse:(id)a3;
+ (unint64_t)statusItemCategory;
- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3;
- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3;
@end

@implementation HFTemperatureStatusItem

+ (id)sensorServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D858], 0);
}

+ (id)controllableServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D870], *MEMORY[0x263F0D708], 0);
}

+ (id)targetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C550];
}

+ (id)targetModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C4D8], *MEMORY[0x263F0C4D0], 0);
}

+ (id)minimumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C1A0];
}

+ (id)maximumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C020];
}

+ (id)currentModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C068], *MEMORY[0x263F0C058], 0);
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  return 0;
}

+ (id)currentValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C110];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"thermometer"];
  return v3;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleTemperature", @"HFStatusTitleTemperature", 1);
}

+ (unint64_t)statusItemCategory
{
  return 2;
}

+ (id)overrideValueDisplayRange
{
  return +[HFNumberRange rangeWithMaxValue:&unk_26C0F7D28 minValue:&unk_26C0F7D40];
}

+ (id)customValueFormatter
{
  v2 = +[HFFormatterManager sharedInstance];
  v3 = [v2 temperatureFormatter];

  [v3 setInputIsCelsius:1];
  return v3;
}

+ (id)unknownValueDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTemperatureStateUnknown", @"HFStatusTemperatureStateUnknown", 1);
}

+ (id)displayValueComparator
{
  return &__block_literal_global_227;
}

uint64_t __49__HFTemperatureStatusItem_displayValueComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2;
  v12[3] = &unk_264091450;
  id v6 = v4;
  id v13 = v6;
  id v7 = v5;
  v8 = v7;
  id v14 = v7;
  if (v6) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = v7 != 0;
  }
  v10 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2((uint64_t)v12);
    v10 = v14;
  }

  return v9;
}

uint64_t __49__HFTemperatureStatusItem_displayValueComparator__block_invoke_2(uint64_t a1)
{
  v2 = +[HFTemperatureUnitCoordinator sharedCoordinator];
  int v3 = [v2 isCelsius];

  if (v3)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
    id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F08980]);
    [*(id *)(a1 + 32) doubleValue];
    double v8 = v7;
    uint64_t v9 = [MEMORY[0x263F08D20] celsius];
    v10 = (void *)[v6 initWithDoubleValue:v9 unit:v8];

    v11 = NSNumber;
    v12 = [MEMORY[0x263F08D20] fahrenheit];
    id v13 = [v10 measurementByConvertingToUnit:v12];
    [v13 doubleValue];
    id v14 = objc_msgSend(v11, "numberWithDouble:");
    id v4 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v14, "integerValue"));

    id v15 = objc_alloc(MEMORY[0x263F08980]);
    [*(id *)(a1 + 40) doubleValue];
    double v17 = v16;
    v18 = [MEMORY[0x263F08D20] celsius];
    v19 = (void *)[v15 initWithDoubleValue:v18 unit:v17];

    v20 = NSNumber;
    v21 = [MEMORY[0x263F08D20] fahrenheit];
    v22 = [v19 measurementByConvertingToUnit:v21];
    [v22 doubleValue];
    v23 = objc_msgSend(v20, "numberWithDouble:");
    id v5 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v23, "integerValue"));
  }
  uint64_t v24 = [v4 compare:v5];

  return v24;
}

+ (BOOL)isPercentRange
{
  return 0;
}

+ (id)titleStringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = _HFLocalizedStringWithDefaultValue(off_26409C168[a3], off_26409C168[a3], 1);
  }
  return v4;
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  uint64_t v3 = +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", [v3 integerValue]);
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  uint64_t v3 = +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = +[HFTargetRangeUtilities rangeModeForHeatingCoolingMode:](HFTargetRangeUtilities, "rangeModeForHeatingCoolingMode:", [v3 integerValue]);
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

@end