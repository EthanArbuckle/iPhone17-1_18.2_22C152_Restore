@interface MRAVRoutingDiscoverySession(MPAVOutputDeviceRoutingDataSource)
- (id)_replaceOutputDevices:()MPAVOutputDeviceRoutingDataSource withOutputDevices:;
- (id)availableOutputDevicesForEndpoint:()MPAVOutputDeviceRoutingDataSource;
@end

@implementation MRAVRoutingDiscoverySession(MPAVOutputDeviceRoutingDataSource)

- (id)availableOutputDevicesForEndpoint:()MPAVOutputDeviceRoutingDataSource
{
  id v4 = a3;
  v5 = [a1 availableOutputDevices];
  v6 = [v4 resolvedOutputDevices];

  v7 = [a1 _replaceOutputDevices:v5 withOutputDevices:v6];

  return v7;
}

- (id)_replaceOutputDevices:()MPAVOutputDeviceRoutingDataSource withOutputDevices:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  id v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __106__MRAVRoutingDiscoverySession_MPAVOutputDeviceRoutingDataSource___replaceOutputDevices_withOutputDevices___block_invoke;
        v23[3] = &unk_1E5F10088;
        v23[4] = v10;
        v11 = objc_msgSend(v22, "msv_firstWhere:", v23);
        if ([v10 isGroupable]
          && ([v11 isGroupable] & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v12 = [v11 groupableOutputDevice];

          v11 = (void *)v12;
        }
        v13 = [v10 sourceInfo];
        int v14 = [v13 multipleBuiltInDevices];
        v15 = [v11 sourceInfo];
        int v16 = [v15 multipleBuiltInDevices];

        if (v14 != v16)
        {
          uint64_t v17 = [v11 outputDeviceWithSourceInfoFrom:v10];

          v11 = (void *)v17;
        }
        if (v11) {
          v18 = v11;
        }
        else {
          v18 = v10;
        }
        [v21 addObject:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return v21;
}

@end