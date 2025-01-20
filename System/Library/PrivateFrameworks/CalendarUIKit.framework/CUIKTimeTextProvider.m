@interface CUIKTimeTextProvider
+ (BOOL)_use24HourFormatForLocale:(id)a3;
+ (id)_applyFont:(id)a3 toString:(id)a4 allowSmallCaps:(BOOL)a5;
+ (id)_dateFormatterWithCalendar:(id)a3 dropDesignator:(BOOL)a4 designatorRequiresWhitespace:(BOOL)a5 retainZeroMinutes:(BOOL)a6 dateHasZeroMinutes:(BOOL)a7 addDate:(BOOL)a8;
+ (id)_timeAttributedTextWithDate:(id)a3 calendar:(id)a4 droppingDesignator:(BOOL)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 retainZeroMinutes:(BOOL)a8 addDate:(BOOL)a9;
+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4;
+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4 font:(id)a5 options:(int64_t)a6;
+ (void)force24HourFormatForUnitTests:(BOOL)a3 withLocale:(id)a4;
+ (void)resetForce24HourFormatForUnitTests;
@end

@implementation CUIKTimeTextProvider

+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4
{
  return (id)[a1 timeAttributedTextWithDate:a3 calendar:a4 font:0 options:0];
}

+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4 font:(id)a5 options:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((a6 & 2) != 0)
  {
    BOOL v13 = 1;
    if ((a6 & 4) != 0)
    {
LABEL_6:
      BOOL v14 = (a6 & 8) == 0;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v13 = +[CUIKTextProviderUtils designatorRequiresWhitespace];
    if ((a6 & 4) != 0) {
      goto LABEL_6;
    }
  }
  if (+[CUIKTextProviderUtils smallCapsAllowed]) {
    goto LABEL_6;
  }
  BOOL v14 = 0;
LABEL_8:
  LOBYTE(v20) = (a6 & 0x20) != 0;
  v15 = [a1 _timeAttributedTextWithDate:v10 calendar:v11 droppingDesignator:a6 & 1 designatorRequiresWhitespace:v13 smallCapsAllowed:v14 retainZeroMinutes:((unint64_t)a6 >> 4) & 1 addDate:v20];
  v16 = v15;
  if (v12)
  {
    id v17 = [a1 _applyFont:v12 toString:v15 allowSmallCaps:v14];
  }
  else
  {
    id v17 = v15;
  }
  v18 = v17;

  return v18;
}

+ (id)_applyFont:(id)a3 toString:(id)a4 allowSmallCaps:(BOOL)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  v27[0] = v7;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a4;
  id v10 = [v8 dictionaryWithObjects:v27 forKeys:&v26 count:1];
  id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v12 = [v9 string];
  BOOL v13 = (void *)[v11 initWithString:v12 attributes:v10];

  uint64_t v14 = [v9 length];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __59__CUIKTimeTextProvider__applyFont_toString_allowSmallCaps___block_invoke;
  v22 = &unk_1E636ACB8;
  id v23 = v13;
  id v24 = v7;
  BOOL v25 = a5;
  id v15 = v7;
  id v16 = v13;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, &v19);

  id v17 = objc_msgSend(v16, "copy", v19, v20, v21, v22);

  return v17;
}

void __59__CUIKTimeTextProvider__applyFont_toString_allowSmallCaps___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = [a2 objectForKeyedSubscript:@"CUIKSmallCapsAttributeName"];
  if ([v10 BOOLValue])
  {
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) CUIKFontWithLocalizedSmallCaps:*(unsigned __int8 *)(a1 + 48)];
    objc_msgSend(v8, "addAttribute:value:range:", v7, v9, a3, a4);
  }
}

