@interface CNDateComponentsFormatter
+ (BOOL)shouldUseChinaSpecificFormattersForLocale:(id)a3;
+ (BOOL)shouldUseIslamicSpecificFormattersForLocale:(id)a3;
+ (id)chineseCyclicYearMonthDayFormatter;
+ (id)chineseLongStyleRelatedGregorianYearMonthDayFormatter;
+ (id)chineseMonthDayFormatter;
+ (id)chineseMonthDayHanidayFormatter;
+ (id)chineseRelatedGregorianYearMonthDayFormatter;
+ (id)chineseRelatedGregorianYearMonthDayHanidayFormatter;
+ (id)dateFormatterWithYearFormat:(id)a3 hasLongFormat:(BOOL)a4 locale:(id)a5;
+ (id)formatterFuturesWithLocale:(id)a3;
+ (id)longDayMonthYearDateFormatterWithLocale:(id)a3;
+ (id)longDayMonthYearlessDateFormatterWithLocale:(id)a3;
+ (id)os_log;
+ (id)shortDayMonthYearDateFormatterWithLocale:(id)a3;
+ (id)shortDayMonthYearlessDateFormatterWithLocale:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)shouldUseArabicGregorianPlaceholderStringForLanguage:(id)a3;
- (BOOL)shouldUseArabicIslamicPlaceholderStringForLanguage:(id)a3;
- (BOOL)shouldUseChinesePlaceholderString;
- (CNDateComponentsFormatter)init;
- (NSLocale)locale;
- (id)arabicGregorianPlaceholderString;
- (id)arabicIslamicPlaceholderString;
- (id)chinesePlaceholderStringWithDay:(id)a3 month:(id)a4 year:(id)a5;
- (id)dateComponentsFromString:(id)a3;
- (id)dateFormatPlaceholderString;
- (id)dateFormatPlaceholderStringForLanguage:(id)a3;
- (id)displayFormatterForComponents:(id)a3;
- (id)dmyFormatString;
- (id)normalizedComponentsFromDate:(id)a3 calendar:(id)a4 timeZone:(id)a5;
- (id)placeholderStringWithLocalizedDay:(id)a3 month:(id)a4 year:(id)a5;
- (id)placeholderSubstitutionStringWithDay:(unint64_t)a3 month:(unint64_t)a4 year:(unint64_t)a5;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromDateComponents:(id)a3;
- (unint64_t)componentsToExtract;
- (void)regenerateFormatterFutures;
- (void)setLocale:(id)a3;
@end

@implementation CNDateComponentsFormatter

+ (id)os_log
{
  if (os_log_cn_once_token_1_14 != -1) {
    dispatch_once(&os_log_cn_once_token_1_14, &__block_literal_global_73);
  }
  v2 = (void *)os_log_cn_once_object_1_14;

  return v2;
}

uint64_t __35__CNDateComponentsFormatter_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.debug", "date-components-formatter");
  uint64_t v1 = os_log_cn_once_object_1_14;
  os_log_cn_once_object_1_14 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNDateComponentsFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNDateComponentsFormatter;
  v2 = [(CNDateComponentsFormatter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

    [(CNDateComponentsFormatter *)v2 regenerateFormatterFutures];
  }
  return v2;
}

- (id)placeholderSubstitutionStringWithDay:(unint64_t)a3 month:(unint64_t)a4 year:(unint64_t)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v9 setDay:a3];
  [v9 setMonth:a4];
  [v9 setYear:a5];
  v10 = [(CNDateComponentsFormatter *)self locale];
  v11 = [v10 objectForKey:*MEMORY[0x1E4F1C3E0]];
  v12 = [v11 dateFromComponents:v9];

  v13 = objc_opt_class();
  v14 = [(CNDateComponentsFormatter *)self locale];
  v15 = [v13 shortDayMonthYearDateFormatterWithLocale:v14];

  v16 = (void *)MEMORY[0x1E4F28E78];
  v17 = [v15 stringFromDate:v12];
  v18 = [v16 stringWithString:v17];

  return v18;
}

