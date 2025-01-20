@interface CRCarPlayAppPolicyEvaluator
+ (id)_carIntentIdentifiers;
+ (id)allIntentIdentifiers;
- (BOOL)_appWithDeclaration:(id)a3 supportsAllIntents:(id)a4;
- (BOOL)_appWithDeclaration:(id)a3 supportsAnyIntents:(id)a4;
- (BOOL)_checkIfDeclaration:(id)a3 supportsIntents:(id)a4 requireAllIntents:(BOOL)a5;
- (BOOL)_vehicleProtocolsIntersectAppProtocols:(id)a3 certificateSerial:(id)a4;
- (BOOL)evaluatorWantsGeoManagement;
- (BOOL)geo_queue_geoSupported;
- (BOOL)isGeoSupported;
- (CRCarPlayAppDenylist)denylist;
- (CRCarPlayAppPolicyEvaluator)init;
- (NSSet)lockedOrHiddenApps;
- (OS_dispatch_queue)geoQueue;
- (id)_vehicleProtocolsForCertificateSerial:(id)a3;
- (id)currentSession;
- (id)effectivePolicyForAppDeclaration:(id)a3;
- (id)effectivePolicyForAppDeclaration:(id)a3 inVehicleWithCertificateSerial:(id)a4;
- (unint64_t)_applicationCategoryForAppDeclaration:(id)a3 policy:(id)a4;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)fetchApplicationBundleIdentifiersForCarIntents:(id)a3;
- (void)setDenylist:(id)a3;
- (void)setEvaluatorWantsGeoManagement:(BOOL)a3;
- (void)setGeoQueue:(id)a3;
- (void)setGeoSupported:(BOOL)a3;
- (void)setGeo_queue_geoSupported:(BOOL)a3;
- (void)setLockedOrHiddenApps:(id)a3;
- (void)setWantsGeoSupported;
- (void)updateGeoSupported;
- (void)updateGeoSupportedWithCompletion:(id)a3;
@end

@implementation CRCarPlayAppPolicyEvaluator

+ (id)_carIntentIdentifiers
{
  v7[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F30218];
  v7[0] = *MEMORY[0x1E4F30210];
  v7[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F30238];
  v7[2] = *MEMORY[0x1E4F30220];
  v7[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F301F8];
  v7[4] = *MEMORY[0x1E4F30228];
  v7[5] = v4;
  v7[6] = *MEMORY[0x1E4F30230];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:7];
  return v5;
}

+ (id)allIntentIdentifiers
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F30248];
  v9[0] = *MEMORY[0x1E4F30250];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F30208];
  v9[2] = *MEMORY[0x1E4F30200];
  v9[3] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v6 = [a1 _carIntentIdentifiers];
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (CRCarPlayAppPolicyEvaluator)init
{
  v16.receiver = self;
  v16.super_class = (Class)CRCarPlayAppPolicyEvaluator;
  uint64_t v2 = [(CRCarPlayAppPolicyEvaluator *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(CRCarPlayAppDenylist);
    [(CRCarPlayAppPolicyEvaluator *)v2 setDenylist:v3];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__CRCarPlayAppPolicyEvaluator_init__block_invoke;
    block[3] = &unk_1E5E3A938;
    uint64_t v4 = v2;
    v15 = v4;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
    v5 = (void *)MEMORY[0x1E4F1CA80];
    v6 = [MEMORY[0x1E4F4B7E0] lockedAppBundleIdentifiers];
    v7 = [v5 setWithSet:v6];

    v8 = [MEMORY[0x1E4F4B7E0] hiddenAppBundleIdentifiers];
    [v7 unionSet:v8];

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v7];
    lockedOrHiddenApps = v4->_lockedOrHiddenApps;
    v4->_lockedOrHiddenApps = (NSSet *)v9;

    v11 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    id v12 = (id)[v11 addMonitor:v4 subjectMask:1 subscriptionOptions:1];
  }
  return v2;
}

void __35__CRCarPlayAppPolicyEvaluator_init__block_invoke()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v1 = (const void *)objc_opt_class();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v1, (CFNotificationCallback)CRCarPlayAppServicePolicyChangedHandler, @"com.apple.carkit.app.denylist-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setWantsGeoSupported
{
  if (![(CRCarPlayAppPolicyEvaluator *)self evaluatorWantsGeoManagement])
  {
    self->_evaluatorWantsGeoManagement = 1;
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.carplay.policy_geo_queue", v5);
    geoQueue = self->_geoQueue;
    self->_geoQueue = v3;

    [(CRCarPlayAppPolicyEvaluator *)self updateGeoSupported];
  }
}

