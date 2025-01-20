@interface HMTimerTrigger
@end

@implementation HMTimerTrigger

BOOL __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 weekday] >= 1 && objc_msgSend(v2, "weekday") != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

id __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 weekday] < 1)
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "weekday") - 1);
  }

  return v3;
}

uint64_t __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F30000];
  uint64_t v3 = (int)([a2 intValue] + 1);
  return [v2 weekdayIsWeekend:v3];
}

id __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 integerValue] < 0
    || (uint64_t v4 = [v3 integerValue], v4 >= objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue"));
  }

  return v5;
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_2()
{
  v0 = (void *)qword_26AB2EF38;
  qword_26AB2EF38 = @"timeString";
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_4()
{
  v0 = (void *)qword_26AB2EF48;
  qword_26AB2EF48 = @"weekdays";
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_6()
{
  v0 = (void *)qword_26AB2EF58;
  qword_26AB2EF58 = @"actionsDescription";
}

id __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_8;
  block[3] = &unk_26408DDE0;
  block[4] = *(void *)(a1 + 32);
  if (qword_26AB2EF60 != -1) {
    dispatch_once(&qword_26AB2EF60, block);
  }
  return (id)qword_26AB2EF68;
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_8(uint64_t a1)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = *(void *)(a1 + 32);
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  id v2 = (void *)qword_26AB2EF68;
  qword_26AB2EF68 = v1;
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_10()
{
  v0 = (void *)qword_26AB2EF78;
  qword_26AB2EF78 = (uint64_t)&unk_26C0F8340;
}

uint64_t __88__HMTimerTrigger_NaturalLanguage__hf_naturalLanguageDetailsWithRecurrences_withOptions___block_invoke_2()
{
  v0 = objc_alloc_init(HFListFormatter);
  uint64_t v1 = qword_26AB2EF88;
  qword_26AB2EF88 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __70__HMTimerTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addTimerTriggerFromBuilder:*(void *)(a1 + 40) completionHandler:a2];
}

@end