- (id)dmyFormatString
{
  dateFormatPlaceholderString = self->_dateFormatPlaceholderString;
  if (!dateFormatPlaceholderString)
  {
    v4 = objc_opt_class();
    v5 = [(CNDateComponentsFormatter *)self locale];
    objc_super v6 = [v4 shortDayMonthYearDateFormatterWithLocale:v5];

    uint64_t v7 = [v6 dateStyle];
    [v6 setDateStyle:1];
    v8 = [v6 dateFormat];
    [v6 setDateStyle:v7];
    id v9 = [v8 lowercaseString];
    v10 = (NSString *)[v9 copy];
    v11 = self->_dateFormatPlaceholderString;
    self->_dateFormatPlaceholderString = v10;

    dateFormatPlaceholderString = self->_dateFormatPlaceholderString;
  }

  return dateFormatPlaceholderString;
}

- (id)dateFormatPlaceholderString
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 preferredLocalizations];
  v5 = [v4 firstObject];

  objc_super v6 = [(CNDateComponentsFormatter *)self dateFormatPlaceholderStringForLanguage:v5];

  return v6;
}

- (id)dateFormatPlaceholderStringForLanguage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CNDateComponentsFormatter *)self shouldUseArabicGregorianPlaceholderStringForLanguage:v4])
  {
    uint64_t v5 = [(CNDateComponentsFormatter *)self arabicGregorianPlaceholderString];
LABEL_5:
    objc_super v6 = (void *)v5;
    goto LABEL_16;
  }
  if ([(CNDateComponentsFormatter *)self shouldUseArabicIslamicPlaceholderStringForLanguage:v4])
  {
    uint64_t v5 = [(CNDateComponentsFormatter *)self arabicIslamicPlaceholderString];
    goto LABEL_5;
  }
  uint64_t v7 = [(CNDateComponentsFormatter *)self locale];
  v8 = [v7 localeIdentifier];

  UErrorCode pErrorCode = U_ZERO_ERROR;
  id v9 = v8;
  [v9 UTF8String];
  udatpg_open();
  v22 = v9;
  v10 = &stru_1EE0267A8;
  v11 = &dword_1909B635C;
  int v12 = 1;
  v13 = &stru_1EE0267A8;
  v23 = &stru_1EE0267A8;
  do
  {
    AppendItemName = (const UChar *)udatpg_getAppendItemName();
    u_strToUTF8(dest, 128, 0, AppendItemName, 0, &pErrorCode);
    v15 = [NSString stringWithUTF8String:dest];
    v16 = v15;
    if (v12 == 1)
    {
      v17 = v23;
      v18 = v13;
      v23 = v15;
      goto LABEL_13;
    }
    if (v12 == 9)
    {
      v17 = v10;
      v10 = v15;
      v18 = v13;
LABEL_13:
      v19 = v15;

      v13 = v18;
      goto LABEL_14;
    }
    v17 = v13;
    v18 = v15;
    if (v12 == 3) {
      goto LABEL_13;
    }
LABEL_14:

    int v20 = *v11++;
    int v12 = v20;
  }
  while (v20 != 16);
  udatpg_close();
  objc_super v6 = [(CNDateComponentsFormatter *)self placeholderStringWithLocalizedDay:v10 month:v13 year:v23];

LABEL_16:

  return v6;
}

- (id)placeholderStringWithLocalizedDay:(id)a3 month:(id)a4 year:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CNDateComponentsFormatter *)self shouldUseChinesePlaceholderString])
  {
    v11 = [(CNDateComponentsFormatter *)self chinesePlaceholderStringWithDay:v8 month:v9 year:v10];
  }
  else
  {
    v11 = [(CNDateComponentsFormatter *)self placeholderSubstitutionStringWithDay:4 month:2 year:13];
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"0?4", v8, 1024, 0, objc_msgSend(v11, "length"));
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"0?2", v9, 1024, 0, objc_msgSend(v11, "length"));
    objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", @"13", v10, 1024, 0, objc_msgSend(v11, "length"));
  }

  return v11;
}

- (BOOL)shouldUseChinesePlaceholderString
{
  v2 = [(CNDateComponentsFormatter *)self locale];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4F1C3E0]];
  id v4 = [v3 calendarIdentifier];
  char v5 = [v4 containsString:@"chinese"];

  return v5;
}

- (id)chinesePlaceholderStringWithDay:(id)a3 month:(id)a4 year:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@%@%@", a5, a4, a3];
}

