@interface BSDateFormatterCache
+ (id)formatterForDateAsTimeNoAMPMWithLocale:(id)a3;
+ (id)sharedInstance;
- (BOOL)supportsMultiLineDayOfWeekMonthDayStyle;
- (BSDateFormatterCache)init;
- (id)_performFormattingWithSynchronizedBlock:(void *)a1;
- (id)formatAbbreviatedTimerDuration:(double)a3;
- (id)formatAlarmSnoozeDuration:(double)a3;
- (id)formatDateAsAbbreviatedDayMonthStyle:(id)a3;
- (id)formatDateAsAbbreviatedDayMonthWithTimeStyle:(id)a3;
- (id)formatDateAsAbbreviatedDayOfWeekMonthDayStyle:(id)a3;
- (id)formatDateAsAbbreviatedDayOfWeekWithTime:(id)a3;
- (id)formatDateAsDayMonthYearStyle:(id)a3;
- (id)formatDateAsDayOfWeek:(id)a3;
- (id)formatDateAsDayOfWeekMonthDayStyle:(id)a3;
- (id)formatDateAsLongYMDHMSNoSpacesWithDate:(id)a3;
- (id)formatDateAsLongYMDHMSZPosixLocaleWithDate:(id)a3;
- (id)formatDateAsLongYMDHMSZWithDate:(id)a3;
- (id)formatDateAsMultiLineDayOfWeekMonthDayStyle:(id)a3;
- (id)formatDateAsRelativeDateAndTimeStyle:(id)a3;
- (id)formatDateAsRelativeDateStyle:(id)a3;
- (id)formatDateAsShortDayMonthWithTimeStyle:(id)a3;
- (id)formatDateAsTimeNoAMPM:(id)a3;
- (id)formatDateAsTimeStyle:(id)a3;
- (id)formatDuration:(double)a3;
- (id)formatNumberAsDecimal:(id)a3;
- (id)formatTimerDuration:(double)a3;
- (void)_configureMultiLineDayOfWeekMonthDayFormatterIfNecessary;
- (void)_resetFormatters;
- (void)_resetFormatters:(id)a3;
- (void)dealloc;
- (void)resetFormattersIfNecessary;
@end

@implementation BSDateFormatterCache

uint64_t __39__BSDateFormatterCache_formatDuration___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 152);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = v3;

    [*(id *)(*(void *)(a1 + 32) + 152) setUnitsStyle:2];
    [*(id *)(*(void *)(a1 + 32) + 152) setAllowedUnits:252];
    v2 = *(void **)(*(void *)(a1 + 32) + 152);
  }
  double v6 = *(double *)(a1 + 40);
  return [v2 stringFromTimeInterval:v6];
}

+ (id)formatterForDateAsTimeNoAMPMWithLocale:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setLocale:v3];
  [v4 setLocalizedDateFormatFromTemplate:@"Jmm"];

  return v4;
}

uint64_t __46__BSDateFormatterCache_formatDateAsDayOfWeek___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    [*(id *)(*(void *)(a1 + 32) + 16) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"cccc" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

+ (id)sharedInstance
{
  if (qword_1EB21B3A0 != -1) {
    dispatch_once(&qword_1EB21B3A0, &__block_literal_global_32);
  }
  v2 = (void *)_MergedGlobals_35;
  return v2;
}

- (BSDateFormatterCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSDateFormatterCache;
  v2 = [(BSDateFormatterCache *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    [(BSDateFormatterCache *)v2 _resetFormatters];
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__resetFormatters name:*MEMORY[0x1E4F1C4F8] object:0];
  }
  return v3;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BSDateFormatterCache;
  [(BSDateFormatterCache *)&v4 dealloc];
}

void __38__BSDateFormatterCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(BSDateFormatterCache);
  v1 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v0;
}

- (void)resetFormattersIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  locale = obj->_locale;
  if (v2 != locale)
  {
    BOOL v4 = !v2 || locale == 0;
    if (v4 || (-[NSLocale isEqual:](v2, "isEqual:") & 1) == 0) {
      [(BSDateFormatterCache *)obj _resetFormatters:v2];
    }
  }

  objc_sync_exit(obj);
}

