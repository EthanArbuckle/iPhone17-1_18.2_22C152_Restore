@interface CALNTriggeredEventNotificationTriggerData
- (BOOL)isOffsetFromTravelTimeStart;
- (CALNTriggeredEventNotificationTriggerData)initWithTrigger:(unint64_t)a3 alarmID:(id)a4 isOffsetFromTravelTimeStart:(BOOL)a5 hypothesis:(id)a6;
- (EKTravelEngineHypothesis)hypothesis;
- (NSString)alarmID;
- (id)description;
- (unint64_t)trigger;
@end

@implementation CALNTriggeredEventNotificationTriggerData

- (CALNTriggeredEventNotificationTriggerData)initWithTrigger:(unint64_t)a3 alarmID:(id)a4 isOffsetFromTravelTimeStart:(BOOL)a5 hypothesis:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CALNTriggeredEventNotificationTriggerData;
  v12 = [(CALNTriggeredEventNotificationTriggerData *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_trigger = a3;
    uint64_t v14 = [v10 copy];
    alarmID = v13->_alarmID;
    v13->_alarmID = (NSString *)v14;

    v13->_isOffsetFromTravelTimeStart = a5;
    objc_storeStrong((id *)&v13->_hypothesis, a6);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CALNTriggeredEventNotificationTriggerData trigger](self, "trigger"));
  v6 = [(CALNTriggeredEventNotificationTriggerData *)self alarmID];
  if ([(CALNTriggeredEventNotificationTriggerData *)self isOffsetFromTravelTimeStart]) {
    v7 = @"Yes";
  }
  else {
    v7 = @"No";
  }
  v8 = [(CALNTriggeredEventNotificationTriggerData *)self hypothesis];
  v9 = [v3 stringWithFormat:@"<%@: %p>(trigger = %@, alarmID = %@, isOffsetFromTravelTimeStart = %@, hypothesis = %@)", v4, self, v5, v6, v7, v8];

  return v9;
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end