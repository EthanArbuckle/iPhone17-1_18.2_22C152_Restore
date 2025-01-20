@interface HMDSiriAccessoryMonitor
- (BOOL)hasAnyActiveTargetingAccessories;
- (HMDSiriAccessoryMonitor)initWithDelegate:(id)a3;
- (HMDSiriAccessoryMonitorDelegate)delegate;
- (NSMapTable)accessories;
- (id)_accessoriesTargetingAccessory:(id)a3;
- (id)_getInfoForAccessory:(id)a3;
- (void)_addAccessory:(id)a3 withTarget:(id)a4;
- (void)_removeAccessory:(id)a3;
- (void)accessory:(id)a3 setSupportsDragonSiri:(BOOL)a4;
- (void)setAccessories:(id)a3;
- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4;
@end

@implementation HMDSiriAccessoryMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAccessories:(id)a3
{
}

- (NSMapTable)accessories
{
  return self->_accessories;
}

- (HMDSiriAccessoryMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDSiriAccessoryMonitorDelegate *)WeakRetained;
}

- (void)accessory:(id)a3 setSupportsDragonSiri:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v6 = -[HMDSiriAccessoryMonitor _getInfoForAccessory:](self, "_getInfoForAccessory:");
  v7 = v6;
  if (v6)
  {
    if ([v6 supportsDragonSiri] != v4)
    {
      [v7 setSupportsDragonSiri:v4];
      if ([v7 isActiveAndSupportsDragonSiri])
      {
        v8 = [(HMDSiriAccessoryMonitor *)self delegate];
        [v8 monitor:self willAllowAccessoryForDragonSiri:v9];
      }
    }
  }
}

- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDSiriAccessoryMonitor *)self _accessoriesTargetingAccessory:v6];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke;
  v34[3] = &unk_1E6A076D0;
  id v10 = v8;
  id v35 = v10;
  v11 = [v9 objectsPassingTest:v34];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke_2;
  v32[3] = &unk_1E6A076D0;
  id v12 = v7;
  id v33 = v12;
  v13 = [v10 objectsPassingTest:v32];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [(HMDSiriAccessoryMonitor *)self _addAccessory:*(void *)(*((void *)&v28 + 1) + 8 * v18++) withTarget:v6];
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        -[HMDSiriAccessoryMonitor _removeAccessory:](self, "_removeAccessory:", *(void *)(*((void *)&v24 + 1) + 8 * v23++), (void)v24);
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

uint64_t __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)_removeAccessory:(id)a3
{
  id v7 = a3;
  BOOL v4 = -[HMDSiriAccessoryMonitor _getInfoForAccessory:](self, "_getInfoForAccessory:");
  if (v4)
  {
    v5 = [(HMDSiriAccessoryMonitor *)self accessories];
    [v5 removeObjectForKey:v7];

    if ([v4 isActiveAndSupportsDragonSiri])
    {
      id v6 = [(HMDSiriAccessoryMonitor *)self delegate];
      [v6 monitor:self willNotAllowAccessoryForDragonSiri:v7];
      if (![(HMDSiriAccessoryMonitor *)self hasAnyActiveTargetingAccessories]) {
        [v6 monitorHasNoAccessoriesForDragonSiri:self];
      }
    }
  }
}

- (void)_addAccessory:(id)a3 withTarget:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(HMDSiriAccessoryMonitor *)self accessories];
  id v9 = +[HMDSiriAccessoryInfo infoWithTargetableAccessory:v6];

  [v8 setObject:v9 forKey:v7];
  id v10 = [(HMDSiriAccessoryMonitor *)self delegate];
  [v10 monitor:self needsSiriCapabilityForAccessory:v7];
}

- (id)_accessoriesTargetingAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(HMDSiriAccessoryMonitor *)self accessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(HMDSiriAccessoryMonitor *)self accessories];
        v13 = [v12 objectForKey:v11];

        if (v13)
        {
          id v14 = [v13 targetsAccessory];

          if (v14 == v4) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)hasAnyActiveTargetingAccessories
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(HMDSiriAccessoryMonitor *)self accessories];
  v3 = [v2 objectEnumerator];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isActiveAndSupportsDragonSiri])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_getInfoForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDSiriAccessoryMonitor *)self accessories];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (HMDSiriAccessoryMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDSiriAccessoryMonitor;
  uint64_t v5 = [(HMDSiriAccessoryMonitor *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    accessories = v6->_accessories;
    v6->_accessories = (NSMapTable *)v7;
  }
  return v6;
}

@end