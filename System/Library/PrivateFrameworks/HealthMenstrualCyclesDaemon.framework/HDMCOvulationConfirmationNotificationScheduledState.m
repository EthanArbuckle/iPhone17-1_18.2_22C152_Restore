@interface HDMCOvulationConfirmationNotificationScheduledState
+ (id)notificationStateFromDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDMCOvulationConfirmationNotificationScheduledState)initWithFertileWindowEndDayIndex:(int64_t)a3 fireDayIndex:(int64_t)a4 correlatingPeriodStartDayIndex:(int64_t)a5 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a6 daysShiftedForFertileWindow:(int64_t)a7;
- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3;
- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7;
- (id)description;
- (id)dictionaryRepresentation;
- (id)scheduledNotificationDaysShiftedForFertileWindow;
- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed;
- (id)scheduledNotificationFertileWindowEndDayIndex;
- (id)scheduledNotificationFireDayIndex;
- (int64_t)correlatingPeriodStartDayIndex;
- (int64_t)daysShiftedForFertileWindow;
- (int64_t)daysWithWristTemp45DaysBeforeOvulationConfirmed;
- (int64_t)fertileWindowEndDayIndex;
- (int64_t)fireDayIndex;
- (int64_t)stateType;
@end

@implementation HDMCOvulationConfirmationNotificationScheduledState

- (id)scheduledNotificationFireDayIndex
{
  v2 = NSNumber;
  int64_t v3 = [(HDMCOvulationConfirmationNotificationScheduledState *)self fireDayIndex];
  return (id)[v2 numberWithInteger:v3];
}

- (id)scheduledNotificationFertileWindowEndDayIndex
{
  v2 = NSNumber;
  int64_t v3 = [(HDMCOvulationConfirmationNotificationScheduledState *)self fertileWindowEndDayIndex];
  return (id)[v2 numberWithInteger:v3];
}

- (id)scheduledNotificationDaysWithWristTemp45DaysBeforeOvulationConfirmed
{
  v2 = NSNumber;
  int64_t v3 = [(HDMCOvulationConfirmationNotificationScheduledState *)self daysWithWristTemp45DaysBeforeOvulationConfirmed];
  return (id)[v2 numberWithInteger:v3];
}

- (id)scheduledNotificationDaysShiftedForFertileWindow
{
  v2 = NSNumber;
  int64_t v3 = [(HDMCOvulationConfirmationNotificationScheduledState *)self daysShiftedForFertileWindow];
  return (id)[v2 numberWithInteger:v3];
}

- (HDMCOvulationConfirmationNotificationScheduledState)initWithFertileWindowEndDayIndex:(int64_t)a3 fireDayIndex:(int64_t)a4 correlatingPeriodStartDayIndex:(int64_t)a5 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a6 daysShiftedForFertileWindow:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  result = [(HDMCOvulationConfirmationNotificationScheduledState *)&v13 init];
  if (result)
  {
    result->_fertileWindowEndDayIndex = a3;
    result->_fireDayIndex = a4;
    result->_correlatingPeriodStartDayIndex = a5;
    result->_daysWithWristTemp45DaysBeforeOvulationConfirmed = a6;
    result->_daysShiftedForFertileWindow = a7;
  }
  return result;
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"FertileWindowEndDayIndex"];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = (void *)v5;
  uint64_t v7 = [v4 objectForKeyedSubscript:@"FireDayIndex"];
  if (!v7) {
    goto LABEL_9;
  }
  v8 = (void *)v7;
  uint64_t v9 = [v4 objectForKeyedSubscript:@"CorrelatingPeriodStartDayIndex"];
  if (!v9)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  v10 = (void *)v9;
  uint64_t v11 = [v4 objectForKeyedSubscript:@"DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"];
  if (!v11)
  {

    goto LABEL_8;
  }
  v12 = (void *)v11;
  objc_super v13 = [v4 objectForKeyedSubscript:@"DaysShiftedForFertileWindow"];

  if (v13)
  {
    id v26 = objc_alloc((Class)a1);
    v14 = [v4 objectForKeyedSubscript:@"FertileWindowEndDayIndex"];
    uint64_t v15 = [v14 integerValue];
    v16 = [v4 objectForKeyedSubscript:@"FireDayIndex"];
    uint64_t v17 = [v16 integerValue];
    v18 = [v4 objectForKeyedSubscript:@"CorrelatingPeriodStartDayIndex"];
    uint64_t v19 = [v18 integerValue];
    v20 = [v4 objectForKeyedSubscript:@"DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"];
    uint64_t v21 = [v20 integerValue];
    v22 = [v4 objectForKeyedSubscript:@"DaysShiftedForFertileWindow"];
    v23 = objc_msgSend(v26, "initWithFertileWindowEndDayIndex:fireDayIndex:correlatingPeriodStartDayIndex:daysWithWristTemp45DaysBeforeOvulationConfirmed:daysShiftedForFertileWindow:", v15, v17, v19, v21, objc_msgSend(v22, "integerValue"));

    goto LABEL_13;
  }
