@interface NSNumber(WFNaming)
- (id)wfNameWithMaximumFractionDigits:()WFNaming;
- (uint64_t)wfName;
@end

@implementation NSNumber(WFNaming)

- (id)wfNameWithMaximumFractionDigits:()WFNaming
{
  id v4 = a3;
  if (v4)
  {
    v5 = [NSNumber numberWithBool:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v9 setUsesSignificantDigits:0];
      objc_msgSend(v9, "setMaximumFractionDigits:", objc_msgSend(v4, "integerValue"));
      v10 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
      [v9 setLocale:v10];

      [v9 setUsesGroupingSeparator:0];
      v11 = [v9 stringFromNumber:a1];

      goto LABEL_10;
    }
    if ([a1 BOOLValue]) {
      v7 = @"Yes";
    }
    else {
      v7 = @"No";
    }
    uint64_t v8 = WFLocalizedString(v7);
  }
  else
  {
    uint64_t v8 = [a1 wfName];
  }
  v11 = (void *)v8;
LABEL_10:

  return v11;
}

- (uint64_t)wfName
{
  return [a1 wfNameWithMaximumFractionDigits:&unk_26C741CB0];
}

@end