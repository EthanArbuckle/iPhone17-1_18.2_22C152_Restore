@interface MRUHearingServiceController
- (BOOL)primaryHearingAidEnabled;
- (BOOL)primaryListeningModeOffAllowed;
- (BOOL)secondaryHearingAidEnabled;
- (BOOL)secondaryListeningModeOffAllowed;
- (HMDeviceRecord)primaryHealthRecord;
- (HMDeviceRecord)secondaryHealthRecord;
- (HMServiceClient)client;
- (MRUHearingServiceController)initWithOutputDeviceRouteController:(id)a3;
- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController;
- (NSHashTable)observers;
- (float)primaryAmplification;
- (float)secondaryAmplification;
- (id)primaryOutputDeviceUID;
- (id)secondaryOutputDeviceUID;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)setClient:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPrimaryAmplification:(float)a3;
- (void)setPrimaryHealthRecord:(id)a3;
- (void)setSecondaryAmplification:(float)a3;
- (void)setSecondaryHealthRecord:(id)a3;
- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3;
- (void)updateClient;
- (void)updateHealthRecord;
- (void)updatePrimaryAmplification;
- (void)updatePrimaryHearingAidEnabled;
- (void)updatePrimaryListeningModeOffAllowed;
- (void)updateSecondaryAmplification;
- (void)updateSecondaryHearingAidEnabled;
- (void)updateSecondaryListeningModeOffAllowed;
@end

@implementation MRUHearingServiceController

- (BOOL)primaryHearingAidEnabled
{
  return self->_primaryHearingAidEnabled;
}

- (MRUHearingServiceController)initWithOutputDeviceRouteController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUHearingServiceController;
  v6 = [(MRUHearingServiceController *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_outputDeviceRouteController, a3);
    [(MRUSystemOutputDeviceRouteController *)v6->_outputDeviceRouteController addObserver:v6];
    [(MRUHearingServiceController *)v6 updatePrimaryHearingAidEnabled];
    [(MRUHearingServiceController *)v6 updateSecondaryHearingAidEnabled];
    [(MRUHearingServiceController *)v6 updatePrimaryAmplification];
    [(MRUHearingServiceController *)v6 updateSecondaryAmplification];
    [(MRUHearingServiceController *)v6 updatePrimaryListeningModeOffAllowed];
    [(MRUHearingServiceController *)v6 updateSecondaryListeningModeOffAllowed];
  }

  return v6;
}

- (void)dealloc
{
  [(HMServiceClient *)self->_client invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRUHearingServiceController;
  [(MRUHearingServiceController *)&v3 dealloc];
}

- (void)setPrimaryAmplification:(float)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothUUID];
  id v6 = objc_alloc_init(MEMORY[0x1E4F67CB0]);
  *(float *)&double v7 = a3;
  v8 = [NSNumber numberWithFloat:v7];
  [v6 setAmplification:v8];

  v9 = MCLogCategoryVolume();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    v11 = [v6 amplification];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v5;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ setting primary amplification for device: %{public}@ | amplification: %@", buf, 0x20u);
  }
  client = self->_client;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__MRUHearingServiceController_setPrimaryAmplification___block_invoke;
  v15[3] = &unk_1E5F0E338;
  v15[4] = self;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  [(HMServiceClient *)client modifyDeviceConfig:v13 identifier:v14 completion:v15];
}

void __55__MRUHearingServiceController_setPrimaryAmplification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = MCLogCategoryVolume();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      double v7 = [*(id *)(a1 + 48) amplification];
      int v8 = 138544130;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ error setting primary amplification for device: %{public}@ | amplification: %{public}@ | error: %{public}@", (uint8_t *)&v8, 0x2Au);
    }
  }
}

