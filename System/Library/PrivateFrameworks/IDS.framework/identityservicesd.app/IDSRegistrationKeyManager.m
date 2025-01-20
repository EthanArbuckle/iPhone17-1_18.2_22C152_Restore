@interface IDSRegistrationKeyManager
+ (BOOL)setupKeys;
+ (id)sharedInstance;
- (BOOL)_generateUnregisteredIdentityWithExistingLegacyIdentity:(id)a3 existingNGMIdentity:(id)a4;
- (BOOL)_isSecurelyStoringIdentity:(id)a3 withExpectedProtectionClass:(int64_t)a4;
- (BOOL)_isUnderFirstDataProtectionLock;
- (BOOL)_loadClassAIdentityIfNeeded:(id *)a3;
- (BOOL)_loadClassCIdentityIfNeeded:(id *)a3;
- (BOOL)_loadClassDIdentityIfNeeded:(id *)a3;
- (BOOL)_migrateIdentity:(id)a3 toProtectionClass:(int64_t)a4;
- (BOOL)_migrateRegisteredIdentityFromClassDtoClassCIfNeeded;
- (BOOL)_save;
- (BOOL)_serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:(BOOL)a3;
- (BOOL)_serializeAndPersistIdentityContainer:(id)a3 identityIdentifier:(int64_t)a4 deleteIfNull:(BOOL)a5;
- (BOOL)_serializeAndPersistKTRegistrationDataDeleteIfNull:(BOOL)a3;
- (BOOL)_shouldCheckUnregisteredKTData;
- (BOOL)_shouldRegenerateRegisteredIdentity;
- (BOOL)allowPairingIdentities;
- (BOOL)allowRegenerateRegisteredIdentity;
- (BOOL)forceRoll;
- (BOOL)isMigratedKeyPairSignature;
- (BOOL)isUsingSecureStorageForClassA;
- (BOOL)isUsingSecureStorageForClassC;
- (BOOL)migrateToSecureStorageForClassA;
- (BOOL)migrateToSecureStorageForClassC;
- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3 ktRegistrationKeyIndex:(unsigned __int16)a4;
- (BOOL)registrationNeedsKTDataUpdated;
- (BOOL)requiresKeychainMigration;
- (IDSKTRegistrationDataManager)ktRegistrationDataManager;
- (IDSKeychainWrapper)keychainWrapper;
- (IDSRateLimiter)loadingRateLimiter;
- (IDSRegistrationKeyConfig)config;
- (IDSRegistrationKeyManager)init;
- (IDSRegistrationKeyManager)initWithSystemMonitor:(id)a3 keychainWrapper:(id)a4 loadingRateLimiter:(id)a5 identityDataSource:(id)a6 allowPairingIdentities:(BOOL)a7 allowRegenerateRegisteredIdentity:(BOOL)a8 keyPairProvider:(id)a9 ktRegistrationDataManager:(id)a10;
- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource;
- (IDSRegistrationKeyManagerKeyPairProvider)keyPairProvider;
- (IMSystemMonitor)systemMonitor;
- (_SecMPFullIdentity)copyMessageProtectionIdentity;
- (_SecMPFullIdentity)copyPreviousMessageProtectionIdentity;
- (_SecMPFullIdentity)latestCopyMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3;
- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4;
- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3;
- (__SecKey)identityPrivateKey;
- (__SecKey)identityPublicKey;
- (double)_generationRetryDelay;
- (double)_identityRegenerationDelay;
- (double)_notifyKTReregisterDelay;
- (double)_notifyRegenerateDelay;
- (double)_purgePreviousIdentityDelay;
- (double)_randomizedIdentityRegenerationInterval;
- (id)_generateIdentityWithExistingIdentity:(id)a3 identifier:(int64_t)a4 dataProtectionClass:(int64_t)a5;
- (id)_getPublicMessageProtectionDataForIdentity:(id)a3;
- (id)_loadAndDeserializeBuildOfIdentityGenerationForItemName:(id)a3;
- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4;
- (id)createKTRegistrationDataForServiceTypes:(id)a3 withPublicIdentity:(id)a4;
- (id)errorContainerToReport;
- (id)fetchRegistrationStatusProvider;
- (id)fullDeviceIdentityContainer;
- (id)fullDeviceIdentityContainerUsableForKeyType:(unint64_t)a3;
- (id)fullMessageProtectionIdentity;
- (id)fullMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3;
- (id)generateCSRForUserID:(id)a3;
- (id)keyPairSignature;
- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3;
- (id)kvsTrustedDevices;
- (id)latestMessageProtectionFullIdentityForDataProtectionClass:(unsigned int)a3;
- (id)previousFullDeviceIdentityContainer;
- (id)previousFullMessageProtectionIdentity;
- (id)publicMessageProtectionData;
- (id)publicMessageProtectionDataToRegisterForClassA;
- (id)publicMessageProtectionDataToRegisterForClassC;
- (id)publicMessageProtectionDataToRegisterForClassD;
- (id)publicMessageProtectionDeviceIdentityContainerToRegister:(id *)a3;
- (id)publicMessageProtectionIdentityDataToRegisterWithError:(id *)a3;
- (unint64_t)generationRetryCount;
- (void)_ensureIdentity:(id *)a3 savedIndentity:(id *)a4 protectionClass:(int64_t)a5 didSaveIdentity:(BOOL *)a6;
- (void)_generateKTRegistrationData:(id)a3;
- (void)_handleKVSUpdateResponseForTrustedDevices:(id)a3 withSuccessfulKVSSync:(BOOL)a4;
- (void)_handleTransparencySignatureResponse:(id)a3 error:(id)a4;
- (void)_handleTransparencySignatureResponseForRegistration:(id)a3 error:(id)a4;
- (void)_ktDataNeedsUpdate:(id)a3;
- (void)_loadIfNeeded:(BOOL)a3;
- (void)_notifyUnregisteredIdentityRegenerated;
- (void)_notifyUnregisteredKTData;
- (void)_purgePreviousIdentityFromMemoryAndKeychain;
- (void)_purgePreviousIdentityTimerFired;
- (void)_purgePreviousIdentityTimerFiredOnMain;
- (void)_regenerateIdentityTimerFired;
- (void)_regenerateIdentityTimerFiredOnMain;
- (void)_retryGenerationAfterDelay;
- (void)_retryGenerationIfNeeded;
- (void)_saveClassXIdentity:(id *)a3 savedIdentity:(id *)a4 protectionClass:(int64_t)a5 savedUnsavedIdentity:(BOOL *)a6;
- (void)_schedulePurgeOfPreviousIdentityAfterDelay:(double)a3;
- (void)_scheduleRegenerationOfRegisteredIdentityAfterDelay:(double)a3;
- (void)_serializeAndPersistBuildOfIdentityGeneration:(id)a3 itemName:(id)a4;
- (void)_subscribeForTimeChangeNotification;
- (void)_unsubscribeForTimeChangeNotification;
- (void)dealloc;
- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 withCompletion:(id)a5;
- (void)loadPairingIdentities:(BOOL)a3;
- (void)noteBuddyFinishTime;
- (void)noteDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4;
- (void)noteManateeAvailableTime;
- (void)notePublicIdentityDidRegisterLegacyData:(id)a3 ngmIdentityData:(id)a4 ngmPrekeyData:(id)a5 keyIndexToIdentityData:(id)a6;
- (void)noteiCloudSignInTime;
- (void)purgeMessageProtectionIdentity;
- (void)regeneratePairingIdentitiesIncludingClassD:(BOOL)a3;
- (void)regenerateRegisteredIdentity;
- (void)setAllowPairingIdentities:(BOOL)a3;
- (void)setAllowRegenerateRegisteredIdentity:(BOOL)a3;
- (void)setConfig:(id)a3;
- (void)setForceRoll:(BOOL)a3;
- (void)setGenerationRetryCount:(unint64_t)a3;
- (void)setIdentityDataSource:(id)a3;
- (void)setKeyPairProvider:(id)a3;
- (void)setKeychainWrapper:(id)a3;
- (void)setKtRegistrationDataManager:(id)a3;
- (void)setLoadingRateLimiter:(id)a3;
- (void)setSystemMonitor:(id)a3;
- (void)systemDidLeaveDataProtectionLock;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemRestoreStateDidChange;
- (void)updateKVSForKTRegistrationData;
@end

@implementation IDSRegistrationKeyManager

+ (id)sharedInstance
{
  if (qword_100A4A280 != -1) {
    dispatch_once(&qword_100A4A280, &stru_10097ED40);
  }
  v2 = (void *)qword_100A4A288;

  return v2;
}

+ (BOOL)setupKeys
{
  v2 = dispatch_get_global_queue(2, 0);
  dispatch_async(v2, &stru_10097ED60);

  return 1;
}

- (BOOL)_isUnderFirstDataProtectionLock
{
  v2 = [(IDSRegistrationKeyManager *)self systemMonitor];
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_detectedMigrationNeeded)
  {
    self->_detectedMigrationNeeded = 0;
    [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
    unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
    objc_msgSend(v3, "__mainThreadPostNotificationName:object:", @"__kIDSRegistrationKeyManagerKeychainMigrationComplete", 0);
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)systemDidLeaveDataProtectionLock
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_pendingIdentityRegeneration) {
    [(IDSRegistrationKeyManager *)self regeneratePairingIdentitiesIncludingClassD:1];
  }
  if (!self->_hasCheckedMigrationThisLaunch) {
    [(IDSRegistrationKeyManager *)self _migrateRegisteredIdentityFromClassDtoClassCIfNeeded];
  }
  [(IDSRegistrationKeyManager *)self loadPairingIdentities:1];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)systemRestoreStateDidChange
{
  unsigned __int8 v3 = +[IMSystemMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isSetup];

  if ((v4 & 1) == 0)
  {
    [(NSRecursiveLock *)self->_lock lock];
    [(IDSRegistrationKeyManager *)self noteBuddyFinishTime];
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
}

- (void)_saveClassXIdentity:(id *)a3 savedIdentity:(id *)a4 protectionClass:(int64_t)a5 savedUnsavedIdentity:(BOOL *)a6
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_detectedMigrationNeeded)
  {
    v11 = +[IMRGLog registration];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100709980();
    }
LABEL_25:

    goto LABEL_26;
  }
  if ((unint64_t)a5 > 2) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = qword_100793FD8[a5];
  }
  id v13 = *a4;
  if (*a4 || (id v13 = *a3) != 0)
  {
    id v14 = v13;
    v15 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v27 = 0;
    unsigned int v16 = [v15 saveLegacyIdentity:v14 withIdentifier:v12 dataProtectionClass:a5 error:&v27];
    v17 = v27;

    if (v16)
    {
      if (*a3)
      {
        objc_storeStrong(a4, *a3);
        id v18 = *a3;
        *a3 = 0;

        if (a6) {
          *a6 = 1;
        }
      }
      v11 = v17;
    }
    else
    {
      v19 = +[IMRGLog registration];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100709904((uint64_t)v17);
      }

      v20 = +[IMRGLog registration];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1007098D0();
      }

      v21 = [(IDSRegistrationKeyManager *)self identityDataSource];
      v26 = v17;
      unsigned int v22 = [v21 removeLegacyIdentity:0 withIdentifier:v12 dataProtectionClass:a5 error:&v26];
      v11 = v26;

      v23 = +[IMRGLog registration];
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v25 = +[IDSKeychainWrapper shortDescriptionForDataProtectionClass:a5];
          *(_DWORD *)buf = 138543618;
          v29 = v25;
          __int16 v30 = 2114;
          v31 = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Removed keychain data for class %{public}@ message protection identity {error: %{public}@}", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        sub_100709828(a5);
      }
    }
    goto LABEL_25;
  }
LABEL_26:
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)_save
{
  unsigned __int8 v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    v34 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving key manager state {self: %@}", (uint8_t *)&v33, 0xCu);
  }

  [(NSRecursiveLock *)self->_lock lock];
  if (self->_detectedMigrationNeeded)
  {
    unsigned __int8 v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100709A28();
    }
    LOBYTE(v5) = 1;
  }
  else
  {
    v6 = [(IDSRegistrationKeyManager *)self config];
    v7 = [v6 registeredIdentityContainer];
    unsigned int v8 = [(IDSRegistrationKeyManager *)self _serializeAndPersistIdentityContainer:v7 identityIdentifier:2 deleteIfNull:1];

    v9 = [(IDSRegistrationKeyManager *)self config];
    v10 = [v9 unregisteredIdentityContainer];
    unsigned int v11 = [(IDSRegistrationKeyManager *)self _serializeAndPersistIdentityContainer:v10 identityIdentifier:1 deleteIfNull:1];

    uint64_t v12 = [(IDSRegistrationKeyManager *)self config];
    id v13 = [(id)v12 previousRegisteredIdentityContainer];
    unsigned int v14 = [(IDSRegistrationKeyManager *)self _serializeAndPersistIdentityContainer:v13 identityIdentifier:3 deleteIfNull:1];

    LODWORD(v12) = [(IDSRegistrationKeyManager *)self _serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:1];
    BOOL v5 = [(IDSRegistrationKeyManager *)self _serializeAndPersistKTRegistrationDataDeleteIfNull:1] & v12 & v14 & v11 & v8;
    v15 = [(IDSRegistrationKeyManager *)self config];
    unsigned int v16 = [v15 buildOfIdentityGeneration];
    [(IDSRegistrationKeyManager *)self _serializeAndPersistBuildOfIdentityGeneration:v16 itemName:@"build-of-identity-generation"];

    unsigned __int8 v4 = [(IDSRegistrationKeyManager *)self config];
    v17 = [v4 buildOfUnregisteredIdentityGeneration];
    [(IDSRegistrationKeyManager *)self _serializeAndPersistBuildOfIdentityGeneration:v17 itemName:@"build-of-unregistered-identity-generation"];
  }
  id v18 = +[IMUserDefaults sharedDefaults];
  v19 = [(IDSRegistrationKeyManager *)self config];
  v20 = [v19 registeredIdentityContainer];
  v21 = +[NSNumber numberWithInt:v20 != 0];
  [v18 setAppValue:v21 forKey:@"hasRegIdentityContainer"];

  unsigned int v22 = +[IMUserDefaults sharedDefaults];
  v23 = [(IDSRegistrationKeyManager *)self config];
  v24 = [v23 unregisteredIdentityContainer];
  v25 = +[NSNumber numberWithInt:v24 != 0];
  [v22 setAppValue:v25 forKey:@"hasUnregIdentityContainer"];

  if (!v5)
  {
    unsigned int v26 = [(IDSRateLimiter *)self->_loadingRateLimiter underLimitForItem:@"registrationKeyManagerRateLimit"];
    id v27 = +[IMRGLog registration];
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1007099C0();
      }

      self->_identityLoaded = 0;
      v29 = [(IDSRegistrationKeyManager *)self config];
      [v29 setRegisteredIdentityContainer:0];

      __int16 v30 = [(IDSRegistrationKeyManager *)self config];
      [v30 setUnregisteredIdentityContainer:0];

      v31 = [(IDSRegistrationKeyManager *)self config];
      [v31 setPreviousRegisteredIdentityContainer:0];

      [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager clearIdentities];
    }
    else
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_1007099F4();
      }
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (BOOL)_serializeAndPersistApplicationKeyIdentitiesDeleteIfNull:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  LOBYTE(v3) = [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager serializeAndPersistIdentitiesDeleteIfNull:v3];
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)_serializeAndPersistKTRegistrationDataDeleteIfNull:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  LOBYTE(v3) = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager serializeAndPersistKTDatasDeleteIfNull:v3];
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (BOOL)_serializeAndPersistIdentityContainer:(id)a3 identityIdentifier:(int64_t)a4 deleteIfNull:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v8 = (__CFString *)a3;
  [(NSRecursiveLock *)self->_lock lock];
  v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 134218499;
    int64_t v30 = a4;
    if (v5) {
      CFStringRef v10 = @"YES";
    }
    __int16 v31 = 2113;
    int64_t v32 = (int64_t)v8;
    __int16 v33 = 2114;
    CFStringRef v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Persisting message protection identity container {identityIdentifier: %ld, identityContainer: %{private}@, deleteIfNull: %{public}@}", buf, 0x20u);
  }

  if (v8)
  {
    unsigned int v11 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v28 = 0;
    unsigned int v12 = [v11 saveIdentityContainer:v8 withIdentifier:a4 dataProtectionClass:0 error:&v28];
    id v13 = v28;

    unsigned int v14 = +[IMRGLog registration];
    v15 = v14;
    if (v12)
    {
      BOOL v16 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218243;
        int64_t v30 = a4;
        __int16 v31 = 2113;
        int64_t v32 = (int64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Persisted identity {identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543875;
        int64_t v30 = (int64_t)v13;
        __int16 v31 = 2048;
        int64_t v32 = a4;
        __int16 v33 = 2113;
        CFStringRef v34 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to save identity, possibly corrupted -- removing reference from keychain {error: %{public}@, identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x20u);
      }

      v21 = [(IDSRegistrationKeyManager *)self identityDataSource];
      id v27 = v13;
      unsigned int v22 = [v21 removeIdentityContainer:v8 withIdentifier:a4 dataProtectionClass:0 error:&v27];
      id v23 = v27;

      v24 = +[IMRGLog registration];
      v15 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218243;
          int64_t v30 = a4;
          __int16 v31 = 2113;
          int64_t v32 = (int64_t)v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed identity reference from keychain {identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543875;
        int64_t v30 = (int64_t)v23;
        __int16 v31 = 2048;
        int64_t v32 = a4;
        __int16 v33 = 2113;
        CFStringRef v34 = v8;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Failed to remove corrupt identity reference from keychain {error: %{public}@, identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x20u);
      }
      BOOL v16 = 0;
      id v13 = v23;
    }
LABEL_27:

    goto LABEL_28;
  }
  if (v5)
  {
    v17 = +[IMRGLog registration];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218243;
      int64_t v30 = a4;
      __int16 v31 = 2113;
      int64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing identity from keychain because deleteIfNull == YES, {identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x16u);
    }

    id v18 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v26 = 0;
    unsigned int v19 = [v18 removeIdentityContainer:0 withIdentifier:a4 dataProtectionClass:0 error:&v26];
    id v13 = v26;

    v20 = +[IMRGLog registration];
    v15 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218243;
        int64_t v30 = a4;
        __int16 v31 = 2113;
        int64_t v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Purged identity and removed it from keychain {identityIdentifier: %ld, identityContainer: %{private}@}", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_100709A5C((uint64_t)v13);
    }
    BOOL v16 = 1;
    goto LABEL_27;
  }
  id v13 = 0;
  BOOL v16 = 1;
