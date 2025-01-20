@interface CADStatCollector
+ (BOOL)enabled;
+ (id)eventName;
- (BOOL)enabled;
- (BOOL)wantsCalendars;
- (BOOL)wantsEvents;
- (BOOL)wantsOccurrences;
- (BOOL)wantsReminders;
- (BOOL)wantsStores;
- (id)desiredOccurrenceRange;
- (id)desiredReminderRange;
- (id)eventDictionaries;
- (id)eventName;
@end

@implementation CADStatCollector

+ (BOOL)enabled
{
  v2 = [a1 eventName];
  char IsEventUsed = CalAnalyticsIsEventUsed();

  return IsEventUsed;
}

- (BOOL)enabled
{
  v2 = [(CADStatCollector *)self eventName];
  char IsEventUsed = CalAnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (id)eventName
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    int v6 = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_ERROR, "CADStat subclass %@ should override +eventName", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)eventName
{
  v2 = objc_opt_class();
  return (id)[v2 eventName];
}

- (BOOL)wantsStores
{
  return 0;
}

- (BOOL)wantsCalendars
{
  return 0;
}

- (BOOL)wantsOccurrences
{
  return 0;
}

- (BOOL)wantsEvents
{
  return 0;
}

- (BOOL)wantsReminders
{
  return 0;
}

- (id)desiredOccurrenceRange
{
  return 0;
}

- (id)desiredReminderRange
{
  return 0;
}

- (id)eventDictionaries
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end