@interface CKTokenizationDateParser
+ (id)appropriateDateTokensForSearchText:(id)a3;
+ (id)dateFormatterForFormat:(id)a3;
+ (id)dateFormattersForFormats:(id)a3;
+ (id)parsers;
+ (id)serializationDateFormatter;
+ (id)setToMostRecentOccurrenceForWeekdayOfDate:(id)a3;
+ (id)setYearToMostRecentOccurrenceForDate:(id)a3;
- (CKTokenizationDateParser)initWithMatchingDateFormatters:(id)a3 displayDateFormatter:(id)a4 filterOptions:(unint64_t)a5 createDateRangeBlock:(id)a6;
- (NSArray)matchingDateFormatters;
- (NSDateFormatter)displayDateFormatter;
- (id)createDateRangeBlock;
- (id)dateTokenFiltersForSearchText:(id)a3;
- (unint64_t)filterOptions;
- (void)setCreateDateRangeBlock:(id)a3;
@end

@implementation CKTokenizationDateParser

+ (id)serializationDateFormatter
{
  if (serializationDateFormatter_onceToken != -1) {
    dispatch_once(&serializationDateFormatter_onceToken, &__block_literal_global_204);
  }
  v2 = (void *)serializationDateFormatter_dateFormatter;

  return v2;
}

uint64_t __54__CKTokenizationDateParser_serializationDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)serializationDateFormatter_dateFormatter;
  serializationDateFormatter_dateFormatter = (uint64_t)v0;

  [(id)serializationDateFormatter_dateFormatter setDateStyle:3];
  v2 = (void *)serializationDateFormatter_dateFormatter;

  return [v2 setTimeStyle:3];
}

+ (id)setYearToMostRecentOccurrenceForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [v5 components:8204 fromDate:v6];

  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 components:28 fromDate:v4];

  objc_msgSend(v9, "setYear:", objc_msgSend(v7, "year"));
  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [v10 dateFromComponents:v9];

  [v11 timeIntervalSinceNow];
  if (v12 >= 0.0)
  {
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v13 = [v14 dateByAddingUnit:4 value:-1 toDate:v11 options:0];
  }
  else
  {
    id v13 = v11;
  }

  return v13;
}

+ (id)setToMostRecentOccurrenceForWeekdayOfDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  v7 = [v5 components:8204 fromDate:v6];

  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 components:512 fromDate:v4];

  objc_msgSend(v9, "setYear:", objc_msgSend(v7, "year"));
  objc_msgSend(v9, "setMonth:", objc_msgSend(v7, "month"));
  objc_msgSend(v9, "setWeekOfYear:", objc_msgSend(v7, "weekOfYear"));
  v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v11 = [v10 dateFromComponents:v9];

  [v11 timeIntervalSinceNow];
  if (v12 >= 0.0)
  {
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v13 = [v14 dateByAddingUnit:0x2000 value:-1 toDate:v11 options:0];
  }
  else
  {
    id v13 = v11;
  }

  return v13;
}

+ (id)dateFormatterForFormat:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v5 setLocale:v6];

  [v5 setLocalizedDateFormatFromTemplate:v4];

  return v5;
}

