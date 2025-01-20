@interface CSAssetAvailabilityNotifierAssistant
+ (id)sharedInstance;
- (CSAssetAvailabilityNotifierAssistant)init;
- (CSAssetAvailabilityNotifierAssistantUpdateContext)updateContext;
- (OS_dispatch_queue)queue;
- (id)_getSettingsConnection;
- (void)checkInForUpdate:(BOOL)a3;
- (void)checkedInAssetForUpdate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setUpdateContext:(CSAssetAvailabilityNotifierAssistantUpdateContext *)a3;
@end

@implementation CSAssetAvailabilityNotifierAssistant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUpdateContext:(CSAssetAvailabilityNotifierAssistantUpdateContext *)a3
{
  self->_updateContext.state = a3->state;
  bundleIndentifier = a3->bundleIndentifier;
  a3->bundleIndentifier = 0;
  v6 = self->_updateContext.bundleIndentifier;
  self->_updateContext.bundleIndentifier = bundleIndentifier;

  locale = a3->locale;
  a3->locale = 0;
  v8 = self->_updateContext.locale;
  self->_updateContext.locale = locale;

  version = a3->version;
  a3->version = 0;
  v10 = self->_updateContext.version;
  self->_updateContext.version = version;
}

- (CSAssetAvailabilityNotifierAssistantUpdateContext)updateContext
{
  bundleIndentifier = self->_updateContext.bundleIndentifier;
  retstr->state = self->_updateContext.state;
  retstr->bundleIndentifier = bundleIndentifier;
  retstr->locale = self->_updateContext.locale;
  result = self->_updateContext.version;
  retstr->version = (NSString *)result;
  return result;
}

- (id)_getSettingsConnection
{
  return 0;
}

- (void)checkedInAssetForUpdate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CSAssetAvailabilityNotifierAssistant_checkedInAssetForUpdate___block_invoke;
  v7[3] = &unk_1E6201030;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__CSAssetAvailabilityNotifierAssistant_checkedInAssetForUpdate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      v15 = "-[CSAssetAvailabilityNotifierAssistant checkedInAssetForUpdate:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Checked In asset for update", (uint8_t *)&v14, 0xCu);
    }
    *(void *)(*(void *)(a1 + 40) + 16) |= 4uLL;
    uint64_t v3 = [*(id *)(a1 + 32) identity];
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v6 = [*(id *)(a1 + 32) assistantLanguageCode];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = v6;

    uint64_t v9 = [*(id *)(a1 + 32) configVersion];
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    return [*(id *)(a1 + 40) _notifyAssetUpdateToLAIfRequired];
  }
  else
  {
    v13 = *(void **)(a1 + 40);
    return [v13 _cleanup];
  }
}

- (void)checkInForUpdate:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CSAssetAvailabilityNotifierAssistant_checkInForUpdate___block_invoke;
  v4[3] = &unk_1E61FFE00;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __57__CSAssetAvailabilityNotifierAssistant_checkInForUpdate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = CSLogCategoryAsset;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[CSAssetAvailabilityNotifierAssistant checkInForUpdate:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Recieved update check-in to notify asset download completion to LA", (uint8_t *)&v5, 0xCu);
    }
    *(void *)(*(void *)(a1 + 32) + 16) |= 2uLL;
    return [*(id *)(a1 + 32) _notifyAssetUpdateToLAIfRequired];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _cleanup];
  }
}

- (CSAssetAvailabilityNotifierAssistant)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSAssetAvailabilityNotifierAssistant;
  v2 = [(CSAssetAvailabilityNotifierAssistant *)&v6 init];
  if (v2)
  {
    CSLogInitIfNeededWithSubsystemType(0);
    uint64_t v3 = +[CSUtils getSerialQueue:@"com.apple.corespeech.CSAssetAvailabilityNotifierAssistant.q" qualityOfService:21];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_updateContext.state = 1;
    objc_storeStrong((id *)&v2->_updateContext.bundleIndentifier, 0);
    objc_storeStrong((id *)&v2->_updateContext.locale, 0);
    objc_storeStrong((id *)&v2->_updateContext.version, 0);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2173 != -1) {
    dispatch_once(&sharedInstance_onceToken_2173, &__block_literal_global_2174);
  }
  v2 = (void *)sharedInstance_notifier;
  return v2;
}

uint64_t __54__CSAssetAvailabilityNotifierAssistant_sharedInstance__block_invoke()
{
  sharedInstance_notifier = objc_alloc_init(CSAssetAvailabilityNotifierAssistant);
  return MEMORY[0x1F41817F8]();
}

@end