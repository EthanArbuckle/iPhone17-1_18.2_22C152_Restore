@interface MKLocalizedHoursBuilder
@end

@implementation MKLocalizedHoursBuilder

uint64_t __39___MKLocalizedHoursBuilder__commonInit__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = (void *)_MergedGlobals_162;
  _MergedGlobals_162 = (uint64_t)v2;

  [(id)_MergedGlobals_162 setDateFormat:@"MMMM dd"];
  [(id)_MergedGlobals_162 setFormattingContext:4];
  [(id)_MergedGlobals_162 setTimeZone:*(void *)(*(void *)(a1 + 32) + 88)];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v5 = (void *)qword_1EB316078;
  qword_1EB316078 = (uint64_t)v4;

  [(id)qword_1EB316078 setDateFormat:@"cccc"];
  [(id)qword_1EB316078 setFormattingContext:4];
  [(id)qword_1EB316078 setTimeZone:*(void *)(*(void *)(a1 + 32) + 88)];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v7 = (void *)qword_1EB316080;
  qword_1EB316080 = (uint64_t)v6;

  [(id)qword_1EB316080 setDateFormat:@"ccc"];
  [(id)qword_1EB316080 setFormattingContext:4];
  [(id)qword_1EB316080 setTimeZone:*(void *)(*(void *)(a1 + 32) + 88)];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v9 = (void *)qword_1EB316088;
  qword_1EB316088 = (uint64_t)v8;

  [(id)qword_1EB316088 setDateStyle:0];
  [(id)qword_1EB316088 setTimeStyle:1];
  [(id)qword_1EB316088 setTimeZone:*(void *)(*(void *)(a1 + 32) + 88)];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v11 = (void *)qword_1EB316090;
  qword_1EB316090 = (uint64_t)v10;

  [(id)qword_1EB316090 setAllowedUnits:32];
  [(id)qword_1EB316090 setUnitsStyle:1];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v13 = (void *)qword_1EB316098;
  qword_1EB316098 = (uint64_t)v12;

  [(id)qword_1EB316098 setAllowedUnits:32];
  v14 = (void *)qword_1EB316098;

  return [v14 setUnitsStyle:3];
}

void __51___MKLocalizedHoursBuilder__isCurrentTimeSingular___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v1 = (void *)qword_1EB3160A8;
  qword_1EB3160A8 = v0;

  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)qword_1EB3160A8 setLocale:v2];
}

void __66___MKLocalizedHoursBuilder__localizedTimeStringFromDate_timezone___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = (void *)qword_1EB3160B0;
  qword_1EB3160B0 = (uint64_t)v2;

  [(id)qword_1EB3160B0 setLocalizedDateFormatFromTemplate:@"jmm"];
  uint64_t v4 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  v5 = (void *)qword_1EB3160C0;
  qword_1EB3160C0 = v4;

  [(id)qword_1EB3160C0 setTimeZone:*(void *)(a1 + 32)];
  id v6 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)qword_1EB3160C0 setLocale:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v8 = (void *)qword_1EB3160B8;
  qword_1EB3160B8 = (uint64_t)v7;
}

void __54___MKLocalizedHoursBuilder__findNextOperatingWeekday___block_invoke()
{
  v10[7] = *MEMORY[0x1E4F143B8];
  v9[0] = &unk_1ED97E958;
  uint64_t v0 = _MKLocalizedStringFromThisBundle(@"Closed till Sunday");
  v10[0] = v0;
  v9[1] = &unk_1ED97E970;
  v1 = _MKLocalizedStringFromThisBundle(@"Closed till Monday");
  v10[1] = v1;
  v9[2] = &unk_1ED97E988;
  id v2 = _MKLocalizedStringFromThisBundle(@"Closed till Tuesday");
  v10[2] = v2;
  v9[3] = &unk_1ED97E9A0;
  v3 = _MKLocalizedStringFromThisBundle(@"Closed till Wednesday");
  v10[3] = v3;
  v9[4] = &unk_1ED97E9B8;
  uint64_t v4 = _MKLocalizedStringFromThisBundle(@"Closed till Thursday");
  v10[4] = v4;
  v9[5] = &unk_1ED97E9D0;
  v5 = _MKLocalizedStringFromThisBundle(@"Closed till Friday");
  v10[5] = v5;
  v9[6] = &unk_1ED97E9E8;
  id v6 = _MKLocalizedStringFromThisBundle(@"Closed till Saturday");
  v10[6] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  id v8 = (void *)qword_1EB3160D0;
  qword_1EB3160D0 = v7;
}

uint64_t __62___MKLocalizedHoursBuilder_concatenateStrings_joinedByString___block_invoke(uint64_t a1)
{
  uint64_t result = MKApplicationLayoutDirectionIsRightToLeft();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end