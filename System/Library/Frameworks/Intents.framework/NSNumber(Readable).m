@interface NSNumber(Readable)
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation NSNumber(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 codableAttribute];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v20 = v9;

    objc_msgSend(v20, "valueForIndex:", objc_msgSend(a1, "integerValue"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    v19 = [v10 localizedDisplayNameWithLocalizer:v6];
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    v11 = objc_opt_new();
    uint64_t v12 = [v10 minimumUnit];
    if (v12 <= [v10 maximumUnit])
    {
      uint64_t v13 = 0;
      uint64_t v14 = v12 - 1;
      do
      {
        if ((unint64_t)v14 > 2) {
          uint64_t v15 = 128;
        }
        else {
          uint64_t v15 = qword_18CFC4A80[v14];
        }
        v13 |= v15;
        ++v14;
      }
      while (v14 < [v10 maximumUnit]);
      if (v13)
      {
        [v11 setAllowedUnits:v13];
        v16 = (void *)MEMORY[0x1E4F1C9A8];
        v17 = [v6 languageCode];
        v18 = objc_msgSend(v16, "if_currentCalendarWithLanguageCode:", v17);
        [v11 setCalendar:v18];

        [v11 setUnitsStyle:2];
        [a1 doubleValue];
        v19 = objc_msgSend(v11, "stringFromTimeInterval:");

LABEL_17:
        goto LABEL_20;
      }
    }
  }
  v22.receiver = a1;
  v22.super_class = (Class)&off_1EDC1CA78;
  v19 = objc_msgSendSuper2(&v22, sel__intents_readableTitleWithLocalizer_metadata_, v6, v7);
LABEL_20:

  return v19;
}

@end