- (id)formatNumberAsDecimal:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatNumberAsDecimal___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  objc_super v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __46__BSDateFormatterCache_formatNumberAsDecimal___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 144);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 144);
    *(void *)(v4 + 144) = v3;

    [*(id *)(*(void *)(a1 + 32) + 144) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 144) setNumberStyle:1];
    v2 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromNumber:v6];
}

- (id)_performFormattingWithSynchronizedBlock:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__performFormattingWithSynchronizedBlock_, a1, @"BSDateFormatterCache.m", 436, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
    }
    id v5 = a1;
    objc_sync_enter(v5);
    [v5 resetFormattersIfNecessary];
    uint64_t v6 = v4[2](v4);
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)formatDateAsDayOfWeek:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatDateAsDayOfWeek___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

- (id)formatDateAsAbbreviatedDayOfWeekWithTime:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekWithTime___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __65__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekWithTime___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    [*(id *)(*(void *)(a1 + 32) + 24) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEjmm" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsDayMonthYearStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__BSDateFormatterCache_formatDateAsDayMonthYearStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __54__BSDateFormatterCache_formatDateAsDayMonthYearStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    [*(id *)(*(void *)(a1 + 32) + 32) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"yMd" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsShortDayMonthWithTimeStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__BSDateFormatterCache_formatDateAsShortDayMonthWithTimeStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __63__BSDateFormatterCache_formatDateAsShortDayMonthWithTimeStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [*(id *)(*(void *)(a1 + 32) + 40) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"Mdjmm" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsAbbreviatedDayOfWeekMonthDayStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __70__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    [*(id *)(*(void *)(a1 + 32) + 48) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEMMMd" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsAbbreviatedDayMonthStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __61__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    [*(id *)(*(void *)(a1 + 32) + 56) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMd" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 56);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsAbbreviatedDayMonthWithTimeStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthWithTimeStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __69__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthWithTimeStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;

    [*(id *)(*(void *)(a1 + 32) + 64) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"MMMdjmm" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsTimeStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatDateAsTimeStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __46__BSDateFormatterCache_formatDateAsTimeStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v3;

    [*(id *)(*(void *)(a1 + 32) + 72) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 72) setDateStyle:0];
    [*(id *)(*(void *)(a1 + 32) + 72) setTimeStyle:1];
    v2 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDateAsRelativeDateAndTimeStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__BSDateFormatterCache_formatDateAsRelativeDateAndTimeStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __61__BSDateFormatterCache_formatDateAsRelativeDateAndTimeStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v3;

    [*(id *)(*(void *)(a1 + 32) + 80) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 80) setDateStyle:1];
    [*(id *)(*(void *)(a1 + 32) + 80) setTimeStyle:1];
    [*(id *)(*(void *)(a1 + 32) + 80) setDoesRelativeDateFormatting:1];
    v2 = *(void **)(*(void *)(a1 + 32) + 80);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDateAsDayOfWeekMonthDayStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BSDateFormatterCache_formatDateAsDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __59__BSDateFormatterCache_formatDateAsDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    [*(id *)(*(void *)(a1 + 32) + 96) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 96) setFormattingContext:2];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 96);
    v8 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEEMMMMd" options:0 locale:*(void *)(v6 + 8)];
    [v7 setDateFormat:v8];

    v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v9];
}

- (id)formatDateAsMultiLineDayOfWeekMonthDayStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__BSDateFormatterCache_formatDateAsMultiLineDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __68__BSDateFormatterCache_formatDateAsMultiLineDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  -[BSDateFormatterCache _configureMultiLineDayOfWeekMonthDayFormatterIfNecessary](*(void **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v3 stringFromDate:v2];
}

