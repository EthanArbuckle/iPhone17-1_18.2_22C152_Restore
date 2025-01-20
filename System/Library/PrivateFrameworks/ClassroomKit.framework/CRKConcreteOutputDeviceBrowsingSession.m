@interface CRKConcreteOutputDeviceBrowsingSession
+ (id)sessionWithOutputContext:(id)a3 notificationCenter:(id)a4;
- (AVOutputContext)outputContext;
- (AVOutputDeviceDiscoverySession)discoverySession;
- (CRKConcreteOutputDeviceBrowsingSession)initWithDiscoverySession:(id)a3 outputContext:(id)a4 notificationCenter:(id)a5;
- (NSArray)outputDevices;
- (NSNotificationCenter)notificationCenter;
- (id)observeBrowsedOutputDeviceChangesWithHandler:(id)a3;
- (void)invalidate;
@end

@implementation CRKConcreteOutputDeviceBrowsingSession

- (CRKConcreteOutputDeviceBrowsingSession)initWithDiscoverySession:(id)a3 outputContext:(id)a4 notificationCenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKConcreteOutputDeviceBrowsingSession;
  v12 = [(CRKConcreteOutputDeviceBrowsingSession *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_discoverySession, a3);
    objc_storeStrong((id *)&v13->_outputContext, a4);
    objc_storeStrong((id *)&v13->_notificationCenter, a5);
  }

  return v13;
}

+ (id)sessionWithOutputContext:(id)a3 notificationCenter:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFA7D0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithDeviceFeatures:2];
  [v9 setDiscoveryMode:2];
  id v10 = (void *)[objc_alloc((Class)a1) initWithDiscoverySession:v9 outputContext:v8 notificationCenter:v7];

  return v10;
}

- (NSArray)outputDevices
{
  v3 = [(CRKConcreteOutputDeviceBrowsingSession *)self discoverySession];
  v4 = [v3 availableOutputDevicesObject];

  v5 = [v4 recentlyUsedDevices];
  v6 = [v4 otherDevices];
  id v7 = [v5 arrayByAddingObjectsFromArray:v6];

  id v8 = [MEMORY[0x263EFFA08] setWithArray:v7];
  id v9 = [v8 allObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__CRKConcreteOutputDeviceBrowsingSession_outputDevices__block_invoke;
  v12[3] = &unk_2646F5A48;
  v12[4] = self;
  id v10 = objc_msgSend(v9, "crk_mapUsingBlock:", v12);

  return (NSArray *)v10;
}

CRKConcreteOutputDevice *__55__CRKConcreteOutputDeviceBrowsingSession_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [CRKConcreteOutputDevice alloc];
  v5 = [*(id *)(a1 + 32) outputContext];
  v6 = [(CRKConcreteOutputDevice *)v4 initWithOutputDevice:v3 outputContext:v5];

  return v6;
}

- (id)observeBrowsedOutputDeviceChangesWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteOutputDeviceBrowsingSession *)self notificationCenter];
  uint64_t v6 = *MEMORY[0x263EF9FE0];
  id v7 = [(CRKConcreteOutputDeviceBrowsingSession *)self discoverySession];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__CRKConcreteOutputDeviceBrowsingSession_observeBrowsedOutputDeviceChangesWithHandler___block_invoke;
  v11[3] = &unk_2646F36B0;
  id v12 = v4;
  id v8 = v4;
  id v9 = +[CRKNotificationObservation observationWithNotificationCenter:v5 notificationName:v6 object:v7 notificationHandler:v11];

  return v9;
}

uint64_t __87__CRKConcreteOutputDeviceBrowsingSession_observeBrowsedOutputDeviceChangesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  id v2 = [(CRKConcreteOutputDeviceBrowsingSession *)self discoverySession];
  [v2 setDiscoveryMode:0];
}

- (AVOutputDeviceDiscoverySession)discoverySession
{
  return self->_discoverySession;
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_outputContext, 0);

  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end