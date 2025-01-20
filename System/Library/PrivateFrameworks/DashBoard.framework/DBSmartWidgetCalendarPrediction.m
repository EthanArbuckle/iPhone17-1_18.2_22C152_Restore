@interface DBSmartWidgetCalendarPrediction
+ (NSDate)earliestStartDate;
+ (NSDate)latestStartDate;
+ (NSDate)now;
+ (SEL)isEqualClassSelector;
+ (double)initialValidInterval;
+ (double)maxValue;
+ (double)minValue;
+ (int64_t)baseScore;
+ (void)initialValidInterval;
+ (void)setNow:(id)a3;
- (BOOL)allDay;
- (BOOL)isEqualToCalendarPrediction:(id)a3;
- (BOOL)isSoonestEvent;
- (BOOL)showImageBorder;
- (BOOL)updateWithPrediction:(id)a3;
- (BOOL)variousEndDates;
- (DBSmartWidgetCalendarPrediction)initWithEvent:(id)a3;
- (NSArray)events;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)initialValidInterval;
- (double)value;
- (id)_uuidFromString:(id)a3;
- (id)actionBlock;
- (id)defaultValidRanges;
- (id)image;
- (id)predictedObjectDescription;
- (id)subtitle;
- (id)title;
- (int64_t)tieBreakScore;
- (void)addEvent:(id)a3;
- (void)defaultValidRanges;
- (void)setSoonestEvent:(BOOL)a3;
- (void)updateRangeIfNeeded:(id)a3;
@end

@implementation DBSmartWidgetCalendarPrediction

+ (void)setNow:(id)a3
{
}

+ (NSDate)now
{
  return (NSDate *)(id)_now;
}

+ (NSDate)earliestStartDate
{
  v2 = [(id)objc_opt_class() now];
  v3 = [v2 dateByAddingTimeInterval:-3600.0];

  return (NSDate *)v3;
}

+ (NSDate)latestStartDate
{
  v2 = [(id)objc_opt_class() now];
  v3 = [v2 dateByAddingTimeInterval:14400.0];

  return (NSDate *)v3;
}

- (DBSmartWidgetCalendarPrediction)initWithEvent:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DBSmartWidgetCalendarPrediction;
  v5 = [(DBSmartWidgetPrediction *)&v11 init];
  if (v5)
  {
    v12[0] = v4;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    events = v5->_events;
    v5->_events = (NSArray *)v6;

    v8 = [v4 eventIdentifier];
    v9 = [(DBSmartWidgetCalendarPrediction *)v5 _uuidFromString:v8];
    [(DBSmartWidgetPrediction *)v5 setUniqueIdentifier:v9];
  }
  return v5;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  v5 = [(DBSmartWidgetCalendarPrediction *)self events];
  uint64_t v6 = (NSArray *)[v5 mutableCopy];

  [(NSArray *)v6 addObject:v4];
  events = self->_events;
  self->_events = v6;
}

- (void)setSoonestEvent:(BOOL)a3
{
  if (self->_soonestEvent != a3)
  {
    self->_soonestEvent = a3;
    [(DBSmartWidgetPrediction *)self invalidateValidIntervals];
  }
}

- (NSDate)startDate
{
  v2 = [(DBSmartWidgetCalendarPrediction *)self events];
  v3 = [v2 firstObject];
  id v4 = [v3 startDate];

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  if ([(DBSmartWidgetCalendarPrediction *)self variousEndDates])
  {
    v3 = 0;
  }
  else
  {
    id v4 = [(DBSmartWidgetCalendarPrediction *)self events];
    v5 = [v4 firstObject];
    v3 = [v5 endDate];
  }
  return (NSDate *)v3;
}

- (BOOL)allDay
{
  v2 = [(DBSmartWidgetCalendarPrediction *)self events];
  v3 = [v2 firstObject];
  char v4 = [v3 isAllDay];

  return v4;
}

