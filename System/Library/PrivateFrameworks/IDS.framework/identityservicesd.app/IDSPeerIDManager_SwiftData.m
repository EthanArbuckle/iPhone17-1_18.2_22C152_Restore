@interface IDSPeerIDManager_SwiftData
+ (BOOL)_datePassed:(id)a3;
+ (BOOL)shouldUseSelfTokens;
+ (unint64_t)dbCacheCostLimit;
+ (unint64_t)dbCacheCountLimit;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6;
- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 restrictedPersistenceManager:(id)a5 keyTransparencyVerifier:(id)a6 userDefaults:(id)a7 dbCache:(id)a8;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)queryHandler;
- (IDSQuerySDPersistenceManager)restrictedPersistenceManager;
- (IDSQuerySDPersistenceManager)swiftDataManager;
- (IMUserDefaults)userDefaults;
- (NSCache)dbCache;
- (NSMutableDictionary)clientDataUpdateBlocks;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)endpointQueryListeners;
- (NSMutableDictionary)purgeClientDataBlocks;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)_disasterModeTokenForURI:(id)a3;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6 ignoreCache:(BOOL)a7 hitCache:(BOOL *)a8;
- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)_loadCachedPeerIDValueForKey:(id)a3 ignoreExpiration:(BOOL)a4;
- (id)_peerIDKeysForService:(id)a3;
- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4;
- (id)activeURIsFromURI:(id)a3 service:(id)a4;
- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6;
- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6;
- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8;
- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
- (id)lightDescriptionForVerifierResult:(id)a3;
- (id)peerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (id)persistenceManagerForService:(id)a3;
- (id)persistenceManagers;
- (id)pleaseDontCopyCacheDictionaryRepresentation;
- (id)publicDeviceIdentityContainerForPushToken:(id)a3;
- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10;
- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8;
- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9;
- (id)shortHandleForURI:(id)a3 fromURI:(id)a4;
- (id)uriForShortHandle:(id)a3;
- (id)urisMatchingPushToken:(id)a3 service:(id)a4;
- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (int64_t)_valueOfProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4;
- (void)_updateKTContext:(id)a3 forURI:(id)a4;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)dealloc;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setClientDataUpdateBlocks:(id)a3;
- (void)setDbCache:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setEndpointQueryListeners:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPurgeClientDataBlocks:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)setRestrictedPersistenceManager:(id)a3;
- (void)setSwiftDataManager:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager_SwiftData

+ (BOOL)shouldUseSelfTokens
{
  if (IMGetDomainBoolForKey())
  {
    _IMWarn();
    return 1;
  }
  else
  {
    v3 = +[IDSServerBag sharedInstanceForBagType:0];
    v4 = [v3 objectForKey:@"vc-disaster-sender-self-tokens"];
    BOOL v2 = (int)[v4 intValue] > 0;
  }
  return v2;
}

+ (unint64_t)dbCacheCostLimit
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"ids-sd-dbcache-endpoint-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 10000;
  }

  return v4;
}

+ (unint64_t)dbCacheCountLimit
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  v3 = [v2 objectForKey:@"ids-sd-dbcache-entry-limit"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 3000;
  }

  return v4;
}

- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSCache);
  objc_msgSend(v14, "setTotalCostLimit:", +[IDSPeerIDManager_SwiftData dbCacheCountLimit](IDSPeerIDManager_SwiftData, "dbCacheCountLimit"));
  objc_msgSend(v14, "setCountLimit:", +[IDSPeerIDManager_SwiftData dbCacheCountLimit](IDSPeerIDManager_SwiftData, "dbCacheCountLimit"));
  v15 = [(IDSPeerIDManager_SwiftData *)self initWithPushHandler:v13 queryHandler:v12 restrictedPersistenceManager:0 keyTransparencyVerifier:v11 userDefaults:v10 dbCache:v14];

  return v15;
}

- (IDSPeerIDManager_SwiftData)initWithPushHandler:(id)a3 queryHandler:(id)a4 restrictedPersistenceManager:(id)a5 keyTransparencyVerifier:(id)a6 userDefaults:(id)a7 dbCache:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)IDSPeerIDManager_SwiftData;
  v18 = [(IDSPeerIDManager_SwiftData *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pushHandler, a3);
    objc_storeStrong((id *)&v19->_queryHandler, a4);
    objc_storeStrong((id *)&v19->_restrictedPersistenceManager, a5);
    objc_storeStrong((id *)&v19->_keyTransparencyVerifier, a6);
    objc_storeStrong((id *)&v19->_userDefaults, a7);
    objc_storeStrong((id *)&v19->_dbCache, a8);
    -[NSCache setDelegate:](v19->_dbCache, "setDelegate:", v19, v22, v23, v24);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100015BC0;
    v25[3] = &unk_10097E518;
    objc_copyWeak(&v27, &location);
    v26 = v19;
    v20 = im_primary_queue();
    sub_1003319E8(v25, @"IDS-list", (uint64_t)v20);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:0 object:0];

  v4.receiver = self;
  v4.super_class = (Class)IDSPeerIDManager_SwiftData;
  [(IDSPeerIDManager_SwiftData *)&v4 dealloc];
}