LABEL_28:
  [(NSRecursiveLock *)self->_lock unlock];

  return v16;
}

- (void)_serializeAndPersistBuildOfIdentityGeneration:(id)a3 itemName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSRecursiveLock *)self->_lock lock];
  unsigned int v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Persisting build of identity generation {itemName: %@, buildOfIdentityGeneration: %@}", buf, 0x16u);
  }

  if (v6)
  {
    v9 = [v6 dataUsingEncoding:4];
    CFStringRef v10 = [(IDSRegistrationKeyManager *)self keychainWrapper];
    id v17 = 0;
    unsigned __int8 v11 = [v10 saveData:v9 forIdentifier:v7 allowSync:0 dataProtectionClass:2 error:&v17];
    id v12 = v17;

    if ((v11 & 1) == 0)
    {
      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100709B60();
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  unsigned int v14 = [(IDSRegistrationKeyManager *)self keychainWrapper];
  id v16 = 0;
  unsigned __int8 v15 = [v14 removeDataForIdentifier:v7 dataProtectionClass:2 error:&v16];
  id v12 = v16;

  if ((v15 & 1) == 0)
  {
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100709AEC();
    }
    goto LABEL_11;
  }
LABEL_12:
  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)_loadAndDeserializeBuildOfIdentityGenerationForItemName:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v5 = [(IDSRegistrationKeyManager *)self keychainWrapper];
  id v14 = 0;
  id v6 = [v5 dataForIdentifier:v4 error:&v14];
  id v7 = v14;

  if (v6)
  {
    id v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
    if (v8) {
      goto LABEL_9;
    }
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v4;
      __int16 v17 = 2114;
      id v18 = v6;
      CFStringRef v10 = "Unable to deserialize build of identity generation {itemName: %{public}@, serializedBuildOfIdentityGeneration: %{public}@}";
      unsigned __int8 v11 = v9;
      uint32_t v12 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      CFStringRef v10 = "Unable to load message protection identity from keychain {error: %{public}@}";
      unsigned __int8 v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
  }

  id v8 = 0;
LABEL_9:
  [(NSRecursiveLock *)self->_lock unlock];

  return v8;
}

- (BOOL)_loadClassAIdentityIfNeeded:(id *)a3
{
  BOOL v5 = [(IDSRegistrationKeyManager *)self allowPairingIdentities];
  if (v5)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v6 = [(IDSRegistrationKeyManager *)self config];
    id v7 = [v6 identityClassA];

    if (!v7)
    {
      char v24 = 0;
      CFStringRef v10 = [(IDSRegistrationKeyManager *)self identityDataSource];
      unsigned __int8 v11 = [v10 loadLegacyIdentityWithIdentifier:4 serializationDidChange:&v24 error:a3];
      uint32_t v12 = [(IDSRegistrationKeyManager *)self config];
      [v12 setIdentityClassA:v11];

      id v13 = [(IDSRegistrationKeyManager *)self config];
      id v14 = [v13 identityClassA];

      unsigned __int8 v15 = +[IMRGLog registration];
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = [(IDSRegistrationKeyManager *)self config];
          uint64_t v18 = [v17 identityClassA];
          id v19 = (void *)v18;
          CFStringRef v20 = @"YES";
          if (!v24) {
            CFStringRef v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          CFStringRef v27 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded class A message protection identity {identity: %{private}@, serializationDidChange: %{public}@}", buf, 0x16u);
        }
        if (v24)
        {
          id v21 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v21 identityClassA];

          id v23 = 0;
          [(IDSRegistrationKeyManager *)self _saveClassXIdentity:buf savedIdentity:&v23 protectionClass:1 savedUnsavedIdentity:0];
        }
      }
      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to load class A message protection identity {error: %{public}@}", buf, 0xCu);
        }
      }
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping load class A message protection identity becuase shouldGeneratePairingIdentities == NO", buf, 2u);
    }
  }
  return v5;
}

- (BOOL)_loadClassCIdentityIfNeeded:(id *)a3
{
  BOOL v5 = [(IDSRegistrationKeyManager *)self allowPairingIdentities];
  if (v5)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v6 = [(IDSRegistrationKeyManager *)self config];
    id v7 = [v6 identityClassC];

    if (!v7)
    {
      char v24 = 0;
      CFStringRef v10 = [(IDSRegistrationKeyManager *)self identityDataSource];
      unsigned __int8 v11 = [v10 loadLegacyIdentityWithIdentifier:5 serializationDidChange:&v24 error:a3];
      uint32_t v12 = [(IDSRegistrationKeyManager *)self config];
      [v12 setIdentityClassC:v11];

      id v13 = [(IDSRegistrationKeyManager *)self config];
      id v14 = [v13 identityClassC];

      unsigned __int8 v15 = +[IMRGLog registration];
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = [(IDSRegistrationKeyManager *)self config];
          uint64_t v18 = [v17 identityClassC];
          id v19 = (void *)v18;
          CFStringRef v20 = @"YES";
          if (!v24) {
            CFStringRef v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          CFStringRef v27 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded class C message protection identity {identity: %{private}@, serializationDidChange: %{public}@}", buf, 0x16u);
        }
        if (v24)
        {
          id v21 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v21 identityClassC];

          id v23 = 0;
          [(IDSRegistrationKeyManager *)self _saveClassXIdentity:buf savedIdentity:&v23 protectionClass:0 savedUnsavedIdentity:0];
        }
      }
      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to load class C message protection identity {error: %{public}@}", buf, 0xCu);
        }
      }
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping load class C message protection identity becuase shouldGeneratePairingIdentities == NO", buf, 2u);
    }
  }
  return v5;
}

- (BOOL)_loadClassDIdentityIfNeeded:(id *)a3
{
  BOOL v5 = [(IDSRegistrationKeyManager *)self allowPairingIdentities];
  if (v5)
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v6 = [(IDSRegistrationKeyManager *)self config];
    id v7 = [v6 identityClassD];

    if (!v7)
    {
      char v24 = 0;
      CFStringRef v10 = [(IDSRegistrationKeyManager *)self identityDataSource];
      unsigned __int8 v11 = [v10 loadLegacyIdentityWithIdentifier:6 serializationDidChange:&v24 error:a3];
      uint32_t v12 = [(IDSRegistrationKeyManager *)self config];
      [v12 setIdentityClassD:v11];

      id v13 = [(IDSRegistrationKeyManager *)self config];
      id v14 = [v13 identityClassD];

      unsigned __int8 v15 = +[IMRGLog registration];
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          __int16 v17 = [(IDSRegistrationKeyManager *)self config];
          uint64_t v18 = [v17 identityClassD];
          id v19 = (void *)v18;
          CFStringRef v20 = @"YES";
          if (!v24) {
            CFStringRef v20 = @"NO";
          }
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v18;
          __int16 v26 = 2114;
          CFStringRef v27 = v20;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded class D message protection identity {identity: %{private}@, serializationDidChange: %{public}@}", buf, 0x16u);
        }
        if (v24)
        {
          id v21 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v21 identityClassD];

          id v23 = 0;
          [(IDSRegistrationKeyManager *)self _saveClassXIdentity:buf savedIdentity:&v23 protectionClass:2 savedUnsavedIdentity:0];
        }
      }
      else
      {
        if (v16)
        {
          if (a3) {
            id v22 = *a3;
          }
          else {
            id v22 = 0;
          }
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v22;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to load class D message protection identity {error: %{public}@}", buf, 0xCu);
        }
      }
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Skipping load class D message protection identity becuase shouldGeneratePairingIdentities == NO", buf, 2u);
    }
  }
  return v5;
}

- (void)_loadIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v240 = 0;
  v241 = &v240;
  uint64_t v242 = 0x2020000000;
  char v243 = 0;
  __int16 v239 = 0;
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_loaded)
  {
    self->_loaded = 1;
    BOOL v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration key manager beginning locked load of identities", buf, 2u);
    }

    v244[0] = 0;
    memset(v238, 0, 10);
    id v6 = [(IDSRegistrationKeyManager *)self keyPairProvider];
    id v237 = 0;
    [v6 copyRegistrationKeyPairForIdentifier:0 publicKey:v244 privateKey:&v238[1] keyPairSignature:&v237 isMigratedSignature:(char *)v238 + 1 isUpgradePending:v238];
    id v7 = v237;

    CFTypeRef v8 = v244[0];
    v9 = [(IDSRegistrationKeyManager *)self config];
    [v9 setPublicKey:v8];

    uint64_t v10 = *(void *)&v238[1];
    unsigned __int8 v11 = [(IDSRegistrationKeyManager *)self config];
    [v11 setPrivateKey:v10];

    uint32_t v12 = [(IDSRegistrationKeyManager *)self config];
    [v12 setSignature:v7];

    int v13 = HIBYTE(v238[0]);
    id v14 = [(IDSRegistrationKeyManager *)self config];
    [v14 setIsMigratedSignature:v13 != 0];

    if (v244[0])
    {
      CFRelease(v244[0]);
      v244[0] = 0;
    }
    if (*(void *)&v238[1])
    {
      CFRelease(*(CFTypeRef *)&v238[1]);
      *(void *)&v238[1] = 0;
    }
    unsigned __int8 v15 = +[IMRGLog registration];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v7;
      v223 = [(IDSRegistrationKeyManager *)self config];
      if ([v223 publicKey]) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      uint64_t v18 = [(IDSRegistrationKeyManager *)self config];
      if ([v18 privateKey]) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      if (v16) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      id v21 = [(IDSRegistrationKeyManager *)self config];
      if ([v21 isMigratedSignature]) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      if (LOBYTE(v238[0])) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      CFStringRef v246 = v17;
      __int16 v247 = 2112;
      CFStringRef v248 = v19;
      __int16 v249 = 2112;
      CFStringRef v250 = v20;
      __int16 v251 = 2112;
      CFStringRef v252 = v22;
      __int16 v253 = 2112;
      CFStringRef v254 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded registration key pair {publicKey: %@, privateKey: %@, signature: %@, isMigratedSignature: %@, upgradePending: %@}", buf, 0x34u);

      id v7 = v16;
    }

    if (LOBYTE(v238[0]))
    {
      if ([(IDSRegistrationKeyManager *)self _isUnderFirstDataProtectionLock])
      {
        char v24 = +[IMRGLog registration];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Unable to load registration key pair; we're under lock, and this requires migration -- we need to migrate",
            buf,
            2u);
        }

        self->_detectedMigrationNeeded = 1;
        v25 = [(IDSRegistrationKeyManager *)self systemMonitor];
        [v25 _addEarlyListener:self];

        self->_loaded = 0;
      }
      if (LOBYTE(v238[0])) {
        goto LABEL_49;
      }
    }
    __int16 v26 = [(IDSRegistrationKeyManager *)self config];
    CFStringRef v27 = [v26 signature];
    if (v27)
    {
      id v28 = [(IDSRegistrationKeyManager *)self config];
      if ([v28 publicKey])
      {
        v29 = [(IDSRegistrationKeyManager *)self config];
        BOOL v30 = [v29 privateKey] == 0;

        if (!v30)
        {
LABEL_49:

          goto LABEL_50;
        }
LABEL_37:
        __int16 v31 = +[IMRGLog registration];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v221 = v3;
          int64_t v32 = [(IDSRegistrationKeyManager *)self config];
          __int16 v33 = [v32 signature];
          if (v33) {
            CFStringRef v34 = @"YES";
          }
          else {
            CFStringRef v34 = @"NO";
          }
          v35 = [(IDSRegistrationKeyManager *)self config];
          if ([v35 publicKey]) {
            CFStringRef v36 = @"YES";
          }
          else {
            CFStringRef v36 = @"NO";
          }
          v37 = [(IDSRegistrationKeyManager *)self config];
          if ([v37 privateKey]) {
            CFStringRef v38 = @"YES";
          }
          else {
            CFStringRef v38 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          CFStringRef v246 = v34;
          __int16 v247 = 2112;
          CFStringRef v248 = v36;
          __int16 v249 = 2112;
          CFStringRef v250 = v38;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Unable to load a registration key pair {signature: %@, publicKey: %@, privateKey: %@}", buf, 0x20u);

          BOOL v3 = v221;
        }

        self->_loaded = 0;
        goto LABEL_49;
      }
    }
    goto LABEL_37;
  }
LABEL_50:
  if (v3 && !self->_identityLoaded)
  {
    if ([(IDSRegistrationKeyManager *)self _isUnderFirstDataProtectionLock])
    {
      v39 = +[IMRGLog registration];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "We are under first data protection lock, we can not load our identity now", buf, 2u);
      }

      self->_identityLoaded = 0;
      v40 = [(IDSRegistrationKeyManager *)self systemMonitor];
      [v40 _addEarlyListener:self];

      if (!self->_detectedMigrationNeeded) {
        [(IDSRegistrationKeyManager *)self loadPairingIdentities:1];
      }
      goto LABEL_183;
    }
    [(IDSRateLimiter *)self->_loadingRateLimiter noteItem:@"registrationKeyManagerRateLimit"];
    self->_identityLoaded = 1;
    v41 = objc_alloc_init(IDSNGMKeyLoadingErrorContainer);
    recentKeyLoadingErrors = self->_recentKeyLoadingErrors;
    self->_recentKeyLoadingErrors = v41;

    v43 = +[IMUserDefaults sharedDefaults];
    v44 = [v43 appValueForKey:@"hasRegIdentityContainer"];
    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setShouldHaveRegisteredIdentity:v44];

    v45 = +[IMUserDefaults sharedDefaults];
    v46 = [v45 appValueForKey:@"hasUnregIdentityContainer"];
    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setShouldHaveUnregisteredIdentity:v46];

    v47 = +[IMUserDefaults sharedDefaults];
    self->_failedToGeneratedPublicDataForNGMIdentity = [v47 appBoolForKey:@"failedToGeneratedPublicDataForNGMIdentity"];

    v48 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v235 = 0;
    id v236 = 0;
    v49 = [v48 loadIdentityContainerWithIdentifier:2 withLegacyFallback:1 serializationDidChange:v241 + 3 deserializationDidFail:(char *)&v239 + 1 needsEncryptionIdentityRoll:&v239 nonLegacyError:&v236 error:&v235];
    id v222 = v236;
    v224 = (__CFString *)v235;
    v50 = [(IDSRegistrationKeyManager *)self config];
    [v50 setRegisteredIdentityContainer:v49];

    v51 = [(IDSRegistrationKeyManager *)self config];
    v52 = [v51 registeredIdentityContainer];

    if (v52)
    {
      v53 = [(IDSRegistrationKeyManager *)self _loadAndDeserializeBuildOfIdentityGenerationForItemName:@"build-of-identity-generation"];
      v54 = [(IDSRegistrationKeyManager *)self config];
      [v54 setBuildOfIdentityGeneration:v53];

      v55 = +[IMRGLog registration];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = [(IDSRegistrationKeyManager *)self config];
        v57 = [v56 registeredIdentityContainer];
        v58 = [(IDSRegistrationKeyManager *)self config];
        v59 = [v58 buildOfIdentityGeneration];
        *(_DWORD *)buf = 138478083;
        CFStringRef v246 = v57;
        __int16 v247 = 2112;
        CFStringRef v248 = v59;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Successfully loaded message protection identity from keychain {_config.registeredIdentityContainer: %{private}@, buildOfGeneration: %@}", buf, 0x16u);
      }
    }
    else
    {
      v60 = +[IMRGLog registration];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v61 = @"YES";
        if (!HIBYTE(v239)) {
          CFStringRef v61 = @"NO";
        }
        *(_DWORD *)buf = 138543618;
        CFStringRef v246 = v224;
        __int16 v247 = 2114;
        CFStringRef v248 = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Unable to load message protection identity from keychain {error: %{public}@, deserializationDidFail: %{public}@}", buf, 0x16u);
      }

      if (!+[IDSKeychainWrapper isUpgradePendingError:v224]|| ![(IDSRegistrationKeyManager *)self _isUnderFirstDataProtectionLock])
      {
LABEL_70:
        v63 = self->_recentKeyLoadingErrors;
        if (HIBYTE(v239)) {
          [(IDSNGMKeyLoadingErrorContainer *)v63 setRegisteredDeserializationError:v222];
        }
        else {
          [(IDSNGMKeyLoadingErrorContainer *)v63 setRegisteredKeychainError:v222];
        }
        if (self->_detectedMigrationNeeded)
        {
          v64 = +[IMRGLog registration];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "We're under first lock, and this requires migration -- not doing anything here", buf, 2u);
          }

          self->_identityLoaded = 0;
LABEL_182:

LABEL_183:
          v172 = [(IDSRegistrationKeyManager *)self config];
          v173 = [v172 registeredIdentityContainer];
          v174 = [v173 legacyFullIdentity];
          id v175 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v174];

          v176 = [(IDSRegistrationKeyManager *)self config];
          v177 = [v176 unregisteredIdentityContainer];
          v178 = [v177 legacyFullIdentity];
          id v179 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v178];

          v180 = [(IDSRegistrationKeyManager *)self config];
          v181 = [v180 identityClassA];
          id v182 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v181];

          v183 = [(IDSRegistrationKeyManager *)self config];
          v184 = [v183 identityClassC];
          id v185 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v184];

          v186 = [(IDSRegistrationKeyManager *)self config];
          v187 = [v186 identityClassD];
          id v188 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v187];

          goto LABEL_184;
        }
        *(_WORD *)((char *)v238 + 1) = 0;
        v65 = [(IDSRegistrationKeyManager *)self identityDataSource];
        v233 = v224;
        id v234 = 0;
        v66 = [v65 loadIdentityContainerWithIdentifier:1 withLegacyFallback:0 serializationDidChange:v241 + 3 deserializationDidFail:&v238[1] needsEncryptionIdentityRoll:(char *)v238 + 1 nonLegacyError:&v234 error:&v233];
        id v220 = v234;
        v67 = v233;

        v68 = [(IDSRegistrationKeyManager *)self config];
        [v68 setUnregisteredIdentityContainer:v66];

        HIBYTE(v239) = (HIBYTE(v239) | LOBYTE(v238[1])) != 0;
        LOBYTE(v239) = (v239 | HIBYTE(v238[0])) != 0;
        v69 = [(IDSRegistrationKeyManager *)self config];
        v70 = [v69 unregisteredIdentityContainer];

        if (v70)
        {
          v71 = [(IDSRegistrationKeyManager *)self _loadAndDeserializeBuildOfIdentityGenerationForItemName:@"build-of-unregistered-identity-generation"];
          v72 = [(IDSRegistrationKeyManager *)self config];
          [v72 setBuildOfUnregisteredIdentityGeneration:v71];

          v73 = +[IMRGLog registration];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            v74 = [(IDSRegistrationKeyManager *)self config];
            v75 = [v74 unregisteredIdentityContainer];
            v76 = [(IDSRegistrationKeyManager *)self config];
            v77 = [v76 buildOfUnregisteredIdentityGeneration];
            *(_DWORD *)buf = 138478083;
            CFStringRef v246 = v75;
            __int16 v247 = 2112;
            CFStringRef v248 = v77;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Successfully loaded unregistered message protection identity from keychain {_config.unregisteredIdentity: %{private}@, buildOfGeneration: %@}", buf, 0x16u);
          }
        }
        else
        {
          v73 = +[IMRGLog registration];
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v78 = @"YES";
            if (!HIBYTE(v239)) {
              CFStringRef v78 = @"NO";
            }
            *(_DWORD *)buf = 138543618;
            CFStringRef v246 = v67;
            __int16 v247 = 2114;
            CFStringRef v248 = v78;
            _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Unable to load unregistered message protection identity from keychain {error: %{public}@, deserializationDidFail: %{public}@}", buf, 0x16u);
          }
        }

        v79 = self->_recentKeyLoadingErrors;
        if (LOBYTE(v238[1])) {
          [(IDSNGMKeyLoadingErrorContainer *)v79 setUnregisteredDeserializationError:v220];
        }
        else {
          [(IDSNGMKeyLoadingErrorContainer *)v79 setUnregisteredKeychainError:v220];
        }
        LOBYTE(v238[0]) = 0;
        char v232 = 0;
        v80 = [(IDSRegistrationKeyManager *)self identityDataSource];
        v231 = v67;
        v81 = [v80 loadIdentityContainerWithIdentifier:3 withLegacyFallback:1 serializationDidChange:v241 + 3 deserializationDidFail:v238 needsEncryptionIdentityRoll:&v232 nonLegacyError:0 error:&v231];
        v224 = v231;

        v82 = [(IDSRegistrationKeyManager *)self config];
        [v82 setPreviousRegisteredIdentityContainer:v81];

        v83 = [(IDSRegistrationKeyManager *)self config];
        v84 = [v83 previousRegisteredIdentityContainer];

        if (v84)
        {
          v85 = +[IMRGLog registration];
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            v86 = [(IDSRegistrationKeyManager *)self config];
            v87 = [v86 previousRegisteredIdentityContainer];
            *(_DWORD *)buf = 138477827;
            CFStringRef v246 = v87;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Successfully loaded previous message protection identity from keychain {previousMessageProtectionKey: %{private}@}", buf, 0xCu);
          }
        }
        else
        {
          v85 = +[IMRGLog registration];
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v88 = @"YES";
            if (!LOBYTE(v238[0])) {
              CFStringRef v88 = @"NO";
            }
            *(_DWORD *)buf = 138543618;
            CFStringRef v246 = v224;
            __int16 v247 = 2114;
            CFStringRef v248 = v88;
            _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Unable to load previous message protection identity from keychain {error: %{public}@, previousIdentityDeserializationFailed: %{public}@}", buf, 0x16u);
          }
        }

        v89 = [(IDSRegistrationKeyManager *)self config];
        v90 = [v89 previousRegisteredIdentityContainer];

        if (v90)
        {
          [(IDSRegistrationKeyManager *)self _purgePreviousIdentityDelay];
          -[IDSRegistrationKeyManager _schedulePurgeOfPreviousIdentityAfterDelay:](self, "_schedulePurgeOfPreviousIdentityAfterDelay:");
        }
        [(IDSRegistrationKeyManager *)self loadPairingIdentities:1];
        v91 = +[IMRGLog registration];
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v218 = [(IDSRegistrationKeyManager *)self config];
          v216 = [v218 registeredIdentityContainer];
          if (v216) {
            CFStringRef v92 = @"YES";
          }
          else {
            CFStringRef v92 = @"NO";
          }
          CFStringRef v205 = v92;
          v214 = [(IDSRegistrationKeyManager *)self config];
          v213 = [v214 registeredIdentityContainer];
          v212 = [v213 ngmFullDeviceIdentity];
          if (v212) {
            CFStringRef v93 = @"YES";
          }
          else {
            CFStringRef v93 = @"NO";
          }
          CFStringRef v204 = v93;
          v211 = [(IDSRegistrationKeyManager *)self config];
          v210 = [v211 unregisteredIdentityContainer];
          if (v210) {
            CFStringRef v94 = @"YES";
          }
          else {
            CFStringRef v94 = @"NO";
          }
          CFStringRef v203 = v94;
          v209 = [(IDSRegistrationKeyManager *)self config];
          v208 = [v209 unregisteredIdentityContainer];
          v207 = [v208 ngmFullDeviceIdentity];
          if (v207) {
            CFStringRef v95 = @"YES";
          }
          else {
            CFStringRef v95 = @"NO";
          }
          v206 = [(IDSRegistrationKeyManager *)self config];
          v96 = [v206 registeredIdentityContainer];
          v97 = [v96 ngmVersion];
          v98 = [(IDSRegistrationKeyManager *)self config];
          v99 = [v98 unregisteredIdentityContainer];
          v100 = [v99 ngmVersion];
          v101 = [(IDSRegistrationKeyManager *)self identityDataSource];
          v102 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v101 ngmVersion]);
          *(_DWORD *)buf = 138413826;
          CFStringRef v246 = v205;
          __int16 v247 = 2112;
          CFStringRef v248 = v204;
          __int16 v249 = 2112;
          CFStringRef v250 = v203;
          __int16 v251 = 2112;
          CFStringRef v252 = v95;
          __int16 v253 = 2112;
          CFStringRef v254 = v97;
          __int16 v255 = 2112;
          v256 = v100;
          __int16 v257 = 2112;
          v258 = v102;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "Considering regeneration {registeredIdentity: %@, registeredNGM: %@, unregisteredIdentity: %@, unregisteredNGM: %@, registeredVersion: %@, unregisteredVersion: %@, currentVersion: %@}", buf, 0x48u);
        }
        if (LOBYTE(v238[1]))
        {
          v103 = [(IDSRegistrationKeyManager *)self config];
          v104 = [v103 unregisteredIdentityContainer];
          BOOL v219 = v104 == 0;
        }
        else
        {
          BOOL v219 = 0;
        }
        v105 = [(IDSRegistrationKeyManager *)self config];
        v217 = [v105 registeredIdentityContainer];

        v106 = [(IDSRegistrationKeyManager *)self config];
        v107 = [v106 registeredIdentityContainer];
        v108 = [v107 ngmFullDeviceIdentity];
        if (v108)
        {
          v109 = [(IDSRegistrationKeyManager *)self config];
          v110 = [v109 registeredIdentityContainer];
          v111 = [v110 ngmVersion];
          v112 = [(IDSRegistrationKeyManager *)self identityDataSource];
          v113 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v112 ngmVersion]);
          unsigned int v114 = [v111 isEqualToNumber:v113];

          int v115 = v114 ^ 1;
        }
        else
        {
          int v115 = 1;
        }
        int v215 = v115;

        v116 = [(IDSRegistrationKeyManager *)self config];
        v117 = [v116 unregisteredIdentityContainer];
        v118 = [v117 ngmFullDeviceIdentity];
        if (v118)
        {
          v119 = [(IDSRegistrationKeyManager *)self config];
          v120 = [v119 unregisteredIdentityContainer];
          v121 = [v120 ngmVersion];
          v122 = [(IDSRegistrationKeyManager *)self identityDataSource];
          v123 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v122 ngmVersion]);
          unsigned __int8 v124 = [v121 isEqualToNumber:v123];

          char v125 = v124 ^ 1;
        }
        else
        {
          char v125 = 1;
        }

        v126 = [(IDSRegistrationKeyManager *)self config];
        v127 = [v126 unregisteredIdentityContainer];
        BOOL v128 = v127 != 0;
        if (v127) {
          char v129 = v125;
        }
        else {
          char v129 = 1;
        }
        if ((v129 & 1) == 0)
        {
          v130 = [(IDSRegistrationKeyManager *)self config];
          v131 = [v130 unregisteredIdentityContainer];
          v132 = [v131 legacyFullIdentity];
          BOOL v128 = v132 == 0;
        }
        if (((v219 || v217 == 0) | v215 | v128) == 1)
        {
          if (v125) {
            goto LABEL_136;
          }
          v133 = [(IDSRegistrationKeyManager *)self config];
          v134 = [v133 unregisteredIdentityContainer];
          v135 = [v134 legacyFullIdentity];
          BOOL v136 = v135 == 0;

          if (v136)
          {
LABEL_136:
            v142 = +[IMRGLog registration];
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              v143 = [(IDSRegistrationKeyManager *)self config];
              v144 = [v143 registeredIdentityContainer];
              v145 = [(IDSRegistrationKeyManager *)self config];
              v146 = [v145 unregisteredIdentityContainer];
              v147 = [(IDSRegistrationKeyManager *)self identityDataSource];
              +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v147 ngmVersion]);
              v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              CFStringRef v246 = v144;
              __int16 v247 = 2112;
              CFStringRef v248 = v146;
              __int16 v249 = 2112;
              CFStringRef v250 = v148;
              _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEFAULT, "We have no registered or unregistered identity loaded -- generating a new message protection identity {registeredIdentityContainer: %@, unregisteredIdentityContainer: %@, identityDataSource.ngmVersion: %@}", buf, 0x20u);
            }
            v149 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors shouldHaveUnregisteredIdentity];

            if (v149)
            {
              v150 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors unregisteredDeserializationError];

              if (v150)
              {
                v151 = +[IMRGLog registration];
                if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
                {
                  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredDeserializationError];
                  objc_claimAutoreleasedReturnValue();
                  sub_100709D48();
                }
              }
              else
              {
                v156 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors unregisteredKeychainError];

                if (v156)
                {
                  v151 = +[IMRGLog registration];
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT))
                  {
                    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredKeychainError];
                    objc_claimAutoreleasedReturnValue();
                    sub_100709D00();
                  }
                }
                else
                {
                  v151 = +[IMRGLog registration];
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_FAULT)) {
                    sub_100709CCC();
                  }
                }
              }
            }
            v158 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors shouldHaveRegisteredIdentity];

            if (v158)
            {
              v159 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredDeserializationError];

              if (v159)
              {
                v160 = +[IMRGLog registration];
                if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
                {
                  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredDeserializationError];
                  objc_claimAutoreleasedReturnValue();
                  sub_100709C84();
                }
              }
              else
              {
                v161 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredKeychainError];

                if (v161)
                {
                  v160 = +[IMRGLog registration];
                  if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
                  {
                    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredKeychainError];
                    objc_claimAutoreleasedReturnValue();
                    sub_100709C3C();
                  }
                }
                else
                {
                  v160 = +[IMRGLog registration];
                  if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT)) {
                    sub_100709C08();
                  }
                }
              }
            }
            v162 = [(IDSRegistrationKeyManager *)self config];
            v163 = [v162 unregisteredIdentityContainer];
            v164 = [(IDSRegistrationKeyManager *)self config];
            if (v163) {
              [v164 unregisteredIdentityContainer];
            }
            else {
            v137 = [v164 registeredIdentityContainer];
            }

            v165 = [v137 legacyFullIdentity];
            unsigned int v166 = [(IDSRegistrationKeyManager *)self _generateUnregisteredIdentityWithExistingLegacyIdentity:v165 existingNGMIdentity:0];

            if (v166) {
              [(IDSRegistrationKeyManager *)self _notifyUnregisteredIdentityRegenerated];
            }
          }
          else
          {
            v137 = +[IMRGLog registration];
            if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "We have no registered identity loaded, but we found an unregistered identity -- no need to generate", buf, 2u);
            }
          }
        }
        else
        {
          if ([(IDSRegistrationKeyManager *)self _shouldRegenerateRegisteredIdentity])
          {
            v138 = +[IMRGLog registration];
            if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "We need to regenerate the registered identity", buf, 2u);
            }

            v139 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors shouldHaveRegisteredIdentity];

            if (v139)
            {
              v140 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredDeserializationError];

              if (v140)
              {
                v141 = +[IMRGLog registration];
                if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT))
                {
                  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredDeserializationError];
                  objc_claimAutoreleasedReturnValue();
                  sub_100709C84();
                }
              }
              else
              {
                v157 = [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredKeychainError];

                if (v157)
                {
                  v141 = +[IMRGLog registration];
                  if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT))
                  {
                    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors registeredKeychainError];
                    objc_claimAutoreleasedReturnValue();
                    sub_100709C3C();
                  }
                }
                else
                {
                  v141 = +[IMRGLog registration];
                  if (os_log_type_enabled(v141, OS_LOG_TYPE_FAULT)) {
                    sub_100709C08();
                  }
                }
              }
            }
            [(IDSRegistrationKeyManager *)self _identityRegenerationDelay];
            -[IDSRegistrationKeyManager _scheduleRegenerationOfRegisteredIdentityAfterDelay:](self, "_scheduleRegenerationOfRegisteredIdentityAfterDelay:");
            goto LABEL_173;
          }
          v137 = +[IMRGLog registration];
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            v152 = [(IDSRegistrationKeyManager *)self config];
            v153 = [v152 registeredIdentityContainer];
            v154 = [(IDSRegistrationKeyManager *)self config];
            v155 = [v154 unregisteredIdentityContainer];
            *(_DWORD *)buf = 138412546;
            CFStringRef v246 = v153;
            __int16 v247 = 2112;
            CFStringRef v248 = v155;
            _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "No need to regenerate message protection identity {identity: %@, unregisteredIdentity: %@}", buf, 0x16u);
          }
        }

LABEL_173:
        char v230 = 0;
        [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager loadIdentitiesWithSerializationDidChange:v241 + 3 deserializationDidFail:(char *)&v239 + 1 identityGenerated:&v230];
        if (v230) {
          [(IDSRegistrationKeyManager *)self _notifyUnregisteredIdentityRegenerated];
        }
        if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
        {
          char v229 = 0;
          [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager loadKTRegistrationDatasWithShouldGenerateKTData:&v229];
          if (v229)
          {
            id v228 = 0;
            v167 = [(IDSRegistrationKeyManager *)self publicMessageProtectionIdentityDataToRegisterWithError:&v228];
            id v168 = v228;
            v169 = im_primary_queue();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000381B0;
            block[3] = &unk_10097E440;
            block[4] = self;
            id v170 = v167;
            id v227 = v170;
            dispatch_async(v169, block);
          }
        }
        else
        {
          v171 = +[IMRGLog registration];
          if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
            sub_100709BD4();
          }
        }
        goto LABEL_182;
      }
      v62 = +[IMRGLog registration];
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "We're under lock, and this requires migration -- we need to migrate", buf, 2u);
      }

      self->_detectedMigrationNeeded = 1;
      v55 = [(IDSRegistrationKeyManager *)self systemMonitor];
      [v55 _addEarlyListener:self];
    }

    goto LABEL_70;
  }
LABEL_184:
  [(NSRecursiveLock *)self->_lock unlock];
  if (IMGetAppBoolForKey())
  {
    IMSetAppBoolForKey();
    v189 = +[IMRGLog registration];
    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
    }

    v190 = +[IMRGLog registration];
    if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_DEFAULT, " ********  DEFAULT SET TO FORCE IDENTITY REFRESH  *******************", (uint8_t *)&v238[1], 2u);
    }

    v191 = +[IMRGLog registration];
    if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
    }

    v225[0] = _NSConcreteStackBlock;
    v225[1] = 3221225472;
    v225[2] = sub_1000381BC;
    v225[3] = &unk_10097ED88;
    v225[4] = &v240;
    v192 = v225;
    if (qword_100A4A290 != -1) {
      dispatch_once(&qword_100A4A290, v192);
    }
  }
  if (*((unsigned __int8 *)v241 + 24) | HIBYTE(v239))
  {
    if (![(IDSRegistrationKeyManager *)self _save]) {
      goto LABEL_221;
    }
    if (*((unsigned char *)v241 + 24))
    {
      v197 = +[IMRGLog registration];
      if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
      }

      v198 = +[IMRGLog registration];
      if (os_log_type_enabled(v198, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_DEFAULT, " ****************  IDENTITY SERIALIZATION UPDATED  ******************", (uint8_t *)&v238[1], 2u);
      }

      v199 = +[IMRGLog registration];
      if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
      }

      self->_needsReRegister = 1;
    }
    if (HIBYTE(v239))
    {
      v200 = +[IMRGLog registration];
      if (os_log_type_enabled(v200, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
      }

      v201 = +[IMRGLog registration];
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_DEFAULT, " ************************  IDENTITY REBUILT  ************************", (uint8_t *)&v238[1], 2u);
      }

      v202 = +[IMRGLog registration];
      if (os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT))
      {
        v238[1] = 0;
        _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
      }

      v196 = +[NSNotificationCenter defaultCenter];
      objc_msgSend(v196, "__mainThreadPostNotificationName:object:", @"__kIDSRegistrationKeyManagerPrivateIdentityRebuiltNotification", self);
      goto LABEL_220;
    }
  }
  if ((_BYTE)v239)
  {
    v193 = +[IMRGLog registration];
    if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
    }

    v194 = +[IMRGLog registration];
    if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, " *****************  NEEDS ENCRYPTION IDENTITY ROLL  *****************", (uint8_t *)&v238[1], 2u);
    }

    v195 = +[IMRGLog registration];
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
    {
      v238[1] = 0;
      _os_log_impl((void *)&_mh_execute_header, v195, OS_LOG_TYPE_DEFAULT, " ********************************************************************", (uint8_t *)&v238[1], 2u);
    }

    v196 = +[NSNotificationCenter defaultCenter];
    objc_msgSend(v196, "__mainThreadPostNotificationName:object:", @"__kIDSRegistrationKeyManagerEncryptionIdentityNeedsRollNotification", self);