- (void)updateGeoSupported
{
}

- (void)updateGeoSupportedWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CRCarPlayAppPolicyEvaluator *)self evaluatorWantsGeoManagement])
  {
    geoQueue = self->_geoQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__CRCarPlayAppPolicyEvaluator_updateGeoSupportedWithCompletion___block_invoke;
    v6[3] = &unk_1E5E3AC38;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(geoQueue, v6);
  }
}

void __64__CRCarPlayAppPolicyEvaluator_updateGeoSupportedWithCompletion___block_invoke(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F64500] sharedConfiguration];
  uint64_t v2 = [v4 currentCountrySupportsCarIntegration];
  *(unsigned char *)(*(void *)(a1 + 32) + 17) = v2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  }
}

- (BOOL)isGeoSupported
{
  if ([(CRCarPlayAppPolicyEvaluator *)self evaluatorWantsGeoManagement])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    geoQueue = self->_geoQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__CRCarPlayAppPolicyEvaluator_isGeoSupported__block_invoke;
    v6[3] = &unk_1E5E3B8B0;
    v6[4] = self;
    void v6[5] = &v7;
    dispatch_sync(geoQueue, v6);
    int geoSupported = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    int geoSupported = self->_geoSupported;
  }
  return geoSupported != 0;
}

uint64_t __45__CRCarPlayAppPolicyEvaluator_isGeoSupported__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 17);
  return result;
}

- (id)currentSession
{
  sessionStatus = self->_sessionStatus;
  if (!sessionStatus)
  {
    id v4 = objc_alloc_init(CARSessionStatus);
    v5 = self->_sessionStatus;
    self->_sessionStatus = v4;

    sessionStatus = self->_sessionStatus;
  }
  [(CARSessionStatus *)sessionStatus waitForSessionInitialization];
  v6 = self->_sessionStatus;
  return [(CARSessionStatus *)v6 currentSession];
}

- (id)_vehicleProtocolsForCertificateSerial:(id)a3
{
  id v4 = a3;
  if (v4
    || ([(CRCarPlayAppPolicyEvaluator *)self currentSession],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 MFiCertificateSerialNumber],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    v6 = +[CRVehicleAccessoryManager sharedInstance];
    uint64_t v7 = [v6 vehicleAccessoryForCertificateSerial:v4];
    v8 = v7;
    if (v7)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      char v10 = [v7 accessoryProtocols];
      v11 = [v9 setWithArray:v10];
    }
    else
    {
      char v10 = objc_alloc_init(CRPairedVehicleManager);
      id v12 = [(CRPairedVehicleManager *)v10 vehicleForCertificateSerial:v4];
      v13 = v12;
      if (v12)
      {
        v11 = [v12 accessoryProtocols];
      }
      else
      {
        v11 = 0;
      }
    }
    id v14 = v11;
  }
  else
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[CRCarPlayAppPolicyEvaluator _vehicleProtocolsForCertificateSerial:](v4);
    }
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_vehicleProtocolsIntersectAppProtocols:(id)a3 certificateSerial:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "Received app automaker protocols %{public}@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v9 = [(CRCarPlayAppPolicyEvaluator *)self _vehicleProtocolsForCertificateSerial:v7];

  char v10 = CarGeneralLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v9;
    _os_log_impl(&dword_1ABB00000, v10, OS_LOG_TYPE_DEFAULT, "Received session automaker protocols %{public}@", (uint8_t *)&v13, 0xCu);
  }

  if (v9) {
    char v11 = [v6 intersectsSet:v9];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_checkIfDeclaration:(id)a3 supportsIntents:(id)a4 requireAllIntents:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  char v10 = [v7 bundleIdentifier];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  char v11 = (void *)getLSApplicationRecordClass_softClass;
  uint64_t v35 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __getLSApplicationRecordClass_block_invoke;
    v31[3] = &unk_1E5E3B130;
    v31[4] = &v32;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v31);
    char v11 = (void *)v33[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v32, 8);
  id v26 = 0;
  int v13 = (void *)[[v12 alloc] initWithBundleIdentifier:v10 allowPlaceholder:0 error:&v26];
  id v14 = v26;
  if (!v13)
  {
    v17 = CarGeneralLogging();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CRCarPlayAppPolicyEvaluator _checkIfDeclaration:supportsIntents:requireAllIntents:]((uint64_t)v10, (uint64_t)v14, v17);
    }
    goto LABEL_15;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v16 = [v13 supportedIntents];
  v17 = [v15 setWithArray:v16];

  if (![v17 count]
    || (!v5 ? (char v18 = [v9 intersectsSet:v17]) : (char v18 = objc_msgSend(v9, "isSubsetOfSet:", v17)),
        (v18 & 1) == 0))
  {
    v20 = [v13 applicationExtensionRecords];
    if ([v20 count])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__CRCarPlayAppPolicyEvaluator__checkIfDeclaration_supportsIntents_requireAllIntents___block_invoke;
      v22[3] = &unk_1E5E3B8D8;
      BOOL v25 = v5;
      v24 = &v27;
      id v23 = v9;
      [v20 enumerateObjectsUsingBlock:v22];
    }
