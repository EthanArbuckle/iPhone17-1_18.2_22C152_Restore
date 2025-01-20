@interface NSDateComponents
@end

@implementation NSDateComponents

void __64__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponents__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v2 = objc_msgSend(v1, "hf_dailyWeekdayIntervalComponentsWithCalendar:", v4);
  v3 = (void *)_MergedGlobals_230;
  _MergedGlobals_230 = v2;
}

id __77__NSDateComponents_Additions__hf_dailyWeekdayIntervalComponentsWithCalendar___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v2 setWeekday:(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))++];
  return v2;
}

uint64_t __57__NSDateComponents_Additions__hf_dailyIntervalComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)qword_26AB2EE40;
  qword_26AB2EE40 = (uint64_t)v0;

  id v2 = (void *)qword_26AB2EE40;
  return [v2 setDay:1];
}

uint64_t __58__NSDateComponents_Additions__hf_weeklyIntervalComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)qword_26AB2EE50;
  qword_26AB2EE50 = (uint64_t)v0;

  id v2 = (void *)qword_26AB2EE50;
  return [v2 setWeekOfYear:1];
}

uint64_t __60__NSDateComponents_Additions__hf_biweeklyIntervalComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)qword_26AB2EE60;
  qword_26AB2EE60 = (uint64_t)v0;

  id v2 = (void *)qword_26AB2EE60;
  return [v2 setWeekOfYear:2];
}

uint64_t __59__NSDateComponents_Additions__hf_monthlyIntervalComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)qword_26AB2EE70;
  qword_26AB2EE70 = (uint64_t)v0;

  id v2 = (void *)qword_26AB2EE70;
  return [v2 setMonth:1];
}

uint64_t __58__NSDateComponents_Additions__hf_yearlyIntervalComponents__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF918]);
  v1 = (void *)qword_26AB2EE80;
  qword_26AB2EE80 = (uint64_t)v0;

  id v2 = (void *)qword_26AB2EE80;
  return [v2 setYear:1];
}

uint64_t __47__NSDateComponents_Additions__hf_absoluteValue__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) valueForComponent:a2];
  if (v4 >= 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = -v4;
  }
  return [v3 setValue:v5 forComponent:a2];
}

uint64_t __47__NSDateComponents_Additions__hf_negativeValue__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = -[*(id *)(a1 + 40) valueForComponent:a2];
  return [v3 setValue:v4 forComponent:a2];
}

id __71__NSDateComponents_Additions__hf_compareNextMatchingDate_withCalendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqual:*(void *)(a1 + 32)])
  {
    id v4 = *(id *)(a1 + 40);
  }
  else
  {
    id v4 = [*(id *)(a1 + 48) nextDateAfterDate:*(void *)(a1 + 40) matchingComponents:v3 options:1024];
  }
  uint64_t v5 = v4;

  return v5;
}

uint64_t __76__NSDateComponents_Additions__hf_zeroDateComponentsWithComponents_calendar___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) minimumRangeOfUnit:a2];
  return [v3 setValue:v4 forComponent:a2];
}

uint64_t __49__NSDateComponents_Additions__hf_validComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= a2;
  }
  return result;
}

@end