@interface HMDAnalyticsEventTriggerExecutionSessionData
- (NSArray)endEvents;
- (NSArray)triggerEvents;
- (NSString)sessionID;
- (int)executionState;
- (int)resultErrorCode;
- (unint64_t)timestamp;
- (void)setEndEvents:(id)a3;
- (void)setExecutionState:(int)a3;
- (void)setResultErrorCode:(int)a3;
- (void)setSessionID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerEvents:(id)a3;
@end

@implementation HMDAnalyticsEventTriggerExecutionSessionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endEvents, 0);
  objc_storeStrong((id *)&self->_triggerEvents, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (void)setEndEvents:(id)a3
{
}

- (NSArray)endEvents
{
  return self->_endEvents;
}

- (void)setTriggerEvents:(id)a3
{
}

- (NSArray)triggerEvents
{
  return self->_triggerEvents;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setResultErrorCode:(int)a3
{
  self->_resultErrorCode = a3;
}

- (int)resultErrorCode
{
  return self->_resultErrorCode;
}

- (void)setExecutionState:(int)a3
{
  self->_executionState = a3;
}

- (int)executionState
{
  return self->_executionState;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end