LABEL_15:

    BOOL v19 = *((unsigned char *)v28 + 24) != 0;
    goto LABEL_16;
  }

  BOOL v19 = 1;
LABEL_16:

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __85__CRCarPlayAppPolicyEvaluator__checkIfDeclaration_supportsIntents_requireAllIntents___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [a2 supportedIntents];
  id v9 = [v5 setWithArray:v6];

  id v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    char v8 = [v7 isSubsetOfSet:v9];
  }
  else {
    char v8 = [v7 intersectsSet:v9];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)_appWithDeclaration:(id)a3 supportsAllIntents:(id)a4
{
  return [(CRCarPlayAppPolicyEvaluator *)self _checkIfDeclaration:a3 supportsIntents:a4 requireAllIntents:1];
}

- (BOOL)_appWithDeclaration:(id)a3 supportsAnyIntents:(id)a4
{
  return [(CRCarPlayAppPolicyEvaluator *)self _checkIfDeclaration:a3 supportsIntents:a4 requireAllIntents:0];
}

- (unint64_t)_applicationCategoryForAppDeclaration:(id)a3 policy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 _applicationCategory];
  if (!v7)
  {
    if ([v6 launchUsingTemplateUI])
    {
      if ([v5 supportsAudio]) {
        goto LABEL_21;
      }
      if ([v5 supportsMaps])
      {
        unint64_t v7 = 8;
        goto LABEL_22;
      }
      if ([v5 supportsCalling])
      {
        unint64_t v7 = 4;
        goto LABEL_22;
      }
      if ([v5 supportsMessaging])
      {
        unint64_t v7 = 2;
        goto LABEL_22;
      }
      if ([v5 supportsCharging])
      {
        unint64_t v7 = 256;
        goto LABEL_22;
      }
      if ([v5 supportsParking])
      {
        unint64_t v7 = 512;
        goto LABEL_22;
      }
      if ([v5 supportsQuickOrdering])
      {
        unint64_t v7 = 128;
        goto LABEL_22;
      }
      if ([v5 supportsFueling])
      {
        unint64_t v7 = 2048;
        goto LABEL_22;
      }
      if ([v5 supportsDrivingTask])
      {
        unint64_t v7 = 4096;
        goto LABEL_22;
      }
    }
    if (([v6 launchUsingMusicUIService] & 1) == 0) {
      goto LABEL_22;
    }
LABEL_21:
    unint64_t v7 = 16;
  }
LABEL_22:

  return v7;
}

- (id)effectivePolicyForAppDeclaration:(id)a3
{
  return [(CRCarPlayAppPolicyEvaluator *)self effectivePolicyForAppDeclaration:a3 inVehicleWithCertificateSerial:0];
}

