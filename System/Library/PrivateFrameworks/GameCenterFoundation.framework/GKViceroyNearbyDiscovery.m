@interface GKViceroyNearbyDiscovery
- (GKDiscovery)discovery;
- (GKViceroyNearbyDiscovery)init;
- (id)startAdvertisingWithDiscoveryInfo:(id)a3;
- (void)forgetParticipant:(id)a3 deviceID:(id)a4;
- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 handler:(id)a6;
- (void)setDiscovery:(id)a3;
- (void)setupWithPlayerFoundHandler:(id)a3 playerLostHandler:(id)a4 receiveDataHandler:(id)a5;
- (void)startBrowsingWithPlayerID:(id)a3;
- (void)stopAdvertising;
- (void)stopBrowsing;
@end

@implementation GKViceroyNearbyDiscovery

- (GKViceroyNearbyDiscovery)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKViceroyNearbyDiscovery;
  v2 = [(GKViceroyNearbyDiscovery *)&v6 init];
  if (v2)
  {
    v3 = (GKDiscovery *)objc_alloc_init(MEMORY[0x1E4F63B38]);
    discovery = v2->_discovery;
    v2->_discovery = v3;
  }
  return v2;
}

- (void)setupWithPlayerFoundHandler:(id)a3 playerLostHandler:(id)a4 receiveDataHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v11 setPlayerFoundHandler:v10];

  v12 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v12 setPlayerLostHandler:v9];

  id v13 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v13 setReceiveDataHandler:v8];
}

- (void)startBrowsingWithPlayerID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v5 startBrowsingLocalPlayer:v4];
}

- (void)stopBrowsing
{
  id v2 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v2 stopBrowsing];
}

- (id)startAdvertisingWithDiscoveryInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroyNearbyDiscovery *)self discovery];
  objc_super v6 = [v5 startAdvertisingLocalPlayer:0 discoveryInfo:v4];

  return v6;
}

- (void)stopAdvertising
{
  id v2 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v2 stopAdvertising];
}

- (void)forgetParticipant:(id)a3 deviceID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v8 forgetParticipant:v7 deviceID:v6];
}

- (void)sendDataToParticipant:(id)a3 deviceID:(id)a4 data:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(GKViceroyNearbyDiscovery *)self discovery];
  [v14 sendDataToParticipant:v13 deviceID:v12 data:v11 withCompletionHandler:v10];
}

- (GKDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (void).cxx_destruct
{
}

@end