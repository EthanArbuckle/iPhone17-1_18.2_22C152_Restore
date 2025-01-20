@interface HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface
- (id)copyMRAVEndpointOutputDevices:(id)a3;
- (id)createAssistantConnection;
- (id)createAssistantDiscovery;
- (id)getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5;
- (id)setMRAVOutputDeviceVolume:(float)a3 endpoint:(id)a4 outputDeviceUID:(id)a5 queue:(id)a6;
@end

@implementation HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface

- (id)getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke;
  v16[3] = &unk_1E6A08818;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  v14 = [v10 futureWithCompletionHandlerAdapterBlock:v16];

  return v14;
}

void __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) mravEndpoint];
  v5 = v3;
  id v4 = v3;
  MRAVEndpointGetOutputDeviceUIDVolumeControlCapabilities();
}

void __154__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_getMRAVEndpointOutputDeviceUIDVolumeControlCapabilitiesForEndpoint_outputDeviceUID_queue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInt:a2];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

- (id)setMRAVOutputDeviceVolume:(float)a3 endpoint:(id)a4 outputDeviceUID:(id)a5 queue:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F7A0D8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke;
  v18[3] = &unk_1E6A087C8;
  id v19 = v9;
  id v20 = v10;
  float v22 = a3;
  id v21 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  v16 = [v12 futureWithErrorOnlyHandlerAdapterBlock:v18];

  return v16;
}

void __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) mravEndpoint];
  id v5 = v3;
  id v4 = v3;
  MRAVEndpointSetOutputDeviceUIDVolume();
}

uint64_t __122__HMDMRSetEndpointVolumeOperationDefaultExternalObjectInterface_setMRAVOutputDeviceVolume_endpoint_outputDeviceUID_queue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyMRAVEndpointOutputDevices:(id)a3
{
  [a3 mravEndpoint];
  return (id)MRAVEndpointCopyOutputDevices();
}

- (id)createAssistantConnection
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F76E30]);
  return v2;
}

- (id)createAssistantDiscovery
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F76E38]);
  return v2;
}

@end