- (id)effectivePolicyForAppDeclaration:(id)a3 inVehicleWithCertificateSerial:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(CRCarPlayAppPolicy);
  if (v6)
  {
    id v9 = [(CRCarPlayAppPolicyEvaluator *)self denylist];
    char v10 = [v6 bundleIdentifier];
    char v11 = [v9 containsBundleIdentifier:v10];

    if ((v11 & 1) == 0)
    {
      int v12 = [v6 launchUsingSiri];
      int v63 = [v6 launchNotificationsUsingSiri];
      unsigned int v13 = [v6 supportsTemplates];
      int v14 = [v6 isSystemApp];
      unsigned int v60 = v13;
      int v62 = v12;
      if (v14)
      {
        if ([v6 requiresGeoSupport]) {
          BOOL v15 = [(CRCarPlayAppPolicyEvaluator *)self isGeoSupported];
        }
        else {
          BOOL v15 = 1;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
      int v16 = [v6 supportsPlayableContent];
      v61 = [v6 autoMakerProtocols];
      int v17 = v14 | v16;
      int v18 = v16 | v15;
      if (v61
        && [(CRCarPlayAppPolicyEvaluator *)self _vehicleProtocolsIntersectAppProtocols:v61 certificateSerial:v7])
      {
        BOOL v19 = +[CRCarPlayAppPolicyEvaluator _carIntentIdentifiers];
        BOOL v59 = [(CRCarPlayAppPolicyEvaluator *)self _appWithDeclaration:v6 supportsAnyIntents:v19];

        int v17 = 1;
        int v18 = 1;
        BOOL v15 = 1;
      }
      else
      {
        BOOL v59 = 0;
      }
      int v20 = [v6 supportsPublicSafety];
      unsigned int v66 = v20 | v17;
      int v21 = v20 | v18;
      uint64_t v22 = v20 | v15;
      if (([v6 supportsMessaging] & 1) != 0 || objc_msgSend(v6, "supportsCommunication"))
      {
        uint64_t v23 = *MEMORY[0x1E4F30208];
        v76[0] = *MEMORY[0x1E4F30200];
        v76[1] = v23;
        v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
        BOOL v25 = [(CRCarPlayAppPolicyEvaluator *)self _appWithDeclaration:v6 supportsAllIntents:v24];

        unsigned int v65 = v22;
        if (v25)
        {
          uint64_t v22 = [v6 supportsTemplates];
          unsigned int v65 = 1;
          unsigned int v66 = 1;
          int v21 = 1;
          int v62 = [v6 supportsTemplates] ^ 1;
          int v63 = 1;
        }
      }
      else
      {
        unsigned int v65 = v22;
      }
      if (([v6 supportsCalling] & 1) != 0 || objc_msgSend(v6, "supportsCommunication"))
      {
        uint64_t v26 = *MEMORY[0x1E4F30248];
        v75[0] = *MEMORY[0x1E4F30250];
        v75[1] = v26;
        uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
        BOOL v28 = [(CRCarPlayAppPolicyEvaluator *)self _appWithDeclaration:v6 supportsAnyIntents:v27];

        if (v28)
        {
          uint64_t v22 = [v6 supportsTemplates];
          unsigned int v65 = 1;
          unsigned int v66 = 1;
          int v21 = 1;
          int v62 = [v6 supportsTemplates] ^ 1;
          int v63 = 1;
        }
      }
      if (([v6 supportsMaps] & 1) != 0
        || ([v6 supportsAudio] & 1) != 0
        || ([v6 supportsCharging] & 1) != 0
        || ([v6 supportsParking] & 1) != 0
        || ([v6 supportsQuickOrdering] & 1) != 0
        || ([v6 supportsFueling] & 1) != 0
        || [v6 supportsDrivingTask])
      {
        unsigned int v66 = 1;
        int v21 = 1;
        uint64_t v22 = 1;
      }
      if (([v6 supportsParking] & 1) != 0
        || (int v29 = [v6 supportsCharging], v30 = v65, v29))
      {
        int v63 = 0;
        int v30 = 1;
      }
      unsigned int v58 = v30;
      v31 = [v6 bundleIdentifier];
      if ([v31 isEqualToString:@"com.apple.Home"])
      {
      }
      else
      {
        uint64_t v32 = [v6 bundleIdentifier];
        int v33 = [v32 isEqualToString:@"com.apple.shortcuts"];

        if (!v33)
        {
          int v34 = 0;
LABEL_37:
          uint64_t v35 = [v6 bundleIdentifier];
          int v36 = [v35 isEqualToString:@"com.apple.mobilephone"];

          v37 = [v6 bundleIdentifier];
          char v38 = [v37 isEqualToString:@"com.apple.MobileSMS"];

          if (v38)
          {
            unsigned int v60 = 1;
            unsigned int v64 = 0;
            unsigned int v65 = 1;
            unsigned int v57 = 1;
            uint64_t v22 = 1;
            int v21 = 1;
            unsigned int v66 = 1;
          }
          else
          {
            int v39 = (v36 ^ 1) & (v34 | v63);
            unsigned int v64 = (v36 ^ 1) & v62;
            unsigned int v57 = v39;
            if ((v21 | v22) != 1)
            {
              uint64_t v22 = 0;
              goto LABEL_54;
            }
          }
          lockedOrHiddenApps = self->_lockedOrHiddenApps;
          v41 = [v6 bundleIdentifier];
          BOOL v42 = [(NSSet *)lockedOrHiddenApps containsObject:v41];

          if (v42)
          {
            v43 = CarGeneralLogging();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              v44 = [v6 bundleIdentifier];
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v44;
              _os_log_impl(&dword_1ABB00000, v43, OS_LOG_TYPE_DEFAULT, "Application locked by policy: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            uint64_t v22 = 0;
            v45 = 0;
LABEL_57:

            BOOL v52 = !v42;
            goto LABEL_58;
          }
          if (v21)
          {
            v43 = [v6 bundleIdentifier];
            uint64_t v67 = 0;
            v68 = &v67;
            uint64_t v69 = 0x2020000000;
            v46 = (void **)getkAssistantDirectActionEventKeySymbolLoc_ptr;
            uint64_t v70 = getkAssistantDirectActionEventKeySymbolLoc_ptr;
            if (!getkAssistantDirectActionEventKeySymbolLoc_ptr)
            {
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v78 = __getkAssistantDirectActionEventKeySymbolLoc_block_invoke;
              v79 = &unk_1E5E3B130;
              v80 = &v67;
              __getkAssistantDirectActionEventKeySymbolLoc_block_invoke((uint64_t)&buf);
              v46 = (void **)v68[3];
            }
            _Block_object_dispose(&v67, 8);
            if (!v46)
            {
              -[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:]();
              __break(1u);
            }
            v47 = *v46;
            if (v47) {
              unsigned int v48 = v64;
            }
            else {
              unsigned int v48 = 0;
            }
            if (v48 == 1)
            {
              v74[0] = v43;
              v73[0] = @"__bundleId";
              v73[1] = @"__supportsCarFullScreen";
              v49 = NSNumber;
              id v50 = v47;
              v51 = [v49 numberWithBool:v22];
              v74[1] = v51;
              v73[2] = v50;
              v74[2] = &unk_1F0318110;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
            }
            else
            {
              v71[1] = @"__supportsCarFullScreen";
              v72[0] = v43;
              v71[0] = @"__bundleId";
              v53 = NSNumber;
              id v54 = v47;
              v51 = [v53 numberWithBool:v22];
              v72[1] = v51;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:v71 count:2];
            v45 = };

            goto LABEL_57;
          }
LABEL_54:
          BOOL v52 = 0;
          v45 = 0;
LABEL_58:
          [(CRCarPlayAppPolicy *)v8 setCarPlayCapable:v66];
          [(CRCarPlayAppPolicy *)v8 setCarPlaySupported:v52];
          [(CRCarPlayAppPolicy *)v8 setCanDisplayOnCarScreen:v22];
          [(CRCarPlayAppPolicy *)v8 setLaunchUsingSiri:v64];
          [(CRCarPlayAppPolicy *)v8 setLaunchNotificationsUsingSiri:v57];
          [(CRCarPlayAppPolicy *)v8 setSiriActivationOptions:v45];
          if (v22) {
            uint64_t v55 = 0;
          }
          else {
            uint64_t v55 = [v6 supportsPlayableContent];
          }
          [(CRCarPlayAppPolicy *)v8 setLaunchUsingMusicUIService:v55];
          [(CRCarPlayAppPolicy *)v8 setBadgesAppIcon:v65];
          [(CRCarPlayAppPolicy *)v8 setShowsNotifications:v58];
          [(CRCarPlayAppPolicy *)v8 setHandlesCarIntents:v59];
          [(CRCarPlayAppPolicy *)v8 setLaunchUsingTemplateUI:v60];
          [(CRCarPlayAppPolicy *)v8 setApplicationCategory:[(CRCarPlayAppPolicyEvaluator *)self _applicationCategoryForAppDeclaration:v6 policy:v8]];

          goto LABEL_62;
        }
      }
      int v62 = 0;
      int v34 = 1;
      goto LABEL_37;
    }
  }
LABEL_62:

  return v8;
}

- (void)fetchApplicationBundleIdentifiersForCarIntents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28C70];
  id v6 = +[CRCarPlayAppPolicyEvaluator _carIntentIdentifiers];
  id v7 = objc_msgSend(v5, "_intents_extensionMatchingAttributesForIntents:", v6);

  char v8 = (void *)MEMORY[0x1E4F28C70];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__CRCarPlayAppPolicyEvaluator_fetchApplicationBundleIdentifiersForCarIntents___block_invoke;
  v10[3] = &unk_1E5E3B900;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 extensionsWithMatchingAttributes:v7 completion:v10];
}