- (void)setPersistenceManager:(id)a3
{
  objc_super v4 = (IDSQuerySDPersistenceManager *)a3;
  if (!v4)
  {
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trying to set a nil persistenceManager on the class. Something is seriously wrong", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  swiftDataManager = self->_swiftDataManager;
  self->_swiftDataManager = v4;
}

- (id)_disasterModeTokenForURI:(id)a3
{
  id v4 = a3;
  v5 = [v4 prefixedURI];
  id v6 = [v5 length];

  if (v6)
  {
    disasterModeTokens = self->_disasterModeTokens;
    v8 = [v4 prefixedURI];
    v9 = [(NSMutableDictionary *)disasterModeTokens objectForKey:v8];

    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "   Using disaster mode token for URI: %@   token: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_disasterModeTokens allKeys];
  if ((unint64_t)[v8 count] >= 5)
  {
    disasterModeTokens = self->_disasterModeTokens;
    id v10 = objc_msgSend(v8, "__imFirstObject");
    [(NSMutableDictionary *)disasterModeTokens removeObjectForKey:v10];
  }
  if (!self->_disasterModeTokens)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v12 = self->_disasterModeTokens;
    self->_disasterModeTokens = Mutable;
  }
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "   Setting disaster mode token for URI: %@   token: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v14 = v6;
  if (v14)
  {
    id v15 = self->_disasterModeTokens;
    id v16 = [v7 prefixedURI];
    CFDictionarySetValue((CFMutableDictionaryRef)v15, v16, v14);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100708F20(v7);
  }
}

- (id)persistenceManagerForService:(id)a3
{
  id v4 = a3;
  if (self->_restrictedPersistenceManager)
  {
    int v5 = IDSShouldUseRestrictedLoggingForService();
    p_swiftDataManager = &self->_swiftDataManager;
    if (v5) {
      p_swiftDataManager = &self->_restrictedPersistenceManager;
    }
  }
  else
  {
    p_swiftDataManager = &self->_swiftDataManager;
  }
  id v7 = *p_swiftDataManager;

  return v7;
}

- (id)persistenceManagers
{
  v3 = +[NSMutableArray array];
  id v4 = v3;
  if (self->_swiftDataManager) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_restrictedPersistenceManager) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v163 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v153 = +[NSDate now];
  id v160 = objc_alloc_init((Class)NSMutableDictionary);
  id v167 = objc_alloc_init((Class)NSMutableDictionary);
  v151 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:v11];
  long long v261 = 0u;
  long long v260 = 0u;
  long long v259 = 0u;
  long long v258 = 0u;
  id obj = v9;
  id v161 = [obj countByEnumeratingWithState:&v258 objects:v280 count:16];
  if (v161)
  {
    uint64_t v159 = *(void *)v259;
    uint64_t v185 = IDSGameCenterContactsAssociationID;
    uint64_t v190 = IDSGameCenterContactsSharingState;
    uint64_t v184 = IDSGameCenterContactsLastUpdatedDate;
    uint64_t v191 = _IDSIdentityClientDataMessageProtectionIdentityKey;
    uint64_t v183 = IDSRegistrationPropertyShowPeerErrors;
    uint64_t v170 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
    uint64_t v169 = _IDSIdentityClientDataDevicePublicIdentityKey;
    uint64_t v174 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    uint64_t v168 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    uint64_t v172 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v259 != v159)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }
        uint64_t v162 = v12;
        id v14 = *(void **)(*((void *)&v258 + 1) + 8 * v12);
        id v15 = [v14 prefixedURI];
        v165 = [v163 objectForKey:v15];

        v164 = [v165 objectForKey:@"identities"];
        id v194 = objc_alloc_init((Class)IDSEndpointURIProperties);
        id v16 = [v165 objectForKey:@"sender-correlation-identifier"];
        [v194 setSenderCorrelationIdentifier:v16];

        id v17 = [v165 objectForKey:@"short-handle"];
        [v194 setShortHandle:v17];

        if (v165) {
          BOOL v18 = v163 != 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v11 != 0 && v18 && [v164 count])
        {
          v171 = [v165 _stringForKey:@"anonymized-sender-id"];
          __int16 v19 = [v165 _numberForKey:@"biz-trusted"];
          [v19 BOOLValue];

          v154 = [v165 objectForKey:@"kt-blob"];
          v157 = [v165 objectForKey:@"kt-status"];
          v178 = [v165 objectForKey:@"kt-account-key"];
          v156 = [v165 objectForKey:@"kt-opt-in"];
          unsigned int v20 = [v156 BOOLValue];
          if (v157)
          {
            v21 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v271 = (uint64_t)v11;
              __int16 v272 = 2112;
              v273 = (_UNKNOWN **)v14;
              __int16 v274 = 2112;
              id v275 = v178;
              __int16 v276 = 2112;
              id v277 = v157;
              __int16 v278 = 2112;
              v279 = v154;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }", buf, 0x34u);
            }
          }
          if (v14)
          {
            if (!v178)
            {
              id v22 = [v14 prefixedURI];
              id v23 = [v22 _md5Hash];
              v178 = [v23 dataUsingEncoding:4];

              id v24 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v271 = (uint64_t)v178;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification failures -- using URI hash instead { KTAccountKey: %@ }", buf, 0xCu);
              }
            }
            v155 = [[IDSKeyTransparencyIndex alloc] initWithServiceIdentifier:v11 accountKey:v178 URI:v14];
          }
          else
          {
            v155 = 0;
          }
          id v176 = objc_alloc_init((Class)NSMutableArray);
          id v182 = objc_alloc_init((Class)NSMutableArray);
          long long v257 = 0u;
          long long v256 = 0u;
          long long v255 = 0u;
          long long v254 = 0u;
          id v175 = v164;
          id v188 = [v175 countByEnumeratingWithState:&v254 objects:v269 count:16];
          uint64_t v152 = v20;
          if (v188)
          {
            char v201 = 0;
            uint64_t v186 = *(void *)v255;
            CFStringRef v25 = @"NO";
            if (v20) {
              CFStringRef v25 = @"YES";
            }
            CFStringRef v177 = v25;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v255 != v186)
                {
                  uint64_t v27 = v26;
                  objc_enumerationMutation(v175);
                  uint64_t v26 = v27;
                }
                uint64_t v195 = v26;
                v28 = *(void **)(*((void *)&v254 + 1) + 8 * v26);
                v217 = objc_msgSend(v28, "_dataForKey:", @"push-token", v146, v148, v149, v150);
                v207 = [v28 _dataForKey:@"session-token"];
                objc_super v29 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                v219 = [v28 _dictionaryForKey:@"client-data"];
                v213 = [v28 _stringForKey:@"device-name"];
                v209 = [v28 _dictionaryForKey:@"private-device-data"];
                id v203 = 0;
                if (v213 && v209) {
                  id v203 = [objc_alloc((Class)IDSFamilyEndpointData) initWithDeviceName:v213 privateDeviceData:v209];
                }
                v210 = [v28 _dataForKey:@"kt-loggable-data"];
                v206 = [v219 _dataForKey:@"device-key-signature"];
                v30 = [v28 _numberForKey:@"kt-mismatch-account-flag"];
                unsigned int v196 = [v30 BOOLValue];

                v31 = [v28 _numberForKey:@"ktbility"];
                unsigned int v200 = [v31 BOOLValue];

                v211 = [v219 _stringForKey:v185];
                v32 = [v219 _numberForKey:v190];
                v215 = &off_1009D0B28;
                if (([v32 isEqualToNumber:&off_1009D0B10] & 1) == 0)
                {
                  v215 = [v219 _numberForKey:v190];
                }
                v33 = [v219 _numberForKey:v184];
                v208 = v33;
                if (v33)
                {
                  [v33 doubleValue];
                  +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
                  id v205 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v205 = 0;
                }
                v34 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v271 = (uint64_t)v211;
                  __int16 v272 = 2112;
                  v273 = v215;
                  __int16 v274 = 2112;
                  id v275 = v205;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@", buf, 0x20u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v148 = v215;
                  id v149 = v205;
                  v147 = v211;
                  _IDSLogV();
                }
                if (v211 || v215 || v208) {
                  id v197 = [objc_alloc((Class)IDSGameCenterData) initWithAssociationID:v211 sharingState:v215 lastUpdatedDate:v205];
                }
                else {
                  id v197 = 0;
                }
                if (v217)
                {
                  v35 = [[IDSKeyTransparencyEntry alloc] initWithPushToken:v217 loggableData:v210 signedData:v206];
                  [(IDSKeyTransparencyEntry *)v35 setKtCapable:v200];
                  [v176 addObject:v35];
                }
                v204 = objc_msgSend(v219, "_dataForKey:", v191, v147);
                v36 = [v219 _numberForKey:v183];
                unsigned int v37 = [v36 intValue];

                v38 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v39 = IDSLoggableDescriptionForTokenOnService();
                  v40 = [v39 debugDescription];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v40;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "              device pushToken: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v41 = IDSLoggableDescriptionForTokenOnService();
                  v146 = [v41 debugDescription];
                  _IDSLogV();
                }
                v42 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  id v43 = [v207 debugDescription];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v43;
                  _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "                 session token: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = [v207 debugDescription];
                  _IDSLogV();
                }
                v44 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v14;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "                           uri: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = v14;
                  _IDSLogV();
                }
                v45 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  v46 = [v194 senderCorrelationIdentifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, " sender-correlation-identifier: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = [v194 senderCorrelationIdentifier];
                  _IDSLogV();
                }
                v47 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  v48 = [v194 shortHandle];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v48;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "                  short-handle: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = [v194 shortHandle];
                  _IDSLogV();
                }
                v49 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  id v50 = +[IDSLogFormatter descriptionForDictionary:v219 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v50;
                  _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "                    clientData: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = +[IDSLogFormatter descriptionForDictionary:v219 options:1];
                  _IDSLogV();
                }
                v51 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v213;
                  _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "                   device-name: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = v213;
                  _IDSLogV();
                }
                v52 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  id v53 = +[IDSLogFormatter descriptionForDictionary:v209 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v53;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "           private-device-data: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = +[IDSLogFormatter descriptionForDictionary:v209 options:1];
                  _IDSLogV();
                }
                v54 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  id v55 = +[IDSLogFormatter descriptionForData:v210 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v55;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "              kt-loggable-data: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = +[IDSLogFormatter descriptionForData:v210 options:1];
                  _IDSLogV();
                }
                v56 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  id v57 = +[IDSLogFormatter descriptionForData:v178 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v57;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "                kt-account-key: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = +[IDSLogFormatter descriptionForData:v178 options:1];
                  _IDSLogV();
                }
                v58 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v177;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "                     kt-opt-in: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = (void *)v177;
                  _IDSLogV();
                }
                v59 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  id v60 = +[IDSLogFormatter descriptionForData:v206 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v60;
                  _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "          device-key-signature: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = +[IDSLogFormatter descriptionForData:v206 options:1];
                  _IDSLogV();
                }
                v61 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v62 = @"NO";
                  if (v196) {
                    CFStringRef v62 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v62;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "      kt-mismatch-account-flag: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v63 = @"NO";
                  if (v196) {
                    CFStringRef v63 = @"YES";
                  }
                  v146 = (void *)v63;
                  _IDSLogV();
                }
                v64 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v65 = @"NO";
                  if (v200) {
                    CFStringRef v65 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v65;
                  _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "               kt-capable-flag: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v66 = @"NO";
                  if (v200) {
                    CFStringRef v66 = @"YES";
                  }
                  v146 = (void *)v66;
                  _IDSLogV();
                }
                v67 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v68 = @"NO";
                  if (v37) {
                    CFStringRef v68 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v68;
                  _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "                    showErrors: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v69 = @"NO";
                  if (v37) {
                    CFStringRef v69 = @"YES";
                  }
                  v146 = (void *)v69;
                  _IDSLogV();
                }
                if (v204) {
                  goto LABEL_155;
                }
                v70 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v271 = (uint64_t)v217;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "   No known public key found for token: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v146 = v217;
                  _IDSLogV();
                }
                if (!objc_msgSend(v11, "isEqualToIgnoringCase:", @"com.apple.madrid", v146))
                {
LABEL_155:
                  if (v217)
                  {
                    uint64_t v72 = IMGetDomainIntForKey();
                    uint64_t v73 = IMGetDomainIntForKey();
                    v198 = [v28 _numberForKey:@"session-token-refresh-seconds"];
                    v199 = [v28 _numberForKey:@"session-token-expires-seconds"];
                    if (v72)
                    {
                      v74 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v271 = v72;
                        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "                    Overwriting soft TTL with: %ld seconds", buf, 0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                      {
                        v146 = (void *)v72;
                        _IDSLogV();
                      }
                      uint64_t v75 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v72, v146);

                      v198 = (void *)v75;
                    }
                    if (v73)
                    {
                      v76 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v271 = v73;
                        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "                    Overwriting hard TTL with: %ld seconds", buf, 0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                      {
                        v146 = (void *)v73;
                        _IDSLogV();
                      }
                      uint64_t v77 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v73, v146);

                      v199 = (void *)v77;
                    }
                    objc_msgSend(v198, "doubleValue", v146);
                    v193 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                    [v199 doubleValue];
                    v192 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                    v78 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      uint64_t v271 = (uint64_t)v11;
                      __int16 v272 = 2112;
                      v273 = (_UNKNOWN **)v14;
                      __int16 v274 = 2112;
                      id v275 = v193;
                      __int16 v276 = 2112;
                      id v277 = v192;
                      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,", buf, 0x2Au);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                    {
                      id v149 = v193;
                      id v150 = v192;
                      v146 = v11;
                      v148 = (_UNKNOWN **)v14;
                      _IDSLogV();
                    }
                    if (v207 && v199 && v198)
                    {
                      if ([v10 isEqualToURI:v14]) {
                        [(IDSPeerIDManager_SwiftData *)self _setDisasterModeToken:v207 forURI:v10];
                      }
                      v79 = +[IDSEndpointCapabilities allowedCapabilities];
                      v268[0] = v191;
                      v268[1] = v170;
                      v268[2] = v169;
                      v268[3] = v174;
                      v268[4] = v168;
                      v268[5] = v172;
                      v80 = +[NSArray arrayWithObjects:v268 count:6];
                      v81 = [v79 arrayByAddingObjectsFromArray:v80];

                      id v82 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v81, "count"));
                      long long v253 = 0u;
                      long long v252 = 0u;
                      long long v251 = 0u;
                      long long v250 = 0u;
                      id v83 = v81;
                      id v84 = [v83 countByEnumeratingWithState:&v250 objects:v267 count:16];
                      if (v84)
                      {
                        uint64_t v85 = *(void *)v251;
                        do
                        {
                          for (i = 0; i != v84; i = (char *)i + 1)
                          {
                            if (*(void *)v251 != v85) {
                              objc_enumerationMutation(v83);
                            }
                            uint64_t v87 = *(void *)(*((void *)&v250 + 1) + 8 * i);
                            v88 = [v219 objectForKey:v87];
                            if (v88) {
                              [v82 setObject:v88 forKey:v87];
                            }
                          }
                          id v84 = [v83 countByEnumeratingWithState:&v250 objects:v267 count:16];
                        }
                        while (v84);
                      }

                      v89 = +[NSDate date];
                      [v89 timeIntervalSince1970];
                      double v91 = v90;

                      v181 = [v82 _dataForKey:v191];
                      v180 = [v82 _dataForKey:v174];
                      v92 = +[IDSDServiceController sharedInstance];
                      v202 = [v92 serviceWithIdentifier:v11];

                      if (!v210)
                      {
                        v210 = [v82 _dataForKey:v172];
                      }
                      v187 = [[IDSProtoKeyTransparencyLoggableData alloc] initWithData:v210];
                      v179 = [(IDSProtoKeyTransparencyLoggableData *)v187 ngmPublicIdentity];
                      if ([v202 applicationKeyIndex]
                        && [(IDSProtoKeyTransparencyLoggableData *)v187 applicationPublicIdentitysCount])
                      {
                        long long v249 = 0u;
                        long long v248 = 0u;
                        long long v247 = 0u;
                        long long v246 = 0u;
                        id v189 = [(IDSProtoKeyTransparencyLoggableData *)v187 applicationPublicIdentitys];
                        id v93 = [v189 countByEnumeratingWithState:&v246 objects:v266 count:16];
                        if (v93)
                        {
                          uint64_t v94 = *(void *)v247;
                          while (2)
                          {
                            for (j = 0; j != v93; j = (char *)j + 1)
                            {
                              if (*(void *)v247 != v94) {
                                objc_enumerationMutation(v189);
                              }
                              v96 = *(void **)(*((void *)&v246 + 1) + 8 * (void)j);
                              unsigned int v97 = [v96 keyIndex];
                              if (v97 == sub_10030C080((int)[v202 applicationKeyIndex]))
                              {
                                id v93 = [v96 publicIdentity];
                                goto LABEL_209;
                              }
                            }
                            id v93 = [v189 countByEnumeratingWithState:&v246 objects:v266 count:16];
                            if (v93) {
                              continue;
                            }
                            break;
                          }
                        }
LABEL_209:
                      }
                      else
                      {
                        id v93 = 0;
                      }
                      id v149 = v207;
                      id v150 = v192;
                      v148 = (_UNKNOWN **)v217;
                      LOBYTE(v146) = v200;
                      id v99 = objc_msgSend(objc_alloc((Class)IDSEndpoint), "initWithURI:serviceIdentifier:clientData:KTLoggableData:KTDeviceSignature:mismatchedAccountFlag:ktCapableFlag:pushToken:sessionToken:expireDate:refreshDate:anonymizedSenderID:verifiedBusiness:serializedPublicMessageProtectionIdentity:queryTimeInterval:serializedNGMDeviceIdentity:serializedNGMDevicePrekey:serializedApplicationPublicKey:endpointURIProperties:familyEndpointData:gameCenterData:", v14, v11, v82, v210, v206, v196, v91);
                      [v182 addObject:v99];

                      char v201 = 1;
                    }
                  }
                  else
                  {
                    v98 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "   No known push token found, ignoring", buf, 2u);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
                else
                {
                  v71 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v271 = (uint64_t)v217;
                    _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "   No known iMessage public key found for token, skipping this identity: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    _IDSWarnV();
                    _IDSLogV();
                    v146 = v217;
                    _IDSLogTransport();
                  }
                }

                uint64_t v26 = v195 + 1;
              }
              while ((id)(v195 + 1) != v188);
              id v188 = [v175 countByEnumeratingWithState:&v254 objects:v269 count:16];
            }
            while (v188);
          }
          else
          {
            char v201 = 0;
          }

          id v100 = objc_alloc((Class)KTVerifierResult);
          v101 = +[IDSKeyTransparencyVerifier keyTransparencyURIPrefixForServiceIdentifier:v11];
          v102 = [v14 prefixedURI];
          v103 = [v101 stringByAppendingString:v102];
          v104 = +[IDSKeyTransparencyVerifier keyTransparencyApplicationForServiceIdentifier:v11];
          id v214 = [v100 initPendingForUri:v103 application:v104];

          id v105 = objc_alloc((Class)IDSQueryKeyTransparencyContext);
          v106 = [(IDSKeyTransparencyIndex *)v155 accountKey];
          id v212 = [v105 initWithVerifierResult:v214 ticket:0 accountKey:v106 queryResponseTime:v153 ktOptIn:v152];

          v107 = [v167 objectForKeyedSubscript:v14];
          LODWORD(v100) = v107 == 0;

          if (v100)
          {
            v220 = [(IDSPeerIDManager_SwiftData *)self peerTokensForURI:v14 fromURI:v10 service:v11];
            v108 = +[NSMutableSet set];
            long long v245 = 0u;
            long long v244 = 0u;
            long long v243 = 0u;
            long long v242 = 0u;
            id v109 = v182;
            id v110 = [v109 countByEnumeratingWithState:&v242 objects:v265 count:16];
            if (v110)
            {
              uint64_t v111 = *(void *)v243;
              do
              {
                for (k = 0; k != v110; k = (char *)k + 1)
                {
                  if (*(void *)v243 != v111) {
                    objc_enumerationMutation(v109);
                  }
                  v113 = *(void **)(*((void *)&v242 + 1) + 8 * (void)k);
                  v114 = objc_msgSend(v113, "pushTokenObject", v146);

                  if (v114)
                  {
                    v115 = [v113 pushTokenObject];
                    [v108 addObject:v115];
                  }
                }
                id v110 = [v109 countByEnumeratingWithState:&v242 objects:v265 count:16];
              }
              while (v110);
            }

            if ([v220 count] && (objc_msgSend(v220, "isEqualToSet:", v108) & 1) == 0)
            {
              id v116 = [v108 mutableCopy];
              [v116 minusSet:v220];
              v117 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                uint64_t v271 = (uint64_t)v14;
                __int16 v272 = 2112;
                v273 = (_UNKNOWN **)v10;
                __int16 v274 = 2112;
                id v275 = v11;
                __int16 v276 = 2112;
                id v277 = v116;
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Detected devices set changed for uri: %@, fromURI: %@, service: %@ {new: %@}", buf, 0x2Au);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v149 = v11;
                id v150 = v116;
                v146 = v14;
                v148 = (_UNKNOWN **)v10;
                _IDSLogV();
              }
            }
            v118 = +[NSUUID UUID];
            v119 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v271 = (uint64_t)v11;
              __int16 v272 = 2112;
              v273 = (_UNKNOWN **)v14;
              __int16 v274 = 2112;
              id v275 = v118;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEFAULT, "Will save endpoints to SwiftData DB for service: %@, uri: %@, uuid: %@", buf, 0x20u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              v148 = (_UNKNOWN **)v14;
              id v149 = v118;
              v146 = v11;
              _IDSLogV();
            }
            v120 = [[IDSPeerIDKey alloc] initWithService:v11 fromURI:v10 toURI:v14];
            v121 = [[IDSPeerIDValue alloc] initWithEndpoints:v109 keyTransparencyContext:v212];
            -[NSCache setObject:forKey:cost:](self->_dbCache, "setObject:forKey:cost:", v121, v120, [v109 count]);
            v238[0] = _NSConcreteStackBlock;
            v238[1] = 3221225472;
            v238[2] = sub_10001A0C0;
            v238[3] = &unk_10097E540;
            id v122 = v11;
            id v239 = v122;
            v240 = v14;
            id v123 = v118;
            id v241 = v123;
            [v151 saveEndpoints:v109 ktContext:v212 service:v122 fromURI:v10 toURI:v14 completion:v238];
          }
          long long v236 = 0u;
          long long v237 = 0u;
          long long v234 = 0u;
          long long v235 = 0u;
          id v216 = [(NSMutableDictionary *)self->_clientDataUpdateBlocks allValues];
          id v221 = [v216 countByEnumeratingWithState:&v234 objects:v264 count:16];
          if (v221)
          {
            uint64_t v218 = *(void *)v235;
            do
            {
              for (m = 0; m != v221; m = (char *)m + 1)
              {
                if (*(void *)v235 != v218) {
                  objc_enumerationMutation(v216);
                }
                uint64_t v125 = *(void *)(*((void *)&v234 + 1) + 8 * (void)m);
                long long v230 = 0u;
                long long v231 = 0u;
                long long v232 = 0u;
                long long v233 = 0u;
                id v126 = v182;
                id v127 = [v126 countByEnumeratingWithState:&v230 objects:v263 count:16];
                if (v127)
                {
                  uint64_t v128 = *(void *)v231;
                  do
                  {
                    for (n = 0; n != v127; n = (char *)n + 1)
                    {
                      if (*(void *)v231 != v128) {
                        objc_enumerationMutation(v126);
                      }
                      (*(void (**)(uint64_t, id, void *, id, void))(v125 + 16))(v125, v11, v14, v10, *(void *)(*((void *)&v230 + 1) + 8 * (void)n));
                    }
                    id v127 = [v126 countByEnumeratingWithState:&v230 objects:v263 count:16];
                  }
                  while (v127);
                }
              }
              id v221 = [v216 countByEnumeratingWithState:&v234 objects:v264 count:16];
            }
            while (v221);
          }

          if ((v201 & 1) == 0) {
            [(IDSPeerIDManager_SwiftData *)self forgetPeerTokensForURI:v14 fromURI:v10 service:v11];
          }
          v130 = +[NSNumber numberWithBool:v201 & 1];
          [v160 setObject:v130 forKeyedSubscript:v14];

          id v131 = [v182 copy];
          [v167 setObject:v131 forKeyedSubscript:v14];
        }
        else
        {
          [(IDSPeerIDManager_SwiftData *)self forgetPeerTokensForURI:v14 fromURI:v10 service:v11];
          [v160 setObject:&__kCFBooleanFalse forKeyedSubscript:v14];
          [v167 setObject:&__NSArray0__struct forKeyedSubscript:v14];
        }

        uint64_t v12 = v162 + 1;
      }
      while ((id)(v162 + 1) != v161);
      id v132 = [obj countByEnumeratingWithState:&v258 objects:v280 count:16];
      id v161 = v132;
    }
    while (v132);
  }

  v133 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "Remote query finished - kicking KT peer verification", buf, 2u);
  }

  v134 = [(IDSPeerIDManager_SwiftData *)self keyTransparencyVerifier];
  [v134 kickPeerVerificationForURIs:obj service:v11 localURI:v10 fetchNow:0 withCompletion:&stru_10097E580];

  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  v135 = [(NSMutableDictionary *)self->_endpointQueryListeners allValues];
  id v136 = [v135 countByEnumeratingWithState:&v226 objects:v262 count:16];
  if (v136)
  {
    uint64_t v137 = *(void *)v227;
    do
    {
      for (ii = 0; ii != v136; ii = (char *)ii + 1)
      {
        if (*(void *)v227 != v137) {
          objc_enumerationMutation(v135);
        }
        v139 = *(void **)(*((void *)&v226 + 1) + 8 * (void)ii);
        v140 = [v139 queryCompletionBlock];
        if (v140)
        {
          v141 = [v139 queue];
          BOOL v142 = v141 == 0;

          if (!v142)
          {
            v143 = [v139 queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10001A3A4;
            block[3] = &unk_10097E5A8;
            block[4] = v139;
            id v223 = v11;
            id v224 = v10;
            id v225 = v167;
            dispatch_async(v143, block);
          }
        }
      }
      id v136 = [v135 countByEnumeratingWithState:&v226 objects:v262 count:16];
    }
    while (v136);
  }

  id v144 = [v160 copy];

  return v144;
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  LOBYTE(v9) = 1;
  return [(IDSPeerIDManager_SwiftData *)self sessionTokensForURIs:a3 fromURI:a4 service:a5 fromIdentity:a6 includeSelfDevice:a7 fullyRemoveSelfDevice:a8 allowRefresh:v9];
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v76 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v19 = 1;
  if (!v9) {
    uint64_t v19 = 2;
  }
  if (v10) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v19;
  }
  v71 = self;
  uint64_t v72 = v16;
  CFStringRef v68 = v15;
  CFStringRef v69 = v17;
  v70 = v18;
  [(IDSPeerIDManager_SwiftData *)self endpointsForURIs:v15 fromURI:v16 service:v17 fromIdentity:v18 filterBehavior:v20 allowRefresh:a9];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v74 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v74)
  {
    uint64_t v73 = *(void *)v88;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v88 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = *(void *)(*((void *)&v87 + 1) + 8 * i);
        uint64_t v77 = objc_msgSend(obj, "objectForKeyedSubscript:");
        if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
        {
          v21 = [(IDSPeerIDManager_SwiftData *)v71 _disasterModeTokenForURI:v72];
          BOOL v22 = v21 != 0;
          if (v21)
          {
            id v23 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v95 = v72;
              __int16 v96 = 2112;
              unsigned int v97 = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Returning disaster mode token for from URI: %@   token: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v66 = v72;
              v67 = v21;
              _IDSLogV();
            }
          }
        }
        else
        {
          BOOL v22 = 0;
        }
        v80 = objc_msgSend(v76, "objectForKeyedSubscript:", v78, v66, v67);
        id v24 = [v80 objectForKeyedSubscript:@"dates-expire"];
        id v25 = [v24 mutableCopy];
        uint64_t v26 = v25;
        if (v25)
        {
          id v82 = v25;
        }
        else
        {
          id v82 = +[NSMutableArray array];
        }

        uint64_t v27 = [v80 objectForKeyedSubscript:@"dates-refresh"];
        id v28 = [v27 mutableCopy];
        objc_super v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = +[NSMutableArray array];
        }
        v31 = v30;

        v32 = [v80 objectForKeyedSubscript:@"push-tokens"];
        id v33 = [v32 mutableCopy];
        v34 = v33;
        if (v33)
        {
          id v35 = v33;
        }
        else
        {
          id v35 = +[NSMutableArray array];
        }
        v36 = v35;

        unsigned int v37 = [v80 objectForKeyedSubscript:@"session-tokens"];
        id v38 = [v37 mutableCopy];
        v39 = v38;
        if (v38)
        {
          id v40 = v38;
        }
        else
        {
          id v40 = +[NSMutableArray array];
        }
        v41 = v40;

        v42 = [v80 objectForKeyedSubscript:@"anonymized-sender-ids"];
        id v43 = [v42 mutableCopy];
        v44 = v43;
        if (v43)
        {
          id v81 = v43;
        }
        else
        {
          id v81 = +[NSMutableArray array];
        }

        if (!v22)
        {
          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v45 = v77;
          id v46 = [v45 countByEnumeratingWithState:&v83 objects:v93 count:16];
          if (v46)
          {
            uint64_t v47 = *(void *)v84;
            do
            {
              for (j = 0; j != v46; j = (char *)j + 1)
              {
                if (*(void *)v84 != v47) {
                  objc_enumerationMutation(v45);
                }
                v49 = *(void **)(*((void *)&v83 + 1) + 8 * (void)j);
                id v50 = [v49 refreshDate];
                v51 = [v49 expireDate];
                [v82 addObject:v51];

                [v31 addObject:v50];
                v52 = [v49 pushToken];
                [v36 addObject:v52];

                uint64_t v53 = [v49 sessionToken];
                [v41 addObject:v53];

                v54 = [v49 anonymizedSenderID];
                LOBYTE(v53) = v54 == 0;

                if ((v53 & 1) == 0)
                {
                  id v55 = [v49 anonymizedSenderID];
                  [v81 addObject:v55];
                }
              }
              id v46 = [v45 countByEnumeratingWithState:&v83 objects:v93 count:16];
            }
            while (v46);
          }
        }
        v91[0] = @"dates-expire";
        id v56 = [v82 copy];
        v92[0] = v56;
        v91[1] = @"dates-refresh";
        id v57 = [v31 copy];
        v92[1] = v57;
        v91[2] = @"push-tokens";
        id v58 = [v36 copy];
        v92[2] = v58;
        v91[3] = @"session-tokens";
        id v59 = [v41 copy];
        v92[3] = v59;
        id v60 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:4];
        v61 = +[NSMutableDictionary dictionaryWithDictionary:v60];

        if ([v81 count])
        {
          id v62 = [v81 copy];
          [v61 setValue:v62 forKey:@"anonymized-sender-ids"];
        }
        id v63 = [v61 copy];
        [v76 setObject:v63 forKeyedSubscript:v78];
      }
      id v74 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
    }
    while (v74);
  }

  id v64 = [v76 copy];

  return v64;
}

- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v50 = a4;
  id v48 = a5;
  id v14 = a6;
  id v47 = objc_alloc_init((Class)NSMutableArray);
  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v16 = v13;
  id v49 = [v16 countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v49)
  {
    BOOL v42 = v8;
    unsigned int v17 = 0;
    id v43 = v14;
    uint64_t v45 = *(void *)v63;
    id v46 = v15;
    id obj = v16;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        v21 = [v19 tokenFreeURI];
        uint64_t v53 = [v19 pushToken];
        [v47 addObject:v21];
        BOOL v22 = [v15 objectForKeyedSubscript:v21];
        id v23 = [v22 mutableCopy];
        id v24 = v23;
        if (v23) {
          id v25 = v23;
        }
        else {
          id v25 = objc_alloc_init((Class)NSMutableArray);
        }
        v52 = v25;

        uint64_t v26 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v48 fromURI:v50 toURI:v21 ignoreExpiration:0];
        if (a7 == 1 || a7 == 2 && [v21 isEqualToURI:v50])
        {
          uint64_t v27 = [(IDSPeerIDPushHandler *)self->_pushHandler pushToken];
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_10001B02C;
          v60[3] = &unk_10097E5D0;
          id v61 = v27;
          id v28 = v27;
          uint64_t v29 = objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v60);

          uint64_t v26 = (void *)v29;
        }
        if (v53)
        {
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10001B074;
          v58[3] = &unk_10097E5D0;
          id v59 = v53;
          uint64_t v30 = objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v58);

          uint64_t v26 = (void *)v30;
        }
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v31 = v26;
        id v32 = [v31 countByEnumeratingWithState:&v54 objects:v66 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v55;
          while (2)
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v55 != v34) {
                objc_enumerationMutation(v31);
              }
              if (v17)
              {
                unsigned int v17 = 1;
                goto LABEL_25;
              }
              v36 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
              unsigned int v37 = objc_opt_class();
              id v38 = [v36 refreshDate];
              unsigned int v17 = [v37 _datePassed:v38];
            }
            id v33 = [v31 countByEnumeratingWithState:&v54 objects:v66 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }
