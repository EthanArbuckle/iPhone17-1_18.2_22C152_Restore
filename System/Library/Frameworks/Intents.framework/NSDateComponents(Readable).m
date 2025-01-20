@interface NSDateComponents(Readable)
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation NSDateComponents(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1C9A8];
  v9 = [v6 languageCode];
  v10 = objc_msgSend(v8, "if_currentCalendarWithLanguageCode:", v9);

  id v11 = v7;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v11 format] == 1)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F28C00]);
      [v12 setCalendar:v10];
      [v12 setUnitsStyle:2];
      unint64_t v13 = [v11 type];
      if (v13 <= 2) {
        [v12 setAllowedUnits:qword_18CFC40B0[v13]];
      }
      v14 = [v12 stringFromDateComponents:a1];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v12 = [v15 dateFromComponents:a1];

      v16 = [a1 timeZone];
      v14 = objc_msgSend(v12, "_intents_readableTitleWithLocalizer:metadata:timeZone:", v6, v11, v16);
    }
  }
  else
  {

    v14 = [MEMORY[0x1E4F28C00] localizedStringFromDateComponents:a1 unitsStyle:0];
  }

  return v14;
}

@end