- (BOOL)variousEndDates
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v3 = [(DBSmartWidgetCalendarPrediction *)self events];
  char v4 = [v3 firstObject];
  v5 = [v4 endDate];

  uint64_t v6 = [(DBSmartWidgetCalendarPrediction *)self events];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__DBSmartWidgetCalendarPrediction_variousEndDates__block_invoke;
  v9[3] = &unk_2649B5A88;
  id v7 = v5;
  id v10 = v7;
  objc_super v11 = &v12;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v6;
}

void __50__DBSmartWidgetCalendarPrediction_variousEndDates__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 endDate];
  char v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)isEqualToCalendarPrediction:(id)a3
{
  id v4 = a3;
  int v5 = [(DBSmartWidgetCalendarPrediction *)self isSoonestEvent];
  if (v5 != [v4 isSoonestEvent]) {
    goto LABEL_6;
  }
  uint64_t v6 = [(DBSmartWidgetCalendarPrediction *)self startDate];
  char v7 = [v4 startDate];
  int v8 = [v6 isEqualToDate:v7];

  if (!v8) {
    goto LABEL_6;
  }
  v9 = [(DBSmartWidgetCalendarPrediction *)self endDate];
  id v10 = [v4 endDate];
  int v11 = [v9 isEqualToDate:v10];

  if (!v11) {
    goto LABEL_6;
  }
  uint64_t v12 = [(DBSmartWidgetCalendarPrediction *)self title];
  v13 = [v4 title];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    char v15 = [(DBSmartWidgetCalendarPrediction *)self subtitle];
    v16 = [v4 subtitle];
    char v17 = [v15 isEqualToString:v16];
  }
  else
  {
LABEL_6:
    char v17 = 0;
  }

  return v17;
}

- (id)_uuidFromString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  int v5 = [v3 componentsSeparatedByString:@":"];
  uint64_t v6 = [v5 lastObject];
  char v7 = (void *)[v4 initWithUUIDString:v6];

  if (!v7)
  {
    uint64_t v13 = [v3 hash];
    int v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v13 length:8];
    id v9 = objc_alloc(MEMORY[0x263F08C38]);
    id v10 = v8;
    char v7 = objc_msgSend(v9, "initWithUUIDBytes:", objc_msgSend(v10, "bytes"));
    int v11 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetCalendarPrediction *)(uint64_t)v3 _uuidFromString:v11];
    }
  }
  return v7;
}

- (id)title
{
  id v3 = [(DBSmartWidgetCalendarPrediction *)self events];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    int v5 = [(DBSmartWidgetCalendarPrediction *)self events];
    uint64_t v6 = [v5 firstObject];
    [v6 title];
  }
  else
  {
    char v7 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    int v5 = [v7 localizedStringForKey:@"SMARTWIDGET_CALENDAR_EVENT_COUNT" value:&stru_26E13A820 table:@"CarPlayApp"];

    int v8 = NSString;
    uint64_t v6 = [(DBSmartWidgetCalendarPrediction *)self events];
    objc_msgSend(v8, "localizedStringWithFormat:", v5, objc_msgSend(v6, "count"));
  id v9 = };

  return v9;
}

- (id)subtitle
{
  if ([(DBSmartWidgetCalendarPrediction *)self allDay])
  {
    id v3 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    uint64_t v4 = [v3 localizedStringForKey:@"SMARTWIDGET_CALENDAR_ALLDAY" value:&stru_26E13A820 table:@"CarPlayApp"];
  }
  else if ([(DBSmartWidgetCalendarPrediction *)self variousEndDates])
  {
    int v5 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    id v3 = [v5 localizedStringForKey:@"SMARTWIDGET_CALENDAR_EVENTS_STARTING" value:&stru_26E13A820 table:@"CarPlayApp"];

    uint64_t v6 = NSString;
    char v7 = [(DBSmartWidgetCalendarPrediction *)self startDate];
    int v8 = +[DBDateFormatter formattedTime:v7];
    uint64_t v4 = objc_msgSend(v6, "stringWithFormat:", v3, v8);
  }
  else
  {
    id v3 = [(DBSmartWidgetCalendarPrediction *)self startDate];
    id v9 = [(DBSmartWidgetCalendarPrediction *)self endDate];
    uint64_t v4 = +[DBDateFormatter formattedRangeStart:v3 end:v9];
  }
  return v4;
}

