@interface MSResetServer
+ (id)resetServerObjectWithPersonID:(id)a3 baseURL:(id)a4;
- (MSMediaStreamDaemon)daemon;
- (MSResetServer)initWithPersonID:(id)a3 baseURL:(id)a4;
- (NSString)personID;
- (void)resetServer;
- (void)resetServerProtocol:(id)a3 didFinishWithError:(id)a4;
- (void)resetServerProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)setDaemon:(id)a3;
@end

@implementation MSResetServer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (NSString)personID
{
  return self->_personID;
}

- (void)resetServerProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = [a4 MSVerboseDescription];
    int v10 = 138543362;
    v11 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't reset server. Received authentication error: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  daemon = self->_daemon;
  v7 = [(MSStreamsProtocol *)self->_protocol personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v7];

  [(MSDaemon *)self->_daemon releaseBusy];
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (void)resetServerProtocol:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = [v7 MSVerboseDescription];
      int v12 = 138543362;
      v13 = v8;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't reset server. Error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Successfully reset server state.", (uint8_t *)&v12, 2u);
    }
    daemon = self->_daemon;
    int v10 = [(MSResetServer *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v10];
  }
  [(MSDaemon *)self->_daemon releaseBusy];
  selfReference = self->_selfReference;
  self->_selfReference = 0;
}

- (void)resetServer
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Resetting server state...", v3, 2u);
  }
  objc_storeStrong(&self->_selfReference, self);
  [(MSDaemon *)self->_daemon retainBusy];
  [(MSResetServerProtocol *)self->_protocol resetServerState];
}

- (MSResetServer)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSResetServer;
  v8 = [(MSResetServer *)&v12 init];
  if (v8)
  {
    v9 = [[MSResetServerProtocol alloc] initWithPersonID:v6 baseURL:v7];
    protocol = v8->_protocol;
    v8->_protocol = v9;

    [(MSResetServerProtocol *)v8->_protocol setDelegate:v8];
  }

  return v8;
}

+ (id)resetServerObjectWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithPersonID:v7 baseURL:v6];

  return v8;
}

@end