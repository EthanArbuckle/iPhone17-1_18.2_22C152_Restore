@interface AFCarPlayAnnouncementRequestCapabilityProvider
+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (id)provider;
+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3;
+ (int64_t)platform;
- (AFCarPlayAnnouncementRequestCapabilityProvider)initWithQueue:(id)a3;
- (unint64_t)_requestTypesForCarPlayAvailableOrConnected:(BOOL)a3;
- (unint64_t)lastKnownEligibleAnnouncementRequestTypes;
- (void)_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:(id)a3;
- (void)_isCarPlayConnectedWithCompletion:(id)a3;
- (void)_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:(unint64_t)a3;
- (void)_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:(unint64_t)a3;
- (void)_updateForCarPlaySessionConnected:(BOOL)a3;
- (void)addDelegate:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)isCarPlayConnectedWithCompletion:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)updateForCarPlaySessionConnected:(BOOL)a3;
@end

@implementation AFCarPlayAnnouncementRequestCapabilityProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
}

- (void)_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:]";
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s Notifying observers, available announcement request types changed: %lu", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_delegates;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "provider:availableAnnouncementRequestTypesChanged:", self, a3, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:(unint64_t)a3
{
  if (self->_lastKnownAvailableAnnouncementRequestTypes != a3)
  {
    self->_lastKnownAvailableAnnouncementRequestTypes = a3;
    -[AFCarPlayAnnouncementRequestCapabilityProvider _notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:](self, "_notifyObserversOfUpdatedAvailableAnnouncementRequestTypes:");
  }
}

- (unint64_t)_requestTypesForCarPlayAvailableOrConnected:(BOOL)a3
{
  return a3;
}

- (void)_availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __119__AFCarPlayAnnouncementRequestCapabilityProvider__availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion___block_invoke;
  v6[3] = &unk_1E592A6F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFCarPlayAnnouncementRequestCapabilityProvider *)self isCarPlayConnectedWithCompletion:v6];
}

uint64_t __119__AFCarPlayAnnouncementRequestCapabilityProvider__availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:", objc_msgSend(*(id *)(a1 + 32), "_requestTypesForCarPlayAvailableOrConnected:", a2));
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__AFCarPlayAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __103__AFCarPlayAnnouncementRequestCapabilityProvider_fetchAvailableAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _availableAnnouncementRequestTypesForCarPlayConnectionWithCompletion:*(void *)(a1 + 40)];
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__AFCarPlayAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __102__AFCarPlayAnnouncementRequestCapabilityProvider_fetchEligibleAnnouncementRequestTypesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) lastKnownEligibleAnnouncementRequestTypes];
  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

- (unint64_t)lastKnownEligibleAnnouncementRequestTypes
{
  return self->_lastKnownEligibleAnnouncementRequestTypes;
}

- (void)addDelegate:(id)a3
{
}

- (void)sessionDidDisconnect:(id)a3
{
}

- (void)sessionDidConnect:(id)a3
{
}

- (void)_updateForCarPlaySessionConnected:(BOOL)a3
{
  unint64_t v4 = [(AFCarPlayAnnouncementRequestCapabilityProvider *)self _requestTypesForCarPlayAvailableOrConnected:a3];
  [(AFCarPlayAnnouncementRequestCapabilityProvider *)self _setLastKnownAvailableAnnouncementRequestTypesAndNotifyObservers:v4];
}

- (void)updateForCarPlaySessionConnected:(BOOL)a3
{
  providerQueue = self->_providerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__AFCarPlayAnnouncementRequestCapabilityProvider_updateForCarPlaySessionConnected___block_invoke;
  v4[3] = &unk_1E592AEA0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(providerQueue, v4);
}

uint64_t __83__AFCarPlayAnnouncementRequestCapabilityProvider_updateForCarPlaySessionConnected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCarPlaySessionConnected:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_isCarPlayConnectedWithCompletion:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  id v6 = v4;
  if (AFDeviceSupportsCarPlay_onceToken != -1)
  {
    dispatch_once(&AFDeviceSupportsCarPlay_onceToken, &__block_literal_global_379);
    unint64_t v4 = v6;
  }
  if (AFDeviceSupportsCarPlay_supportsCarPlay)
  {
    BOOL v5 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
    if (!v5)
    {
      [(CARSessionStatus *)self->_carSessionStatus waitForSessionInitialization];
      BOOL v5 = [(CARSessionStatus *)self->_carSessionStatus currentSession];
    }
    self->_isCarPlayConnected = v5 != 0;
    v6[2]();
  }
  else
  {
    ((void (*)(void (**)(void), void))v4[2])(v4, 0);
  }
}

