@interface CUIKTimeIntervalTextProvider
+ (BOOL)_use24HourFormatForLocale:(id)a3;
+ (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4;
+ (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3;
+ (id)_dateFormatterWithCalendar:(id)a3 designatorRequiresWhitespace:(BOOL)a4 dateHasZeroMinutes:(BOOL)a5;
+ (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4;
+ (id)_timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 dropLeftRedundantDesignator:(BOOL)a8 keepRedundantDesignator:(BOOL)a9;
+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5;
+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6;
+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6 designatorRequiresWhitespace:(BOOL)a7 smallCapsAllowed:(BOOL)a8 dropLeftRedundantDesignator:(BOOL)a9;
+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 keepRedundantDesignator:(BOOL)a6;
+ (void)force24HourFormatForUnitTests:(BOOL)a3 withLocale:(id)a4;
+ (void)resetForce24HourFormatForUnitTests;
@end

@implementation CUIKTimeIntervalTextProvider

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = +[CUIKTextProviderUtils designatorRequiresWhitespace];
  BOOL v14 = +[CUIKTextProviderUtils smallCapsAllowed];
  LOBYTE(v17) = +[CUIKTextProviderUtils dropLeftRedundantDesignator];
  v15 = [a1 timeIntervalAttributedTextWithStartDate:v12 endDate:v11 calendar:v10 font:a6 designatorRequiresWhitespace:v13 smallCapsAllowed:v14 dropLeftRedundantDesignator:v17];

  return v15;
}

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6 designatorRequiresWhitespace:(BOOL)a7 smallCapsAllowed:(BOOL)a8 dropLeftRedundantDesignator:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [(__CTFont *)a6 CUIKFontWithAlternativePunctuation];
  uint64_t v35 = *MEMORY[0x1E4FB06F8];
  v36[0] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
  LOBYTE(v30) = 0;
  v20 = [a1 _timeIntervalAttributedTextWithStartDate:v17 endDate:v16 calendar:v15 designatorRequiresWhitespace:v10 smallCapsAllowed:v9 dropLeftRedundantDesignator:a9 keepRedundantDesignator:v30];

  id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
  v22 = [v20 string];
  v23 = (void *)[v21 initWithString:v22 attributes:v19];

  uint64_t v24 = [v20 length];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __168__CUIKTimeIntervalTextProvider_timeIntervalAttributedTextWithStartDate_endDate_calendar_font_designatorRequiresWhitespace_smallCapsAllowed_dropLeftRedundantDesignator___block_invoke;
  v31[3] = &unk_1E636ACB8;
  id v25 = v23;
  id v32 = v25;
  v33 = v18;
  BOOL v34 = v9;
  id v26 = v18;
  objc_msgSend(v20, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v31);
  v27 = v33;
  id v28 = v25;

  return v28;
}

void __71__CUIKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v10 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1C378]];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v9 + 32) = a3;
    *(void *)(v9 + 40) = a4;
    *a5 = 1;
  }
}

uint64_t __66__CUIKTimeIntervalTextProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"a"];
}

