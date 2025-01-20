@interface APNetworkClientConfig
- (BOOL)useFixedHttpSessionManager;
- (double)lookBackWindow;
- (int64_t)httpMaximumConnectionsPerHost;
- (int64_t)httpMaximumConnectionsPerHostTempSession;
- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3;
- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3;
- (void)setLookBackWindow:(double)a3;
- (void)setUseFixedHttpSessionManager:(BOOL)a3;
@end

@implementation APNetworkClientConfig

- (BOOL)useFixedHttpSessionManager
{
  return self->_useFixedHttpSessionManager;
}

- (void)setUseFixedHttpSessionManager:(BOOL)a3
{
  self->_useFixedHttpSessionManager = a3;
}

- (int64_t)httpMaximumConnectionsPerHost
{
  return self->_httpMaximumConnectionsPerHost;
}

- (void)setHttpMaximumConnectionsPerHost:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHost = a3;
}

- (int64_t)httpMaximumConnectionsPerHostTempSession
{
  return self->_httpMaximumConnectionsPerHostTempSession;
}

- (void)setHttpMaximumConnectionsPerHostTempSession:(int64_t)a3
{
  self->_httpMaximumConnectionsPerHostTempSession = a3;
}

- (double)lookBackWindow
{
  return self->_lookBackWindow;
}

- (void)setLookBackWindow:(double)a3
{
  self->_lookBackWindow = a3;
}

@end