- (void)_configureMultiLineDayOfWeekMonthDayFormatterIfNecessary
{
  if (!a1) {
    return;
  }
  obj = a1;
  objc_sync_enter(obj);
  v1 = obj;
  if (!obj[13])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v3 = obj[13];
    obj[13] = v2;

    [obj[13] setLocale:obj[1]];
    [obj[13] setFormattingContext:4];
    id v4 = obj[13];
    id v5 = obj[1];
    uint64_t v6 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEEMMMMd" options:0 locale:v5];
    if ([v6 hasPrefix:@"EEEE "])
    {
      v7 = @"EEEE\n";
      v8 = @"EEEE ";
    }
    else if ([v6 hasPrefix:@"cccc "])
    {
      v7 = @"cccc\n";
      v8 = @"cccc ";
    }
    else if ([v6 hasPrefix:@"EEEE, "])
    {
      v7 = @"EEEE,\n";
      v8 = @"EEEE, ";
    }
    else if ([v6 hasPrefix:@"cccc, "])
    {
      v7 = @"cccc,\n";
      v8 = @"cccc, ";
    }
    else if ([v6 hasPrefix:@"EEEE، "])
    {
      v7 = @"EEEE،\n";
      v8 = @"EEEE، ";
    }
    else if ([v6 hasSuffix:@", EEEE"])
    {
      v7 = @",\nEEEE";
      v8 = @", EEEE";
    }
    else if ([v6 hasSuffix:@" EEEE"])
    {
      v7 = @"\nEEEE";
      v8 = @" EEEE";
    }
    else
    {
      if (![v6 hasSuffix:@"EEEE"])
      {
LABEL_20:

        [v4 setDateFormat:v6];
        v1 = obj;
        goto LABEL_21;
      }
      v7 = @"\nEEEE";
      v8 = @"EEEE";
    }
    uint64_t v9 = [v6 stringByReplacingOccurrencesOfString:v8 withString:v7];

    uint64_t v6 = (void *)v9;
    goto LABEL_20;
  }
LABEL_21:
  objc_sync_exit(v1);
}

- (id)formatDateAsTimeNoAMPM:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__BSDateFormatterCache_formatDateAsTimeNoAMPM___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __47__BSDateFormatterCache_formatDateAsTimeNoAMPM___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  if (!v2)
  {
    uint64_t v3 = [(id)objc_opt_class() formatterForDateAsTimeNoAMPMWithLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 112);
    *(void *)(v4 + 112) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 112);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDateAsLongYMDHMSZWithDate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__BSDateFormatterCache_formatDateAsLongYMDHMSZWithDate___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __56__BSDateFormatterCache_formatDateAsLongYMDHMSZWithDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    [*(id *)(*(void *)(a1 + 32) + 120) setDateFormat:@"yyyy'-'MM'-'dd HH:mm:ss.SSS Z"];
    [*(id *)(*(void *)(a1 + 32) + 120) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    id v2 = *(void **)(*(void *)(a1 + 32) + 120);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDateAsLongYMDHMSZPosixLocaleWithDate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__BSDateFormatterCache_formatDateAsLongYMDHMSZPosixLocaleWithDate___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __67__BSDateFormatterCache_formatDateAsLongYMDHMSZPosixLocaleWithDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = v3;

    [*(id *)(*(void *)(a1 + 32) + 128) setDateFormat:@"yyyy'-'MM'-'dd HH:mm:ss.SSS Z"];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [*(id *)(*(void *)(a1 + 32) + 128) setLocale:v6];

    id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v7];
}

- (id)formatDateAsLongYMDHMSNoSpacesWithDate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__BSDateFormatterCache_formatDateAsLongYMDHMSNoSpacesWithDate___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __63__BSDateFormatterCache_formatDateAsLongYMDHMSNoSpacesWithDate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 136);
    *(void *)(v4 + 136) = v3;

    [*(id *)(*(void *)(a1 + 32) + 136) setDateFormat:@"yyyy'-'MM'-'dd'-'HHmmss"];
    [*(id *)(*(void *)(a1 + 32) + 136) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDateAsRelativeDateStyle:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__BSDateFormatterCache_formatDateAsRelativeDateStyle___block_invoke;
  v8[3] = &unk_1E5446D30;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);

  return v6;
}

uint64_t __54__BSDateFormatterCache_formatDateAsRelativeDateStyle___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    [*(id *)(*(void *)(a1 + 32) + 88) setLocale:*(void *)(*(void *)(a1 + 32) + 8)];
    [*(id *)(*(void *)(a1 + 32) + 88) setDateStyle:1];
    [*(id *)(*(void *)(a1 + 32) + 88) setTimeStyle:0];
    [*(id *)(*(void *)(a1 + 32) + 88) setDoesRelativeDateFormatting:1];
    id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 stringFromDate:v6];
}

- (id)formatDuration:(double)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__BSDateFormatterCache_formatDuration___block_invoke;
  v5[3] = &unk_1E5446D58;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  id v3 = -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v5);
  return v3;
}

