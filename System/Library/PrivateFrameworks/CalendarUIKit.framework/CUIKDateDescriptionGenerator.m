@interface CUIKDateDescriptionGenerator
+ (id)_dateAfterTodayNextWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4;
+ (id)_dateAfterTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4;
+ (id)_dateBeforeTodayLastWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4;
+ (id)_dateBeforeTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4;
+ (id)sharedGenerator;
- (CUIKDateDescriptionGenerator)init;
- (id)_customFormatter;
- (id)_dateFormatterWithLongFormat:(id)a3;
- (id)_dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 shortFormat:(BOOL)a6 lowercase:(BOOL)a7;
- (id)_stringForDate:(id)a3 relativeToReferenceDate:(id)a4 withLongFormatString:(id)a5 useAbbreviatedFormats:(BOOL)a6 lowerCase:(BOOL)a7;
- (id)_timeStringForDate:(id)a3;
- (id)abbreviatedDayFormatter;
- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5;
- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6;
- (id)dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 standalone:(BOOL)a6 shortFormat:(BOOL)a7;
- (id)dayFormatter;
- (id)dayOfWeekFormatter;
- (id)formatterForLongFormat:(id)a3;
- (id)fullStyleDateFormatter;
- (id)standardTimeFormatter;
- (id)stringForDate:(id)a3 withLongFormatString:(id)a4 useAbbreviatedFormats:(BOOL)a5 lowerCase:(BOOL)a6;
- (id)timeFormatter;
- (id)timeStringForDate:(id)a3 inTimeZone:(id)a4;
- (void)_initializeFormatters;
@end

@implementation CUIKDateDescriptionGenerator

+ (id)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CUIKDateDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_0 != -1) {
    dispatch_once(&sharedGenerator_onceToken_0, block);
  }
  v2 = (void *)sharedGenerator___sharedInstance_0;

  return v2;
}

void __47__CUIKDateDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_0;
  sharedGenerator___sharedInstance_0 = (uint64_t)v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CUIKDateDescriptionGeneratorDateTimeFormatChanged, (CFStringRef)*MEMORY[0x1E4F578B0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F578C0];

  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CUIKDateDescriptionGeneratorDateTimeFormatChanged, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (CUIKDateDescriptionGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKDateDescriptionGenerator;
  v2 = [(CUIKDateDescriptionGenerator *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Serial Formatter Edit Queue", 0);
    serialFormatterEditQueue = v2->_serialFormatterEditQueue;
    v2->_serialFormatterEditQueue = (OS_dispatch_queue *)v3;

    [(CUIKDateDescriptionGenerator *)v2 _initializeFormatters];
  }
  return v2;
}

- (void)_initializeFormatters
{
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CUIKDateDescriptionGenerator__initializeFormatters__block_invoke;
  block[3] = &unk_1E6369C50;
  block[4] = self;
  dispatch_sync(serialFormatterEditQueue, block);
}

uint64_t __53__CUIKDateDescriptionGenerator__initializeFormatters__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  v8 = *(void **)(*(void *)(a1 + 32) + 48);
  v9 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v8 setLocale:v9];

  [*(id *)(*(void *)(a1 + 32) + 48) setDateStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 48) setTimeStyle:0];
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = *(void *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(void *)(v11 + 32) = v10;

  v13 = *(void **)(*(void *)(a1 + 32) + 32);
  v14 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v13 setLocale:v14];

  [*(id *)(*(void *)(a1 + 32) + 32) setDateStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setTimeStyle:1];
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(void *)(v16 + 16) = v15;

  v18 = *(void **)(*(void *)(a1 + 32) + 16);
  v19 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v18 setLocale:v19];

  [*(id *)(*(void *)(a1 + 32) + 16) setDateStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setTimeStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 16) setDateFormat:@"EEEE"];
  uint64_t v20 = objc_opt_new();
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 24);
  *(void *)(v21 + 24) = v20;

  v23 = *(void **)(*(void *)(a1 + 32) + 24);
  v24 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v23 setLocale:v24];

  [*(id *)(*(void *)(a1 + 32) + 24) setDateStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 24) setTimeStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 24) setDateFormat:@"EEE"];
  uint64_t v25 = objc_opt_new();
  uint64_t v26 = *(void *)(a1 + 32);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  v28 = *(void **)(*(void *)(a1 + 32) + 40);
  v29 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v28 setLocale:v29];

  [*(id *)(*(void *)(a1 + 32) + 40) setDateStyle:0];
  [*(id *)(*(void *)(a1 + 32) + 40) setTimeStyle:1];
  id v30 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v31 = *(void *)(a1 + 32);
  v32 = *(void **)(v31 + 56);
  *(void *)(v31 + 56) = v30;

  v33 = *(void **)(*(void *)(a1 + 32) + 56);
  v34 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v33 setLocale:v34];

  [*(id *)(*(void *)(a1 + 32) + 56) setDateStyle:4];
  [*(id *)(*(void *)(a1 + 32) + 56) setTimeStyle:0];
  uint64_t v35 = objc_opt_new();
  uint64_t v36 = *(void *)(a1 + 32);
  v37 = *(void **)(v36 + 64);
  *(void *)(v36 + 64) = v35;

  v38 = *(void **)(*(void *)(a1 + 32) + 64);

  return [v38 setDateFormat:@"e"];
}

