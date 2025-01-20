@interface GKFoundationRuntimeStrategy
- (BOOL)shouldRefreshPreferencesAfterBackgrounding;
- (GKFoundationRuntimeStrategy)initWithDaemonProxy:(id)a3;
- (GKUtilityService)utilityService;
- (GKUtilityServicePrivate)utilityServicePrivate;
- (NSURLSession)instrumentedURLSession;
- (id)localPlayer;
- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5;
@end

@implementation GKFoundationRuntimeStrategy

- (BOOL)shouldRefreshPreferencesAfterBackgrounding
{
  return 1;
}

- (GKFoundationRuntimeStrategy)initWithDaemonProxy:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GKFoundationRuntimeStrategy;
  v6 = [(GKFoundationRuntimeStrategy *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonProxy, a3);
    v8 = [GKMetricsReportingSessionDelegate alloc];
    v9 = +[GKAPIReporter reporter];
    v10 = [(GKMetricsReportingSessionDelegate *)v8 initWithReporter:v9];

    v11 = (void *)MEMORY[0x1E4F290E0];
    v12 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    uint64_t v13 = [v11 sessionWithConfiguration:v12 delegate:v10 delegateQueue:0];
    instrumentedURLSession = v7->_instrumentedURLSession;
    v7->_instrumentedURLSession = (NSURLSession *)v13;
  }
  return v7;
}

- (GKUtilityService)utilityService
{
  return [(GKServiceProxy *)self->_daemonProxy utilityService];
}

- (GKUtilityServicePrivate)utilityServicePrivate
{
  return [(GKServiceProxy *)self->_daemonProxy utilityServicePrivate];
}

- (id)localPlayer
{
  v2 = +[GKLocalPlayer local];
  v3 = [v2 internal];

  return v3;
}

- (void)requestClientsRemoteImageDataForURL:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 scheme];
  uint64_t v11 = [v10 rangeOfString:@"https"];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    [(GKDaemonProxy *)self->_daemonProxy loadRemoteImageDataForClientForURL:v9 reply:v8];
  }
  else {
    [MEMORY[0x1E4F1C9B8] _gkRequestClientsRemoteImageDataForURL:v9 queue:v12 reply:v8];
  }
}

- (NSURLSession)instrumentedURLSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentedURLSession, 0);

  objc_storeStrong((id *)&self->_daemonProxy, 0);
}

@end