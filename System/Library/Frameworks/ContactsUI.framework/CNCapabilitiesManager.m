@interface CNCapabilitiesManager
+ (id)defaultCapabilitiesManager;
+ (void)_setDefaultCapabilitiesManager:(id)a3;
- (BOOL)_isAppAvailable:(id)a3;
- (BOOL)areFavoritesAvailable;
- (BOOL)hasAdditionalTextTones;
- (BOOL)hasCameraCapability;
- (BOOL)hasCellularDataCapability;
- (BOOL)hasCellularTelephonyCapability;
- (BOOL)hasCellularTelephonyHardwareCapability;
- (BOOL)hasForceTouchCapability;
- (BOOL)hasPreviouslyConferencedWithID:(id)a3;
- (BOOL)hasSMSCapability;
- (BOOL)hasSiriCapability;
- (BOOL)hasTelephonyCapability;
- (BOOL)hasVibratorCapability;
- (BOOL)isConferencingAvailable;
- (BOOL)isConferencingEverGonnaBeAvailable;
- (BOOL)isDefaultPhoneCallAppThirdParty;
- (BOOL)isEmailConfigured;
- (BOOL)isFaceTimeAppAvailable;
- (BOOL)isFaceTimeAudioAvailable;
- (BOOL)isMMSConfigured;
- (BOOL)isMadridConfigured;
- (BOOL)isMailAppAvailable;
- (BOOL)isMessagesAppAvailable;
- (BOOL)isPhoneAppAvailable;
- (BOOL)isSensitiveUIAllowed;
- (BOOL)isWeiboServiceAvailable;
- (id)conferenceURLForDestinationID:(id)a3;
- (id)conferenceURLForPhoneNumber:(id)a3;
- (id)defaultPhoneCallAppBundleIdentifier;
- (void)_startListeningToIDSIDQueryControllerIfNecessary;
- (void)_startListeningToIDSServiceAvailabilityIfNecessary;
- (void)addIDSServiceAvailabilityListener:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4;
- (void)removeIDSServiceAvailabilityListener:(id)a3;
- (void)resetCache;
@end

@implementation CNCapabilitiesManager

+ (id)defaultCapabilitiesManager
{
  v2 = (void *)_sharedCapabilitiesManager;
  if (!_sharedCapabilitiesManager)
  {
    v3 = objc_alloc_init(CNCapabilitiesManager);
    v4 = (void *)_sharedCapabilitiesManager;
    _sharedCapabilitiesManager = (uint64_t)v3;

    v2 = (void *)_sharedCapabilitiesManager;
  }

  return v2;
}

- (BOOL)hasSiriCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasForceTouchCapability
{
  return MGGetBoolAnswer();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPhoneCallAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_isDefaultPhoneCallAppThirdParty, 0);

  objc_storeStrong((id *)&self->_destinationStatus, 0);
}

- (id)defaultPhoneCallAppBundleIdentifier
{
  v2 = cn_objectResultWithObjectLock();

  return v2;
}

id __60__CNCapabilitiesManager_defaultPhoneCallAppBundleIdentifier__block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];

  return v1;
}

- (BOOL)isDefaultPhoneCallAppThirdParty
{
  v2 = cn_objectResultWithObjectLock();
  char v3 = [v2 BOOLValue];

  return v3;
}

id __56__CNCapabilitiesManager_isDefaultPhoneCallAppThirdParty__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CNCapabilitiesManager_isDefaultPhoneCallAppThirdParty__block_invoke_2;
    aBlock[3] = &unk_1E54965A0;
    aBlock[4] = v2;
    v4 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v5 = v4[2]();
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(void *)(v6 + 24) = v5;

    char v3 = *(void **)(*(void *)(a1 + 32) + 24);
  }

  return v3;
}

uint64_t __56__CNCapabilitiesManager_isDefaultPhoneCallAppThirdParty__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[CNUIContactsEnvironment currentEnvironment];
  char v3 = [v2 applicationWorkspace];

  v4 = [v3 defaultApplicationForDefaultAppCategory:1];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 bundleIdentifier];
  char v7 = [v6 isEqualToString:*MEMORY[0x1E4F1AD10]];

  if ((v7 & 1) != 0
    || ([v5 bundleIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AD00]],
        v8,
        (v9 & 1) != 0))
  {
LABEL_4:
    uint64_t v10 = MEMORY[0x1E4F1CC28];
  }
  else
  {
    uint64_t v12 = [v5 bundleIdentifier];
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 32);
    *(void *)(v13 + 32) = v12;

    uint64_t v10 = MEMORY[0x1E4F1CC38];
  }

  return v10;
}