- (id)_customFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CUIKDateDescriptionGenerator__customFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__CUIKDateDescriptionGenerator__customFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)timeFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CUIKDateDescriptionGenerator_timeFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__CUIKDateDescriptionGenerator_timeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dayFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__CUIKDateDescriptionGenerator_dayFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CUIKDateDescriptionGenerator_dayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)abbreviatedDayFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CUIKDateDescriptionGenerator_abbreviatedDayFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__CUIKDateDescriptionGenerator_abbreviatedDayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)standardTimeFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CUIKDateDescriptionGenerator_standardTimeFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__CUIKDateDescriptionGenerator_standardTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)fullStyleDateFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CUIKDateDescriptionGenerator_fullStyleDateFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__CUIKDateDescriptionGenerator_fullStyleDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dayOfWeekFormatter
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  uint64_t v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CUIKDateDescriptionGenerator_dayOfWeekFormatter__block_invoke;
  v5[3] = &unk_1E636AB40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__CUIKDateDescriptionGenerator_dayOfWeekFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_dateFormatterWithLongFormat:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];

  uint64_t v6 = (void *)MEMORY[0x1E4F28C10];
  v7 = [v4 locale];
  uint64_t v8 = [v6 dateFormatFromTemplate:v3 options:0 locale:v7];

  [v4 setDateFormat:v8];

  return v4;
}

- (id)formatterForLongFormat:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  uint64_t v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CUIKDateDescriptionGenerator_formatterForLongFormat___block_invoke;
  block[3] = &unk_1E636AB68;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialFormatterEditQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__CUIKDateDescriptionGenerator_formatterForLongFormat___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _dateFormatterWithLongFormat:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v10 = *(void **)(*(void *)(a1 + 32) + 72);
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

- (id)stringForDate:(id)a3 withLongFormatString:(id)a4 useAbbreviatedFormats:(BOOL)a5 lowerCase:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a4;
  id v12 = a3;
  v13 = [v10 date];
  uint64_t v14 = [(CUIKDateDescriptionGenerator *)self _stringForDate:v12 relativeToReferenceDate:v13 withLongFormatString:v11 useAbbreviatedFormats:v7 lowerCase:v6];

  return v14;
}

