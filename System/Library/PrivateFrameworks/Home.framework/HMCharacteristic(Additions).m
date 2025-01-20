@interface HMCharacteristic(Additions)
+ (id)_hf_alarmCharacteristicTypeToAbnormalValueMap;
+ (id)_hf_valueRangeCharacteristicTypeToAbnormalValueMap;
+ (id)_hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap;
+ (id)_hf_visibleLightLevelTriggerValues;
+ (id)hf_abnormalValueForAlarmCharacteristicType:()Additions;
+ (id)hf_abnormalValueForSensorCharacteristicType:()Additions;
+ (id)hf_alarmCharacteristicTypes;
+ (id)hf_associatedCharacteristicTypeForCharacteristicType:()Additions;
+ (id)hf_characteristicSortComparator;
+ (id)hf_continuousValueRangeCharacteristicTypes;
+ (id)hf_currentStateCharacteristicTypeForTargetStateCharacteristicType:()Additions;
+ (id)hf_defaultAbnormalValueForValueRangeSensorCharacteristicType:()Additions;
+ (id)hf_descriptionForCharacteristicType:()Additions;
+ (id)hf_powerStateCharacteristicTypes;
+ (id)hf_sensingCharacteristicTypes;
+ (id)hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:()Additions;
+ (id)hf_valueRangeCharacteristicTypes;
+ (uint64_t)_hf_indexOfSortedValues:()Additions closestToValue:top:bottom:;
+ (uint64_t)hf_indexOfSortedValues:()Additions closestToValue:;
+ (uint64_t)hf_shouldCaptureCharacteristicTypeInActionSets:()Additions;
+ (uint64_t)hf_sortPriorityForCharacteristicType:()Additions;
- (HFMultiStateValueSet)hf_programmableSwitchValidValueSet;
- (id)_hf_lightLevelVisibleTriggerValues;
- (id)_hf_stepValue;
- (id)_hf_triggerValuesWithMinStepValue:()Additions;
- (id)hf_associatedCharacteristicType;
- (id)hf_characteristicTypeDescription;
- (id)hf_defaultValue;
- (id)hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:()Additions;
- (id)hf_eventTriggers;
- (id)hf_eventTriggersForTriggerValue:()Additions;
- (id)hf_formattedValueUpdatedTime;
- (id)hf_home;
- (id)hf_maximumTriggerValue;
- (id)hf_minimumTriggerValue;
- (id)hf_programmableSwitchTriggerValueToEventTriggersMap;
- (id)hf_thresholdValueForRange:()Additions;
- (id)hf_triggerValues;
- (id)hf_valueAfterTriggerValue:()Additions;
- (id)hf_valueBeforeTriggerValue:()Additions;
- (id)hf_visibleTriggerValues;
- (uint64_t)hf_isReadable;
- (uint64_t)hf_isWritable;
- (uint64_t)hf_shouldCaptureInActionSets;
- (uint64_t)hf_sortPriority;
@end

@implementation HMCharacteristic(Additions)

+ (id)hf_characteristicSortComparator
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__HMCharacteristic_Additions__hf_characteristicSortComparator__block_invoke;
  v4[3] = &__block_descriptor_48_e11_q24__0_8_16l;
  v4[4] = a1;
  v4[5] = a2;
  v2 = _Block_copy(v4);
  return v2;
}

+ (id)hf_powerStateCharacteristicTypes
{
  if (_MergedGlobals_293 != -1) {
    dispatch_once(&_MergedGlobals_293, &__block_literal_global_3_25);
  }
  v0 = (void *)qword_26AB2F988;
  return v0;
}

+ (uint64_t)hf_sortPriorityForCharacteristicType:()Additions
{
  uint64_t v3 = qword_26AB2FA38;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FA38, &__block_literal_global_40_6);
  }
  v5 = [(id)qword_26AB2FA30 objectForKeyedSubscript:v4];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &unk_26C0F75F0;
  }
  uint64_t v7 = [v6 integerValue];

  return v7;
}

- (id)hf_characteristicTypeDescription
{
  v2 = objc_opt_class();
  uint64_t v3 = [a1 characteristicType];
  id v4 = objc_msgSend(v2, "hf_descriptionForCharacteristicType:", v3);

  return v4;
}

