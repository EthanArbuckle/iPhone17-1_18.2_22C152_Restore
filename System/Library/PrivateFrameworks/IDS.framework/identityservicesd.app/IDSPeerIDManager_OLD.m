@interface IDSPeerIDManager_OLD
+ (BOOL)_datePassed:(id)a3;
+ (BOOL)shouldUseSelfTokens;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSKeyTransparencyVerifier)keyTransparencyVerifier;
- (IDSPeerIDManager_OLD)init;
- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6;
- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 standardPersistentMap:(id)a5 restrictedServicePersistentMap:(id)a6 keyTransparencyVerifier:(id)a7 userDefaults:(id)a8;
- (IDSPeerIDPushHandler)pushHandler;
- (IDSPeerIDQueryHandler)queryHandler;
- (IDSPersistentMap)restrictedServicePersistentMap;
- (IDSPersistentMap)standardPersistentMap;
- (IMUserDefaults)userDefaults;
- (NSMutableDictionary)clientDataUpdateBlocks;
- (NSMutableDictionary)disasterModeTokens;
- (NSMutableDictionary)endpointQueryListeners;
- (NSMutableDictionary)purgeClientDataBlocks;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)_disasterModeTokenForURI:(id)a3;
- (id)_endpointsForService:(id)a3 fromURI:(id)a4 toURI:(id)a5 ignoreExpiration:(BOOL)a6;
- (id)_keyTransparencyVerifierResultForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
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
- (id)persistentMapForService:(id)a3;
- (id)persistentMaps;
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
- (unint64_t)excessiveQueryCacheEntriesRemovalWindow;
- (unint64_t)excessiveQueryCacheEntriesThreshold;
- (void)_asyncCleanupExpiredEntriesIfNeeded;
- (void)_asyncRemoveExcessiveQueryEntriesIfNeeded;
- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)cleanupExpiredEntriesIfNeeded;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)dealloc;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetSessionTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removeExcessiveQueryEntriesIfNeeded;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setClientDataUpdateBlocks:(id)a3;
- (void)setDisasterModeTokens:(id)a3;
- (void)setEndpointQueryListeners:(id)a3;
- (void)setKeyTransparencyVerifier:(id)a3;
- (void)setPurgeClientDataBlocks:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setQueryHandler:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)setRestrictedServicePersistentMap:(id)a3;
- (void)setStandardPersistentMap:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager_OLD

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

- (IDSPeerIDManager_OLD)init
{
  v3 = [IDSPersistentMap alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v10 = +[IDSPersistentMapMergePolicy prioritizeMemoryPolicy];
  v11 = [(IDSPersistentMap *)v3 initWithIdentifier:@"personal-session-token-cache-v4" versionNumber:4 decodableClasses:v9 dataProtectionClass:0 mergePolicy:v10 migrationBlock:&stru_100988BD0];

  v12 = [[IDSPeerIDQueryDataSource alloc] initWithPeerIDManager:self];
  v13 = [[IDSPeerIDQueryHandler alloc] initWithDelegate:self dataSource:v12];
  v14 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  v15 = +[IDSKeyTransparencyVerifier sharedInstance];
  v16 = +[IMUserDefaults sharedDefaults];
  v17 = [(IDSPeerIDManager_OLD *)self initWithPushHandler:v14 queryHandler:v13 standardPersistentMap:v11 restrictedServicePersistentMap:0 keyTransparencyVerifier:v15 userDefaults:v16];

  return v17;
}

- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 keyTransparencyVerifier:(id)a5 userDefaults:(id)a6
{
  id v23 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [IDSPersistentMap alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v19 = +[IDSPersistentMapMergePolicy prioritizeMemoryPolicy];
  v20 = [(IDSPersistentMap *)v12 initWithIdentifier:@"personal-session-token-cache-v4" versionNumber:4 decodableClasses:v18 dataProtectionClass:0 mergePolicy:v19 migrationBlock:&stru_100988BF0];

  v21 = [(IDSPeerIDManager_OLD *)self initWithPushHandler:v11 queryHandler:v10 standardPersistentMap:v20 restrictedServicePersistentMap:0 keyTransparencyVerifier:v9 userDefaults:v23];
  return v21;
}

- (IDSPeerIDManager_OLD)initWithPushHandler:(id)a3 queryHandler:(id)a4 standardPersistentMap:(id)a5 restrictedServicePersistentMap:(id)a6 keyTransparencyVerifier:(id)a7 userDefaults:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v22 = a7;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)IDSPeerIDManager_OLD;
  v18 = [(IDSPeerIDManager_OLD *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pushHandler, a3);
    objc_storeStrong((id *)&v19->_queryHandler, a4);
    objc_storeStrong((id *)&v19->_standardPersistentMap, a5);
    objc_storeStrong((id *)&v19->_restrictedServicePersistentMap, a6);
    objc_msgSend(v15, "setDelegate:", v19, v22, v23, v24);
    [v16 setDelegate:v19];
    objc_storeStrong((id *)&v19->_keyTransparencyVerifier, a7);
    objc_storeStrong((id *)&v19->_userDefaults, a8);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v19);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10030EE68;
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
  v4.super_class = (Class)IDSPeerIDManager_OLD;
  [(IDSPeerIDManager_OLD *)&v4 dealloc];
}

- (id)_disasterModeTokenForURI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 prefixedURI];
  id v6 = [v5 length];

  if (v6)
  {
    disasterModeTokens = self->_disasterModeTokens;
    uint64_t v8 = [v4 prefixedURI];
    id v9 = [(NSMutableDictionary *)disasterModeTokens objectForKey:v8];

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
    id v9 = 0;
  }

  return v9;
}

- (void)_setDisasterModeToken:(id)a3 forURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_disasterModeTokens allKeys];
  if ((unint64_t)[v8 count] >= 5)
  {
    disasterModeTokens = self->_disasterModeTokens;
    id v10 = objc_msgSend(v8, "__imFirstObject");
    [(NSMutableDictionary *)disasterModeTokens removeObjectForKey:v10];
  }
  if (!self->_disasterModeTokens)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v12 = self->_disasterModeTokens;
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
    sub_10071EBC4(v7);
  }
}

- (id)persistentMapForService:(id)a3
{
  id v4 = a3;
  if (self->_restrictedServicePersistentMap)
  {
    int v5 = IDSShouldUseRestrictedLoggingForService();
    p_standardPersistentMap = &self->_standardPersistentMap;
    if (v5) {
      p_standardPersistentMap = &self->_restrictedServicePersistentMap;
    }
  }
  else
  {
    p_standardPersistentMap = &self->_standardPersistentMap;
  }
  id v7 = *p_standardPersistentMap;

  return v7;
}

