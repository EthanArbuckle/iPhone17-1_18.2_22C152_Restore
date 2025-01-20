@interface _CATXPCTransportSendMessageOperation
- (BOOL)isAsynchronous;
- (CATMessage)message;
- (CATXPCTransport)transport;
- (void)didFailWithError:(id)a3;
- (void)didProcessMessage;
- (void)main;
- (void)setMessage:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation _CATXPCTransportSendMessageOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  id v5 = [(_CATXPCTransportSendMessageOperation *)self transport];
  if (v5 && ![(CATOperation *)self isCanceled])
  {
    v4 = [(_CATXPCTransportSendMessageOperation *)self message];
    [v5 transportSendMessageOperation:self processMessage:v4];
  }
  else
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    [(CATOperation *)self endOperationWithError:v4];
  }
}

- (void)didProcessMessage
{
  if ([(CATOperation *)self isExecuting])
  {
    [(CATOperation *)self endOperationWithResultObject:0];
  }
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  if ([(CATOperation *)self isExecuting]) {
    [(CATOperation *)self endOperationWithError:v4];
  }
}

- (CATXPCTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);

  return (CATXPCTransport *)WeakRetained;
}

- (void)setTransport:(id)a3
{
}

- (CATMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak((id *)&self->_transport);
}

@end