- (BOOL)shouldUseArabicGregorianPlaceholderStringForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDateComponentsFormatter *)self locale];
  objc_super v6 = [(id)v5 objectForKey:*MEMORY[0x1E4F1C3E0]];
  uint64_t v7 = [v6 calendarIdentifier];
  char v8 = [v7 containsString:@"gregorian"];

  LOBYTE(v5) = [v4 isEqualToString:@"ar"];
  return v8 & v5;
}

- (BOOL)shouldUseArabicIslamicPlaceholderStringForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNDateComponentsFormatter *)self locale];
  objc_super v6 = [(id)v5 objectForKey:*MEMORY[0x1E4F1C3E0]];
  uint64_t v7 = [v6 calendarIdentifier];
  char v8 = [v7 containsString:@"islamic"];

  LOBYTE(v5) = [v4 isEqualToString:@"ar"];
  return v8 & v5;
}

- (id)arabicGregorianPlaceholderString
{
  return @"اليوم الشهر، السنة";
}

- (id)arabicIslamicPlaceholderString
{
  return @"اليوم الشهر الهجري، السنة هـ";
}

+ (id)dateFormatterWithYearFormat:(id)a3 hasLongFormat:(BOOL)a4 locale:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = @"dM";
  if (v6) {
    id v9 = @"dMMMM";
  }
  id v10 = v9;
  v11 = v10;
  if (v7)
  {
    uint64_t v12 = [(__CFString *)v10 stringByAppendingString:v7];

    v11 = (void *)v12;
  }
  v13 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v11 options:0 locale:v8];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v14 setLocale:v8];
  [v14 setDateFormat:v13];
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-1.25138736e10];
    [v14 setDefaultDate:v15];
  }

  return v14;
}

- (void)regenerateFormatterFutures
{
  uint64_t v3 = objc_opt_class();
  id v6 = [(CNDateComponentsFormatter *)self locale];
  id v4 = [v3 formatterFuturesWithLocale:v6];
  lazyFormatterFutures = self->_lazyFormatterFutures;
  self->_lazyFormatterFutures = v4;
}

- (void)setLocale:(id)a3
{
  uint64_t v5 = (NSLocale *)a3;
  p_locale = &self->_locale;
  if (self->_locale != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_locale, a3);
    p_locale = (NSLocale **)[(CNDateComponentsFormatter *)self regenerateFormatterFutures];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_locale, v5);
}

+ (BOOL)shouldUseChinaSpecificFormattersForLocale:(id)a3
{
  uint64_t v3 = [a3 objectForKey:*MEMORY[0x1E4F1C3E0]];
  id v4 = [v3 calendarIdentifier];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  return v5;
}

+ (BOOL)shouldUseIslamicSpecificFormattersForLocale:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1C340];
  v11[0] = *MEMORY[0x1E4F1C338];
  v11[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1C348];
  v11[2] = *MEMORY[0x1E4F1C350];
  v11[3] = v4;
  char v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:v11 count:4];
  id v8 = [v6 objectForKey:*MEMORY[0x1E4F1C3E0]];

  id v9 = [v8 calendarIdentifier];
  LOBYTE(v5) = [v7 containsObject:v9];

  return (char)v5;
}