LABEL_25:

        [v52 addObjectsFromArray:v31];
        id v15 = v46;
        [v46 setObject:v52 forKeyedSubscript:v21];
      }
      id v16 = obj;
      id v49 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v49);

    id v14 = v43;
    BOOL v39 = v42;
    if (!v43) {
      BOOL v39 = 0;
    }
    if ((v39 & v17) == 1)
    {
      LOBYTE(v41) = 0;
      [(IDSPeerIDManager_SwiftData *)self startQueryForURIs:v47 fromIdentity:v43 fromURI:v50 fromService:v48 forSending:0 forRefresh:1 isForced:v41 reason:@"EndpointForURI" completionBlock:0];
    }
  }
  else
  {
  }

  return v15;
}

- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v6 = [(IDSPeerIDManager_SwiftData *)self publicKeyForURI:a3 pushToken:a4 fromURI:a5 service:a6];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:a6 fromURI:a5 toURI:a3 ignoreExpiration:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B230;
  v17[3] = &unk_10097E5D0;
  id v18 = v10;
  id v12 = v10;
  id v13 = objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17);
  id v14 = [v13 firstObject];

  id v15 = [v14 serializedPublicLegacyIdentity];

  return v15;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  id v4 = a3;
  int v5 = [(NSCache *)self->_dbCache mapTableRepresentation];
  id v6 = [v5 keyEnumerator];
  BOOL v7 = [v6 allObjects];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v26 = *(void *)v35;
    uint64_t v27 = self;
    id v29 = v8;
    do
    {
      id v12 = 0;
      id v28 = v10;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v12);
        if (objc_msgSend(v13, "hasMatchingURIs", v26, v27))
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v14 = [(NSCache *)self->_dbCache objectForKey:v13];
          id v15 = [v14 endpoints];

          id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v31;
            while (2)
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                v21 = [v20 pushToken];
                BOOL v22 = [v4 rawToken];
                unsigned __int8 v23 = [v22 isEqualToData:v21];

                if (v23)
                {
                  id v24 = [v20 publicDeviceIdentityContainer];

                  id v8 = v29;
                  goto LABEL_21;
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v26;
          self = v27;
          id v10 = v28;
          id v8 = v29;
        }
        id v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      id v24 = 0;
    }
    while (v10);
  }
  else
  {
    id v24 = 0;
  }
LABEL_21:

  return v24;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  int v5 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:a5 fromURI:a4 toURI:a3 ignoreExpiration:1];
  id v6 = [v5 firstObject];

  BOOL v7 = [v6 senderCorrelationIdentifier];

  return v7;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  uint64_t v11 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:a6 fromURI:a5 toURI:a3 ignoreExpiration:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B670;
  v17[3] = &unk_10097E5D0;
  id v18 = v10;
  id v12 = v10;
  id v13 = objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17);
  id v14 = [v13 firstObject];

  id v15 = [v14 senderCorrelationIdentifier];

  return v15;
}

- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10
{
  id v15 = a3;
  id v39 = v15;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  uint64_t v20 = +[NSArray arrayWithObjects:&v39 count:1];
  v21 = [(IDSPeerIDManager_SwiftData *)self sessionTokensForURIs:v20 fromURI:v18 service:v17 fromIdentity:v16 includeSelfDevice:a10 fullyRemoveSelfDevice:0];

  uint64_t v22 = objc_opt_class();
  id v23 = v15;
  id v38 = v21;
  id v24 = [v21 objectForKey:v23];
  if (objc_opt_isKindOfClass())
  {
    id v25 = v24;
  }
  else
  {
    if (v24)
    {
      uint64_t v26 = +[IMRGLog registration];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_100708FD0((uint64_t)v23, v22, v26);
      }
    }
    id v25 = 0;
  }

  uint64_t v27 = [v25 _arrayForKey:@"session-tokens"];
  id v28 = [v25 _arrayForKey:@"push-tokens"];
  id v29 = [v25 _arrayForKey:@"dates-refresh"];
  long long v30 = [v25 _arrayForKey:@"dates-expire"];
  long long v31 = [v19 rawToken];

  id v32 = [v28 indexOfObject:v31];
  if (v32 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    long long v33 = 0;
  }
  else
  {
    long long v34 = [v30 objectAtIndex:v32];
    long long v35 = [v29 objectAtIndex:v32];
    if (a7) {
      *a7 = v34;
    }
    if (a8) {
      *a8 = v35;
    }
    long long v33 = objc_msgSend(v27, "objectAtIndex:", v32, a8);
  }

  return v33;
}

- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v6 == 1)
  {
    id v14 = 0;
    if (v10 && v11 && v12)
    {
      id v28 = v10;
      id v15 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v12 fromURI:v11 toURI:v10 ignoreExpiration:1];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        id v14 = 0;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (v14)
            {
              v21 = [*(id *)(*((void *)&v29 + 1) + 8 * i) expireDate];
              id v22 = [v21 compare:v14];

              if (v22 != (id)-1) {
                continue;
              }
            }
            uint64_t v23 = [v20 expireDate];

            id v14 = (void *)v23;
          }
          id v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v17);
      }
      else
      {
        id v14 = 0;
      }

      id v10 = v28;
    }
    [v14 timeIntervalSinceNow];
    double v25 = v26;
  }
  else
  {
    +[IDSBagUtilities timeToCacheResultsForIDStatus:v6 forService:v12];
    double v25 = v24;
  }

  return v25;
}