LABEL_220:
  }
LABEL_221:
  _Block_object_dispose(&v240, 8);
}

- (IDSRegistrationKeyManager)initWithSystemMonitor:(id)a3 keychainWrapper:(id)a4 loadingRateLimiter:(id)a5 identityDataSource:(id)a6 allowPairingIdentities:(BOOL)a7 allowRegenerateRegisteredIdentity:(BOOL)a8 keyPairProvider:(id)a9 ktRegistrationDataManager:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v17 = a6;
  id v37 = a9;
  id v36 = a10;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    __int16 v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 740, @"Invalid parameter not satisfying: %@", @"keychainWrapper" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  BOOL v30 = +[NSAssertionHandler currentHandler];
  [v30 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 739, @"Invalid parameter not satisfying: %@", @"systemMonitor" object file lineNumber description];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_9:
  int64_t v32 = +[NSAssertionHandler currentHandler];
  [v32 handleFailureInMethod:a2, self, @"IDSRegistrationKeyManager.m", 741, @"Invalid parameter not satisfying: %@", @"identityDataSource" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)IDSRegistrationKeyManager;
  uint64_t v18 = [(IDSRegistrationKeyManager *)&v39 init];
  CFStringRef v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_systemMonitor, a3);
    [(IMSystemMonitor *)v19->_systemMonitor addListener:v19];
    [(IMSystemMonitor *)v19->_systemMonitor setActive:1];
    [(IMSystemMonitor *)v19->_systemMonitor setWatchesDataProtectionLockState:1];
    objc_storeStrong((id *)&v19->_keychainWrapper, a4);
    objc_storeStrong((id *)&v19->_loadingRateLimiter, a5);
    objc_storeStrong((id *)&v19->_identityDataSource, a6);
    CFStringRef v20 = [[IDSPerServiceApplicationKeyManager alloc] initWithIdentityDataSource:v17];
    applicationKeyManager = v19->_applicationKeyManager;
    v19->_applicationKeyManager = v20;

    v19->_allowPairingIdentities = a7;
    v19->_allowRegenerateRegisteredIdentity = a8;
    objc_storeStrong((id *)&v19->_keyPairProvider, a9);
    CFStringRef v22 = objc_alloc_init(IDSNGMKeyLoadingErrorContainer);
    recentKeyLoadingErrors = v19->_recentKeyLoadingErrors;
    v19->_recentKeyLoadingErrors = v22;

    objc_storeStrong((id *)&v19->_ktRegistrationDataManager, a10);
    char v24 = objc_alloc_init(IDSRegistrationKeyConfig);
    config = v19->_config;
    v19->_config = v24;

    __int16 v26 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v19->_lock;
    v19->_lock = v26;

    [(IDSRegistrationKeyManager *)v19 _subscribeForTimeChangeNotification];
    id v28 = +[NSDistributedNotificationCenter defaultCenter];
    [v28 addObserver:v19 selector:"_ktDataNeedsUpdate:" name:@"KTEnrollmentSignatureUpdated" object:0];
  }
  return v19;
}

- (IDSRegistrationKeyManager)init
{
  BOOL v3 = +[IMSystemMonitor sharedInstance];
  id v4 = objc_alloc_init(IDSKeychainWrapper);
  id v5 = [objc_alloc((Class)IDSRateLimiter) initWithLimit:5 timeLimit:86400.0];
  id v6 = [[IDSRegistrationKeyManagerIdentityDataSource alloc] initWithKeychainWrapper:v4];
  id v7 = [IDSKTRegistrationDataManager alloc];
  id v8 = objc_alloc_init((Class)TransparencyDaemon);
  v9 = [(IDSKTRegistrationDataManager *)v7 initWithIdentityDataSource:v6 transparencyDaemon:v8];

  uint64_t v10 = objc_alloc_init(IDSRegistrationKeyManagerKeyPairProvider);
  unsigned __int8 v11 = [(IDSRegistrationKeyManager *)self initWithSystemMonitor:v3 keychainWrapper:v4 loadingRateLimiter:v5 identityDataSource:v6 allowPairingIdentities:1 allowRegenerateRegisteredIdentity:1 keyPairProvider:v10 ktRegistrationDataManager:v9];

  return v11;
}

- (void)dealloc
{
  BOOL v3 = [(IDSRegistrationKeyManager *)self systemMonitor];
  [v3 _removeEarlyListener:self];

  id v4 = [(IDSRegistrationKeyManager *)self systemMonitor];
  [v4 removeListener:self];

  [(IDSRegistrationKeyManager *)self _unsubscribeForTimeChangeNotification];
  v5.receiver = self;
  v5.super_class = (Class)IDSRegistrationKeyManager;
  [(IDSRegistrationKeyManager *)&v5 dealloc];
}

- (void)setForceRoll:(BOOL)a3
{
  if (self->_forceRoll != a3)
  {
    BOOL v3 = a3;
    self->_forceRoll = a3;
    id v4 = +[IMRGLog registration];
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        __int16 v9 = 0;
        id v6 = "!!WILL FORCE AN EC KEY ROLL ON NEXT REGISTER!!";
        id v7 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else if (v5)
    {
      __int16 v8 = 0;
      id v6 = "!!NO LONGER FORCING EC KEY ROLL!!";
      id v7 = (uint8_t *)&v8;
      goto LABEL_7;
    }
  }
}

- (id)generateCSRForUserID:(id)a3
{
  id v4 = a3;
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:0];
  if (v4)
  {
    BOOL v5 = [(IDSRegistrationKeyManager *)self config];
    if ([v5 privateKey])
    {
      id v6 = [(IDSRegistrationKeyManager *)self config];
      id v7 = [v6 publicKey];

      if (v7)
      {
        __int16 v8 = [v4 dataUsingEncoding:4];
        __int16 v9 = [v8 SHA1HexString];

        v21[0] = kSecOidCommonName;
        v21[1] = v9;
        uint64_t v10 = +[NSArray arrayWithObjects:v21 count:2];
        CFStringRef v22 = v10;
        unsigned __int8 v11 = +[NSArray arrayWithObjects:&v22 count:1];
        CFStringRef v23 = v11;
        uint32_t v12 = +[NSArray arrayWithObjects:&v23 count:1];

        int v13 = [(IDSRegistrationKeyManager *)self config];
        [v13 publicKey];
        id v14 = [(IDSRegistrationKeyManager *)self config];
        [v14 privateKey];
        CertificateRequest = (void *)SecGenerateCertificateRequest();

        id v16 = +[IMRGLog registration];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = CertificateRequest;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Generated CSR with RSA public/private keypair {csr: %@}", buf, 0xCu);
        }

        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  __int16 v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(IDSRegistrationKeyManager *)self config];
    id v18 = [v17 privateKey];
    CFStringRef v19 = [(IDSRegistrationKeyManager *)self config];
    *(_DWORD *)buf = 138412802;
    id v25 = v4;
    __int16 v26 = 2048;
    id v27 = v18;
    __int16 v28 = 2112;
    id v29 = [v19 publicKey];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed generating CSR due to insufficient context {userID: %@, privateKey: %p, publicKey: %@}", buf, 0x20u);
  }
  CertificateRequest = 0;
LABEL_11:

  return CertificateRequest;
}

- (__SecKey)fullIdentityForKeyIndex:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  BOOL v5 = [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager fullIdentityForKeyIndex:v3];
  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (id)fullDeviceIdentityContainer
{
  return [(IDSRegistrationKeyManager *)self fullDeviceIdentityContainerUsableForKeyType:0];
}

- (id)fullDeviceIdentityContainerUsableForKeyType:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  if (a3 >= 2 && (a3 != 2 || self->_failedToGeneratedPublicDataForNGMIdentity)) {
    goto LABEL_9;
  }
  BOOL v5 = [(IDSRegistrationKeyManager *)self config];
  id v6 = [v5 unregisteredIdentityContainer];
  id v7 = [(IDSRegistrationKeyManager *)self config];
  __int16 v8 = v7;
  if (v6) {
    [v7 unregisteredIdentityContainer];
  }
  else {
  __int16 v9 = [v7 registeredIdentityContainer];
  }

  if (!v9)
  {
LABEL_9:
    uint64_t v10 = +[IMRGLog registration];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100709D90(self);
    }

    __int16 v9 = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v9;
}

- (id)previousFullDeviceIdentityContainer
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  uint64_t v3 = [(IDSRegistrationKeyManager *)self config];
  id v4 = [v3 previousRegisteredIdentityContainer];

  if (!v4)
  {
    BOOL v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100709E14(self);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v4;
}

- (__SecKey)copyPublicIdentityDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4
{
  uint64_t v5 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  id v7 = [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager copyPublicIdentityDataToRegisterForKeyIndex:v5 withError:a4];
  [(NSRecursiveLock *)self->_lock unlock];
  return v7;
}

- (id)copyKTRegistrationDataToRegisterForKeyIndex:(unsigned __int16)a3 withError:(id *)a4
{
  uint64_t v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  ktRegistrationDataManager = self->_ktRegistrationDataManager;
  id v12 = 0;
  id v7 = [(IDSKTRegistrationDataManager *)ktRegistrationDataManager copyKTRegistrationDataToRegisterForKeyIndex:v4 isRegistered:0 withError:&v12];
  id v8 = v12;
  if (!v7)
  {
    __int16 v9 = self->_ktRegistrationDataManager;
    uint64_t v11 = 0;
    id v7 = [(IDSKTRegistrationDataManager *)v9 copyKTRegistrationDataToRegisterForKeyIndex:v4 isRegistered:1 withError:&v11];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v7;
}

- (id)fetchRegistrationStatusProvider
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  uint64_t v3 = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager createRegistrationStatusProvider];
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (void)_handleTransparencySignatureResponse:(id)a3 error:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  LODWORD(lock) = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager handleTransparencySignatureResponse:v8 error:v7];

  if (lock) {
    [(IDSRegistrationKeyManager *)self _notifyUnregisteredKTData];
  }
  __int16 v9 = self->_lock;

  [(NSRecursiveLock *)v9 unlock];
}

- (void)_handleTransparencySignatureResponseForRegistration:(id)a3 error:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager handleTransparencySignatureResponse:v8 error:v7];

  __int16 v9 = self->_lock;

  [(NSRecursiveLock *)v9 unlock];
}

- (id)publicMessageProtectionIdentityDataToRegisterWithError:(id *)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  uint64_t v5 = [(IDSRegistrationKeyManager *)self config];
  id v6 = [v5 unregisteredIdentityContainer];
  id v7 = [(IDSRegistrationKeyManager *)self config];
  id v8 = v7;
  if (v6) {
    [v7 unregisteredIdentityContainer];
  }
  else {
  __int16 v9 = [v7 registeredIdentityContainer];
  }

  uint64_t v10 = [v9 ngmFullDeviceIdentity];
  if (!v10
    || (uint64_t v11 = (void *)v10,
        [v9 ngmVersion],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    int v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Asked for public identity, but missing NGM identity. Attempting to repair", buf, 2u);
    }

    id v14 = [v9 legacyFullIdentity];
    unsigned int v15 = [(IDSRegistrationKeyManager *)self _generateUnregisteredIdentityWithExistingLegacyIdentity:v14 existingNGMIdentity:0];

    if (v15)
    {
      id v16 = [(IDSRegistrationKeyManager *)self config];
      id v17 = [v16 unregisteredIdentityContainer];
      id v18 = [(IDSRegistrationKeyManager *)self config];
      CFStringRef v19 = v18;
      if (v17) {
        [v18 unregisteredIdentityContainer];
      }
      else {
      uint64_t v20 = [v18 registeredIdentityContainer];
      }

      __int16 v9 = (void *)v20;
    }
  }
  id v21 = [(IDSRegistrationKeyManager *)self config];
  CFStringRef v22 = [v21 unregisteredIdentityContainer];
  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setHasUnregisteredContainer:v22 != 0];

  CFStringRef v23 = [(IDSRegistrationKeyManager *)self config];
  char v24 = [v23 registeredIdentityContainer];
  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setHasRegisteredContainer:v24 != 0];

  if (v9)
  {
    id v25 = [v9 publicIdentityWithError:a3];
    if (!v25)
    {
      __int16 v33 = +[IMRGLog registration];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100709F1C((uint64_t)a3, self);
      }
      id v29 = 0;
      BOOL v30 = 0;
      __int16 v31 = 0;
      int64_t v32 = 0;
      goto LABEL_75;
    }
    __int16 v26 = [v9 ngmFullDeviceIdentity];
    v72 = v26;
    if (([v26 shouldRollEncryptionIdentity] & 1) == 0)
    {
      id v27 = [(IDSRegistrationKeyManager *)self config];
      __int16 v28 = [v27 unappliedRollingTicket];
      if (v28)
      {
      }
      else
      {
        BOOL forceRoll = self->_forceRoll;

        if (!forceRoll)
        {
          __int16 v31 = 0;
          __int16 v33 = 0;
          BOOL v30 = 0;
LABEL_57:
          v51 = [v25 ngmPublicDeviceIdentity];
          uint64_t v52 = [v51 identityData];

          v53 = [v25 ngmPublicDeviceIdentity];
          uint64_t v54 = [v53 prekeyData];

          BOOL v30 = (void *)v54;
          __int16 v31 = (void *)v52;
LABEL_58:
          int failedToGeneratedPublicDataForNGMIdentity = self->_failedToGeneratedPublicDataForNGMIdentity;
          if (v31) {
            BOOL v56 = v30 == 0;
          }
          else {
            BOOL v56 = 1;
          }
          int v57 = v56;
          if (v56)
          {
            v58 = +[IMRGLog registration];
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              v71 = [v25 ngmPublicDeviceIdentity];
              uint64_t v66 = [v71 debugDescription];
              v69 = (void *)v66;
              CFStringRef v67 = @"YES";
              if (v31) {
                CFStringRef v68 = @"YES";
              }
              else {
                CFStringRef v68 = @"NO";
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v75 = v66;
              uint64_t v77 = (uint64_t)v68;
              __int16 v76 = 2112;
              if (!v30) {
                CFStringRef v67 = @"NO";
              }
              __int16 v78 = 2112;
              CFStringRef v79 = v67;
              _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to get NGM public data to register -- returning nil for EC {ngmPublicDeviceIdentity: %@, NGMIdentityToRegister: %@, NGMPrekeyToRegister: %@}", buf, 0x20u);
            }
            BOOL v59 = 1;
          }
          else
          {
            BOOL v59 = 0;
          }
          self->_int failedToGeneratedPublicDataForNGMIdentity = v59;
          if (failedToGeneratedPublicDataForNGMIdentity != v57)
          {
            v60 = +[IMUserDefaults sharedDefaults];
            [v60 setAppBool:self->_failedToGeneratedPublicDataForNGMIdentity forKey:@"failedToGeneratedPublicDataForNGMIdentity"];
          }
          CFStringRef v61 = [v25 legacyPublicIdentity];
          int64_t v32 = [v61 dataRepresentationWithError:a3];

          if (!v32)
          {
            v62 = +[IMRGLog registration];
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
              sub_100709FFC((uint64_t)a3, v25);
            }
          }
          id v29 = [v25 ngmVersion];

LABEL_75:
          goto LABEL_76;
        }
      }
    }
    v35 = [(IDSRegistrationKeyManager *)self config];
    id v36 = [v35 unappliedRollingTicket];

    if (v36)
    {
      __int16 v33 = 0;
    }
    else
    {
      id v73 = 0;
      id v36 = [v26 keyRollingTicketWithError:&v73];
      __int16 v33 = v73;
      if (IMGetAppBoolForKey())
      {
        if (v36) {
          id v37 = @"Rolling key";
        }
        else {
          id v37 = @"Tried and failed to generate new key to roll";
        }
        sub_1001484DC(1, @"NGM Key Rolling", v37, 1109);
      }
      if (!v36)
      {
        v45 = +[IMRGLog registration];
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10070A0A4();
        }
        id v36 = 0;
        BOOL v30 = 0;
        __int16 v31 = 0;
        goto LABEL_48;
      }
    }
    id v38 = [(IDSRegistrationKeyManager *)self config];
    [v38 setUnappliedRollingTicket:v36];

    objc_super v39 = [(IDSRegistrationKeyManager *)self config];
    v40 = [v39 unregisteredIdentityContainer];

    if (!v40)
    {
      v41 = [(IDSRegistrationKeyManager *)self config];
      v42 = [v41 registeredIdentityContainer];
      v43 = [(IDSRegistrationKeyManager *)self config];
      [v43 setUnregisteredIdentityContainer:v42];

      if (![(IDSRegistrationKeyManager *)self _save])
      {
        [(NSRecursiveLock *)self->_lock unlock];

        id v29 = 0;
        BOOL v30 = 0;
        __int16 v31 = 0;
        int64_t v32 = 0;
        goto LABEL_81;
      }
    }
    __int16 v31 = [v36 identityData];
    uint64_t v44 = [v36 prekeyData];
    BOOL v30 = (void *)v44;
    if (v31 && v44)
    {
LABEL_49:
      if (self->_forceRoll)
      {
        v50 = +[IMRGLog registration];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "!!FORCING A ROLL!!", buf, 2u);
        }
      }
      [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setRollingError:v33];

      if (v31 && v30) {
        goto LABEL_58;
      }
      goto LABEL_57;
    }
    v45 = +[IMRGLog registration];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v46 = [v25 ngmPublicDeviceIdentity];
      uint64_t v47 = [v46 debugDescription];
      v70 = (void *)v47;
      CFStringRef v48 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v75 = (uint64_t)v36;
      if (v31) {
        CFStringRef v49 = @"YES";
      }
      else {
        CFStringRef v49 = @"NO";
      }
      if (v30) {
        CFStringRef v48 = @"YES";
      }
      __int16 v76 = 2112;
      uint64_t v77 = v47;
      __int16 v78 = 2112;
      CFStringRef v79 = v49;
      __int16 v80 = 2112;
      CFStringRef v81 = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to get NGM public data from ticket to register -- cancelling roll {ticket: %@, ngmPublicDeviceIdentity: %@, NGMIdentityToRegister: %@, NGMPrekeyToRegister: %@}", buf, 0x2Au);
    }
