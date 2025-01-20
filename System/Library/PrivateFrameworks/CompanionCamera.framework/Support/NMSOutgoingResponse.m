@interface NMSOutgoingResponse
- (BOOL)doNotCompress;
- (BOOL)fireAndForget;
- (BOOL)isSent;
- (NMSIncomingRequest)request;
- (NMSOutgoingResponse)init;
- (NSData)data;
- (NSString)idsIdentifier;
- (double)sendTimeout;
- (id)didSendHandler;
- (id)errorHandler;
- (id)pbResponse;
- (unint64_t)priority;
- (void)send;
- (void)setData:(id)a3;
- (void)setDidSendHandler:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setPbResponse:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setSendTimeout:(double)a3;
- (void)setSent:(BOOL)a3;
@end

@implementation NMSOutgoingResponse

- (NMSOutgoingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSOutgoingResponse;
  v2 = [(NMSOutgoingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void)send
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  id v4 = [WeakRetained messageCenter];

  [v4 _sendResponse:self];
}

- (void)setPbResponse:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  v5 = [WeakRetained messageCenter];
  objc_super v6 = objc_msgSend(v5, "_pbMappingForMessageID:", objc_msgSend(WeakRetained, "messageID"));
  [v6 responseClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = NSStringFromClass((Class)[v6 responseClass]);
    +[NSException raise:@"NMSMisuseException", @"pbResponse needs to be of type %@", v7 format];
  }
  id pbResponse = self->_pbResponse;
  self->_id pbResponse = v4;
  id v9 = v4;

  v10 = [self->_pbResponse data];
  data = self->_data;
  self->_data = v10;
}

- (NMSIncomingRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (NMSIncomingRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)didSendHandler
{
  return self->_didSendHandler;
}

- (void)setDidSendHandler:(id)a3
{
}

- (BOOL)doNotCompress
{
  return self->_doNotCompress;
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (BOOL)isSent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (id)pbResponse
{
  return self->_pbResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbResponse, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong(&self->_didSendHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end