- (id)_stringForDate:(id)a3 relativeToReferenceDate:(id)a4 withLongFormatString:(id)a5 useAbbreviatedFormats:(BOOL)a6 lowerCase:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v49 = a5;
  uint64_t v48 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9A8], "CalGregorianCalendarForTimeZone:");
  uint64_t v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v14 setLocale:v15];

  int v16 = [v14 isDate:v12 inSameDayAsDate:v13];
  id v17 = [v13 dateByAddingDays:-1 inCalendar:v14];
  int v18 = [v14 isDate:v12 inSameDayAsDate:v17];
  v19 = [v13 dateByAddingDays:1 inCalendar:v14];
  int v20 = [v14 isDate:v12 inSameDayAsDate:v19];
  if (v16)
  {
    uint64_t v21 = CUIKBundle();
    if (v7) {
      v22 = @"today";
    }
    else {
      v22 = @"Today";
    }
LABEL_19:
    v27 = [v21 localizedStringForKey:v22 value:&stru_1F187C430 table:0];
    v29 = (void *)v48;
    v28 = v49;
    goto LABEL_20;
  }
  if (v18)
  {
    uint64_t v21 = CUIKBundle();
    if (v7) {
      v22 = @"yesterday";
    }
    else {
      v22 = @"Yesterday";
    }
    goto LABEL_19;
  }
  if (v20)
  {
    uint64_t v21 = CUIKBundle();
    if (v7) {
      v22 = @"tomorrow";
    }
    else {
      v22 = @"Tomorrow";
    }
    goto LABEL_19;
  }
  v23 = self;
  char v24 = [v12 CalIsAfterDate:v13];
  uint64_t v21 = [v14 components:240 fromDate:v12 toDate:v13 options:0];
  uint64_t v25 = [v21 day];
  if (v25 >= 0) {
    unint64_t v26 = v25;
  }
  else {
    unint64_t v26 = -v25;
  }
  if (v26 > 6)
  {
    v28 = v49;
    if (v49) {
      [(CUIKDateDescriptionGenerator *)v23 formatterForLongFormat:v49];
    }
    else {
    uint64_t v31 = [(CUIKDateDescriptionGenerator *)v23 fullStyleDateFormatter];
    }
    v40 = v31;
    v29 = (void *)v48;
    if (v12)
    {
      v27 = [v31 stringFromDate:v12];
    }
    else
    {
      v27 = &stru_1F187C430;
    }
  }
  else
  {
    char v46 = v24;
    if (a6) {
      [(CUIKDateDescriptionGenerator *)v23 abbreviatedDayFormatter];
    }
    else {
    v47 = [(CUIKDateDescriptionGenerator *)v23 dayFormatter];
    }
    uint64_t v45 = [v47 stringFromDate:v12];
    uint64_t v32 = [v14 component:512 fromDate:v12];
    uint64_t v44 = [v14 component:0x2000 fromDate:v12];
    uint64_t v33 = [v14 component:0x2000 fromDate:v13];
    v34 = objc_opt_class();
    if (v46)
    {
      uint64_t v35 = (void *)v45;
      BOOL v36 = v44 <= v33;
      BOOL v37 = v7;
      v29 = (void *)v48;
      v28 = v49;
      if (v36) {
        [v34 _dateAfterTodayThisWeekFormatStringForDayOfWeek:v32 generateLowercaseString:v37];
      }
      else {
        [v34 _dateAfterTodayNextWeekFormatStringForDayOfWeek:v32 generateLowercaseString:v37];
      }
    }
    else
    {
      uint64_t v35 = (void *)v45;
      BOOL v36 = v44 < v33;
      BOOL v39 = v7;
      v29 = (void *)v48;
      v28 = v49;
      if (v36) {
        [v34 _dateBeforeTodayLastWeekFormatStringForDayOfWeek:v32 generateLowercaseString:v39];
      }
      else {
        [v34 _dateBeforeTodayThisWeekFormatStringForDayOfWeek:v32 generateLowercaseString:v39];
      }
    uint64_t v38 = };
    v41 = (void *)v38;
    v27 = &stru_1F187C430;
    if (v38 && v35)
    {
      v42 = (void *)v38;
      uint64_t v43 = [NSString localizedStringWithValidatedFormat:v38, @"%@", 0, v35 validFormatSpecifiers error];
      v41 = v42;
      v27 = (__CFString *)v43;
    }

    v40 = v47;
  }

LABEL_20:

  return v27;
}

+ (id)_dateAfterTodayNextWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #1 day of the week.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #1 day of the week. (capitalized)";
      goto LABEL_27;
    case 2:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #2 day of the week..";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #2 day of the week. (capitalized).";
      goto LABEL_27;
    case 3:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #3 day of the week..";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #3 day of the week. (capitalized).";
      goto LABEL_27;
    case 4:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #4 day of the week..";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #4 day of the week. (capitalized).";
      goto LABEL_27;
    case 5:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #5 day of the week..";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #5 day of the week. (capitalized).";
      goto LABEL_27;
    case 6:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #6 day of the week..";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #6 day of the week. (capitalized).";
      goto LABEL_27;
    case 7:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #7 day of the week..";
