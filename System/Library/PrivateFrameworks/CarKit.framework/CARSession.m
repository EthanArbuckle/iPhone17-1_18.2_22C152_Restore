@interface CARSession
+ (id)_stringForNightModeNumber:(id)a3;
+ (int64_t)_siriRequestEventForEndpointAction:(id)a3;
- (BOOL)_sessionReady;
- (BOOL)carOwnsMainAudio;
- (BOOL)carOwnsScreen;
- (BOOL)isActivated;
- (BOOL)isAuthenticated;
- (BOOL)isPaired;
- (BOOL)recognizingSpeech;
- (CARAppearanceManager)appearanceManager;
- (CARInputDeviceManager)inputDeviceManager;
- (CARObserverHashTable)observers;
- (CARSession)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 sessionStatusOptions:(unint64_t)a4;
- (CARSessionConfiguration)configuration;
- (NSArray)clusterSessionURLs;
- (NSData)MFiCertificateSerialNumber;
- (NSNumber)electronicTollCollectionAvailable;
- (NSNumber)fallbackNightMode;
- (NSNumber)limitUserInterfaces;
- (NSNumber)nightMode;
- (NSNumber)systemNightMode;
- (NSString)description;
- (NSString)sourceVersion;
- (OS_dispatch_queue)clusterURLUpdateQueue;
- (OpaqueFigEndpoint)endpoint;
- (OpaqueFigEndpointRemoteControlSession)createRemoteControlSession:(id)a3 channelID:(id)a4 withoutReply:(BOOL)a5 qualityOfService:(id)a6 streamPriority:(id)a7 error:(id *)a8;
- (id)APEndPointInfo;
- (id)_capabilitiesIdentifier;
- (id)_endpointValueForKey:(__CFString *)a3;
- (id)_fig_safe_description;
- (id)borrowScreenForClient:(id)a3 reason:(id)a4;
- (id)lastNavigatingBundleIdentifier;
- (int)nightFallbackNotifyToken;
- (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3;
- (int64_t)mapInterfaceStyleForScreenUUID:(id)a3;
- (int64_t)userInterfaceStyleForScreenUUID:(id)a3;
- (int64_t)voiceTriggerMode;
- (unint64_t)navigationOwner;
- (unint64_t)sessionStatusOptions;
- (void)_clusterURLsUpdated:(id)a3;
- (void)_fetchActivationStatus;
- (void)_fetchAuthenticationStatus;
- (void)_fetchFallbackIsNightWithToken:(int)a3;
- (void)_handleAppearanceModeUpdateWithParameters:(id)a3;
- (void)_handleDisplayPanelsUpdateWithParameters:(id)a3;
- (void)_handleMapAppearanceModeUpdateWithParameters:(id)a3;
- (void)_handleNightModeChange;
- (void)_handleOpenURL:(id)a3;
- (void)_handleShowUIWithParameters:(id)a3;
- (void)_handleSiriRequestEvent:(int64_t)a3 withPayload:(id)a4;
- (void)_handleStopUIWithParameters:(id)a3;
- (void)_handleViewAreaChangeWithPayload:(id)a3;
- (void)_performExtendedEndpointAction:(id)a3;
- (void)_setEndpointValue:(void *)a3 forKey:(__CFString *)a4;
- (void)_updateCarCapabilities;
- (void)_updateConfiguration;
- (void)_updateScreenInfo:(id)a3 currentViewAreaToViewArea:(id)a4 duration:(double)a5 transitionControlType:(unint64_t)a6;
- (void)addObserver:(id)a3;
- (void)appearanceManager:(id)a3 didUpdateMapAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5;
- (void)appearanceManager:(id)a3 didUpdateUIAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5;
- (void)dealloc;
- (void)releaseTurnByTurnOwnership;
- (void)removeObserver:(id)a3;
- (void)requestAdjacentViewAreaForScreenID:(id)a3;
- (void)requestCarUI;
- (void)requestCarUIForURL:(id)a3;
- (void)requestTurnByTurnOwnership;
- (void)sendCommand:(id)a3 withParameters:(id)a4;
- (void)setAppearanceManager:(id)a3;
- (void)setClusterSessionURLs:(id)a3;
- (void)setClusterURLUpdateQueue:(id)a3;
- (void)setCornerMaskImageData:(id)a3 forScreenInfo:(id)a4;
- (void)setFallbackNightMode:(id)a3;
- (void)setInputDeviceManager:(id)a3;
- (void)setInputMode:(unint64_t)a3 forInputDevice:(id)a4;
- (void)setNightFallbackNotifyToken:(int)a3;
- (void)setObservers:(id)a3;
- (void)setSiriForwardingEnabled:(BOOL)a3;
- (void)setSystemNightMode:(id)a3;
- (void)suggestUI:(id)a3;
- (void)takeScreenForClient:(id)a3 reason:(id)a4;
- (void)takeScreenForConnection;
- (void)unborrowScreenForToken:(id)a3;
@end

@implementation CARSession

- (BOOL)_sessionReady
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = [(CARSession *)self isAuthenticated];
    __int16 v7 = 1024;
    BOOL v8 = [(CARSession *)self isActivated];
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "session isAuthenticated:%d, isActivated:%d", (uint8_t *)v6, 0xEu);
  }

  BOOL v4 = [(CARSession *)self isAuthenticated];
  if (v4) {
    LOBYTE(v4) = [(CARSession *)self isActivated];
  }
  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSession *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSession *)self observers];
  [v5 removeObserver:v4];
}

+ (int64_t)_siriRequestEventForEndpointAction:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F21270]] & 1) == 0)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F21260]])
    {
      int64_t v4 = 2;
      goto LABEL_9;
    }
    if ([v3 isEqualToString:*MEMORY[0x1E4F21268]])
    {
      int64_t v4 = 3;
      goto LABEL_9;
    }
    if ([v3 isEqualToString:*MEMORY[0x1E4F21278]])
    {
      int64_t v4 = 4;
      goto LABEL_9;
    }
    v6 = CarGeneralLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[CARSession _siriRequestEventForEndpointAction:]();
    }
  }
  int64_t v4 = 1;
