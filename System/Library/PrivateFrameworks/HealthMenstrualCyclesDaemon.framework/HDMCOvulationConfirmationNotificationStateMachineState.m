@interface HDMCOvulationConfirmationNotificationStateMachineState
+ (id)stateFromDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3;
- (id)computeNewStateFromAnalysis:(id)a3 currentDate:(id)a4 fertileWindowNotificationTimeOfDay:(id)a5 fertilityNotificationsEnabled:(BOOL)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7;
- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7;
- (id)computeNewStateFromFertilityNotificationsEnabled:(BOOL)a3 isOvulationConfirmed:(BOOL)a4 correlatingPeriodStartDayIndex:(int64_t)a5 fertileWindowEndDayIndex:(int64_t)a6 fireDayIndex:(int64_t)a7 daysShiftedForFertileWindow:(int64_t)a8 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a9;
- (id)dictionaryRepresentation;
- (id)firedDayIndex;
- (id)hk_redactedDescription;
- (id)scheduledNotificationDaysShiftedForFertileWindow;
- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed;
- (id)scheduledNotificationFertileWindowEndDayIndex;
- (id)scheduledNotificationFireDayIndex;
- (int64_t)stateType;
@end

@implementation HDMCOvulationConfirmationNotificationStateMachineState

- (id)scheduledNotificationFireDayIndex
{
  return 0;
}

- (id)firedDayIndex
{
  return 0;
}

- (id)scheduledNotificationFertileWindowEndDayIndex
{
  return 0;
}

- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed
{
  return 0;
}

- (id)scheduledNotificationDaysShiftedForFertileWindow
{
  return 0;
}

+ (id)stateFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"StateType"];
  uint64_t v5 = [v4 integerValue];

  switch(v5)
  {
    case 0:
      v6 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
      goto LABEL_7;
    case 1:
      v7 = HDMCOvulationConfirmationNotificationWaitingState;
      goto LABEL_6;
    case 2:
      v7 = HDMCOvulationConfirmationNotificationScheduledState;
      goto LABEL_6;
    case 3:
      v7 = HDMCOvulationConfirmationNotificationFiredState;
LABEL_6:
      v6 = [(__objc2_class *)v7 notificationStateFromDictionaryRepresentation:v3];
LABEL_7:
      v8 = v6;
      if (!v6) {
        goto LABEL_8;
      }
      goto LABEL_9;
    default:
LABEL_8:
      v8 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
LABEL_9:

      return v8;
  }
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationStateMachineState stateType](self, "stateType"));
  [v3 setObject:v4 forKeyedSubscript:@"StateType"];

  uint64_t v5 = (void *)[v3 copy];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDMCOvulationConfirmationNotificationStateMachineState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(HDMCOvulationConfirmationNotificationStateMachineState *)self stateType];
      uint64_t v7 = [(HDMCOvulationConfirmationNotificationStateMachineState *)v5 stateType];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)computeNewStateFromAnalysis:(id)a3 currentDate:(id)a4 fertileWindowNotificationTimeOfDay:(id)a5 fertilityNotificationsEnabled:(BOOL)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  BOOL v34 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [v12 fertileWindowProjections];
  v14 = [v13 firstObject];
  BOOL v15 = [v14 predictionPrimarySource] == 3;

  v16 = [v12 fertileWindowProjections];
  v17 = [v16 firstObject];
  uint64_t v18 = [v17 allDays];
  if (v19 <= 0) {
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v20 = v19 + v18 - 1;
  }

  v21 = [v12 cycles];
  v22 = [v21 firstObject];
  v23 = [v22 menstruationSegment];
  uint64_t v24 = [v23 days];

  v25 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v26 = objc_msgSend(v25, "hkmc_nextDateAfterDate:matchingHourComponents:", v11, v10);

  uint64_t v27 = objc_msgSend(v26, "hk_dayIndexWithCalendar:", v25);
  v28 = [v12 fertileWindowProjections];

  v29 = [v28 firstObject];
  uint64_t v30 = [v29 daysOffsetFromCalendarMethod];

  v31 = [(HDMCOvulationConfirmationNotificationStateMachineState *)self computeNewStateFromFertilityNotificationsEnabled:v34 isOvulationConfirmed:v15 correlatingPeriodStartDayIndex:v24 fertileWindowEndDayIndex:v20 fireDayIndex:v27 daysShiftedForFertileWindow:v30 daysWithWristTemp45DaysBeforeOvulationConfirmed:a7];

  return v31;
}

- (id)computeNewStateFromFertilityNotificationsEnabled:(BOOL)a3 isOvulationConfirmed:(BOOL)a4 correlatingPeriodStartDayIndex:(int64_t)a5 fertileWindowEndDayIndex:(int64_t)a6 fireDayIndex:(int64_t)a7 daysShiftedForFertileWindow:(int64_t)a8 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a9
{
  if (!a3)
  {
    id v10 = objc_alloc_init(HDMCOvulationConfirmationNotificationFeatureOffState);
    goto LABEL_5;
  }
  if (a4)
  {
    id v10 = [(HDMCOvulationConfirmationNotificationStateMachineState *)self computeNewStateFromCorrelatingPeriodStartDayIndex:a5 fertileWindowEndDayIndex:a6 fireDayIndex:a7 daysShiftedForFertileWindow:a8 daysWithWristTemp45DaysBeforeOvulationConfirmed:a9];
LABEL_5:
    id v11 = (HDMCOvulationConfirmationNotificationWaitingState *)v10;
    goto LABEL_7;
  }
  id v12 = [HDMCOvulationConfirmationNotificationWaitingState alloc];
  v13 = [(HDMCOvulationConfirmationNotificationStateMachineState *)self firedDayIndex];
  id v11 = [(HDMCOvulationConfirmationNotificationWaitingState *)v12 initWithFiredDayIndex:v13];

LABEL_7:
  return v11;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  uint64_t v7 = [[HDMCOvulationConfirmationNotificationScheduledState alloc] initWithFertileWindowEndDayIndex:a4 fireDayIndex:a5 correlatingPeriodStartDayIndex:a3 daysWithWristTemp45DaysBeforeOvulationConfirmed:a7 daysShiftedForFertileWindow:a6];
  return v7;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  return 0;
}

- (id)hk_redactedDescription
{
  return (id)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (int64_t)stateType
{
  return 0;
}

@end