- (BOOL)areFavoritesAvailable
{
  BOOL v3 = [(CNCapabilitiesManager *)self hasCellularTelephonyCapability];
  if (v3)
  {
    LOBYTE(v3) = [(CNCapabilitiesManager *)self hasCellularTelephonyHardwareCapability];
  }
  return v3;
}

- (BOOL)_isAppAvailable:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v4 appWhitelistState] == 2)
  {
    uint64_t v5 = [v4 effectiveWhitelistedAppBundleIDs];
    char v6 = [v5 containsObject:v3];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isFaceTimeAppAvailable
{
  return [(CNCapabilitiesManager *)self _isAppAvailable:@"com.apple.facetime"];
}

- (BOOL)isMessagesAppAvailable
{
  return [(CNCapabilitiesManager *)self _isAppAvailable:@"com.apple.MobileSMS"];
}

- (BOOL)isMailAppAvailable
{
  return [(CNCapabilitiesManager *)self _isAppAvailable:@"com.apple.mobilemail"];
}

- (BOOL)isPhoneAppAvailable
{
  return [(CNCapabilitiesManager *)self _isAppAvailable:@"com.apple.mobilephone"];
}

- (BOOL)isFaceTimeAudioAvailable
{
  Class v2 = (Class)getTUCallCapabilitiesClass[0]();

  return [(objc_class *)v2 supportsFaceTimeAudioCalls];
}

- (BOOL)isWeiboServiceAvailable
{
  Class v2 = (Class)getSLComposeViewControllerClass[0]();
  id v3 = getSLServiceTypeSinaWeibo[0]();
  LOBYTE(v2) = [(objc_class *)v2 isAvailableForServiceType:v3];

  return (char)v2;
}

- (BOOL)hasAdditionalTextTones
{
  return MGGetBoolAnswer();
}

- (void)idStatusUpdatedForDestinations:(id)a3 service:(id)a4
{
  id v11 = a3;
  char v6 = (void (__cdecl *)())getIDSServiceNameFaceTime[0];
  id v7 = a4;
  v8 = v6();
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [(NSMutableDictionary *)self->_destinationStatus addEntriesFromDictionary:v11];
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:ABCapabilitiesConferenceHistoryChanged object:self];
  }
}

- (void)_startListeningToIDSIDQueryControllerIfNecessary
{
  if (!self->_isListeningToIDSQueryController)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    destinationStatus = self->_destinationStatus;
    self->_destinationStatus = v3;

    id v6 = [(Class)getIDSIDQueryControllerClass[0]() sharedInstance];
    uint64_t v5 = getIDSServiceNameFaceTime[0]();
    [v6 addDelegate:self forService:v5 listenerID:@"com.apple.addressbookui" queue:MEMORY[0x1E4F14428]];

    self->_isListeningToIDSQueryController = 1;
  }
}

- (void)_startListeningToIDSServiceAvailabilityIfNecessary
{
  if (!self->_isListeningToIDSServiceAvailability)
  {
    id v5 = [(Class)getIDSServiceAvailabilityControllerClass[0]() sharedInstance];
    id v3 = getIDSServiceNameiMessage[0]();
    [v5 addListenerID:@"com.apple.addressbookui" forService:v3];

    v4 = getIDSServiceNameFaceTime[0]();
    [v5 addListenerID:@"com.apple.addressbookui" forService:v4];

    self->_isListeningToIDSServiceAvailability = 1;
  }
}

- (void)removeIDSServiceAvailabilityListener:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a3;
  id v6 = [v3 defaultCenter];
  id v5 = getIDSServiceAvailabilityDidChangeNotification[0]();
  [v6 removeObserver:v4 name:v5 object:0];
}

- (void)addIDSServiceAvailabilityListener:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  [(CNCapabilitiesManager *)self _startListeningToIDSServiceAvailabilityIfNecessary];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = getIDSServiceAvailabilityDidChangeNotification[0]();
  [v8 addObserver:v6 selector:a4 name:v7 object:0];
}