LABEL_9:

  return v4;
}

- (CARSession)initWithFigEndpoint:(OpaqueFigEndpoint *)a3 sessionStatusOptions:(unint64_t)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v6 = [(CARSession *)self init];
  __int16 v7 = v6;
  if (!v6)
  {
LABEL_21:
    a3 = v7;
    goto LABEL_22;
  }
  v6->_sessionStatusOptions = a4;
  BOOL v8 = [[CARObserverHashTable alloc] initWithProtocol:&unk_1F0327720];
  observers = v7->_observers;
  v7->_observers = v8;

  if (a3)
  {
    v7->_endpoint = (OpaqueFigEndpoint *)CFRetain(a3);
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    [(CARSession *)v7 _fetchAuthenticationStatus];
    [(CARSession *)v7 _fetchActivationStatus];
    if ([(CARSession *)v7 _sessionReady])
    {
      [(CARSession *)v7 _updateConfiguration];
      v10 = [(CARSession *)v7 configuration];
      v11 = [v10 screens];
      unint64_t v12 = [v11 count];

      if (v12 >= 2)
      {
        v13 = CarGeneralLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB00000, v13, OS_LOG_TYPE_DEFAULT, "Listening for cluster URL update notifications", buf, 2u);
        }

        dispatch_queue_t v14 = dispatch_queue_create("com.apple.carkit.clusterURLUpdates", 0);
        clusterURLUpdateQueue = v7->_clusterURLUpdateQueue;
        v7->_clusterURLUpdateQueue = (OS_dispatch_queue *)v14;

        v16 = [MEMORY[0x1E4F28C40] defaultCenter];
        [v16 addObserver:v7 selector:sel__clusterURLsUpdated_ name:@"CRInstrumentClusterURLsDidChangeNotification" object:0];
      }
      v17 = CarGeneralLogging();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABB00000, v17, OS_LOG_TYPE_DEFAULT, "Creating location based night mode observer", buf, 2u);
      }

      objc_initWeak(&location, v7);
      id v18 = MEMORY[0x1E4F14428];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke;
      handler[3] = &unk_1E5E3BFA0;
      objc_copyWeak(&v46, &location);
      notify_register_dispatch("com.apple.private.carkit.fallbackNightModeChanged", &v7->_nightFallbackNotifyToken, MEMORY[0x1E4F14428], handler);

      uint64_t v19 = [(CARSession *)v7 _endpointValueForKey:*MEMORY[0x1E4F20F30]];
      systemNightMode = v7->_systemNightMode;
      v7->_systemNightMode = (NSNumber *)v19;

      [(CARSession *)v7 _fetchFallbackIsNightWithToken:v7->_nightFallbackNotifyToken];
      v21 = [(CARSession *)v7 _endpointValueForKey:*MEMORY[0x1E4F21078]];
      v22 = v21;
      if (v21) {
        uint64_t v23 = [v21 integerValue];
      }
      else {
        uint64_t v23 = -1;
      }
      v7->_voiceTriggerMode = v23;
      v24 = [CARAppearanceManager alloc];
      v25 = [(CARSession *)v7 configuration];
      v26 = [v25 screens];
      uint64_t v27 = [(NSNumber *)v7->_systemNightMode BOOLValue];
      v28 = [(CARSession *)v7 fallbackNightMode];
      uint64_t v29 = -[CARAppearanceManager initWithScreens:initialSystemNightMode:initialLocationBasedNightMode:delegate:](v24, "initWithScreens:initialSystemNightMode:initialLocationBasedNightMode:delegate:", v26, v27, [v28 BOOLValue], v7);
      appearanceManager = v7->_appearanceManager;
      v7->_appearanceManager = (CARAppearanceManager *)v29;

      if (([(CARSession *)v7 sessionStatusOptions] & 2) != 0)
      {
        v31 = +[CARPrototypePref disableLocationNightMode];
        int v32 = [v31 valueBool];

        if (v32)
        {
          v33 = CarGeneralLogging();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1ABB00000, v33, OS_LOG_TYPE_DEFAULT, "Disabling location night mode", buf, 2u);
          }

          [(CARAppearanceManager *)v7->_appearanceManager setDisableLocationNightMode];
        }
      }
      v34 = CarGeneralLogging();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = objc_opt_class();
        v36 = [(CARSession *)v7 systemNightMode];
        id v37 = [v35 _stringForNightModeNumber:v36];
        v38 = objc_opt_class();
        v39 = [(CARSession *)v7 fallbackNightMode];
        v40 = [v38 _stringForNightModeNumber:v39];
        *(_DWORD *)buf = 138412546;
        id v49 = v37;
        __int16 v50 = 2112;
        v51 = v40;
        _os_log_impl(&dword_1ABB00000, v34, OS_LOG_TYPE_DEFAULT, "Initial system night mode: %@, initial location night mode: %@", buf, 0x16u);
      }
      v41 = [(CARSessionConfiguration *)v7->_configuration screens];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_350;
      v43[3] = &unk_1E5E3BFC8;
      v44 = v7;
      [v41 enumerateObjectsUsingBlock:v43];

      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
    goto LABEL_21;
  }
LABEL_22:

  return (CARSession *)a3;
}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "Received cartkid ambient light changed notification, fetching ambient light", v5, 2u);
    }

    [WeakRetained _fetchFallbackIsNightWithToken:a2];
  }
}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_350(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_2;
  v6[3] = &unk_1E5E3BF78;
  id v7 = v3;
  int64_t v4 = *(void **)(a1 + 32);
  id v8 = v4;
  id v5 = v3;
  [v4 _performExtendedEndpointAction:v6];
}

