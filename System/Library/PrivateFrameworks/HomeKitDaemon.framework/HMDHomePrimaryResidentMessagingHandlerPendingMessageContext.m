@interface HMDHomePrimaryResidentMessagingHandlerPendingMessageContext
- (BOOL)isMessageInFlight;
- (HMDHomePrimaryResidentMessagingHandlerPendingMessageContext)initWithMessage:(id)a3 messageTimerContext:(id)a4;
- (HMFMessage)message;
- (HMFTimerManagerTimerContext)messageTimerContext;
- (HMFTimerManagerTimerContext)queueTimerContext;
- (NSUUID)lastPrimaryResidentDestinationUUID;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setLastPrimaryResidentDestinationUUID:(id)a3;
- (void)setMessageInFlight:(BOOL)a3;
- (void)setQueueTimerContext:(id)a3;
@end

@implementation HMDHomePrimaryResidentMessagingHandlerPendingMessageContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_lastPrimaryResidentDestinationUUID, 0);
  objc_storeStrong((id *)&self->_queueTimerContext, 0);
  objc_storeStrong((id *)&self->_messageTimerContext, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setMessageInFlight:(BOOL)a3
{
  self->_messageInFlight = a3;
}

- (BOOL)isMessageInFlight
{
  return self->_messageInFlight;
}

- (void)setLastPrimaryResidentDestinationUUID:(id)a3
{
}

- (NSUUID)lastPrimaryResidentDestinationUUID
{
  return self->_lastPrimaryResidentDestinationUUID;
}

- (void)setQueueTimerContext:(id)a3
{
}

- (HMFTimerManagerTimerContext)queueTimerContext
{
  return self->_queueTimerContext;
}

- (HMFTimerManagerTimerContext)messageTimerContext
{
  return self->_messageTimerContext;
}

- (HMFMessage)message
{
  return self->_message;
}

- (HMDHomePrimaryResidentMessagingHandlerPendingMessageContext)initWithMessage:(id)a3 messageTimerContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomePrimaryResidentMessagingHandlerPendingMessageContext;
  v9 = [(HMDHomePrimaryResidentMessagingHandlerPendingMessageContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_message, a3);
    objc_storeStrong((id *)&v10->_messageTimerContext, a4);
  }

  return v10;
}

@end