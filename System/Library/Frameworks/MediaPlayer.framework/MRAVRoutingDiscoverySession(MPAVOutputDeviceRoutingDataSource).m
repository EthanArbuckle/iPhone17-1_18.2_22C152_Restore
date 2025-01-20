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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      v19 = sel_groupableOutputDevice;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __106__MRAVRoutingDiscoverySession_MPAVOutputDeviceRoutingDataSource___replaceOutputDevices_withOutputDevices___block_invoke;
        v20[3] = &unk_1E57F8598;
        v20[4] = v13;
        v14 = objc_msgSend(v6, "msv_firstWhere:", v20, v19);
        if ([v13 isGroupable]
          && ([v14 isGroupable] & 1) == 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [v14 groupableOutputDevice];
          v16 = id v15 = v8;

          v14 = (void *)v16;
          id v8 = v15;
        }
        if (v14) {
          v17 = v14;
        }
        else {
          v17 = v13;
        }
        [v7 addObject:v17];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

@end