- (id)persistentMaps
{
  restrictedServicePersistentMap = self->_restrictedServicePersistentMap;
  if (restrictedServicePersistentMap)
  {
    standardPersistentMap = self->_standardPersistentMap;
    id v9 = restrictedServicePersistentMap;
    p_standardPersistentMap = &standardPersistentMap;
    uint64_t v4 = 2;
  }
  else
  {
    id v7 = self->_standardPersistentMap;
    p_standardPersistentMap = &v7;
    uint64_t v4 = 1;
  }
  int v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_standardPersistentMap, v4, v7, standardPersistentMap, v9);

  return v5;
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v159 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v147 = +[NSDate now];
  id v155 = objc_alloc_init((Class)NSMutableDictionary);
  id v163 = objc_alloc_init((Class)NSMutableDictionary);
  v179 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v11];
  long long v258 = 0u;
  long long v257 = 0u;
  long long v256 = 0u;
  long long v255 = 0u;
  id obj = v9;
  id v156 = [obj countByEnumeratingWithState:&v255 objects:v277 count:16];
  if (v156)
  {
    uint64_t v154 = *(void *)v256;
    uint64_t v184 = IDSGameCenterContactsAssociationID;
    uint64_t v183 = IDSGameCenterContactsSharingState;
    uint64_t v189 = _IDSIdentityClientDataMessageProtectionIdentityKey;
    uint64_t v181 = IDSRegistrationPropertyShowPeerErrors;
    uint64_t v182 = IDSGameCenterContactsLastUpdatedDate;
    uint64_t v165 = _IDSIdentityClientDataDevicePublicIdentityKey;
    uint64_t v166 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
    uint64_t v171 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
    uint64_t v164 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
    uint64_t v169 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v256 != v154)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }
        uint64_t v157 = v12;
        id v14 = *(void **)(*((void *)&v255 + 1) + 8 * v12);
        id v15 = [v14 prefixedURI];
        v161 = [v159 objectForKey:v15];

        v160 = [v161 objectForKey:@"identities"];
        id v192 = objc_alloc_init((Class)IDSEndpointURIProperties);
        id v16 = [v161 objectForKey:@"sender-correlation-identifier"];
        [v192 setSenderCorrelationIdentifier:v16];

        id v17 = [v161 objectForKey:@"short-handle"];
        [v192 setShortHandle:v17];

        v158 = [[IDSPeerIDKey alloc] initWithService:v11 fromURI:v10 toURI:v14];
        if (v161) {
          BOOL v18 = v159 != 0;
        }
        else {
          BOOL v18 = 0;
        }
        if (v11 != 0 && v18 && [v160 count])
        {
          v152 = [(IDSPeerIDManager_OLD *)self _peerIDKeysForService:v11 andFromURI:v10];
          if ((unint64_t)[v152 count] >= 0x259)
          {
            long long v254 = 0u;
            long long v253 = 0u;
            long long v252 = 0u;
            long long v251 = 0u;
            id v19 = v152;
            id v20 = [v19 countByEnumeratingWithState:&v251 objects:v276 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v252;
              do
              {
                for (i = 0; i != v20; i = (char *)i + 1)
                {
                  if (*(void *)v252 != v21) {
                    objc_enumerationMutation(v19);
                  }
                  [v179 removeObjectForKey:*(void *)(*((void *)&v251 + 1) + 8 * i)];
                }
                id v20 = [v19 countByEnumeratingWithState:&v251 objects:v276 count:16];
              }
              while (v20);
            }
          }
          v168 = [v161 _stringForKey:@"anonymized-sender-id"];
          id v23 = [v161 _numberForKey:@"biz-trusted"];
          unsigned __int8 v167 = [v23 BOOLValue];

          v148 = [v161 objectForKey:@"kt-blob"];
          v151 = [v161 objectForKey:@"kt-status"];
          v175 = [v161 objectForKey:@"kt-account-key"];
          v150 = [v161 objectForKey:@"kt-opt-in"];
          unsigned int v24 = [v150 BOOLValue];
          if (v151)
          {
            v25 = +[IDSFoundationLog KeyTransparency];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413314;
              uint64_t v267 = (uint64_t)v11;
              __int16 v268 = 2112;
              id v269 = v14;
              __int16 v270 = 2112;
              id v271 = v175;
              __int16 v272 = 2112;
              v273 = v151;
              __int16 v274 = 2112;
              v275 = v148;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }", buf, 0x34u);
            }
          }
          if (v14)
          {
            if (!v175)
            {
              v26 = [v14 prefixedURI];
              id v27 = [v26 _md5Hash];
              v175 = [v27 dataUsingEncoding:4];

              v28 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v267 = (uint64_t)v175;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification failures -- using URI hash instead { KTAccountKey: %@ }", buf, 0xCu);
              }
            }
            v149 = [[IDSKeyTransparencyIndex alloc] initWithServiceIdentifier:v11 accountKey:v175 URI:v14];
          }
          else
          {
            v149 = 0;
          }
          id v173 = objc_alloc_init((Class)NSMutableArray);
          id v180 = objc_alloc_init((Class)NSMutableArray);
          long long v250 = 0u;
          long long v249 = 0u;
          long long v248 = 0u;
          long long v247 = 0u;
          id v172 = v160;
          id v187 = [v172 countByEnumeratingWithState:&v247 objects:v265 count:16];
          uint64_t v146 = v24;
          if (v187)
          {
            char v199 = 0;
            uint64_t v185 = *(void *)v248;
            CFStringRef v29 = @"NO";
            if (v24) {
              CFStringRef v29 = @"YES";
            }
            CFStringRef v174 = v29;
            do
            {
              uint64_t v30 = 0;
              do
              {
                if (*(void *)v248 != v185)
                {
                  uint64_t v31 = v30;
                  objc_enumerationMutation(v172);
                  uint64_t v30 = v31;
                }
                uint64_t v193 = v30;
                v32 = *(void **)(*((void *)&v247 + 1) + 8 * v30);
                v216 = objc_msgSend(v32, "_dataForKey:", @"push-token", v139, v142, v143, v144);
                v205 = [v32 _dataForKey:@"session-token"];
                v33 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                v219 = [v32 _dictionaryForKey:@"client-data"];
                id v214 = [v32 _stringForKey:@"device-name"];
                v207 = [v32 _dictionaryForKey:@"private-device-data"];
                id v201 = 0;
                if (v214 && v207) {
                  id v201 = [objc_alloc((Class)IDSFamilyEndpointData) initWithDeviceName:v214 privateDeviceData:v207];
                }
                v210 = [v32 _dataForKey:@"kt-loggable-data"];
                v204 = [v219 _dataForKey:@"device-key-signature"];
                v34 = [v32 _numberForKey:@"kt-mismatch-account-flag"];
                unsigned int v194 = [v34 BOOLValue];

                v35 = [v32 _numberForKey:@"ktbility"];
                unsigned int v198 = [v35 BOOLValue];

                v212 = [v219 _stringForKey:v184];
                v208 = [v219 _numberForKey:v183];
                v36 = [v219 _numberForKey:v182];
                v206 = v36;
                if (v36)
                {
                  [v36 doubleValue];
                  +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
                  id v203 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v203 = 0;
                }
                v37 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v267 = (uint64_t)v212;
                  __int16 v268 = 2112;
                  id v269 = v208;
                  __int16 v270 = 2112;
                  id v271 = v203;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@", buf, 0x20u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  id v142 = v208;
                  id v143 = v203;
                  v140 = v212;
                  _IDSLogV();
                }
                if (v212 || v208 || v206) {
                  id v195 = [objc_alloc((Class)IDSGameCenterData) initWithAssociationID:v212 sharingState:v208 lastUpdatedDate:v203];
                }
                else {
                  id v195 = 0;
                }
                if (v216)
                {
                  v38 = [[IDSKeyTransparencyEntry alloc] initWithPushToken:v216 loggableData:v210 signedData:v204];
                  [(IDSKeyTransparencyEntry *)v38 setKtCapable:v198];
                  [v173 addObject:v38];
                }
                v202 = objc_msgSend(v219, "_dataForKey:", v189, v140);
                v39 = [v219 _numberForKey:v181];
                unsigned int v40 = [v39 intValue];

                v41 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = IDSLoggableDescriptionForTokenOnService();
                  v43 = [v42 debugDescription];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v43;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "              device pushToken: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v44 = IDSLoggableDescriptionForTokenOnService();
                  v139 = [v44 debugDescription];
                  _IDSLogV();
                }
                v45 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  id v46 = [v205 debugDescription];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "                 session token: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = [v205 debugDescription];
                  _IDSLogV();
                }
                v47 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v14;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "                           uri: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = v14;
                  _IDSLogV();
                }
                v48 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = [v192 senderCorrelationIdentifier];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v49;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, " sender-correlation-identifier: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = [v192 senderCorrelationIdentifier];
                  _IDSLogV();
                }
                v50 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                {
                  v51 = [v192 shortHandle];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v51;
                  _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "                  short-handle: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = [v192 shortHandle];
                  _IDSLogV();
                }
                v52 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                {
                  id v53 = +[IDSLogFormatter descriptionForDictionary:v219 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v53;
                  _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "                    clientData: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = +[IDSLogFormatter descriptionForDictionary:v219 options:1];
                  _IDSLogV();
                }
                v54 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v214;
                  _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "                   device-name: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = v214;
                  _IDSLogV();
                }
                v55 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  id v56 = +[IDSLogFormatter descriptionForDictionary:v207 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v56;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "           private-device-data: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = +[IDSLogFormatter descriptionForDictionary:v207 options:1];
                  _IDSLogV();
                }
                v57 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  id v58 = +[IDSLogFormatter descriptionForData:v210 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v58;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "              kt-loggable-data: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = +[IDSLogFormatter descriptionForData:v210 options:1];
                  _IDSLogV();
                }
                v59 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  id v60 = +[IDSLogFormatter descriptionForData:v175 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v60;
                  _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "                kt-account-key: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = +[IDSLogFormatter descriptionForData:v175 options:1];
                  _IDSLogV();
                }
                v61 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v174;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "                     kt-opt-in: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = (void *)v174;
                  _IDSLogV();
                }
                v62 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                {
                  id v63 = +[IDSLogFormatter descriptionForData:v204 options:1];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v63;
                  _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "          device-key-signature: %@", buf, 0xCu);
                }
                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = +[IDSLogFormatter descriptionForData:v204 options:1];
                  _IDSLogV();
                }
                v64 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v65 = @"NO";
                  if (v194) {
                    CFStringRef v65 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v65;
                  _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "      kt-mismatch-account-flag: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v66 = @"NO";
                  if (v194) {
                    CFStringRef v66 = @"YES";
                  }
                  v139 = (void *)v66;
                  _IDSLogV();
                }
                v67 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v68 = @"NO";
                  if (v198) {
                    CFStringRef v68 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v68;
                  _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "               kt-capable-flag: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v69 = @"NO";
                  if (v198) {
                    CFStringRef v69 = @"YES";
                  }
                  v139 = (void *)v69;
                  _IDSLogV();
                }
                v70 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v71 = @"NO";
                  if (v40) {
                    CFStringRef v71 = @"YES";
                  }
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v71;
                  _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "                    showErrors: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  CFStringRef v72 = @"NO";
                  if (v40) {
                    CFStringRef v72 = @"YES";
                  }
                  v139 = (void *)v72;
                  _IDSLogV();
                }
                if (v202) {
                  goto LABEL_162;
                }
                v73 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v267 = (uint64_t)v216;
                  _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "   No known public key found for token: %@", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  v139 = v216;
                  _IDSLogV();
                }
                if (!objc_msgSend(v11, "isEqualToIgnoringCase:", @"com.apple.madrid", v139))
                {
LABEL_162:
                  if (v216)
                  {
                    uint64_t v75 = IMGetDomainIntForKey();
                    uint64_t v76 = IMGetDomainIntForKey();
                    v196 = [v32 _numberForKey:@"session-token-refresh-seconds"];
                    v197 = [v32 _numberForKey:@"session-token-expires-seconds"];
                    if (v75)
                    {
                      v77 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v267 = v75;
                        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "                    Overwriting soft TTL with: %ld seconds", buf, 0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                      {
                        v139 = (void *)v75;
                        _IDSLogV();
                      }
                      uint64_t v78 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v75, v139);

                      v196 = (void *)v78;
                    }
                    if (v76)
                    {
                      v79 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134217984;
                        uint64_t v267 = v76;
                        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "                    Overwriting hard TTL with: %ld seconds", buf, 0xCu);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                      {
                        v139 = (void *)v76;
                        _IDSLogV();
                      }
                      uint64_t v80 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v76, v139);

                      v197 = (void *)v80;
                    }
                    objc_msgSend(v196, "doubleValue", v139);
                    v191 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                    [v197 doubleValue];
                    v190 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                    v81 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138413058;
                      uint64_t v267 = (uint64_t)v11;
                      __int16 v268 = 2112;
                      id v269 = v14;
                      __int16 v270 = 2112;
                      id v271 = v191;
                      __int16 v272 = 2112;
                      v273 = v190;
                      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,", buf, 0x2Au);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                    {
                      id v143 = v191;
                      v144 = v190;
                      v139 = v11;
                      id v142 = v14;
                      _IDSLogV();
                    }
                    if (v205 && v197 && v196)
                    {
                      if ([v10 isEqualToURI:v14]) {
                        [(IDSPeerIDManager_OLD *)self _setDisasterModeToken:v205 forURI:v10];
                      }
                      v82 = +[IDSEndpointCapabilities allowedCapabilities];
                      v264[0] = v189;
                      v264[1] = v166;
                      v264[2] = v165;
                      v264[3] = v171;
                      v264[4] = v164;
                      v264[5] = v169;
                      v83 = +[NSArray arrayWithObjects:v264 count:6];
                      v84 = [v82 arrayByAddingObjectsFromArray:v83];

                      id v85 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v84, "count"));
                      long long v246 = 0u;
                      long long v245 = 0u;
                      long long v244 = 0u;
                      long long v243 = 0u;
                      id v86 = v84;
                      id v87 = [v86 countByEnumeratingWithState:&v243 objects:v263 count:16];
                      if (v87)
                      {
                        uint64_t v88 = *(void *)v244;
                        do
                        {
                          for (j = 0; j != v87; j = (char *)j + 1)
                          {
                            if (*(void *)v244 != v88) {
                              objc_enumerationMutation(v86);
                            }
                            uint64_t v90 = *(void *)(*((void *)&v243 + 1) + 8 * (void)j);
                            v91 = [v219 objectForKey:v90];
                            if (v91) {
                              [v85 setObject:v91 forKey:v90];
                            }
                          }
                          id v87 = [v86 countByEnumeratingWithState:&v243 objects:v263 count:16];
                        }
                        while (v87);
                      }

                      v92 = +[NSDate date];
                      [v92 timeIntervalSince1970];
                      double v94 = v93;

                      v178 = [v85 _dataForKey:v189];
                      v177 = [v85 _dataForKey:v171];
                      v95 = +[IDSDServiceController sharedInstance];
                      v200 = [v95 serviceWithIdentifier:v11];

                      if (!v210)
                      {
                        v210 = [v85 _dataForKey:v169];
                      }
                      v186 = [[IDSProtoKeyTransparencyLoggableData alloc] initWithData:v210];
                      v176 = [(IDSProtoKeyTransparencyLoggableData *)v186 ngmPublicIdentity];
                      if ([v200 applicationKeyIndex]
                        && [(IDSProtoKeyTransparencyLoggableData *)v186 applicationPublicIdentitysCount])
                      {
                        long long v242 = 0u;
                        long long v241 = 0u;
                        long long v240 = 0u;
                        long long v239 = 0u;
                        id v188 = [(IDSProtoKeyTransparencyLoggableData *)v186 applicationPublicIdentitys];
                        id v96 = [v188 countByEnumeratingWithState:&v239 objects:v262 count:16];
                        if (v96)
                        {
                          uint64_t v97 = *(void *)v240;
                          while (2)
                          {
                            for (k = 0; k != v96; k = (char *)k + 1)
                            {
                              if (*(void *)v240 != v97) {
                                objc_enumerationMutation(v188);
                              }
                              v99 = *(void **)(*((void *)&v239 + 1) + 8 * (void)k);
                              unsigned int v100 = [v99 keyIndex];
                              if (v100 == sub_10030C080((int)[v200 applicationKeyIndex]))
                              {
                                id v96 = [v99 publicIdentity];
                                goto LABEL_216;
                              }
                            }
                            id v96 = [v188 countByEnumeratingWithState:&v239 objects:v262 count:16];
                            if (v96) {
                              continue;
                            }
                            break;
                          }
                        }
LABEL_216:
                      }
                      else
                      {
                        id v96 = 0;
                      }
                      LOBYTE(v145) = v167;
                      LOBYTE(v141) = v198;
                      id v102 = objc_msgSend(objc_alloc((Class)IDSEndpoint), "initWithURI:serviceIdentifier:clientData:KTLoggableData:KTDeviceSignature:mismatchedAccountFlag:ktCapableFlag:pushToken:sessionToken:expireDate:refreshDate:anonymizedSenderID:verifiedBusiness:serializedPublicMessageProtectionIdentity:queryTimeInterval:serializedNGMDeviceIdentity:serializedNGMDevicePrekey:serializedApplicationPublicKey:endpointURIProperties:familyEndpointData:gameCenterData:", v14, v11, v85, v210, v204, v194, v94, v141, v216, v205, v190, v191, v168,
                               v145,
                               v178,
                               v176,
                               v177,
                               v96,
                               v192,
                               v201,
                               v195);
                      [v180 addObject:v102];

                      char v199 = 1;
                    }
                  }
                  else
                  {
                    v101 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "   No known push token found, ignoring", buf, 2u);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                      _IDSLogV();
                    }
                  }
                }
                else
                {
                  v74 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v267 = (uint64_t)v216;
                    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "   No known iMessage public key found for token, skipping this identity: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled())
                  {
                    _IDSWarnV();
                    _IDSLogV();
                    v139 = v216;
                    _IDSLogTransport();
                  }
                }

                uint64_t v30 = v193 + 1;
              }
              while ((id)(v193 + 1) != v187);
              id v187 = [v172 countByEnumeratingWithState:&v247 objects:v265 count:16];
            }
            while (v187);
          }
          else
          {
            char v199 = 0;
          }

          id v103 = objc_alloc((Class)KTVerifierResult);
          v104 = +[IDSKeyTransparencyVerifier keyTransparencyURIPrefixForServiceIdentifier:v11];
          v105 = [v14 prefixedURI];
          v106 = [v104 stringByAppendingString:v105];
          v107 = +[IDSKeyTransparencyVerifier keyTransparencyApplicationForServiceIdentifier:v11];
          id v213 = [v103 initPendingForUri:v106 application:v107];

          id v108 = objc_alloc((Class)IDSQueryKeyTransparencyContext);
          v109 = [(IDSKeyTransparencyIndex *)v149 accountKey];
          id v211 = [v108 initWithVerifierResult:v213 ticket:0 accountKey:v109 queryResponseTime:v147 ktOptIn:v146];

          v209 = +[IDSPeerIDValue peerIDValueWithEndpoints:v180 keyTransparencyContext:v211];
          [v179 setObject:v209 forKey:v158];
          long long v238 = 0u;
          long long v236 = 0u;
          long long v237 = 0u;
          long long v235 = 0u;
          id v215 = [(NSMutableDictionary *)self->_clientDataUpdateBlocks allValues];
          id v220 = [v215 countByEnumeratingWithState:&v235 objects:v261 count:16];
          if (v220)
          {
            uint64_t v217 = *(void *)v236;
            do
            {
              for (m = 0; m != v220; m = (char *)m + 1)
              {
                if (*(void *)v236 != v217) {
                  objc_enumerationMutation(v215);
                }
                uint64_t v111 = *(void *)(*((void *)&v235 + 1) + 8 * (void)m);
                long long v231 = 0u;
                long long v232 = 0u;
                long long v233 = 0u;
                long long v234 = 0u;
                id v112 = v180;
                id v113 = [v112 countByEnumeratingWithState:&v231 objects:v260 count:16];
                if (v113)
                {
                  uint64_t v114 = *(void *)v232;
                  do
                  {
                    for (n = 0; n != v113; n = (char *)n + 1)
                    {
                      if (*(void *)v232 != v114) {
                        objc_enumerationMutation(v112);
                      }
                      (*(void (**)(uint64_t, id, void *, id, void))(v111 + 16))(v111, v11, v14, v10, *(void *)(*((void *)&v231 + 1) + 8 * (void)n));
                    }
                    id v113 = [v112 countByEnumeratingWithState:&v231 objects:v260 count:16];
                  }
                  while (v113);
                }
              }
              id v220 = [v215 countByEnumeratingWithState:&v235 objects:v261 count:16];
            }
            while (v220);
          }

          if ((v199 & 1) == 0) {
            [(IDSPeerIDManager_OLD *)self forgetPeerTokensForURI:v14 fromURI:v10 service:v11];
          }
          v116 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v199 & 1, v139);
          [v155 setObject:v116 forKeyedSubscript:v14];

          id v117 = [v180 copy];
          [v163 setObject:v117 forKeyedSubscript:v14];
        }
        else
        {
          [(IDSPeerIDManager_OLD *)self forgetPeerTokensForURI:v14 fromURI:v10 service:v11];
          [v155 setObject:&__kCFBooleanFalse forKeyedSubscript:v14];
          [v163 setObject:&__NSArray0__struct forKeyedSubscript:v14];
        }

        uint64_t v12 = v157 + 1;
      }
      while ((id)(v157 + 1) != v156);
      id v118 = [obj countByEnumeratingWithState:&v255 objects:v277 count:16];
      id v156 = v118;
    }
    while (v118);
  }

  v218 = [(IDSPeerIDManager_OLD *)self _peerIDKeysForService:v11];
  id v119 = [v218 count];
  if (v119 > (id)[(IDSPeerIDManager_OLD *)self excessiveQueryCacheEntriesThreshold])
  {
    v120 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      id v121 = [v218 count];
      *(_DWORD *)buf = 138412546;
      uint64_t v267 = (uint64_t)v11;
      __int16 v268 = 2048;
      id v269 = v121;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Excessive query cache entries detected for service: %@ {current count: %ld}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v139 = v11;
      id v142 = [v218 count];
      _IDSLogV();
    }
    reportedExcessiveQueryCacheEntries = self->_reportedExcessiveQueryCacheEntries;
    if (!reportedExcessiveQueryCacheEntries)
    {
      v123 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v124 = self->_reportedExcessiveQueryCacheEntries;
      self->_reportedExcessiveQueryCacheEntries = v123;

      reportedExcessiveQueryCacheEntries = self->_reportedExcessiveQueryCacheEntries;
    }
    if ((-[NSMutableSet containsObject:](reportedExcessiveQueryCacheEntries, "containsObject:", v11, v139, v142) & 1) == 0)
    {
      [(NSMutableSet *)self->_reportedExcessiveQueryCacheEntries addObject:v11];
      if (+[IDSAutoBugCapture isSupported])
      {
        v125 = +[NSString stringWithFormat:@"(%@)", v11];
        v229[0] = _NSConcreteStackBlock;
        v229[1] = 3221225472;
        v229[2] = sub_100312894;
        v229[3] = &unk_100980830;
        id v230 = v11;
        +[IDSAutoBugCapture triggerCaptureWithEvent:211 context:v125 completion:v229];
      }
    }
  }
  v126 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "Remote query finished - kicking KT peer verification", buf, 2u);
  }

  v127 = [(IDSPeerIDManager_OLD *)self keyTransparencyVerifier];
  [v127 kickPeerVerificationForURIs:obj service:v11 localURI:v10 fetchNow:0 withCompletion:&stru_100988C10];

  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  v128 = [(NSMutableDictionary *)self->_endpointQueryListeners allValues];
  id v129 = [v128 countByEnumeratingWithState:&v225 objects:v259 count:16];
  if (v129)
  {
    uint64_t v130 = *(void *)v226;
    do
    {
      for (ii = 0; ii != v129; ii = (char *)ii + 1)
      {
        if (*(void *)v226 != v130) {
          objc_enumerationMutation(v128);
        }
        v132 = *(void **)(*((void *)&v225 + 1) + 8 * (void)ii);
        v133 = [v132 queryCompletionBlock];
        if (v133)
        {
          v134 = [v132 queue];
          BOOL v135 = v134 == 0;

          if (!v135)
          {
            v136 = [v132 queue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100312A94;
            block[3] = &unk_10097E5A8;
            block[4] = v132;
            id v222 = v11;
            id v223 = v10;
            id v224 = v163;
            dispatch_async(v136, block);
          }
        }
      }
      id v129 = [v128 countByEnumeratingWithState:&v225 objects:v259 count:16];
    }
    while (v129);
  }

  [(IDSPeerIDManager_OLD *)self performCleanupTasks];
  id v137 = [v155 copy];

  return v137;
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  LOBYTE(v9) = 1;
  return [(IDSPeerIDManager_OLD *)self sessionTokensForURIs:a3 fromURI:a4 service:a5 fromIdentity:a6 includeSelfDevice:a7 fullyRemoveSelfDevice:a8 allowRefresh:v9];
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
  CFStringRef v71 = self;
  CFStringRef v72 = v16;
  CFStringRef v68 = v15;
  CFStringRef v69 = v17;
  v70 = v18;
  [(IDSPeerIDManager_OLD *)self endpointsForURIs:v15 fromURI:v16 service:v17 fromIdentity:v18 filterBehavior:v20 allowRefresh:a9];
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
        v77 = objc_msgSend(obj, "objectForKeyedSubscript:");
        if (+[IDSPeerIDManager_OLD shouldUseSelfTokens])
        {
          uint64_t v21 = [(IDSPeerIDManager_OLD *)v71 _disasterModeTokenForURI:v72];
          BOOL v22 = v21 != 0;
          if (v21)
          {
            id v23 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v95 = v72;
              __int16 v96 = 2112;
              uint64_t v97 = v21;
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
        uint64_t v80 = objc_msgSend(v76, "objectForKeyedSubscript:", v78, v66, v67);
        unsigned int v24 = [v80 objectForKeyedSubscript:@"dates-expire"];
        id v25 = [v24 mutableCopy];
        v26 = v25;
        if (v25)
        {
          id v82 = v25;
        }
        else
        {
          id v82 = +[NSMutableArray array];
        }

        id v27 = [v80 objectForKeyedSubscript:@"dates-refresh"];
        id v28 = [v27 mutableCopy];
        CFStringRef v29 = v28;
        if (v28)
        {
          id v30 = v28;
        }
        else
        {
          id v30 = +[NSMutableArray array];
        }
        uint64_t v31 = v30;

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

        v37 = [v80 objectForKeyedSubscript:@"session-tokens"];
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
                v50 = [v49 refreshDate];
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
                  v55 = [v49 anonymizedSenderID];
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
        uint64_t v21 = [v19 tokenFreeURI];
        uint64_t v53 = [v19 pushToken];
        [v47 addObject:v21];
        BOOL v22 = [v15 objectForKeyedSubscript:v21];
        id v23 = [v22 mutableCopy];
        unsigned int v24 = v23;
        if (v23) {
          id v25 = v23;
        }
        else {
          id v25 = objc_alloc_init((Class)NSMutableArray);
        }
        v52 = v25;

        v26 = [(IDSPeerIDManager_OLD *)self _endpointsForService:v48 fromURI:v50 toURI:v21 ignoreExpiration:0];
        if (a7 == 1 || a7 == 2 && [v21 isEqualToURI:v50])
        {
          id v27 = [(IDSPeerIDPushHandler *)self->_pushHandler pushToken];
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_10031371C;
          v60[3] = &unk_10097E5D0;
          id v61 = v27;
          id v28 = v27;
          uint64_t v29 = objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v60);

          v26 = (void *)v29;
        }
        if (v53)
        {
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_100313764;
          v58[3] = &unk_10097E5D0;
          id v59 = v53;
          uint64_t v30 = objc_msgSend(v26, "__imArrayByFilteringWithBlock:", v58);

          v26 = (void *)v30;
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
              v37 = objc_opt_class();
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
      [(IDSPeerIDManager_OLD *)self startQueryForURIs:v47 fromIdentity:v43 fromURI:v50 fromService:v48 forSending:0 forRefresh:1 isForced:v41 reason:@"EndpointForURI" completionBlock:0];
    }
  }
  else
  {
  }

  return v15;
}

- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v6 = [(IDSPeerIDManager_OLD *)self publicKeyForURI:a3 pushToken:a4 fromURI:a5 service:a6];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = [(IDSPeerIDManager_OLD *)self _endpointsForService:a6 fromURI:a5 toURI:a3 ignoreExpiration:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100313920;
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
  int v5 = [(IDSPeerIDManager_OLD *)self pleaseDontCopyCacheDictionaryRepresentation];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = [v5 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    v26 = v6;
    id v27 = v5;
    uint64_t v24 = *(void *)v33;
    do
    {
      id v10 = 0;
      id v25 = v8;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v10);
        if (objc_msgSend(v11, "hasMatchingURIs", v24))
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v12 = [v5 objectForKey:v11];
          id v13 = [v12 endpoints];

          id v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v29;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v29 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                uint64_t v19 = [v18 pushToken];
                uint64_t v20 = [v4 rawToken];
                unsigned __int8 v21 = [v20 isEqualToData:v19];

                if (v21)
                {
                  BOOL v22 = [v18 publicDeviceIdentityContainer];

                  id v6 = v26;
                  int v5 = v27;
                  goto LABEL_21;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          id v6 = v26;
          int v5 = v27;
          uint64_t v9 = v24;
          id v8 = v25;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
      BOOL v22 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_21:

  return v22;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  int v5 = [(IDSPeerIDManager_OLD *)self _endpointsForService:a5 fromURI:a4 toURI:a3 ignoreExpiration:1];
  id v6 = [v5 firstObject];

  id v7 = [v6 senderCorrelationIdentifier];

  return v7;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a4;
  id v11 = [(IDSPeerIDManager_OLD *)self _endpointsForService:a6 fromURI:a5 toURI:a3 ignoreExpiration:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100313D44;
  v17[3] = &unk_10097E5D0;
  id v18 = v10;
  id v12 = v10;
  id v13 = objc_msgSend(v11, "__imArrayByFilteringWithBlock:", v17);
  id v14 = [v13 firstObject];

  id v15 = [v14 senderCorrelationIdentifier];

  return v15;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  id v4 = [(IDSPeerIDManager_OLD *)self _endpointsForService:IDSServiceNameiMessage fromURI:a4 toURI:a3 ignoreExpiration:1];
  int v5 = [v4 firstObject];

  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v5 shortHandle];
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = [v5 shortHandle];

  if (v7)
  {
    id v6 = [v5 shortHandle];
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }
LABEL_6:

  return v6;
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
  unsigned __int8 v21 = [(IDSPeerIDManager_OLD *)self sessionTokensForURIs:v20 fromURI:v18 service:v17 fromIdentity:v16 includeSelfDevice:a10 fullyRemoveSelfDevice:0];

  uint64_t v22 = objc_opt_class();
  id v23 = v15;
  id v38 = v21;
  uint64_t v24 = [v21 objectForKey:v23];
  if (objc_opt_isKindOfClass())
  {
    id v25 = v24;
  }
  else
  {
    if (v24)
    {
      v26 = +[IMRGLog registration];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_10071EC74((uint64_t)v23, v22, v26);
      }
    }
    id v25 = 0;
  }

  id v27 = [v25 _arrayForKey:@"session-tokens"];
  long long v28 = [v25 _arrayForKey:@"push-tokens"];
  long long v29 = [v25 _arrayForKey:@"dates-refresh"];
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
      id v15 = [(IDSPeerIDManager_OLD *)self _endpointsForService:v12 fromURI:v11 toURI:v10 ignoreExpiration:1];
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
              unsigned __int8 v21 = [*(id *)(*((void *)&v29 + 1) + 8 * i) expireDate];
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
    [(IDSPeerIDManager_OLD *)self _endpointsForService:v16 fromURI:v15 toURI:v13 ignoreExpiration:0];
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
          unsigned __int8 v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
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
  return [(IDSPeerIDManager_OLD *)self _valueOfProperty:a3 forURI:a4 pushToken:a5 fromURI:a6 service:a7] > 0;
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  return [(IDSPeerIDManager_OLD *)self hasProperty:IDSRegistrationPropertyShowPeerErrors forURI:a3 pushToken:a4 fromURI:a5 service:a6];
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  if (v10 && v9 && v11)
  {
    uint64_t v12 = [(IDSPeerIDManager_OLD *)self endpointsForURIs:v8 service:v9 fromURI:v10 ignoringTTL:0];
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
    id v16 = [(IDSPeerIDManager_OLD *)self endpointsForURIs:v15 service:v12 fromURI:v14];
    id v17 = [v16 objectForKey:v11];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100314B24;
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
        uint64_t v19 = [(IDSPeerIDManager_OLD *)self _endpointsForService:v11 fromURI:v12 toURI:v18 ignoreExpiration:v6];
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
        id v18 = [(IDSPeerIDManager_OLD *)self _endpointsForService:v23 fromURI:v11 toURI:v17 ignoreExpiration:0];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100314F00;
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
  long long v54 = [(IDSPeerIDManager_OLD *)self endpointsForURIs:v12 service:v13 fromURI:v46 ignoringTTL:1];
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
          uint64_t v19 = [(IDSPeerIDManager_OLD *)self verifierResultsForURIs:obj service:v47 fromURI:v46];
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
              id v25 = [(IDSPeerIDManager_OLD *)self lightDescriptionForVerifierResult:v24];
              *(_DWORD *)buf = 138412546;
              v67 = v16;
              __int16 v68 = 2112;
              CFStringRef v69 = v25;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "URI %@ found a KTVerifierResult %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v26 = [v19 objectForKey:v16];
              [(IDSPeerIDManager_OLD *)self lightDescriptionForVerifierResult:v26];
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
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 staticAccountKeyStatus]);
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
  id v10 = a3;
  id v26 = a4;
  id v27 = a5;
  long long v29 = +[IDSPeerIDKey peerIDKeyWithService:fromURI:toURI:](IDSPeerIDKey, "peerIDKeyWithService:fromURI:toURI:", v10, v26);
  id v11 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v10];
  long long v28 = [v11 objectForKey:v29];

  id v12 = [v28 endpoints];
  id v13 = v12;
  if (!a6)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v19 = objc_opt_class();
          id v20 = [v18 expireDate];
          LODWORD(v19) = [v19 _datePassed:v20];

          if (v19)
          {
            long long v22 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              id v23 = [v18 URI];
              *(_DWORD *)buf = 138412290;
              long long v35 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "** At least one session token expired for: %@, need to get new ones", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v25 = [v18 URI];
              _IDSLogV();
            }
            id v21 = 0;
            goto LABEL_18;
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  id v21 = v13;
LABEL_18:

  return v21;
}

