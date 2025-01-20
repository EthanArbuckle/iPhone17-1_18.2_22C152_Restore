@interface CATIDSServiceConnectionConfiguration
- (CATIDSServiceConnectionConfiguration)init;
- (double)invitationAcknowledgeTimeout;
- (double)keepAliveCheckinInterval;
- (double)messageQueueFlushPromptInterval;
- (double)missingItemsCheckinInterval;
- (int64_t)maxDataSendSize;
- (unint64_t)keepAliveAttemptCount;
- (void)setInvitationAcknowledgeTimeout:(double)a3;
- (void)setKeepAliveAttemptCount:(unint64_t)a3;
- (void)setKeepAliveCheckinInterval:(double)a3;
- (void)setMaxDataSendSize:(int64_t)a3;
- (void)setMessageQueueFlushPromptInterval:(double)a3;
- (void)setMissingItemsCheckinInterval:(double)a3;
@end

@implementation CATIDSServiceConnectionConfiguration

- (CATIDSServiceConnectionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CATIDSServiceConnectionConfiguration;
  result = [(CATIDSServiceConnectionConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_maxDataSendSize = xmmword_213BDC4E0;
    *(_OWORD *)&result->_keepAliveCheckinInterval = xmmword_213BDC4F0;
    *(_OWORD *)&result->_missingItemsCheckinInterval = xmmword_213BDC500;
  }
  return result;
}

- (int64_t)maxDataSendSize
{
  return self->_maxDataSendSize;
}

- (void)setMaxDataSendSize:(int64_t)a3
{
  self->_maxDataSendSize = a3;
}

- (unint64_t)keepAliveAttemptCount
{
  return self->_keepAliveAttemptCount;
}

- (void)setKeepAliveAttemptCount:(unint64_t)a3
{
  self->_keepAliveAttemptCount = a3;
}

- (double)keepAliveCheckinInterval
{
  return self->_keepAliveCheckinInterval;
}

- (void)setKeepAliveCheckinInterval:(double)a3
{
  self->_keepAliveCheckinInterval = a3;
}

- (double)invitationAcknowledgeTimeout
{
  return self->_invitationAcknowledgeTimeout;
}

- (void)setInvitationAcknowledgeTimeout:(double)a3
{
  self->_invitationAcknowledgeTimeout = a3;
}

- (double)missingItemsCheckinInterval
{
  return self->_missingItemsCheckinInterval;
}

- (void)setMissingItemsCheckinInterval:(double)a3
{
  self->_missingItemsCheckinInterval = a3;
}

- (double)messageQueueFlushPromptInterval
{
  return self->_messageQueueFlushPromptInterval;
}

- (void)setMessageQueueFlushPromptInterval:(double)a3
{
  self->_messageQueueFlushPromptInterval = a3;
}

@end