- (int64_t)_valueOfProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = a7;
  long long v34 = v13;
  long long v35 = v15;
  if (v12)
  {
    id v33 = v16;
    [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v16 fromURI:v15 toURI:v13 ignoreExpiration:0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v17 = 0;
    id v18 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v38;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v22 = objc_msgSend(v21, "pushTokenObject", v30, v31, v32);
          unsigned int v23 = [v22 isEqualToPushToken:v14];

          if (v23)
          {
            double v24 = [v21 capabilities];
            id v17 = [v24 valueForCapability:v12];

            double v25 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              CFStringRef v26 = @"YES";
              if (!v17) {
                CFStringRef v26 = @"NO";
              }
              id v42 = v12;
              __int16 v43 = 2112;
              CFStringRef v44 = v26;
              __int16 v45 = 2112;
              id v46 = v14;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found %@ value: %@  for peer token: %@", buf, 0x20u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v27 = @"YES";
              if (!v17) {
                CFStringRef v27 = @"NO";
              }
              CFStringRef v31 = v27;
              long long v32 = v14;
              id v30 = v12;
              _IDSLogV();
            }
          }
          else
          {
            id v28 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v42 = v12;
              __int16 v43 = 2112;
              CFStringRef v44 = v14;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "** No %@ value found for peer token: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v30 = v12;
              CFStringRef v31 = v14;
              _IDSLogV();
            }
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v18);
    }

    id v16 = v33;
  }
  else
  {
    id v17 = 0;
  }

  return (int64_t)v17;
}

- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  return [(IDSPeerIDManager_SwiftData *)self _valueOfProperty:a3 forURI:a4 pushToken:a5 fromURI:a6 service:a7] > 0;
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  return [(IDSPeerIDManager_SwiftData *)self hasProperty:IDSRegistrationPropertyShowPeerErrors forURI:a3 pushToken:a4 fromURI:a5 service:a6];
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v10 && v9 && v11)
  {
    uint64_t v12 = [(IDSPeerIDManager_SwiftData *)self endpointsForURIs:v8 service:v9 fromURI:v10 ignoringTTL:0];
  }
  else
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing required field(s) for endpointsForURIs -- returning nil {uris: %@, service: %@, fromURI: %@}", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v17 = v9;
      id v18 = v10;
      id v16 = v8;
      _IDSLogV();
    }
    uint64_t v12 = +[NSDictionary dictionary];
  }
  id v14 = (void *)v12;

  return v14;
}

- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10 && v11 && v12 && v13)
  {
    id v24 = v11;
    id v15 = +[NSArray arrayWithObjects:&v24 count:1];
    id v16 = [(IDSPeerIDManager_SwiftData *)self endpointsForURIs:v15 service:v12 fromURI:v14];
    id v17 = [v16 objectForKey:v11];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001C398;
    v22[3] = &unk_10097E5D0;
    id v23 = v10;
    id v18 = objc_msgSend(v17, "__imArrayByFilteringWithBlock:", v22);
    uint64_t v19 = [v18 firstObject];
  }
  else
  {
    id v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v12;
      __int16 v31 = 2112;
      long long v32 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Missing required field(s) for endpointForPushToken -- returning nil {pushToken: %@, URI: %@, service: %@, fromURI: %@}", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(const void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v19 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v11 fromURI:v12 toURI:v18 ignoreExpiration:v6];
        if (v19) {
          CFDictionarySetValue(theDict, v18, v19);
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  return theDict;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6
{
  id v10 = a3;
  id v23 = a4;
  id v11 = a5;
  id v12 = a6;
  theDict = +[NSMutableDictionary dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v10;
  id v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(const void **)(*((void *)&v26 + 1) + 8 * i);
        id v18 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v23 fromURI:v11 toURI:v17 ignoreExpiration:0];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10001C774;
        v24[3] = &unk_10097E5D0;
        id v25 = v12;
        uint64_t v19 = objc_msgSend(v18, "__imArrayByFilteringWithBlock:", v24);
        if (v19) {
          CFDictionarySetValue(theDict, v17, v19);
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  return theDict;
}

- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8
{
  char v56 = a6;
  id v12 = a3;
  id v13 = a4;
  id v46 = a5;
  id v44 = a7;
  id v14 = a8;
  id v47 = v13;
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  __int16 v45 = v14;
  v51 = [v14 objectForKey:v13];
  long long v54 = [(IDSPeerIDManager_SwiftData *)self endpointsForURIs:v12 service:v13 fromURI:v46 ignoringTTL:1];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v12;
  id v53 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v53)
  {
    uint64_t v50 = *(void *)v62;
    do
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ((v56 & 1) == 0) {
          goto LABEL_7;
        }
        id v17 = [v54 objectForKey:*(void *)(*((void *)&v61 + 1) + 8 * i)];

        if (!v17)
        {
          long long v27 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v16;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "URI %@ didn't have remote devices.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v42 = v16;
            _IDSLogV();
          }
LABEL_7:
          long long v55 = 0;
          goto LABEL_10;
        }
        long long v55 = [v54 objectForKey:v16];
LABEL_10:
        if ((v56 & 2) != 0)
        {
          uint64_t v19 = [(IDSPeerIDManager_SwiftData *)self verifierResultsForURIs:obj service:v47 fromURI:v46];
          id v20 = [v19 objectForKey:v16];

          if (v20)
          {
            id v21 = objc_alloc((Class)IDSIDKTData);
            long long v22 = [v19 objectForKey:v16];
            id v18 = [v21 initWithVerifierResult:v22 requestID:0];

            id v23 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              long long v24 = [v19 objectForKey:v16];
              id v25 = [(IDSPeerIDManager_SwiftData *)self lightDescriptionForVerifierResult:v24];
              *(_DWORD *)buf = 138412546;
              v67 = v16;
              __int16 v68 = 2112;
              CFStringRef v69 = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "URI %@ found a KTVerifierResult %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v26 = [v19 objectForKey:v16];
              [(IDSPeerIDManager_SwiftData *)self lightDescriptionForVerifierResult:v26];
              __int16 v43 = v42 = v16;
              _IDSLogV();
            }
          }
          else
          {
            long long v28 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v67 = v16;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "URI %@ didn't find a KTVerifierResult", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v42 = v16;
              _IDSLogV();
            }
            id v18 = 0;
          }
        }
        else
        {
          id v18 = 0;
        }
        if ((v56 & 4) != 0)
        {
          id v30 = [v54 objectForKey:v16];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v29 = 0;
          id v31 = [v30 countByEnumeratingWithState:&v57 objects:v65 count:16];
          if (v31)
          {
            uint64_t v32 = *(void *)v58;
            do
            {
              for (j = 0; j != v31; j = (char *)j + 1)
              {
                if (*(void *)v58 != v32) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v34 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * (void)j), "gameCenterData", v42, v43, v44);
                long long v35 = (void *)v34;
                if (v29)
                {
                  uint64_t v36 = [v29 compareAgainstData:v34];

                  long long v29 = (void *)v36;
                }
                else
                {
                  long long v29 = (void *)v34;
                }
              }
              id v31 = [v30 countByEnumeratingWithState:&v57 objects:v65 count:16];
            }
            while (v31);
          }
        }
        else
        {
          long long v29 = 0;
        }
        id v37 = objc_alloc((Class)IDSIDInfoResult);
        long long v38 = [v16 prefixedURI];
        long long v39 = [v51 objectForKey:v16];
        id v40 = objc_msgSend(v37, "initWithURI:status:endpoints:ktData:gameCenterData:", v38, objc_msgSend(v39, "integerValue"), v55, v18, v29);

        if (v40) {
          CFDictionarySetValue(theDict, v16, v40);
        }
      }
      id v53 = [obj countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v53);
  }

  return theDict;
}

- (id)lightDescriptionForVerifierResult:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_opt_class();
    int v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 succeed]);
    BOOL v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 uiStatus]);
    BOOL v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 staticAccountKeyStatus]);
    id v8 = [v3 publicID];
    id v9 = [v3 failure];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; KTResult: %@, UIStatus: %@, StaticKeyResult: %@, AccountKey: %@, Error: %@>",
      v4,
      v3,
      v5,
      v6,
      v7,
      v8,
      v9);
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = &stru_10099BE78;
  }

  return v10;
}

+ (BOOL)_datePassed:(id)a3
{
  [a3 timeIntervalSinceNow];
  return v3 <= 0.0;
}

- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6
{
  return [(IDSPeerIDManager_SwiftData *)self _endpointsForService:a3 fromURI:a4 toURI:a5 ignoreExpiration:a6 ignoreCache:0 hitCache:0];
}

- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6 ignoreCache:(BOOL)a7 hitCache:(BOOL *)a8
{
  BOOL v10 = a6;
  id v32 = a3;
  id v33 = a4;
  id v34 = a5;
  id v14 = [[IDSPeerIDKey alloc] initWithService:v32 fromURI:v33 toURI:v34];
  if (a7)
  {
LABEL_21:
    if (a8) {
      *a8 = 0;
    }
    uint64_t v16 = [(IDSPeerIDManager_SwiftData *)self _loadCachedPeerIDValueForKey:v14 ignoreExpiration:v10];
    uint64_t v25 = [v16 endpoints];
    goto LABEL_24;
  }
  uint64_t v15 = [(NSCache *)self->_dbCache objectForKey:v14];
  uint64_t v16 = v15;
  if (!v15)
  {
    long long v26 = +[IDSFoundationLog PeerLookup_DBCache];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v40 = v32;
      __int16 v41 = 2112;
      id v42 = v33;
      __int16 v43 = 2112;
      id v44 = v34;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "DB Cache Miss { service: %@, fromURI: %@, toURI: %@ }", buf, 0x20u);
    }

    goto LABEL_21;
  }
  if (a8) {
    *a8 = 1;
  }
  if (!v10)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = [v15 endpoints];
    id v18 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v36;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v17);
          }
          id v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v22 = objc_opt_class();
          id v23 = [v21 expireDate];
          LODWORD(v22) = [v22 _datePassed:v23];

          if (v22)
          {
            long long v29 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [v21 URI];
              *(_DWORD *)buf = 138412290;
              id v40 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "** At least one session token expired for: %@, need to get new ones", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v31 = [v21 URI];
              _IDSLogV();
            }
            long long v27 = 0;
            goto LABEL_25;
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
  }
  long long v24 = +[IDSFoundationLog PeerLookup_DBCache];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v40 = v32;
    __int16 v41 = 2112;
    id v42 = v33;
    __int16 v43 = 2112;
    id v44 = v34;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "DB Cache Hit { service: %@, fromURI: %@, toURI: %@ }", buf, 0x20u);
  }

  uint64_t v25 = [v16 endpoints];