- (id)_peerIDKeysForService:(id)a3 andFromURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v6];
  id v9 = [v8 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100315C50;
  v14[3] = &unk_10097E5F8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = objc_msgSend(v9, "__imArrayByFilteringWithBlock:", v14);

  return v12;
}

- (id)_peerIDKeysForService:(id)a3
{
  id v4 = a3;
  int v5 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v4];
  id v6 = [v5 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100315DB0;
  v10[3] = &unk_10097E620;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "__imArrayByFilteringWithBlock:", v10);

  return v8;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v10 = [(IDSKeyTransparencyVerifier *)self->_keyTransparencyVerifier accountController];
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
        id v20 = objc_msgSend(v19, "__imArrayByApplyingBlock:", &stru_100988C30);

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
              long long v30 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * (void)k), "tokenFreeURI", v33);
              long long v31 = [(IDSPeerIDManager_OLD *)self _keyTransparencyVerifierResultForService:v9 fromURI:v30 toURI:v24];

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
  int v5 = [(IDSPeerIDManager_OLD *)self keyTransparencyContextForService:a3 fromURI:a4 toURI:a5];
  id v6 = [v5 verifierResult];

  return v6;
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  id v8 = a3;
  id v9 = +[IDSPeerIDKey peerIDKeyWithService:v8 fromURI:a4 toURI:a5];
  id v10 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v8];

  id v11 = [v10 objectForKey:v9];

  id v12 = [v11 keyTransparencyContext];

  return v12;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v69 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating query cache with KT peer verification results { count: %lu }", buf, 0xCu);
  }

  id v49 = objc_alloc_init((Class)NSMutableArray);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v44 = v3;
  id obj = [v3 allKeys];
  id v50 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v50)
  {
    uint64_t v45 = *(void *)v65;
    do
    {
      for (i = 0; i != v50; i = (char *)i + 1)
      {
        if (*(void *)v65 != v45) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v7 = [(IDSPeerIDManager_OLD *)self pleaseDontCopyCacheDictionaryRepresentation];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v8 = [v7 allKeys];
        id v9 = [v8 countByEnumeratingWithState:&v60 objects:v74 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v61;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v61 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
              id v14 = [v13 toURI];
              unsigned int v15 = [v6 isEqualToURI:v14];

              if (v15) {
                [v49 addObject:v13];
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v60 objects:v74 count:16];
          }
          while (v10);
        }
      }
      id v50 = [obj countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v50);
  }

  if ([v49 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v39 = [(IDSPeerIDManager_OLD *)self persistentMaps];
    uint64_t v16 = v44;
    id v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
    char v17 = 0;
    if (v41)
    {
      uint64_t v40 = *(void *)v57;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v57 != v40) {
            objc_enumerationMutation(v39);
          }
          uint64_t v42 = v18;
          uint64_t v19 = *(void **)(*((void *)&v56 + 1) + 8 * v18);
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v48 = v49;
          id v51 = [v48 countByEnumeratingWithState:&v52 objects:v72 count:16];
          if (v51)
          {
            uint64_t v20 = *(void *)v53;
            uint64_t v46 = *(void *)v53;
            do
            {
              for (k = 0; k != v51; k = (char *)k + 1)
              {
                if (*(void *)v53 != v20) {
                  objc_enumerationMutation(v48);
                }
                long long v22 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
                id v23 = [v19 objectForKeyedSubscript:v22];
                long long v24 = [v23 keyTransparencyContext];

                id v25 = [v24 verifierResult];
                id v26 = [v22 toURI];
                id v27 = [v16 objectForKeyedSubscript:v26];

                if (([v25 isEqual:v27] & 1) == 0)
                {
                  uint64_t v28 = +[IDSFoundationLog KeyTransparency];
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v29 = [v22 toURI];
                    *(_DWORD *)buf = 138412546;
                    id v69 = v29;
                    __int16 v70 = 2112;
                    CFStringRef v71 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "URI: %@ has a new KTVerifierResult: %@", buf, 0x16u);
                  }
                  id v30 = objc_alloc((Class)IDSQueryKeyTransparencyContext);
                  long long v31 = [v24 accountKey];
                  long long v32 = [v24 queryResponseTime];
                  id v33 = objc_msgSend(v30, "initWithVerifierResult:ticket:accountKey:queryResponseTime:ktOptIn:", v27, 0, v31, v32, objc_msgSend(v24, "ktOptIn"));

                  id v34 = [v19 objectForKeyedSubscript:v22];
                  long long v35 = [v34 endpoints];
                  uint64_t v36 = +[IDSPeerIDValue peerIDValueWithEndpoints:v35 keyTransparencyContext:v33];

                  [v19 setObject:v36 forKey:v22];
                  char v17 = 1;
                  uint64_t v16 = v44;
                  uint64_t v20 = v46;
                }
              }
              id v51 = [v48 countByEnumeratingWithState:&v52 objects:v72 count:16];
            }
            while (v51);
          }

          uint64_t v18 = v42 + 1;
        }
        while ((id)(v42 + 1) != v41);
        id v41 = [v39 countByEnumeratingWithState:&v56 objects:v73 count:16];
      }
      while (v41);
    }

    uint64_t v37 = +[TransparencyAnalytics logger];
    id v38 = +[NSNumber numberWithBool:v17 & 1];
    [v37 logMetric:v38 withName:@"IDSKTPeerVerificationResultsChanged"];
  }
  else
  {
    uint64_t v37 = +[IDSFoundationLog KeyTransparency];
    uint64_t v16 = v44;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Found no keys to update.", buf, 2u);
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
  LOBYTE(v12) = [(IDSPeerIDManager_OLD *)self startQueryForURIs:v22 fromIdentity:v21 fromURI:v20 fromService:v19 context:v23 reason:v18 completionBlock:v17];

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
  id v19 = objc_msgSend(v18, "__imSetByApplyingBlock:", &stru_100988C50);
  id v20 = [v19 allObjects];
  id v21 = [(IDSPeerIDManager_OLD *)self endpointsForURIs:v20 service:v16 fromURI:v15];

  id v22 = [(IDSPeerIDManager_OLD *)self queryHandler];
  id v23 = [v18 allObjects];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100316CD0;
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
      [(IDSPeerIDManager_OLD *)self _endpointsForService:v12 fromURI:v11 toURI:v10 ignoreExpiration:0];
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
        if (!+[IDSPeerIDManager_OLD shouldUseSelfTokens])
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

          [(IDSPeerIDManager_OLD *)self forgetSessionTokensForURI:v10 fromURI:v11 service:v12];
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
  BOOL v3 = a3;
  int v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing peer and personal caches", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(IDSPeerIDManager_OLD *)self persistentMaps];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 removeAllObjects];
        if (v3) {
          [v10 persistImmediately];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  BOOL v2 = [(IDSPeerIDManager_OLD *)self persistentMaps];
  if ([v2 count] == (id)1)
  {
    id v3 = [v2 firstObject];
    id v4 = [v3 copyDictionaryRepresentation];
  }
  else
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v2;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "copyDictionaryRepresentation", (void)v13);
          [v3 addEntriesFromDictionary:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v4 = [v3 copy];
  }
  long long v11 = v4;

  return v11;
}

