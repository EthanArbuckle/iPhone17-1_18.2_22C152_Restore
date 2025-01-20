@interface MSResetServerProtocol
- (MSResetServerProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (id)delegate;
- (void)_coreProtocolDidFailAuthenticationError:(id)a3;
- (void)_coreProtocolDidFinishError:(id)a3;
- (void)abort;
- (void)dealloc;
- (void)resetServerState;
- (void)setDelegate:(id)a3;
@end

@implementation MSResetServerProtocol

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(MSStreamsProtocol *)self personID];
    v9 = [v4 MSVerboseDescription];
    int v10 = 138543874;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  v5 = [(MSResetServerProtocol *)self delegate];
  [v5 resetServerProtocol:self didReceiveAuthenticationError:v4];
}

- (void)_coreProtocolDidFinishError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(MSStreamsProtocol *)self personID];
    v9 = [v4 MSVerboseDescription];
    int v10 = 138543874;
    v11 = v6;
    __int16 v12 = 2112;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reset server state protocol has failed. Error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  v5 = [(MSResetServerProtocol *)self delegate];
  [v5 resetServerProtocol:self didFinishWithError:v4];
}

- (void)resetServerState
{
  p_context = &self->_context;
  [(MSStreamsProtocol *)self _refreshAuthTokenForContext:&self->_context];
  id v4 = [(MSStreamsProtocol *)self resetURL];
  CFDictionaryRef v5 = (const __CFDictionary *)MSPURLConnectionProperties();
  p_context->_super.__didReceiveDataCallback = 0;
  p_context->_super.__didFinishCallback = _didFinish_2484;
  p_context->_super.__didFailAuthenticationCallback = _didFailAuthentication_2483;
  p_context->_super.__didReceiveServerSideConfigVersionCallback = _didReceiveServerSideConfigurationVersion_2482;
  MSSPCStartHTTPTransaction((uint64_t)p_context, @"POST", (uint64_t)v4, v5, 0, 0, 0);
}

- (void)dealloc
{
  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSResetServerProtocol;
  [(MSResetServerProtocol *)&v4 dealloc];
}

- (void)abort
{
}

- (MSResetServerProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSResetServerProtocol;
  id v7 = [(MSStreamsProtocol *)&v10 initWithPersonID:v6 baseURL:a4];
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    v8->_context._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish_2561;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication_2560;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion_2559;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MSResetServerProtocol;
  [(MSStreamsProtocol *)&v3 setDelegate:a3];
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MSResetServerProtocol;
  v2 = [(MSStreamsProtocol *)&v4 delegate];
  return v2;
}

@end