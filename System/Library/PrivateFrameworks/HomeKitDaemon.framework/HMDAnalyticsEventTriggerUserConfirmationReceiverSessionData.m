@interface HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData
- (NSString)sessionID;
- (int)resultErrorCode;
- (unint64_t)timestamp;
- (unint64_t)userResponseDelay;
- (void)setResultErrorCode:(int)a3;
- (void)setSessionID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserResponseDelay:(unint64_t)a3;
@end

@implementation HMDAnalyticsEventTriggerUserConfirmationReceiverSessionData

- (void).cxx_destruct
{
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

- (void)setUserResponseDelay:(unint64_t)a3
{
  self->_userResponseDelay = a3;
}

- (unint64_t)userResponseDelay
{
  return self->_userResponseDelay;
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