- (void)forgetSessionTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens])
  {
    long long v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not forgetting tokens, we're in debilitated mode", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    long long v12 = [v8 prefixedURI];
    id v13 = [v12 length];

    if (v13)
    {
      long long v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v25 = v8;
        __int16 v26 = 2112;
        id v27 = v9;
        __int16 v28 = 2112;
        id v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Forgetting session tokens for URI: %@  from URI: %@  service: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v22 = v9;
        id v23 = v10;
        id v21 = v8;
        _IDSLogV();
      }
      long long v15 = objc_msgSend(v8, "prefixedURI", v21, v22, v23);
      long long v16 = objc_msgSend(v15, "_im_normalizedURIString");
      id v17 = [v16 trimmedString];
      id v18 = +[IDSURI URIWithPrefixedURI:v17 withServiceLoggingHint:v10];

      uint64_t v19 = +[IDSPeerIDKey peerIDKeyWithService:v10 fromURI:v9 toURI:v18];
      if (v19)
      {
        id v20 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v10];
        [v20 removeObjectForKey:v19];
      }
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(IDSPeerIDManager_OLD *)self forgetPeerTokensForURI:v8 fromURI:v9 service:*(void *)(*((void *)&v15 + 1) + 8 * (void)v14)];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v33 = a4;
  id v8 = a5;
  id v29 = v7;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens])
  {
    id v9 = OSLogHandleForIDSCategory();
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
    id v10 = [v7 prefixedURI];
    id v11 = [v10 length];

    if (v11)
    {
      id v12 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v45 = v7;
        __int16 v46 = 2112;
        id v47 = v33;
        __int16 v48 = 2112;
        id v49 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for URI: %@  from URI: %@  service: %@", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v27 = v33;
        id v28 = v8;
        id v26 = v7;
        _IDSLogV();
      }
      uint64_t v30 = [(IDSPeerIDPushHandler *)self->_pushHandler pushToken];
      uint64_t v13 = [v7 prefixedURI];
      long long v14 = objc_msgSend(v13, "_im_normalizedURIString");
      long long v15 = [v14 trimmedString];
      long long v16 = +[IDSURI URIWithPrefixedURI:v15 withServiceLoggingHint:v8];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = [(IDSPeerIDManager_OLD *)self _endpointsForService:v8 fromURI:v33 toURI:v7 ignoreExpiration:0];
      id v17 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v39;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(obj);
            }
            id v20 = [*(id *)(*((void *)&v38 + 1) + 8 * i) pushToken];
            if (![v16 isEqualToURI:v33]
              || ([v20 isEqualToData:v30] & 1) == 0)
            {
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v21 = [(NSMutableDictionary *)self->_purgeClientDataBlocks allValues];
              id v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v35;
                do
                {
                  for (j = 0; j != v22; j = (char *)j + 1)
                  {
                    if (*(void *)v35 != v23) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
                    if (v25) {
                      (*(void (**)(uint64_t, id))(v25 + 16))(v25, v8);
                    }
                  }
                  id v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
                }
                while (v22);
              }
            }
          }
          id v17 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v17);
      }

      [(IDSPeerIDManager_OLD *)self forgetSessionTokensForURI:v29 fromURI:v33 service:v8];
    }
  }
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  id v29 = v6;
  if (+[IDSPeerIDManager_OLD shouldUseSelfTokens])
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
      id v12 = +[IDSDServiceController sharedInstance];
      uint64_t v13 = [v12 serviceWithIdentifier:v30];
      long long v14 = [v11 accountsOnService:v13];

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
            id v21 = [v20 uris];
            id v22 = objc_msgSend(v21, "__imArrayByApplyingBlock:", &stru_100988C70);

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
            [(IDSPeerIDManager_OLD *)self forgetPeerTokensForURI:v29 fromURI:*(void *)(*((void *)&v31 + 1) + 8 * (void)j) service:v30];
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
  long long v36 = self;
  long long v33 = [(IDSPeerIDManager_OLD *)self persistentMapForService:v4];
  id v5 = [v33 allKeys];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100318B14;
  v49[3] = &unk_10097E620;
  id v28 = v4;
  id v50 = v28;
  id v6 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v49);

  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v28;
    __int16 v56 = 2112;
    long long v57 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Forgetting peer tokens for service {service: %@, keys: %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v26 = v28;
    id v27 = v6;
    _IDSLogV();
  }
  long long v34 = [(IDSPeerIDPushHandler *)self->_pushHandler pushToken];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  id v32 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v32)
  {
    uint64_t v29 = *(void *)v46;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v46 != v29)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v31 = v8;
        id v10 = *(void **)(*((void *)&v45 + 1) + 8 * v8);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v11 = [v33 objectForKey:v10];
        id v35 = [v11 endpoints];

        id v12 = [v35 countByEnumeratingWithState:&v41 objects:v52 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v42;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v35);
              }
              id v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              id v16 = [v10 toURI];
              id v17 = [v10 fromURI];
              if ([v16 isEqualToURI:v17])
              {
                uint64_t v18 = [v15 pushToken];
                unsigned __int8 v19 = [v18 isEqualToData:v34];

                if (v19) {
                  continue;
                }
              }
              else
              {
              }
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v20 = [(NSMutableDictionary *)v36->_purgeClientDataBlocks allValues];
              id v21 = [v20 countByEnumeratingWithState:&v37 objects:v51 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v38;
                do
                {
                  for (j = 0; j != v21; j = (char *)j + 1)
                  {
                    if (*(void *)v38 != v22) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
                    if (v24)
                    {
                      uint64_t v25 = [v10 service];
                      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);
                    }
                  }
                  id v21 = [v20 countByEnumeratingWithState:&v37 objects:v51 count:16];
                }
                while (v21);
              }
            }
            id v12 = [v35 countByEnumeratingWithState:&v41 objects:v52 count:16];
          }
          while (v12);
        }

        [v33 removeObjectForKey:v10];
        uint64_t v8 = v31 + 1;
      }
      while ((id)(v31 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v32);
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
    if (+[IDSPeerIDManager_OLD shouldUseSelfTokens]
      && ([(IDSPeerIDManager_OLD *)self _disasterModeTokenForURI:v9],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v13))
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      id v15 = [v8 pushToken];
      id v16 = [v8 tokenFreeURI];
      id v17 = [(IDSPeerIDManager_OLD *)self _endpointsForService:v10 fromURI:v9 toURI:v16 ignoreExpiration:0];
      uint64_t v18 = v17;
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
            uint64_t v24 = v16;
            uint64_t v20 = *(void *)v26;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v22 = [*(id *)(*((void *)&v25 + 1) + 8 * i) pushTokenObject];
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
            id v16 = v24;
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
        if (!-[IDSPeerIDManager_OLD hasPeerTokensForURI:fromURI:service:](self, "hasPeerTokensForURI:fromURI:service:", *(void *)(*((void *)&v18 + 1) + 8 * i), v9, v10, (void)v18))
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

    goto LABEL_36;
  }
  id v7 = [v31 length];

  if (!v7)
  {
LABEL_36:
    uint64_t v24 = 0;
    goto LABEL_37;
  }
  id v8 = [(IDSPeerIDManager_OLD *)self _peerIDKeysForService:v31 andFromURI:v30];
  id v37 = objc_alloc_init((Class)NSMutableSet);
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v49 = v31;
    __int16 v50 = 2112;
    id v51 = v30;
    __int16 v52 = 2112;
    long long v53 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Active query for service: %@  from: %@  peers: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v28 = v30;
    uint64_t v29 = v8;
    id v26 = v31;
    _IDSLogV();
  }
  long long v34 = -[IDSPeerIDManager_OLD persistentMapForService:](self, "persistentMapForService:", v31, v26, v28, v29);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v8;
  id v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v43;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v43 != v33)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(obj);
          uint64_t v10 = v11;
        }
        uint64_t v36 = v10;
        uint64_t v12 = *(void *)(*((void *)&v42 + 1) + 8 * v10);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v13 = objc_msgSend(v34, "objectForKey:", v12, v27);
        uint64_t v14 = [v13 endpoints];

        id v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v39;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(v14);
              }
              long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v19 = objc_opt_class();
              long long v20 = [v18 expireDate];
              LOBYTE(v19) = [(id)v19 _datePassed:v20];

              if (v19)
              {
                long long v21 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v49 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "  Expired session for: %@, skipping...", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  long long v27 = v18;
                  _IDSLogV();
                }
              }
              else
              {
                uint64_t v22 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v49 = v18;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "  Active sessions for: %@, adding...", buf, 0xCu);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                {
                  long long v27 = v18;
                  _IDSLogV();
                }
                id v23 = objc_msgSend(v18, "URI", v27);
                [v37 addObject:v23];
              }
            }
            id v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v15);
        }

        uint64_t v10 = v36 + 1;
      }
      while ((id)(v36 + 1) != v35);
      id v35 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v35);
  }

  uint64_t v24 = [v37 allObjects];