+ (id)hf_descriptionForCharacteristicType:()Additions
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() localizedDescriptionForCharacteristicType:v3];

  return v4;
}

- (uint64_t)hf_isWritable
{
  v1 = [a1 properties];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x263F0BEF0]];

  return v2;
}

- (uint64_t)hf_isReadable
{
  v1 = [a1 properties];
  uint64_t v2 = [v1 containsObject:*MEMORY[0x263F0BED8]];

  return v2;
}

+ (id)_hf_alarmCharacteristicTypeToAbnormalValueMap
{
  if (qword_26AB2F9D0 != -1) {
    dispatch_once(&qword_26AB2F9D0, &__block_literal_global_8_8);
  }
  v0 = (void *)qword_26AB2F9D8;
  return v0;
}

+ (id)_hf_valueRangeCharacteristicTypeToAbnormalValueMap
{
  if (qword_26AB2F9E0 != -1) {
    dispatch_once(&qword_26AB2F9E0, &__block_literal_global_17_7);
  }
  v0 = (void *)qword_26AB2F9E8;
  return v0;
}

+ (id)hf_sensingCharacteristicTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  v1 = __60__HMCharacteristic_Additions__hf_sensingCharacteristicTypes__block_invoke((uint64_t)v3);
  return v1;
}

+ (id)hf_valueRangeCharacteristicTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  v1 = __63__HMCharacteristic_Additions__hf_valueRangeCharacteristicTypes__block_invoke((uint64_t)v3);
  return v1;
}

+ (id)hf_alarmCharacteristicTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  v1 = __58__HMCharacteristic_Additions__hf_alarmCharacteristicTypes__block_invoke((uint64_t)v3);
  return v1;
}

+ (id)hf_continuousValueRangeCharacteristicTypes
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  v1 = __73__HMCharacteristic_Additions__hf_continuousValueRangeCharacteristicTypes__block_invoke((uint64_t)v3);
  return v1;
}

+ (id)hf_abnormalValueForAlarmCharacteristicType:()Additions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_hf_alarmCharacteristicTypeToAbnormalValueMap");
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)hf_defaultAbnormalValueForValueRangeSensorCharacteristicType:()Additions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_hf_valueRangeCharacteristicTypeToAbnormalValueMap");
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (id)hf_abnormalValueForSensorCharacteristicType:()Additions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_abnormalValueForAlarmCharacteristicType:", v4);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "hf_defaultAbnormalValueForValueRangeSensorCharacteristicType:", v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (id)_hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap
{
  if (qword_26AB2F9F0 != -1) {
    dispatch_once(&qword_26AB2F9F0, &__block_literal_global_28_4);
  }
  v0 = (void *)qword_26AB2F9F8;
  return v0;
}

- (id)hf_formattedValueUpdatedTime
{
  if (qword_26AB2FA08 != -1) {
    dispatch_once(&qword_26AB2FA08, &__block_literal_global_32_3);
  }
  uint64_t v2 = [a1 valueUpdatedTime];
  if (v2)
  {
    id v3 = (void *)qword_26AB2FA00;
    id v4 = [a1 valueUpdatedTime];
    v5 = [v3 stringFromDate:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)hf_defaultValue
{
  v1 = [a1 metadata];
  uint64_t v2 = [v1 format];
  if ([v2 isEqualToString:*MEMORY[0x263F0BE38]])
  {
    id v3 = (id)MEMORY[0x263EFFA80];
  }
  else if (objc_msgSend(v1, "hf_isNumeric"))
  {
    uint64_t v4 = [v1 minimumValue];
    v5 = (void *)v4;
    v6 = &unk_26C0F8038;
    if (v4) {
      v6 = (void *)v4;
    }
    id v3 = v6;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)hf_associatedCharacteristicType
{
  uint64_t v2 = objc_opt_class();
  id v3 = [a1 characteristicType];
  uint64_t v4 = objc_msgSend(v2, "hf_associatedCharacteristicTypeForCharacteristicType:", v3);

  return v4;
}

+ (id)hf_associatedCharacteristicTypeForCharacteristicType:()Additions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hf_currentStateCharacteristicTypeForTargetStateCharacteristicType:", v4);
  if (!v5)
  {
    v5 = objc_msgSend(a1, "hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:", v4);
  }

  return v5;
}

+ (id)hf_targetStateCharacteristicTypeForCurrentStateCharacteristicType:()Additions
{
  uint64_t v3 = qword_26AB2FA18;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FA18, &__block_literal_global_36_3);
  }
  v5 = [(id)qword_26AB2FA10 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)hf_currentStateCharacteristicTypeForTargetStateCharacteristicType:()Additions
{
  uint64_t v3 = qword_26AB2FA28;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2FA28, &__block_literal_global_38_3);
  }
  v5 = [(id)qword_26AB2FA20 objectForKeyedSubscript:v4];

  return v5;
}

