@interface HDMCUnconfirmedDeviationNotificationStateMachineState
+ (id)stateFromDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDMCUnconfirmedDeviationNotificationStateMachineState)initWithFireDayIndex:(id)a3;
- (NSNumber)fireDayIndex;
- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3;
- (id)computeNewStateFromAnalysis:(id)a3 dismissalDayIndex:(id)a4 currentDate:(id)a5 unconfirmedDeviationNotificationTimeOfDay:(id)a6;
- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5;
- (id)computeNewStateFromUnconfirmedDeviations:(id)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5;
- (id)computeStateFromNoUnconfirmedDeviations;
- (id)dictionaryRepresentation;
- (id)hk_redactedDescription;
- (id)scheduledNotificationFireDayIndex;
- (int64_t)stateType;
@end

@implementation HDMCUnconfirmedDeviationNotificationStateMachineState

- (HDMCUnconfirmedDeviationNotificationStateMachineState)initWithFireDayIndex:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMCUnconfirmedDeviationNotificationStateMachineState;
  v6 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fireDayIndex, a3);
  }

  return v7;
}

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

+ (id)stateFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"StateType"];
  uint64_t v5 = [v4 integerValue];

  if (v5 == 1)
  {
    v6 = off_264750258;
LABEL_5:
    v7 = [(__objc2_class *)*v6 notificationStateFromDictionaryRepresentation:v3];
    if (v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v5 == 2)
  {
    v6 = off_264750248;
    goto LABEL_5;
  }
LABEL_6:
  v7 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)[HDMCUnconfirmedDeviationNotificationWaitingState alloc] initWithFireDayIndex:0];
LABEL_7:

  return v7;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCUnconfirmedDeviationNotificationStateMachineState stateType](self, "stateType"));
  [v3 setObject:v4 forKeyedSubscript:@"StateType"];

  uint64_t v5 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self fireDayIndex];
  [v3 setObject:v5 forKeyedSubscript:@"FireDayIndex"];

  v6 = (void *)[v3 copy];
  return v6;
}

- (id)computeStateFromNoUnconfirmedDeviations
{
  v2 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)[HDMCUnconfirmedDeviationNotificationWaitingState alloc] initWithFireDayIndex:0];
  return v2;
}

- (id)computeNewStateFromUnconfirmedDeviations:(id)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    int64_t v25 = a5;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v17 = [v16 days];
          uint64_t v19 = v18 + v17 - 1;
          if (v18 <= 0) {
            uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v19 > v13)
          {
            uint64_t v20 = [v16 days];
            if (v21 <= 0) {
              uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v13 = v21 + v20 - 1;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    uint64_t v22 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self computeNewStateFromMaxEnd:v13 dismissalDayIndex:v9 scheduledFireDayIndex:v25];
  }
  else
  {
    uint64_t v22 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self computeStateFromNoUnconfirmedDeviations];
  }
  v23 = (void *)v22;

  return v23;
}

- (id)computeNewStateFromMaxEnd:(int64_t)a3 dismissalDayIndex:(id)a4 scheduledFireDayIndex:(int64_t)a5
{
  v6 = [HDMCUnconfirmedDeviationNotificationScheduledState alloc];
  v7 = [NSNumber numberWithInteger:a5];
  id v8 = [(HDMCUnconfirmedDeviationNotificationScheduledState *)v6 initWithFireDayIndex:v7];

  return v8;
}

- (id)computeNewStateFromAnalysis:(id)a3 dismissalDayIndex:(id)a4 currentDate:(id)a5 unconfirmedDeviationNotificationTimeOfDay:(id)a6
{
  id v10 = (void *)MEMORY[0x263EFF8F0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_msgSend(v10, "hk_gregorianCalendar");
  v16 = objc_msgSend(v15, "hkmc_nextDateAfterDate:matchingHourComponents:", v12, v11);

  uint64_t v17 = objc_msgSend(v16, "hk_dayIndexWithCalendar:", v15);
  uint64_t v18 = [v14 deviations];

  uint64_t v19 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self computeNewStateFromUnconfirmedDeviations:v18 dismissalDayIndex:v13 scheduledFireDayIndex:v17];

  return v19;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self stateType],
        v5 == [v4 stateType]))
  {
    v6 = [(HDMCUnconfirmedDeviationNotificationStateMachineState *)self fireDayIndex];
    uint64_t v7 = [v6 integerValue];
    id v8 = [v4 fireDayIndex];
    BOOL v9 = v7 == [v8 integerValue];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)hk_redactedDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (NSNumber)fireDayIndex
{
  return self->_fireDayIndex;
}

- (void).cxx_destruct
{
}

- (int64_t)stateType
{
  return 1;
}

@end