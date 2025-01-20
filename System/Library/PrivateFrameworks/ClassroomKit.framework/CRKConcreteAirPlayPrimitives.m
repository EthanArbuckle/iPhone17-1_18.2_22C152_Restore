@interface CRKConcreteAirPlayPrimitives
- (AVOutputContext)outputContext;
- (CRKConcreteAirPlayPrimitives)initWithOutputContext:(id)a3 notificationCenter:(id)a4;
- (CRKOutputDevice)currentOutputDevice;
- (CRKOutputDevice)localOutputDevice;
- (NSNotificationCenter)notificationCenter;
- (id)beginOutputDeviceBrowsingSession;
- (id)observeCurrentOutputDeviceChangesWithHandler:(id)a3;
@end

@implementation CRKConcreteAirPlayPrimitives

- (CRKConcreteAirPlayPrimitives)initWithOutputContext:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKConcreteAirPlayPrimitives;
  v9 = [(CRKConcreteAirPlayPrimitives *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputContext, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
  }

  return v10;
}

- (CRKOutputDevice)localOutputDevice
{
  v3 = [CRKConcreteOutputDevice alloc];
  v4 = [MEMORY[0x263EFA7C0] sharedLocalDevice];
  v5 = [(CRKConcreteAirPlayPrimitives *)self outputContext];
  v6 = [(CRKConcreteOutputDevice *)v3 initWithOutputDevice:v4 outputContext:v5];

  return (CRKOutputDevice *)v6;
}

- (CRKOutputDevice)currentOutputDevice
{
  v3 = [CRKConcreteOutputDevice alloc];
  v4 = [(CRKConcreteAirPlayPrimitives *)self outputContext];
  v5 = [v4 outputDevice];
  v6 = [(CRKConcreteAirPlayPrimitives *)self outputContext];
  id v7 = [(CRKConcreteOutputDevice *)v3 initWithOutputDevice:v5 outputContext:v6];

  return (CRKOutputDevice *)v7;
}

- (id)observeCurrentOutputDeviceChangesWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteAirPlayPrimitives *)self notificationCenter];
  uint64_t v6 = *MEMORY[0x263EF9FA0];
  id v7 = [(CRKConcreteAirPlayPrimitives *)self outputContext];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__CRKConcreteAirPlayPrimitives_observeCurrentOutputDeviceChangesWithHandler___block_invoke;
  v11[3] = &unk_2646F36B0;
  id v12 = v4;
  id v8 = v4;
  v9 = +[CRKNotificationObservation observationWithNotificationCenter:v5 notificationName:v6 object:v7 notificationHandler:v11];

  return v9;
}

uint64_t __77__CRKConcreteAirPlayPrimitives_observeCurrentOutputDeviceChangesWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)beginOutputDeviceBrowsingSession
{
  v3 = [(CRKConcreteAirPlayPrimitives *)self outputContext];
  id v4 = [(CRKConcreteAirPlayPrimitives *)self notificationCenter];
  v5 = +[CRKConcreteOutputDeviceBrowsingSession sessionWithOutputContext:v3 notificationCenter:v4];

  return v5;
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
}

@end