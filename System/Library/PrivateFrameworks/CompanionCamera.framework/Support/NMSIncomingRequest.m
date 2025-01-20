@interface NMSIncomingRequest
- (BOOL)expectsResponse;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingResponse)response;
- (NSData)data;
- (NSString)idsIdentifier;
- (id)pbRequest;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)configureResponse;
- (void)dealloc;
- (void)setData:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setResponse:(id)a3;
@end

@implementation NMSIncomingRequest

- (void)dealloc
{
  if (self->_expectsResponse && ![(NMSOutgoingResponse *)self->_response isSent]) {
    +[NSException raise:@"NMSMisuseException" format:@"Must not forget about an NMSIncomingRequest without first responding to it."];
  }
  v3.receiver = self;
  v3.super_class = (Class)NMSIncomingRequest;
  [(NMSIncomingRequest *)&v3 dealloc];
}

- (void)configureResponse
{
  objc_super v3 = objc_alloc_init(NMSOutgoingResponse);
  [(NMSOutgoingResponse *)v3 setPriority:self->_priority];
  [(NMSOutgoingResponse *)v3 setRequest:self];
  response = self->_response;
  self->_response = v3;
}

- (id)pbRequest
{
  id pbRequest = self->_pbRequest;
  if (!pbRequest)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    v5 = [WeakRetained _pbMappingForMessageID:self->_messageID];

    if (!v5) {
      +[NSException raise:@"NMSMisuseException", @"Can't access -pbRequest without a mapping for messageID: %hu", self->_messageID format];
    }
    id v6 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "requestClass")), "initWithData:", self->_data);
    id v7 = self->_pbRequest;
    self->_id pbRequest = v6;

    id pbRequest = self->_pbRequest;
  }
  return pbRequest;
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
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

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NMSOutgoingResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (void)setPbRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
}

@end