- (id)image
{
  v2 = [MEMORY[0x263F82B60] _carScreen];
  [v2 scale];
  double v4 = v3;

  return DBCalendarIconImageWithInfoAndBorder(0, 60.0, 60.0, v4, 13.5);
}

- (BOOL)showImageBorder
{
  return 1;
}

- (id)actionBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__DBSmartWidgetCalendarPrediction_actionBlock__block_invoke;
  v4[3] = &unk_2649B4738;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __46__DBSmartWidgetCalendarPrediction_actionBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained events];
  unint64_t v3 = [v2 count];

  if (v3 < 2)
  {
    uint64_t v6 = [WeakRetained events];
    char v7 = [v6 firstObject];
    int v11 = [v7 externalURI];
  }
  else
  {
    id v4 = objc_alloc(NSURL);
    id v5 = NSString;
    uint64_t v6 = [WeakRetained events];
    char v7 = [v6 firstObject];
    int v8 = [v7 startDate];
    [v8 timeIntervalSinceReferenceDate];
    id v10 = objc_msgSend(v5, "stringWithFormat:", @"calshow:%d", (int)v9);
    int v11 = (void *)[v4 initWithString:v10];
  }
  uint64_t v12 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __46__DBSmartWidgetCalendarPrediction_actionBlock__block_invoke_cold_1(v11, v12);
  }

  if (v11)
  {
    uint64_t v13 = +[DBApplicationController sharedInstance];
    int v14 = [v13 calendarApplication];

    char v15 = objc_alloc_init(DBActivationSettings);
    [(DBActivationSettings *)v15 setUrl:v11];
    v16 = +[DBApplicationLaunchInfo launchInfoForApplication:v14 withActivationSettings:v15];
    char v17 = [WeakRetained delegate];
    v18 = +[DBEvent eventWithType:4 context:v16];
    [v17 handleEvent:v18];
  }
}

+ (int64_t)baseScore
{
  return 10;
}

- (id)predictedObjectDescription
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(DBSmartWidgetCalendarPrediction *)self events];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "db_ShortDescription");
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  id v10 = NSString;
  if ([(DBSmartWidgetCalendarPrediction *)self isSoonestEvent]) {
    int v11 = @"YES";
  }
  else {
    int v11 = @"NO";
  }
  uint64_t v12 = [v3 componentsJoinedByString:@", "];
  uint64_t v13 = [v10 stringWithFormat:@"isSoonestEvent=%@ (%@)", v11, v12];

  return v13;
}

- (BOOL)updateWithPrediction:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DBSmartWidgetCalendarPrediction;
  [(DBSmartWidgetPrediction *)&v11 updateWithPrediction:v4];
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  BOOL v7 = [(DBSmartWidgetCalendarPrediction *)self isEqualToCalendarPrediction:v6];
  if (!v7) {
    [(DBSmartWidgetPrediction *)self invalidateValidIntervals];
  }
  int v8 = [v6 events];
  events = self->_events;
  self->_events = v8;

  -[DBSmartWidgetCalendarPrediction setSoonestEvent:](self, "setSoonestEvent:", [v6 isSoonestEvent]);
  [(DBSmartWidgetPrediction *)self predictionDidUpdate];

  return !v7;
}

+ (SEL)isEqualClassSelector
{
  return sel_isEqualToCalendarPrediction_;
}

