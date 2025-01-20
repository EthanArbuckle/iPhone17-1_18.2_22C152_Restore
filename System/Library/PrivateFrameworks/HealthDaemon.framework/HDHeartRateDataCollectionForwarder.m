@interface HDHeartRateDataCollectionForwarder
- (HDHeartRateDataCollectionForwarder)init;
- (id)_newCatherineFeeder;
- (void)dealloc;
- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5;
@end

@implementation HDHeartRateDataCollectionForwarder

- (HDHeartRateDataCollectionForwarder)init
{
  v16.receiver = self;
  v16.super_class = (Class)HDHeartRateDataCollectionForwarder;
  v2 = [(HDHeartRateDataCollectionForwarder *)&v16 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_heartRateEnabledInPrivacy = HKIsHeartRateEnabled();
    objc_initWeak(&location, v2);
    v2->_privacyPreferencesNotificationToken = -1;
    v5 = (const char *)[ (id) *MEMORY[0x1E4F2BEE0] UTF8String];
    v6 = v2->_queue;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __42__HDHeartRateDataCollectionForwarder_init__block_invoke;
    v13 = &unk_1E62F3490;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch(v5, &v2->_privacyPreferencesNotificationToken, v6, &v10);
    if (v2->_heartRateEnabledInPrivacy)
    {
      uint64_t v7 = [(HDHeartRateDataCollectionForwarder *)v2 _newCatherineFeeder];
      catherineFeeder = v2->_catherineFeeder;
      v2->_catherineFeeder = (CMCatherineFeeder *)v7;
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__HDHeartRateDataCollectionForwarder_init__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    int v3 = HKIsHeartRateEnabled();
    v2 = v10;
    int v4 = *((unsigned __int8 *)v10 + 16);
    if (v4 != v3)
    {
      int v5 = v3;
      *((unsigned char *)v10 + 16) = v3;
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = "disabled";
        if (v5) {
          uint64_t v7 = "enabled";
        }
        *(_DWORD *)buf = 136315138;
        v12 = v7;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "heart rate privacy setting changed to %s", buf, 0xCu);
      }
      v2 = v10;
      int v4 = *((unsigned __int8 *)v10 + 16);
    }
    v8 = (void *)v2[3];
    if (v8)
    {
      if (v4) {
        goto LABEL_14;
      }
      uint64_t v9 = 0;
    }
    else
    {
      if (!v4) {
        goto LABEL_14;
      }
      uint64_t v9 = [v2 _newCatherineFeeder];
      v2 = v10;
      v8 = (void *)v10[3];
    }
    v2[3] = v9;

    v2 = v10;
  }
LABEL_14:
}

- (void)dealloc
{
  int privacyPreferencesNotificationToken = self->_privacyPreferencesNotificationToken;
  if (privacyPreferencesNotificationToken != -1) {
    notify_cancel(privacyPreferencesNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDHeartRateDataCollectionForwarder;
  [(HDHeartRateDataCollectionForwarder *)&v4 dealloc];
}

- (id)_newCatherineFeeder
{
  return objc_alloc_init(MEMORY[0x1E4F221D8]);
}

- (void)insertSamples:(id)a3 device:(id)a4 source:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (self->_heartRateEnabledInPrivacy && ([v10 _isAppleWatch] & 1) == 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__HDHeartRateDataCollectionForwarder_insertSamples_device_source___block_invoke;
    v12[3] = &unk_1E6307368;
    v12[4] = self;
    [v8 enumerateObjectsUsingBlock:v12];
  }
}

uint64_t __66__HDHeartRateDataCollectionForwarder_insertSamples_device_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = [a2 quantity];
  objc_super v4 = [MEMORY[0x1E4F2B618] _countPerMinuteUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_INFO))
    {
      id v8 = NSNumber;
      id v9 = v7;
      id v10 = [v8 numberWithDouble:v6];
      uint64_t v11 = HKSensitiveLogItem();
      int v13 = 138543362;
      id v14 = v11;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_INFO, "feeding %{public}@ to catherine", (uint8_t *)&v13, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 24) feedCatherine:v6 confidence:1.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catherineFeeder, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end