- (void)setSecondaryAmplification:(float)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothUUID];
  id v6 = objc_alloc_init(MEMORY[0x1E4F67CB0]);
  *(float *)&double v7 = a3;
  int v8 = [NSNumber numberWithFloat:v7];
  [v6 setAmplification:v8];

  uint64_t v9 = MCLogCategoryVolume();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v6 amplification];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v5;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ setting secondary amplification for device: %{public}@ | amplification: %@", buf, 0x20u);
  }
  client = self->_client;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__MRUHearingServiceController_setSecondaryAmplification___block_invoke;
  v15[3] = &unk_1E5F0E338;
  v15[4] = self;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  [(HMServiceClient *)client modifyDeviceConfig:v13 identifier:v14 completion:v15];
}

void __57__MRUHearingServiceController_setSecondaryAmplification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = MCLogCategoryVolume();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = *(void *)(a1 + 40);
      double v7 = [*(id *)(a1 + 48) amplification];
      int v8 = 138544130;
      uint64_t v9 = v5;
      __int16 v10 = 2114;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ error setting secondary amplification for device: %{public}@ | amplification: %{public}@ | error: %{public}@", (uint8_t *)&v8, 0x2Au);
    }
  }
}

- (void)setPrimaryHealthRecord:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHealthRecord, a3);
  [(MRUHearingServiceController *)self updatePrimaryHearingAidEnabled];
  [(MRUHearingServiceController *)self updatePrimaryAmplification];

  [(MRUHearingServiceController *)self updatePrimaryListeningModeOffAllowed];
}

- (void)setSecondaryHealthRecord:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryHealthRecord, a3);
  [(MRUHearingServiceController *)self updateSecondaryHearingAidEnabled];
  [(MRUHearingServiceController *)self updateSecondaryAmplification];

  [(MRUHearingServiceController *)self updateSecondaryListeningModeOffAllowed];
}

- (id)primaryOutputDeviceUID
{
  v2 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  id v3 = [v2 routeUID];

  return v3;
}

- (id)secondaryOutputDeviceUID
{
  v2 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController secondaryOutputDeviceRoute];
  id v3 = [v2 routeUID];

  return v3;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)systemOutputDeviceRouteControllerDidUpdateOutputDevices:(id)a3
{
  [(MRUHearingServiceController *)self updateHealthRecord];

  [(MRUHearingServiceController *)self updateClient];
}

- (void)updateClient
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUSystemOutputDeviceRouteController *)self->_outputDeviceRouteController primaryOutputDeviceRoute];
  v4 = [v3 logicalLeaderOutputDevice];
  if ([v4 deviceType] == 2 && !self->_client)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v6 = (HMServiceClient *)objc_alloc_init(MEMORY[0x1E4F67CB8]);
    client = self->_client;
    self->_client = v6;

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__MRUHearingServiceController_updateClient__block_invoke;
    v13[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v14, (id *)buf);
    [(HMServiceClient *)self->_client setInterruptionHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__MRUHearingServiceController_updateClient__block_invoke_7;
    v11[3] = &unk_1E5F0F670;
    objc_copyWeak(&v12, (id *)buf);
    [(HMServiceClient *)self->_client setDeviceRecordChangedHandler:v11];
    int v8 = self->_client;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__MRUHearingServiceController_updateClient__block_invoke_2;
    v9[3] = &unk_1E5F0F698;
    objc_copyWeak(&v10, (id *)buf);
    [(HMServiceClient *)v8 activateWithCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else if ([v4 deviceType] != 2)
  {
    uint64_t v5 = MCLogCategoryVolume();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = objc_opt_class();
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ resetting service, no bluetooth devices", buf, 0xCu);
    }

    [(MRUHearingServiceController *)self reset];
  }
}

void __43__MRUHearingServiceController_updateClient__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = MCLogCategoryVolume();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138543362;
    uint64_t v6 = objc_opt_class();
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_ERROR, "%{public}@ Hearing Mode Server crashed", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 reset];
}