- (id)conferenceURLForDestinationID:(id)a3
{
  id v4 = a3;
  if ([(CNCapabilitiesManager *)self isConferencingEverGonnaBeAvailable])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A600]) initWithStringValue:v4 type:2];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "_cnui_faceTimeVideoURLWithHandle:contact:", v5, 0);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)conferenceURLForPhoneNumber:(id)a3
{
  id v4 = a3;
  if ([(CNCapabilitiesManager *)self isConferencingEverGonnaBeAvailable])
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A600]) initWithStringValue:v4 type:2];
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "_cnui_faceTimeVideoURLWithHandle:contact:", v5, 0);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasPreviouslyConferencedWithID:(id)a3
{
  id v4 = a3;
  if (v4 && [(CNCapabilitiesManager *)self isConferencingEverGonnaBeAvailable])
  {
    [(CNCapabilitiesManager *)self _startListeningToIDSIDQueryControllerIfNecessary];
    id v5 = [(NSMutableDictionary *)self->_destinationStatus objectForKey:v4];
    id v6 = v5;
    if (v5)
    {
      BOOL v7 = [v5 intValue] == 1;
    }
    else
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      int v9 = [(Class)getIDSIDQueryControllerClass[0]() sharedInstance];
      uint64_t v10 = getIDSServiceNameFaceTime[0]();
      id v11 = dispatch_get_global_queue(0, 0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__CNCapabilitiesManager_hasPreviouslyConferencedWithID___block_invoke;
      v16[3] = &unk_1E5496578;
      v18 = &v19;
      uint64_t v12 = v8;
      v17 = v12;
      int v13 = [v9 currentIDStatusForDestination:v4 service:v10 listenerID:@"com.apple.addressbookui" queue:v11 completionBlock:v16];

      if (v13)
      {
        dispatch_time_t v14 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_semaphore_wait(v12, v14);
      }

      BOOL v7 = *((unsigned char *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

intptr_t __56__CNCapabilitiesManager_hasPreviouslyConferencedWithID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isConferencingEverGonnaBeAvailable
{
  int v2 = isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable;
  if (isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable == -1)
  {
    int v2 = MGGetBoolAnswer();
    isConferencingEverGonnaBeAvailable_sIsConferencingEverGonnaBeAvailable = v2;
  }
  return v2 != 0;
}

- (BOOL)isConferencingAvailable
{
  if (![(CNCapabilitiesManager *)self isConferencingEverGonnaBeAvailable]) {
    return 0;
  }
  [(CNCapabilitiesManager *)self _startListeningToIDSServiceAvailabilityIfNecessary];
  id v3 = [(Class)getIDSServiceAvailabilityControllerClass[0]() sharedInstance];
  id v4 = getIDSServiceNameFaceTime[0]();
  BOOL v5 = [v3 availabilityForListenerID:@"com.apple.addressbookui" forService:v4] == 1;

  return v5;
}

- (BOOL)isMadridConfigured
{
  [(CNCapabilitiesManager *)self _startListeningToIDSServiceAvailabilityIfNecessary];
  int v2 = [(Class)getIDSServiceAvailabilityControllerClass[0]() sharedInstance];
  id v3 = getIDSServiceNameiMessage[0]();
  BOOL v4 = [v2 availabilityForListenerID:@"com.apple.addressbookui" forService:v3] == 1;

  return v4;
}

- (BOOL)isMMSConfigured
{
  return CPCanSendMMS() != 0;
}

- (BOOL)isEmailConfigured
{
  if (!isEmailConfigured_lastCheckDate
    || ([(id)isEmailConfigured_lastCheckDate timeIntervalSinceNow], v2 < -30.0))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    if (dyld_program_sdk_at_least()) {
      BOOL v4 = CPCanSendMail() != 0;
    }
    else {
      BOOL v4 = 0;
    }
    isEmailConfigured_isConfigured = v4;
    BOOL v5 = (void *)isEmailConfigured_lastCheckDate;
    isEmailConfigured_lastCheckDate = v3;
  }
  return isEmailConfigured_isConfigured;
}

- (BOOL)hasCameraCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasVibratorCapability
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (BOOL)hasSMSCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasCellularDataCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasCellularTelephonyHardwareCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)hasCellularTelephonyCapability
{
  Class v2 = (Class)getTUCallCapabilitiesClass[0]();

  return [(objc_class *)v2 supportsTelephonyCalls];
}

- (BOOL)hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (BOOL)isSensitiveUIAllowed
{
  return MGGetBoolAnswer();
}

- (void)resetCache
{
}

void __35__CNCapabilitiesManager_resetCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

- (void)dealloc
{
  if (self->_isListeningToIDSServiceAvailability)
  {
    BOOL v3 = [(Class)getIDSServiceAvailabilityControllerClass[0]() sharedInstance];
    uint64_t v4 = getIDSServiceNameiMessage[0]();
    [v3 removeListenerID:@"com.apple.addressbookui" forService:v4];

    BOOL v5 = getIDSServiceNameFaceTime[0]();
    [v3 removeListenerID:@"com.apple.addressbookui" forService:v5];
  }
  if (self->_isListeningToIDSQueryController)
  {
    id v6 = [(Class)getIDSIDQueryControllerClass[0]() sharedInstance];
    BOOL v7 = getIDSServiceNameFaceTime[0]();
    [v6 removeDelegate:self forService:v7 listenerID:@"com.apple.addressbookui"];
  }
  v8.receiver = self;
  v8.super_class = (Class)CNCapabilitiesManager;
  [(CNCapabilitiesManager *)&v8 dealloc];
}

+ (void)_setDefaultCapabilitiesManager:(id)a3
{
}

@end