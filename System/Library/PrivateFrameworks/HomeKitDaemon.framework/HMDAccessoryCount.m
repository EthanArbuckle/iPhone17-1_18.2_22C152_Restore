@interface HMDAccessoryCount
- (HMDAccessoryCount)initWithHome:(id)a3;
- (HMDHome)home;
- (unint64_t)numCameraAccessories;
- (unint64_t)numCameraAccessoriesRecordingEnabled;
- (unint64_t)numCriticalSensorAccessories;
- (unint64_t)numHAPAccessories;
- (unint64_t)numHAPAccessoriesWithAnyServiceWithTypes:(id)a3;
- (unint64_t)numSecurityClassAccessories;
- (void)setHome:(id)a3;
@end

@implementation HMDAccessoryCount

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (unint64_t)numHAPAccessoriesWithAnyServiceWithTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDAccessoryCount *)self home];
  v6 = [v5 hapAccessories];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += [*(id *)(*((void *)&v13 + 1) + 8 * i) hasAnyServiceWithTypes:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)numCriticalSensorAccessories
{
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D688], *MEMORY[0x263F0D670], *MEMORY[0x263F0D7F8], 0);
  unint64_t v4 = [(HMDAccessoryCount *)self numHAPAccessoriesWithAnyServiceWithTypes:v3];

  return v4;
}

- (unint64_t)numSecurityClassAccessories
{
  v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0D6A8], *MEMORY[0x263F0D6F8], *MEMORY[0x263F0D798], *MEMORY[0x263F0D7D8], *MEMORY[0x263F0D8A8], 0);
  unint64_t v4 = [(HMDAccessoryCount *)self numHAPAccessoriesWithAnyServiceWithTypes:v3];

  return v4;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(HMDAccessoryCount *)self home];
  v3 = [v2 cameraAccessories];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) cameraProfileSettingsManager];
        v6 += [v9 isRecordingEnabled];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)numCameraAccessories
{
  v2 = [(HMDAccessoryCount *)self home];
  v3 = [v2 cameraAccessories];
  unint64_t v4 = [v3 count];

  return v4;
}

- (unint64_t)numHAPAccessories
{
  v2 = [(HMDAccessoryCount *)self home];
  v3 = [v2 hapAccessories];
  unint64_t v4 = [v3 count];

  return v4;
}

- (HMDAccessoryCount)initWithHome:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryCount;
  uint64_t v5 = [(HMDAccessoryCount *)&v8 init];
  unint64_t v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_home, v4);
  }

  return v6;
}

@end