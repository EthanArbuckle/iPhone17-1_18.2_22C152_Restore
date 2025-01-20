@interface COMessageChannelClientInterfaceMediator
- (COMessageChannel)messageChannel;
- (COMessageChannelClientInterfaceMediator)initWithMessageChannel:(id)a3;
- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4;
- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4;
- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7;
- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7;
@end

@implementation COMessageChannelClientInterfaceMediator

- (COMessageChannelClientInterfaceMediator)initWithMessageChannel:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)COMessageChannelClientInterfaceMediator;
  v5 = [(COMessageChannelClientInterfaceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_messageChannel, v4);
  }

  return v6;
}

- (void)receivedRecipientListForRequestID:(unsigned int)a3 recipients:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained receivedRecipientListForRequestID:v4 recipients:v8];
  }
}

- (void)receivedRequestWithPayload:(id)a3 payloadType:(id)a4 requestID:(unsigned int)a5 fromMember:(id)a6 withCallback:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v16 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained receivedRequestWithPayload:v17 payloadType:v12 requestID:v9 fromMember:v13 withCallback:v14];
  }
}

- (void)receivedResponseForRequestID:(unsigned int)a3 responsePayload:(id)a4 responseType:(id)a5 responseError:(id)a6 fromMember:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v17 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v16 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained receivedResponseForRequestID:v10 responsePayload:v17 responseType:v12 responseError:v13 fromMember:v14];
  }
}

- (void)failedToSendRequestWithID:(unsigned int)a3 withError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained failedToSendRequestWithID:v4 withError:v8];
  }
}

- (COMessageChannel)messageChannel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageChannel);

  return (COMessageChannel *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end