LABEL_19:
        uint64_t v9 = @"next %@";
      }
      else
      {
        BOOL v6 = @"Date after today, but in next week ('next Thursday').  Format for #7 day of the week. (capitalized).";
LABEL_27:
        uint64_t v9 = @"Next %@";
      }
      uint64_t v8 = [v5 localizedStringForKey:v6 value:v9 table:0];

LABEL_29:
      return v8;
    default:
      BOOL v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CUIKDateDescriptionGenerator _dateAfterTodayNextWeekFormatStringForDayOfWeek:generateLowercaseString:]();
      }

      uint64_t v8 = 0;
      goto LABEL_29;
  }
}

+ (id)_dateAfterTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 1.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 1 (capitalized).";
      goto LABEL_27;
    case 2:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 2.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 2 (capitalized).";
      goto LABEL_27;
    case 3:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 3.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 3 (capitalized).";
      goto LABEL_27;
    case 4:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 4.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 4 (capitalized).";
      goto LABEL_27;
    case 5:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 5.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 5 (capitalized).";
      goto LABEL_27;
    case 6:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 6.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 6 (capitalized).";
      goto LABEL_27;
    case 7:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 7.";
LABEL_19:
        uint64_t v9 = @"this %@";
      }
      else
      {
        BOOL v6 = @"Date after today, but in this week ('this Friday').  Format 7 (capitalized).";
LABEL_27:
        uint64_t v9 = @"This %@";
      }
      uint64_t v8 = [v5 localizedStringForKey:v6 value:v9 table:0];

LABEL_29:
      return v8;
    default:
      BOOL v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CUIKDateDescriptionGenerator _dateAfterTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:]();
      }

      uint64_t v8 = 0;
      goto LABEL_29;
  }
}

+ (id)_dateBeforeTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 1.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 1 (capitalized).";
      goto LABEL_27;
    case 2:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 2.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 2 (capitalized).";
      goto LABEL_27;
    case 3:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 3.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 3 (capitalized).";
      goto LABEL_27;
    case 4:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 4.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 4 (capitalized).";
      goto LABEL_27;
    case 5:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 5.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 5 (capitalized).";
      goto LABEL_27;
    case 6:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 6.";
        goto LABEL_19;
      }
      BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 6 (capitalized).";
      goto LABEL_27;
    case 7:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 7.";
LABEL_19:
        uint64_t v9 = @"last %@";
      }
      else
      {
        BOOL v6 = @"Prior day to today, but in this week ('this past Monday').  Format 7 (capitalized).";
LABEL_27:
        uint64_t v9 = @"Last %@";
      }
      uint64_t v8 = [v5 localizedStringForKey:v6 value:v9 table:0];

LABEL_29:
      return v8;
    default:
      BOOL v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CUIKDateDescriptionGenerator _dateBeforeTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:]();
      }

      uint64_t v8 = 0;
      goto LABEL_29;
  }
}

+ (id)_dateBeforeTodayLastWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 1.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 1 (capitalized).";
      goto LABEL_27;
    case 2:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 2.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 2 (capitalized).";
      goto LABEL_27;
    case 3:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 3.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 3 (capitalized).";
      goto LABEL_27;
    case 4:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 4.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 4 (capitalized).";
      goto LABEL_27;
    case 5:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 5.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 5 (capitalized).";
      goto LABEL_27;
    case 6:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 6.";
        goto LABEL_19;
      }
      BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 6 (capitalized).";
      goto LABEL_27;
    case 7:
      uint64_t v5 = CUIKBundle();
      if (v4)
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 7.";
LABEL_19:
        uint64_t v9 = @"last %@";
      }
      else
      {
        BOOL v6 = @"Date prior to day, but in previous week ('last Monday').  Format 7 (capitalized).";
LABEL_27:
        uint64_t v9 = @"Last %@";
      }
      uint64_t v8 = [v5 localizedStringForKey:v6 value:v9 table:0];

LABEL_29:
      return v8;
    default:
      BOOL v7 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CUIKDateDescriptionGenerator _dateBeforeTodayLastWeekFormatStringForDayOfWeek:generateLowercaseString:]();
      }

      uint64_t v8 = &stru_1F187C430;
      goto LABEL_29;
  }
}