- (void)isCarPlayConnectedWithCompletion:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__AFCarPlayAnnouncementRequestCapabilityProvider_isCarPlayConnectedWithCompletion___block_invoke;
  v7[3] = &unk_1E592C6E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __83__AFCarPlayAnnouncementRequestCapabilityProvider_isCarPlayConnectedWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _isCarPlayConnectedWithCompletion:*(void *)(a1 + 40)];
}

- (AFCarPlayAnnouncementRequestCapabilityProvider)initWithQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AFCarPlayAnnouncementRequestCapabilityProvider;
  id v6 = [(AFCarPlayAnnouncementRequestCapabilityProvider *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_providerQueue, a3);
    uint64_t v17 = 0;
    __int16 v18 = &v17;
    uint64_t v19 = 0x2050000000;
    id v8 = (void *)getCARSessionStatusClass_softClass;
    uint64_t v20 = getCARSessionStatusClass_softClass;
    if (!getCARSessionStatusClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getCARSessionStatusClass_block_invoke;
      v16[3] = &unk_1E592C0B0;
      v16[4] = &v17;
      __getCARSessionStatusClass_block_invoke((uint64_t)v16);
      id v8 = (void *)v18[3];
    }
    uint64_t v9 = v8;
    _Block_object_dispose(&v17, 8);
    uint64_t v10 = (CARSessionStatus *)objc_alloc_init(v9);
    carSessionStatus = v7->_carSessionStatus;
    v7->_carSessionStatus = v10;

    [(CARSessionStatus *)v7->_carSessionStatus addSessionObserver:v7];
    v7->_lastKnownAvailableAnnouncementRequestTypes = 0;
    v7->_lastKnownEligibleAnnouncementRequestTypes = 0;
    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v12;

    if (AFDeviceSupportsCarPlay_onceToken != -1) {
      dispatch_once(&AFDeviceSupportsCarPlay_onceToken, &__block_literal_global_379);
    }
    v7->_lastKnownEligibleAnnouncementRequestTypes = [(AFCarPlayAnnouncementRequestCapabilityProvider *)v7 _requestTypesForCarPlayAvailableOrConnected:AFDeviceSupportsCarPlay_supportsCarPlay];
  }

  return v7;
}

+ (id)requiredIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 9) {
    goto LABEL_9;
  }
  if ((unint64_t)(a3 - 2) < 6)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    id v4 = getINSearchForMessagesIntentIdentifier_15130();
    v16 = v4;
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x2020000000;
    id v5 = (id *)getINSendMessageIntentIdentifierSymbolLoc_ptr_15131;
    uint64_t v15 = getINSendMessageIntentIdentifierSymbolLoc_ptr_15131;
    if (!getINSendMessageIntentIdentifierSymbolLoc_ptr_15131)
    {
      id v6 = IntentsLibrary_15133();
      v13[3] = (uint64_t)dlsym(v6, "INSendMessageIntentIdentifier");
      getINSendMessageIntentIdentifierSymbolLoc_ptr_15131 = v13[3];
      id v5 = (id *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v11 = [NSString stringWithUTF8String:"NSString *getINSendMessageIntentIdentifier(void)"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"AFCarPlayAnnouncementRequestCapabilityProvider.m", 30, @"%s", dlerror());

      __break(1u);
    }
    id v17 = *v5;
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = v17;
    v3 = [v7 arrayWithObjects:&v16 count:2];
  }
  else
  {
LABEL_9:
    v3 = 0;
  }
LABEL_10:
  return v3;
}

+ (id)announceableIntentIdentifiersForUserNotificationAnnouncementType:(int64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v3 = getINSearchForMessagesIntentIdentifier_15130();
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (int64_t)platform
{
  return 2;
}

+ (id)provider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AFCarPlayAnnouncementRequestCapabilityProvider_provider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (provider_onceToken_15144 != -1) {
    dispatch_once(&provider_onceToken_15144, block);
  }
  uint64_t v2 = (void *)provider_provider_15145;
  return v2;
}

void __58__AFCarPlayAnnouncementRequestCapabilityProvider_provider__block_invoke()
{
  id v0 = objc_alloc((Class)objc_opt_class());
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.assistant.announce.carplay", v1);

  uint64_t v2 = [v0 initWithQueue:v4];
  v3 = (void *)provider_provider_15145;
  provider_provider_15145 = v2;
}

@end