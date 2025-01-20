@interface SYDeviceMonitor
@end

@implementation SYDeviceMonitor

void __43___SYDeviceMonitor_currentTargetableDevice__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isTargetable", (void)v8))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __34___SYDeviceMonitor_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance___singleton;
  sharedInstance___singleton = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __38___SYDeviceMonitor__rebuildDeviceList__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x21D4B1560]();
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  uint64_t v3 = [MEMORY[0x263F57730] sharedInstance];
  uint64_t v4 = [v3 getAllDevices];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        long long v11 = [SYDevice alloc];
        v12 = -[SYDevice initWithNRDevice:](v11, "initWithNRDevice:", v10, (void)v13);
        [*(id *)(*(void *)(a1 + 32) + 8) addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

uint64_t __36___SYDeviceMonitor__clearDeviceList__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
}

uint64_t __32___SYDeviceMonitor_addNRDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

void __35___SYDeviceMonitor_removeNRDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __35___SYDeviceMonitor_removeNRDevice___block_invoke_2;
  v12[3] = &unk_264423BB8;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 objectsPassingTest:v12];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v15 count:16];
    }
    while (v5);
  }
}

uint64_t __35___SYDeviceMonitor_removeNRDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [a2 pairingID];
    uint64_t v4 = [v2 isEqual:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v3 = [a2 nrDevice];
    uint64_t v4 = v5 == v3;
  }

  return v4;
}

void __38___SYDeviceMonitor_deviceForNRDevice___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v8 = objc_msgSend(v7, "nrDevice", (void)v10);
        int v9 = [v8 isEqual:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __39___SYDeviceMonitor_deviceForPairingID___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1[4] + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v8 = objc_msgSend(v7, "pairingID", (void)v10);
        int v9 = [v8 isEqual:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __30___SYDeviceMonitor_allDevices__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

@end