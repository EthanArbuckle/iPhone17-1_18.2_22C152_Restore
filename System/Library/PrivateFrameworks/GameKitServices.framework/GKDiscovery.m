@interface GKDiscovery
- (GKDiscovery)init;
- (GKDiscovery)initWithDomain:(id)a3 type:(id)a4;
- (GKDiscoveryManager)manager;
- (id)playerFoundHandler;
- (id)playerLostHandler;
- (id)receiveDataHandler;
- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4;
- (void)dealloc;
- (void)forgetParticipant:(id)a3 deviceID:(id)a4;
- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6;
- (void)setManager:(id)a3;
- (void)setPlayerFoundHandler:(id)a3;
- (void)setPlayerLostHandler:(id)a3;
- (void)setReceiveDataHandler:(id)a3;
- (void)startBrowsingLocalPlayer:(id)a3;
- (void)stopAdvertising;
- (void)stopBrowsing;
@end

@implementation GKDiscovery

- (GKDiscovery)init
{
  return [(GKDiscovery *)self initWithDomain:@"local." type:@"_gamecenter._tcp"];
}

- (GKDiscovery)initWithDomain:(id)a3 type:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GKDiscovery;
  v6 = [(GKDiscovery *)&v8 init];
  if (v6)
  {
    VRTraceReset();
    v6->_manager = [[GKDiscoveryManager alloc] initWithDomain:a3 type:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GKDiscovery;
  [(GKDiscovery *)&v3 dealloc];
}

- (id)playerFoundHandler
{
  v2 = [(GKDiscovery *)self manager];
  return [(GKDiscoveryManager *)v2 playerFoundHandler];
}

- (void)setPlayerFoundHandler:(id)a3
{
  v4 = [(GKDiscovery *)self manager];
  [(GKDiscoveryManager *)v4 setPlayerFoundHandler:a3];
}

- (id)playerLostHandler
{
  v2 = [(GKDiscovery *)self manager];
  return [(GKDiscoveryManager *)v2 playerLostHandler];
}

- (void)setPlayerLostHandler:(id)a3
{
  v4 = [(GKDiscovery *)self manager];
  [(GKDiscoveryManager *)v4 setPlayerLostHandler:a3];
}

- (id)receiveDataHandler
{
  v2 = [(GKDiscovery *)self manager];
  return [(GKDiscoveryManager *)v2 receiveDataHandler];
}

- (void)setReceiveDataHandler:(id)a3
{
  v4 = [(GKDiscovery *)self manager];
  [(GKDiscoveryManager *)v4 setReceiveDataHandler:a3];
}

- (id)startAdvertisingLocalPlayer:(id)a3 discoveryInfo:(id)a4
{
  return [(GKDiscoveryManager *)self->_manager startAdvertisingLocalPlayer:a3 discoveryInfo:a4];
}

- (void)stopAdvertising
{
}

- (void)startBrowsingLocalPlayer:(id)a3
{
}

- (void)stopBrowsing
{
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 withCompletionHandler:(id)a6
{
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
}

- (GKDiscoveryManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

@end