LABEL_37:

  return v24;
}

- (id)uriForShortHandle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IDSServiceNameiMessage;
  id v6 = [(IDSPeerIDManager_OLD *)self persistentMapForService:IDSServiceNameiMessage];
  [(IDSPeerIDManager_OLD *)self _peerIDKeysForService:v5];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v8 = *(void *)v30;
    uint64_t v24 = v6;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = [v6 objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        uint64_t v11 = [v10 endpoints];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v26;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v12);
              }
              id v17 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
              long long v18 = [v17 shortHandle];
              unsigned __int8 v19 = [v18 isEqualToString:v4];

              if (v19)
              {
                long long v20 = [v17 URI];

                id v6 = v24;
                goto LABEL_19;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v6 = v24;
        uint64_t v8 = v22;
      }
      long long v20 = 0;
      id v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    long long v20 = 0;
  }
LABEL_19:

  return v20;
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSMutableSet set];
  id v9 = [(IDSPeerIDManager_OLD *)self pleaseDontCopyCacheDictionaryRepresentation];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v41;
    long long v31 = v9;
    id v32 = v7;
    uint64_t v30 = *(void *)v41;
    do
    {
      uint64_t v13 = 0;
      id v33 = v11;
      do
      {
        if (*(void *)v41 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v35 = v13;
        id v14 = *(void **)(*((void *)&v40 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v14, "service", v30, v31, v32);
        unsigned int v16 = [v15 isEqualToString:v7];

        if (v16)
        {
          id v17 = [v9 objectForKeyedSubscript:v14];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v34 = v17;
          long long v18 = [v17 endpoints];
          id v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v37;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v24 = [v23 pushToken];
                long long v25 = [v6 rawToken];
                unsigned int v26 = [v24 isEqualToData:v25];

                if (v26)
                {
                  long long v27 = [v23 URI];
                  [v8 addObject:v27];
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v20);
          }

          id v9 = v31;
          id v7 = v32;
          uint64_t v12 = v30;
          id v11 = v33;
        }
        uint64_t v13 = v35 + 1;
      }
      while ((id)(v35 + 1) != v11);
      id v11 = [v9 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v11);
  }
  long long v28 = [v8 allObjects];

  return v28;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    uint64_t v13 = sub_1003199B4;
    id v14 = &unk_100988C98;
    uint64_t v15 = self;
    id v16 = v6;
    id v8 = a4;
    id v9 = objc_retainBlock(&v11);
    id v10 = [(IDSPeerIDManager_OLD *)self queryHandler];
    [v10 addCompletionBlock:v9 forToken:v8];
  }
}

