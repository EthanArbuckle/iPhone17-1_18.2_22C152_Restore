@interface MADActivitySchedulingRecord
- (NSDate)startTime;
- (NSString)sessionLog;
- (double)duration;
- (id)description;
- (int)exitStatus;
- (unint64_t)activityID;
- (void)setActivityID:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setExitStatus:(int)a3;
- (void)setSessionLog:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation MADActivitySchedulingRecord

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  v6 = VCPTaskIDDescription([(MADActivitySchedulingRecord *)self activityID]);
  [v3 appendFormat:@"activityID: %@, ", v6];

  v7 = [(MADActivitySchedulingRecord *)self startTime];
  [v3 appendFormat:@"startTime: %@, ", v7];

  [(MADActivitySchedulingRecord *)self duration];
  [v3 appendFormat:@"duration: %f(sec), ", v8];
  objc_msgSend(v3, "appendFormat:", @"exitStatus: %d>", -[MADActivitySchedulingRecord exitStatus](self, "exitStatus"));
  return v3;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (void)setActivityID:(unint64_t)a3
{
  self->_activityID = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  self->_startTime = (NSDate *)a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int)exitStatus
{
  return self->_exitStatus;
}

- (void)setExitStatus:(int)a3
{
  self->_exitStatus = a3;
}

- (NSString)sessionLog
{
  return self->_sessionLog;
}

- (void)setSessionLog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end