@interface MPCAssistantPause
- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6;
- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 source:(id)a6 completion:(id)a7;
@end

@implementation MPCAssistantPause

- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 source:(id)a6 completion:(id)a7
{
  id v10 = a7;
  v11 = (objc_class *)MEMORY[0x263F54938];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[[v11 alloc] initWithName:@"MPCAssistantPause.pauseDevicesByUID" requestID:v13 reason:v12];

  v16 = (void *)MEMORY[0x263F54888];
  v17 = [v14 allKeys];

  qos_class_t v18 = qos_class_self();
  v19 = dispatch_get_global_queue(v18, 0);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __84__MPCAssistantPause_pauseDevicesByUID_withRefId_audioRoutingInfo_source_completion___block_invoke;
  v21[3] = &unk_2643C5830;
  id v22 = v10;
  id v20 = v10;
  [v16 pauseOutputDeviceUIDs:v17 details:v15 queue:v19 completion:v21];
}

void __84__MPCAssistantPause_pauseDevicesByUID_withRefId_audioRoutingInfo_source_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 description];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)pauseDevicesByUID:(id)a3 withRefId:(id)a4 audioRoutingInfo:(id)a5 completion:(id)a6
{
  id v10 = (void *)MEMORY[0x263F086E0];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v15 = [v10 mainBundle];
  id v14 = [v15 bundleIdentifier];
  [(MPCAssistantPause *)self pauseDevicesByUID:v13 withRefId:v12 audioRoutingInfo:*(unsigned int *)&a5 source:v14 completion:v11];
}

@end