- (id)formatTimerDuration:(double)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (self) {
    BOOL v4 = v3 <= 3599;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  [(BSDateFormatterCache *)v6 resetFormattersIfNecessary];
  timerNumberFormatter = v6->_timerNumberFormatter;
  if (!timerNumberFormatter)
  {
    v8 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v9 = v6->_timerNumberFormatter;
    v6->_timerNumberFormatter = v8;

    [(NSNumberFormatter *)v6->_timerNumberFormatter setNumberStyle:0];
    timerNumberFormatter = v6->_timerNumberFormatter;
  }
  [(NSNumberFormatter *)timerNumberFormatter setPositiveFormat:@"0"];
  if (v5)
  {
    v10 = v6->_timerNumberFormatter;
    v11 = [NSNumber numberWithInteger:v3 / 3600];
    v12 = [(NSNumberFormatter *)v10 stringFromNumber:v11];
  }
  else
  {
    v12 = &stru_1ED76E928;
  }
  [(NSNumberFormatter *)v6->_timerNumberFormatter setPositiveFormat:@"00"];
  v13 = v6->_timerNumberFormatter;
  v14 = [NSNumber numberWithInteger:v3 / 60 % 60];
  v15 = [(NSNumberFormatter *)v13 stringFromNumber:v14];

  v16 = v6->_timerNumberFormatter;
  v17 = [NSNumber numberWithInteger:v3 % 60];
  v18 = [(NSNumberFormatter *)v16 stringFromNumber:v17];

  objc_sync_exit(v6);
  v19 = NSString;
  v20 = [MEMORY[0x1E4F28B50] mainBundle];
  if (v5)
  {
    v21 = [v20 localizedStringForKey:@"COUNT_DOWN_TIMER_HMMSS_FORMAT" value:&stru_1ED76E928 table:@"SpringBoard"];
    objc_msgSend(v19, "stringWithFormat:", v21, v12, v15, v18);
  }
  else
  {
    v21 = [v20 localizedStringForKey:@"COUNT_DOWN_TIMER_MMSS_FORMAT" value:&stru_1ED76E928 table:@"SpringBoard"];
    objc_msgSend(v19, "stringWithFormat:", v21, v15, v18);
  v22 = };

  return v22;
}

- (id)formatAbbreviatedTimerDuration:(double)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(BSDateFormatterCache *)v4 resetFormattersIfNecessary];
  abbreviatedTimerFormatter = v4->_abbreviatedTimerFormatter;
  if (!abbreviatedTimerFormatter)
  {
    uint64_t v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    uint64_t v7 = v4->_abbreviatedTimerFormatter;
    v4->_abbreviatedTimerFormatter = v6;

    [(NSDateComponentsFormatter *)v4->_abbreviatedTimerFormatter setZeroFormattingBehavior:0];
    abbreviatedTimerFormatter = v4->_abbreviatedTimerFormatter;
  }
  if ((uint64_t)a3 <= 3599) {
    uint64_t v8 = 192;
  }
  else {
    uint64_t v8 = 224;
  }
  [(NSDateComponentsFormatter *)abbreviatedTimerFormatter setAllowedUnits:v8];
  id v9 = [(NSDateComponentsFormatter *)v4->_abbreviatedTimerFormatter stringFromTimeInterval:a3];
  objc_sync_exit(v4);

  return v9;
}

- (id)formatAlarmSnoozeDuration:(double)a3
{
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(BSDateFormatterCache *)v4 resetFormattersIfNecessary];
  alarmSnoozeFormatter = v4->_alarmSnoozeFormatter;
  if (!alarmSnoozeFormatter)
  {
    uint64_t v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    uint64_t v7 = v4->_alarmSnoozeFormatter;
    v4->_alarmSnoozeFormatter = v6;

    [(NSDateComponentsFormatter *)v4->_alarmSnoozeFormatter setZeroFormattingBehavior:0];
    alarmSnoozeFormatter = v4->_alarmSnoozeFormatter;
  }
  if ((uint64_t)a3 <= 3599) {
    uint64_t v8 = 192;
  }
  else {
    uint64_t v8 = 224;
  }
  [(NSDateComponentsFormatter *)alarmSnoozeFormatter setAllowedUnits:v8];
  id v9 = [(NSDateComponentsFormatter *)v4->_alarmSnoozeFormatter stringFromTimeInterval:a3];
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)supportsMultiLineDayOfWeekMonthDayStyle
{
  id v2 = self;
  objc_sync_enter(v2);
  -[BSDateFormatterCache _configureMultiLineDayOfWeekMonthDayFormatterIfNecessary](v2);
  uint64_t v3 = [(NSDateFormatter *)v2->_multiLineDayOfWeekMonthDayFormatter dateFormat];
  char v4 = [v3 containsString:@"\n"];

  objc_sync_exit(v2);
  return v4;
}