- (uint64_t)hf_sortPriority
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = [a1 characteristicType];
  uint64_t v4 = objc_msgSend(v2, "hf_sortPriorityForCharacteristicType:", v3);

  return v4;
}

+ (uint64_t)hf_shouldCaptureCharacteristicTypeInActionSets:()Additions
{
  id v3 = a3;
  if (qword_26AB2FA40 != -1) {
    dispatch_once(&qword_26AB2FA40, &__block_literal_global_85_0);
  }
  id v4 = (id)qword_26AB2FA48;
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (uint64_t)hf_shouldCaptureInActionSets
{
  if (!objc_msgSend(a1, "hf_isReadable") || !objc_msgSend(a1, "hf_isWritable")) {
    return 0;
  }
  uint64_t v2 = objc_opt_class();
  id v3 = [a1 characteristicType];
  uint64_t v4 = objc_msgSend(v2, "hf_shouldCaptureCharacteristicTypeInActionSets:", v3);

  return v4;
}

- (HFMultiStateValueSet)hf_programmableSwitchValidValueSet
{
  uint64_t v2 = [a1 metadata];
  id v3 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v2];
  uint64_t v4 = [a1 characteristicType];
  char v5 = [v4 isEqualToString:*MEMORY[0x263F0C208]];

  if (v5)
  {
    objc_initWeak(&location, a1);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__HMCharacteristic_Additions__hf_programmableSwitchValidValueSet__block_invoke;
    aBlock[3] = &unk_264099050;
    objc_copyWeak(&v22, &location);
    v6 = _Block_copy(aBlock);
    id v7 = [v2 validValues];
    v8 = [v2 validValues];
    if (![v8 count])
    {
      v9 = [v2 format];
      int v10 = [v9 isEqualToString:*MEMORY[0x263F0BE70]];

      if (!v10)
      {
LABEL_12:
        [(HFMultiStateValueSet *)v3 addValuesFromArray:v7 displayResultsGenerator:v6];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
        goto LABEL_14;
      }
      v11 = [v2 minimumValue];
      v12 = v11;
      if (!v11) {
        v11 = &unk_26C0F75F0;
      }
      uint64_t v13 = [v11 integerValue];

      v14 = [v2 maximumValue];
      v15 = v14;
      if (!v14) {
        v14 = &unk_26C0F7608;
      }
      uint64_t v16 = [v14 integerValue];

      v17 = [v2 stepValue];
      v18 = v17;
      if (!v17) {
        v17 = &unk_26C0F7590;
      }
      uint64_t v19 = [v17 integerValue];

      objc_msgSend(MEMORY[0x263EFF8C0], "hf_arrayWithNumbersInRange:stride:", v13, v16 - v13, v19);
      id v7 = v8 = v7;
    }

    goto LABEL_12;
  }
  NSLog(&cfstr_MethodCalledFr.isa, 0);
LABEL_14:

  return v3;
}

- (id)hf_home
{
  v1 = [a1 service];
  uint64_t v2 = [v1 accessory];
  id v3 = [v2 home];

  return v3;
}

