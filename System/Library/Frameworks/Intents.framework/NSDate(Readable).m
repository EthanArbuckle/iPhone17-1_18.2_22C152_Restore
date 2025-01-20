@interface NSDate(Readable)
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:timeZone:;
- (uint64_t)_intents_readableTitleWithLocalizer:()Readable metadata:;
@end

@implementation NSDate(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:timeZone:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 locale];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v12 setLocale:v11];
  if (v10) {
    [v12 setTimeZone:v10];
  }
  id v13 = v9;
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v14 = 0;
    goto LABEL_18;
  }
  if ([v13 format])
  {
    v14 = v13;
    if ([v13 format] != 2) {
      goto LABEL_18;
    }
    v15 = [v13 localizedFormatStringWithLocalizer:v8];
    [v12 setDateFormat:v15];

    goto LABEL_17;
  }
  [v12 setDoesRelativeDateFormatting:1];
  uint64_t v16 = [v13 type];
  if (v16 == 2)
  {
    v18 = v12;
    uint64_t v17 = 0;
  }
  else
  {
    if (v16 == 1)
    {
      objc_msgSend(v12, "setDateStyle:", objc_msgSend(v13, "dateStyle"));
      v20 = v12;
      uint64_t v19 = 0;
      goto LABEL_16;
    }
    v14 = v13;
    if (v16) {
      goto LABEL_18;
    }
    uint64_t v17 = [v13 dateStyle];
    v18 = v12;
  }
  [v18 setDateStyle:v17];
  uint64_t v19 = [v13 timeStyle];
  v20 = v12;
LABEL_16:
  [v20 setTimeStyle:v19];
LABEL_17:
  v14 = v13;
LABEL_18:
  v21 = [v12 stringFromDate:a1];

  return v21;
}

- (uint64_t)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  return objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:timeZone:", a3, a4, 0);
}

@end