void __43__MRUHearingServiceController_updateClient__block_invoke_7(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = [v17 bluetoothAddress];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v7 = [WeakRetained primaryOutputDeviceUID];
    int v8 = [v17 bluetoothAddress];
    char v9 = [v7 containsString:v8];

    if (v9) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = [v17 bluetoothAddress];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    int v5 = (id *)(a1 + 32);
    id v12 = objc_loadWeakRetained((id *)(a1 + 32));
    id v13 = [v12 secondaryOutputDeviceUID];
    id v14 = [v17 bluetoothAddress];
    int v15 = [v13 containsString:v14];

    if (v15)
    {
LABEL_5:
      id v16 = objc_loadWeakRetained(v5);
      [v16 setPrimaryHealthRecord:v17];
    }
  }
}

void __43__MRUHearingServiceController_updateClient__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = MCLogCategoryVolume();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v7 = 138543618;
      uint64_t v8 = objc_opt_class();
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1AE7DF000, v4, OS_LOG_TYPE_ERROR, "%{public}@ received error trying to activate service error: %{public}@ ", (uint8_t *)&v7, 0x16u);
    }
    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    [v6 reset];
  }
}

- (void)updateHealthRecord
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUHearingServiceController *)self primaryOutputDeviceUID];
  uint64_t v4 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
  if (v4)
  {
    int v5 = (void *)v4;
    id v6 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
    char v7 = [v3 containsString:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = MCLogCategoryVolume();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = objc_opt_class();
        id v10 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
        int v19 = 138543874;
        uint64_t v20 = v9;
        __int16 v21 = 2114;
        __int16 v22 = v10;
        __int16 v23 = 2114;
        uint64_t v24 = v3;
        _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing primary health record due to mismatch, record: %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x20u);
      }
      [(MRUHearingServiceController *)self setPrimaryHealthRecord:0];
    }
  }
  uint64_t v11 = [(MRUHearingServiceController *)self secondaryOutputDeviceUID];
  uint64_t v12 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
  if (v12)
  {
    id v13 = (void *)v12;
    id v14 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
    char v15 = [v11 containsString:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = MCLogCategoryVolume();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = objc_opt_class();
        v18 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
        int v19 = 138543874;
        uint64_t v20 = v17;
        __int16 v21 = 2114;
        __int16 v22 = v18;
        __int16 v23 = 2114;
        uint64_t v24 = v11;
        _os_log_impl(&dword_1AE7DF000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing secondary health record due to mismatch, record: %{public}@ | device: %{public}@", (uint8_t *)&v19, 0x20u);
      }
      [(MRUHearingServiceController *)self setSecondaryHealthRecord:0];
    }
  }
}