void __55__CARSession_initWithFigEndpoint_sessionStatusOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0;
  int64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = *(void (**)(uint64_t, void *, CFTypeRef *))(v6 + 120);
  if (v7) {
    v7(a2, v4, &cf);
  }

  id v8 = *(void **)(a1 + 40);
  if (cf)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleViewAreaChangeWithPayload:");
    CFRelease(cf);
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v10 = [v9 viewAreas];
    v11 = [v10 firstObject];
    [v8 _updateScreenInfo:v9 currentViewAreaToViewArea:v11 duration:0 transitionControlType:0.0];
  }
}

- (NSString)description
{
  v16 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)CARSession;
  id v3 = [(CARSession *)&v17 description];
  int64_t v4 = [(CARSession *)self nightMode];
  uint64_t v5 = @"NO";
  if (v4)
  {
    v15 = [(CARSession *)self nightMode];
    if ([v15 BOOLValue]) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
  }
  else
  {
    uint64_t v6 = @"unset";
  }
  id v7 = [(CARSession *)self limitUserInterfaces];
  if (v7)
  {
    dispatch_queue_t v14 = [(CARSession *)self limitUserInterfaces];
    if ([v14 BOOLValue]) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
  }
  else
  {
    id v8 = @"unset";
  }
  uint64_t v9 = [(CARSession *)self electronicTollCollectionAvailable];
  if (v9)
  {
    [(CARSession *)self electronicTollCollectionAvailable];
    v10 = @"NO";
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([(__CFString *)v5 BOOLValue]) {
      v10 = @"YES";
    }
  }
  else
  {
    v10 = @"unset";
  }
  v11 = [(CARSession *)self configuration];
  unint64_t v12 = [v16 stringWithFormat:@"%@, night mode: %@, limit UI: %@, ETC available: %@, configuration: %@", v3, v6, v8, v10, v11];

  if (v9) {
  if (v7)
  }

  if (v4) {
  return (NSString *)v12;
  }
}

- (id)_fig_safe_description
{
  v4.receiver = self;
  v4.super_class = (Class)CARSession;
  v2 = [(CARSession *)&v4 description];
  return v2;
}

- (void)dealloc
{
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListeners();
  notify_cancel(self->_nightFallbackNotifyToken);
  endpoint = self->_endpoint;
  if (endpoint) {
    CFRelease(endpoint);
  }
  v4.receiver = self;
  v4.super_class = (Class)CARSession;
  [(CARSession *)&v4 dealloc];
}

- (OpaqueFigEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)_performExtendedEndpointAction:(id)a3
{
  objc_super v4 = (void (**)(id, void))a3;
  uint64_t v5 = [(CARSession *)self endpoint];
  if (v5 && (uint64_t v6 = v5, FigEndpointExtendedGetClassID(), CMBaseObjectIsMemberOfClass()))
  {
    if (v4) {
      ((void (**)(id, OpaqueFigEndpoint *))v4)[2](v4, v6);
    }
  }
  else
  {
    id v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CARSession _performExtendedEndpointAction:]();
    }
  }
}

- (id)_endpointValueForKey:(__CFString *)a3
{
  if ([(CARSession *)self endpoint])
  {
    id v14 = 0;
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v9 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v6 + 48);
    if (!v9
      || ((int v10 = v9(CMBaseObject, a3, *MEMORY[0x1E4F1CF80], &v14), v10 != -12787) ? (v11 = v10 == 0) : (v11 = 1), !v11))
    {
      unint64_t v12 = CarGeneralLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CARSession _endpointValueForKey:]();
      }
    }
    id v8 = v14;
  }
  else
  {
    id v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CARSession _endpointValueForKey:]();
    }

    id v8 = 0;
  }
  return v8;
}

- (void)_setEndpointValue:(void *)a3 forKey:(__CFString *)a4
{
  if ([(CARSession *)self endpoint])
  {
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    uint64_t v8 = v7 ? v7 : 0;
    uint64_t v9 = *(void (**)(uint64_t, __CFString *, void *))(v8 + 56);
    if (v9)
    {
      v9(CMBaseObject, a4, a3);
    }
  }
}

- (void)_fetchAuthenticationStatus
{
  v15 = 0;
  CFTypeRef cf1 = 0;
  [(CARSession *)self endpoint];
  uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void (**)(uint64_t, void, void, CFTypeRef *))(v5 + 48);
  if (v6
    && (v6(CMBaseObject, *MEMORY[0x1E4F20D00], 0, &cf1), cf1)
    && (CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F203C0]) || CFEqual(cf1, @"MFiMutualAuth")))
  {
    [(CARSession *)self endpoint];
    uint64_t v7 = FigEndpointGetCMBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    BOOL v11 = *(void (**)(uint64_t, void, void, NSData **))(v9 + 48);
    if (v11)
    {
      v11(v7, *MEMORY[0x1E4F20CF8], 0, &v15);
      if (v15)
      {
        MFiCertificateSerialNumber = self->_MFiCertificateSerialNumber;
        self->_MFiCertificateSerialNumber = v15;

        self->_authenticated = 1;
        v13 = CarGeneralLogging();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_1ABB00000, v13, OS_LOG_TYPE_DEFAULT, "endpoint is authenticated", v14, 2u);
        }
      }
    }
  }
  else
  {
    int v10 = self->_MFiCertificateSerialNumber;
    self->_MFiCertificateSerialNumber = 0;

    self->_authenticated = 0;
  }
  if (cf1) {
    CFRelease(cf1);
  }
}

- (void)_fetchActivationStatus
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch activation status from AirPlay endpoint server with error %i", (uint8_t *)v2, 8u);
}

- (id)_capabilitiesIdentifier
{
  uint64_t v3 = [(CARSession *)self MFiCertificateSerialNumber];

  if (v3)
  {
    uint64_t v4 = [(CARSession *)self MFiCertificateSerialNumber];
    uint64_t v5 = [v4 base64EncodedStringWithOptions:1];

    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = @"CarCapabilitiesDefaultIdentifier";
    }
  }
  else
  {
    uint64_t v6 = @"CarCapabilitiesDefaultIdentifier";
  }
  return v6;
}