- (void)removeCompletionBlockForToken:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSPeerIDManager_OLD *)self queryHandler];
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
        uint64_t v12 = self->_clientDataUpdateBlocks;
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
        uint64_t v12 = self->_purgeClientDataBlocks;
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
    uint64_t v12 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10031A504;
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
      long long v25 = v11;
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
    block[2] = sub_10031A740;
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
    block[2] = sub_10031AAA4;
    block[3] = &unk_10097E7F0;
    id v34 = v15;
    dispatch_async(v17, block);
  }
  id v20 = im_primary_queue();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10031AAB8;
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
  id v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enqueueing cleanup tasks if needed", v4, 2u);
  }

  [(IDSPeerIDManager_OLD *)self _asyncCleanupExpiredEntriesIfNeeded];
  [(IDSPeerIDManager_OLD *)self _asyncRemoveExcessiveQueryEntriesIfNeeded];
}

- (void)_asyncCleanupExpiredEntriesIfNeeded
{
}

- (void)_asyncRemoveExcessiveQueryEntriesIfNeeded
{
}

- (void)cleanupExpiredEntriesIfNeeded
{
  BOOL v2 = [(IMUserDefaults *)self->_userDefaults appValueForKey:@"peer-id-manager-cleanup-interval"];
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithDouble:v4];
    *(_DWORD *)buf = 138412546;
    id v40 = v6;
    __int16 v41 = 2112;
    id v42 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking to cleanup expired entries if needed {now: %@, val: %@}", buf, 0x16u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v2 doubleValue], v7 + 86400.0 <= v4))
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id obj = [(IDSPeerIDManager_OLD *)self persistentMaps];
    id v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = v8;
          id v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v10 = [v9 allKeys];
          id v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v30;
            do
            {
              for (i = 0; i != v12; i = (char *)i + 1)
              {
                if (*(void *)v30 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                id v16 = [v9 objectForKey:v15];
                id v17 = [v16 endpoints];
                id v18 = [v17 firstObject];

                id v19 = objc_opt_class();
                id v20 = [v18 expireDate];
                LODWORD(v19) = [v19 _datePassed:v20];

                if (v19) {
                  [v9 removeObjectForKey:v15];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v12);
          }

          uint64_t v8 = v27 + 1;
        }
        while ((id)(v27 + 1) != v26);
        id v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v26);
    }

    userDefaults = self->_userDefaults;
    __int16 v22 = +[NSNumber numberWithDouble:v4];
    [(IMUserDefaults *)userDefaults setAppValue:v22 forKey:@"peer-id-manager-cleanup-interval"];

    BOOL v2 = v23;
  }
}

