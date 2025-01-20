@interface BTAirPodsControlRequest
- (BOOL)enabled;
- (BTAirPodsControlServiceClient)client;
- (OS_dispatch_source)timeoutTimer;
- (id)getHandler;
- (id)setHandler;
- (void)setClient:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGetHandler:(id)a3;
- (void)setSetHandler:(id)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation BTAirPodsControlRequest

- (BTAirPodsControlServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)getHandler
{
  return self->_getHandler;
}

- (void)setGetHandler:(id)a3
{
}

- (id)setHandler
{
  return self->_setHandler;
}

- (void)setSetHandler:(id)a3
{
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong(&self->_setHandler, 0);
  objc_storeStrong(&self->_getHandler, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end