+ (id)dateFormattersForFormats:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[CKTokenizationDateParser dateFormatterForFormat:](CKTokenizationDateParser, "dateFormatterForFormat:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)parsers
{
  if (parsers_onceToken != -1) {
    dispatch_once(&parsers_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)parsers_dateParsers;

  return v2;
}

void __35__CKTokenizationDateParser_parsers__block_invoke()
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v0 setYear:1];
  v48 = v0;
  [v0 setSecond:-1];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v1 setMonth:1];
  v45 = v1;
  [v1 setSecond:-1];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v2 setDay:1];
  v41 = v2;
  [v2 setSecond:-1];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v4 = [&unk_1EDF15890 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v63;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(&unk_1EDF15890);
        }
        uint64_t v8 = *(void **)(*((void *)&v62 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x192FBB780]();
        id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v11 = [MEMORY[0x1E4F1CA20] currentLocale];
        [v10 setLocale:v11];

        [v10 setTimeStyle:0];
        objc_msgSend(v10, "setDateStyle:", objc_msgSend(v8, "unsignedIntegerValue"));
        long long v12 = [v10 dateFormat];
        [v3 addObject:v12];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_1EDF15890 countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v5);
  }
  v44 = +[CKTokenizationDateParser dateFormattersForFormats:v3];
  id v38 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v38 setLocale:v13];

  [v38 setDateStyle:3];
  [v38 setTimeStyle:0];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v14 setLocale:v15];

  [v14 setDateStyle:4];
  v47 = v14;
  [v14 setTimeStyle:0];
  v16 = [CKTokenizationDateParser alloc];
  v43 = +[CKTokenizationDateParser dateFormattersForFormats:&unk_1EDF158A8];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __35__CKTokenizationDateParser_parsers__block_invoke_64;
  v60[3] = &unk_1E562A778;
  id v17 = v41;
  id v61 = v17;
  v42 = [(CKTokenizationDateParser *)v16 initWithMatchingDateFormatters:v43 displayDateFormatter:v14 filterOptions:16 createDateRangeBlock:v60];
  v66[0] = v42;
  v18 = [CKTokenizationDateParser alloc];
  v40 = +[CKTokenizationDateParser dateFormattersForFormats:&unk_1EDF158C0];
  v39 = +[CKTokenizationDateParser dateFormatterForFormat:@"MMMM y"];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __35__CKTokenizationDateParser_parsers__block_invoke_2;
  v58[3] = &unk_1E562A778;
  id v19 = v45;
  id v59 = v19;
  v46 = [(CKTokenizationDateParser *)v18 initWithMatchingDateFormatters:v40 displayDateFormatter:v39 filterOptions:16 createDateRangeBlock:v58];
  v66[1] = v46;
  v20 = [CKTokenizationDateParser alloc];
  v37 = +[CKTokenizationDateParser dateFormattersForFormats:&unk_1EDF158D8];
  v36 = +[CKTokenizationDateParser dateFormatterForFormat:@"y"];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __35__CKTokenizationDateParser_parsers__block_invoke_3;
  v56[3] = &unk_1E562A778;
  id v57 = v48;
  id v49 = v48;
  v34 = [(CKTokenizationDateParser *)v20 initWithMatchingDateFormatters:v37 displayDateFormatter:v36 filterOptions:16 createDateRangeBlock:v56];
  v66[2] = v34;
  v21 = [CKTokenizationDateParser alloc];
  v22 = +[CKTokenizationDateParser dateFormattersForFormats:&unk_1EDF158F0];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __35__CKTokenizationDateParser_parsers__block_invoke_4;
  v54[3] = &unk_1E562A778;
  id v23 = v17;
  id v55 = v23;
  v24 = [(CKTokenizationDateParser *)v21 initWithMatchingDateFormatters:v22 displayDateFormatter:v38 filterOptions:28 createDateRangeBlock:v54];
  v66[3] = v24;
  v25 = [CKTokenizationDateParser alloc];
  v26 = +[CKTokenizationDateParser dateFormattersForFormats:&unk_1EDF15908];
  v27 = +[CKTokenizationDateParser dateFormatterForFormat:@"MMMM y"];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __35__CKTokenizationDateParser_parsers__block_invoke_5;
  v52[3] = &unk_1E562A778;
  id v53 = v19;
  id v35 = v19;
  v28 = [(CKTokenizationDateParser *)v25 initWithMatchingDateFormatters:v26 displayDateFormatter:v27 filterOptions:16 createDateRangeBlock:v52];
  v66[4] = v28;
  v29 = [CKTokenizationDateParser alloc];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __35__CKTokenizationDateParser_parsers__block_invoke_6;
  v50[3] = &unk_1E562A778;
  id v51 = v23;
  id v30 = v23;
  v31 = [(CKTokenizationDateParser *)v29 initWithMatchingDateFormatters:v44 displayDateFormatter:v38 filterOptions:28 createDateRangeBlock:v50];
  v66[5] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:6];
  v33 = (void *)parsers_dateParsers;
  parsers_dateParsers = v32;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_64(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = +[CKTokenizationDateParser setToMostRecentOccurrenceForWeekdayOfDate:v4];

  uint64_t v7 = [v5 dateByAddingComponents:*(void *)(a1 + 32) toDate:v6 options:0];
  uint64_t v8 = [[CKTokenizationDateRange alloc] initWithStartDate:v6 endDate:v7];

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = +[CKTokenizationDateParser setYearToMostRecentOccurrenceForDate:v4];

  uint64_t v7 = [v5 dateByAddingComponents:*(void *)(a1 + 32) toDate:v6 options:0];
  uint64_t v8 = [[CKTokenizationDateRange alloc] initWithStartDate:v6 endDate:v7];

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v6 = [v4 component:4 fromDate:v5];

  uint64_t v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 component:4 fromDate:v3];

  unint64_t v9 = v6 - v8;
  if (v6 - v8 < 0) {
    unint64_t v9 = v8 - v6;
  }
  if (v9 <= 0x3E8)
  {
    v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v3;
    id v14 = [v11 dateByAddingComponents:v12 toDate:v13 options:0];
    id v10 = [[CKTokenizationDateRange alloc] initWithStartDate:v13 endDate:v14];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  uint64_t v5 = [v3 currentCalendar];
  uint64_t v6 = +[CKTokenizationDateParser setYearToMostRecentOccurrenceForDate:v4];

  uint64_t v7 = [v5 dateByAddingComponents:*(void *)(a1 + 32) toDate:v6 options:0];
  uint64_t v8 = [[CKTokenizationDateRange alloc] initWithStartDate:v6 endDate:v7];

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = [v4 dateByAddingComponents:v5 toDate:v6 options:0];
  uint64_t v8 = [[CKTokenizationDateRange alloc] initWithStartDate:v6 endDate:v7];

  return v8;
}