- (void)_updateConfiguration
{
  uint64_t v3 = [(CARSession *)self _capabilitiesIdentifier];
  +[CRCarPlayCapabilities setCapabilitiesIdentifier:v3];

  if (([(CARSession *)self sessionStatusOptions] & 4) != 0) {
    +[CRCarPlayCapabilities waitForCarCapabilitiesValuesWithReply:0];
  }
  uint64_t v4 = [CARSessionConfiguration alloc];
  unint64_t v5 = [(CARSession *)self sessionStatusOptions];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__CARSession__updateConfiguration__block_invoke;
  v8[3] = &unk_1E5E3B2D0;
  v8[4] = self;
  uint64_t v6 = [(CARSessionConfiguration *)v4 initWithSessionStatusOptions:v5 propertySupplier:v8];
  configuration = self->_configuration;
  self->_configuration = v6;
}

uint64_t __34__CARSession__updateConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _endpointValueForKey:a2];
}

- (void)_updateCarCapabilities
{
  uint64_t v3 = [(CARSession *)self configuration];
  [v3 updateCarCapabilities];

  id v4 = [(CARSession *)self observers];
  [v4 sessionDidUpdateCarCapabilities:self];
}

- (OpaqueFigEndpointRemoteControlSession)createRemoteControlSession:(id)a3 channelID:(id)a4 withoutReply:(BOOL)a5 qualityOfService:(id)a6 streamPriority:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = [v14 substringToIndex:8];
  if ([(CARSession *)self isActivated])
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (Mutable)
    {
      v20 = Mutable;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F210A8], v14);
      if (v15) {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F21100], v15);
      }
      if (v11) {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F21120], MEMORY[0x1E4F1CC38]);
      }
      if (v16) {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F21110], v16);
      }
      if (v17) {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F21130], v17);
      }
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F21118], MEMORY[0x1E4F1CC38]);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2020000000;
      uint64_t v40 = 0;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      int v36 = 0;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __102__CARSession_createRemoteControlSession_channelID_withoutReply_qualityOfService_streamPriority_error___block_invoke;
      v32[3] = &unk_1E5E3BFF0;
      v32[5] = &v37;
      v32[6] = v20;
      v32[4] = &v33;
      [(CARSession *)self _performExtendedEndpointAction:v32];
      CFRelease(v20);
      uint64_t v21 = *((int *)v34 + 6);
      if (!v21)
      {
        CFRetain((CFTypeRef)v38[3]);
        v28 = (OpaqueFigEndpointRemoteControlSession *)v38[3];
LABEL_34:
        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);
        goto LABEL_35;
      }
      uint64_t v41 = *MEMORY[0x1E4F28A50];
      v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v21 userInfo:0];
      v42[0] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];

      int v24 = *((_DWORD *)v34 + 6);
      if (v24 == -16727)
      {
        uint64_t v29 = CarGeneralLogging();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:]();
        }

        if (!a8) {
          goto LABEL_33;
        }
        uint64_t v26 = 4;
      }
      else if (v24 == -17606)
      {
        v25 = CarGeneralLogging();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:]();
        }

        if (!a8) {
          goto LABEL_33;
        }
        uint64_t v26 = 2;
      }
      else
      {
        v30 = CarGeneralLogging();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:]();
        }

        if (!a8) {
          goto LABEL_33;
        }
        uint64_t v26 = 3;
      }
      *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.carkit.session" code:v26 userInfo:v23];
LABEL_33:

      v28 = 0;
      goto LABEL_34;
    }
    goto LABEL_22;
  }
  uint64_t v27 = CarGeneralLogging();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[CARSession createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:].cold.4();
  }

  if (!a8)
  {
LABEL_22:
    v28 = 0;
    goto LABEL_35;
  }
  [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.carkit.session" code:1 userInfo:0];
  v28 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v28;
}

uint64_t __102__CARSession_createRemoteControlSession_channelID_withoutReply_qualityOfService_streamPriority_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 80);
  if (v8) {
    uint64_t result = v8(a2, v4, v5 + 24);
  }
  else {
    uint64_t result = 4294954514;
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

- (NSNumber)nightMode
{
  v2 = NSNumber;
  uint64_t v3 = [(CARSession *)self appearanceManager];
  uint64_t v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "effectiveGlobalNightMode"));

  return (NSNumber *)v4;
}

- (int64_t)userInterfaceStyleForScreenUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARSession *)self appearanceManager];
  int64_t v6 = [v5 effectiveStyleForUIAppearanceForScreenUUID:v4];

  return v6;
}

- (int64_t)mapInterfaceStyleForScreenUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CARSession *)self appearanceManager];
  int64_t v6 = [v5 effectiveStyleForMapAppearanceForScreenUUID:v4];

  return v6;
}

- (void)_handleNightModeChange
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CARSessionNightModeChangedNotification" object:self userInfo:0];

  id v5 = [(CARSession *)self observers];
  id v4 = [(CARSession *)self nightMode];
  objc_msgSend(v5, "session:didUpdateNightMode:", self, objc_msgSend(v4, "BOOLValue"));
}

- (int64_t)_carUserInterfaceStyleForAppearanceMode:(unint64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = -1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 1;
  }
}

- (void)_handleAppearanceModeUpdateWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"uuid"];
  int64_t v6 = [(CARSession *)self configuration];
  uint64_t v7 = [v6 screenInfoForScreenID:v5];

  if (v7)
  {
    if ([v7 supportsAppearanceMode])
    {
      uint64_t v8 = [(CARSession *)self appearanceManager];
      [v8 handleUIAppearanceUpdateWithParameters:v4];
    }
    else
    {
      uint64_t v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CARSession _handleAppearanceModeUpdateWithParameters:]();
      }
    }
  }
  else
  {
    uint64_t v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CARSession _handleAppearanceModeUpdateWithParameters:]();
    }
  }
}

- (void)_handleMapAppearanceModeUpdateWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"uuid"];
  int64_t v6 = [(CARSession *)self configuration];
  uint64_t v7 = [v6 screenInfoForScreenID:v5];

  if (v7)
  {
    if ([v7 supportsMapAppearanceMode])
    {
      uint64_t v8 = [(CARSession *)self appearanceManager];
      [v8 handleMapAppearanceUpdateWithParameters:v4];
    }
    else
    {
      uint64_t v8 = CarGeneralLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring map appearance update because screen does not support maps appearance mode", v9, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CARSession _handleAppearanceModeUpdateWithParameters:]();
    }
  }
}

+ (id)_stringForNightModeNumber:(id)a3
{
  if (a3)
  {
    [a3 BOOLValue];
    NSStringFromBOOL();
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"Not set";
  }
  return v4;
}

- (id)APEndPointInfo
{
  return [(CARSession *)self _endpointValueForKey:@"EndpointInfo"];
}

- (NSString)sourceVersion
{
  v2 = [(CARSession *)self _endpointValueForKey:@"SourceVersion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 stringValue];
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSString *)v4;
}

- (void)_fetchFallbackIsNightWithToken:(int)a3
{
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CARSession _fetchFallbackIsNightWithToken:]();
  }

  uint64_t state64 = 0;
  notify_get_state(a3, &state64);
  uint64_t v6 = state64;
  uint64_t v7 = [NSNumber numberWithBool:state64 != 0];
  [(CARSession *)self setFallbackNightMode:v7];

  uint64_t v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CARSession _fetchFallbackIsNightWithToken:](v6 != 0, v8);
  }

  uint64_t v9 = [(CARSession *)self appearanceManager];
  [v9 handleLocationBasedNightModeUpdate:v6 != 0];

  [(CARSession *)self _handleNightModeChange];
}

- (void)appearanceManager:(id)a3 didUpdateUIAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__CARSession_appearanceManager_didUpdateUIAppearanceStyle_forScreenUUIDs___block_invoke;
  v9[3] = &unk_1E5E3C018;
  id v10 = v7;
  BOOL v11 = self;
  id v8 = v7;
  [a5 enumerateObjectsUsingBlock:v9];
}

void __74__CARSession_appearanceManager_didUpdateUIAppearanceStyle_forScreenUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 effectiveStyleForUIAppearanceForScreenUUID:v4];
  id v6 = [*(id *)(a1 + 40) observers];
  [v6 session:*(void *)(a1 + 40) didUpdateAppearanceStyle:v5 forScreenUUID:v4];
}

- (void)appearanceManager:(id)a3 didUpdateMapAppearanceStyle:(int64_t)a4 forScreenUUIDs:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__CARSession_appearanceManager_didUpdateMapAppearanceStyle_forScreenUUIDs___block_invoke;
  v9[3] = &unk_1E5E3C018;
  id v10 = v7;
  BOOL v11 = self;
  id v8 = v7;
  [a5 enumerateObjectsUsingBlock:v9];
}

void __75__CARSession_appearanceManager_didUpdateMapAppearanceStyle_forScreenUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 effectiveStyleForMapAppearanceForScreenUUID:v4];
  id v6 = [*(id *)(a1 + 40) observers];
  [v6 session:*(void *)(a1 + 40) didUpdateMapAppearanceStyle:v5 forScreenUUID:v4];
}

- (NSNumber)limitUserInterfaces
{
  return (NSNumber *)[(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20ED8]];
}

- (NSNumber)electronicTollCollectionAvailable
{
  if (([(CARSession *)self sessionStatusOptions] & 2) != 0)
  {
    id v4 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F21070]];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = [v4 valueForKey:*MEMORY[0x1E4F21598]];
      id v7 = v6;
      if (v6)
      {
        id v3 = [v6 valueForKey:@"active"];
      }
      else
      {
        id v3 = 0;
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return (NSNumber *)v3;
}

- (void)_handleOpenURL:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSession *)self observers];
  [v5 session:self openURL:v4];
}

- (void)_handleSiriRequestEvent:(int64_t)a3 withPayload:(id)a4
{
  id v6 = a4;
  id v7 = [(CARSession *)self observers];
  [v7 session:self handleSiriRequestEvent:a3 withPayload:v6];

  id v8 = [(CARSession *)self observers];
  [v8 session:self handleSiriRequestEvent:a3];
}

- (void)_handleViewAreaChangeWithPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"uuid"];
  id v6 = @"viewAreaIndex";
  id v7 = [v4 objectForKey:@"viewAreaIndex"];

  if (v7
    || (id v6 = @"viewArea",
        [v4 objectForKey:@"viewArea"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v9 = [v4 objectForKey:v6];
    id v8 = (void *)[v9 unsignedIntegerValue];
  }
  id v10 = [v4 objectForKey:@"animationDurationMillis"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [(CARSession *)self configuration];
  id v14 = [v13 screenInfoForScreenID:v5];

  id v15 = [v14 viewAreas];
  unint64_t v16 = [v15 count];

  if ((unint64_t)v8 >= v16)
  {
    id v17 = CarGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CARSession _handleViewAreaChangeWithPayload:]((uint64_t)v8);
    }

    id v8 = 0;
  }
  id v18 = [v14 viewAreas];
  unint64_t v19 = [v18 count];

  if ((unint64_t)v8 >= v19)
  {
    uint64_t v21 = CarGeneralLogging();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CARSession _handleViewAreaChangeWithPayload:]((uint64_t)v8);
    }
  }
  else
  {
    v20 = [v14 viewAreas];
    uint64_t v21 = [v20 objectAtIndex:v8];

    v22 = [v14 viewAreas];
    uint64_t v23 = _adjacentViewAreaForPayload(v4, v22);

    [v14 setAdjacentViewArea:v23];
    [(CARSession *)self _updateScreenInfo:v14 currentViewAreaToViewArea:v21 duration:_transitionControlTypeForViewAreaChange(v21, v23) transitionControlType:v12 / 1000.0];
  }
}

