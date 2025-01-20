@interface ATXUserNotificationLoggingEvent(TimedEvent)
- (uint64_t)eventTime;
@end

@implementation ATXUserNotificationLoggingEvent(TimedEvent)

- (uint64_t)eventTime
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  [a1 timestamp];
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

@end