- (id)hf_eventTriggers
{
  uint64_t v2 = objc_opt_new();
  id v3 = objc_msgSend(a1, "hf_home");
  uint64_t v4 = [v3 triggers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HMCharacteristic_Additions__hf_eventTriggers__block_invoke;
  v10[3] = &unk_2640990A0;
  v10[4] = a1;
  uint64_t v5 = objc_msgSend(v4, "na_filter:", v10);
  v6 = (void *)v5;
  id v7 = (void *)MEMORY[0x263EFFA68];
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  [v2 addObjectsFromArray:v8];
  return v2;
}

- (id)hf_eventTriggersForTriggerValue:()Additions
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"HMCharacteristic+HFAdditions.m", 472, @"Invalid parameter not satisfying: %@", @"triggerValue" object file lineNumber description];
  }
  v6 = objc_opt_new();
  id v7 = objc_msgSend(a1, "hf_home");
  id v8 = [v7 triggers];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__HMCharacteristic_Additions__hf_eventTriggersForTriggerValue___block_invoke;
  v16[3] = &unk_2640990F0;
  v16[4] = a1;
  id v17 = v5;
  id v9 = v5;
  uint64_t v10 = objc_msgSend(v8, "na_filter:", v16);
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x263EFFA68];
  if (v10) {
    v12 = (void *)v10;
  }
  id v13 = v12;

  [v6 addObjectsFromArray:v13];
  return v6;
}

- (id)hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:()Additions
{
  v1 = objc_msgSend(a1, "hf_eventTriggersForTriggerValue:");
  uint64_t v2 = objc_msgSend(v1, "na_filter:", &__block_literal_global_110_0);
  if ((unint64_t)[v2 count] >= 2) {
    NSLog(&cfstr_HomeappSomehow.isa);
  }
  if ([v2 count] == 1)
  {
    id v3 = [v2 anyObject];
  }
  else
  {
    uint64_t v4 = (void *)[v1 mutableCopy];
    [v4 minusSet:v2];
    if ([v4 count] == 1)
    {
      id v3 = [v4 anyObject];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)hf_programmableSwitchTriggerValueToEventTriggersMap
{
  uint64_t v2 = objc_msgSend(a1, "hf_eventTriggers");
  if ([v2 count])
  {
    id v3 = objc_opt_new();
    uint64_t v4 = objc_msgSend(a1, "hf_programmableSwitchValidValueSet");
    id v5 = [v4 sortedValues];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__HMCharacteristic_Additions__hf_programmableSwitchTriggerValueToEventTriggersMap__block_invoke;
    v10[3] = &unk_264099188;
    id v6 = v3;
    id v11 = v6;
    id v12 = v2;
    [v5 enumerateObjectsUsingBlock:v10];

    id v7 = v12;
    id v8 = v6;
  }
  else
  {
    id v8 = (id)MEMORY[0x263EFFA78];
  }

  return v8;
}

- (id)hf_valueBeforeTriggerValue:()Additions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hf_triggerValues");
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "hf_indexOfSortedValues:closestToValue:", v5, v4);

  if ((unint64_t)(v6 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_msgSend(v5, "objectAtIndexedSubscript:");
  }

  return v7;
}

- (id)hf_valueAfterTriggerValue:()Additions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "hf_triggerValues");
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "hf_indexOfSortedValues:closestToValue:", v5, v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 >= [v5 count] - 1)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndexedSubscript:v6 + 1];
  }

  return v7;
}