- (void)requestAdjacentViewAreaForScreenID:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSession *)self configuration];
  id v6 = [v5 screenInfoForScreenID:v4];

  id v7 = [v6 adjacentViewArea];
  if (v7)
  {
    id v8 = [v6 viewAreas];
    uint64_t v9 = [v8 indexOfObject:v7];

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__CARSession_requestAdjacentViewAreaForScreenID___block_invoke;
      v10[3] = &unk_1E5E3C040;
      id v11 = v4;
      uint64_t v12 = v9;
      [(CARSession *)self _performExtendedEndpointAction:v10];
    }
  }
}

uint64_t __49__CARSession_requestAdjacentViewAreaForScreenID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 112);
  if (v10)
  {
    return v10(a2, v3, v4);
  }
  return result;
}

- (void)_updateScreenInfo:(id)a3 currentViewAreaToViewArea:(id)a4 duration:(double)a5 transitionControlType:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  [v11 setCurrentViewArea:v10];
  [v11 setCurrentViewAreaTransitionControlType:a6];
  id v13 = [(CARSession *)self observers];
  uint64_t v12 = [v11 identifier];

  [v13 session:self didSetViewArea:v10 forScreenID:v12 withDuration:a6 transitionControlType:a5];
}

- (void)_handleShowUIWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"uuid"];
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v7 = [v4 objectForKey:@"url"];

  uint64_t v8 = [v6 URLWithString:v7];

  uint64_t v9 = [(CARSession *)self configuration];
  id v10 = [v9 screens];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__CARSession__handleShowUIWithParameters___block_invoke;
  v13[3] = &unk_1E5E3BDC8;
  id v14 = v5;
  id v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v5;
  [v10 enumerateObjectsUsingBlock:v13];
}

void __42__CARSession__handleShowUIWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) observers];
    [v5 session:*(void *)(a1 + 40) showUIForScreenInfo:v6 withURL:*(void *)(a1 + 48)];
  }
}

- (void)_handleStopUIWithParameters:(id)a3
{
  int v4 = [a3 objectForKeyedSubscript:@"uuid"];
  id v5 = [(CARSession *)self configuration];
  id v6 = [v5 screens];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CARSession__handleStopUIWithParameters___block_invoke;
  v8[3] = &unk_1E5E3C068;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

void __42__CARSession__handleStopUIWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 identifier];
  int v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) observers];
    [v5 session:*(void *)(a1 + 40) stopUIForScreenInfo:v6];
  }
}

- (void)_handleDisplayPanelsUpdateWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Received display panels update", buf, 2u);
  }

  id v6 = [v4 objectForKey:@"displayPanels"];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke;
  v7[3] = &unk_1E5E3B3E8;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKey:@"videoStreams"];
  id v5 = [v3 objectForKey:@"uid"];

  id v6 = [*(id *)(a1 + 32) configuration];
  id v7 = [v6 displays];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_2;
  v13[3] = &unk_1E5E3B460;
  id v14 = v5;
  id v8 = v5;
  id v9 = objc_msgSend(v7, "bs_firstObjectPassingTest:", v13);

  [v9 updateStreams:v4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_3;
  v11[3] = &unk_1E5E3C090;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v9;
  id v10 = v9;
  [v4 enumerateObjectsUsingBlock:v11];
}

uint64_t __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __55__CARSession__handleDisplayPanelsUpdateWithParameters___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 configuration];
  id v6 = [v4 objectForKey:@"uuid"];

  id v12 = [v5 screenInfoForScreenID:v6];

  id v7 = v12;
  if (v12)
  {
    [v12 setPhysicalDisplay:*(void *)(a1 + 40)];
    id v8 = [v12 currentViewArea];
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) observers];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [v12 identifier];
      [v9 session:v10 didSetViewArea:v8 forScreenID:v11 withDuration:0 transitionControlType:0.0];
    }
    id v7 = v12;
  }
}

- (void)requestCarUI
{
}

- (void)requestCarUIForURL:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __33__CARSession_requestCarUIForURL___block_invoke;
  v6[3] = &unk_1E5E3C0B8;
  id v7 = v4;
  id v5 = v4;
  [(CARSession *)self _performExtendedEndpointAction:v6];
}

uint64_t __33__CARSession_requestCarUIForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = *(uint64_t (**)(uint64_t, void, uint64_t))(v8 + 8);
  if (v9)
  {
    return v9(a2, 0, v3);
  }
  return result;
}

- (void)setSiriForwardingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"disabled";
    if (v3) {
      uint64_t v6 = @"enabled";
    }
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Setting test Siri forwarding %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = (void *)MEMORY[0x1E4F1CFD0];
  if (!v3) {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CFC8];
  }
  [(CARSession *)self _setEndpointValue:*v7 forKey:*MEMORY[0x1E4F20CE8]];
}

- (BOOL)carOwnsScreen
{
  v2 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20D40]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)carOwnsMainAudio
{
  v2 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20D38]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)navigationOwner
{
  char v3 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F210A0]];
  char v4 = [v3 BOOLValue];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20D28]];
  int v7 = [v6 BOOLValue];

  if (v7) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)lastNavigatingBundleIdentifier
{
  v2 = [[CARNavigationOwnershipManager alloc] initWithIdentifier:0 delegate:0];
  char v3 = [(CARNavigationOwnershipManager *)v2 lastNavigatingBundleIdentifier];

  return v3;
}

- (void)requestTurnByTurnOwnership
{
}

- (void)releaseTurnByTurnOwnership
{
}

- (BOOL)recognizingSpeech
{
  v2 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20D30]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[CARSessionScreenBorrowToken alloc] initWithSession:self client:v7 reason:v6];

  return v8;
}

- (void)unborrowScreenForToken:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 unborrowToken];
  }
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CARSession_takeScreenForClient_reason___block_invoke;
  v10[3] = &unk_1E5E3BF78;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CARSession *)self _performExtendedEndpointAction:v10];
}

uint64_t __41__CARSession_takeScreenForClient_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v8 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v7 = v8;
  if (v8) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  if (v10)
  {
    return v10(a2, v3, v4);
  }
  return result;
}