void __78__CRCarPlayAppPolicyEvaluator_fetchApplicationBundleIdentifiersForCarIntents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v27 = v6;
    int v30 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v28 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    uint64_t v10 = a1;
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v32;
      unint64_t v13 = 0x1E4F22000uLL;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v8);
          }
          BOOL v15 = [*(id *)(*((void *)&v31 + 1) + 8 * i) _plugIn];
          int v16 = [v15 containingUrl];

          if (v16)
          {
            int v17 = [*(id *)(v13 + 952) applicationProxyForBundleURL:v16];
            if (v17)
            {
              int v18 = +[CRCarPlayAppDeclaration declarationForAppProxy:v17];
              BOOL v19 = [v18 autoMakerProtocols];
              if (v19
                && [*(id *)(v10 + 32) _vehicleProtocolsIntersectAppProtocols:v19 certificateSerial:0])
              {
                [v18 bundleIdentifier];
                id v20 = v8;
                unint64_t v21 = v13;
                uint64_t v23 = v22 = v10;
                [v30 addObject:v23];

                uint64_t v10 = v22;
                unint64_t v13 = v21;
                id v8 = v20;
                uint64_t v12 = v29;
              }
            }
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v11);
    }

    v24 = CarGeneralLogging();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      int v36 = v30;
      _os_log_impl(&dword_1ABB00000, v24, OS_LOG_TYPE_INFO, "car intents applications: %@", buf, 0xCu);
    }

    uint64_t v25 = *(void *)(v10 + 40);
    id v7 = v27;
    if (v25) {
      (*(void (**)(uint64_t, void *, void))(v25 + 16))(v25, v30, 0);
    }

    id v5 = v28;
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 40);
    if (v26) {
      (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v7);
    }
  }
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = objc_msgSend(MEMORY[0x1E4F4B7E0], "lockedAppBundleIdentifiers", a3, a4);
  id v10 = [v5 setWithSet:v6];

  id v7 = [MEMORY[0x1E4F4B7E0] hiddenAppBundleIdentifiers];
  [v10 unionSet:v7];

  id v8 = [MEMORY[0x1E4F1CAD0] setWithSet:v10];
  lockedOrHiddenApps = self->_lockedOrHiddenApps;
  self->_lockedOrHiddenApps = v8;
}

