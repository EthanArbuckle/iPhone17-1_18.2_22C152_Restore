@interface BRCReachabilityObserver
- (id)networkReachabilityDidChangeHandler;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)setNetworkReachabilityDidChangeHandler:(id)a3;
- (void)startObservingNetworkReachabilityChanges;
- (void)stopObservingNetworkReachabilityChanges;
@end

@implementation BRCReachabilityObserver

- (void)startObservingNetworkReachabilityChanges
{
  id v3 = +[BRCSystemResourcesManager manager];
  [v3 addReachabilityObserver:self];
}

- (void)stopObservingNetworkReachabilityChanges
{
  id v3 = +[BRCSystemResourcesManager manager];
  [v3 removeReachabilityObserver:self];
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void (**)(void, void))MEMORY[0x1D94389C0](self->_networkReachabilityDidChangeHandler, a2);
  if (v4)
  {
    id v5 = v4;
    v4[2](v4, v3);
    v4 = (void (**)(void, void))v5;
  }
}

- (id)networkReachabilityDidChangeHandler
{
  return self->_networkReachabilityDidChangeHandler;
}

- (void)setNetworkReachabilityDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end