+ (id)formatterFuturesWithLocale:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
  if ([a1 shouldUseChinaSpecificFormattersForLocale:v4])
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke;
    v50[3] = &__block_descriptor_40_e9__16__0__8l;
    v50[4] = a1;
    id v6 = +[CNFuture lazyFutureWithBlock:v50];
    [v5 addObject:v6];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_2;
    v49[3] = &__block_descriptor_40_e9__16__0__8l;
    v49[4] = a1;
    id v7 = +[CNFuture lazyFutureWithBlock:v49];
    [v5 addObject:v7];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_3;
    v48[3] = &__block_descriptor_40_e9__16__0__8l;
    v48[4] = a1;
    id v8 = +[CNFuture lazyFutureWithBlock:v48];
    [v5 addObject:v8];

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_4;
    v47[3] = &__block_descriptor_40_e9__16__0__8l;
    v47[4] = a1;
    id v9 = +[CNFuture lazyFutureWithBlock:v47];
    [v5 addObject:v9];

    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_5;
    v46[3] = &__block_descriptor_40_e9__16__0__8l;
    v46[4] = a1;
    id v10 = +[CNFuture lazyFutureWithBlock:v46];
    [v5 addObject:v10];

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_6;
    v45[3] = &__block_descriptor_40_e9__16__0__8l;
    v45[4] = a1;
    v11 = +[CNFuture lazyFutureWithBlock:v45];
    [v5 addObject:v11];
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_7;
  v42[3] = &unk_1E56A2050;
  id v44 = a1;
  id v12 = v4;
  id v43 = v12;
  v13 = +[CNFuture lazyFutureWithBlock:v42];
  [v5 addObject:v13];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_8;
  v39[3] = &unk_1E56A2050;
  id v41 = a1;
  id v14 = v12;
  id v40 = v14;
  v15 = +[CNFuture lazyFutureWithBlock:v39];
  [v5 addObject:v15];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_9;
  v36[3] = &unk_1E56A2050;
  id v38 = a1;
  id v16 = v14;
  id v37 = v16;
  v17 = +[CNFuture lazyFutureWithBlock:v36];
  [v5 addObject:v17];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_10;
  v33[3] = &unk_1E56A2050;
  id v35 = a1;
  id v18 = v16;
  id v34 = v18;
  v19 = +[CNFuture lazyFutureWithBlock:v33];
  [v5 addObject:v19];

  if ([a1 shouldUseIslamicSpecificFormattersForLocale:v18])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_11;
    v30[3] = &unk_1E56A2050;
    id v32 = a1;
    id v20 = v18;
    id v31 = v20;
    v21 = +[CNFuture lazyFutureWithBlock:v30];
    [v5 addObject:v21];

    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_12;
    v27 = &unk_1E56A2050;
    id v29 = a1;
    id v28 = v20;
    v22 = +[CNFuture lazyFutureWithBlock:&v24];
    objc_msgSend(v5, "addObject:", v22, v24, v25, v26, v27);
  }

  return v5;
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseRelatedGregorianYearMonthDayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseMonthDayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseMonthDayHanidayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseCyclicYearMonthDayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseRelatedGregorianYearMonthDayHanidayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) chineseLongStyleRelatedGregorianYearMonthDayFormatter];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 40) shortDayMonthYearDateFormatterWithLocale:*(void *)(a1 + 32)];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 40) longDayMonthYearDateFormatterWithLocale:*(void *)(a1 + 32)];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 40) shortDayMonthYearlessDateFormatterWithLocale:*(void *)(a1 + 32)];
}

uint64_t __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 40) longDayMonthYearlessDateFormatterWithLocale:*(void *)(a1 + 32)];
}

id __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) shortDayMonthYearDateFormatterWithLocale:*(void *)(a1 + 32)];
  v2 = [v1 dateFormat];
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"G" withString:&stru_1EE0267A8];
  [v1 setDateFormat:v3];

  [v1 setLenient:1];

  return v1;
}

id __56__CNDateComponentsFormatter_formatterFuturesWithLocale___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) longDayMonthYearDateFormatterWithLocale:*(void *)(a1 + 32)];
  v2 = [v1 dateFormat];
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"G" withString:&stru_1EE0267A8];
  [v1 setDateFormat:v3];

  [v1 setLenient:1];

  return v1;
}

+ (id)longDayMonthYearDateFormatterWithLocale:(id)a3
{
  return (id)[a1 dateFormatterWithYearFormat:@"y" hasLongFormat:1 locale:a3];
}

+ (id)longDayMonthYearlessDateFormatterWithLocale:(id)a3
{
  return (id)[a1 dateFormatterWithYearFormat:0 hasLongFormat:1 locale:a3];
}

+ (id)shortDayMonthYearDateFormatterWithLocale:(id)a3
{
  return (id)[a1 dateFormatterWithYearFormat:@"y" hasLongFormat:0 locale:a3];
}

+ (id)shortDayMonthYearlessDateFormatterWithLocale:(id)a3
{
  return (id)[a1 dateFormatterWithYearFormat:0 hasLongFormat:0 locale:a3];
}

