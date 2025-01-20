@interface _CATRemoteTransportSendMessageOperation
- (BOOL)isAsynchronous;
- (CATMessage)message;
- (CATRemoteTransport)transport;
- (void)didEncodeData:(id)a3;
- (void)didSendData;
- (void)main;
- (void)setMessage:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation _CATRemoteTransportSendMessageOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v14[1] = *MEMORY[0x263EF8340];
  v3 = CATGetCatalystQueue();
  CATAssertIsQueue(v3);

  v4 = [(_CATRemoteTransportSendMessageOperation *)self transport];
  if (v4 && ![(CATOperation *)self isCanceled])
  {
    v6 = (void *)MEMORY[0x263F08910];
    v7 = [(_CATRemoteTransportSendMessageOperation *)self message];
    v12[0] = 0;
    v8 = objc_msgSend(v6, "cat_archivedDataWithRootObject:error:", v7, v12);
    id v9 = v12[0];

    if (v8)
    {
      [(_CATRemoteTransportSendMessageOperation *)self didEncodeData:v8];
    }
    else
    {
      uint64_t v13 = *MEMORY[0x263F08608];
      v14[0] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
      v11 = CATErrorWithCodeAndUserInfo(301, v10);
      [(CATOperation *)self endOperationWithError:v11];
    }
  }
  else
  {
    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    [(CATOperation *)self endOperationWithError:v5];
  }
}

- (void)didEncodeData:(id)a3
{
  id v7 = a3;
  v4 = CATGetCatalystQueue();
  CATAssertIsQueue(v4);

  v5 = [(_CATRemoteTransportSendMessageOperation *)self transport];
  if (v5 && ![(CATOperation *)self isCanceled])
  {
    [v5 remoteTransportSendMessageOperation:self sendData:v7];
  }
  else
  {
    v6 = CATErrorWithCodeAndUserInfo(404, 0);
    [(CATOperation *)self endOperationWithError:v6];
  }
}

- (void)didSendData
{
}

- (CATRemoteTransport)transport
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transport);

  return (CATRemoteTransport *)WeakRetained;
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