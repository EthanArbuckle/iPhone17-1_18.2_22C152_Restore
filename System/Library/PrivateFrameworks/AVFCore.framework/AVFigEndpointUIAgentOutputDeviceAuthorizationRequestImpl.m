@interface AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl
- (AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl)initWithID:(id)a3 outputDevice:(id)a4 authorizationTokenType:(id)a5;
- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)parentAuthorizationSessionImpl;
- (AVOutputDevice)outputDevice;
- (NSString)ID;
- (NSString)authorizationTokenType;
- (void)cancel;
- (void)dealloc;
- (void)enterTerminalStatus:(int64_t)a3 error:(id)a4;
- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4;
- (void)setParentAuthorizationSessionImpl:(id)a3;
@end

@implementation AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl

- (AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl)initWithID:(id)a3 outputDevice:(id)a4 authorizationTokenType:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl;
  v8 = [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)&v11 init];
  if (v8)
  {
    v8->_uniqueID = (NSString *)[a3 copy];
    v8->_outputDevice = (AVOutputDevice *)a4;
    v8->_tokenType = (NSString *)a5;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl;
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)&v3 dealloc];
}

- (void)respondWithAuthorizationToken:(id)a3 completionHandler:(id)a4
{
  self->_completionHandler = (id)[a4 copy];
  v6 = [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)self parentAuthorizationSessionImpl];
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)v6 outputDeviceAuthorizationRequestImpl:self didRespondWithAuthorizationToken:a3];
}

- (void)cancel
{
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)self enterTerminalStatus:4 error:0];
  objc_super v3 = [(AVFigEndpointUIAgentOutputDeviceAuthorizationRequestImpl *)self parentAuthorizationSessionImpl];
  [(AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)v3 outputDeviceAuthorizationRequestImplDidCancel:self];
}

- (void)enterTerminalStatus:(int64_t)a3 error:(id)a4
{
  completionHandler = (void (**)(id, int64_t, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);

    self->_completionHandler = 0;
  }
}

- (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl)parentAuthorizationSessionImpl
{
  return (AVFigEndpointUIAgentOutputDeviceAuthorizationSessionImpl *)objc_loadWeak((id *)&self->_parentSession);
}

- (void)setParentAuthorizationSessionImpl:(id)a3
{
}

- (NSString)ID
{
  return self->_uniqueID;
}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (NSString)authorizationTokenType
{
  return self->_tokenType;
}

- (void).cxx_destruct
{
}

@end