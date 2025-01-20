@interface NSDateComponents(ContactsFoundation)
+ (id)_cn_dateComponentsFromDictionary:()ContactsFoundation;
- (BOOL)_cn_isEmpty;
- (id)_cn_dictionaryRepresentation;
@end

@implementation NSDateComponents(ContactsFoundation)

- (BOOL)_cn_isEmpty
{
  return [a1 year] == 0x7FFFFFFFFFFFFFFFLL
      && [a1 month] == 0x7FFFFFFFFFFFFFFFLL
      && [a1 day] == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_cn_dictionaryRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "era"));
  [v2 setObject:v3 forKeyedSubscript:__CNDateComponentEra];

  v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "year"));
  [v2 setObject:v4 forKeyedSubscript:__CNDateComponentYear];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "month"));
  [v2 setObject:v5 forKeyedSubscript:__CNDateComponentMonth];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "day"));
  [v2 setObject:v6 forKeyedSubscript:__CNDateComponentDay];

  v7 = [a1 calendar];
  v8 = [v7 calendarIdentifier];
  [v2 setObject:v8 forKeyedSubscript:__CNDateComponentCalendarIdentifier];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isLeapMonth"));
  [v2 setObject:v9 forKeyedSubscript:__CNIsLeapMonthKey];

  return v2;
}

+ (id)_cn_dateComponentsFromDictionary:()ContactsFoundation
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v5 = [v3 objectForKeyedSubscript:__CNDateComponentCalendarIdentifier];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v5];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = v5;
    }
    else
    {
      v8 = [v5 lowercaseString];

      uint64_t v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v8];
      if (!v9)
      {
        id v5 = 0;
        goto LABEL_7;
      }
      v7 = (void *)v9;
    }
    v10 = [v3 objectForKeyedSubscript:__CNDateComponentEra];
    objc_msgSend(v4, "setEra:", objc_msgSend(v10, "integerValue"));

    v11 = [v3 objectForKeyedSubscript:__CNDateComponentYear];
    objc_msgSend(v4, "setYear:", objc_msgSend(v11, "integerValue"));

    v12 = [v3 objectForKeyedSubscript:__CNDateComponentMonth];
    objc_msgSend(v4, "setMonth:", objc_msgSend(v12, "integerValue"));

    v13 = [v3 objectForKeyedSubscript:__CNDateComponentDay];
    objc_msgSend(v4, "setDay:", objc_msgSend(v13, "integerValue"));

    v14 = [v3 objectForKeyedSubscript:__CNIsLeapMonthKey];
    objc_msgSend(v4, "setLeapMonth:", objc_msgSend(v14, "BOOLValue"));
    id v5 = v4;

LABEL_7:
  }

  return v5;
}

@end