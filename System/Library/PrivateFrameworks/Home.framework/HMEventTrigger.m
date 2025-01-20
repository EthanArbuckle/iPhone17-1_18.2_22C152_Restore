@interface HMEventTrigger
@end

@implementation HMEventTrigger

uint64_t __62__HMEventTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 weekday];
  return [v2 numberWithInteger:v3];
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C1021D8];
}

id __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HFEventBuilder eventBuilderForEvent:a2];
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C121548];
}

id __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 characteristic];
  uint64_t v3 = [v2 characteristicType];

  return v3;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristic];
  v4 = [v3 characteristicType];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

uint64_t __96__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_events_recurrences_forUser___block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_representativeTriggerValue");
}

uint64_t __98__HMEventTrigger_NaturalLanguage__hf_naturalLanguageNameWithOptions_characteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 characteristicType];
  if ([v4 isEqualToString:*MEMORY[0x263F0C008]])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = [v3 characteristicType];
    uint64_t v5 = [v6 containsObject:v7];
  }
  return v5;
}

uint64_t __105__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_sensorCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 characteristicType];

  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = *MEMORY[0x263F0C2C0];
  v20[0] = *MEMORY[0x263F0C288];
  v20[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v7 = [v3 characteristicType];
  char v8 = [v6 containsObject:v7];

  v9 = objc_msgSend(MEMORY[0x263F0E248], "hf_valueRangeCharacteristicTypes");
  v10 = [v3 characteristicType];
  char v11 = [v9 containsObject:v10];

  if (v11) {
    goto LABEL_5;
  }
  if (v8) {
    goto LABEL_5;
  }
  v12 = (void *)MEMORY[0x263F0E248];
  v13 = [v3 characteristicType];
  v14 = objc_msgSend(v12, "hf_abnormalValueForSensorCharacteristicType:", v13);
  int v15 = [v14 isEqual:*(void *)(a1 + 32)];

  if (v15)
  {
LABEL_5:
    v16 = *(void **)(a1 + 40);
    v17 = [v3 characteristicType];
    uint64_t v18 = [v16 containsObject:v17];
  }
  else
  {
LABEL_6:
    uint64_t v18 = 0;
  }

  return v18;
}

uint64_t __108__HMEventTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_nonSensorCharacteristics_triggerValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_containedServices");
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __105__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionFormatterWithCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

uint64_t __130__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValue_visibleTriggerValues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

uint64_t __134__HMEventTrigger_NaturalLanguage__hf_triggerRangeValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F0E248];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "hf_valueRangeCharacteristicTypes");
  uint64_t v5 = [v3 characteristicType];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

uint64_t __129__HMEventTrigger_NaturalLanguage__hf_triggerValueNaturalLanguageDescriptionWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

uint64_t __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

uint64_t __107__HMEventTrigger_NaturalLanguage__hf_triggerRangeTypeWithCharacteristics_triggerValueRange_thresholdValue___block_invoke_2(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "hf_minimumTriggerValue");
  id v3 = objc_msgSend(*(id *)(a1 + 32), "hf_maximumTriggerValue");
  uint64_t v4 = [*(id *)(a1 + 40) maxValue];
  if (v4)
  {
  }
  else
  {
    char v11 = [*(id *)(a1 + 40) minValue];

    if (v11) {
      goto LABEL_13;
    }
  }
  uint64_t v5 = [*(id *)(a1 + 40) minValue];
  if (v5)
  {
  }
  else
  {
    v12 = [*(id *)(a1 + 40) maxValue];

    if (v12)
    {
LABEL_15:
      uint64_t v10 = 1;
      goto LABEL_16;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 40) minValue];
  uint64_t v7 = [v6 compare:v2];

  char v8 = [*(id *)(a1 + 40) maxValue];
  uint64_t v9 = [v8 compare:v3];

  if (!v7 && v9 == -1)
  {
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  if (!v9 && v7 == 1) {
    goto LABEL_15;
  }
  if (*(void *)(a1 + 48)) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
LABEL_16:

  return v10;
}