+ (id)_timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 dropLeftRedundantDesignator:(BOOL)a8 keepRedundantDesignator:(BOOL)a9
{
  BOOL v69 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  v76[1] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_msgSend(a1, "_dateFormatterWithCalendar:designatorRequiresWhitespace:dateHasZeroMinutes:", v14, v10, objc_msgSend(v14, "component:fromDate:", 64, v16) == 0);
  v18 = [v17 _attributedStringWithFieldsFromDate:v16];

  uint64_t v20 = [a1 _rangeOfDesignatorInAnnotatedTime:v18];
  v73 = v18;
  uint64_t v70 = v19;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v74 = 0;
  }
  else
  {
    id v21 = objc_msgSend(v18, "attributedSubstringFromRange:", v20, v19);
    uint64_t v74 = [v21 string];
  }
  v22 = objc_msgSend(a1, "_dateFormatterWithCalendar:designatorRequiresWhitespace:dateHasZeroMinutes:", v14, v10, objc_msgSend(v14, "component:fromDate:", 64, v15) == 0);

  v71 = v22;
  v23 = [v22 _attributedStringWithFieldsFromDate:v15];

  uint64_t v25 = [a1 _rangeOfDesignatorInAnnotatedTime:v23];
  uint64_t v26 = v24;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v27 = 0;
  }
  else
  {
    id v28 = objc_msgSend(v23, "attributedSubstringFromRange:", v25, v24);
    uint64_t v27 = [v28 string];
  }
  v29 = CUIKBundle();
  uint64_t v30 = [v29 localizedStringForKey:@"INTERVAL_HYPHEN_NARROW" value:@" – " table:0];

  v72 = (void *)v27;
  if (v74 | v27)
  {
    id v67 = v14;
    v75 = @"CUIKSmallCapsAttributeName";
    v44 = [NSNumber numberWithBool:v9];
    v76[0] = v44;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
    uint64_t v45 = v26;
    uint64_t v47 = v46 = v23;

    id v48 = objc_alloc(MEMORY[0x1E4F28E48]);
    v49 = [v73 string];
    v50 = (void *)[v48 initWithString:v49];

    objc_msgSend(v50, "addAttributes:range:", v47, v20, v70);
    id v51 = objc_alloc(MEMORY[0x1E4F28E48]);
    v68 = v46;
    v52 = [v46 string];
    v53 = (void *)[v51 initWithString:v52];

    v66 = (void *)v47;
    uint64_t v54 = v47;
    uint64_t v55 = v45;
    objc_msgSend(v53, "addAttributes:range:", v54, v25, v45);
    v56 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v30];
    if (a9)
    {
      v43 = v71;
      v62 = v66;
      BOOL v34 = v73;
      unint64_t v59 = 0x1E4F28000;
      id v14 = v67;
    }
    else
    {
      id v14 = v67;
      if (v72 && objc_msgSend((id)v74, "isEqualToString:"))
      {
        if (v69)
        {
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v57 = [v73 string];
            v58 = objc_msgSend(a1, "_stringByRemovingDesignatorRange:fromString:", v20, v70, v57);

            unint64_t v59 = 0x1E4F28000uLL;
            uint64_t v60 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v58];
            v61 = v50;
            v50 = (void *)v60;
LABEL_25:

            v43 = v71;
            v62 = v66;
            BOOL v34 = v73;
            goto LABEL_20;
          }
        }
        else if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v64 = [v68 string];
          v58 = objc_msgSend(a1, "_stringByRemovingDesignatorRange:fromString:", v25, v55, v64);

          unint64_t v59 = 0x1E4F28000uLL;
          uint64_t v65 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v58];
          v61 = v53;
          v53 = (void *)v65;
          goto LABEL_25;
        }
      }
      v43 = v71;
      v62 = v66;
      BOOL v34 = v73;
      unint64_t v59 = 0x1E4F28000uLL;
    }
LABEL_20:
    v42 = (void *)[objc_alloc(*(Class *)(v59 + 3656)) initWithAttributedString:v50];
    [v42 appendAttributedString:v56];
    [v42 appendAttributedString:v53];

    v23 = v68;
    goto LABEL_21;
  }
  v31 = [v14 locale];
  id v32 = [v31 languageCode];

  uint64_t v33 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v32];
  BOOL v34 = v73;
  uint64_t v35 = [v73 string];
  v36 = [v35 directionalityIsolatedString];

  v37 = [v23 string];
  v38 = [v37 directionalityIsolatedString];

  v39 = [NSString stringWithFormat:@"%@%@%@", v36, v30, v38];
  v40 = v39;
  if (v33 == 2)
  {
    uint64_t v41 = [v39 RTLString];

    v40 = (void *)v41;
  }
  v42 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v40];

  v43 = v71;
LABEL_21:

  return v42;
}

+ (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3 = [a1 _rangeOfAnnontatedTime:a3 matchingPattern:&__block_literal_global_27];
  result.length = v4;
  result.location = v3;
  return result;
}