LABEL_48:

    goto LABEL_49;
  }
  id v25 = +[IMRGLog registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_100709E98(self);
  }
  id v29 = 0;
  BOOL v30 = 0;
  __int16 v31 = 0;
  int64_t v32 = 0;
LABEL_76:

  if (a3) {
    id v63 = *a3;
  }
  else {
    id v63 = 0;
  }
  [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setIdentityToRegisterError:v63];
  [(NSRecursiveLock *)self->_lock unlock];
  if (v32)
  {
    v64 = [[IDSPublicIdentityData alloc] initWithPublicLegacyIdentityData:v32 publicNGMIdentityData:v31 publicNGMPrekeyData:v30 NGMVersion:v29];
    goto LABEL_82;
  }
LABEL_81:
  v64 = 0;
LABEL_82:

  return v64;
}

- (id)keyTransparencyVersionNumberToRegisterForServiceType:(id)a3
{
  return [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager keyTransparencyVersionNumberToRegisterForServiceType:a3];
}

- (id)publicMessageProtectionDeviceIdentityContainerToRegister:(id *)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  uint64_t v5 = [(IDSRegistrationKeyManager *)self config];
  id v6 = [v5 unregisteredIdentityContainer];
  id v7 = [(IDSRegistrationKeyManager *)self config];
  id v8 = v7;
  if (v6) {
    [v7 unregisteredIdentityContainer];
  }
  else {
  __int16 v9 = [v7 registeredIdentityContainer];
  }

  if (!v9)
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100709E98(self);
    }
    goto LABEL_12;
  }
  uint64_t v10 = [v9 publicIdentityWithError:a3];
  uint64_t v11 = +[IMRGLog registration];
  id v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100709F1C((uint64_t)a3, self);
    }
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [(IDSRegistrationKeyManager *)self config];
    id v14 = [v13 unregisteredIdentityContainer];
    unsigned int v15 = [(IDSRegistrationKeyManager *)self config];
    id v16 = [v15 registeredIdentityContainer];
    int v18 = 138478339;
    CFStringRef v19 = v10;
    __int16 v20 = 2113;
    id v21 = v14;
    __int16 v22 = 2113;
    CFStringRef v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Returning publicIdentity to register {publicIdentityContainer: %{private}@, unregisteredContainer: %{private}@, registeredContainer: %{private}@}", (uint8_t *)&v18, 0x20u);
  }
LABEL_13:

  [(NSRecursiveLock *)self->_lock unlock];

  return v10;
}

- (id)_generateIdentityWithExistingIdentity:(id)a3 identifier:(int64_t)a4 dataProtectionClass:(int64_t)a5
{
  id v8 = a3;
  if (v8)
  {
    __int16 v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Immediately returning existing message protection identity {identity: %@}", buf, 0xCu);
    }

    id v10 = v8;
  }
  else
  {
    uint64_t v11 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v17 = 0;
    id v12 = [v11 generateLegacyIdentityWithIdentifier:a4 dataProtectionClass:a5 error:&v17];
    id v13 = v17;

    id v14 = +[IMRGLog registration];
    unsigned int v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = v13;
        __int16 v20 = 2048;
        int64_t v21 = a5;
        __int16 v22 = 2112;
        CFStringRef v23 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created new message protection identity {error: %@, protectionClass: %ld, identity: %@}", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      sub_10070A138((uint64_t)v13);
    }

    id v10 = v12;
  }

  return v10;
}

- (id)_getPublicMessageProtectionDataForIdentity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v14 = 0;
    uint64_t v5 = [v3 publicIdentityWithError:&v14];
    id v6 = v14;
    id v7 = v6;
    if (v5)
    {
      id v13 = v6;
      id v8 = [v5 dataRepresentationWithError:&v13];
      __int16 v9 = v13;

      id v10 = +[IMRGLog registration];
      uint64_t v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_10070A2C8((uint64_t)v5);
        }
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
          sub_10070A254((uint64_t)v9);
        }
        id v8 = 0;
      }
    }
    else
    {
      uint64_t v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10070A1E0((uint64_t)v7);
      }
      id v8 = 0;
      __int16 v9 = v7;
    }
  }
  else
  {
    __int16 v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10070A1AC();
    }
    id v8 = 0;
  }

  return v8;
}

- (_SecMPFullIdentity)copyMessageProtectionIdentity
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  id v3 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v4 = [v3 registeredIdentityContainer];
  uint64_t v5 = [v4 legacyFullIdentity];

  id v6 = (_SecMPFullIdentity *)[v5 fullIdentity];
  id v7 = v6;
  if (v6)
  {
    CFRetain(v6);
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10070A34C();
    }

    IMLogBacktrace();
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v7;
}

- (_SecMPFullIdentity)latestCopyMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3
{
  id v3 = [(IDSRegistrationKeyManager *)self latestMessageProtectionFullIdentityForDataProtectionClass:*(void *)&a3];
  uint64_t v4 = (_SecMPFullIdentity *)[v3 fullIdentity];
  uint64_t v5 = v4;
  if (v4)
  {
    CFRetain(v4);
  }
  else
  {
    id v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10070A380();
    }

    IMLogBacktrace();
  }

  return v5;
}

- (_SecMPFullIdentity)copyPreviousMessageProtectionIdentity
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  id v3 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v4 = [v3 previousRegisteredIdentityContainer];
  uint64_t v5 = [v4 legacyFullIdentity];

  id v6 = (_SecMPFullIdentity *)[v5 fullIdentity];
  id v7 = v6;
  if (v6)
  {
    CFRetain(v6);
  }
  else
  {
    id v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No previous message protection identity present -- not returning previous message protection identity", v10, 2u);
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v7;
}

- (id)latestMessageProtectionFullIdentityForDataProtectionClass:(unsigned int)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  if (a3)
  {
    if (a3 == 1)
    {
      id v13 = 0;
      [(IDSRegistrationKeyManager *)self _loadClassAIdentityIfNeeded:&v13];
      id v5 = v13;
      id v6 = [(IDSRegistrationKeyManager *)self config];
      uint64_t v7 = [v6 identityClassA];
    }
    else
    {
      id v11 = 0;
      [(IDSRegistrationKeyManager *)self _loadClassDIdentityIfNeeded:&v11];
      id v5 = v11;
      id v6 = [(IDSRegistrationKeyManager *)self config];
      uint64_t v7 = [v6 identityClassD];
    }
  }
  else
  {
    id v12 = 0;
    [(IDSRegistrationKeyManager *)self _loadClassCIdentityIfNeeded:&v12];
    id v5 = v12;
    id v6 = [(IDSRegistrationKeyManager *)self config];
    uint64_t v7 = [v6 identityClassC];
  }
  id v8 = (void *)v7;

  if (!v8)
  {
    __int16 v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10070A3EC();
    }

    IMLogBacktrace();
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v8;
}

- (id)publicMessageProtectionDataToRegisterForClassA
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(IDSRegistrationKeyManager *)self latestMessageProtectionFullIdentityForDataProtectionClass:1];
  uint64_t v4 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v3];
  [(NSRecursiveLock *)self->_lock unlock];

  return v4;
}

- (id)publicMessageProtectionDataToRegisterForClassC
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(IDSRegistrationKeyManager *)self latestMessageProtectionFullIdentityForDataProtectionClass:0];
  uint64_t v4 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v3];
  [(NSRecursiveLock *)self->_lock unlock];

  return v4;
}

- (id)publicMessageProtectionDataToRegisterForClassD
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = [(IDSRegistrationKeyManager *)self latestMessageProtectionFullIdentityForDataProtectionClass:2];
  uint64_t v4 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v3];
  [(NSRecursiveLock *)self->_lock unlock];

  return v4;
}

- (id)publicMessageProtectionData
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  id v3 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v4 = [v3 registeredIdentityContainer];
  id v5 = [v4 legacyFullIdentity];
  id v6 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v5];

  return v6;
}

- (void)_ensureIdentity:(id *)a3 savedIndentity:(id *)a4 protectionClass:(int64_t)a5 didSaveIdentity:(BOOL *)a6
{
  if (*a4) {
    goto LABEL_2;
  }
  if (!*a3)
  {
    if ((unint64_t)a5 > 2) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_100793FD8[a5];
    }
    id v12 = [(IDSRegistrationKeyManager *)self _generateIdentityWithExistingIdentity:0 identifier:v11 dataProtectionClass:a5];
    id v13 = *a3;
    *a3 = v12;

    [(IDSRegistrationKeyManager *)self _save];
LABEL_2:
    if (!*a3) {
      return;
    }
  }

  [(IDSRegistrationKeyManager *)self _saveClassXIdentity:a3 savedIdentity:a4 protectionClass:a5 savedUnsavedIdentity:a6];
}

- (void)_subscribeForTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10003A330, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unsubscribeForTimeChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SignificantTimeChangeNotification", 0);
}

- (void)_retryGenerationIfNeeded
{
  if (![(IDSRegistrationKeyManager *)self _isUnderFirstDataProtectionLock])
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v3 = [(IDSRegistrationKeyManager *)self config];
    uint64_t v4 = [v3 unregisteredIdentityContainer];
    id v5 = [(IDSRegistrationKeyManager *)self config];
    id v6 = v5;
    if (v4) {
      [v5 unregisteredIdentityContainer];
    }
    else {
    uint64_t v7 = [v5 registeredIdentityContainer];
    }

    uint64_t v8 = [v7 ngmFullDeviceIdentity];
    if (!v8
      || (__int16 v9 = (void *)v8,
          [v7 ngmVersion],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      uint64_t v11 = +[IMRGLog registration];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrying generation due to missing NGM component.", v14, 2u);
      }

      id v12 = [v7 legacyFullIdentity];
      unsigned int v13 = [(IDSRegistrationKeyManager *)self _generateUnregisteredIdentityWithExistingLegacyIdentity:v12 existingNGMIdentity:0];

      if (v13) {
        [(IDSRegistrationKeyManager *)self _notifyUnregisteredIdentityRegenerated];
      }
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
}

- (void)_retryGenerationAfterDelay
{
  [(IDSRegistrationKeyManager *)self _generationRetryDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  id v5 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A608;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

- (BOOL)_generateUnregisteredIdentityWithExistingLegacyIdentity:(id)a3 existingNGMIdentity:(id)a4
{
  id v54 = a3;
  id v56 = a4;
  id v6 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v7 = [v6 unregisteredIdentityContainer];
  uint64_t v8 = [v7 ngmFullDeviceIdentity];
  if (!v8)
  {

LABEL_7:
    int64_t v21 = +[IMRGLog registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Generating unregistered identity", buf, 2u);
    }

    __int16 v20 = v55;
    if (IMGetAppBoolForKey()) {
      sub_1001484DC(1, @"Key Rolling", @"Generating new identity", 1109);
    }
    __int16 v22 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v57 = 0;
    id v58 = 0;
    CFStringRef v23 = [v22 generateIdentityContainerWithIdentifier:1 existingLegacyIdentity:v55 existingNGMIdentity:v56 dataProtectionClass:0 nonLegacyError:&v58 error:&v57];
    id v24 = v58;
    id v16 = v57;

    [(IDSNGMKeyLoadingErrorContainer *)self->_recentKeyLoadingErrors setGenerationError:v24];
    id v25 = [(IDSRegistrationKeyManager *)self config];
    __int16 v26 = [v25 registeredIdentityContainer];
    unsigned int v27 = [v23 isEqual:v26];

    if (v27)
    {
      __int16 v28 = +[IMRGLog registration];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [(IDSRegistrationKeyManager *)self config];
        BOOL v30 = [v29 registeredIdentityContainer];
        *(_DWORD *)buf = 138412546;
        v60 = v23;
        __int16 v61 = 2112;
        v62 = v30;
        __int16 v31 = "generatedIdentityContainer isEqual to registeredIdentityContainer -- no changes {generatedIdentityContaine"
              "r: %@, registeredIdentityContainer: %@}";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v31, buf, 0x16u);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
    int64_t v32 = [(IDSRegistrationKeyManager *)self config];
    __int16 v33 = [v32 unregisteredIdentityContainer];
    unsigned int v34 = [v23 isEqual:v33];

    __int16 v28 = +[IMRGLog registration];
    BOOL v35 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v35)
      {
        id v29 = [(IDSRegistrationKeyManager *)self config];
        BOOL v30 = [v29 unregisteredIdentityContainer];
        *(_DWORD *)buf = 138412546;
        v60 = v23;
        __int16 v61 = 2112;
        v62 = v30;
        __int16 v31 = "generatedIdentityContainer isEqual unregisteredIdentityContainer -- no changes {generatedIdentityContainer"
              ": %@, unregisteredIdentityContainer: %@}";
        goto LABEL_17;
      }
LABEL_18:

      BOOL v19 = 0;
LABEL_35:

      goto LABEL_36;
    }
    if (v35)
    {
      *(_DWORD *)buf = 138412290;
      v60 = v23;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "generatedIdentityContainer is different from the registered and unregistered container -- has changes -- Updating unregistered container {generatedIdentityContainer: %@}", buf, 0xCu);
    }

    id v36 = [(IDSRegistrationKeyManager *)self config];
    [v36 setUnregisteredIdentityContainer:v23];

    id v37 = [(IDSRegistrationKeyManager *)self config];
    id v38 = [v37 unregisteredIdentityContainer];

    if (v38)
    {
      objc_super v39 = +[FTDeviceSupport sharedInstance];
      v40 = [v39 productBuildVersion];
      v41 = [(IDSRegistrationKeyManager *)self config];
      [v41 setBuildOfUnregisteredIdentityGeneration:v40];

      v42 = +[IMRGLog registration];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [(IDSRegistrationKeyManager *)self config];
        uint64_t v44 = [v43 buildOfUnregisteredIdentityGeneration];
        *(_DWORD *)buf = 138412290;
        v60 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Generated a new unregistered identity {build: %@}", buf, 0xCu);
      }
    }
    else
    {
      v45 = +[IMRGLog registration];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        sub_10070A470();
      }

      if (IMGetAppBoolForKey()) {
        sub_1001484DC(1, @"Key Rolling", @"Failed to generate new identity", 1109);
      }
    }
    +[IDSMessageMetricReporter noteKeyGenerationForMetric];
    v46 = [(IDSRegistrationKeyManager *)self config];
    uint64_t v47 = [v46 unregisteredIdentityContainer];
    uint64_t v48 = [v47 ngmFullDeviceIdentity];
    if (v48)
    {
      CFStringRef v49 = (void *)v48;
      v50 = [(IDSRegistrationKeyManager *)self config];
      v51 = [v50 unregisteredIdentityContainer];
      uint64_t v52 = [v51 ngmVersion];

      if (v52)
      {
        self->_generationRetryCount = 0;
LABEL_34:
        [(IDSRegistrationKeyManager *)self _save];
        BOOL v19 = 1;
        __int16 v20 = v55;
        goto LABEL_35;
      }
    }
    else
    {
    }
    ++self->_generationRetryCount;
    [(IDSRegistrationKeyManager *)self _retryGenerationAfterDelay];
    goto LABEL_34;
  }
  __int16 v9 = (void *)v8;
  id v10 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v11 = [v10 unregisteredIdentityContainer];
  id v12 = [v11 ngmVersion];
  unsigned int v13 = [(IDSRegistrationKeyManager *)self identityDataSource];
  id v14 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 ngmVersion]);
  unsigned __int8 v15 = [v12 isEqualToNumber:v14];

  if ((v15 & 1) == 0) {
    goto LABEL_7;
  }
  id v16 = +[IMRGLog registration];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(IDSRegistrationKeyManager *)self config];
    int v18 = [v17 unregisteredIdentityContainer];
    *(_DWORD *)buf = 138412290;
    v60 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Called _generateUnregisteredIdentityWithExistingLegacyIdentity but we have a valid unregisteredIdentity -- no changed {unregisteredIdentityContainer: %@}", buf, 0xCu);
  }
  BOOL v19 = 0;
  __int16 v20 = v54;
LABEL_36:

  return v19;
}

- (BOOL)_migrateRegisteredIdentityFromClassDtoClassCIfNeeded
{
  double v3 = [(IDSRegistrationKeyManager *)self config];
  dispatch_time_t v4 = [v3 registeredIdentityContainer];
  id v5 = [v4 legacyFullIdentity];

  LODWORD(v4) = [(IDSRegistrationKeyManager *)self _isSecurelyStoringIdentity:v5 withExpectedProtectionClass:0];
  id v6 = +[IMRGLog registration];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found internet message protection identity in class C -- no need to move it", (uint8_t *)&v11, 2u);
    }

    LOBYTE(v6) = 1;
  }
  else
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Moving internet messsage protection identity from class D to class C", (uint8_t *)&v11, 2u);
    }

    LODWORD(v6) = [(IDSRegistrationKeyManager *)self _migrateIdentity:v5 toProtectionClass:0];
    uint64_t v8 = +[IMRGLog registration];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (v6) {
        CFStringRef v9 = @"YES";
      }
      int v11 = 138412290;
      CFStringRef v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Result of moving internet messsage protection identity from D to C is %@", (uint8_t *)&v11, 0xCu);
    }

    if (v6)
    {
      LOBYTE(v6) = 1;
      self->_hasCheckedMigrationThisLaunch = 1;
    }
  }

  return (char)v6;
}

- (void)_notifyUnregisteredIdentityRegenerated
{
  double v3 = [(IDSRegistrationKeyManager *)self config];
  dispatch_time_t v4 = [v3 unregisteredIdentityContainer];
  if (v4)
  {
  }
  else
  {
    unsigned __int8 v5 = [(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager hasUnregisteredIdentity];

    if ((v5 & 1) == 0) {
      return;
    }
  }
  self->_needsReRegister = 1;
  [(IDSRegistrationKeyManager *)self _notifyRegenerateDelay];
  double v7 = v6;
  uint64_t v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delaying notification of identity regeneration {delay: %f seconds}", buf, 0xCu);
  }

  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  id v10 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003AFCC;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_after(v9, v10, block);
}

