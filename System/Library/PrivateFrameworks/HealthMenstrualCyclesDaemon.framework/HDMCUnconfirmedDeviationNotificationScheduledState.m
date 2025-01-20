@interface HDMCUnconfirmedDeviationNotificationScheduledState
+ (id)notificationStateFromDictionaryRepresentation:(id)a3;
- (HDMCUnconfirmedDeviationNotificationScheduledState)initWithFireDayIndex:(id)a3;
- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3;
- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5;
- (int64_t)stateType;
@end

@implementation HDMCUnconfirmedDeviationNotificationScheduledState

- (HDMCUnconfirmedDeviationNotificationScheduledState)initWithFireDayIndex:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HDMCUnconfirmedDeviationNotificationStateMachineState.m" lineNumber:152 description:@"You cannot enter a scheduled state without a fire day associated with it"];
  }
  v9.receiver = self;
  v9.super_class = (Class)HDMCUnconfirmedDeviationNotificationScheduledState;
  v6 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)&v9 initWithFireDayIndex:v5];

  return v6;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"FireDayIndex"];

  if (v5)
  {
    id v6 = objc_alloc((Class)a1);
    v7 = [v4 objectForKeyedSubscript:@"FireDayIndex"];
    v8 = (void *)[v6 initWithFireDayIndex:v7];
  }
  else
  {
    _HKInitializeLogging();
    objc_super v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCUnconfirmedDeviationNotificationScheduledState notificationStateFromDictionaryRepresentation:](v9);
    }
    v8 = 0;
  }

  return v8;
}

- (int64_t)stateType
{
  return 2;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  id v4 = [HDMCUnconfirmedDeviationNotificationWaitingState alloc];
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)v4 initWithFireDayIndex:v5];

  return v6;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  id v8 = a4;
  objc_super v9 = v8;
  if (v8 && [v8 integerValue] <= a5 && objc_msgSend(v9, "integerValue") >= a3) {
    v10 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)[HDMCUnconfirmedDeviationNotificationWaitingState alloc] initWithFireDayIndex:0];
  }
  else {
    v10 = self;
  }
  v11 = v10;

  return v11;
}

+ (void)notificationStateFromDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = objc_opt_class();
  id v3 = v2;
  id v4 = HKSensitiveLogItem();
  int v5 = 138543618;
  id v6 = v2;
  __int16 v7 = 2112;
  id v8 = v4;
  _os_log_error_impl(&dword_225722000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot retrieve full state from dictionary: %@", (uint8_t *)&v5, 0x16u);
}

@end