- (id)hf_thresholdValueForRange:()Additions
{
  id v4 = a3;
  id v5 = [v4 minValue];
  uint64_t v6 = [v4 maxValue];

  id v7 = [v4 minValue];
  id v8 = v7;
  if (v5 != v6)
  {
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      objc_msgSend(a1, "hf_minimumTriggerValue");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = v9;

    id v11 = [v4 maxValue];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      objc_msgSend(a1, "hf_maximumTriggerValue");
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v15 = objc_msgSend(a1, "hf_minimumTriggerValue");
    if ([v10 compare:v15])
    {
    }
    else
    {
      id v17 = objc_msgSend(a1, "hf_maximumTriggerValue");
      uint64_t v18 = [v14 compare:v17];

      if (v18)
      {
        uint64_t v19 = objc_msgSend(a1, "hf_valueAfterTriggerValue:", v14);
        goto LABEL_17;
      }
    }
    uint64_t v16 = objc_msgSend(a1, "hf_maximumTriggerValue");
    if ([v14 compare:v16])
    {

LABEL_12:
      id v8 = 0;
LABEL_18:

      goto LABEL_19;
    }
    v20 = objc_msgSend(a1, "hf_minimumTriggerValue");
    uint64_t v21 = [v10 compare:v20];

    if (!v21) {
      goto LABEL_12;
    }
    uint64_t v19 = objc_msgSend(a1, "hf_valueBeforeTriggerValue:", v10);
LABEL_17:
    id v8 = (void *)v19;
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

- (id)hf_minimumTriggerValue
{
  uint64_t v2 = [a1 characteristicType];
  char v3 = [v2 isEqualToString:*MEMORY[0x263F0BF40]];

  if (v3)
  {
    id v4 = &unk_26C0F7620;
  }
  else
  {
    id v5 = [a1 metadata];
    id v4 = [v5 minimumValue];
  }
  return v4;
}

- (id)hf_maximumTriggerValue
{
  v1 = [a1 metadata];
  uint64_t v2 = [v1 maximumValue];

  return v2;
}

- (id)hf_triggerValues
{
  uint64_t v2 = [a1 metadata];
  if ((objc_msgSend(v2, "hf_isNumeric") & 1) == 0
    || (objc_msgSend(a1, "hf_minimumTriggerValue"), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_10;
  }
  id v4 = (void *)v3;
  id v5 = objc_msgSend(a1, "hf_maximumTriggerValue");

  if (!v5)
  {
LABEL_10:
    id v9 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [a1 metadata];
  id v7 = [v6 format];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F0BE40]];

  if (v8)
  {
    id v9 = [MEMORY[0x263EFF980] array];
    uint64_t v10 = objc_msgSend(a1, "_hf_stepValue");
    [v10 floatValue];
    float v12 = v11;

    id v13 = objc_msgSend(a1, "hf_minimumTriggerValue");
    [v13 floatValue];
    float v15 = v14;

    uint64_t v16 = objc_msgSend(a1, "hf_maximumTriggerValue");
    [v16 floatValue];
    float v18 = v17;

    for (; v15 <= v18; float v15 = v12 + v15)
    {
      *(float *)&double v19 = v15;
      v20 = [NSNumber numberWithFloat:v19];
      [v9 addObject:v20];
    }
    if ((float)(v15 - v12) < v18)
    {
      *(float *)&double v19 = v18;
      uint64_t v21 = [NSNumber numberWithFloat:v19];
      [v9 addObject:v21];
    }
  }
  else
  {
    id v9 = objc_msgSend(a1, "_hf_triggerValuesWithMinStepValue:", 0);
  }
LABEL_11:
  return v9;
}

- (id)hf_visibleTriggerValues
{
  uint64_t v2 = [a1 characteristicType];
  int v3 = [v2 isEqualToString:*MEMORY[0x263F0C0A0]];

  if (v3)
  {
    id v4 = objc_msgSend(a1, "_hf_lightLevelVisibleTriggerValues");
  }
  else
  {
    id v5 = objc_msgSend((id)objc_opt_class(), "_hf_valueRangeCharacteristicTypeToVisibleTriggerValueStepMap");
    uint64_t v6 = [a1 characteristicType];
    id v7 = [v5 objectForKeyedSubscript:v6];

    if (v7) {
      objc_msgSend(a1, "_hf_triggerValuesWithMinStepValue:", v7);
    }
    else {
    id v4 = objc_msgSend(a1, "hf_triggerValues");
    }
  }
  return v4;
}

+ (uint64_t)hf_indexOfSortedValues:()Additions closestToValue:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]) {
    uint64_t v8 = objc_msgSend(a1, "_hf_indexOfSortedValues:closestToValue:top:bottom:", v6, v7, objc_msgSend(v6, "count") - 1, 0);
  }
  else {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

+ (uint64_t)_hf_indexOfSortedValues:()Additions closestToValue:top:bottom:
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 count])
  {
    uint64_t v12 = vcvtpd_u64_f64((double)(a5 - a6) * 0.5 + (double)a6);
    id v13 = [v10 objectAtIndexedSubscript:v12];
    float v14 = v13;
    if (a5 - a6 <= 1)
    {
      unint64_t v15 = v12 - 1;
      unint64_t v16 = v12 + 1;
      unint64_t v17 = [v10 count] - 1;
      if (v12 + 1 < v17) {
        unint64_t v17 = v12 + 1;
      }
      while (v15 <= v17)
      {
        float v18 = [v10 objectAtIndexedSubscript:v15];
        double v19 = [v10 objectAtIndexedSubscript:v12];
        [v18 doubleValue];
        double v21 = v20;
        [v11 doubleValue];
        double v23 = vabdd_f64(v21, v22);
        [v19 doubleValue];
        double v25 = v24;
        [v11 doubleValue];
        if (v23 < vabdd_f64(v25, v26)) {
          uint64_t v12 = v15;
        }

        ++v15;
        unint64_t v17 = [v10 count] - 1;
        if (v16 < v17) {
          unint64_t v17 = v16;
        }
      }
      goto LABEL_17;
    }
    uint64_t v27 = [v13 compare:v11];
    if (v27 == -1)
    {
      v28 = a1;
      id v29 = v10;
      id v30 = v11;
      uint64_t v31 = a5;
      unint64_t v32 = v12;
    }
    else
    {
      if (v27 != 1)
      {
LABEL_17:

        goto LABEL_18;
      }
      v28 = a1;
      id v29 = v10;
      id v30 = v11;
      uint64_t v31 = v12;
      unint64_t v32 = a6;
    }
    uint64_t v12 = objc_msgSend(v28, "_hf_indexOfSortedValues:closestToValue:top:bottom:", v29, v30, v31, v32);
    goto LABEL_17;
  }
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  return v12;
}