- (void)setGeoSupported:(BOOL)a3
{
  self->_int geoSupported = a3;
}

- (CRCarPlayAppDenylist)denylist
{
  return self->_denylist;
}

- (void)setDenylist:(id)a3
{
}

- (OS_dispatch_queue)geoQueue
{
  return self->_geoQueue;
}

- (void)setGeoQueue:(id)a3
{
}

- (BOOL)geo_queue_geoSupported
{
  return self->_geo_queue_geoSupported;
}

- (void)setGeo_queue_geoSupported:(BOOL)a3
{
  self->_geo_queue_int geoSupported = a3;
}

- (BOOL)evaluatorWantsGeoManagement
{
  return self->_evaluatorWantsGeoManagement;
}

- (void)setEvaluatorWantsGeoManagement:(BOOL)a3
{
  self->_evaluatorWantsGeoManagement = a3;
}

- (NSSet)lockedOrHiddenApps
{
  return self->_lockedOrHiddenApps;
}

- (void)setLockedOrHiddenApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedOrHiddenApps, 0);
  objc_storeStrong((id *)&self->_geoQueue, 0);
  objc_storeStrong((id *)&self->_denylist, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

- (void)_vehicleProtocolsForCertificateSerial:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "No available certificate serial for this vehicle.", v1, 2u);
}

- (void)_checkIfDeclaration:(uint64_t)a1 supportsIntents:(uint64_t)a2 requireAllIntents:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "Failed to lookup app %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

- (uint64_t)effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:.cold.1()
{
  return __getLSApplicationRecordClass_block_invoke_cold_1();
}

@end