- (void)removeExcessiveQueryEntriesIfNeeded
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(IDSPeerIDManager_OLD *)self persistentMaps];
  id v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v52;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        BOOL v2 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        double v3 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v4 = [(IDSPeerIDManager_OLD *)self excessiveQueryCacheEntriesThreshold];
          *(_DWORD *)buf = 134217984;
          unint64_t v58 = v4;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking to see if we've hit query cache threshold... {current threshold: %ld}", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v37 = [(IDSPeerIDManager_OLD *)self excessiveQueryCacheEntriesThreshold];
          _IDSLogV();
        }
        id v5 = objc_msgSend(v2, "allKeys", v37);
        id v6 = [v5 count];
        BOOL v7 = v6 > (id)[(IDSPeerIDManager_OLD *)self excessiveQueryCacheEntriesThreshold];

        if (v7)
        {
          uint64_t v8 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            id v9 = [v2 allKeys];
            id v10 = [v9 count];
            *(_DWORD *)buf = 134217984;
            unint64_t v58 = (unint64_t)v10;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We are over {current count: %ld} -- removing older entries", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v11 = [v2 allKeys];
            id v37 = [v11 count];
            _IDSLogV();
          }
          id v12 = +[NSDate date];
          uint64_t v13 = objc_msgSend(v12, "dateByAddingTimeInterval:", -(double)-[IDSPeerIDManager_OLD excessiveQueryCacheEntriesRemovalWindow](self, "excessiveQueryCacheEntriesRemovalWindow"));

          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v14 = [v2 allKeys];
          id v15 = [v14 countByEnumeratingWithState:&v47 objects:v56 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v48;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v48 != v16) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * (void)j);
                id v19 = [v2 objectForKey:v18];
                id v20 = [v19 keyTransparencyContext];

                id v21 = [v20 queryResponseTime];
                BOOL v22 = [v21 compare:v13] == (id)-1;

                if (v22) {
                  [v2 removeObjectForKey:v18];
                }
              }
              id v15 = [v14 countByEnumeratingWithState:&v47 objects:v56 count:16];
            }
            while (v15);
          }

          id v23 = [v2 allKeys];
          id v24 = [v23 count];
          BOOL v25 = v24 > (id)[(IDSPeerIDManager_OLD *)self excessiveQueryCacheEntriesThreshold];

          if (v25)
          {
            id v26 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = [v2 allKeys];
              id v28 = [v27 count];
              *(_DWORD *)buf = 134217984;
              unint64_t v58 = (unint64_t)v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "We are still over {current count: %ld} -- removing everything", buf, 0xCu);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v29 = [v2 allKeys];
              id v37 = [v29 count];
              _IDSLogV();
            }
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v30 = objc_msgSend(v2, "allKeys", v37);
            id v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
            if (v31)
            {
              uint64_t v32 = *(void *)v44;
              do
              {
                for (k = 0; k != v31; k = (char *)k + 1)
                {
                  if (*(void *)v44 != v32) {
                    objc_enumerationMutation(v30);
                  }
                  [v2 removeObjectForKey:*(void *)(*((void *)&v43 + 1) + 8 * (void)k)];
                }
                id v31 = [v30 countByEnumeratingWithState:&v43 objects:v55 count:16];
              }
              while (v31);
            }
          }
          goto LABEL_45;
        }
        long long v34 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          long long v35 = [v2 allKeys];
          id v36 = [v35 count];
          *(_DWORD *)buf = 134217984;
          unint64_t v58 = (unint64_t)v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "We are at %ld entries -- no need to remove", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          uint64_t v13 = [v2 allKeys];
          id v37 = [v13 count];
          _IDSLogV();
LABEL_45:

          continue;
        }
      }
      id v40 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v40);
  }
}

- (unint64_t)excessiveQueryCacheEntriesThreshold
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  double v3 = [v2 objectForKey:@"excessive-query-threshold"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 600;
  }
  if (+[IMUserDefaults excessiveQueryCacheEntriesThreshold](IMUserDefaults, "excessiveQueryCacheEntriesThreshold") >= 1)unint64_t v4 = +[IMUserDefaults excessiveQueryCacheEntriesThreshold]; {

  }
  return v4;
}

- (unint64_t)excessiveQueryCacheEntriesRemovalWindow
{
  BOOL v2 = +[IDSServerBag sharedInstanceForBagType:0];
  double v3 = [v2 objectForKey:@"excessive-query-removal-window"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = (unint64_t)[v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = 86400;
  }

  return v4;
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

- (IDSPersistentMap)standardPersistentMap
{
  return self->_standardPersistentMap;
}

- (void)setStandardPersistentMap:(id)a3
{
}

- (IDSPersistentMap)restrictedServicePersistentMap
{
  return self->_restrictedServicePersistentMap;
}

- (void)setRestrictedServicePersistentMap:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedExcessiveQueryCacheEntries, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queryHandler, 0);
  objc_storeStrong((id *)&self->_disasterModeTokens, 0);
  objc_storeStrong((id *)&self->_restrictedServicePersistentMap, 0);
  objc_storeStrong((id *)&self->_standardPersistentMap, 0);
  objc_storeStrong((id *)&self->_keyTransparencyVerifier, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong((id *)&self->_endpointQueryListeners, 0);
  objc_storeStrong((id *)&self->_purgeClientDataBlocks, 0);

  objc_storeStrong((id *)&self->_clientDataUpdateBlocks, 0);
}

@end