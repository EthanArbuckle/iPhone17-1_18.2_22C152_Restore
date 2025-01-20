@interface CNPropertyGroupDateItem
+ (BOOL)isEmptyDateComponents:(id)a3;
+ (id)calendarForLabel:(id)a3;
+ (id)dateDisplayStringFromComponents:(id)a3;
+ (id)emptyValueForLabel:(id)a3;
+ (id)initialValueForLabel:(id)a3 group:(id)a4;
+ (id)localeAndCalendarPairFromDateComponents:(id)a3;
+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5;
+ (void)initialize;
- (BOOL)isEmpty;
- (BOOL)isEquivalentToItem:(id)a3;
- (BOOL)isValidValue:(id)a3;
- (id)bestValue:(id)a3;
- (id)defaultActionURL;
- (id)displayStringForValue:(id)a3;
- (id)normalizedValue;
- (id)placeholderString;
- (id)valueForDisplayString:(id)a3;
@end

@implementation CNPropertyGroupDateItem

+ (id)dateDisplayStringFromComponents:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isEmptyDateComponents:v3])
  {
    v4 = 0;
  }
  else
  {
    v5 = [(id)objc_opt_class() localeAndCalendarPairFromDateComponents:v3];
    v6 = [v5 first];
    v7 = [v5 second];
    v8 = +[CNUIDate dateFromComponents:v3 destinationCalendar:v7];
    if (+[CNUIDate isYearlessComponents:v3])
    {
      v9 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMMd" options:0 locale:v6];
      v10 = &yearlessFormatter;
      [(id)yearlessFormatter setDateFormat:v9];
    }
    else
    {
      v10 = &fullFormatter;
    }
    id v11 = (id)*v10;
    [v11 setLocale:v6];
    [v11 setCalendar:v7];
    v4 = [v11 stringFromDate:v8];
  }

  return v4;
}

+ (id)localeAndCalendarPairFromDateComponents:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [v3 calendar];

  if (v5)
  {
    v6 = [v3 calendar];
    v7 = [v6 calendarIdentifier];
    uint64_t v8 = *MEMORY[0x1E4F1C318];
    int v9 = [v7 isEqualToString:*MEMORY[0x1E4F1C318]];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
      if ([MEMORY[0x1E4F5A3A0] isGregorianDerivedCalendar:v10])
      {
        id v11 = v10;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v8];
      }
      v5 = v11;
    }
    else
    {
      v5 = [v3 calendar];
    }
    v12 = (void *)MEMORY[0x1E4F70FE8];
    v13 = [v5 calendarIdentifier];
    uint64_t v14 = [v12 localeForCalendarID:v13];

    v4 = (void *)v14;
  }
  v15 = [MEMORY[0x1E4F5A490] pairWithFirst:v4 second:v5];

  return v15;
}

+ (id)propertyGroupItemWithLabeledValue:(id)a3 group:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isSuggested]
    && ([v9 property],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:*MEMORY[0x1E4F1ADB0]],
        v11,
        (v12 & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___CNPropertyGroupDateItem;
    v13 = objc_msgSendSuper2(&v15, sel_propertyGroupItemWithLabeledValue_group_contact_, v8, v9, v10);
  }

  return v13;
}

+ (BOOL)isEmptyDateComponents:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 month] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v3, "day") == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (id)initialValueForLabel:(id)a3 group:(id)a4
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  v5 = +[CNUIDate dateByNormalizingToGMT:v4];

  v6 = +[CNUIDate yearlessGregorianComponentsFromGMTDate:v5];

  return v6;
}

+ (id)emptyValueForLabel:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [a1 calendarForLabel:v5];

  [v6 setCalendar:v7];

  return v6;
}

+ (id)calendarForLabel:(id)a3
{
  return (id)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_31313);
  }
}

void __37__CNPropertyGroupDateItem_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)fullFormatter;
  fullFormatter = (uint64_t)v0;

  [(id)fullFormatter setTimeStyle:0];
  [(id)fullFormatter setDateStyle:3];
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)fullFormatter setTimeZone:v2];

  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  BOOL v4 = (void *)yearlessFormatter;
  yearlessFormatter = (uint64_t)v3;

  [(id)yearlessFormatter setTimeStyle:0];
  [(id)yearlessFormatter setDateStyle:3];
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)yearlessFormatter setTimeZone:v5];
}

