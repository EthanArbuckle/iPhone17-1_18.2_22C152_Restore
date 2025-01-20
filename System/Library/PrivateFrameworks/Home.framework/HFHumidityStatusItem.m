@interface HFHumidityStatusItem
+ (BOOL)isPercentRange;
+ (BOOL)shouldShowAverageForRange:(id)a3;
+ (id)controllableServiceTypes;
+ (id)currentModeCharacteristicTypes;
+ (id)currentValueCharacteristicType;
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

@implementation HFHumidityStatusItem

+ (id)sensorServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D730], 0);
}

+ (id)controllableServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D720], *MEMORY[0x263F0D870], 0);
}

+ (id)targetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C530];
}

+ (id)targetModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C4F8], 0);
}

+ (id)minimumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C1C8];
}

+ (id)maximumTargetValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C148];
}

+ (id)currentModeCharacteristicTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C088], 0);
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  return 0;
}

+ (id)currentValueCharacteristicType
{
  return (id)*MEMORY[0x263F0C0E0];
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  v3 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"humidity.fill"];
  return v3;
}

- (id)defaultTitleForRepresentedHomeKitObjects:(id)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusTitleHumidity", @"HFStatusTitleHumidity", 1);
}

+ (unint64_t)statusItemCategory
{
  return 2;
}

+ (id)overrideValueDisplayRange
{
  return +[HFNumberRange rangeWithMaxValue:&unk_26C0F7200 minValue:&unk_26C0F7218];
}

+ (BOOL)isPercentRange
{
  return 1;
}

+ (id)unknownValueDescriptionString
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusHumidityStateUnknown", @"HFStatusHumidityStateUnknown", 1);
}

+ (id)displayValueComparator
{
  return &__block_literal_global_153;
}

uint64_t __46__HFHumidityStatusItem_displayValueComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2;
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
    uint64_t v9 = __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2((uint64_t)v12);
    v10 = v14;
  }

  return v9;
}

uint64_t __46__HFHumidityStatusItem_displayValueComparator__block_invoke_2(uint64_t a1)
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "integerValue"));
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  uint64_t v4 = [v2 compare:v3];

  return v4;
}

+ (id)titleStringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = _HFLocalizedStringWithDefaultValue(off_264097D38[a3], off_264097D38[a3], 1);
  }
  return v4;
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F0BEF8];
  id v4 = a3;
  id v5 = [v4 responseForCharacteristicType:v3];
  id v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C4F8]];

  v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  if ([v6 BOOLValue]) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = +[HFTargetRangeUtilities rangeModeForTargetHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForTargetHumidifierDehumidifierState:", [v8 integerValue]);
  }

  return v10;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F0C088];
  id v4 = a3;
  id v5 = [v4 responseForCharacteristicType:v3];
  id v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  id v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0BEF8]];

  v8 = [v7 valueWithExpectedClass:objc_opt_class()];

  if ([v8 BOOLValue]) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    unint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = [v6 integerValue];
    if (v11 == 3) {
      unint64_t v10 = 2;
    }
    else {
      unint64_t v10 = v11 == 2;
    }
  }

  return v10;
}

@end