+ (id)chineseRelatedGregorianYearMonthDayFormatter
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinese"];
  id v4 = [a1 dateFormatterWithYearFormat:@"r" hasLongFormat:0 locale:v3];

  [v4 setDateStyle:1];

  return v4;
}

+ (id)chineseMonthDayFormatter
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinese"];
  id v4 = [a1 dateFormatterWithYearFormat:0 hasLongFormat:0 locale:v3];

  return v4;
}

+ (id)chineseMonthDayHanidayFormatter
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinesenumbers=hanidays"];;
  id v4 = [a1 dateFormatterWithYearFormat:0 hasLongFormat:0 locale:v3];

  return v4;
}

+ (id)chineseRelatedGregorianYearMonthDayHanidayFormatter
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinesenumbers=hanidays"];;
  id v4 = [a1 dateFormatterWithYearFormat:@"r" hasLongFormat:1 locale:v3];

  [v4 setDateStyle:2];

  return v4;
}

+ (id)chineseCyclicYearMonthDayFormatter
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinesenumbers=hanidays"];;
  id v4 = [a1 dateFormatterWithYearFormat:@"U" hasLongFormat:0 locale:v3];

  char v5 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setDefaultDate:v5];

  return v4;
}

+ (id)chineseLongStyleRelatedGregorianYearMonthDayFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"zh@calendar=chinese"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"r年M月d日"];

  return v2;
}

- (id)displayFormatterForComponents:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 year];
  id v6 = [v4 calendar];

  id v7 = [v6 calendarIdentifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  id v9 = objc_opt_class();
  id v10 = v9;
  if (v8)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = [v9 chineseMonthDayFormatter];
    }
    else
    {
      v11 = [v9 chineseRelatedGregorianYearMonthDayHanidayFormatter];
      [v11 setDateStyle:3];
    }
  }
  else
  {
    id v12 = [(CNDateComponentsFormatter *)self locale];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
      [v10 longDayMonthYearlessDateFormatterWithLocale:v12];
    }
    else {
    v11 = [v10 longDayMonthYearDateFormatterWithLocale:v12];
    }
  }

  return v11;
}

