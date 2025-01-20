@interface ASDPlugin(ASDTDeviceManager)
- (id)objectIDsForDeviceUIDs:()ASDTDeviceManager;
@end

@implementation ASDPlugin(ASDTDeviceManager)

- (id)objectIDsForDeviceUIDs:()ASDTDeviceManager
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [a1 audioDevices];
    v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "deviceUID", (void)v18);
          int v14 = [v4 containsObject:v13];

          if (v14)
          {
            v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "objectID"));
            [v6 addObject:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v16 = (void *)[v6 copy];
  }
  else
  {
    v16 = [MEMORY[0x263EFFA08] set];
  }

  return v16;
}

@end