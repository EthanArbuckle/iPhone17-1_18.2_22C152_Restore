@interface HDMCUnconfirmedDeviationNotificationWaitingState
+ (id)notificationStateFromDictionaryRepresentation:(id)a3;
- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5;
- (id)scheduledNotificationFireDayIndex;
- (int64_t)stateType;
@end

@implementation HDMCUnconfirmedDeviationNotificationWaitingState

- (int64_t)stateType
{
  return 1;
}

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"FireDayIndex"];

  v7 = (void *)[v5 initWithFireDayIndex:v6];
  return v7;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  id v8 = a4;
  v9 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self fireDayIndex];
  id v10 = v9;
  if (v8)
  {

    if (!v10)
    {
      id v10 = v8;
      goto LABEL_10;
    }
    int v11 = [v8 intValue];
    v12 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self fireDayIndex];
    int v13 = [v12 intValue];

    if (v11 <= v13) {
      int v14 = v13;
    }
    else {
      int v14 = v11;
    }
    id v10 = [NSNumber numberWithInteger:v14 + 180];
  }
  if (!v10)
  {
    v15 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
    id v10 = [NSNumber numberWithInteger:a5];
    v16 = [(HDMCUnconfirmedDeviationNotificationScheduledState *)v15 initWithFireDayIndex:v10];
    goto LABEL_13;
  }
LABEL_10:
  if ([v10 integerValue] < a3)
  {
    v17 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
    v18 = [NSNumber numberWithInteger:a5];
    v19 = [(HDMCUnconfirmedDeviationNotificationScheduledState *)v17 initWithFireDayIndex:v18];

    goto LABEL_14;
  }
  v16 = self;
LABEL_13:
  v19 = (HDMCUnconfirmedDeviationNotificationScheduledState *)v16;
LABEL_14:

  return v19;
}

@end