- (void)_resetFormatters:(id)a3
{
  char v4 = (NSLocale *)a3;
  obj = self;
  objc_sync_enter(obj);
  locale = obj->_locale;
  obj->_locale = v4;
  uint64_t v6 = v4;

  dayOfWeekFormatter = obj->_dayOfWeekFormatter;
  obj->_dayOfWeekFormatter = 0;

  dayOfWeekWithTimeFormatter = obj->_dayOfWeekWithTimeFormatter;
  obj->_dayOfWeekWithTimeFormatter = 0;

  dayMonthYearFormatter = obj->_dayMonthYearFormatter;
  obj->_dayMonthYearFormatter = 0;

  shortDayMonthTimeFormatter = obj->_shortDayMonthTimeFormatter;
  obj->_shortDayMonthTimeFormatter = 0;

  abbrevDayOfWeekWithMonthDayFormatter = obj->_abbrevDayOfWeekWithMonthDayFormatter;
  obj->_abbrevDayOfWeekWithMonthDayFormatter = 0;

  abbrevDayMonthFormatter = obj->_abbrevDayMonthFormatter;
  obj->_abbrevDayMonthFormatter = 0;

  abbrevDayMonthTimeFormatter = obj->_abbrevDayMonthTimeFormatter;
  obj->_abbrevDayMonthTimeFormatter = 0;

  dayOfWeekMonthDayFormatter = obj->_dayOfWeekMonthDayFormatter;
  obj->_dayOfWeekMonthDayFormatter = 0;

  multiLineDayOfWeekMonthDayFormatter = obj->_multiLineDayOfWeekMonthDayFormatter;
  obj->_multiLineDayOfWeekMonthDayFormatter = 0;

  timeNoAMPMFormatter = obj->_timeNoAMPMFormatter;
  obj->_timeNoAMPMFormatter = 0;

  timeFormatter = obj->_timeFormatter;
  obj->_timeFormatter = 0;

  relativeDateTimeFormatter = obj->_relativeDateTimeFormatter;
  obj->_relativeDateTimeFormatter = 0;

  relativeDateFormatter = obj->_relativeDateFormatter;
  obj->_relativeDateFormatter = 0;

  decimalFormatter = obj->_decimalFormatter;
  obj->_decimalFormatter = 0;

  durationFormatter = obj->_durationFormatter;
  obj->_durationFormatter = 0;

  timerNumberFormatter = obj->_timerNumberFormatter;
  obj->_timerNumberFormatter = 0;

  abbreviatedTimerFormatter = obj->_abbreviatedTimerFormatter;
  obj->_abbreviatedTimerFormatter = 0;

  alarmSnoozeFormatter = obj->_alarmSnoozeFormatter;
  obj->_alarmSnoozeFormatter = 0;

  longYMDHMSZFormatter = obj->_longYMDHMSZFormatter;
  obj->_longYMDHMSZFormatter = 0;

  longYMDHMSNoSpaceFormatter = obj->_longYMDHMSNoSpaceFormatter;
  obj->_longYMDHMSNoSpaceFormatter = 0;

  objc_sync_exit(obj);
}

- (void)_resetFormatters
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  -[BSDateFormatterCache _resetFormatters:](self, "_resetFormatters:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmSnoozeFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedTimerFormatter, 0);
  objc_storeStrong((id *)&self->_timerNumberFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSNoSpaceFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSZPosixLocaleFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSZFormatter, 0);
  objc_storeStrong((id *)&self->_timeNoAMPMFormatter, 0);
  objc_storeStrong((id *)&self->_multiLineDayOfWeekMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayOfWeekWithMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dayMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekWithTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end