- (BOOL)registrationNeedsKTDataUpdated
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager registrationNeedKTDataUpdated];
  [(NSRecursiveLock *)self->_lock unlock];
  return v3;
}

- (void)_notifyUnregisteredKTData
{
  if ([(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager hasUnregisteredKTData])
  {
    self->_needsReRegister = 1;
    [(IDSRegistrationKeyManager *)self _notifyKTReregisterDelay];
    double v4 = v3;
    unsigned __int8 v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delaying notification of unregistered KT data {delay: %f seconds}", buf, 0xCu);
    }

    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    double v7 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003B2C0;
    block[3] = &unk_10097E4D0;
    block[4] = self;
    dispatch_after(v6, v7, block);
  }
}

- (id)fullMessageProtectionIdentity
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  double v3 = [(IDSRegistrationKeyManager *)self config];
  double v4 = [v3 registeredIdentityContainer];
  unsigned __int8 v5 = [v4 legacyFullIdentity];

  [(NSRecursiveLock *)self->_lock unlock];

  return v5;
}

- (id)previousFullMessageProtectionIdentity
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  double v3 = [(IDSRegistrationKeyManager *)self config];
  double v4 = [v3 previousRegisteredIdentityContainer];
  unsigned __int8 v5 = [v4 legacyFullIdentity];

  [(NSRecursiveLock *)self->_lock unlock];

  return v5;
}

- (id)fullMessageProtectionIdentityForDataProtectionClass:(unsigned int)a3
{
  double v3 = [(IDSRegistrationKeyManager *)self latestCopyMessageProtectionIdentityForDataProtectionClass:*(void *)&a3];
  if (v3)
  {
    double v4 = v3;
    id v5 = [objc_alloc((Class)IDSMPFullLegacyIdentity) initWithFullIdentity:v3];
    CFRelease(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)notePublicIdentityDidRegisterLegacyData:(id)a3 ngmIdentityData:(id)a4 ngmPrekeyData:(id)a5 keyIndexToIdentityData:(id)a6
{
  double v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = (__CFString *)a6;
  [(NSRecursiveLock *)self->_lock lock];
  id v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    CFStringRef v157 = v10;
    __int16 v158 = 2112;
    uint64_t v159 = (uint64_t)v11;
    __int16 v160 = 2112;
    id v161 = v12;
    __int16 v162 = 2112;
    CFStringRef v163 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Registration key manager noting registration of keys { legacyData: %@, ngmIdentityData: %@, ngmPrekeyData: %@, keyIndexToIdentityData: %@ }", buf, 0x2Au);
  }

  unsigned __int8 v15 = [(IDSRegistrationKeyManager *)self config];
  id v16 = [v15 unregisteredIdentityContainer];

  v132 = v11;
  v133 = v12;
  if (v16)
  {
    v138 = v13;
    id v17 = [(IDSRegistrationKeyManager *)self config];
    int v18 = [v17 unregisteredIdentityContainer];
    id v154 = 0;
    BOOL v19 = [v18 publicIdentityWithError:&v154];
    __int16 v20 = (__CFString *)v154;

    if (v19)
    {
      int64_t v21 = [v19 legacyPublicIdentity];
      v153 = v20;
      uint64_t v22 = [v21 dataRepresentationWithError:&v153];
      CFStringRef v23 = v153;

      v140 = (void *)v22;
      if (!v22)
      {
        id v24 = +[IMRGLog registration];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10070A794();
        }
      }
      id v25 = [(IDSRegistrationKeyManager *)self config];
      __int16 v26 = [v25 unappliedRollingTicket];

      if (v26)
      {
        unsigned int v27 = [(IDSRegistrationKeyManager *)self config];
        __int16 v28 = [v27 unappliedRollingTicket];
        id v29 = [v28 identityData];

        BOOL v30 = [(IDSRegistrationKeyManager *)self config];
        __int16 v31 = [v30 unappliedRollingTicket];
        int64_t v32 = [v31 prekeyData];
      }
      else
      {
        unsigned int v34 = [v19 ngmPublicDeviceIdentity];
        id v29 = [v34 identityData];

        BOOL v30 = [v19 ngmPublicDeviceIdentity];
        int64_t v32 = [v30 prekeyData];
      }

      if (v29 && v32)
      {
LABEL_19:

        BOOL v35 = [(IDSRegistrationKeyManager *)self config];
        id v36 = [v35 unregisteredIdentityContainer];
        id v37 = [v36 legacyFullIdentity];
        id v38 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v37];

        if (v10) {
          unsigned int v39 = [v140 isEqualToData:v10];
        }
        else {
          unsigned int v39 = 0;
        }
        if (v29 == v11)
        {
          unsigned int v40 = 1;
        }
        else if (v11)
        {
          unsigned int v40 = [v29 isEqualToData:v11];
        }
        else
        {
          unsigned int v40 = 0;
        }
        if (v32 == v133)
        {
          uint64_t v41 = 1;
        }
        else
        {
          if (!v133)
          {
            LODWORD(v41) = 0;
            goto LABEL_40;
          }
          uint64_t v41 = (uint64_t)[v32 isEqualToData:v133];
        }
        if ((v39 & v40) == 1 && v41)
        {
          v42 = [(IDSRegistrationKeyManager *)self config];
          v43 = [v42 unappliedRollingTicket];

          if (v43)
          {
            uint64_t v44 = [(IDSRegistrationKeyManager *)self config];
            v45 = [v44 unregisteredIdentityContainer];
            uint64_t v41 = [v45 ngmFullDeviceIdentity];
            v46 = [(IDSRegistrationKeyManager *)self config];
            uint64_t v47 = [v46 unappliedRollingTicket];
            id v152 = 0;
            unsigned int v48 = [(id)v41 updateWithRegisteredTicket:v47 error:&v152];
            id v136 = v152;

            CFStringRef v49 = [(IDSRegistrationKeyManager *)self config];
            [v49 setUnappliedRollingTicket:0];

            if (IMGetAppBoolForKey())
            {
              CFStringRef v50 = @"NO";
              if (v48) {
                CFStringRef v50 = @"YES";
              }
              v51 = +[NSString stringWithFormat:@"Rolled key, did succeed %@", v50];
              sub_1001484DC(1, @"NGM Key Rolling", v51, 1109);

              if ((v48 & 1) == 0) {
                goto LABEL_56;
              }
            }
            else if (!v48)
            {
LABEL_56:
              uint64_t v77 = +[IMRGLog registration];
              __int16 v76 = v136;
              double v13 = v138;
              if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
                sub_10070A5F0(self, (uint64_t)v136, v77);
              }

LABEL_59:
LABEL_60:

              goto LABEL_61;
            }
          }
          else
          {
            id v136 = 0;
          }
          v53 = [(IDSRegistrationKeyManager *)self config];
          id v54 = [v53 registeredIdentityContainer];
          v55 = [(IDSRegistrationKeyManager *)self config];
          [v55 setPreviousRegisteredIdentityContainer:v54];

          id v56 = [(IDSRegistrationKeyManager *)self config];
          id v57 = [v56 unregisteredIdentityContainer];
          id v58 = [(IDSRegistrationKeyManager *)self config];
          [v58 setRegisteredIdentityContainer:v57];

          BOOL v59 = [(IDSRegistrationKeyManager *)self config];
          [v59 setUnregisteredIdentityContainer:0];

          v60 = [(IDSRegistrationKeyManager *)self config];
          __int16 v61 = [v60 buildOfUnregisteredIdentityGeneration];
          v62 = v61;
          if (!v61)
          {
            uint64_t v41 = [(IDSRegistrationKeyManager *)self config];
            v62 = [(id)v41 buildOfIdentityGeneration];
          }
          id v63 = [(IDSRegistrationKeyManager *)self config];
          [v63 setBuildOfIdentityGeneration:v62];

          if (!v61)
          {
          }
          v64 = [(IDSRegistrationKeyManager *)self config];
          [v64 setBuildOfUnregisteredIdentityGeneration:0];

          v65 = +[IMRGLog registration];
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v134 = [(IDSRegistrationKeyManager *)self config];
            uint64_t v66 = [v134 previousRegisteredIdentityContainer];
            CFStringRef v67 = [(IDSRegistrationKeyManager *)self config];
            CFStringRef v68 = [v67 registeredIdentityContainer];
            v69 = [(IDSRegistrationKeyManager *)self config];
            [v69 buildOfIdentityGeneration];
            v71 = v70 = v10;
            *(_DWORD *)buf = 138412802;
            CFStringRef v157 = v66;
            __int16 v158 = 2112;
            uint64_t v159 = (uint64_t)v68;
            __int16 v160 = 2112;
            id v161 = v71;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Completed registration of previously unregistered identity {previousIdentity: %@, identity: %@, buildOfIdentityGeneration: %@}", buf, 0x20u);

            double v10 = v70;
          }

          if (IMGetAppBoolForKey()) {
            sub_1001484DC(1, @"Key Rolling", @"Registered new identity", 1109);
          }
          [(IDSRegistrationKeyManager *)self _save];
          v72 = [(IDSRegistrationKeyManager *)self config];
          id v73 = [v72 previousRegisteredIdentityContainer];

          double v13 = v138;
          if (v73)
          {
            +[NSDate timeIntervalSinceReferenceDate];
            uint64_t v75 = +[NSNumber numberWithDouble:v74 + 3196800.0];
            IMSetAppValueForKey();

            [(IDSRegistrationKeyManager *)self _schedulePurgeOfPreviousIdentityAfterDelay:3196800.0];
          }
          __int16 v76 = v136;
          goto LABEL_59;
        }
LABEL_40:
        uint64_t v52 = +[IMRGLog registration];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
        {
          CFStringRef v122 = @"NO";
          if (v39) {
            CFStringRef v123 = @"YES";
          }
          else {
            CFStringRef v123 = @"NO";
          }
          if (v40) {
            CFStringRef v124 = @"YES";
          }
          else {
            CFStringRef v124 = @"NO";
          }
          *(_DWORD *)buf = 138412802;
          CFStringRef v157 = v123;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v124;
          if (v41) {
            CFStringRef v122 = @"YES";
          }
          __int16 v160 = 2112;
          id v161 = (id)v122;
          _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "Completed registration of public identity, but it's not the identity we expected {legacyDataMatches: %@, ngmIdentityDataMatches: %@, ngmPrekeyDataMatches: %@}", buf, 0x20u);
        }

        double v13 = v138;
        if (IMGetAppBoolForKey()) {
          sub_1001484DC(1, @"Key Rolling", @"Failed to compare registered identity", 1109);
        }
        goto LABEL_60;
      }
      __int16 v33 = +[IMRGLog registration];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        char v125 = [(IDSRegistrationKeyManager *)self config];
        uint64_t v126 = [v125 unappliedRollingTicket];
        v127 = (void *)v126;
        CFStringRef v128 = @"NO";
        *(_DWORD *)buf = 138544387;
        CFStringRef v157 = v23;
        __int16 v158 = 2112;
        if (v29) {
          CFStringRef v129 = @"YES";
        }
        else {
          CFStringRef v129 = @"NO";
        }
        uint64_t v159 = v126;
        if (v32) {
          CFStringRef v128 = @"YES";
        }
        __int16 v160 = 2113;
        id v161 = v19;
        __int16 v162 = 2113;
        CFStringRef v163 = v129;
        __int16 v164 = 2113;
        CFStringRef v165 = v128;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to get expectedNGMPublicIdentityData/expectedNGMPublicPrekeyData -- Not updating registered data {error: %{public}@, unappliedRollingTicket: %@, publicUnregisteredIdentityContainer: %{private}@, expectedNGMPublicIdentityData: %{private}@, expectedNGMPublicPrekeyData: %{private}@}", buf, 0x34u);
      }
    }
    else
    {
      __int16 v33 = +[IMRGLog registration];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10070A6F8();
      }
      v140 = 0;
      id v29 = 0;
      int64_t v32 = 0;
      CFStringRef v23 = v20;
    }

    goto LABEL_19;
  }
LABEL_61:
  id v151 = 0;
  __int16 v78 = [(IDSRegistrationKeyManager *)self publicMessageProtectionDeviceIdentityContainerToRegister:&v151];
  id v79 = v151;
  v141 = v78;
  __int16 v80 = [v78 legacyPublicIdentity];
  id v150 = v79;
  uint64_t v81 = [v80 dataRepresentationWithError:&v150];
  v82 = (__CFString *)v150;

  v83 = +[IMRGLog registration];
  v84 = v83;
  v139 = (void *)v81;
  if (!v81)
  {
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
      sub_10070A580();
    }
    v87 = v82;
    goto LABEL_70;
  }
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v157 = @"message-protection-public-data-registered";
    __int16 v158 = 2112;
    uint64_t v159 = v81;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Saving public legacy message protection data {identifier: %@, data: %@}", buf, 0x16u);
  }

  v85 = [(IDSRegistrationKeyManager *)self keychainWrapper];
  v149 = v82;
  unsigned __int8 v86 = [v85 saveData:v81 forIdentifier:@"message-protection-public-data-registered" allowSync:0 dataProtectionClass:0 error:&v149];
  v87 = v149;

  if ((v86 & 1) == 0)
  {
    v84 = +[IMRGLog registration];
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      CFStringRef v157 = v87;
      __int16 v158 = 2113;
      uint64_t v159 = v81;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Failed to save legacy public message protection data {error: %{public}@, publicData: %{private}@}", buf, 0x16u);
    }
LABEL_70:
  }
  CFStringRef v88 = [v141 ngmPublicDeviceIdentity];
  uint64_t v89 = [v88 identityData];

  v90 = [v141 ngmPublicDeviceIdentity];
  uint64_t v91 = [v90 prekeyData];

  CFStringRef v92 = +[IMRGLog registration];
  CFStringRef v93 = v92;
  v135 = (void *)v91;
  v137 = (void *)v89;
  if (!v89 || !v91)
  {
    if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
      sub_10070A510();
    }
    goto LABEL_86;
  }
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v157 = @"ngm-message-protection-public-data-registered";
    __int16 v158 = 2112;
    uint64_t v159 = v89;
    _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Saving public ngm message protection identity data {identifier: %@, data: %@}", buf, 0x16u);
  }

  CFStringRef v94 = [(IDSRegistrationKeyManager *)self keychainWrapper];
  v148 = v87;
  unsigned __int8 v95 = [v94 saveData:v89 forIdentifier:@"ngm-message-protection-public-data-registered" allowSync:0 dataProtectionClass:0 error:&v148];
  v96 = v148;

  if ((v95 & 1) == 0)
  {
    v97 = +[IMRGLog registration];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      CFStringRef v157 = v96;
      __int16 v158 = 2113;
      uint64_t v159 = (uint64_t)v137;
      _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Failed to save ngm public message protection identity data {error: %{public}@, publicData: %{private}@}", buf, 0x16u);
    }
  }
  v98 = +[IMRGLog registration];
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v157 = @"ngm-message-protection-public-prekey-data-registered";
    __int16 v158 = 2112;
    uint64_t v159 = (uint64_t)v135;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Saving public ngm message protection prekey data {identifier: %@, data: %@}", buf, 0x16u);
  }

  v99 = [(IDSRegistrationKeyManager *)self keychainWrapper];
  v147 = v96;
  unsigned __int8 v100 = [v99 saveData:v135 forIdentifier:@"ngm-message-protection-public-prekey-data-registered" allowSync:0 dataProtectionClass:0 error:&v147];
  v87 = v147;

  if ((v100 & 1) == 0)
  {
    CFStringRef v93 = +[IMRGLog registration];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543619;
      CFStringRef v157 = v87;
      __int16 v158 = 2113;
      uint64_t v159 = (uint64_t)v135;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Failed to save ngm public message protection prekey data {error: %{public}@, publicData: %{private}@}", buf, 0x16u);
    }