- (id)_hf_lightLevelVisibleTriggerValues
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "_hf_visibleLightLevelTriggerValues");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__HMCharacteristic_Additions___hf_lightLevelVisibleTriggerValues__block_invoke;
  v5[3] = &unk_26408FA78;
  v5[4] = a1;
  int v3 = objc_msgSend(v2, "na_map:", v5);

  return v3;
}

- (id)_hf_triggerValuesWithMinStepValue:()Additions
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  double v19 = __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke;
  double v20 = &unk_2640991B0;
  double v21 = a1;
  id v6 = v4;
  id v22 = v6;
  int v7 = __65__HMCharacteristic_Additions___hf_triggerValuesWithMinStepValue___block_invoke((uint64_t)&v17);
  uint64_t v8 = objc_msgSend(a1, "hf_minimumTriggerValue", v17, v18, v19, v20, v21);
  uint64_t v9 = [v8 intValue];

  id v10 = objc_msgSend(a1, "hf_maximumTriggerValue");
  int v11 = [v10 intValue];

  if ((int)v9 <= v11)
  {
    do
    {
      uint64_t v12 = [NSNumber numberWithInt:v9];
      [v5 addObject:v12];

      uint64_t v9 = (v9 + v7);
      id v13 = objc_msgSend(a1, "hf_maximumTriggerValue");
      int v14 = [v13 intValue];
    }
    while ((int)v9 <= v14);
  }
  unint64_t v15 = (void *)[v5 copy];

  return v15;
}

- (id)_hf_stepValue
{
  uint64_t v2 = [a1 metadata];
  uint64_t v3 = [v2 stepValue];
  id v4 = (void *)v3;
  id v5 = &unk_26C0F8300;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  int v7 = [a1 metadata];
  uint64_t v8 = [v7 format];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F0BE40]];

  if (v9)
  {
    [v6 floatValue];
    if (v10 < 0.01)
    {

      id v6 = &unk_26C0F8310;
    }
    int v11 = objc_msgSend(a1, "hf_maximumTriggerValue");
    [v11 floatValue];
    float v13 = v12;
    int v14 = objc_msgSend(a1, "hf_minimumTriggerValue");
    [v14 floatValue];
    float v16 = vabds_f32(v13, v15);

    [v6 floatValue];
    if ((float)(v16 / *(float *)&v17) > 10000.0)
    {
      *(float *)&double v17 = v16 / 10000.0;
      uint64_t v18 = [NSNumber numberWithFloat:v17];

      id v6 = (id)v18;
    }
  }
  return v6;
}

+ (id)_hf_visibleLightLevelTriggerValues
{
  if (qword_26AB2FA50 != -1) {
    dispatch_once(&qword_26AB2FA50, &__block_literal_global_126_0);
  }
  v0 = (void *)qword_26AB2FA58;
  return v0;
}

@end