- (void)takeScreenForConnection
{
}

uint64_t __37__CARSession_takeScreenForConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v6 = *(void *)(VTable + 24);
  uint64_t result = VTable + 24;
  uint64_t v5 = v6;
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t, __CFString *, __CFString *))(v7 + 32);
  if (v8)
  {
    return v8(a2, @"com.apple.CarPlayApp", @"InitialCarPlayConnection");
  }
  return result;
}

- (CARInputDeviceManager)inputDeviceManager
{
  inputDeviceManager = self->_inputDeviceManager;
  if (!inputDeviceManager)
  {
    uint64_t v4 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F20E10]];
    uint64_t v5 = [(CARSession *)self configuration];
    uint64_t v6 = [v5 screenIDs];

    uint64_t v7 = [(CARSession *)self _endpointValueForKey:*MEMORY[0x1E4F21070]];
    uint64_t v8 = [[CARInputDeviceManager alloc] initWithEndpointInputDevices:v4 screenIDs:v6 vehicleInformation:v7 session:self];
    uint64_t v9 = self->_inputDeviceManager;
    self->_inputDeviceManager = v8;

    inputDeviceManager = self->_inputDeviceManager;
  }
  return inputDeviceManager;
}

- (void)setInputMode:(unint64_t)a3 forInputDevice:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__CARSession_setInputMode_forInputDevice___block_invoke;
  v8[3] = &unk_1E5E3C040;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  [(CARSession *)self _performExtendedEndpointAction:v8];
}

void __42__CARSession_setInputMode_forInputDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) UUID];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 24);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = *(void (**)(uint64_t, id, uint64_t))(v6 + 56);
  if (v7) {
    v7(a2, v8, v4);
  }
}

- (void)suggestUI:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([(CARSession *)self sessionStatusOptions] & 2) != 0)
  {
    id v14 = CarGeneralLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CARSession suggestUI:]();
    }
  }
  else
  {
    uint64_t v5 = [(CARSession *)self configuration];
    uint64_t v6 = [v5 screens];
    unint64_t v7 = [v6 count];

    id v8 = CarGeneralLogging();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 < 2)
    {
      if (v9)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v4;
        _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring suggestUI with urls = %@", buf, 0xCu);
      }
    }
    else
    {
      if (v9)
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v4;
        _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "suggestUI with urls = %{public}@", buf, 0xCu);
      }

      unint64_t v10 = [(CARSession *)self clusterSessionURLs];

      if (v10)
      {
        id v11 = [(CARSession *)self configuration];
        id v12 = [v11 altScreenSuggestUIURLs];

        id v13 = [(CARSession *)self clusterSessionURLs];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __24__CARSession_suggestUI___block_invoke;
        v19[3] = &unk_1E5E3C170;
        v19[4] = self;
        CARHandleSuggestUI(v4, v13, v12, v19);
      }
      else
      {
        id v15 = CarGeneralLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB00000, v15, OS_LOG_TYPE_DEFAULT, "Fetching new cluster URLS", buf, 2u);
        }

        id v16 = +[CARSessionStatus sessionUpdatesQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __24__CARSession_suggestUI___block_invoke_413;
        block[3] = &unk_1E5E3A800;
        block[4] = self;
        id v18 = v4;
        dispatch_async(v16, block);
      }
    }
  }
}

void __24__CARSession_suggestUI___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    [v2 sendCommand:@"suggestUI" withParameters:a2];
  }
  else
  {
    uint64_t v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __24__CARSession_suggestUI___block_invoke_cold_1();
    }
  }
}

void __24__CARSession_suggestUI___block_invoke_413(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  _DWORD v2[2] = __24__CARSession_suggestUI___block_invoke_2;
  v2[3] = &unk_1E5E3C198;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  CRFetchInstrumentClusterURLs(v2);
}

void __24__CARSession_suggestUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CARSession_suggestUI___block_invoke_3;
  block[3] = &unk_1E5E3A850;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __24__CARSession_suggestUI___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setClusterSessionURLs:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) configuration];
  id v3 = [v2 altScreenSuggestUIURLs];

  id v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) clusterSessionURLs];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __24__CARSession_suggestUI___block_invoke_4;
  v6[3] = &unk_1E5E3C170;
  void v6[4] = *(void *)(a1 + 32);
  CARHandleSuggestUI(v4, v5, v3, v6);
}

void __24__CARSession_suggestUI___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    [v2 sendCommand:@"suggestUI" withParameters:a2];
  }
  else
  {
    id v3 = CarGeneralLogging();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __24__CARSession_suggestUI___block_invoke_cold_1();
    }
  }
}

- (void)_clusterURLsUpdated:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Cluster URLs updated with userInfo: %{public}@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CARSession__clusterURLsUpdated___block_invoke;
  v7[3] = &unk_1E5E3A800;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __34__CARSession__clusterURLsUpdated___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKey:@"CARSessionUpdateClusterURLsKey"];
  id v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_418);

  id v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "Updating with URLs: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setClusterSessionURLs:v3];
}

uint64_t __34__CARSession__clusterURLsUpdated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CB10] URLWithString:a2];
}

- (BOOL)isPaired
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(CARSession *)self MFiCertificateSerialNumber];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__CARSession_isPaired__block_invoke;
  v7[3] = &unk_1E5E3AEA0;
  BOOL v9 = &v10;
  int v5 = v3;
  id v8 = v5;
  CRIsPairedWithCertificateSerialNumber(v4, v7);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v4) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

intptr_t __22__CARSession_isPaired__block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)sendCommand:(id)a3 withParameters:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(CARSession *)self endpoint])
  {
    id v8 = [(CARSession *)self endpoint];
    if (!v8 || (BOOL v9 = v8, FigEndpointExtendedGetClassID(), !CMBaseObjectIsMemberOfClass())) {
      BOOL v9 = 0;
    }
    uint64_t v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "sending command %@ %@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 24);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    char v13 = *(void (**)(OpaqueFigEndpoint *, id, id, void, void))(v12 + 72);
    if (v13) {
      v13(v9, v6, v7, 0, 0);
    }
  }
}

