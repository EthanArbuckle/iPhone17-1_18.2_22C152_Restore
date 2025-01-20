@interface CALNMutableTriggeredEventNotificationData
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlarmID:(id)a3;
- (void)setHasDisplayedLeaveByMessage:(BOOL)a3;
- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3;
- (void)setHasDisplayedRunningLateMessage:(BOOL)a3;
- (void)setHypothesis:(id)a3;
- (void)setIsOffsetFromTravelTimeStart:(BOOL)a3;
- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3;
- (void)setLastTimeNotificationAdded:(id)a3;
@end

@implementation CALNMutableTriggeredEventNotificationData

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CALNTriggeredEventNotificationData alloc];
  v5 = [(CALNTriggeredEventNotificationData *)self alarmID];
  BOOL v6 = [(CALNTriggeredEventNotificationData *)self isOffsetFromTravelTimeStart];
  v7 = [(CALNTriggeredEventNotificationData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  v8 = [(CALNTriggeredEventNotificationData *)self hypothesis];
  BOOL v9 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveByMessage];
  BOOL v10 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveNowMessage];
  BOOL v11 = [(CALNTriggeredEventNotificationData *)self hasDisplayedRunningLateMessage];
  v12 = [(CALNTriggeredEventNotificationData *)self lastTimeNotificationAdded];
  LOBYTE(v15) = v11;
  id v13 = [(CALNTriggeredEventNotificationData *)v4 _initWithAlarmID:v5 isOffsetFromTravelTimeStart:v6 lastFireTimeOfAlertOffsetFromTravelTime:v7 hypothesis:v8 hasDisplayedLeaveByMessage:v9 hasDisplayedLeaveNowMessage:v10 hasDisplayedRunningLateMessage:v15 lastTimeNotificationAdded:v12];

  return v13;
}

- (void)setAlarmID:(id)a3
{
  self->super._alarmID = (NSString *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setIsOffsetFromTravelTimeStart:(BOOL)a3
{
  self->super._isOffsetFromTravelTimeStart = a3;
}

- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3
{
  self->super._lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (void)setHypothesis:(id)a3
{
}

- (void)setHasDisplayedLeaveByMessage:(BOOL)a3
{
  self->super._hasDisplayedLeaveByMessage = a3;
}

- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3
{
  self->super._hasDisplayedLeaveNowMessage = a3;
}

- (void)setHasDisplayedRunningLateMessage:(BOOL)a3
{
  self->super._hasDisplayedRunningLateMessage = a3;
}

- (void)setLastTimeNotificationAdded:(id)a3
{
  self->super._lastTimeNotificationAdded = (NSDate *)[a3 copy];
  MEMORY[0x270F9A758]();
}

@end