LABEL_10:
  _HKInitializeLogging();
  v24 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    +[HDMCOvulationConfirmationNotificationScheduledState notificationStateFromDictionaryRepresentation:](v24);
  }
  v23 = 0;
LABEL_13:

  return v23;
}

- (int64_t)stateType
{
  return 2;
}

- (id)computeFiredStateWithCurrentDayIndex:(int64_t)a3
{
  int64_t v3 = [[HDMCOvulationConfirmationNotificationFiredState alloc] initWithFireDayIndex:a3];
  return v3;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  if ([(HDMCOvulationConfirmationNotificationScheduledState *)self fireDayIndex] <= a3
    || [(HDMCOvulationConfirmationNotificationScheduledState *)self fertileWindowEndDayIndex] == a4)
  {
    v15.receiver = self;
    v15.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
    objc_super v13 = [(HDMCOvulationConfirmationNotificationStateMachineState *)&v15 computeNewStateFromCorrelatingPeriodStartDayIndex:a3 fertileWindowEndDayIndex:a4 fireDayIndex:a5 daysShiftedForFertileWindow:a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:a7];
  }
  else
  {
    objc_super v13 = [(HDMCOvulationConfirmationNotificationScheduledState *)self initWithFertileWindowEndDayIndex:a4 fireDayIndex:a5 correlatingPeriodStartDayIndex:a3 daysWithWristTemp45DaysBeforeOvulationConfirmed:a7 daysShiftedForFertileWindow:a6];
  }
  return v13;
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  int64_t v3 = [(HDMCOvulationConfirmationNotificationStateMachineState *)&v11 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex"));
  [v4 setObject:v5 forKeyedSubscript:@"FertileWindowEndDayIndex"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState fireDayIndex](self, "fireDayIndex"));
  [v4 setObject:v6 forKeyedSubscript:@"FireDayIndex"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState correlatingPeriodStartDayIndex](self, "correlatingPeriodStartDayIndex"));
  [v4 setObject:v7 forKeyedSubscript:@"CorrelatingPeriodStartDayIndex"];

  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysWithWristTemp45DaysBeforeOvulationConfirmed](self, "daysWithWristTemp45DaysBeforeOvulationConfirmed"));
  [v4 setObject:v8 forKeyedSubscript:@"DaysWithWristTemp45DaysBeforeOvulationConfirmedKey"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationScheduledState daysShiftedForFertileWindow](self, "daysShiftedForFertileWindow"));
  [v4 setObject:v9 forKeyedSubscript:@"DaysShiftedForFertileWindow"];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMCOvulationConfirmationNotificationScheduledState;
  if ([(HDMCOvulationConfirmationNotificationStateMachineState *)&v8 isEqual:v4])
  {
    uint64_t v5 = v4;
    BOOL v6 = self->_fertileWindowEndDayIndex == v5[1]
      && self->_fireDayIndex == v5[2]
      && self->_correlatingPeriodStartDayIndex == v5[3]
      && self->_daysWithWristTemp45DaysBeforeOvulationConfirmed == v5[4]
      && self->_daysShiftedForFertileWindow == v5[5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [NSNumber numberWithInteger:self->_fertileWindowEndDayIndex];
  BOOL v6 = [NSNumber numberWithInteger:self->_fireDayIndex];
  uint64_t v7 = [NSNumber numberWithInteger:self->_correlatingPeriodStartDayIndex];
  objc_super v8 = [NSNumber numberWithInteger:self->_daysWithWristTemp45DaysBeforeOvulationConfirmed];
  uint64_t v9 = [NSNumber numberWithInteger:self->_daysShiftedForFertileWindow];
  v10 = [v3 stringWithFormat:@"<%@:%p fertileWindowEndDayIndex: %@ fireDayIndex:%@ correlatingPeriodStartDayIndex: %@ daysWithWristTemp45DaysBeforeOvulationConfirmed:%@ daysShiftedForFertileWindow:%@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (int64_t)fertileWindowEndDayIndex
{
  return self->_fertileWindowEndDayIndex;
}

- (int64_t)fireDayIndex
{
  return self->_fireDayIndex;
}

- (int64_t)correlatingPeriodStartDayIndex
{
  return self->_correlatingPeriodStartDayIndex;
}

- (int64_t)daysWithWristTemp45DaysBeforeOvulationConfirmed
{
  return self->_daysWithWristTemp45DaysBeforeOvulationConfirmed;
}

- (int64_t)daysShiftedForFertileWindow
{
  return self->_daysShiftedForFertileWindow;
}

+ (void)notificationStateFromDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  int64_t v3 = HKSensitiveLogItem();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1(&dword_225722000, v4, v5, "[%{public}@] Cannot retrieve full state from dictionary: %@", v6, v7, v8, v9, v10);
}

@end