@interface _ATXNotificationDuetEvent
- (BOOL)isAcceptEvent;
- (BOOL)isReceiveEvent;
- (BOOL)isRejectEvent;
- (NSDate)eventTime;
- (NSString)bundleId;
- (NSString)notificationId;
- (NSTimeZone)timeZone;
- (_ATXNotificationDuetEvent)initWithBundleId:(id)a3 notificationId:(id)a4 eventTime:(id)a5 timeZone:(id)a6 eventType:(id)a7;
- (id)prettyRepresentation;
- (int64_t)eventType;
@end

@implementation _ATXNotificationDuetEvent

- (_ATXNotificationDuetEvent)initWithBundleId:(id)a3 notificationId:(id)a4 eventTime:(id)a5 timeZone:(id)a6 eventType:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_ATXNotificationDuetEvent;
  v17 = [(_ATXNotificationDuetEvent *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_notificationId, a4);
    objc_storeStrong((id *)&v18->_eventTime, a5);
    objc_storeStrong((id *)&v18->_timeZone, a6);
    v18->_eventType = ATXNEventTypeFromString();
  }

  return v18;
}

- (id)prettyRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v4 = (void *)MEMORY[0x1E4F28C10];
  v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v6 = [v4 dateFormatFromTemplate:@"EMMMd HH:mm ss ZZZZ" options:0 locale:v5];

  [v3 setDateFormat:v6];
  v7 = [v3 stringFromDate:self->_eventTime];
  v8 = NSString;
  v9 = ATXNEventTypeToString();
  v10 = [v8 stringWithFormat:@"%@: (%@, %@, %@)", v7, v9, self->_notificationId, self->_bundleId];

  return v10;
}

- (BOOL)isReceiveEvent
{
  return self->_eventType == 0;
}

- (BOOL)isAcceptEvent
{
  return (self->_eventType < 0xCuLL) & (0xA86u >> self->_eventType);
}

- (BOOL)isRejectEvent
{
  return (self->_eventType < 0xBuLL) & (0x568u >> self->_eventType);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (NSDate)eventTime
{
  return self->_eventTime;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end