- (id)valueForDisplayString:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 value];

  v7 = [(CNPropertyGroupDateItem *)self displayStringForValue:v6];
  int v8 = [v7 isEqualToString:v4];

  if (v8)
  {
    id v9 = [(CNPropertyGroupItem *)self labeledValue];
    id v10 = [v9 value];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F5A398]);
    id v11 = [(id)objc_opt_class() localeAndCalendarPairFromDateComponents:v6];
    char v12 = [v11 first];

    [v9 setLocale:v12];
    id v24 = 0;
    id v25 = 0;
    int v13 = [v9 getObjectValue:&v25 forString:v4 errorDescription:&v24];
    id v14 = v25;
    id v15 = v24;
    if (v13)
    {
      v16 = [v6 calendar];
      v17 = [v16 calendarIdentifier];
      int v18 = [v17 isEqualToString:*MEMORY[0x1E4F1C318]];

      if (v18)
      {
        uint64_t v19 = [MEMORY[0x1E4F5A3A0] gregorianDateComponentsFromDateComponents:v14];

        id v14 = (id)v19;
      }
      id v10 = v14;
      id v14 = v10;
    }
    else
    {
      v20 = objc_opt_class();
      v21 = [(CNPropertyGroupItem *)self labeledValue];
      v22 = [v21 label];
      id v10 = [v20 emptyValueForLabel:v22];
    }
  }

  return v10;
}

- (id)placeholderString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F5A398]);
  id v4 = objc_opt_class();
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 value];
  v7 = [v4 localeAndCalendarPairFromDateComponents:v6];
  int v8 = [v7 first];

  [v3 setLocale:v8];
  id v9 = [v3 dateFormatPlaceholderString];

  return v9;
}

- (id)displayStringForValue:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() dateDisplayStringFromComponents:v3];

  return v4;
}

- (id)bestValue:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 value];

  v7 = [v4 labeledValue];

  int v8 = [v7 value];

  if (+[CNUIDate isYearlessComponents:v6]) {
    [v6 setYear:0x7FFFFFFFFFFFFFFFLL];
  }
  if (+[CNUIDate isYearlessComponents:v8]) {
    [v8 setYear:0x7FFFFFFFFFFFFFFFLL];
  }
  if ([v8 year] == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v9 = [v6 year], v10 = v8, v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v10 = v6;
  }
  id v11 = v10;

  return v11;
}

- (BOOL)isEquivalentToItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyGroupItem *)self labeledValue];
  id v6 = [v5 value];

  v7 = [v4 labeledValue];
  int v8 = [v7 value];

  uint64_t v9 = [v6 day];
  if (v9 == [v8 day] && (uint64_t v10 = objc_msgSend(v6, "month"), v10 == objc_msgSend(v8, "month")))
  {
    id v11 = [(CNPropertyGroupItem *)self contact];
    char v12 = [v4 contact];
    BOOL v13 = v11 != v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)defaultActionURL
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(CNPropertyGroupItem *)self labeledValue];
  id v5 = [v4 value];

  id v6 = [v5 calendar];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  objc_msgSend(v7, "setMonth:", objc_msgSend(v5, "month"));
  objc_msgSend(v7, "setLeapMonth:", objc_msgSend(v5, "isLeapMonth"));
  objc_msgSend(v7, "setDay:", objc_msgSend(v5, "day"));
  [v7 setHour:12];
  int v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v9 = [v8 nextDateAfterDate:v3 matchingHour:0 minute:0 second:0 options:6];

  uint64_t v10 = [v6 nextDateAfterDate:v9 matchingComponents:v7 options:256];
  id v11 = (void *)MEMORY[0x1E4F1CB10];
  char v12 = NSString;
  [v10 timeIntervalSinceReferenceDate];
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"calshow:%d", (int)v13);
  id v15 = [v11 URLWithString:v14];

  return v15;
}

- (id)normalizedValue
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  id v3 = [v2 value];
  id v4 = +[CNUIDate dateFromComponents:v3 destinationCalendar:0];
  id v5 = +[CNUIDate dateByNormalizingToGMT:v4];

  return v5;
}

- (BOOL)isValidValue:(id)a3
{
  id v3 = [(CNPropertyGroupItem *)self labeledValue];
  id v4 = [v3 value];

  BOOL v5 = v4 && [v4 month] != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "day") != 0x7FFFFFFFFFFFFFFFLL;
  return v5;
}

- (BOOL)isEmpty
{
  v2 = [(CNPropertyGroupItem *)self labeledValue];
  id v3 = [v2 value];

  char v4 = [(id)objc_opt_class() isEmptyDateComponents:v3];
  return v4;
}

@end