+ (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3010000000;
  uint64_t v19 = &unk_1BE0B4516;
  long long v20 = xmmword_1BE0794D0;
  uint64_t v7 = [v5 length];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__CUIKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_1E636AD00;
  id v8 = v6;
  id v14 = v8;
  id v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  NSUInteger v9 = v17[4];
  NSUInteger v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  NSUInteger v11 = v9;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

+ (id)_dateFormatterWithCalendar:(id)a3 designatorRequiresWhitespace:(BOOL)a4 dateHasZeroMinutes:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__onceToken != -1) {
    dispatch_once(&_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__onceToken, &__block_literal_global_17);
  }
  NSUInteger v9 = [v8 locale];
  uint64_t v10 = [a1 _use24HourFormatForLocale:v9];

  uint64_t v11 = v5 & ~v10;
  NSUInteger v12 = (void *)[v8 copy];
  BOOL v13 = [[CUIKDateFormatterCacheKey alloc] initWithCalendar:v12 is24HourFormat:v10 dropDesignator:0 canDropMinutes:v11 designatorRequiresWhitespace:v6 addDate:0];
  id v14 = [(id)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache objectForKey:v13];
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    [v16 setCalendar:v12];
    id v17 = [v12 timeZone];
    [v16 setTimeZone:v17];

    uint64_t v18 = [v12 locale];
    [v16 setLocale:v18];

    uint64_t v19 = (void *)MEMORY[0x1E4F28C10];
    if (v11) {
      long long v20 = @"j";
    }
    else {
      long long v20 = @"jmm";
    }
    id v21 = [v12 locale];
    v22 = [v19 dateFormatFromTemplate:v20 options:0 locale:v21];

    v23 = +[CUIKTextProviderUtils timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:v22 designatorRequiresWhitespace:v6];

    [v16 setDateFormat:v23];
    [(id)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache setObject:v16 forKey:v13];
    id v15 = v16;
  }

  return v15;
}

+ (BOOL)_use24HourFormatForLocale:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  NSUInteger v4 = (void *)force24HourFormatRegistry;
  BOOL v5 = [v3 localeIdentifier];

  BOOL v6 = [v4 objectForKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = CUIKShow24Hours();
  }
  BOOL v8 = v7;

  return v8;
}

+ (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  NSUInteger v4 = objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_1F187C430);
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

void __168__CUIKTimeIntervalTextProvider_timeIntervalAttributedTextWithStartDate_endDate_calendar_font_designatorRequiresWhitespace_smallCapsAllowed_dropLeftRedundantDesignator___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = [a2 objectForKeyedSubscript:@"CUIKSmallCapsAttributeName"];
  if ([v10 BOOLValue])
  {
    uint64_t v7 = *MEMORY[0x1E4FB06F8];
    BOOL v8 = *(void **)(a1 + 32);
    NSUInteger v9 = [*(id *)(a1 + 40) CUIKFontWithLocalizedSmallCaps:*(unsigned __int8 *)(a1 + 48)];
    objc_msgSend(v8, "addAttribute:value:range:", v7, v9, a3, a4);
  }
}

void __107__CUIKTimeIntervalTextProvider__dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache;
  _dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache = v0;
}

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  LOBYTE(v13) = 0;
  uint64_t v11 = objc_msgSend(a1, "_timeIntervalAttributedTextWithStartDate:endDate:calendar:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:keepRedundantDesignator:", v10, v9, v8, +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace"), +[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed"), +[CUIKTextProviderUtils dropLeftRedundantDesignator](CUIKTextProviderUtils, "dropLeftRedundantDesignator"), v13);

  return v11;
}

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 keepRedundantDesignator:(BOOL)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LOBYTE(v15) = a6;
  uint64_t v13 = objc_msgSend(a1, "_timeIntervalAttributedTextWithStartDate:endDate:calendar:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:keepRedundantDesignator:", v12, v11, v10, +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace"), +[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed"), +[CUIKTextProviderUtils dropLeftRedundantDesignator](CUIKTextProviderUtils, "dropLeftRedundantDesignator"), v15);

  return v13;
}

+ (void)force24HourFormatForUnitTests:(BOOL)a3 withLocale:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  if (!force24HourFormatRegistry)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)force24HourFormatRegistry;
    force24HourFormatRegistry = v6;
  }
  id v8 = [NSNumber numberWithBool:v4];
  id v9 = (void *)force24HourFormatRegistry;
  id v10 = [v5 localeIdentifier];

  [v9 setObject:v8 forKeyedSubscript:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
}

+ (void)resetForce24HourFormatForUnitTests
{
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  v2 = (void *)force24HourFormatRegistry;
  force24HourFormatRegistry = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
}

@end