- (id)stringFromDateComponents:(id)a3
{
  if (a3)
  {
    id v4 = -[CNDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)dateComponentsFromString:(id)a3
{
  if (a3)
  {
    int v8 = 0;
    BOOL v4 = [(CNDateComponentsFormatter *)self getObjectValue:&v8 forString:a3 errorDescription:0];
    uint64_t v5 = v8;
    if (!v4) {
      uint64_t v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v4, "_cn_isEmpty"))
    {
      uint64_t v5 = &stru_1EE0267A8;
    }
    else
    {
      id v7 = v4;
      int v8 = [(CNDateComponentsFormatter *)self displayFormatterForComponents:v7];
      id v9 = [v7 calendar];
      id v10 = [v8 calendar];
      v11 = (void *)[v7 copy];

      if (!v9) {
        id v9 = v10;
      }
      if ([v11 year] == 0x7FFFFFFFFFFFFFFFLL) {
        [v11 setYear:1604];
      }
      id v12 = [v10 timeZone];
      [v11 setTimeZone:v12];

      v13 = [v9 dateFromComponents:v11];
      uint64_t v5 = [v8 stringForObjectValue:v13];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ([v8 length])
  {
    id v9 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CNDateComponentsFormatter getObjectValue:forString:errorDescription:]((uint64_t)v8, v9);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obj = self->_lazyFormatterFutures;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v42 = *(void *)v46;
      id v40 = a3;
      while (2)
      {
        uint64_t v13 = 0;
        id v14 = obj;
        do
        {
          if (*(void *)v46 != v42) {
            objc_enumerationMutation(v14);
          }
          v15 = [*(id *)(*((void *)&v45 + 1) + 8 * v13) result:0];
          id v44 = 0;
          int v16 = [v15 getObjectValue:&v44 forString:v8 errorDescription:a5];
          id v17 = v44;

          id v18 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            id v38 = [v15 locale];
            uint64_t v21 = [v38 localeIdentifier];
            v36 = (void *)v21;
            uint64_t v22 = [v15 dateFormat];
            *(_DWORD *)buf = 138412802;
            v23 = @"failed";
            if (v16) {
              v23 = @"succeeded";
            }
            uint64_t v50 = v21;
            __int16 v51 = 2112;
            uint64_t v52 = v22;
            uint64_t v24 = (void *)v22;
            __int16 v53 = 2112;
            v54 = v23;
            _os_log_debug_impl(&dword_19091D000, v18, OS_LOG_TYPE_DEBUG, "Parse attempt with locale:%@ date format: %@ %@", buf, 0x20u);

            id v14 = obj;
          }

          if (v16)
          {
            id v12 = v17;
LABEL_26:
            id v32 = [v15 calendar];
            v33 = [v15 timeZone];
            v30 = [(CNDateComponentsFormatter *)self normalizedComponentsFromDate:v12 calendar:v32 timeZone:v33];

            id v34 = objc_msgSend((id)objc_opt_class(), "os_log");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              -[CNDateComponentsFormatter getObjectValue:forString:errorDescription:](v15, (uint64_t)v30, v34);
            }

            BOOL v31 = 1;
            a3 = v40;
            goto LABEL_29;
          }
          [v15 setLenient:1];
          id v43 = 0;
          int v19 = [v15 getObjectValue:&v43 forString:v8 errorDescription:a5];
          id v12 = v43;

          id v20 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v15 locale];
            uint64_t v25 = [v39 localeIdentifier];
            id v37 = (void *)v25;
            uint64_t v26 = [v15 dateFormat];
            *(_DWORD *)buf = 138412802;
            v27 = @"failed";
            if (v19) {
              v27 = @"succeeded";
            }
            uint64_t v50 = v25;
            __int16 v51 = 2112;
            uint64_t v52 = v26;
            id v28 = (void *)v26;
            __int16 v53 = 2112;
            v54 = v27;
            _os_log_debug_impl(&dword_19091D000, v20, OS_LOG_TYPE_DEBUG, "Parse attempt with lenient option, locale:%@ date format: %@ %@", buf, 0x20u);

            id v14 = obj;
          }

          if (v19) {
            goto LABEL_26;
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v29 = [(NSArray *)v14 countByEnumeratingWithState:&v45 objects:v55 count:16];
        uint64_t v11 = v29;
        v30 = 0;
        BOOL v31 = 0;
        a3 = v40;
        if (v29) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v12 = 0;
      v30 = 0;
      BOOL v31 = 0;
    }
LABEL_29:

    if (a3) {
      *a3 = v30;
    }
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (unint64_t)componentsToExtract
{
  return 1048606;
}

- (id)normalizedComponentsFromDate:(id)a3 calendar:(id)a4 timeZone:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [(CNDateComponentsFormatter *)self componentsToExtract];
  id v12 = [v9 componentsInTimeZone:v8 fromDate:v10];

  uint64_t v13 = +[CNDateHelper dateComponentsFromDateComponents:v12 preservingUnits:v11];

  id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-1.25138736e10];
  v15 = [v9 componentsInTimeZone:v8 fromDate:v14];

  int v16 = +[CNDateHelper dateComponentsFromDateComponents:v15 preservingUnits:v11];

  uint64_t v17 = [v13 year];
  if (v17 == [v16 year] && (uint64_t v18 = objc_msgSend(v13, "era"), v18 == objc_msgSend(v16, "era"))) {
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v19 = [v13 year];
  }
  [v13 setYear:v19];

  return v13;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatPlaceholderString, 0);
  objc_storeStrong((id *)&self->_lazyFormatterFutures, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)getObjectValue:(void *)a1 forString:(uint64_t)a2 errorDescription:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = [a1 locale];
  id v7 = [v6 localeIdentifier];
  id v8 = [a1 dateFormat];
  int v9 = 138412802;
  id v10 = v7;
  __int16 v11 = 2112;
  id v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a2;
  _os_log_debug_impl(&dword_19091D000, a3, OS_LOG_TYPE_DEBUG, "Locale: %@ Format %@ parsed successfully into date components %@", (uint8_t *)&v9, 0x20u);
}

- (void)getObjectValue:(uint64_t)a1 forString:(NSObject *)a2 errorDescription:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19091D000, a2, OS_LOG_TYPE_DEBUG, "Attempting to parse string: %@", (uint8_t *)&v2, 0xCu);
}

@end