LABEL_86:
  }
  v101 = [v141 ngmVersion];
  if (v101)
  {
    v102 = v13;
    v103 = v10;
    v104 = [(IDSRegistrationKeyManager *)self identityDataSource];
    v105 = objc_msgSend(v104, "dataRepresentationForNGMVersion:", objc_msgSend(v101, "unsignedIntValue"));

    v106 = +[IMRGLog registration];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v157 = @"ngm-message-protection-public-data-registered-version";
      __int16 v158 = 2114;
      uint64_t v159 = (uint64_t)v101;
      __int16 v160 = 2114;
      id v161 = v105;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Saving public ngm version data {identifier: %{public}@, ngmVersion: %{public}@, ngmVersionData: %{public}@}", buf, 0x20u);
    }
    v107 = v101;

    v108 = [(IDSRegistrationKeyManager *)self keychainWrapper];
    v146 = v87;
    unsigned __int8 v109 = [v108 saveData:v105 forIdentifier:@"ngm-message-protection-public-data-registered-version" allowSync:0 dataProtectionClass:0 error:&v146];
    CFStringRef v110 = v146;

    if (v109)
    {
      v101 = v107;
    }
    else
    {
      v111 = +[IMRGLog registration];
      v101 = v107;
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v157 = v110;
        __int16 v158 = 2114;
        uint64_t v159 = (uint64_t)v107;
        __int16 v160 = 2114;
        id v161 = v105;
        _os_log_error_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_ERROR, "Failed to public ngm version data {error: %{public}@, ngmVersion: %{public}@, ngmVersionData: %{public}@}", buf, 0x20u);
      }
    }
    double v10 = v103;
    double v13 = v102;
  }
  else
  {
    v105 = +[IMRGLog registration];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      sub_10070A4A4();
    }
    CFStringRef v110 = v87;
  }
  v131 = (__CFString *)v110;

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  v112 = v13;
  id v113 = [(__CFString *)v112 countByEnumeratingWithState:&v142 objects:v155 count:16];
  if (v113)
  {
    id v114 = v113;
    v130 = v101;
    int v115 = v10;
    int v116 = 0;
    uint64_t v117 = *(void *)v143;
    do
    {
      for (i = 0; i != v114; i = (char *)i + 1)
      {
        if (*(void *)v143 != v117) {
          objc_enumerationMutation(v112);
        }
        v119 = *(void **)(*((void *)&v142 + 1) + 8 * i);
        v120 = [(__CFString *)v112 objectForKeyedSubscript:v119];
        if (v120) {
          v116 |= -[IDSPerServiceApplicationKeyManager notePublicIdentityDidRegisterKeyData:forKeyIndex:](self->_applicationKeyManager, "notePublicIdentityDidRegisterKeyData:forKeyIndex:", v120, (unsigned __int16)[v119 unsignedIntValue]);
        }
      }
      id v114 = [(__CFString *)v112 countByEnumeratingWithState:&v142 objects:v155 count:16];
    }
    while (v114);

    double v10 = v115;
    v101 = v130;
    if (v116) {
      [(IDSRegistrationKeyManager *)self _save];
    }
  }
  else
  {
  }
  if (self->_needsReRegister)
  {
    v121 = +[IMRGLog registration];
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "Clearing flag about needing a re-register; it looks to be successful",
        buf,
        2u);
    }

    self->_needsReRegister = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)noteDidRegisterKTData:(id)a3 forKeyIndex:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
  {
    if (v6) {
      [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager notePublicIdentityDidRegisterKTData:v6 forKeyIndex:v4];
    }
  }
  else
  {
    double v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)purgeMessageProtectionIdentity
{
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing current message protection identity and key pair", buf, 2u);
  }

  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  [(NSRecursiveLock *)self->_lock lock];
  *(_WORD *)&self->_loaded = 0;
  uint64_t v4 = [(IDSRegistrationKeyManager *)self config];
  [v4 setPrivateKey:0];

  id v5 = [(IDSRegistrationKeyManager *)self config];
  [v5 setPublicKey:0];

  id v6 = [(IDSRegistrationKeyManager *)self config];
  [v6 setSignature:0];

  double v7 = [(IDSRegistrationKeyManager *)self identityDataSource];
  uint64_t v8 = [(IDSRegistrationKeyManager *)self config];
  dispatch_time_t v9 = [v8 registeredIdentityContainer];
  id v30 = 0;
  unsigned __int8 v10 = [v7 removeIdentityContainer:v9 withIdentifier:2 dataProtectionClass:0 error:&v30];
  id v11 = v30;

  if ((v10 & 1) == 0)
  {
    id v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10070A8DC();
    }
  }
  double v13 = [(IDSRegistrationKeyManager *)self identityDataSource];
  id v14 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v15 = [v14 unregisteredIdentityContainer];
  id v29 = v11;
  unsigned __int8 v16 = [v13 removeIdentityContainer:v15 withIdentifier:1 dataProtectionClass:0 error:&v29];
  id v17 = v29;

  if ((v16 & 1) == 0)
  {
    int v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10070A870();
    }
  }
  BOOL v19 = [(IDSRegistrationKeyManager *)self identityDataSource];
  __int16 v20 = [(IDSRegistrationKeyManager *)self config];
  int64_t v21 = [v20 previousRegisteredIdentityContainer];
  id v28 = v17;
  unsigned __int8 v22 = [v19 removeIdentityContainer:v21 withIdentifier:3 dataProtectionClass:0 error:&v28];
  id v23 = v28;

  if ((v22 & 1) == 0)
  {
    id v24 = +[IMRGLog registration];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      sub_10070A804();
    }
  }
  id v25 = [(IDSRegistrationKeyManager *)self config];
  [v25 setRegisteredIdentityContainer:0];

  __int16 v26 = [(IDSRegistrationKeyManager *)self config];
  [v26 setUnregisteredIdentityContainer:0];

  unsigned int v27 = [(IDSRegistrationKeyManager *)self config];
  [v27 setPreviousRegisteredIdentityContainer:0];

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_purgePreviousIdentityFromMemoryAndKeychain
{
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Purging previous message protection identity from memory and keychain", buf, 2u);
  }

  [(NSRecursiveLock *)self->_lock lock];
  uint64_t v4 = [(IDSRegistrationKeyManager *)self config];
  uint64_t v5 = [v4 previousRegisteredIdentityContainer];
  if (v5)
  {
    id v6 = (void *)v5;
    double v7 = [(IDSRegistrationKeyManager *)self config];
    uint64_t v8 = [v7 previousRegisteredIdentityContainer];
    dispatch_time_t v9 = [(IDSRegistrationKeyManager *)self config];
    unsigned __int8 v10 = [v9 registeredIdentityContainer];

    if (v8 != v10)
    {
      id v11 = [(IDSRegistrationKeyManager *)self identityDataSource];
      id v12 = [(IDSRegistrationKeyManager *)self config];
      double v13 = [v12 previousRegisteredIdentityContainer];
      id v26 = 0;
      unsigned int v14 = [v11 removeIdentityContainer:v13 withIdentifier:3 dataProtectionClass:0 error:&v26];
      unsigned __int8 v15 = v26;

      unsigned __int8 v16 = +[IMRGLog registration];
      id v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = [(IDSRegistrationKeyManager *)self config];
          BOOL v19 = [v18 previousRegisteredIdentityContainer];
          *(_DWORD *)buf = 138477827;
          id v28 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removed previous identity from memory and keychain {previousIdentity: %{private}@}", buf, 0xCu);
        }
        __int16 v20 = [(IDSRegistrationKeyManager *)self config];
        [v20 setPreviousRegisteredIdentityContainer:0];

        if ((IMGetAppBoolForKey() & 1) == 0) {
          goto LABEL_18;
        }
        int64_t v21 = @"Purged previous identity";
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10070A948();
        }

        if (!IMGetAppBoolForKey()) {
          goto LABEL_18;
        }
        int64_t v21 = @"Failed to purge previous identity";
      }
      sub_1001484DC(1, @"Key Rolling", v21, 1109);
LABEL_18:
      [(IDSRegistrationKeyManager *)self _save];
      goto LABEL_19;
    }
  }
  else
  {
  }
  unsigned __int8 v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v22 = [(IDSRegistrationKeyManager *)self config];
    id v23 = [v22 previousRegisteredIdentityContainer];
    id v24 = [(IDSRegistrationKeyManager *)self config];
    id v25 = [v24 registeredIdentityContainer];
    *(_DWORD *)buf = 138412546;
    id v28 = v23;
    __int16 v29 = 2112;
    id v30 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No previous identity to purge -- ignoring request {previousIdentity: %@, identity: %@}", buf, 0x16u);
  }
LABEL_19:

  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_ktDataNeedsUpdate:(id)a3
{
  unsigned __int8 v4 = +[IDSKeyTransparencyVerifier isKeyTransparencyEnabled];
  uint64_t v5 = +[IMRGLog registration];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification that KT data needs updating.", buf, 2u);
    }

    id v12 = 0;
    double v7 = [(IDSRegistrationKeyManager *)self publicMessageProtectionIdentityDataToRegisterWithError:&v12];
    id v6 = v12;
    uint64_t v8 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CFA8;
    block[3] = &unk_10097E440;
    block[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, block);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_100709BD4();
  }
}

- (void)_generateKTRegistrationData:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager requestGenerationOfUnregisteredKTRegDataWithPublicIdentityData:v5 applicationKeyManager:self->_applicationKeyManager];

  id v6 = self->_lock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)fetchKTSignatureDataForServiceTypes:(id)a3 publicIdentityData:(id)a4 withCompletion:(id)a5
{
  lock = self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(NSRecursiveLock *)lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager fetchKTSignatureDataForServiceTypes:v11 publicIdentityData:v10 applicationKeyManager:self->_applicationKeyManager withCompletion:v9];

  id v12 = self->_lock;

  [(NSRecursiveLock *)v12 unlock];
}

- (void)_handleKVSUpdateResponseForTrustedDevices:(id)a3 withSuccessfulKVSSync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  double v7 = +[IMRGLog registration];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully synced KVS with trusted devices. { trustedDevices: %@ }", (uint8_t *)&v9, 0xCu);
    }

    [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager noteSuccessfulKVSSyncOfTrustedDevices:v6];
  }
  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to sync trusted devices to KVS. Scheduling next sync attempt. { trustedDevices: %@ }", (uint8_t *)&v9, 0xCu);
    }

    [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager scheduleNextKVSSync];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)updateKVSForKTRegistrationData
{
  if (+[IDSKeyTransparencyVerifier isKeyTransparencyEnabled])
  {
    [(NSRecursiveLock *)self->_lock lock];
    [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager updateKVSWithCurrentKTRegistrationData];
    lock = self->_lock;
    [(NSRecursiveLock *)lock unlock];
  }
  else
  {
    BOOL v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100709BD4();
    }
  }
}

- (id)kvsTrustedDevices
{
  [(NSRecursiveLock *)self->_lock lock];
  id v3 = objc_alloc_init((Class)NSMutableArray);
  BOOL v4 = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:0];
  id v5 = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager _createKTTrustedDeviceForKVSisRegistered:1];
  if (v4) {
    [v3 addObject:v4];
  }
  if (v5) {
    [v3 addObject:v5];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v3;
}

- (void)noteiCloudSignInTime
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager noteiCloudSignInTime];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)noteBuddyFinishTime
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager noteBuddyFinishTime];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)noteManateeAvailableTime
{
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager noteManateeAvailableTime];
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)loadPairingIdentities:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IDSRegistrationKeyManager *)self allowPairingIdentities])
  {
    [(NSRecursiveLock *)self->_lock lock];
    id v55 = 0;
    [(IDSRegistrationKeyManager *)self _loadClassAIdentityIfNeeded:&v55];
    id v5 = v55;
    id v6 = [(IDSRegistrationKeyManager *)self config];
    double v7 = [v6 identityClassA];
    id v8 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v7];

    id v54 = 0;
    [(IDSRegistrationKeyManager *)self _loadClassCIdentityIfNeeded:&v54];
    id v9 = v54;
    id v10 = [(IDSRegistrationKeyManager *)self config];
    id v11 = [v10 identityClassC];
    id v12 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v11];

    id v53 = 0;
    [(IDSRegistrationKeyManager *)self _loadClassDIdentityIfNeeded:&v53];
    id v13 = v53;
    unsigned int v14 = [(IDSRegistrationKeyManager *)self config];
    unsigned __int8 v15 = [v14 identityClassD];
    id v16 = [(IDSRegistrationKeyManager *)self _getPublicMessageProtectionDataForIdentity:v15];

    if (v3)
    {
      __int16 v52 = 0;
      char v51 = 0;
      id v17 = [(IDSRegistrationKeyManager *)self config];
      int v18 = [v17 identityClassA];
      if (v18)
      {
      }
      else
      {
        unsigned __int8 v19 = +[IDSKeychainWrapper isInteractionNotAllowedError:v5];

        if ((v19 & 1) == 0)
        {
          __int16 v20 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v20 unSavedidentityClassA];

          int64_t v21 = [(IDSRegistrationKeyManager *)self config];
          id v49 = [v21 identityClassA];

          [(IDSRegistrationKeyManager *)self _ensureIdentity:buf savedIndentity:&v49 protectionClass:1 didSaveIdentity:(char *)&v52 + 1];
          id v22 = *(id *)buf;
          id v23 = [(IDSRegistrationKeyManager *)self config];
          [v23 setUnSavedidentityClassA:v22];

          id v24 = v49;
          id v25 = [(IDSRegistrationKeyManager *)self config];
          [v25 setIdentityClassA:v24];
        }
      }
      id v26 = [(IDSRegistrationKeyManager *)self config];
      unsigned int v27 = [v26 identityClassC];
      if (v27)
      {
      }
      else
      {
        unsigned __int8 v28 = +[IDSKeychainWrapper isInteractionNotAllowedError:v9];

        if ((v28 & 1) == 0)
        {
          __int16 v29 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v29 unSavedidentityClassC];

          id v30 = [(IDSRegistrationKeyManager *)self config];
          id v49 = [v30 identityClassC];

          [(IDSRegistrationKeyManager *)self _ensureIdentity:buf savedIndentity:&v49 protectionClass:0 didSaveIdentity:&v52];
          id v31 = *(id *)buf;
          int64_t v32 = [(IDSRegistrationKeyManager *)self config];
          [v32 setUnSavedidentityClassC:v31];

          id v33 = v49;
          unsigned int v34 = [(IDSRegistrationKeyManager *)self config];
          [v34 setIdentityClassC:v33];
        }
      }
      BOOL v35 = [(IDSRegistrationKeyManager *)self config];
      id v36 = [v35 identityClassD];
      if (v36)
      {
      }
      else
      {
        unsigned __int8 v37 = +[IDSKeychainWrapper isInteractionNotAllowedError:v13];

        if ((v37 & 1) == 0)
        {
          id v38 = [(IDSRegistrationKeyManager *)self config];
          *(void *)buf = [v38 unSavedidentityClassD];

          unsigned int v39 = [(IDSRegistrationKeyManager *)self config];
          id v49 = [v39 identityClassD];

          [(IDSRegistrationKeyManager *)self _ensureIdentity:buf savedIndentity:&v49 protectionClass:2 didSaveIdentity:&v51];
          id v40 = *(id *)buf;
          uint64_t v41 = [(IDSRegistrationKeyManager *)self config];
          [v41 setUnSavedidentityClassD:v40];

          id v42 = v49;
          v43 = [(IDSRegistrationKeyManager *)self config];
          [v43 setIdentityClassD:v42];
        }
      }
      uint64_t v44 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003D8D8;
      block[3] = &unk_10097EDB0;
      char v46 = HIBYTE(v52);
      char v47 = v52;
      char v48 = v51;
      block[4] = self;
      dispatch_async(v44, block);
    }
    [(NSRecursiveLock *)self->_lock unlock];
  }
  else
  {
    id v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping loadPairingIdentities becuase shouldGeneratePairingIdentities == NO", buf, 2u);
    }
  }
}

- (void)regeneratePairingIdentitiesIncludingClassD:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  id v5 = [(IDSRegistrationKeyManager *)self systemMonitor];
  unsigned int v6 = [v5 isUnderDataProtectionLock];

  if (v6)
  {
    self->_pendingIdentityRegeneration = 1;
  }
  else
  {
    double v7 = [(IDSRegistrationKeyManager *)self identityDataSource];
    id v8 = [(IDSRegistrationKeyManager *)self config];
    id v9 = [v8 identityClassA];
    id v44 = 0;
    unsigned __int8 v10 = [v7 removeLegacyIdentity:v9 withIdentifier:4 dataProtectionClass:1 error:&v44];
    id v11 = v44;

    if ((v10 & 1) == 0)
    {
      id v12 = +[IMRGLog registration];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10070AB1C();
      }
    }
    id v13 = [(IDSRegistrationKeyManager *)self config];
    [v13 setIdentityClassA:0];

    unsigned int v14 = [(IDSRegistrationKeyManager *)self config];
    unsigned __int8 v15 = [v14 unSavedidentityClassA];
    id v43 = v11;
    [v15 purgeFromKeychain:&v43];
    id v16 = v43;

    id v17 = [(IDSRegistrationKeyManager *)self config];
    [v17 setUnSavedidentityClassA:0];

    int v18 = [(IDSRegistrationKeyManager *)self identityDataSource];
    unsigned __int8 v19 = [(IDSRegistrationKeyManager *)self config];
    __int16 v20 = [v19 identityClassC];
    id v42 = v16;
    unsigned __int8 v21 = [v18 removeLegacyIdentity:v20 withIdentifier:5 dataProtectionClass:0 error:&v42];
    id v22 = v42;

    if ((v21 & 1) == 0)
    {
      id v23 = +[IMRGLog registration];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10070AA80();
      }
    }
    id v24 = [(IDSRegistrationKeyManager *)self config];
    [v24 setIdentityClassC:0];

    id v25 = [(IDSRegistrationKeyManager *)self config];
    id v26 = [v25 unSavedidentityClassC];
    id v41 = v22;
    [v26 purgeFromKeychain:&v41];
    id v27 = v41;

    unsigned __int8 v28 = [(IDSRegistrationKeyManager *)self config];
    [v28 setUnSavedidentityClassC:0];

    if (v3)
    {
      __int16 v29 = [(IDSRegistrationKeyManager *)self identityDataSource];
      id v30 = [(IDSRegistrationKeyManager *)self config];
      id v31 = [v30 identityClassD];
      id v40 = v27;
      unsigned __int8 v32 = [v29 removeLegacyIdentity:v31 withIdentifier:6 dataProtectionClass:2 error:&v40];
      id v33 = v40;

      if ((v32 & 1) == 0)
      {
        unsigned int v34 = +[IMRGLog registration];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10070A9E4();
        }
      }
      BOOL v35 = [(IDSRegistrationKeyManager *)self config];
      [v35 setIdentityClassD:0];

      id v36 = [(IDSRegistrationKeyManager *)self config];
      unsigned __int8 v37 = [v36 unSavedidentityClassD];
      id v39 = v33;
      [v37 purgeFromKeychain:&v39];
      id v27 = v39;

      id v38 = [(IDSRegistrationKeyManager *)self config];
      [v38 setUnSavedidentityClassD:0];
    }
    [(IDSRegistrationKeyManager *)self loadPairingIdentities:1];
    self->_pendingIdentityRegeneration = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (__SecKey)identityPrivateKey
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:0];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  BOOL v4 = (__SecKey *)[v3 privateKey];

  return v4;
}

- (__SecKey)identityPublicKey
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:0];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  BOOL v4 = (__SecKey *)[v3 publicKey];

  return v4;
}

- (id)keyPairSignature
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:0];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  BOOL v4 = [v3 signature];

  return v4;
}

