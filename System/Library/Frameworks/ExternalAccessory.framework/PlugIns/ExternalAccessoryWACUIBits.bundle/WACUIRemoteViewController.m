@interface WACUIRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (EAWiFiUnconfiguredAccessoryBrowserManager)parent;
- (void)_signalPresentationComplete;
- (void)backendDidStartSearchWithError:(id)a3;
- (void)backendDidStopSearchWithError:(id)a3;
- (void)backendFoundNewWACDevices:(id)a3 andRemovedWACDevices:(id)a4;
- (void)dismissWithStatus:(int)a3;
- (void)setParent:(id)a3;
- (void)updateState:(int64_t)a3;
- (void)wifiDidShutdown;
@end

@implementation WACUIRemoteViewController

+ (id)serviceViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WACUIServiceProtocol];
}

+ (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WACUIHostProtocol];
}

- (void)dismissWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained dismissWithStatus:v3];
}

- (void)updateState:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained updateState:a3];
}

- (void)backendDidStartSearchWithError:(id)a3
{
}

- (void)backendDidStopSearchWithError:(id)a3
{
}

- (void)backendFoundNewWACDevices:(id)a3 andRemovedWACDevices:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_parent);
    [v9 didFindNewUnconfiguredAccessories:v10 andRemovedUnconfiguredAccessories:v6];
  }
}

- (void)_signalPresentationComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained _signalPresentationComplete];
}

- (void)wifiDidShutdown
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained wifiDidShutdown];
}

- (EAWiFiUnconfiguredAccessoryBrowserManager)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (EAWiFiUnconfiguredAccessoryBrowserManager *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end