- (void)updatePrimaryHearingAidEnabled
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_primaryHealthRecord hearingAidEnabled];
  BOOL v4 = v3 == 1;
  if (self->_primaryHearingAidEnabled != v4)
  {
    unsigned int v5 = v3;
    self->_primaryHearingAidEnabled = v4;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
      uint64_t v9 = (void *)v8;
      if (v5 > 2) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E5F0F6B8[v5];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      v27 = v10;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update primary hearingAidEnabled for device: %{public}@ | hearingAidEnabled: %s", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 hearingServiceController:self didChangePrimaryHearingAidEnabled:v5 == 1];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)updateSecondaryHearingAidEnabled
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_secondaryHealthRecord hearingAidEnabled];
  BOOL v4 = v3 == 1;
  if (self->_secondaryHearingAidEnabled != v4)
  {
    unsigned int v5 = v3;
    self->_secondaryHearingAidEnabled = v4;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
      uint64_t v9 = (void *)v8;
      if (v5 > 2) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E5F0F6B8[v5];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      v27 = v10;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update secondary hearingAidEnabled for device: %{public}@ | hearingAidEnabled: %s", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 hearingServiceController:self didChangeSecondaryHearingAidEnabled:v5 == 1];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)updatePrimaryAmplification
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_primaryHealthRecord amplification];
  [v3 floatValue];
  float v5 = v4;

  if (v5 != self->_primaryAmplification)
  {
    self->_primaryAmplification = v5;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
      uint64_t v9 = [(HMDeviceRecord *)self->_primaryHealthRecord amplification];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update primary amplification for device: %{public}@ | amplification: %{public}@", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector())
          {
            *(float *)&double v16 = v5;
            [v15 hearingServiceController:self didChangePrimaryAmplification:v16];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)updateSecondaryAmplification
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_secondaryHealthRecord amplification];
  [v3 floatValue];
  float v5 = v4;

  if (v5 != self->_secondaryAmplification)
  {
    self->_secondaryAmplification = v5;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
      uint64_t v9 = [(HMDeviceRecord *)self->_secondaryHealthRecord amplification];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update secondary amplification for device: %{public}@ | amplification: %{public}@", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector())
          {
            *(float *)&double v16 = v5;
            [v15 hearingServiceController:self didChangeSecondaryAmplification:v16];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (void)updatePrimaryListeningModeOffAllowed
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_primaryHealthRecord listeningModeOffAllowed];
  BOOL v4 = v3 < 2;
  if (self->_primaryListeningModeOffAllowed != v4)
  {
    unsigned int v5 = v3;
    self->_primaryListeningModeOffAllowed = v4;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_primaryHealthRecord bluetoothAddress];
      uint64_t v9 = (void *)v8;
      if (v5 > 2) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E5F0F6B8[v5];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      v27 = v10;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update primary listeningModeOffAllowed for device: %{public}@ | listeningModeOffAllowed: %s", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 hearingServiceController:self didChangePrimaryListeningModeOffAllowed:v5 < 2];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)updateSecondaryListeningModeOffAllowed
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HMDeviceRecord *)self->_secondaryHealthRecord listeningModeOffAllowed];
  BOOL v4 = v3 < 2;
  if (self->_secondaryListeningModeOffAllowed != v4)
  {
    unsigned int v5 = v3;
    self->_secondaryListeningModeOffAllowed = v4;
    id v6 = MCLogCategoryVolume();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = [(HMDeviceRecord *)self->_secondaryHealthRecord bluetoothAddress];
      uint64_t v9 = (void *)v8;
      if (v5 > 2) {
        id v10 = "?";
      }
      else {
        id v10 = off_1E5F0F6B8[v5];
      }
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      uint64_t v25 = v8;
      __int16 v26 = 2080;
      v27 = v10;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update secondary listeningModeOffAllowed for device: %{public}@ | listeningModeOffAllowed: %s", buf, 0x20u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            [v16 hearingServiceController:self didChangeSecondaryListeningModeOffAllowed:v5 < 2];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)reset
{
  [(HMServiceClient *)self->_client invalidate];
  client = self->_client;
  self->_client = 0;
}

- (MRUSystemOutputDeviceRouteController)outputDeviceRouteController
{
  return self->_outputDeviceRouteController;
}

- (float)primaryAmplification
{
  return self->_primaryAmplification;
}

- (BOOL)primaryListeningModeOffAllowed
{
  return self->_primaryListeningModeOffAllowed;
}

- (BOOL)secondaryHearingAidEnabled
{
  return self->_secondaryHearingAidEnabled;
}

- (float)secondaryAmplification
{
  return self->_secondaryAmplification;
}

- (BOOL)secondaryListeningModeOffAllowed
{
  return self->_secondaryListeningModeOffAllowed;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (HMServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (HMDeviceRecord)primaryHealthRecord
{
  return self->_primaryHealthRecord;
}

- (HMDeviceRecord)secondaryHealthRecord
{
  return self->_secondaryHealthRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryHealthRecord, 0);
  objc_storeStrong((id *)&self->_primaryHealthRecord, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_outputDeviceRouteController, 0);
}

@end