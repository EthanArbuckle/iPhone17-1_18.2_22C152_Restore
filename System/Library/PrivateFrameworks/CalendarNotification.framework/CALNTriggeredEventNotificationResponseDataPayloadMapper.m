@interface CALNTriggeredEventNotificationResponseDataPayloadMapper
+ (id)_hypothesisDataForNotificationData:(id)a3;
+ (id)_hypothesisFromPayload:(id)a3;
+ (id)_lastFireTimeOfAlertOffsetFromTravelTimeFromPayload:(id)a3;
+ (id)notificationResponseDataForPayload:(id)a3;
+ (id)payloadForNotificationResponseData:(id)a3;
+ (void)_setHypothesisDataFromNotificationData:(id)a3 inPayload:(id)a4;
+ (void)_setLastFireTimeOfAlertOffsetFromTravelTimeFromNotificationData:(id)a3 inPayload:(id)a4;
@end

@implementation CALNTriggeredEventNotificationResponseDataPayloadMapper

+ (id)payloadForNotificationResponseData:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  [a1 _setHypothesisDataFromNotificationData:v5 inPayload:v6];
  [a1 _setLastFireTimeOfAlertOffsetFromTravelTimeFromNotificationData:v5 inPayload:v6];

  v7 = (void *)[v6 copy];
  return v7;
}

+ (id)notificationResponseDataForPayload:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _hypothesisFromPayload:v4];
  v6 = [a1 _lastFireTimeOfAlertOffsetFromTravelTimeFromPayload:v4];

  v7 = [[CALNTriggeredEventNotificationResponseData alloc] initWithHypothesis:v5 lastFireTimeOfAlertOffsetFromTravelTime:v6];
  return v7;
}

+ (id)_hypothesisFromPayload:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataHypothesisDataPayloadKey"];
  if (v3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      v7 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CALNTriggeredEventNotificationResponseDataPayloadMapper _hypothesisFromPayload:]((uint64_t)v5, v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (void)_setHypothesisDataFromNotificationData:(id)a3 inPayload:(id)a4
{
  id v7 = a4;
  id v6 = [a1 _hypothesisDataForNotificationData:a3];
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataHypothesisDataPayloadKey"];
  }
}

+ (id)_hypothesisDataForNotificationData:(id)a3
{
  v3 = [a3 hypothesis];
  if (v3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v9];
    id v5 = v9;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v7 = +[CALNLogSubsystem calendar];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[CALNTriggeredEventNotificationResponseDataPayloadMapper _hypothesisDataForNotificationData:]((uint64_t)v5, v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_lastFireTimeOfAlertOffsetFromTravelTimeFromPayload:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataLastFireTimeOfAlertOffsetFromTravelTimePayloadKey"];
}

+ (void)_setLastFireTimeOfAlertOffsetFromTravelTimeFromNotificationData:(id)a3 inPayload:(id)a4
{
  id v6 = a4;
  id v5 = [a3 lastFireTimeOfAlertOffsetFromTravelTime];
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"com.apple.calendar.notifications.CALNTriggeredEventNotificationResponseDataLastFireTimeOfAlertOffsetFromTravelTimePayloadKey"];
  }
}

+ (void)_hypothesisFromPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not unarchive hypothesis. error = %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)_hypothesisDataForNotificationData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not archive hypothesis. error = %{public}@", (uint8_t *)&v2, 0xCu);
}

@end