LABEL_24:
  long long v27 = (void *)v25;
LABEL_25:

  return v27;
}

- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSCache *)self->_dbCache mapTableRepresentation];
  id v9 = [v8 keyEnumerator];
  BOOL v10 = [v9 allObjects];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001D5F8;
  v15[3] = &unk_10097E5F8;
  id v16 = v6;
  id v17 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "__imArrayByFilteringWithBlock:", v15);

  return v13;
}

- (id)_peerIDKeysForService:(id)a3
{
  id v4 = a3;
  int v5 = [(NSCache *)self->_dbCache mapTableRepresentation];
  id v6 = [v5 keyEnumerator];
  id v7 = [v6 allObjects];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D764;
  v11[3] = &unk_10097E620;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v11);

  return v9;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  BOOL v10 = [(IDSKeyTransparencyVerifier *)self->_keyTransparencyVerifier accountController];
  id v11 = [(IDSKeyTransparencyVerifier *)self->_keyTransparencyVerifier serviceController];
  id v12 = [v11 serviceWithIdentifier:v9];
  id v13 = [v10 accountsOnService:v12];

  id v40 = objc_alloc_init((Class)NSMutableSet);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v13;
  id v14 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * i), "registration", v33);
        uint64_t v19 = [v18 uris];
        id v20 = objc_msgSend(v19, "__imArrayByApplyingBlock:", &stru_10097E660);

        [v40 addObjectsFromArray:v20];
      }
      id v15 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v15);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v34 = v8;
  id v38 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v46;
    do
    {
      for (j = 0; j != v38; j = (char *)j + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v22 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        key = v22;
        long long v24 = [v22 tokenFreeURI];
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v25 = v40;
        id v26 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v42;
          while (2)
          {
            for (k = 0; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v42 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)k), "tokenFreeURI", v33);
              id v31 = [(IDSPeerIDManager_SwiftData *)self _keyTransparencyVerifierResultForService:v9 fromURI:v30 toURI:v24];

              if (v31)
              {
                CFDictionarySetValue(theDict, key, v31);

                goto LABEL_23;
              }
            }
            id v27 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_23:
      }
      id v38 = [v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v38);
  }

  return theDict;
}

- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  int v5 = [(IDSPeerIDManager_SwiftData *)self keyTransparencyContextForService:a3 fromURI:a4 toURI:a5];
  id v6 = [v5 verifierResult];

  return v6;
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[IDSPeerIDKey alloc] initWithService:v10 fromURI:v9 toURI:v8];

  id v12 = [(NSCache *)self->_dbCache objectForKey:v11];
  if (!v12)
  {
    id v12 = [(IDSPeerIDManager_SwiftData *)self _loadCachedPeerIDValueForKey:v11 ignoreExpiration:0];
  }
  id v13 = v12;
  id v14 = [v12 keyTransparencyContext];

  return v14;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  id v4 = a3;
  long long v48 = self;
  long long v43 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:@"com.apple.madrid"];
  int v5 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v67 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating query cache with KT peer verification results { count: %lu }", buf, 0xCu);
  }

  id v51 = objc_alloc_init((Class)NSMutableArray);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v42 = v4;
  id obj = [v4 allKeys];
  long long v46 = (char *)[obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v63;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v63 != v45) {
          objc_enumerationMutation(obj);
        }
        long long v49 = v6;
        id v7 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v6);
        id v8 = [(NSCache *)v48->_dbCache mapTableRepresentation];
        id v9 = [v8 keyEnumerator];
        id v10 = [v9 allObjects];

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v59;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v59 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
              id v17 = [v16 service];
              if ([v17 isEqualToString:@"com.apple.madrid"])
              {
                id v18 = [v16 toURI];
                unsigned int v19 = [v7 isEqualToURI:v18];

                if (v19) {
                  [v51 addObject:v16];
                }
              }
              else
              {
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v58 objects:v71 count:16];
          }
          while (v13);
        }

        id v6 = v49 + 1;
      }
      while (v49 + 1 != v46);
      long long v46 = (char *)[obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v46);
  }

  id v20 = v51;
  if ([v51 count])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v50 = v51;
    id v21 = [v50 countByEnumeratingWithState:&v54 objects:v70 count:16];
    long long v22 = v42;
    if (v21)
    {
      id v23 = v21;
      char v24 = 0;
      uint64_t v25 = *(void *)v55;
      do
      {
        id v26 = 0;
        id v47 = v23;
        do
        {
          if (*(void *)v55 != v25) {
            objc_enumerationMutation(v50);
          }
          id v27 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v26);
          uint64_t v28 = [v27 toURI];
          long long v29 = [(NSCache *)v48->_dbCache objectForKey:v27];
          id v30 = [v29 keyTransparencyContext];

          id v31 = [v30 verifierResult];
          id v32 = [v22 objectForKeyedSubscript:v28];
          if (([v31 isEqual:v32] & 1) == 0)
          {
            id v33 = v22;
            uint64_t v34 = v25;
            long long v35 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v67 = v28;
              __int16 v68 = 2112;
              CFStringRef v69 = v32;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "URI: %@ has a new KTVerifierResult: %@", buf, 0x16u);
            }

            id v36 = objc_alloc((Class)IDSQueryKeyTransparencyContext);
            uint64_t v37 = [v30 accountKey];
            id v38 = [v30 queryResponseTime];
            id v39 = objc_msgSend(v36, "initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:", v32, 0, v37, v38, objc_msgSend(v30, "ktOptIn"));

            [(IDSPeerIDManager_SwiftData *)v48 _updateKTContext:v39 forURI:v28];
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_10001E310;
            v52[3] = &unk_10097E688;
            id v53 = v28;
            [v43 updateKeyTransparencyContext:v39 uri:v53 service:@"com.apple.madrid" completion:v52];

            char v24 = 1;
            uint64_t v25 = v34;
            long long v22 = v33;
            id v23 = v47;
          }

          id v26 = (char *)v26 + 1;
        }
        while (v23 != v26);
        id v23 = [v50 countByEnumeratingWithState:&v54 objects:v70 count:16];
      }
      while (v23);
    }
    else
    {
      char v24 = 0;
    }

    id v40 = +[TransparencyAnalytics logger];
    long long v41 = +[NSNumber numberWithBool:v24 & 1];
    [v40 logMetric:v41 withName:@"IDSKTPeerVerificationResultsChanged"];

    id v20 = v51;
  }
  else
  {
    id v40 = +[IDSFoundationLog KeyTransparency];
    long long v22 = v42;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Found no keys to update.", buf, 2u);
    }
  }
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  id v17 = a11;
  id v18 = a10;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [[IDSPeerIDQueryContext alloc] initWithSending:v12 refresh:v11 messaging:0 resultExpected:0 preventNewQuery:0 isForced:a9];
  LOBYTE(v12) = [(IDSPeerIDManager_SwiftData *)self startQueryForURIs:v22 fromIdentity:v21 fromURI:v20 fromService:v19 context:v23 reason:v18 completionBlock:v17];

  return v12;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  id v33 = a8;
  id v32 = a7;
  id v31 = a4;
  id v18 = +[NSMutableSet setWithArray:a3];
  id v19 = objc_msgSend(v18, "__imSetByApplyingBlock:", &stru_10097E6C8);
  id v20 = [v19 allObjects];
  id v21 = [(IDSPeerIDManager_SwiftData *)self endpointsForURIs:v20 service:v16 fromURI:v15];

  id v22 = [(IDSPeerIDManager_SwiftData *)self queryHandler];
  id v23 = [v18 allObjects];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10001E8A4;
  v34[3] = &unk_10097E6F0;
  v34[4] = self;
  id v35 = v19;
  id v36 = v16;
  id v37 = v15;
  id v38 = v18;
  id v39 = v21;
  id v40 = v17;
  id v30 = v17;
  id v29 = v21;
  id v24 = v18;
  id v25 = v15;
  id v26 = v16;
  id v27 = v19;
  LOBYTE(self) = [v22 startQueryForURIs:v23 fromIdentity:v31 fromURI:v25 fromService:v26 context:v32 reason:v33 completionBlock:v34];

  return (char)self;
}

- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 prefixedURI];
  id v14 = [v13 length];

  if (v14)
  {
    id v15 = [v9 rawToken];
    id v16 = [v15 length];

    if (v16)
    {
      [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v12 fromURI:v11 toURI:v10 ignoreExpiration:0];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v42;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = [*(id *)(*((void *)&v41 + 1) + 8 * i) pushTokenObject];
            unsigned __int8 v22 = [v21 isEqualToPushToken:v9];

            if (v22)
            {
              char v23 = 1;
              goto LABEL_13;
            }
          }
          id v18 = [v17 countByEnumeratingWithState:&v41 objects:v52 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      char v23 = 0;
LABEL_13:

      id v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v47 = v9;
        __int16 v48 = 2112;
        id v49 = v10;
        __int16 v50 = 2112;
        id v51 = v17;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Checking peer token: %@ for URI: %@   (Tokens: %@)", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v34 = v10;
        id v35 = v17;
        id v33 = v9;
        _IDSLogV();
      }
      if (v23)
      {
        id v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "  => Good to go, we have it", buf, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
          goto LABEL_45;
        }
      }
      else
      {
        id v26 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "  => We don't have it - clearing that peer's map", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        if (!+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v28 = [(NSMutableDictionary *)self->_purgeClientDataBlocks allValues];
          id v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v38;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(void *)v38 != v30) {
                  objc_enumerationMutation(v28);
                }
                uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
                if (v32) {
                  (*(void (**)(uint64_t, id))(v32 + 16))(v32, v12);
                }
              }
              id v29 = [v28 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v29);
          }

          [(IDSPeerIDManager_SwiftData *)self forgetPeerTokensForURI:v10 fromURI:v11 service:v12];
          goto LABEL_45;
        }
        id v27 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not flushing tokens, we're in debilitated mode", buf, 2u);
        }

        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        {
LABEL_45:

          goto LABEL_46;
        }
      }
      _IDSLogV();
      goto LABEL_45;
    }
  }
LABEL_46:
}

- (void)clearCacheAndPersistImmediately:(BOOL)a3
{
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing peer and personal caches", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(NSCache *)self->_dbCache removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v5 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
  id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) deleteAllWithCompletion:&stru_10097E730];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  double v3 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
  if ([v3 count] == (id)1)
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 peerMapRepresentation];
  }
  else
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) peerMapRepresentation];
          [v4 addEntriesFromDictionary:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v5 = [v4 copy];
  }
  long long v12 = v5;

  return v12;
}

- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not forgetting tokens, we're in debilitated mode", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for URIs: %@  services: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v15 = v17;
      id v16 = v6;
      _IDSLogV();
    }
    [(NSCache *)self->_dbCache removeAllObjects];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v12);
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10001F94C;
          v18[3] = &unk_10097E758;
          id v14 = v17;
          id v19 = v14;
          id v20 = v6;
          [v13 deleteEndpointsWithServices:v20 toURIs:v14 completion:v18];

          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v31 = a4;
  id v32 = a5;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not forgetting tokens, we're in debilitated mode", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    id v10 = [v8 prefixedURI];
    id v11 = [v10 length];

    if (v11)
    {
      long long v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v48 = v8;
        __int16 v49 = 2112;
        id v50 = v31;
        __int16 v51 = 2112;
        id v52 = v32;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for URI: %@  from URI: %@  service: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v27 = v31;
        id v28 = v32;
        id v26 = v8;
        _IDSLogV();
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v42 = 0u;
      long long v41 = 0u;
      id v13 = [(NSMutableDictionary *)self->_purgeClientDataBlocks allValues];
      id v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v42;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v16);
            if (v17) {
              (*(void (**)(uint64_t, id))(v17 + 16))(v17, v32);
            }
            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v14);
      }

      id v29 = [[IDSPeerIDKey alloc] initWithService:v32 fromURI:v31 toURI:v8];
      [(NSCache *)self->_dbCache removeObjectForKey:v29];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
      id v18 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v38;
        do
        {
          id v20 = 0;
          do
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(obj);
            }
            long long v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v20);
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_10001FF08;
            v33[3] = &unk_10097E540;
            id v22 = v8;
            id v23 = v8;
            id v34 = v23;
            id v24 = v31;
            id v35 = v24;
            id v36 = v32;
            id v25 = v23;
            id v8 = v22;
            [v21 deleteEndpointsWithService:v36 fromURI:v24 toURI:v25 completion:v33];

            id v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v18);
      }
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v33 = a5;
  id v36 = v8;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
  {
    uint64_t v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not forgetting tokens, we're in debilitated mode", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    id v10 = [v8 prefixedURI];
    if ([v10 length])
    {
      id v11 = [v33 count];

      if (v11)
      {
        long long v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v57 = v8;
          __int16 v58 = 2112;
          id v59 = v35;
          __int16 v60 = 2112;
          id v61 = v33;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for URI: %@  from URI: %@  services: %@", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v31 = v35;
          id v32 = v33;
          id v30 = v8;
          _IDSLogV();
        }
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id obj = v33;
        id v13 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v50;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v50 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * i);
              long long v45 = 0u;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              uint64_t v17 = [(NSMutableDictionary *)self->_purgeClientDataBlocks allValues];
              id v18 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
              if (v18)
              {
                uint64_t v19 = *(void *)v46;
                do
                {
                  for (j = 0; j != v18; j = (char *)j + 1)
                  {
                    if (*(void *)v46 != v19) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
                    if (v21) {
                      (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, v16);
                    }
                  }
                  id v18 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
                }
                while (v18);
              }

              id v22 = [[IDSPeerIDKey alloc] initWithService:v16 fromURI:v35 toURI:v36];
              [(NSCache *)self->_dbCache removeObjectForKey:v22];
            }
            id v13 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
          }
          while (v13);
        }

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v23 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
        id v24 = [v23 countByEnumeratingWithState:&v41 objects:v53 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v42;
          do
          {
            for (k = 0; k != v24; k = (char *)k + 1)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v23);
              }
              id v27 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
              v37[0] = _NSConcreteStackBlock;
              v37[1] = 3221225472;
              v37[2] = sub_100020570;
              v37[3] = &unk_10097E540;
              id v28 = v36;
              id v38 = v28;
              id v29 = v35;
              id v39 = v29;
              id v40 = obj;
              [v27 deleteEndpointsWithServices:v40 fromURI:v29 toURI:v28 completion:v37];
            }
            id v24 = [v23 countByEnumeratingWithState:&v41 objects:v53 count:16];
          }
          while (v24);
        }
      }
    }
    else
    {
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v29 = v6;
  if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
  {
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not forgetting tokens, we're in debilitated mode", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    id v8 = [v6 prefixedURI];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v42 = v6;
        __int16 v43 = 2112;
        id v44 = v30;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for URI: %@ service: %@ for all registered URIs.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v27 = v6;
        id v28 = v30;
        _IDSLogV();
      }
      id v11 = +[IDSDAccountController sharedInstance];
      long long v12 = +[IDSDServiceController sharedInstance];
      id v13 = [v12 serviceWithIdentifier:v30];
      uint64_t v14 = [v11 accountsOnService:v13];

      id v15 = objc_alloc_init((Class)NSMutableSet);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v16 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v36;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v16);
            }
            id v20 = [*(id *)(*((void *)&v35 + 1) + 8 * i) registration];
            uint64_t v21 = [v20 uris];
            id v22 = objc_msgSend(v21, "__imArrayByApplyingBlock:", &stru_10097E778);

            [v15 addObjectsFromArray:v22];
          }
          id v17 = [v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v17);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v15;
      id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v32;
        do
        {
          for (j = 0; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v32 != v25) {
              objc_enumerationMutation(v23);
            }
            [(IDSPeerIDManager_SwiftData *)self forgetPeerTokensForURI:v29 fromURI:*(void *)(*((void *)&v31 + 1) + 8 * (void)j) service:v30];
          }
          id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v24);
      }
    }
  }
}

- (void)forgetPeerTokensForService:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for service {service: %@}", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v4;
    _IDSLogV();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(NSMutableDictionary *)self->_purgeClientDataBlocks allValues];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v9);
        if (v10) {
          (*(void (**)(uint64_t, id))(v10 + 16))(v10, v4);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(NSCache *)self->_dbCache removeAllObjects];
  id v11 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:v4];
  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100020DA8;
    v13[3] = &unk_10097E688;
    id v14 = v4;
    [v11 deleteEndpointsWithService:v14 completion:v13];
  }
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 prefixedURI];
  id v12 = [v11 length];

  if (v12)
  {
    if (+[IDSPeerIDManager_SwiftData shouldUseSelfTokens])
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      long long v15 = [v8 pushToken];
      long long v16 = [v8 tokenFreeURI];
      long long v17 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v10 fromURI:v9 toURI:v16 ignoreExpiration:0];
      long long v18 = v17;
      if (v17 && [v17 count])
      {
        if (v15)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v19 = v18;
          id v14 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14)
          {
            id v24 = v16;
            uint64_t v20 = *(void *)v26;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v19);
                }
                id v22 = [*(id *)(*((void *)&v25 + 1) + 8 * i) pushTokenObject];
                if (v22 && ([v15 isEqualToPushToken:v22] & 1) != 0)
                {

                  LOBYTE(v14) = 1;
                  goto LABEL_22;
                }
              }
              id v14 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
              if (v14) {
                continue;
              }
              break;
            }
LABEL_22:
            long long v16 = v24;
          }
        }
        else
        {
          LOBYTE(v14) = 1;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return (char)v14;
}

- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!-[IDSPeerIDManager_SwiftData hasPeerTokensForURI:fromURI:service:](self, "hasPeerTokensForURI:fromURI:service:", *(void *)(*((void *)&v18 + 1) + 8 * i), v9, v10, (void)v18))
        {
          BOOL v16 = 0;
          goto LABEL_11;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (id)activeURIsFromURI:(id)a3 service:(id)a4
{
  id v30 = a3;
  id v31 = a4;
  id v6 = [v30 prefixedURI];
  if (![v6 length])
  {

    long long v25 = 0;
LABEL_36:
    id v7 = v31;
    goto LABEL_38;
  }
  id v7 = v31;
  id v8 = [v31 length];

  if (v8)
  {
    id v9 = [(IDSPeerIDManager_SwiftData *)self _peerIDKeysForService:v31 andFromURI:v30];
    id v36 = objc_alloc_init((Class)NSMutableSet);
    id v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v48 = v31;
      __int16 v49 = 2112;
      id v50 = v30;
      __int16 v51 = 2112;
      long long v52 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Active query for service: %@  from: %@  peers: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v28 = v30;
      id v29 = v9;
      id v27 = v31;
      _IDSLogV();
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v9;
    id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v34)
    {
      uint64_t v33 = *(void *)v42;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v42 != v33)
          {
            uint64_t v12 = v11;
            objc_enumerationMutation(obj);
            uint64_t v11 = v12;
          }
          uint64_t v35 = v11;
          uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v11);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v14 = -[NSCache objectForKey:](self->_dbCache, "objectForKey:", v13, v27, v28, v29);
          long long v15 = [v14 endpoints];

          id v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v38;
            do
            {
              for (i = 0; i != v16; i = (char *)i + 1)
              {
                if (*(void *)v38 != v17) {
                  objc_enumerationMutation(v15);
                }
                long long v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                uint64_t v20 = objc_opt_class();
                long long v21 = [v19 expireDate];
                LOBYTE(v20) = [(id)v20 _datePassed:v21];

                if (v20)
                {
                  id v22 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v48 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "  Expired session for: %@, skipping...", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    id v27 = v19;
                    _IDSLogV();
                  }
                }
                else
                {
                  id v23 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v48 = v19;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "  Active sessions for: %@, adding...", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    id v27 = v19;
                    _IDSLogV();
                  }
                  id v24 = objc_msgSend(v19, "URI", v27);
                  [v36 addObject:v24];
                }
              }
              id v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v16);
          }

          uint64_t v11 = v35 + 1;
        }
        while ((id)(v35 + 1) != v34);
        id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v34);
    }

    long long v25 = [v36 allObjects];

    goto LABEL_36;
  }
  long long v25 = 0;
LABEL_38:

  return v25;
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  id v34 = self;
  id v9 = [(NSCache *)self->_dbCache mapTableRepresentation];
  id v10 = [v9 keyEnumerator];
  uint64_t v11 = [v10 allObjects];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v44;
    uint64_t v32 = *(void *)v44;
    id v33 = v7;
    do
    {
      long long v15 = 0;
      id v35 = v13;
      do
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v15);
        uint64_t v17 = [v16 service];
        unsigned int v18 = [v17 isEqualToString:v7];

        if (v18)
        {
          long long v38 = v15;
          long long v19 = [(NSCache *)v34->_dbCache objectForKey:v16];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v37 = v19;
          uint64_t v20 = [v19 endpoints];
          id v21 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v20);
                }
                long long v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                long long v26 = [v25 pushToken];
                id v27 = [v6 rawToken];
                unsigned int v28 = [v26 isEqualToData:v27];

                if (v28)
                {
                  id v29 = [v25 URI];
                  [v8 addObject:v29];
                }
              }
              id v22 = [v20 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v22);
          }

          uint64_t v14 = v32;
          id v7 = v33;
          id v13 = v35;
          long long v15 = v38;
        }
        long long v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v13);
  }

  id v30 = [v8 allObjects];

  return v30;
}

