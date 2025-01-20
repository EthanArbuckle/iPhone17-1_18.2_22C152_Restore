@interface _GCGenericDeviceManager(DeviceManager)
- (_GCFusedLogicalDevice)makeDeviceWithConfiguration:()DeviceManager dependencies:;
@end

@implementation _GCGenericDeviceManager(DeviceManager)

- (_GCFusedLogicalDevice)makeDeviceWithConfiguration:()DeviceManager dependencies:
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 count] == 1)
  {
    v9 = [_GCDefaultLogicalDevice alloc];
    v10 = [v8 anyObject];
    v11 = [(_GCDefaultLogicalDevice *)v9 initWithPhysicalDevice:v10 configuration:v7 manager:a1];

    v12 = [v8 anyObject];
    v13 = [v12 delegate];
    [(_GCDefaultLogicalDevice *)v11 setDelegate:v13];

    goto LABEL_21;
  }
  if ([v8 count] == 2)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v36 = v8;
      id obj = v14;
      uint64_t v34 = a2;
      uint64_t v35 = a1;
      v38 = v7;
      v17 = 0;
      v18 = 0;
      uint64_t v19 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v22 = [v21 identifier];
          v23 = [v38 deviceDependencies];
          v24 = [v23 firstObject];
          int v25 = [v22 isEqual:v24];

          id v26 = v21;
          if (v25) {
            v27 = v17;
          }
          else {
            v27 = v18;
          }
          if (v25) {
            v17 = v26;
          }
          else {
            v18 = v26;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v16);
      id v28 = obj;

      id v7 = v38;
      a1 = v35;
      id v8 = v36;
      a2 = v34;
      if (v17)
      {
        if (v18)
        {
LABEL_19:
          v11 = [[_GCFusedLogicalDevice alloc] initWithPrimaryPhysicalDevice:v17 secondaryPhysicalDevice:v18 configuration:v7 manager:a1];
          v29 = [v17 delegate];
          [(_GCDefaultLogicalDevice *)v11 setDelegate:v29];

          goto LABEL_21;
        }
LABEL_26:
        v33 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
        [v33 handleFailureInMethod:a2, a1, @"_GCGenericDeviceManager+DeviceManager.m", 41, @"Dependencies did not contain secondary device. %@", v28 object file lineNumber description];

        goto LABEL_19;
      }
    }
    else
    {

      v18 = 0;
      id v28 = v14;
    }
    v32 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v32 handleFailureInMethod:a2, a1, @"_GCGenericDeviceManager+DeviceManager.m", 40, @"Dependencies did not contain primary device. %@", v28 object file lineNumber description];

    v17 = 0;
    if (v18) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
  v30 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
  [v30 handleFailureInMethod:a2, a1, @"_GCGenericDeviceManager+DeviceManager.m", 49, @"Bad configuration: %@", v7 object file lineNumber description];

  v11 = 0;
LABEL_21:

  return v11;
}

@end