- (double)value
{
  unint64_t v3 = [(DBSmartWidgetCalendarPrediction *)self events];
  id v4 = [v3 firstObject];
  id v5 = [v4 startDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  int v8 = [(id)objc_opt_class() earliestStartDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v7 >= v10)
  {
    objc_super v11 = [(DBSmartWidgetCalendarPrediction *)self events];
    int v14 = [v11 firstObject];
    long long v15 = [v14 startDate];
    [v15 timeIntervalSinceReferenceDate];
    double v13 = v16;
  }
  else
  {
    objc_super v11 = [(id)objc_opt_class() earliestStartDate];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
  }

  return v13;
}

- (int64_t)tieBreakScore
{
  unint64_t v3 = [(id)objc_opt_class() latestStartDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;
  double v6 = [(DBSmartWidgetCalendarPrediction *)self events];
  double v7 = [v6 firstObject];
  int v8 = [v7 startDate];
  [v8 timeIntervalSinceReferenceDate];
  int64_t v10 = (uint64_t)(v5 - v9);

  return v10;
}

+ (double)maxValue
{
  v2 = [(id)objc_opt_class() earliestStartDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

+ (double)minValue
{
  v2 = [(id)objc_opt_class() latestStartDate];
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  return v4;
}

+ (double)initialValidInterval
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SmartEngineCalendar_InitialValidInterval", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  uint64_t v3 = 480;
  if (keyExistsAndHasValidFormat) {
    uint64_t v3 = AppIntegerValue;
  }
  double v4 = (double)v3;
  if (v3 <= 0)
  {
    double v5 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[DBSmartWidgetCalendarPrediction initialValidInterval];
    }

    return 30.0;
  }
  return v4;
}

- (double)initialValidInterval
{
  if (![(DBSmartWidgetCalendarPrediction *)self isSoonestEvent]) {
    return 1.79769313e308;
  }
  v2 = objc_opt_class();
  [v2 initialValidInterval];
  return result;
}

- (id)defaultValidRanges
{
  v34[1] = *MEMORY[0x263EF8340];
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SmartEngineCalendar_BeforeStartDateValidInterval", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  uint64_t v4 = -300;
  if (keyExistsAndHasValidFormat) {
    uint64_t v4 = AppIntegerValue;
  }
  double v5 = (double)v4;
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(DBSmartWidgetCalendarPrediction *)v6 defaultValidRanges];
    }

    double v5 = -15.0;
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex v14 = CFPreferencesGetAppIntegerValue(@"SmartEngineCalendar_AfterStartDateValidInterval", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  uint64_t v15 = 180;
  if (keyExistsAndHasValidFormat) {
    uint64_t v15 = v14;
  }
  double v16 = (double)v15;
  if (v15 <= 0)
  {
    long long v17 = DBLogForCategory(7uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[DBSmartWidgetCalendarPrediction initialValidInterval];
    }

    double v16 = 15.0;
  }
  v25 = [DBDateRange alloc];
  v26 = [(DBSmartWidgetCalendarPrediction *)self startDate];
  v27 = [v26 dateByAddingTimeInterval:v5];
  v28 = [(DBSmartWidgetCalendarPrediction *)self startDate];
  v29 = [v28 dateByAddingTimeInterval:v16];
  v30 = [(DBDateRange *)v25 initWithStart:v27 end:v29];
  v34[0] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];

  return v31;
}

- (void)updateRangeIfNeeded:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v5 = [(DBSmartWidgetCalendarPrediction *)self events];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = [v4 end];
        [v11 timeIntervalSinceReferenceDate];
        double v13 = v12;
        CFIndex v14 = [v10 endDate];
        [v14 timeIntervalSinceReferenceDate];
        double v16 = v15;

        if (v13 >= v16)
        {
          long long v17 = [v10 endDate];
          uint64_t v18 = [v17 dateByAddingTimeInterval:60.0];
          [v4 setEnd:v18];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (BOOL)isSoonestEvent
{
  return self->_soonestEvent;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
}

- (void)_uuidFromString:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "UUID failed: input=%{public}@ generated=%{public}@", (uint8_t *)&v3, 0x16u);
}

void __46__DBSmartWidgetCalendarPrediction_actionBlock__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 absoluteString];
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "Opening calendar with URL %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)initialValidInterval
{
}

- (void)defaultValidRanges
{
}

@end