- (BOOL)needsPublicDataUpdatedForKeyIndex:(unsigned __int16)a3 ktRegistrationKeyIndex:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v61 = 0;
  double v7 = [(IDSRegistrationKeyManager *)self publicMessageProtectionDeviceIdentityContainerToRegister:&v61];
  id v8 = v61;
  id v9 = [v7 legacyPublicIdentity];
  id v60 = v8;
  unsigned __int8 v10 = [v9 dataRepresentationWithError:&v60];
  id v11 = v60;

  if (![(IDSRegistrationKeyManager *)self requiresKeychainMigration])
  {
    if (![v10 length])
    {
      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10070ABB8();
      }
      BOOL v12 = 0;
      goto LABEL_57;
    }
    if (self->_needsReRegister)
    {
      BOOL v12 = 1;
      goto LABEL_58;
    }
    unsigned int v14 = [(IDSRegistrationKeyManager *)self keychainWrapper];
    BOOL v59 = v11;
    id v13 = [v14 dataForIdentifier:@"message-protection-public-data-registered" error:&v59];
    id v54 = v59;

    if ([v13 length])
    {
      if ([v13 isEqualToData:v10])
      {
        BOOL v12 = 0;
LABEL_17:
        id v17 = [v7 ngmPublicDeviceIdentity];
        int v18 = [v17 identityData];

        unsigned __int8 v19 = [v7 ngmPublicDeviceIdentity];
        id v55 = [v19 prekeyData];

        if (![v18 length] || !objc_msgSend(v55, "length"))
        {
          __int16 v20 = +[IMRGLog registration];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            CFStringRef v45 = @"YES";
            *(_DWORD *)buf = 138544131;
            id v63 = v54;
            if (v18) {
              CFStringRef v46 = @"YES";
            }
            else {
              CFStringRef v46 = @"NO";
            }
            if (!v55) {
              CFStringRef v45 = @"NO";
            }
            __int16 v64 = 2113;
            v65 = v7;
            __int16 v66 = 2113;
            CFStringRef v67 = v46;
            __int16 v68 = 2113;
            CFStringRef v69 = v45;
            _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Missing publicNGMIdentityData or publicNGMPrekeyData -- Not checking ngm data {error: %{public}@, publicContainer: %{private}@, publicNGMIdentityData: %{private}@, publicNGMPrekeyData: %{private}@}", buf, 0x2Au);
          }
        }
        uint64_t v21 = [v7 ngmVersion];
        id v22 = (void *)v21;
        id v53 = v18;
        if (!v21)
        {
          unsigned __int8 v32 = +[IMRGLog registration];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            sub_10070AC28();
          }
          goto LABEL_47;
        }
        if (!v18 || !v55) {
          goto LABEL_48;
        }
        char v48 = v13;
        __int16 v52 = (void *)v21;
        id v23 = [(IDSRegistrationKeyManager *)self keychainWrapper];
        id v58 = v54;
        uint64_t v24 = [v23 dataForIdentifier:@"ngm-message-protection-public-data-registered" error:&v58];
        id v25 = v58;

        id v26 = v24;
        id v27 = [(IDSRegistrationKeyManager *)self keychainWrapper];
        id v57 = v25;
        unsigned __int8 v28 = [v27 dataForIdentifier:@"ngm-message-protection-public-prekey-data-registered" error:&v57];
        char v51 = v57;

        CFStringRef v50 = v28;
        if ([v26 length] && [v28 length])
        {
          if ([v26 isEqualToData:v53])
          {
            unsigned __int8 v29 = [v28 isEqualToData:v55];
            id v30 = v52;
            id v13 = v48;
            if (v29) {
              goto LABEL_38;
            }
            id v31 = +[IMRGLog registration];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138478083;
              id v63 = v50;
              __int16 v64 = 2113;
              v65 = v55;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Registered ngm prekey data doesn't match current data -- returning YES {registeredNGMPrekeyData: %{private}@, publicNGMPrekeyData: %{private}@}", buf, 0x16u);
            }
LABEL_37:

            BOOL v12 = 1;
LABEL_38:
            unsigned int v47 = v4;
            id v49 = v26;
            unsigned int v34 = [(IDSRegistrationKeyManager *)self identityDataSource];
            BOOL v35 = objc_msgSend(v34, "dataRepresentationForNGMVersion:", objc_msgSend(v30, "unsignedIntValue"));

            id v36 = [(IDSRegistrationKeyManager *)self keychainWrapper];
            id v56 = v51;
            unsigned __int8 v37 = [v36 dataForIdentifier:@"ngm-message-protection-public-data-registered-version" error:&v56];
            id v54 = v56;

            id v38 = v37;
            if ([v37 length])
            {
              unsigned __int8 v39 = [v37 isEqual:v35];
              id v22 = v52;
              uint64_t v4 = v47;
              if (v39)
              {
LABEL_46:

                unsigned __int8 v32 = v49;
LABEL_47:

LABEL_48:
                id v11 = v54;
                [(NSRecursiveLock *)self->_lock lock];
                if ([(IDSPerServiceApplicationKeyManager *)self->_applicationKeyManager needsPublicDataUpdatedForKeyIndex:v5])
                {
                  id v42 = +[IMRGLog registration];
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Application service key needs update", buf, 2u);
                  }

                  BOOL v12 = 1;
                }
                if ([(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager needsPublicDataUpdatedForKeyIndex:v4])
                {
                  id v43 = +[IMRGLog registration];
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "KT Registration Data needs update", buf, 2u);
                  }

                  BOOL v12 = 1;
                }
                [(NSRecursiveLock *)self->_lock unlock];

LABEL_57:
                goto LABEL_58;
              }
              id v40 = +[IMRGLog registration];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                id v63 = v38;
                __int16 v64 = 2114;
                v65 = v35;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Registered ngmVersionData doesn't match current data -- returning YES {registeredNGMVersionData: %{public}@, publicNGMVersionData: %{public}@}", buf, 0x16u);
              }
            }
            else
            {
              id v40 = +[IMRGLog registration];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = [(IDSRegistrationKeyManager *)self config];
                *(_DWORD *)buf = 138543619;
                id v63 = v54;
                __int16 v64 = 2113;
                v65 = v41;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Registered ngm data version is empty -- returning YES {error: %{public}@, config: %{private}@}", buf, 0x16u);
              }
              id v22 = v52;
              uint64_t v4 = v47;
            }

            BOOL v12 = 1;
            goto LABEL_46;
          }
          id v31 = +[IMRGLog registration];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138478083;
            id v63 = v26;
            __int16 v64 = 2113;
            v65 = v53;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Registered ngm identity data doesn't match current data -- returning YES {registeredNGMIdentityData: %{private}@, publicNGMIdentityData: %{private}@}", buf, 0x16u);
          }
        }
        else
        {
          id v31 = +[IMRGLog registration];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [(IDSRegistrationKeyManager *)self config];
            *(_DWORD *)buf = 138543619;
            id v63 = v51;
            __int16 v64 = 2113;
            v65 = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Registered ngm data is empty -- returning YES { error: %{public}@, config: %{private}@}", buf, 0x16u);
          }
        }
        id v30 = v52;
        id v13 = v48;
        goto LABEL_37;
      }
      unsigned __int8 v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        id v63 = v13;
        __int16 v64 = 2113;
        v65 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registered legacy data doesn't match current data -- returning YES {registeredLegacyData: %{private}@, publicLegacyData: %{private}@}", buf, 0x16u);
      }
    }
    else
    {
      unsigned __int8 v15 = +[IMRGLog registration];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(IDSRegistrationKeyManager *)self config];
        *(_DWORD *)buf = 138543619;
        id v63 = v54;
        __int16 v64 = 2113;
        v65 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registered legacy data is empty -- returning YES {error: %{public}@, config: %{private}@}", buf, 0x16u);
      }
    }

    BOOL v12 = 1;
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_58:

  return v12;
}

- (id)createKTRegistrationDataForServiceTypes:(id)a3 withPublicIdentity:(id)a4
{
  lock = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  id v9 = [(IDSKTRegistrationDataManager *)self->_ktRegistrationDataManager createKTRegistrationDataForServiceTypes:v8 usingPublicIdentityData:v7 withApplicationKeyManager:self->_applicationKeyManager];

  [(NSRecursiveLock *)self->_lock unlock];

  return v9;
}

- (BOOL)isMigratedKeyPairSignature
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:0];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 isMigratedSignature];

  return v4;
}

- (BOOL)requiresKeychainMigration
{
  return self->_detectedMigrationNeeded;
}

- (BOOL)isUsingSecureStorageForClassA
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 identityClassA];
  BOOL v5 = [(IDSRegistrationKeyManager *)self _isSecurelyStoringIdentity:v4 withExpectedProtectionClass:1];

  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (BOOL)isUsingSecureStorageForClassC
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 identityClassC];
  BOOL v5 = [(IDSRegistrationKeyManager *)self _isSecurelyStoringIdentity:v4 withExpectedProtectionClass:0];

  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (BOOL)_isSecurelyStoringIdentity:(id)a3 withExpectedProtectionClass:(int64_t)a4
{
  id v5 = a3;
  unsigned int v6 = v5;
  if (v5)
  {
    id v13 = 0;
    id v7 = [v5 dataProtectionClassWithError:&v13];
    id v8 = v13;
    int64_t v9 = +[IDSKeychainWrapper idsKeychainWrapperDataProtectionClassFromIMDataProtectionClass:v7];
    if (v8)
    {
      unsigned __int8 v10 = +[IMRGLog registration];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218499;
        int64_t v15 = a4;
        __int16 v16 = 2114;
        id v17 = v8;
        __int16 v18 = 2113;
        unsigned __int8 v19 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get identity data protection class {expectedProtectionClass: %ld, error: %{public}@, identity: %{private}@}", buf, 0x20u);
      }

      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = v9 == a4;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)migrateToSecureStorageForClassA
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 identityClassA];
  BOOL v5 = [(IDSRegistrationKeyManager *)self _migrateIdentity:v4 toProtectionClass:1];

  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (BOOL)migrateToSecureStorageForClassC
{
  [(IDSRegistrationKeyManager *)self _loadIfNeeded:1];
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 identityClassC];
  BOOL v5 = [(IDSRegistrationKeyManager *)self _migrateIdentity:v4 toProtectionClass:0];

  [(NSRecursiveLock *)self->_lock unlock];
  return v5;
}

- (BOOL)_migrateIdentity:(id)a3 toProtectionClass:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v10 = 0;
    unsigned __int8 v6 = objc_msgSend(v5, "updateIdentityToDataProtectionClass:error:", +[IDSKeychainWrapper imDataProtectionClassFromDataProtectionClass:](IDSKeychainWrapper, "imDataProtectionClassFromDataProtectionClass:", a4), &v10);
    id v7 = v10;
    if ((v6 & 1) == 0)
    {
      id v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543875;
        id v12 = v7;
        __int16 v13 = 2113;
        id v14 = v5;
        __int16 v15 = 2048;
        int64_t v16 = a4;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to migrate identity data protection class {error: %{public}@, identity: %{private}@, protectionClass: %ld}", buf, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)regenerateRegisteredIdentity
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL v3 = [(IDSRegistrationKeyManager *)self config];
  unsigned __int8 v4 = [v3 unregisteredIdentityContainer];

  id v5 = +[IMRGLog registration];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Roll of encryption portion of registered identity requested, but we've already generated an unregistered identity -- ignoring request", v10, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting roll of encryption portion of registered identity", buf, 2u);
    }

    id v7 = [(IDSRegistrationKeyManager *)self config];
    id v8 = [v7 registeredIdentityContainer];
    int64_t v9 = [v8 ngmFullDeviceIdentity];
    [(IDSRegistrationKeyManager *)self _generateUnregisteredIdentityWithExistingLegacyIdentity:0 existingNGMIdentity:v9];

    [(IDSRegistrationKeyManager *)self _notifyUnregisteredIdentityRegenerated];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)_shouldRegenerateRegisteredIdentity
{
  if ([(IDSRegistrationKeyManager *)self allowRegenerateRegisteredIdentity])
  {
    [(NSRecursiveLock *)self->_lock lock];
    BOOL v3 = [(IDSRegistrationKeyManager *)self config];
    unsigned __int8 v4 = [v3 buildOfIdentityGeneration];

    [(NSRecursiveLock *)self->_lock unlock];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v6 = +[IMRGLog registration];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "returning NO from _shouldRegenerateRegisteredIdentity becuase allowRegenerateRegisteredIdentity == NO", v8, 2u);
    }

    return 0;
  }
  return v5;
}

- (double)_randomizedIdentityRegenerationInterval
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  unsigned __int8 v4 = +[IMLockdownManager sharedInstance];
  if ([v4 isInternalInstall]) {
    double v5 = 600.0;
  }
  else {
    double v5 = 2592000.0;
  }

  BOOL v6 = +[IMLockdownManager sharedInstance];
  unsigned int v7 = [v6 isInternalInstall];

  double v8 = v3 + v5;
  if (v7) {
    uint32_t v9 = 1800;
  }
  else {
    uint32_t v9 = 2592000;
  }
  return v8 + (double)arc4random_uniform(v9);
}

- (void)_schedulePurgeOfPreviousIdentityAfterDelay:(double)a3
{
  double v5 = im_primary_queue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F110;
  v6[3] = &unk_10097EDD8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_purgePreviousIdentityTimerFiredOnMain
{
  double v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F304;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_purgePreviousIdentityTimerFired
{
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Purge previous identity timer fired!", buf, 2u);
  }

  unsigned __int8 v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F3F4;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v4, block);

  [(IDSRegistrationKeyManager *)self _purgePreviousIdentityFromMemoryAndKeychain];
  IMRemoveAppValueForKey();
}

- (void)_scheduleRegenerationOfRegisteredIdentityAfterDelay:(double)a3
{
  double v5 = im_primary_queue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F4D4;
  v6[3] = &unk_10097EDD8;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)_regenerateIdentityTimerFiredOnMain
{
  double v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F6C8;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_regenerateIdentityTimerFired
{
  double v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Regenerate identity timer fired!", buf, 2u);
  }

  unsigned __int8 v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F818;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v4, block);

  if ([(IDSRegistrationKeyManager *)self _shouldRegenerateRegisteredIdentity])
  {
    [(IDSRegistrationKeyManager *)self regenerateRegisteredIdentity];
  }
  else
  {
    double v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "We no longer need to re-generate our identity -- continuing without re-generation", buf, 2u);
    }
  }
  IMRemoveAppValueForKey();
}

- (double)_notifyRegenerateDelay
{
  return 60.0;
}

- (double)_notifyKTReregisterDelay
{
  double v2 = +[IDSServerBag sharedInstance];
  double v3 = [v2 objectForKey:@"kt-rereg-debounce-delay"];

  double v4 = 0.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 doubleValue];
      double v4 = v5;
    }
  }

  return v4;
}

- (double)_purgePreviousIdentityDelay
{
  double v2 = IMGetAppValueForKey();
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
    +[NSDate timeIntervalSinceReferenceDate];
    double v7 = v5 - v6;
  }
  else
  {
    double v7 = 3196800.0;
  }
  if (v7 >= 2.22044605e-16) {
    double v8 = v7;
  }
  else {
    double v8 = 1.0;
  }
  uint32_t v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v3;
    __int16 v13 = 2048;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Queried _purgePreviousIdentityDelay {purgeDateNumber: %{public}@, delay: %f}", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (double)_identityRegenerationDelay
{
  double v3 = IMGetAppValueForKey();
  if (!v3)
  {
    [(IDSRegistrationKeyManager *)self _randomizedIdentityRegenerationInterval];
    double v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    IMSetAppValueForKey();
  }
  [v3 doubleValue];
  double v5 = v4;
  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v5 - v6;
  if (v7 >= 2.22044605e-16) {
    double v8 = v7;
  }
  else {
    double v8 = 1.0;
  }
  uint32_t v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v3;
    __int16 v13 = 2048;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Queried _identityRegenrationDelay {regenerationIntervalNumber: %{public}@, delay: %f}", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (double)_generationRetryDelay
{
  double v3 = +[IDSServerBag sharedInstance];
  double v4 = [v3 objectForKey:@"key-generation-retry-delay"];

  double v5 = 30.0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 doubleValue];
      double v5 = v6;
    }
  }
  double v7 = v5 * (double)self->_generationRetryCount;

  return v7;
}

- (BOOL)_shouldCheckUnregisteredKTData
{
  double v2 = +[IDSServerBag sharedInstance];
  double v3 = [v2 objectForKey:@"should-check-unreg-kt-data"];

  if (v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)errorContainerToReport
{
  return self->_recentKeyLoadingErrors;
}

- (IMSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (IDSKeychainWrapper)keychainWrapper
{
  return self->_keychainWrapper;
}

- (void)setKeychainWrapper:(id)a3
{
}

- (IDSRateLimiter)loadingRateLimiter
{
  return self->_loadingRateLimiter;
}

- (void)setLoadingRateLimiter:(id)a3
{
}

- (IDSRegistrationKeyManagerIdentityDataSource)identityDataSource
{
  return self->_identityDataSource;
}

- (void)setIdentityDataSource:(id)a3
{
}

- (BOOL)allowPairingIdentities
{
  return self->_allowPairingIdentities;
}

- (void)setAllowPairingIdentities:(BOOL)a3
{
  self->_allowPairingIdentities = a3;
}

- (BOOL)allowRegenerateRegisteredIdentity
{
  return self->_allowRegenerateRegisteredIdentity;
}

- (void)setAllowRegenerateRegisteredIdentity:(BOOL)a3
{
  self->_allowRegenerateRegisteredIdentity = a3;
}

- (IDSRegistrationKeyConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (BOOL)forceRoll
{
  return self->_forceRoll;
}

- (IDSRegistrationKeyManagerKeyPairProvider)keyPairProvider
{
  return self->_keyPairProvider;
}

- (void)setKeyPairProvider:(id)a3
{
}

- (unint64_t)generationRetryCount
{
  return self->_generationRetryCount;
}

- (void)setGenerationRetryCount:(unint64_t)a3
{
  self->_generationRetryCount = a3;
}

- (IDSKTRegistrationDataManager)ktRegistrationDataManager
{
  return self->_ktRegistrationDataManager;
}

- (void)setKtRegistrationDataManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktRegistrationDataManager, 0);
  objc_storeStrong((id *)&self->_keyPairProvider, 0);
  objc_storeStrong((id *)&self->_loadingRateLimiter, 0);
  objc_storeStrong((id *)&self->_applicationKeyManager, 0);
  objc_storeStrong((id *)&self->_identityDataSource, 0);
  objc_storeStrong((id *)&self->_keychainWrapper, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_regenerateIdentityTimer, 0);
  objc_storeStrong((id *)&self->_purgePreviousIdentityTimer, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_recentKeyLoadingErrors, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end