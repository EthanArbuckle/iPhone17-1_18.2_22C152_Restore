@interface ATXModeTransitionModeEventProvider
- (ATXModeTransitionModeEventProvider)initWithMode:(unint64_t)a3;
- (BOOL)eventIsDuringThanksgivingShutdown:(id)a3;
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (NSString)description;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)bmStoreEventsForLast61DaysWithStartDateToday:(id)a3 endDateToday:(id)a4 includeWeekends:(BOOL)a5 includeHolidays:(BOOL)a6;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
- (unint64_t)mode;
@end

@implementation ATXModeTransitionModeEventProvider

- (ATXModeTransitionModeEventProvider)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXModeTransitionModeEventProvider;
  result = [(ATXModeTransitionModeEventProvider *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (id)biomePublisherWithBookmark:(id)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"ATXModeTransitionModeEventProvider.m" lineNumber:35 description:@"Must be implemented by sub-classes."];

  v6 = objc_opt_new();
  return v6;
}

- (id)eventsFromPublisher
{
  v3 = objc_opt_new();
  v4 = [(ATXModeTransitionModeEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ATXModeTransitionModeEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68AD360;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_48 receiveInput:v10];

  v7 = v11;
  id v8 = v5;

  return v8;
}

void __57__ATXModeTransitionModeEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = v7;
  if (isKindOfClass)
  {
    id v6 = [*(id *)(a1 + 32) aggregationEventsFromEvent:v7];
    if ([v6 count]) {
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }

    id v5 = v7;
  }
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXModeTransitionModeEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    v8[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXModeTransitionModeEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 eventBody];
    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v7 = [v5 startDate];
    id v8 = [v5 endDate];
    v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)ATXModeToString();
}

- (id)bmStoreEventsForLast61DaysWithStartDateToday:(id)a3 endDateToday:(id)a4 includeWeekends:(BOOL)a5 includeHolidays:(BOOL)a6
{
  v20 = self;
  id v9 = a3;
  id v10 = a4;
  id v21 = (id)objc_opt_new();
  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v12 = -61;
  do
  {
    v13 = objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, v12 + 1, v9, 0, v20);
    v14 = [v11 dateByAddingUnit:16 value:v12 + 1 toDate:v10 options:0];
    if ((a5 || ([v11 isDateInWeekend:v13] & 1) == 0)
      && (a6
       || ![(ATXModeTransitionModeEventProvider *)v20 eventIsDuringThanksgivingShutdown:v13]))
    {
      v15 = [[ATXModeEvent alloc] initWithStartDate:v13 endDate:v14];
      id v16 = objc_alloc(MEMORY[0x1E4F50280]);
      [v13 timeIntervalSinceReferenceDate];
      v17 = objc_msgSend(v16, "initWithEventBody:timestamp:", v15);
      [v21 addObject:v17];
    }
  }
  while (!__CFADD__(v12++, 1));

  return v21;
}

- (BOOL)eventIsDuringThanksgivingShutdown:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = objc_opt_new();
  [v6 setDay:21];
  [v6 setMonth:11];
  [v6 setYear:2020];
  id v7 = [v5 dateFromComponents:v6];
  [v6 setDay:29];
  [v6 setMonth:11];
  [v6 setYear:2020];
  id v8 = [v5 dateFromComponents:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  char v10 = [v9 containsDate:v4];

  return v10;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end