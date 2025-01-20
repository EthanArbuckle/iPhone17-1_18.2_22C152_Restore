@interface CALNTriggeredEventNotificationData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDisplayedLeaveByMessage;
- (BOOL)hasDisplayedLeaveNowMessage;
- (BOOL)hasDisplayedRunningLateMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNotificationData:(id)a3;
- (BOOL)isOffsetFromTravelTimeStart;
- (CALNTriggeredEventNotificationData)init;
- (CALNTriggeredEventNotificationData)initWithCoder:(id)a3;
- (EKTravelEngineHypothesis)hypothesis;
- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime;
- (NSDate)lastTimeNotificationAdded;
- (NSString)alarmID;
- (id)_initWithAlarmID:(id)a3 isOffsetFromTravelTimeStart:(BOOL)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5 hypothesis:(id)a6 hasDisplayedLeaveByMessage:(BOOL)a7 hasDisplayedLeaveNowMessage:(BOOL)a8 hasDisplayedRunningLateMessage:(BOOL)a9 lastTimeNotificationAdded:(id)a10;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CALNTriggeredEventNotificationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CALNTriggeredEventNotificationData)init
{
  LOBYTE(v3) = 0;
  return (CALNTriggeredEventNotificationData *)[(CALNTriggeredEventNotificationData *)self _initWithAlarmID:0 isOffsetFromTravelTimeStart:0 lastFireTimeOfAlertOffsetFromTravelTime:0 hypothesis:0 hasDisplayedLeaveByMessage:0 hasDisplayedLeaveNowMessage:0 hasDisplayedRunningLateMessage:v3 lastTimeNotificationAdded:0];
}

- (id)_initWithAlarmID:(id)a3 isOffsetFromTravelTimeStart:(BOOL)a4 lastFireTimeOfAlertOffsetFromTravelTime:(id)a5 hypothesis:(id)a6 hasDisplayedLeaveByMessage:(BOOL)a7 hasDisplayedLeaveNowMessage:(BOOL)a8 hasDisplayedRunningLateMessage:(BOOL)a9 lastTimeNotificationAdded:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CALNTriggeredEventNotificationData;
  v20 = [(CALNTriggeredEventNotificationData *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    alarmID = v20->_alarmID;
    v20->_alarmID = (NSString *)v21;

    v20->_isOffsetFromTravelTimeStart = a4;
    uint64_t v23 = [v17 copy];
    lastFireTimeOfAlertOffsetFromTravelTime = v20->_lastFireTimeOfAlertOffsetFromTravelTime;
    v20->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v23;

    uint64_t v25 = [v18 copy];
    hypothesis = v20->_hypothesis;
    v20->_hypothesis = (EKTravelEngineHypothesis *)v25;

    v20->_hasDisplayedLeaveByMessage = a7;
    v20->_hasDisplayedLeaveNowMessage = a8;
    v20->_hasDisplayedRunningLateMessage = a9;
    uint64_t v27 = [v19 copy];
    lastTimeNotificationAdded = v20->_lastTimeNotificationAdded;
    v20->_lastTimeNotificationAdded = (NSDate *)v27;
  }
  return v20;
}

- (CALNTriggeredEventNotificationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alarmID"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isOffsetFromTravelTimeStart"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFireTimeOfAlertOffsetFromTravelTime"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hypothesis"];
  uint64_t v9 = [v4 decodeBoolForKey:@"hasDisplayedLeaveByMessage"];
  uint64_t v10 = [v4 decodeBoolForKey:@"hasDisplayedLeaveNowMessage"];
  char v11 = [v4 decodeBoolForKey:@"hasDisplayedRunningLateMessage"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastTimeNotificationAdded"];

  LOBYTE(v15) = v11;
  v13 = [(CALNTriggeredEventNotificationData *)self _initWithAlarmID:v5 isOffsetFromTravelTimeStart:v6 lastFireTimeOfAlertOffsetFromTravelTime:v7 hypothesis:v8 hasDisplayedLeaveByMessage:v9 hasDisplayedLeaveNowMessage:v10 hasDisplayedRunningLateMessage:v15 lastTimeNotificationAdded:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CALNTriggeredEventNotificationData *)self alarmID];
  [v4 encodeObject:v5 forKey:@"alarmID"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData isOffsetFromTravelTimeStart](self, "isOffsetFromTravelTimeStart"), @"isOffsetFromTravelTimeStart");
  uint64_t v6 = [(CALNTriggeredEventNotificationData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  [v4 encodeObject:v6 forKey:@"lastFireTimeOfAlertOffsetFromTravelTime"];

  v7 = [(CALNTriggeredEventNotificationData *)self hypothesis];
  [v4 encodeObject:v7 forKey:@"hypothesis"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedLeaveByMessage](self, "hasDisplayedLeaveByMessage"), @"hasDisplayedLeaveByMessage");
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedLeaveNowMessage](self, "hasDisplayedLeaveNowMessage"), @"hasDisplayedLeaveNowMessage");
  objc_msgSend(v4, "encodeBool:forKey:", -[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage"), @"hasDisplayedRunningLateMessage");
  id v8 = [(CALNTriggeredEventNotificationData *)self lastTimeNotificationAdded];
  [v4 encodeObject:v8 forKey:@"lastTimeNotificationAdded"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CALNMutableTriggeredEventNotificationData alloc];
  v5 = [(CALNTriggeredEventNotificationData *)self alarmID];
  BOOL v6 = [(CALNTriggeredEventNotificationData *)self isOffsetFromTravelTimeStart];
  v7 = [(CALNTriggeredEventNotificationData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  id v8 = [(CALNTriggeredEventNotificationData *)self hypothesis];
  BOOL v9 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveByMessage];
  BOOL v10 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveNowMessage];
  BOOL v11 = [(CALNTriggeredEventNotificationData *)self hasDisplayedRunningLateMessage];
  v12 = [(CALNTriggeredEventNotificationData *)self lastTimeNotificationAdded];
  LOBYTE(v15) = v11;
  id v13 = [(CALNTriggeredEventNotificationData *)v4 _initWithAlarmID:v5 isOffsetFromTravelTimeStart:v6 lastFireTimeOfAlertOffsetFromTravelTime:v7 hypothesis:v8 hasDisplayedLeaveByMessage:v9 hasDisplayedLeaveNowMessage:v10 hasDisplayedRunningLateMessage:v15 lastTimeNotificationAdded:v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(CALNTriggeredEventNotificationData *)self isEqualToNotificationData:v4];

  return v5;
}

- (BOOL)isEqualToNotificationData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CALNTriggeredEventNotificationData *)self alarmID];
  BOOL v6 = [v4 alarmID];
  int v7 = CalEqualStrings();

  if (!v7) {
    goto LABEL_8;
  }
  int v8 = [(CALNTriggeredEventNotificationData *)self isOffsetFromTravelTimeStart];
  if (v8 != [v4 isOffsetFromTravelTimeStart]) {
    goto LABEL_8;
  }
  BOOL v9 = [(CALNTriggeredEventNotificationData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  BOOL v10 = [v4 lastFireTimeOfAlertOffsetFromTravelTime];
  int v11 = CalEqualObjects();

  if (!v11) {
    goto LABEL_8;
  }
  v12 = [(CALNTriggeredEventNotificationData *)self hypothesis];
  id v13 = [v4 hypothesis];
  int v14 = CalEqualObjects();

  if (!v14) {
    goto LABEL_8;
  }
  int v15 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveByMessage];
  if (v15 == [v4 hasDisplayedLeaveByMessage]
    && (int v16 = [(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveNowMessage],
        v16 == [v4 hasDisplayedLeaveNowMessage])
    && (int v17 = -[CALNTriggeredEventNotificationData hasDisplayedRunningLateMessage](self, "hasDisplayedRunningLateMessage"), v17 == [v4 hasDisplayedRunningLateMessage]))
  {
    v20 = [(CALNTriggeredEventNotificationData *)self lastTimeNotificationAdded];
    uint64_t v21 = [v4 lastTimeNotificationAdded];
    char v18 = CalEqualObjects();
  }
  else
  {
LABEL_8:
    char v18 = 0;
  }

  return v18;
}

- (id)description
{
  int v14 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(CALNTriggeredEventNotificationData *)self alarmID];
  BOOL v5 = @"YES";
  if ([(CALNTriggeredEventNotificationData *)self isOffsetFromTravelTimeStart]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  int v7 = [(CALNTriggeredEventNotificationData *)self lastFireTimeOfAlertOffsetFromTravelTime];
  int v8 = [(CALNTriggeredEventNotificationData *)self hypothesis];
  if ([(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveByMessage]) {
    BOOL v9 = @"YES";
  }
  else {
    BOOL v9 = @"NO";
  }
  if ([(CALNTriggeredEventNotificationData *)self hasDisplayedLeaveNowMessage]) {
    BOOL v10 = @"YES";
  }
  else {
    BOOL v10 = @"NO";
  }
  if (![(CALNTriggeredEventNotificationData *)self hasDisplayedRunningLateMessage]) {
    BOOL v5 = @"NO";
  }
  int v11 = [(CALNTriggeredEventNotificationData *)self lastTimeNotificationAdded];
  v12 = [v14 stringWithFormat:@"<%@: %p>(alarmID = %@, isOffsetFromTravelTimeStart = %@, lastFireTimeOfAlertOffsetFromTravelTime = %@, hypothesis = %@, hasDisplayedLeaveByMessage = %@, hasDisplayedLeaveNowMessage = %@, hasDisplayedRunningLateMessage = %@, lastTimeNotificationAdded = %@)", v3, self, v4, v6, v7, v8, v9, v10, v5, v11];

  return v12;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (BOOL)hasDisplayedLeaveByMessage
{
  return self->_hasDisplayedLeaveByMessage;
}

- (BOOL)hasDisplayedLeaveNowMessage
{
  return self->_hasDisplayedLeaveNowMessage;
}

- (BOOL)hasDisplayedRunningLateMessage
{
  return self->_hasDisplayedRunningLateMessage;
}

- (NSDate)lastTimeNotificationAdded
{
  return self->_lastTimeNotificationAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimeNotificationAdded, 0);
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

@end