CKTokenizationDateRange *__35__CKTokenizationDateParser_parsers__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = [v4 dateByAddingComponents:v5 toDate:v6 options:0];
  uint64_t v8 = [[CKTokenizationDateRange alloc] initWithStartDate:v6 endDate:v7];

  return v8;
}

+ (id)appropriateDateTokensForSearchText:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isSearchTokensForDatesEnabled];

  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = +[CKTokenizationDateParser parsers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dateTokenFiltersForSearchText:v3];
          if (v12)
          {
            id v13 = v12;
            id v10 = (void *)[v12 copy];

            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
LABEL_14:
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (CKTokenizationDateParser)initWithMatchingDateFormatters:(id)a3 displayDateFormatter:(id)a4 filterOptions:(unint64_t)a5 createDateRangeBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKTokenizationDateParser;
  id v14 = [(CKTokenizationDateParser *)&v19 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_matchingDateFormatters, a3);
    objc_storeStrong((id *)&v15->_displayDateFormatter, a4);
    v15->_filterOptions = a5;
    long long v16 = _Block_copy(v13);
    id createDateRangeBlock = v15->_createDateRangeBlock;
    v15->_id createDateRangeBlock = v16;
  }
  return v15;
}

- (id)dateTokenFiltersForSearchText:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v5 = self->_matchingDateFormatters;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v49 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = [*(id *)(*((void *)&v48 + 1) + 8 * v9) dateFromString:v4];
      if (v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = (void *)v10;

    id v13 = (*((void (**)(void))self->_createDateRangeBlock + 2))();
    if (!v13) {
      goto LABEL_12;
    }
    id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v15 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v16 = [v14 component:4 fromDate:v15];

    long long v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v18 = [v13 startDate];
    uint64_t v19 = [v17 component:4 fromDate:v18];

    if (v19 > v16)
    {
LABEL_12:
      id v11 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v20 = [v13 serializeToStringArray];
    displayDateFormatter = self->_displayDateFormatter;
    v22 = [v13 startDate];
    id v23 = [(NSDateFormatter *)displayDateFormatter stringFromDate:v22];

    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t filterOptions = self->_filterOptions;
    if ((filterOptions & 0x10) != 0)
    {
      v37 = [[CKSearchTokenFilter alloc] initWithContentType:8 filterOptions:16 itemIdentifier:v23 tokenAddresses:v20];
      [v24 addObject:v37];

      unint64_t filterOptions = self->_filterOptions;
      if ((filterOptions & 4) == 0)
      {
LABEL_15:
        if ((filterOptions & 8) == 0)
        {
LABEL_20:
          id v11 = (void *)[v24 copy];

          goto LABEL_21;
        }
LABEL_16:
        v26 = [CKSearchTokenFilter alloc];
        v27 = NSString;
        v28 = CKFrameworkBundle();
        v29 = [v28 localizedStringForKey:@"SEARCH_BEFORE_DATE_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
        id v30 = objc_msgSend(v27, "stringWithFormat:", v29, v23);

        v31 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v32 = [v31 userInterfaceLayoutDirection];

        if (v32 == 1) {
          v33 = @"\u200F";
        }
        else {
          v33 = @"\u200E";
        }
        v34 = [(__CFString *)v33 stringByAppendingString:v30];

        id v35 = [(CKSearchTokenFilter *)v26 initWithContentType:8 filterOptions:8 itemIdentifier:v34 tokenAddresses:v20];
        [v24 addObject:v35];

        goto LABEL_20;
      }
    }
    else if ((filterOptions & 4) == 0)
    {
      goto LABEL_15;
    }
    v47 = [CKSearchTokenFilter alloc];
    id v38 = NSString;
    v39 = CKFrameworkBundle();
    v40 = [v39 localizedStringForKey:@"SEARCH_AFTER_DATE_TOKEN" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v41 = objc_msgSend(v38, "stringWithFormat:", v40, v23);

    v42 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v43 = [v42 userInterfaceLayoutDirection];

    if (v43 == 1) {
      v44 = @"\u200F";
    }
    else {
      v44 = @"\u200E";
    }
    v45 = [(__CFString *)v44 stringByAppendingString:v41];

    v46 = [(CKSearchTokenFilter *)v47 initWithContentType:8 filterOptions:4 itemIdentifier:v45 tokenAddresses:v20];
    [v24 addObject:v46];

    if ((self->_filterOptions & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
LABEL_9:
  id v11 = 0;
  id v12 = v5;
LABEL_22:

  return v11;
}

- (NSArray)matchingDateFormatters
{
  return self->_matchingDateFormatters;
}

- (NSDateFormatter)displayDateFormatter
{
  return self->_displayDateFormatter;
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (id)createDateRangeBlock
{
  return self->_createDateRangeBlock;
}

- (void)setCreateDateRangeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createDateRangeBlock, 0);
  objc_storeStrong((id *)&self->_displayDateFormatter, 0);

  objc_storeStrong((id *)&self->_matchingDateFormatters, 0);
}

@end