+ (id)_timeAttributedTextWithDate:(id)a3 calendar:(id)a4 droppingDesignator:(BOOL)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 retainZeroMinutes:(BOOL)a8 addDate:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_msgSend(a1, "_dateFormatterWithCalendar:dropDesignator:designatorRequiresWhitespace:retainZeroMinutes:dateHasZeroMinutes:addDate:", v15, v12, v11, v9, objc_msgSend(v15, "component:fromDate:", 64, v16) == 0, a9);

  v18 = [v17 _attributedStringWithFieldsFromDate:v16];

  id v19 = objc_alloc(MEMORY[0x1E4F28E48]);
  uint64_t v20 = [v18 string];
  v21 = (void *)[v19 initWithString:v20];

  uint64_t v22 = [v18 length];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __152__CUIKTimeTextProvider__timeAttributedTextWithDate_calendar_droppingDesignator_designatorRequiresWhitespace_smallCapsAllowed_retainZeroMinutes_addDate___block_invoke;
  v25[3] = &unk_1E636AE10;
  id v23 = v21;
  id v26 = v23;
  BOOL v27 = a7;
  objc_msgSend(v18, "enumerateAttributesInRange:options:usingBlock:", 0, v22, 0, v25);

  return v23;
}

void __152__CUIKTimeTextProvider__timeAttributedTextWithDate_calendar_droppingDesignator_designatorRequiresWhitespace_smallCapsAllowed_retainZeroMinutes_addDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1C378]];
  if ([v9 hasPrefix:@"a"])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    objc_msgSend(v7, "addAttribute:value:range:", @"CUIKSmallCapsAttributeName", v8, a3, a4);
  }
}

+ (void)force24HourFormatForUnitTests:(BOOL)a3 withLocale:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  if (!force24HourFormatRegistry_0)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)force24HourFormatRegistry_0;
    force24HourFormatRegistry_0 = v6;
  }
  v8 = [NSNumber numberWithBool:v4];
  id v9 = (void *)force24HourFormatRegistry_0;
  id v10 = [v5 localeIdentifier];

  [v9 setObject:v8 forKeyedSubscript:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
}

+ (void)resetForce24HourFormatForUnitTests
{
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  v2 = (void *)force24HourFormatRegistry_0;
  force24HourFormatRegistry_0 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
}

+ (BOOL)_use24HourFormatForLocale:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  BOOL v4 = (void *)force24HourFormatRegistry_0;
  id v5 = [v3 localeIdentifier];

  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = CUIKShow24Hours();
  }
  BOOL v8 = v7;

  return v8;
}

+ (id)_dateFormatterWithCalendar:(id)a3 dropDesignator:(BOOL)a4 designatorRequiresWhitespace:(BOOL)a5 retainZeroMinutes:(BOOL)a6 dateHasZeroMinutes:(BOOL)a7 addDate:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  int v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  if (_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__onceToken != -1) {
    dispatch_once(&_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__onceToken, &__block_literal_global_21);
  }
  id v15 = [v14 locale];
  uint64_t v16 = [a1 _use24HourFormatForLocale:v15];

  if (v16) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v9 & ~v10;
  }
  v18 = (void *)[v14 copy];
  id v19 = [[CUIKDateFormatterCacheKey alloc] initWithCalendar:v18 is24HourFormat:v16 dropDesignator:v12 canDropMinutes:v17 designatorRequiresWhitespace:v11 addDate:v8];
  uint64_t v20 = [(id)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache objectForKey:v19];
  if (!v20)
  {
    uint64_t v20 = objc_opt_new();
    [v20 setCalendar:v18];
    v21 = [v18 timeZone];
    [v20 setTimeZone:v21];

    uint64_t v22 = [v18 locale];
    [v20 setLocale:v22];

    if (v8)
    {
      [v20 setDateStyle:1];
      [v20 setTimeStyle:1];
    }
    else
    {
      id v23 = @"j";
      if (v12) {
        id v23 = @"J";
      }
      id v24 = v23;
      BOOL v25 = v24;
      if (v17)
      {
        id v26 = v24;
      }
      else
      {
        id v26 = [(__CFString *)v24 stringByAppendingString:@"mm"];
      }
      BOOL v27 = v26;
      v28 = (void *)MEMORY[0x1E4F28C10];
      v29 = [v18 locale];
      v30 = [v28 dateFormatFromTemplate:v27 options:0 locale:v29];

      v31 = +[CUIKTextProviderUtils timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:v30 designatorRequiresWhitespace:v11];

      [v20 setDateFormat:v31];
    }
    [(id)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache setObject:v20 forKey:v19];
  }
  id v32 = v20;

  return v32;
}

void __140__CUIKTimeTextProvider__dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache;
  _dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache = v0;
}

@end