uint64_t __89__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __109__HMEventTrigger_NaturalLanguage__hf_naturalLanguageDetailsWithRecurrences_conditions_endEvents_withOptions___block_invoke_2()
{
  v0 = objc_alloc_init(HFListFormatter);
  uint64_t v1 = qword_26AB2EF98;
  qword_26AB2EF98 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  uint64_t v5 = [v3 home];
  uint64_t v6 = +[HFConditionNaturalLanguageOptions optionsForCondition:v4 inHome:v5 formattingContext:a1[5] formattingStyle:a1[6]];

  uint64_t v7 = objc_msgSend(v4, "hf_naturalLanguageSummaryWithOptions:", v6);

  char v8 = [v7 conditionTitle];
  if ([v8 length])
  {
    uint64_t v9 = [v7 conditionTitle];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke_3()
{
  v0 = objc_alloc_init(HFListFormatter);
  uint64_t v1 = qword_26AB2EFA8;
  qword_26AB2EFA8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __126__HMEventTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithRecurrences_conditions_endEvents_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__HMEventTrigger_HFAdditions__hf_requiresConfirmationToRun__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __59__HMEventTrigger_HFAdditions__hf_requiresConfirmationToRun__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresDeviceUnlock");
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26C1021D8];
}

uint64_t __57__HMEventTrigger_HFEventTriggerAdditions__hf_triggerType__block_invoke_383(uint64_t a1, void *a2)
{
  id v3 = [a2 characteristic];
  id v4 = [v3 characteristicType];

  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __69__HMEventTrigger_HFEventTriggerAdditions__hf_isHomeAppCreatedTrigger__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v13 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v13;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 characteristic];
  uint64_t v7 = [v6 service];

  char v8 = objc_msgSend(MEMORY[0x263F0E708], "hf_programmableSwitchServiceTypes");
  uint64_t v9 = [v7 serviceType];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    char v11 = *(void **)(a1 + 32);
    v12 = [v7 accessory];
    objc_msgSend(v11, "na_safeAddObject:", v12);
  }
}

void __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v13 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v13;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 characteristic];
  uint64_t v7 = [v6 service];

  char v8 = objc_msgSend(MEMORY[0x263F0E708], "hf_programmableSwitchServiceTypes");
  uint64_t v9 = [v7 serviceType];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    char v11 = *(void **)(a1 + 32);
    v12 = [v7 accessory];
    objc_msgSend(v11, "na_safeAddObject:", v12);
  }
}

void __63__HMEventTrigger_HFEventTriggerAdditions__hf_designateTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = a2;
  id v3 = [*(id *)(a1 + 32) applicationData];
  id v4 = [v3 objectForKey:@"HFDesignatedTriggerAppDataKey"];
  id v5 = (void *)[v4 mutableCopy];

  if (v5)
  {
LABEL_4:
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 56)) {
      [v5 addObject:v6];
    }
    else {
      [v5 removeObject:v6];
    }
    [v3 setObject:v5 forKey:@"HFDesignatedTriggerAppDataKey"];
    objc_msgSend(*(id *)(a1 + 32), "hf_updateApplicationData:handleError:completionHandler:", v3, 1, v7);

    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = objc_opt_new();
    goto LABEL_4;
  }
  NSLog(&cfstr_TriggerIsAlrea.isa, *(void *)(a1 + 40));
  v7[2](v7, 0);
LABEL_8:
}

id __69__HMEventTrigger_HFEventTriggerAdditions__hf_characteristicsInEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    id v3 = (id)[v2 performSelector:sel_characteristic];
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C0F6E70, &unk_26C0F6E88, &unk_26C0F6EA0, 0);
  uint64_t v1 = qword_26AB2F468;
  qword_26AB2F468 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_2_410()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C0F6E70, &unk_26C0F6EA0, 0);
  uint64_t v1 = qword_26AB2F478;
  qword_26AB2F478 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_4()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", &unk_26C0F6E70, &unk_26C0F6EA0, &unk_26C0F6EB8, 0);
  uint64_t v1 = qword_26AB2F488;
  qword_26AB2F488 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __95__HMEventTrigger_HFEventTriggerAdditions__hf_allTriggerValuesForCharacteristic_similarToValue___block_invoke_419(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "_hf_valueIsValidForCharacteristic:value:", *(void *)(a1 + 32), a2);
}

uint64_t __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateWithBuilder:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x263F58190] futureWithResult:*(void *)(a1 + 32)];
}

uint64_t __70__HMEventTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEventTriggerFromBuilder:*(void *)(a1 + 40) completionHandler:a2];
}

@end