- (id)peerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[NSMutableSet set];
  id v12 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:v10 fromURI:v9 toURI:v8 ignoreExpiration:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) pushTokenObject];
        if (v17) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)uriForShortHandle:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = IDSServiceNameiMessage;
    [(IDSPeerIDManager_SwiftData *)self _peerIDKeysForService:IDSServiceNameiMessage];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v25) {
      goto LABEL_19;
    }
    uint64_t v21 = v5;
    id v6 = 0;
    uint64_t v23 = *(void *)v31;
    id v24 = self;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(NSCache *)self->_dbCache objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        id v9 = [v8 endpoints];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              id v16 = [v15 shortHandle];
              unsigned int v17 = [v16 isEqualToString:v4];

              if (v17)
              {
                uint64_t v18 = [v15 URI];

                id v6 = (void *)v18;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v12);
        }

        self = v24;
      }
      id v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
    uint64_t v5 = v21;
    if (!v6)
    {
LABEL_19:
      long long v19 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:v5];
      id v6 = [v19 uriForShortHandle:v4];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 prefixedURI];
  id v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = IDSServiceNameiMessage;
    id v11 = [(IDSPeerIDManager_SwiftData *)self _endpointsForService:IDSServiceNameiMessage fromURI:v7 toURI:v6 ignoreExpiration:1];
    id v12 = [v11 firstObject];

    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v13 = [v12 shortHandle];
    if (!v13
      || (id v14 = (void *)v13,
          [v12 shortHandle],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v14,
          !v15)
      || ([v12 shortHandle], (id v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_6:
      unsigned int v17 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:v10];
      id v16 = [v17 shortHandleForUri:v6];
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000220E4;
    v11[3] = &unk_10097E7A0;
    id v12 = v6;
    id v8 = a4;
    id v9 = objc_retainBlock(v11);
    uint64_t v10 = [(IDSPeerIDManager_SwiftData *)self queryHandler];
    [v10 addCompletionBlock:v9 forToken:v8];
  }
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPeerIDManager_SwiftData *)self queryHandler];
  [v5 removeCompletionBlockForToken:v4];
}

- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_clientDataUpdateBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        clientDataUpdateBlocks = self->_clientDataUpdateBlocks;
        self->_clientDataUpdateBlocks = Mutable;
      }
      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_clientDataUpdateBlocks;
        id v13 = objc_retainBlock(v10);
        [(NSMutableDictionary *)v12 setObject:v13 forKey:v7];
      }
      goto LABEL_18;
    }
    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Empty client data update block for token: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_17:
    }
      _IDSLogV();
  }
  else
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Empty token for client data update block", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)removeClientDataUpdateBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableDictionary *)self->_clientDataUpdateBlocks removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_clientDataUpdateBlocks count])
    {
      clientDataUpdateBlocks = self->_clientDataUpdateBlocks;
      self->_clientDataUpdateBlocks = 0;
    }
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Empty token for removing client data update block", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      if (!self->_purgeClientDataBlocks)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        purgeClientDataBlocks = self->_purgeClientDataBlocks;
        self->_purgeClientDataBlocks = Mutable;
      }
      id v10 = [v6 copy];
      id v11 = v10;
      if (v10)
      {
        id v12 = self->_purgeClientDataBlocks;
        id v13 = objc_retainBlock(v10);
        [(NSMutableDictionary *)v12 setObject:v13 forKey:v7];
      }
      goto LABEL_18;
    }
    uint64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Empty purge client data block for token: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_17:
    }
      _IDSLogV();
  }
  else
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Empty token for purge client data block", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (void)removePurgeClientDataBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableDictionary *)self->_purgeClientDataBlocks removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_purgeClientDataBlocks count])
    {
      purgeClientDataBlocks = self->_purgeClientDataBlocks;
      self->_purgeClientDataBlocks = 0;
    }
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Empty token for removing purge client data block", v7, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022A2C;
    block[3] = &unk_10097E7C8;
    block[4] = self;
    id v19 = v8;
    id v17 = v11;
    id v18 = v9;
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_retainBlock(v8);
      *(_DWORD *)buf = 138412802;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing context for adding endpoint query completion block -- ignoring request {block: %@, token: %@, queue: %@}", buf, 0x20u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v15 = objc_retainBlock(v8);
      _IDSLogV();
    }
  }
}

- (void)removeEndpointQueryCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022C68;
    block[3] = &unk_10097E440;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Missing context for removing endpoint query completion block -- ignoring request {token: %@}", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (!v12 || !v13 || !v14 || !v15 || !v16)
  {
    id v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_retainBlock(v15);
      *(_DWORD *)buf = 138413314;
      id v36 = v12;
      __int16 v37 = 2112;
      id v38 = v13;
      __int16 v39 = 2112;
      id v40 = v14;
      __int16 v41 = 2112;
      id v42 = v19;
      __int16 v43 = 2112;
      long long v44 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Missing context for endpoint request -- returning nil {URIs: %@, serviceIdentifier: %@, localURI: %@, completion: %@, queue: %@}", buf, 0x34u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v26 = objc_retainBlock(v15);
      _IDSLogV();
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022FCC;
    block[3] = &unk_10097E7F0;
    id v34 = v15;
    dispatch_async(v17, block);
  }
  long long v20 = im_primary_queue();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100022FE0;
  v27[3] = &unk_10097E840;
  v27[4] = self;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  long long v31 = v17;
  id v32 = v15;
  id v21 = v15;
  __int16 v22 = v17;
  id v23 = v14;
  id v24 = v13;
  id v25 = v12;
  dispatch_async(v20, v27);
}

- (void)performCleanupTasks
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(IDSPeerIDManager_SwiftData *)self persistenceManagers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) performDBCleanupTasks];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSCache *)self->_dbCache removeAllObjects];
}

- (id)_loadCachedPeerIDValueForKey:(id)a3 ignoreExpiration:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 service];
    if (v8)
    {
      long long v9 = (void *)v8;
      uint64_t v10 = [v7 fromURI];
      if (v10)
      {
        long long v11 = (void *)v10;
        id v12 = [v7 toURI];

        if (v12) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
  }
  id v13 = +[IDSFoundationLog PeerLookup_DBCache];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    long long v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Cannot load key, missing data. { peerIDKey: %@ }", (uint8_t *)&v26, 0xCu);
  }

LABEL_10:
  id v14 = [v7 service];
  id v15 = [(IDSPeerIDManager_SwiftData *)self persistenceManagerForService:v14];

  id v16 = [v7 service];
  id v17 = [v7 fromURI];
  id v18 = [v7 toURI];
  id v19 = [v15 fetchEndpointsWithService:v16 fromURI:v17 toURI:v18 ignoreExpiration:v4];

  long long v20 = [v7 toURI];
  id v21 = [v7 service];
  __int16 v22 = [v15 fetchKeyTransparencyContextFor:v20 service:v21];

  id v23 = [[IDSPeerIDValue alloc] initWithEndpoints:v19 keyTransparencyContext:v22];
  id v24 = +[IDSFoundationLog PeerLookup_DBCache];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412546;
    long long v27 = v7;
    __int16 v28 = 2112;
    id v29 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "DB Cache Load { peerIDKey: %@, peerIDValue: %@ }", (uint8_t *)&v26, 0x16u);
  }

  -[NSCache setObject:forKey:cost:](self->_dbCache, "setObject:forKey:cost:", v23, v7, [v19 count]);

  return v23;
}

- (void)_updateKTContext:(id)a3 forURI:(id)a4
{
  id v31 = a3;
  id v32 = a4;
  id v6 = [(IDSKeyTransparencyVerifier *)self->_keyTransparencyVerifier accountController];
  id v7 = [(IDSKeyTransparencyVerifier *)self->_keyTransparencyVerifier serviceController];
  uint64_t v8 = [v7 serviceWithIdentifier:@"com.apple.madrid"];
  long long v9 = [v6 accountsOnService:v8];

  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v14) registration];
        id v16 = [v15 uris];
        id v17 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &stru_10097E860);

        [v10 addObjectsFromArray:v17];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v29 = v10;
  id v18 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      id v21 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v29);
        }
        __int16 v22 = [[IDSPeerIDKey alloc] initWithService:@"com.apple.madrid" fromURI:*(void *)(*((void *)&v33 + 1) + 8 * (void)v21) toURI:v32];
        id v23 = [(NSCache *)self->_dbCache objectForKey:v22];
        if (v23)
        {
          id v24 = [IDSPeerIDValue alloc];
          id v25 = [v23 endpoints];
          int v26 = [(IDSPeerIDValue *)v24 initWithEndpoints:v25 keyTransparencyContext:v31];

          dbCache = self->_dbCache;
          __int16 v28 = [v23 endpoints];
          -[NSCache setObject:forKey:cost:](dbCache, "setObject:forKey:cost:", v26, v22, [v28 count]);
        }
        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v29 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v4 = a4;
  id v5 = +[IDSFoundationLog PeerLookup_DBCache];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DB Cache Eviction { peerIDValue: %@ }", (uint8_t *)&v6, 0xCu);
  }
}

- (NSMutableDictionary)clientDataUpdateBlocks
{
  return self->_clientDataUpdateBlocks;
}

- (void)setClientDataUpdateBlocks:(id)a3
{
}

- (NSMutableDictionary)purgeClientDataBlocks
{
  return self->_purgeClientDataBlocks;
}

- (void)setPurgeClientDataBlocks:(id)a3
{
}

- (NSMutableDictionary)endpointQueryListeners
{
  return self->_endpointQueryListeners;
}

- (void)setEndpointQueryListeners:(id)a3
{
}

- (NSMutableDictionary)disasterModeTokens
{
  return self->_disasterModeTokens;
}

- (void)setDisasterModeTokens:(id)a3
{
}

- (IDSPeerIDQueryHandler)queryHandler
{
  return self->_queryHandler;
}

- (void)setQueryHandler:(id)a3
{
}

- (IMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSMutableSet)reportedExcessiveQueryCacheEntries
{
  return self->_reportedExcessiveQueryCacheEntries;
}

- (void)setReportedExcessiveQueryCacheEntries:(id)a3
{
}

- (NSCache)dbCache
{
  return self->_dbCache;
}

- (void)setDbCache:(id)a3
{
}

- (IDSPeerIDPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (IDSKeyTransparencyVerifier)keyTransparencyVerifier
{
  return self->_keyTransparencyVerifier;
}

- (void)setKeyTransparencyVerifier:(id)a3
{
}

- (IDSQuerySDPersistenceManager)swiftDataManager
{
  return self->_swiftDataManager;
}

- (void)setSwiftDataManager:(id)a3
{
}

- (IDSQuerySDPersistenceManager)restrictedPersistenceManager
{
  return self->_restrictedPersistenceManager;
}

- (void)setRestrictedPersistenceManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedPersistenceManager, 0);
  objc_storeStrong((id *)&self->_swiftDataManager, 0);
  objc_storeStrong((id *)&self->_keyTransparencyVerifier, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_dbCache, 0);
  objc_storeStrong((id *)&self->_reportedExcessiveQueryCacheEntries, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_disasterModeTokens, 0);
  objc_storeStrong((id *)&self->_endpointQueryListeners, 0);
  objc_storeStrong((id *)&self->_purgeClientDataBlocks, 0);

  objc_storeStrong((id *)&self->_clientDataUpdateBlocks, 0);
}

@end