- (void)setCornerMaskImageData:(id)a3 forScreenInfo:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CARSession *)self configuration];
  BOOL v9 = [v8 screens];
  char v10 = [v9 containsObject:v7];

  if (v10)
  {
    uint64_t v11 = [v7 identifier];
    if ([v7 wantsCornerMasks])
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v13 = [v6 length];
      int v14 = CarGeneralLogging();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v23 = v11;
          __int16 v24 = 2048;
          uint64_t v25 = [v6 length];
          _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ requests corner masks - setting corner mask image data (length: %lu)", buf, 0x16u);
        }

        [v12 setObject:v6 forKeyedSubscript:v11];
      }
      else
      {
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v11;
          _os_log_impl(&dword_1ABB00000, v14, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ requests corner masks but nil data specified. Sending NSNull", buf, 0xCu);
        }

        uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
        [v12 setObject:v18 forKeyedSubscript:v11];
      }
      uint64_t v17 = [v12 copy];
    }
    else
    {
      __int16 v16 = CarGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v11;
        _os_log_impl(&dword_1ABB00000, v16, OS_LOG_TYPE_DEFAULT, "Screen %{public}@ does not request corner masks. Sending NSNull", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E4F1CA98], "null", v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v21 = v12;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    unint64_t v19 = (void *)v17;
    [(CARSession *)self _setEndpointValue:v17 forKey:*MEMORY[0x1E4F20DA0]];
  }
  else
  {
    uint64_t v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CARSession setCornerMaskImageData:forScreenInfo:](v7, v11);
    }
  }
}

- (CARSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setInputDeviceManager:(id)a3
{
}

- (int64_t)voiceTriggerMode
{
  return self->_voiceTriggerMode;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (NSData)MFiCertificateSerialNumber
{
  return self->_MFiCertificateSerialNumber;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (NSNumber)systemNightMode
{
  return self->_systemNightMode;
}

- (void)setSystemNightMode:(id)a3
{
}

- (NSNumber)fallbackNightMode
{
  return self->_fallbackNightMode;
}

- (void)setFallbackNightMode:(id)a3
{
}

- (int)nightFallbackNotifyToken
{
  return self->_nightFallbackNotifyToken;
}

- (void)setNightFallbackNotifyToken:(int)a3
{
  self->_nightFallbackNotifyToken = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)sessionStatusOptions
{
  return self->_sessionStatusOptions;
}

- (OS_dispatch_queue)clusterURLUpdateQueue
{
  return self->_clusterURLUpdateQueue;
}

- (void)setClusterURLUpdateQueue:(id)a3
{
}

- (CARAppearanceManager)appearanceManager
{
  return self->_appearanceManager;
}

- (void)setAppearanceManager:(id)a3
{
}

- (NSArray)clusterSessionURLs
{
  return self->_clusterSessionURLs;
}

- (void)setClusterSessionURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSessionURLs, 0);
  objc_storeStrong((id *)&self->_appearanceManager, 0);
  objc_storeStrong((id *)&self->_clusterURLUpdateQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fallbackNightMode, 0);
  objc_storeStrong((id *)&self->_systemNightMode, 0);
  objc_storeStrong((id *)&self->_MFiCertificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_inputDeviceManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)_siriRequestEventForEndpointAction:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Invalid Siri Request Event: %@", v2, v3, v4, v5, v6);
}

- (void)_performExtendedEndpointAction:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "failed to get extended endpoint", v2, v3, v4, v5, v6);
}

- (void)_endpointValueForKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "no endpoint available, failed to get endpoint value for key %@", v2, v3, v4, v5, v6);
}

- (void)_endpointValueForKey:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_4(&dword_1ABB00000, v0, v1, "failed to get endpoint value for key %@, error: %i");
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_4(&dword_1ABB00000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, error: %d");
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.2()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_4(&dword_1ABB00000, v0, v1, "Unable to create remote control session, invalid configuration for channel uuid: %{public}@, error: %d");
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.3()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_4(&dword_1ABB00000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, channel already activated, error: %d");
}

- (void)createRemoteControlSession:channelID:withoutReply:qualityOfService:streamPriority:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ABB00000, v0, v1, "Unable to create remote control session for channel uuid: %{public}@, endpoint not activated", v2, v3, v4, v5, v6);
}

- (void)_handleAppearanceModeUpdateWithParameters:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "Unable to find screen for appearance mode update", v2, v3, v4, v5, v6);
}

- (void)_handleAppearanceModeUpdateWithParameters:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "Screen does not support appearance mode", v2, v3, v4, v5, v6);
}

- (void)_fetchFallbackIsNightWithToken:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSStringFromBOOL();
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_DEBUG, "Fetched night mode value: %{public}@", v4, 0xCu);
}

- (void)_fetchFallbackIsNightWithToken:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(&dword_1ABB00000, v0, v1, "Fetching fallback night mode value", v2, v3, v4, v5, v6);
}

- (void)_handleViewAreaChangeWithPayload:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1ABB00000, v2, v3, "Request for view area index %{public}@, which is out of range for screen %@", v4, v5, v6, v7, v8);
}

- (void)_handleViewAreaChangeWithPayload:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_9(&dword_1ABB00000, v2, v3, "Resetting to first view area for for view area index %{public}@, which is out of range for screen %@.", v4, v5, v6, v7, v8);
}

- (void)suggestUI:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "The CarPlay shell should not be sending suggest UIs", v2, v3, v4, v5, v6);
}

void __24__CARSession_suggestUI___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_1ABB00000, v0, v1, "No parameters returned from CARHandleSuggestUI", v2, v3, v4, v5, v6);
}

- (void)setCornerMaskImageData:(void *)a1 forScreenInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Ignoring corner mask image data for unknown screen ID: %{public}@", v4, 0xCu);
}

@end