@interface HDMCOvulationConfirmationNotificationFiredState
+ (id)notificationStateFromDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HDMCOvulationConfirmationNotificationFiredState)initWithFireDayIndex:(int64_t)a3;
- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7;
- (id)description;
- (id)dictionaryRepresentation;
- (id)firedDayIndex;
- (int64_t)fireDayIndex;
- (int64_t)stateType;
@end

@implementation HDMCOvulationConfirmationNotificationFiredState

- (HDMCOvulationConfirmationNotificationFiredState)initWithFireDayIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  result = [(HDMCOvulationConfirmationNotificationFiredState *)&v5 init];
  if (result) {
    result->_fireDayIndex = a3;
  }
  return result;
}

- (id)firedDayIndex
{
  return (id)[NSNumber numberWithInteger:self->_fireDayIndex];
}

+ (id)notificationStateFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"FireDayIndex"];

  if (v5)
  {
    id v6 = objc_alloc((Class)a1);
    v7 = [v4 objectForKeyedSubscript:@"FireDayIndex"];
    v8 = objc_msgSend(v6, "initWithFireDayIndex:", objc_msgSend(v7, "integerValue"));
  }
  else
  {
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCOvulationConfirmationNotificationScheduledState notificationStateFromDictionaryRepresentation:](v9);
    }
    v8 = 0;
  }

  return v8;
}

- (int64_t)stateType
{
  return 3;
}

- (id)computeNewStateFromCorrelatingPeriodStartDayIndex:(int64_t)a3 fertileWindowEndDayIndex:(int64_t)a4 fireDayIndex:(int64_t)a5 daysShiftedForFertileWindow:(int64_t)a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:(int64_t)a7
{
  if ([(HDMCOvulationConfirmationNotificationFiredState *)self fireDayIndex] <= a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
    v13 = [(HDMCOvulationConfirmationNotificationStateMachineState *)&v15 computeNewStateFromCorrelatingPeriodStartDayIndex:a3 fertileWindowEndDayIndex:a4 fireDayIndex:a5 daysShiftedForFertileWindow:a6 daysWithWristTemp45DaysBeforeOvulationConfirmed:a7];
  }
  else
  {
    v13 = self;
  }
  return v13;
}

- (id)dictionaryRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  v3 = [(HDMCOvulationConfirmationNotificationStateMachineState *)&v8 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDMCOvulationConfirmationNotificationFiredState fireDayIndex](self, "fireDayIndex"));
  [v4 setObject:v5 forKeyedSubscript:@"FireDayIndex"];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDMCOvulationConfirmationNotificationFiredState;
  if ([(HDMCOvulationConfirmationNotificationStateMachineState *)&v7 isEqual:v4]) {
    BOOL v5 = self->_fireDayIndex == v4[1];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [NSNumber numberWithInteger:self->_fireDayIndex];
  id v6 = [v3 stringWithFormat:@"<%@:%p fireDayIndex:%@>", v4, self, v5];

  return v6;
}

- (int64_t)fireDayIndex
{
  return self->_fireDayIndex;
}

@end