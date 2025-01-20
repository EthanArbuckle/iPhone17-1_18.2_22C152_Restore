@interface CNNonGregorianBirthdayDescription(ABSExtentions)
- (BOOL)absPropertyID:()ABSExtentions;
- (__CFDictionary)ABSValueFromCNValue:()ABSExtentions;
- (id)CNValueFromABSValue:()ABSExtentions;
- (id)convertABSValue:()ABSExtentions toCNValue:error:;
- (uint64_t)absPropertyType;
@end

@implementation CNNonGregorianBirthdayDescription(ABSExtentions)

- (BOOL)absPropertyID:()ABSExtentions
{
  if (a3) {
    *a3 = 49;
  }
  return a3 != 0;
}

- (uint64_t)absPropertyType
{
  return 5;
}

- (id)convertABSValue:()ABSExtentions toCNValue:error:
{
  if (ABValidateAlternateBirthday(a3))
  {
    v11.receiver = a1;
    v11.super_class = (Class)&off_26C596FA0;
    return objc_msgSendSuper2(&v11, sel_convertABSValue_toCNValue_error_, a3, a4, a5);
  }
  else if (a5)
  {
    CFErrorRef v10 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"ABAddressBookErrorDomain", 0, 0);
    id result = 0;
    *a5 = v10;
  }
  else
  {
    return 0;
  }
  return result;
}

- (__CFDictionary)ABSValueFromCNValue:()ABSExtentions
{
  id v3 = a3;
  if (v3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    v5 = [v3 calendar];
    v6 = [v5 calendarIdentifier];

    if (v6)
    {
      v7 = [v3 calendar];
      v8 = [v7 calendarIdentifier];
      CFDictionarySetValue(Mutable, @"calendarIdentifier", v8);
    }
    int v9 = [v3 isLeapMonth];
    CFErrorRef v10 = (const void **)MEMORY[0x263EFFB40];
    if (!v9) {
      CFErrorRef v10 = (const void **)MEMORY[0x263EFFB38];
    }
    CFDictionarySetValue(Mutable, @"isLeapMonth", *v10);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__CNNonGregorianBirthdayDescription_ABSExtentions__ABSValueFromCNValue___block_invoke;
    v13[3] = &__block_descriptor_40_e24_v24__0q8____CFString__16l;
    v13[4] = Mutable;
    objc_super v11 = (void (**)(void, void, void))MEMORY[0x2166ACA40](v13);
    ((void (**)(void, uint64_t, __CFString *))v11)[2](v11, [v3 era], @"era");
    ((void (**)(void, uint64_t, __CFString *))v11)[2](v11, [v3 year], @"year");
    ((void (**)(void, uint64_t, __CFString *))v11)[2](v11, [v3 month], @"month");
    ((void (**)(void, uint64_t, __CFString *))v11)[2](v11, [v3 day], @"day");

    if (Mutable) {
      Mutable = (__CFDictionary *)CFAutorelease(Mutable);
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)CNValueFromABSValue:()ABSExtentions
{
  if (!a3)
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v4 = objc_alloc_init(MEMORY[0x263EFF918]);
  v5 = CFDictionaryGetValue(a3, @"calendarIdentifier");
  v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F0]) initWithCalendarIdentifier:v5];
  if (v6)
  {
    v7 = v5;
LABEL_6:
    [v4 setCalendar:v6];
    objc_msgSend(v4, "setLeapMonth:", CFDictionaryGetValue(a3, @"isLeapMonth") == (const void *)*MEMORY[0x263EFFB40]);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __72__CNNonGregorianBirthdayDescription_ABSExtentions__CNValueFromABSValue___block_invoke;
    v11[3] = &__block_descriptor_40_e21_q16__0____CFString__8l;
    v11[4] = a3;
    int v9 = (uint64_t (**)(void, void))MEMORY[0x2166ACA40](v11);
    objc_msgSend(v4, "setEra:", ((uint64_t (**)(void, __CFString *))v9)[2](v9, @"era"));
    objc_msgSend(v4, "setYear:", ((uint64_t (**)(void, __CFString *))v9)[2](v9, @"year"));
    objc_msgSend(v4, "setMonth:", ((uint64_t (**)(void, __CFString *))v9)[2](v9, @"month"));
    objc_msgSend(v4, "setDay:", ((uint64_t (**)(void, __CFString *))v9)[2](v9, @"day"));
    id v8 = v4;

    goto LABEL_7;
  }
  v7 = [v5 lowercaseString];

  id v8 = (id)[objc_alloc(MEMORY[0x263EFF8F0]) initWithCalendarIdentifier:v7];
  if (v8) {
    goto LABEL_6;
  }
LABEL_7:

LABEL_8:

  return v8;
}

@end