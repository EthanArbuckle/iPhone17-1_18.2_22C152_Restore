@interface ANAnnounceReachabilityServiceInterfaceDelegateProxy
- (ANAnnounceReachabilityServiceInterfaceDelegate)delegate;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ANAnnounceReachabilityServiceInterfaceDelegateProxy

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeName:(id)a4
{
  id v6 = a4;
  id v7 = [(ANAnnounceReachabilityServiceInterfaceDelegateProxy *)self delegate];
  [v7 reachabilityLevel:a3 didChangeForHomeName:v6];
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomName:(id)a4 inHomeName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(ANAnnounceReachabilityServiceInterfaceDelegateProxy *)self delegate];
  [v10 reachabilityLevel:a3 didChangeForRoomName:v9 inHomeName:v8];
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHomeUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(ANAnnounceReachabilityServiceInterfaceDelegateProxy *)self delegate];
  [v7 reachabilityLevel:a3 didChangeForHomeUUID:v6];
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoomUUID:(id)a4 inHomeUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(ANAnnounceReachabilityServiceInterfaceDelegateProxy *)self delegate];
  [v10 reachabilityLevel:a3 didChangeForRoomUUID:v9 inHomeUUID:v8];
}

- (ANAnnounceReachabilityServiceInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANAnnounceReachabilityServiceInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end