- (id)_dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 shortFormat:(BOOL)a6 lowercase:(BOOL)a7
{
  return [(CUIKDateDescriptionGenerator *)self _stringForDate:a3 relativeToReferenceDate:a4 withLongFormatString:@"EEE, MMM d" useAbbreviatedFormats:0 lowerCase:a7];
}

- (id)_timeStringForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CUIKDateDescriptionGenerator *)self timeFormatter];
  BOOL v6 = [v5 stringFromDate:v4];

  return v6;
}

- (id)timeStringForDate:(id)a3 inTimeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CUIKDateDescriptionGenerator *)self _timeStringForDate:v7];
  uint64_t v9 = NSString;
  id v10 = [v6 abbreviationForDate:v7];

  id v11 = [v9 localizedStringWithFormat:@"%@ %@", v8, v10];

  return v11;
}

- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5
{
  return [(CUIKDateDescriptionGenerator *)self dateStringForDate:a3 allDay:a4 standalone:1 shortFormat:a5];
}

- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a3;
  id v12 = [v10 date];
  id v13 = [(CUIKDateDescriptionGenerator *)self dateStringForDate:v11 relativeToReferenceDate:v12 allDay:v8 standalone:v7 shortFormat:v6];

  return v13;
}

- (id)dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 standalone:(BOOL)a6 shortFormat:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if (v9)
  {
    uint64_t v14 = [(CUIKDateDescriptionGenerator *)self _dateStringForDate:v12 relativeToReferenceDate:v13 allDay:1 shortFormat:v7 lowercase:!v8];
  }
  else
  {
    if (v7)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v16 = [v15 components:28 fromDate:v12];

      id v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v18 = [v17 components:28 fromDate:v13];

      uint64_t v19 = [v18 year];
      if (v19 == [v16 year]
        && (uint64_t v20 = [v18 month], v20 == objc_msgSend(v16, "month"))
        && (uint64_t v21 = [v18 day], v21 == objc_msgSend(v16, "day")))
      {
        uint64_t v22 = [(CUIKDateDescriptionGenerator *)self _timeStringForDate:v12];
      }
      else
      {
        uint64_t v22 = [(CUIKDateDescriptionGenerator *)self _dateStringForDate:v12 relativeToReferenceDate:v13 allDay:0 shortFormat:1 lowercase:!v8];
      }
      uint64_t v14 = (void *)v22;
    }
    else
    {
      int v16 = [(CUIKDateDescriptionGenerator *)self _timeStringForDate:v12];
      v23 = [(CUIKDateDescriptionGenerator *)self _dateStringForDate:v12 relativeToReferenceDate:v13 allDay:0 shortFormat:0 lowercase:!v8];
      int v24 = [MEMORY[0x1E4F576C8] requiresSingularLocalizationForDate:v12];
      uint64_t v25 = NSString;
      unint64_t v26 = CUIKBundle();
      v27 = v26;
      if (v24) {
        v28 = @"%@ at %@ (singular hour)";
      }
      else {
        v28 = @"%@ at %@ (plural hour)";
      }
      v29 = [v26 localizedStringForKey:v28 value:@"%@ at %@" table:0];
      uint64_t v14 = objc_msgSend(v25, "localizedStringWithFormat:", v29, v23, v16);
    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longFormatters, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_fullStyleDateFormatter, 0);
  objc_storeStrong((id *)&self->_customFormatter, 0);
  objc_storeStrong((id *)&self->_standardTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);

  objc_storeStrong((id *)&self->_serialFormatterEditQueue, 0);
}

+ (void)_dateAfterTodayNextWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date after today (next week)' format string", v3, v4, v5, v6, v7);
}

+ (void)_dateAfterTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date after today (this week)' format string", v3, v4, v5, v6, v7);
}

+ (void)_dateBeforeTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date before today (this week)' format string", v3, v4, v5, v6, v7);
}

+ (void)_dateBeforeTodayLastWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  v0 = objc_msgSend(NSNumber, "numberWithInteger:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date before today (last week)' format string", v3, v4, v5, v6, v7);
}

@end