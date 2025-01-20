@interface HKWatchLowPowerModeDataSource
- (BOOL)isWatchLowPowerModeEnabled;
- (HKDarwinNotificationDataSource)darwinNotificationDataSource;
- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource;
- (HKWatchLowPowerModeDataSource)init;
- (HKWatchLowPowerModeDataSource)initWithCarouselDomainAccessor:(id)a3;
- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4;
- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4 carouselDomainAccessor:(id)a5;
- (NPSDomainAccessor)carouselDomainAccessor;
- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4;
- (void)registerObserver:(id)a3 onLowPowerModeChange:(id)a4;
- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation HKWatchLowPowerModeDataSource

- (HKWatchLowPowerModeDataSource)init
{
  v3 = objc_alloc_init(HKDarwinNotificationDataSource);
  v4 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  v5 = [(HKWatchLowPowerModeDataSource *)self initWithDarwinNotificationDataSource:v3 devicePairingAndSwitchingNotificationDataSource:v4];

  return v5;
}

- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F79CD8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithDomain:@"com.apple.Carousel"];
  v10 = [(HKWatchLowPowerModeDataSource *)self initWithDarwinNotificationDataSource:v8 devicePairingAndSwitchingNotificationDataSource:v7 carouselDomainAccessor:v9];

  return v10;
}

- (HKWatchLowPowerModeDataSource)initWithCarouselDomainAccessor:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKDarwinNotificationDataSource);
  v6 = objc_alloc_init(HKNanoRegistryPairingAndSwitchingNotificationDataSource);
  id v7 = [(HKWatchLowPowerModeDataSource *)self initWithDarwinNotificationDataSource:v5 devicePairingAndSwitchingNotificationDataSource:v6 carouselDomainAccessor:v4];

  return v7;
}

- (HKWatchLowPowerModeDataSource)initWithDarwinNotificationDataSource:(id)a3 devicePairingAndSwitchingNotificationDataSource:(id)a4 carouselDomainAccessor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKWatchLowPowerModeDataSource;
  v12 = [(HKObserverBridge *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_darwinNotificationDataSource, a3);
    objc_storeStrong((id *)&v13->_devicePairingAndSwitchingDataSource, a4);
    objc_storeStrong((id *)&v13->_carouselDomainAccessor, a5);
  }

  return v13;
}

- (BOOL)isWatchLowPowerModeEnabled
{
  return _IsWatchLowPowerModeEnabledWithCarouselDomainAccessor(self->_carouselDomainAccessor);
}

- (void)registerObserver:(id)a3 onLowPowerModeChange:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CA98];
  id v8 = a3;
  id v9 = [v7 null];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HKWatchLowPowerModeDataSource_registerObserver_onLowPowerModeChange___block_invoke;
  v11[3] = &unk_1E58C94C0;
  id v12 = v6;
  id v10 = v6;
  [(HKObserverBridge *)self registerObserver:v8 forKey:v9 newValueHandler:v11];
}

void __71__HKWatchLowPowerModeDataSource_registerObserver_onLowPowerModeChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, [a3 BOOLValue]);
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = a3;
  id v6 = [v4 null];
  [(HKObserverBridge *)self unregisterObserver:v5 forKey:v6];
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  id v5 = a4;
  id v6 = self->_carouselDomainAccessor;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke;
  aBlock[3] = &unk_1E58BBBD0;
  id v7 = v6;
  v27 = v7;
  id v8 = v5;
  id v28 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = +[_HKBehavior sharedBehavior];
  int v11 = [v10 isAppleWatch];

  if (v11)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F287E8];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_2;
    v24[3] = &unk_1E58C94E8;
    id v25 = v9;
    id v14 = v9;
    objc_super v15 = [v12 addObserverForName:v13 object:0 queue:0 usingBlock:v24];
  }
  else
  {
    darwinNotificationDataSource = self->_darwinNotificationDataSource;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_3;
    v22[3] = &unk_1E58C4610;
    id v17 = v9;
    id v23 = v17;
    [(HKObserverBridge *)darwinNotificationDataSource registerObserver:self forKey:@"com.apple.Carousel.LowPowerMode" newValueHandler:v22];
    devicePairingAndSwitchingDataSource = self->_devicePairingAndSwitchingDataSource;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_4;
    v20[3] = &unk_1E58C9510;
    id v21 = v17;
    id v12 = v17;
    [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)devicePairingAndSwitchingDataSource registerObserverForDevicePairingChanges:self block:v20];
    objc_super v15 = [MEMORY[0x1E4F1CA98] null];

    id v14 = v23;
  }

  return v15;
}

void __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke(uint64_t a1)
{
  uint64_t IsWatchLowPowerModeEnabledWithCarouselDomainAccessor = _IsWatchLowPowerModeEnabledWithCarouselDomainAccessor(*(void **)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v4 = [NSNumber numberWithBool:IsWatchLowPowerModeEnabledWithCarouselDomainAccessor];
  [v3 notifyObserversOfChangeForKey:v5 newValue:v4];
}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__HKWatchLowPowerModeDataSource_makeAndRegisterBridgedObserverForKey_handle___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = +[_HKBehavior sharedBehavior];
  int v6 = [v5 isAppleWatch];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:v8 name:*MEMORY[0x1E4F287E8] object:0];
  }
  else
  {
    [(HKObserverBridge *)self->_darwinNotificationDataSource unregisterObserver:self forKey:@"com.apple.Carousel.LowPowerMode"];
    [(HKNanoRegistryPairingAndSwitchingNotificationDataSource *)self->_devicePairingAndSwitchingDataSource unregisterObserverForDevicePairingChanges:self];
  }
}

- (HKDarwinNotificationDataSource)darwinNotificationDataSource
{
  return self->_darwinNotificationDataSource;
}

- (HKNanoRegistryPairingAndSwitchingNotificationDataSource)devicePairingAndSwitchingDataSource
{
  return self->_devicePairingAndSwitchingDataSource;
}

- (NPSDomainAccessor)carouselDomainAccessor
{
  return self->_carouselDomainAccessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselDomainAccessor, 0);
  objc_storeStrong((id *)&self->_devicePairingAndSwitchingDataSource, 0);

  objc_storeStrong((id *)&self->_darwinNotificationDataSource, 0);
}

@end