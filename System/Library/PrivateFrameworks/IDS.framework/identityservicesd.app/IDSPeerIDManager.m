@interface IDSPeerIDManager
+ (BOOL)compareEndpoints:(id)a3 with:(id)a4;
+ (BOOL)compareInfoResult:(id)a3 with:(id)a4;
+ (IDSPeerIDManager)sharedInstance;
- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5;
- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7;
- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9;
- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11;
- (IDSPeerIDManager)init;
- (IDSPeerIDManagerProtocol)managerOLD;
- (IDSPeerIDManagerProtocol)managerSD;
- (NSMutableSet)reportedExcessiveQueryCacheEntries;
- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6;
- (id)activeURIsFromURI:(id)a3 service:(id)a4;
- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6;
- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6;
- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6;
- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6;
- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8;
- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5;
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
- (unint64_t)excessiveQueryCacheEntriesThreshold;
- (void)_triggerAutoBugCaptureWithContext:(id)a3;
- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4;
- (void)addCompletionBlock:(id)a3 forToken:(id)a4;
- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5;
- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4;
- (void)clearCacheAndPersistImmediately:(BOOL)a3;
- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7;
- (void)forgetPeerTokensForService:(id)a3;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5;
- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4;
- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4;
- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6;
- (void)performCleanupTasks;
- (void)registerSysdiagnoseBlock;
- (void)removeClientDataUpdateBlockForToken:(id)a3;
- (void)removeCompletionBlockForToken:(id)a3;
- (void)removeEndpointQueryCompletionBlockForToken:(id)a3;
- (void)removePurgeClientDataBlockForToken:(id)a3;
- (void)setManagerOLD:(id)a3;
- (void)setManagerSD:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setReportedExcessiveQueryCacheEntries:(id)a3;
- (void)updateCachedVerifierResultsWithResults:(id)a3;
@end

@implementation IDSPeerIDManager

+ (IDSPeerIDManager)sharedInstance
{
  if (qword_100A4C810 != -1) {
    dispatch_once(&qword_100A4C810, &stru_100989AD0);
  }
  v2 = (void *)qword_100A4C818;

  return (IDSPeerIDManager *)v2;
}

- (IDSPeerIDManager)init
{
  v3 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  v4 = [[IDSPeerIDQueryDataSource alloc] initWithPeerIDManager:self];
  v5 = [[IDSPeerIDQueryHandler alloc] initWithDelegate:self dataSource:v4];
  v6 = +[IDSKeyTransparencyVerifier sharedInstance];
  v7 = +[IMUserDefaults sharedDefaults];
  if (_os_feature_enabled_impl())
  {
    v8 = [[IDSPeerIDManager_SwiftData alloc] initWithPushHandler:v3 queryHandler:v5 keyTransparencyVerifier:v6 userDefaults:v7];
    managerSD = self->_managerSD;
    self->_managerSD = (IDSPeerIDManagerProtocol *)v8;
  }
  else
  {
    v10 = [[IDSPeerIDManager_OLD alloc] initWithPushHandler:v3 queryHandler:v5 keyTransparencyVerifier:v6 userDefaults:v7];
    managerSD = self->_managerOLD;
    self->_managerOLD = (IDSPeerIDManagerProtocol *)v10;
  }

  [(IDSPeerIDManager *)self registerSysdiagnoseBlock];
  return self;
}

- (void)setPersistenceManager:(id)a3
{
}

- (void)registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  v2 = im_primary_queue();
  IMLogRegisterStateToSysdiagnoseBlock();

  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)finishedQueryWithInfo:(id)a3 forURIs:(id)a4 fromURI:(id)a5 service:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v176 = v10;
  v168 = v11;
  if (_os_feature_enabled_impl())
  {
    id v14 = [(IDSPeerIDManagerProtocol *)self->_managerSD finishedQueryWithInfo:v10 forURIs:v11 fromURI:v12 service:v13];
  }
  else
  {
    v172 = self;
    v161 = +[NSDate now];
    id v170 = objc_alloc_init((Class)NSMutableDictionary);
    id v180 = objc_alloc_init((Class)NSMutableDictionary);
    p_managerOLD = &self->_managerOLD;
    v195 = [(IDSPeerIDManagerProtocol *)self->_managerOLD persistentMapForService:v13];
    p_managerSD = &self->_managerSD;
    v159 = [(IDSPeerIDManagerProtocol *)self->_managerSD persistenceManagerForService:v13];
    long long v278 = 0u;
    long long v277 = 0u;
    long long v276 = 0u;
    long long v275 = 0u;
    id obj = v11;
    id v171 = [obj countByEnumeratingWithState:&v275 objects:v297 count:16];
    if (v171)
    {
      uint64_t v169 = *(void *)v276;
      uint64_t v200 = IDSGameCenterContactsAssociationID;
      uint64_t v199 = IDSGameCenterContactsSharingState;
      uint64_t v198 = IDSGameCenterContactsLastUpdatedDate;
      uint64_t v205 = _IDSIdentityClientDataMessageProtectionIdentityKey;
      uint64_t v197 = IDSRegistrationPropertyShowPeerErrors;
      uint64_t v182 = _IDSIdentityClientDataDevicePublicIdentityKey;
      uint64_t v183 = _IDSIdentityClientDataGroupCryptoVersionNumberKey;
      uint64_t v187 = _IDSIdentityClientDataMessageProtectionNGMDevicePrekeyDataKey;
      uint64_t v181 = _IDSIdentityClientDataMessageProtectionNGMVersionNumberKey;
      uint64_t v185 = _IDSIdentityClientDataMessageProtectionNGMWebPublicIdentityKey;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v276 != v169)
          {
            uint64_t v16 = v15;
            objc_enumerationMutation(obj);
            uint64_t v15 = v16;
          }
          uint64_t v173 = v15;
          v17 = *(void **)(*((void *)&v275 + 1) + 8 * v15);
          v18 = [v17 prefixedURI];
          v177 = [v176 objectForKey:v18];

          v175 = [v177 objectForKey:@"identities"];
          id v208 = objc_alloc_init((Class)IDSEndpointURIProperties);
          v19 = [v177 objectForKey:@"sender-correlation-identifier"];
          [v208 setSenderCorrelationIdentifier:v19];

          v20 = [v177 objectForKey:@"short-handle"];
          [v208 setShortHandle:v20];

          v174 = [[IDSPeerIDKey alloc] initWithService:v13 fromURI:v12 toURI:v17];
          if (v177) {
            BOOL v21 = v176 != 0;
          }
          else {
            BOOL v21 = 0;
          }
          if (v13 != 0 && v21 && [v175 count])
          {
            v167 = [(IDSPeerIDManagerProtocol *)*p_managerOLD _peerIDKeysForService:v13 andFromURI:v12];
            if ((unint64_t)[v167 count] >= 0x259)
            {
              long long v274 = 0u;
              long long v273 = 0u;
              long long v272 = 0u;
              long long v271 = 0u;
              id v22 = v167;
              id v23 = [v22 countByEnumeratingWithState:&v271 objects:v296 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v272;
                do
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v272 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    [v195 removeObjectForKey:*(void *)(*((void *)&v271 + 1) + 8 * i)];
                  }
                  id v23 = [v22 countByEnumeratingWithState:&v271 objects:v296 count:16];
                }
                while (v23);
              }
            }
            v184 = [v177 _stringForKey:@"anonymized-sender-id"];
            v26 = [v177 _numberForKey:@"biz-trusted"];
            [v26 BOOLValue];

            v162 = [v177 objectForKey:@"kt-blob"];
            v165 = [v177 objectForKey:@"kt-status"];
            v191 = [v177 objectForKey:@"kt-account-key"];
            v164 = [v177 objectForKey:@"kt-opt-in"];
            unsigned int v27 = [v164 BOOLValue];
            if (v165)
            {
              v28 = +[IDSFoundationLog KeyTransparency];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413314;
                uint64_t v287 = (uint64_t)v13;
                __int16 v288 = 2112;
                id v289 = v17;
                __int16 v290 = 2112;
                id v291 = v191;
                __int16 v292 = 2112;
                v293 = v165;
                __int16 v294 = 2112;
                v295 = v162;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found KT status in query result { service: %@, URI: %@, KTAccountID: %@, KTStatus: %@, KTBlob: %@ }", buf, 0x34u);
              }
            }
            if (v17)
            {
              if (!v191)
              {
                v29 = [v17 prefixedURI];
                v30 = [v29 _md5Hash];
                v191 = [v30 dataUsingEncoding:4];

                v31 = +[IDSFoundationLog KeyTransparency];
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v287 = (uint64_t)v191;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Per-URI KT account identifier is missing from the IDS response, which may cause KT verification failures -- using URI hash instead { KTAccountKey: %@ }", buf, 0xCu);
                }
              }
              v163 = [[IDSKeyTransparencyIndex alloc] initWithServiceIdentifier:v13 accountKey:v191 URI:v17];
            }
            else
            {
              v163 = 0;
            }
            id v189 = objc_alloc_init((Class)NSMutableArray);
            id v196 = objc_alloc_init((Class)NSMutableArray);
            long long v270 = 0u;
            long long v269 = 0u;
            long long v268 = 0u;
            long long v267 = 0u;
            id v188 = v175;
            id v203 = [v188 countByEnumeratingWithState:&v267 objects:v285 count:16];
            uint64_t v160 = v27;
            if (v203)
            {
              char v215 = 0;
              uint64_t v201 = *(void *)v268;
              CFStringRef v32 = @"NO";
              if (v27) {
                CFStringRef v32 = @"YES";
              }
              CFStringRef v190 = v32;
              do
              {
                uint64_t v33 = 0;
                do
                {
                  if (*(void *)v268 != v201)
                  {
                    uint64_t v34 = v33;
                    objc_enumerationMutation(v188);
                    uint64_t v33 = v34;
                  }
                  uint64_t v209 = v33;
                  v35 = *(void **)(*((void *)&v267 + 1) + 8 * v33);
                  v232 = objc_msgSend(v35, "_dataForKey:", @"push-token", v154, v156, v157, v158);
                  v222 = [v35 _dataForKey:@"session-token"];
                  v36 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Found identity:", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                    _IDSLogV();
                  }
                  v235 = [v35 _dictionaryForKey:@"client-data"];
                  id v230 = [v35 _stringForKey:@"device-name"];
                  v223 = [v35 _dictionaryForKey:@"private-device-data"];
                  id v217 = 0;
                  if (v230 && v223) {
                    id v217 = [objc_alloc((Class)IDSFamilyEndpointData) initWithDeviceName:v230 privateDeviceData:v223];
                  }
                  v226 = [v35 _dataForKey:@"kt-loggable-data"];
                  v220 = [v235 _dataForKey:@"device-key-signature"];
                  v37 = [v35 _numberForKey:@"kt-mismatch-account-flag"];
                  unsigned int v210 = [v37 BOOLValue];

                  v38 = [v35 _numberForKey:@"ktbility"];
                  unsigned int v214 = [v38 BOOLValue];

                  v228 = [v235 _stringForKey:v200];
                  v224 = [v235 _numberForKey:v199];
                  v39 = [v235 _numberForKey:v198];
                  v221 = v39;
                  if (v39)
                  {
                    [v39 doubleValue];
                    +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
                    id v219 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    id v219 = 0;
                  }
                  v40 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v287 = (uint64_t)v228;
                    __int16 v288 = 2112;
                    id v289 = v224;
                    __int16 v290 = 2112;
                    id v291 = v219;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GameCenter data: AssociationID: %@, SharingState: %@, LastUpdatedDate: %@", buf, 0x20u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    id v156 = v224;
                    id v157 = v219;
                    v155 = v228;
                    _IDSLogV();
                  }
                  if (v228 || v224 || v221) {
                    id v211 = [objc_alloc((Class)IDSGameCenterData) initWithAssociationID:v228 sharingState:v224 lastUpdatedDate:v219];
                  }
                  else {
                    id v211 = 0;
                  }
                  if (v232)
                  {
                    v41 = [[IDSKeyTransparencyEntry alloc] initWithPushToken:v232 loggableData:v226 signedData:v220];
                    [(IDSKeyTransparencyEntry *)v41 setKtCapable:v214];
                    [v189 addObject:v41];
                  }
                  v218 = objc_msgSend(v235, "_dataForKey:", v205, v155);
                  v42 = [v235 _numberForKey:v197];
                  unsigned int v43 = [v42 intValue];

                  v44 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    v45 = IDSLoggableDescriptionForTokenOnService();
                    v46 = [v45 debugDescription];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v46;
                    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "              device pushToken: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v47 = IDSLoggableDescriptionForTokenOnService();
                    v154 = [v47 debugDescription];
                    _IDSLogV();
                  }
                  v48 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                  {
                    id v49 = [v222 debugDescription];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v49;
                    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "                 session token: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = [v222 debugDescription];
                    _IDSLogV();
                  }
                  v50 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v17;
                    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "                           uri: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = v17;
                    _IDSLogV();
                  }
                  v51 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                  {
                    v52 = [v208 senderCorrelationIdentifier];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v52;
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, " sender-correlation-identifier: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = [v208 senderCorrelationIdentifier];
                    _IDSLogV();
                  }
                  v53 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    v54 = [v208 shortHandle];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v54;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "                  short-handle: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = [v208 shortHandle];
                    _IDSLogV();
                  }
                  v55 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                  {
                    id v56 = +[IDSLogFormatter descriptionForDictionary:v235 options:1];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v56;
                    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "                    clientData: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = +[IDSLogFormatter descriptionForDictionary:v235 options:1];
                    _IDSLogV();
                  }
                  v57 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v230;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "                   device-name: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = v230;
                    _IDSLogV();
                  }
                  v58 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    id v59 = +[IDSLogFormatter descriptionForDictionary:v223 options:1];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v59;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "           private-device-data: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = +[IDSLogFormatter descriptionForDictionary:v223 options:1];
                    _IDSLogV();
                  }
                  v60 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    id v61 = +[IDSLogFormatter descriptionForData:v226 options:1];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v61;
                    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "              kt-loggable-data: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = +[IDSLogFormatter descriptionForData:v226 options:1];
                    _IDSLogV();
                  }
                  v62 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    id v63 = +[IDSLogFormatter descriptionForData:v191 options:1];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v63;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "                kt-account-key: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = +[IDSLogFormatter descriptionForData:v191 options:1];
                    _IDSLogV();
                  }
                  v64 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v190;
                    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "                     kt-opt-in: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = (void *)v190;
                    _IDSLogV();
                  }
                  v65 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                  {
                    id v66 = +[IDSLogFormatter descriptionForData:v220 options:1];
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v66;
                    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "          device-key-signature: %@", buf, 0xCu);
                  }
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = +[IDSLogFormatter descriptionForData:v220 options:1];
                    _IDSLogV();
                  }
                  v67 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v68 = @"NO";
                    if (v210) {
                      CFStringRef v68 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v68;
                    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "      kt-mismatch-account-flag: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    CFStringRef v69 = @"NO";
                    if (v210) {
                      CFStringRef v69 = @"YES";
                    }
                    v154 = (void *)v69;
                    _IDSLogV();
                  }
                  v70 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v71 = @"NO";
                    if (v214) {
                      CFStringRef v71 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v71;
                    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "               kt-capable-flag: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    CFStringRef v72 = @"NO";
                    if (v214) {
                      CFStringRef v72 = @"YES";
                    }
                    v154 = (void *)v72;
                    _IDSLogV();
                  }
                  v73 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                  {
                    CFStringRef v74 = @"NO";
                    if (v43) {
                      CFStringRef v74 = @"YES";
                    }
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v74;
                    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "                    showErrors: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    CFStringRef v75 = @"NO";
                    if (v43) {
                      CFStringRef v75 = @"YES";
                    }
                    v154 = (void *)v75;
                    _IDSLogV();
                  }
                  if (v218) {
                    goto LABEL_164;
                  }
                  v76 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v287 = (uint64_t)v232;
                    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "   No known public key found for token: %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v154 = v232;
                    _IDSLogV();
                  }
                  if (!objc_msgSend(v13, "isEqualToIgnoringCase:", @"com.apple.madrid", v154))
                  {
LABEL_164:
                    if (v232)
                    {
                      uint64_t v78 = IMGetDomainIntForKey();
                      uint64_t v79 = IMGetDomainIntForKey();
                      v212 = [v35 _numberForKey:@"session-token-refresh-seconds"];
                      v213 = [v35 _numberForKey:@"session-token-expires-seconds"];
                      if (v78)
                      {
                        v80 = OSLogHandleForIDSCategory();
                        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134217984;
                          uint64_t v287 = v78;
                          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "                    Overwriting soft TTL with: %ld seconds", buf, 0xCu);
                        }

                        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                        {
                          v154 = (void *)v78;
                          _IDSLogV();
                        }
                        uint64_t v81 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v78, v154);

                        v212 = (void *)v81;
                      }
                      if (v79)
                      {
                        v82 = OSLogHandleForIDSCategory();
                        if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 134217984;
                          uint64_t v287 = v79;
                          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "                    Overwriting hard TTL with: %ld seconds", buf, 0xCu);
                        }

                        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                        {
                          v154 = (void *)v79;
                          _IDSLogV();
                        }
                        uint64_t v83 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v79, v154);

                        v213 = (void *)v83;
                      }
                      objc_msgSend(v212, "doubleValue", v154);
                      v207 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                      [v213 doubleValue];
                      v206 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
                      v84 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138413058;
                        uint64_t v287 = (uint64_t)v13;
                        __int16 v288 = 2112;
                        id v289 = v17;
                        __int16 v290 = 2112;
                        id v291 = v207;
                        __int16 v292 = 2112;
                        v293 = v206;
                        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "   TTL for Service: %@, Uri: %@, refresh: %@, expires: %@,", buf, 0x2Au);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                      {
                        id v157 = v207;
                        v158 = v206;
                        v154 = v13;
                        id v156 = v17;
                        _IDSLogV();
                      }
                      if (v222 && v213 && v212)
                      {
                        if ([v12 isEqualToURI:v17])
                        {
                          [(IDSPeerIDManagerProtocol *)*p_managerOLD _setDisasterModeToken:v222 forURI:v12];
                          [(IDSPeerIDManagerProtocol *)*p_managerSD _setDisasterModeToken:v222 forURI:v12];
                        }
                        v85 = +[IDSEndpointCapabilities allowedCapabilities];
                        v284[0] = v205;
                        v284[1] = v183;
                        v284[2] = v182;
                        v284[3] = v187;
                        v284[4] = v181;
                        v284[5] = v185;
                        v86 = +[NSArray arrayWithObjects:v284 count:6];
                        v87 = [v85 arrayByAddingObjectsFromArray:v86];

                        id v88 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v87, "count"));
                        long long v266 = 0u;
                        long long v265 = 0u;
                        long long v264 = 0u;
                        long long v263 = 0u;
                        id v89 = v87;
                        id v90 = [v89 countByEnumeratingWithState:&v263 objects:v283 count:16];
                        if (v90)
                        {
                          uint64_t v91 = *(void *)v264;
                          do
                          {
                            for (j = 0; j != v90; j = (char *)j + 1)
                            {
                              if (*(void *)v264 != v91) {
                                objc_enumerationMutation(v89);
                              }
                              uint64_t v93 = *(void *)(*((void *)&v263 + 1) + 8 * (void)j);
                              v94 = [v235 objectForKey:v93];
                              if (v94) {
                                [v88 setObject:v94 forKey:v93];
                              }
                            }
                            id v90 = [v89 countByEnumeratingWithState:&v263 objects:v283 count:16];
                          }
                          while (v90);
                        }

                        v95 = +[NSDate date];
                        [v95 timeIntervalSince1970];
                        double v97 = v96;

                        v194 = [v88 _dataForKey:v205];
                        v193 = [v88 _dataForKey:v187];
                        v98 = +[IDSDServiceController sharedInstance];
                        v216 = [v98 serviceWithIdentifier:v13];

                        if (!v226)
                        {
                          v226 = [v88 _dataForKey:v185];
                        }
                        v202 = [[IDSProtoKeyTransparencyLoggableData alloc] initWithData:v226];
                        v192 = [(IDSProtoKeyTransparencyLoggableData *)v202 ngmPublicIdentity];
                        if ([v216 applicationKeyIndex]
                          && [(IDSProtoKeyTransparencyLoggableData *)v202 applicationPublicIdentitysCount])
                        {
                          long long v262 = 0u;
                          long long v261 = 0u;
                          long long v260 = 0u;
                          long long v259 = 0u;
                          id v204 = [(IDSProtoKeyTransparencyLoggableData *)v202 applicationPublicIdentitys];
                          id v99 = [v204 countByEnumeratingWithState:&v259 objects:v282 count:16];
                          if (v99)
                          {
                            uint64_t v100 = *(void *)v260;
                            while (2)
                            {
                              for (k = 0; k != v99; k = (char *)k + 1)
                              {
                                if (*(void *)v260 != v100) {
                                  objc_enumerationMutation(v204);
                                }
                                v102 = *(void **)(*((void *)&v259 + 1) + 8 * (void)k);
                                unsigned int v103 = [v102 keyIndex];
                                if (v103 == sub_10030C080((int)[v216 applicationKeyIndex]))
                                {
                                  id v99 = [v102 publicIdentity];
                                  goto LABEL_218;
                                }
                              }
                              id v99 = [v204 countByEnumeratingWithState:&v259 objects:v282 count:16];
                              if (v99) {
                                continue;
                              }
                              break;
                            }
                          }
LABEL_218:
                        }
                        else
                        {
                          id v99 = 0;
                        }
                        id v157 = v222;
                        v158 = v206;
                        id v156 = v232;
                        LOBYTE(v154) = v214;
                        id v105 = objc_msgSend(objc_alloc((Class)IDSEndpoint), "initWithURI:serviceIdentifier:clientData:KTLoggableData:KTDeviceSignature:mismatchedAccountFlag:ktCapableFlag:pushToken:sessionToken:expireDate:refreshDate:anonymizedSenderID:verifiedBusiness:serializedPublicMessageProtectionIdentity:queryTimeInterval:serializedNGMDeviceIdentity:serializedNGMDevicePrekey:serializedApplicationPublicKey:endpointURIProperties:familyEndpointData:gameCenterData:", v17, v13, v88, v226, v220, v210, v97);
                        [v196 addObject:v105];

                        char v215 = 1;
                      }
                    }
                    else
                    {
                      v104 = OSLogHandleForIDSCategory();
                      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "   No known push token found, ignoring", buf, 2u);
                      }

                      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                        _IDSLogV();
                      }
                    }
                  }
                  else
                  {
                    v77 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v287 = (uint64_t)v232;
                      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "   No known iMessage public key found for token, skipping this identity: %@", buf, 0xCu);
                    }

                    if (os_log_shim_legacy_logging_enabled())
                    {
                      _IDSWarnV();
                      _IDSLogV();
                      v154 = v232;
                      _IDSLogTransport();
                    }
                  }

                  uint64_t v33 = v209 + 1;
                }
                while ((id)(v209 + 1) != v203);
                id v203 = [v188 countByEnumeratingWithState:&v267 objects:v285 count:16];
              }
              while (v203);
            }
            else
            {
              char v215 = 0;
            }

            id v106 = objc_alloc((Class)KTVerifierResult);
            v107 = +[IDSKeyTransparencyVerifier keyTransparencyURIPrefixForServiceIdentifier:v13];
            v108 = [v17 prefixedURI];
            v109 = [v107 stringByAppendingString:v108];
            v110 = +[IDSKeyTransparencyVerifier keyTransparencyApplicationForServiceIdentifier:v13];
            id v227 = [v106 initPendingForUri:v109 application:v110];

            id v111 = objc_alloc((Class)IDSQueryKeyTransparencyContext);
            v112 = [(IDSKeyTransparencyIndex *)v163 accountKey];
            id v229 = [v111 initWithVerifierResult:v227 ticket:0 accountKey:v112 queryResponseTime:v161 ktOptIn:v160];

            v113 = [v180 objectForKeyedSubscript:v17];
            LODWORD(v112) = v113 == 0;

            if (v112)
            {
              v114 = +[NSUUID UUID];
              v115 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v287 = (uint64_t)v13;
                __int16 v288 = 2112;
                id v289 = v17;
                __int16 v290 = 2112;
                id v291 = v114;
                _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "Will save endpoints to SwiftData DB for service: %@, uri: %@, uuid: %@", buf, 0x20u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v156 = v17;
                id v157 = v114;
                v154 = v13;
                _IDSLogV();
              }
              v255[0] = _NSConcreteStackBlock;
              v255[1] = 3221225472;
              v255[2] = sub_10034ED24;
              v255[3] = &unk_10097E540;
              id v116 = v13;
              id v256 = v116;
              v257 = v17;
              id v117 = v114;
              id v258 = v117;
              [v159 saveEndpoints:v196 ktContext:v229 service:v116 fromURI:v12 toURI:v17 completion:v255];
            }
            v225 = +[IDSPeerIDValue peerIDValueWithEndpoints:keyTransparencyContext:](IDSPeerIDValue, "peerIDValueWithEndpoints:keyTransparencyContext:", v196, v229, v154);
            [v195 setObject:v225 forKey:v174];
            int v118 = _os_feature_enabled_impl();
            v119 = (id *)p_managerOLD;
            if (v118) {
              v119 = (id *)p_managerSD;
            }
            v120 = [*v119 clientDataUpdateBlocks];
            id v121 = [v120 allValues];

            long long v254 = 0u;
            long long v253 = 0u;
            long long v252 = 0u;
            long long v251 = 0u;
            id v231 = v121;
            id v236 = [v231 countByEnumeratingWithState:&v251 objects:v281 count:16];
            if (v236)
            {
              uint64_t v233 = *(void *)v252;
              do
              {
                for (m = 0; m != v236; m = (char *)m + 1)
                {
                  if (*(void *)v252 != v233) {
                    objc_enumerationMutation(v231);
                  }
                  uint64_t v123 = *(void *)(*((void *)&v251 + 1) + 8 * (void)m);
                  long long v247 = 0u;
                  long long v248 = 0u;
                  long long v249 = 0u;
                  long long v250 = 0u;
                  id v124 = v196;
                  id v125 = [v124 countByEnumeratingWithState:&v247 objects:v280 count:16];
                  if (v125)
                  {
                    uint64_t v126 = *(void *)v248;
                    do
                    {
                      for (n = 0; n != v125; n = (char *)n + 1)
                      {
                        if (*(void *)v248 != v126) {
                          objc_enumerationMutation(v124);
                        }
                        (*(void (**)(uint64_t, id, void *, id, void))(v123 + 16))(v123, v13, v17, v12, *(void *)(*((void *)&v247 + 1) + 8 * (void)n));
                      }
                      id v125 = [v124 countByEnumeratingWithState:&v247 objects:v280 count:16];
                    }
                    while (v125);
                  }
                }
                id v236 = [v231 countByEnumeratingWithState:&v251 objects:v281 count:16];
              }
              while (v236);
            }

            if ((v215 & 1) == 0) {
              [(IDSPeerIDManager *)v172 forgetPeerTokensForURI:v17 fromURI:v12 service:v13];
            }
            v128 = +[NSNumber numberWithBool:v215 & 1];
            [v170 setObject:v128 forKeyedSubscript:v17];

            id v129 = [v196 copy];
            [v180 setObject:v129 forKeyedSubscript:v17];
          }
          else
          {
            [(IDSPeerIDManager *)v172 forgetPeerTokensForURI:v17 fromURI:v12 service:v13];
            [v170 setObject:&__kCFBooleanFalse forKeyedSubscript:v17];
            [v180 setObject:&__NSArray0__struct forKeyedSubscript:v17];
          }

          uint64_t v15 = v173 + 1;
        }
        while ((id)(v173 + 1) != v171);
        id v130 = [obj countByEnumeratingWithState:&v275 objects:v297 count:16];
        id v171 = v130;
      }
      while (v130);
    }

    v234 = [(IDSPeerIDManagerProtocol *)v172->_managerOLD _peerIDKeysForService:v13];
    id v131 = [v234 count];
    if (v131 > (id)[(IDSPeerIDManager *)v172 excessiveQueryCacheEntriesThreshold])
    {
      v132 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        id v133 = [v234 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v287 = (uint64_t)v13;
        __int16 v288 = 2048;
        id v289 = v133;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEFAULT, "Excessive query cache entries detected for service: %@ {current count: %ld}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v154 = v13;
        id v156 = [v234 count];
        _IDSLogV();
      }
      reportedExcessiveQueryCacheEntries = v172->_reportedExcessiveQueryCacheEntries;
      if (!reportedExcessiveQueryCacheEntries)
      {
        v135 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v136 = v172->_reportedExcessiveQueryCacheEntries;
        v172->_reportedExcessiveQueryCacheEntries = v135;

        reportedExcessiveQueryCacheEntries = v172->_reportedExcessiveQueryCacheEntries;
      }
      if ((-[NSMutableSet containsObject:](reportedExcessiveQueryCacheEntries, "containsObject:", v13, v154, v156) & 1) == 0)
      {
        [(NSMutableSet *)v172->_reportedExcessiveQueryCacheEntries addObject:v13];
        if (+[IDSAutoBugCapture isSupported])
        {
          v137 = +[NSString stringWithFormat:@"(%@)", v13];
          v245[0] = _NSConcreteStackBlock;
          v245[1] = 3221225472;
          v245[2] = sub_10034EF50;
          v245[3] = &unk_100980830;
          id v246 = v13;
          +[IDSAutoBugCapture triggerCaptureWithEvent:211 context:v137 completion:v245];
        }
      }
    }
    v138 = +[IDSFoundationLog KeyTransparency];
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, "Remote query finished - kicking KT peer verification", buf, 2u);
    }

    v139 = +[IDSKeyTransparencyVerifier sharedInstance];
    [v139 kickPeerVerificationForURIs:obj service:v13 localURI:v12 fetchNow:0 withCompletion:&stru_100989AF0];

    int v140 = _os_feature_enabled_impl();
    v141 = (id *)p_managerOLD;
    if (v140) {
      v141 = (id *)p_managerSD;
    }
    v142 = [*v141 endpointQueryListeners];
    id v143 = [v142 allValues];

    long long v243 = 0u;
    long long v244 = 0u;
    long long v241 = 0u;
    long long v242 = 0u;
    id v144 = v143;
    id v145 = [v144 countByEnumeratingWithState:&v241 objects:v279 count:16];
    if (v145)
    {
      uint64_t v146 = *(void *)v242;
      do
      {
        for (ii = 0; ii != v145; ii = (char *)ii + 1)
        {
          if (*(void *)v242 != v146) {
            objc_enumerationMutation(v144);
          }
          v148 = *(void **)(*((void *)&v241 + 1) + 8 * (void)ii);
          v149 = [v148 queryCompletionBlock];
          if (v149)
          {
            v150 = [v148 queue];
            BOOL v151 = v150 == 0;

            if (!v151)
            {
              v152 = [v148 queue];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10034F150;
              block[3] = &unk_10097E5A8;
              block[4] = v148;
              id v238 = v13;
              id v239 = v12;
              id v240 = v180;
              dispatch_async(v152, block);
            }
          }
        }
        id v145 = [v144 countByEnumeratingWithState:&v241 objects:v279 count:16];
      }
      while (v145);
    }

    id v14 = [v170 copy];
  }

  return v14;
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  managerOLD = self->_managerOLD;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(IDSPeerIDManagerProtocol *)managerOLD sessionTokensForURIs:v18 fromURI:v17 service:v16 fromIdentity:v15 includeSelfDevice:v9 fullyRemoveSelfDevice:v8];
  v20 = [(IDSPeerIDManagerProtocol *)self->_managerSD sessionTokensForURIs:v18 fromURI:v17 service:v16 fromIdentity:v15 includeSelfDevice:v9 fullyRemoveSelfDevice:v8];

  if (_os_feature_enabled_impl()) {
    BOOL v21 = v20;
  }
  else {
    BOOL v21 = v19;
  }
  id v22 = v21;

  return v22;
}

- (id)sessionTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 includeSelfDevice:(BOOL)a7 fullyRemoveSelfDevice:(BOOL)a8 allowRefresh:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  managerOLD = self->_managerOLD;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v25) = a9;
  v20 = [(IDSPeerIDManagerProtocol *)managerOLD sessionTokensForURIs:v19 fromURI:v18 service:v17 fromIdentity:v16 includeSelfDevice:v10 fullyRemoveSelfDevice:v9 allowRefresh:v25];
  LOBYTE(v26) = a9;
  BOOL v21 = [(IDSPeerIDManagerProtocol *)self->_managerSD sessionTokensForURIs:v19 fromURI:v18 service:v17 fromIdentity:v16 includeSelfDevice:v10 fullyRemoveSelfDevice:v9 allowRefresh:v26];

  if (_os_feature_enabled_impl()) {
    id v22 = v21;
  }
  else {
    id v22 = v20;
  }
  id v23 = v22;

  return v23;
}

- (id)sessionTokenForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6 expirationDate:(id *)a7 refreshDate:(id *)a8 fromIdentity:(id)a9 includeSelfDevice:(BOOL)a10
{
  managerOLD = self->_managerOLD;
  id v17 = a9;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v27) = a10;
  id v22 = [(IDSPeerIDManagerProtocol *)managerOLD sessionTokenForURI:v21 pushToken:v20 fromURI:v19 service:v18 expirationDate:a7 refreshDate:a8 fromIdentity:v17 includeSelfDevice:v27];
  LOBYTE(v28) = a10;
  id v23 = [(IDSPeerIDManagerProtocol *)self->_managerSD sessionTokenForURI:v21 pushToken:v20 fromURI:v19 service:v18 expirationDate:a7 refreshDate:a8 fromIdentity:v17 includeSelfDevice:v28];

  if (_os_feature_enabled_impl()) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v22;
  }
  id v25 = v24;

  return v25;
}

- (id)endpointsForURIs:(id)a3 fromURI:(id)a4 service:(id)a5 fromIdentity:(id)a6 filterBehavior:(unint64_t)a7 allowRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v35 = a6;
  v36 = v14;
  uint64_t v33 = v15;
  uint64_t v34 = v16;
  id v17 = -[IDSPeerIDManagerProtocol endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:](self->_managerOLD, "endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:", v14, v15, v16);
  id v18 = [(IDSPeerIDManagerProtocol *)self->_managerSD endpointsForURIs:v14 fromURI:v33 service:v16 fromIdentity:v35 filterBehavior:a7 allowRefresh:v8];
  if (+[IMUserDefaults abcOnQueryCacheDifference])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v19 = v36;
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v24 = [v17 objectForKeyedSubscript:v23];
          id v25 = [v18 objectForKeyedSubscript:v23];
          if (([(id)objc_opt_class() compareEndpoints:v24 with:v25] & 1) == 0)
          {
            uint64_t v26 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v24;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "endpoints: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v32 = v24;
              _IDSLogV();
            }
            uint64_t v27 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v25;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "sdEndpoints: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v32 = v25;
              _IDSLogV();
            }
            uint64_t v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IDSPeerIDManager endpointsForURIs:fromURI:service:fromIdentity:filterBehavior:allowRefresh:]", v32);
            [(IDSPeerIDManager *)self _triggerAutoBugCaptureWithContext:v28];
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v20);
    }
  }
  if (_os_feature_enabled_impl()) {
    v29 = v18;
  }
  else {
    v29 = v17;
  }
  id v30 = v29;

  return v30;
}

- (BOOL)hasPublicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(IDSPeerIDManagerProtocol *)managerOLD publicKeyForURI:v14 pushToken:v13 fromURI:v12 service:v11];

  id v16 = [(IDSPeerIDManagerProtocol *)self->_managerSD publicKeyForURI:v14 pushToken:v13 fromURI:v12 service:v11];

  if (_os_feature_enabled_impl()) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  return v17 != 0;
}

- (id)publicKeyForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(IDSPeerIDManagerProtocol *)managerOLD publicKeyForURI:v14 pushToken:v13 fromURI:v12 service:v11];
  id v16 = [(IDSPeerIDManagerProtocol *)self->_managerSD publicKeyForURI:v14 pushToken:v13 fromURI:v12 service:v11];

  if (_os_feature_enabled_impl()) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)publicDeviceIdentityContainerForPushToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  v6 = [(IDSPeerIDManagerProtocol *)managerOLD publicDeviceIdentityContainerForPushToken:v5];
  v7 = [(IDSPeerIDManagerProtocol *)self->_managerSD publicDeviceIdentityContainerForPushToken:v5];

  if (_os_feature_enabled_impl()) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(IDSPeerIDManagerProtocol *)managerOLD senderCorrelationIdentifierForURI:v11 fromURI:v10 service:v9];
  id v13 = [(IDSPeerIDManagerProtocol *)self->_managerSD senderCorrelationIdentifierForURI:v11 fromURI:v10 service:v9];

  if (_os_feature_enabled_impl()) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (id)senderCorrelationIdentifierForURI:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(IDSPeerIDManagerProtocol *)managerOLD senderCorrelationIdentifierForURI:v14 pushToken:v13 fromURI:v12 service:v11];
  id v16 = [(IDSPeerIDManagerProtocol *)self->_managerSD senderCorrelationIdentifierForURI:v14 pushToken:v13 fromURI:v12 service:v11];

  if (_os_feature_enabled_impl()) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)shortHandleForURI:(id)a3 fromURI:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IDSPeerIDManagerProtocol *)managerOLD shortHandleForURI:v8 fromURI:v7];
  id v10 = [(IDSPeerIDManagerProtocol *)self->_managerSD shortHandleForURI:v8 fromURI:v7];

  if (_os_feature_enabled_impl()) {
    id v11 = v10;
  }
  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (double)timeToCacheURI:(id)a3 fromURI:(id)a4 service:(id)a5 forStatus:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  managerOLD = self->_managerOLD;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD timeToCacheURI:v13 fromURI:v12 service:v11 forStatus:v6];
  double v15 = v14;
  [(IDSPeerIDManagerProtocol *)self->_managerSD timeToCacheURI:v13 fromURI:v12 service:v11 forStatus:v6];
  double v17 = v16;

  if (_os_feature_enabled_impl()) {
    return v17;
  }
  else {
    return v15;
  }
}

- (BOOL)hasProperty:(id)a3 forURI:(id)a4 pushToken:(id)a5 fromURI:(id)a6 service:(id)a7
{
  managerOLD = self->_managerOLD;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  unsigned __int8 v18 = [(IDSPeerIDManagerProtocol *)managerOLD hasProperty:v17 forURI:v16 pushToken:v15 fromURI:v14 service:v13];
  unsigned __int8 v19 = [(IDSPeerIDManagerProtocol *)self->_managerSD hasProperty:v17 forURI:v16 pushToken:v15 fromURI:v14 service:v13];

  if (_os_feature_enabled_impl()) {
    return v19;
  }
  else {
    return v18;
  }
}

- (BOOL)shouldShowPeerErrorsFor:(id)a3 pushToken:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  unsigned __int8 v15 = [(IDSPeerIDManagerProtocol *)managerOLD shouldShowPeerErrorsFor:v14 pushToken:v13 fromURI:v12 service:v11];
  unsigned __int8 v16 = [(IDSPeerIDManagerProtocol *)self->_managerSD shouldShowPeerErrorsFor:v14 pushToken:v13 fromURI:v12 service:v11];

  if (_os_feature_enabled_impl()) {
    return v16;
  }
  else {
    return v15;
  }
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(IDSPeerIDManagerProtocol *)managerOLD endpointsForURIs:v11 service:v10 fromURI:v9];
  id v13 = [(IDSPeerIDManagerProtocol *)self->_managerSD endpointsForURIs:v11 service:v10 fromURI:v9];

  if (_os_feature_enabled_impl()) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (id)endpointForPushToken:(id)a3 URI:(id)a4 service:(id)a5 fromURI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(IDSPeerIDManagerProtocol *)self->_managerOLD endpointForPushToken:v10 URI:v11 service:v12 fromURI:v13];
  id v15 = [(IDSPeerIDManagerProtocol *)self->_managerSD endpointForPushToken:v10 URI:v11 service:v12 fromURI:v13];
  if (+[IMUserDefaults abcOnQueryCacheDifference]
    && ([v15 isEqualToEndpoint:v14 withDateTolerance:10.0] & 1) == 0)
  {
    unsigned __int8 v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "endpoint: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v22 = v14;
      _IDSLogV();
    }
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sdEndpoint: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v22 = v15;
      _IDSLogV();
    }
    unsigned __int8 v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IDSPeerIDManager endpointForPushToken:URI:service:fromURI:]", v22);
    [(IDSPeerIDManager *)self _triggerAutoBugCaptureWithContext:v18];
  }
  if (_os_feature_enabled_impl()) {
    unsigned __int8 v19 = v15;
  }
  else {
    unsigned __int8 v19 = v14;
  }
  id v20 = v19;

  return v20;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 ignoringTTL:(BOOL)a6
{
  BOOL v6 = a6;
  managerOLD = self->_managerOLD;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(IDSPeerIDManagerProtocol *)managerOLD endpointsForURIs:v13 service:v12 fromURI:v11 ignoringTTL:v6];
  id v15 = [(IDSPeerIDManagerProtocol *)self->_managerSD endpointsForURIs:v13 service:v12 fromURI:v11 ignoringTTL:v6];

  if (_os_feature_enabled_impl()) {
    unsigned __int8 v16 = v15;
  }
  else {
    unsigned __int8 v16 = v14;
  }
  id v17 = v16;

  return v17;
}

- (id)endpointsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 withCapabilities:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(IDSPeerIDManagerProtocol *)managerOLD endpointsForURIs:v14 service:v13 fromURI:v12 withCapabilities:v11];
  unsigned __int8 v16 = [(IDSPeerIDManagerProtocol *)self->_managerSD endpointsForURIs:v14 service:v13 fromURI:v12 withCapabilities:v11];

  if (_os_feature_enabled_impl()) {
    id v17 = v16;
  }
  else {
    id v17 = v15;
  }
  id v18 = v17;

  return v18;
}

- (id)idInfoResultForURIs:(id)a3 service:(id)a4 fromURI:(id)a5 infoType:(unint64_t)a6 infoOptions:(id)a7 idStatusUpdates:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v37 = a8;
  long long v38 = v14;
  uint64_t v34 = v15;
  id v35 = v16;
  v36 = v17;
  id v18 = -[IDSPeerIDManagerProtocol idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:](self->_managerOLD, "idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:", v14, v15, v16, a6, v17);
  unsigned __int8 v19 = [(IDSPeerIDManagerProtocol *)self->_managerSD idInfoResultForURIs:v38 service:v15 fromURI:v16 infoType:a6 infoOptions:v17 idStatusUpdates:v37];
  if (+[IMUserDefaults abcOnQueryCacheDifference])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v38;
    id v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v40;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          id v25 = [v18 objectForKeyedSubscript:v24];
          uint64_t v26 = [v19 objectForKeyedSubscript:v24];
          if (([(id)objc_opt_class() compareInfoResult:v26 with:v25] & 1) == 0)
          {
            uint64_t v27 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v25;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "infoResult: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v33 = v25;
              _IDSLogV();
            }
            uint64_t v28 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "sdInfoResult: %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v33 = v26;
              _IDSLogV();
            }
            v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IDSPeerIDManager idInfoResultForURIs:service:fromURI:infoType:infoOptions:idStatusUpdates:]", v33);
            [(IDSPeerIDManager *)self _triggerAutoBugCaptureWithContext:v29];
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v21);
    }
  }
  if (_os_feature_enabled_impl()) {
    id v30 = v19;
  }
  else {
    id v30 = v18;
  }
  id v31 = v30;

  return v31;
}

- (id)verifierResultsForURIs:(id)a3 service:(id)a4 fromURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(IDSPeerIDManagerProtocol *)managerOLD verifierResultsForURIs:v11 service:v10 fromURI:v9];
  id v13 = [(IDSPeerIDManagerProtocol *)self->_managerSD verifierResultsForURIs:v11 service:v10 fromURI:v9];

  if (_os_feature_enabled_impl()) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (void)updateCachedVerifierResultsWithResults:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD updateCachedVerifierResultsWithResults:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD updateCachedVerifierResultsWithResults:v5];
}

- (id)keyTransparencyContextForService:(id)a3 fromURI:(id)a4 toURI:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(IDSPeerIDManagerProtocol *)managerOLD keyTransparencyContextForService:v11 fromURI:v10 toURI:v9];
  id v13 = [(IDSPeerIDManagerProtocol *)self->_managerSD keyTransparencyContextForService:v11 fromURI:v10 toURI:v9];

  if (_os_feature_enabled_impl()) {
    id v14 = v13;
  }
  else {
    id v14 = v12;
  }
  id v15 = v14;

  return v15;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 forSending:(BOOL)a7 forRefresh:(BOOL)a8 isForced:(BOOL)a9 reason:(id)a10 completionBlock:(id)a11
{
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v15 = (Block_layout *)a11;
  id v16 = a10;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  if (_os_feature_enabled_impl()) {
    id v21 = &stru_100989B30;
  }
  else {
    id v21 = v15;
  }
  uint64_t v22 = objc_retainBlock(v21);
  if (_os_feature_enabled_impl()) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = &stru_100989B50;
  }
  uint64_t v24 = objc_retainBlock(v23);

  int v25 = _os_feature_enabled_impl();
  uint64_t v26 = 16;
  if (v25)
  {
    uint64_t v26 = 24;
    uint64_t v27 = v24;
  }
  else
  {
    uint64_t v27 = v22;
  }
  LOBYTE(v30) = a9;
  unsigned __int8 v28 = [*(id *)((char *)&self->super.isa + v26) startQueryForURIs:v20 fromIdentity:v19 fromURI:v18 fromService:v17 forSending:v32 forRefresh:v33 isForced:v30 reason:v16 completionBlock:v27];

  return v28;
}

- (BOOL)startQueryForURIs:(id)a3 fromIdentity:(id)a4 fromURI:(id)a5 fromService:(id)a6 context:(id)a7 reason:(id)a8 completionBlock:(id)a9
{
  id v15 = (Block_layout *)a9;
  id v30 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  if (_os_feature_enabled_impl()) {
    id v21 = &stru_100989B70;
  }
  else {
    id v21 = v15;
  }
  uint64_t v22 = objc_retainBlock(v21);
  if (_os_feature_enabled_impl()) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = &stru_100989B90;
  }
  uint64_t v24 = objc_retainBlock(v23);

  int v25 = _os_feature_enabled_impl();
  uint64_t v26 = 16;
  if (v25)
  {
    uint64_t v26 = 24;
    uint64_t v27 = v24;
  }
  else
  {
    uint64_t v27 = v22;
  }
  unsigned __int8 v28 = [*(id *)((char *)&self->super.isa + v26) startQueryForURIs:v20 fromIdentity:v19 fromURI:v18 fromService:v17 context:v16 reason:v30 completionBlock:v27];

  return v28;
}

- (void)notePeerToken:(id)a3 forURI:(id)a4 fromURI:(id)a5 service:(id)a6
{
  managerOLD = self->_managerOLD;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD notePeerToken:v14 forURI:v13 fromURI:v12 service:v11];
  [(IDSPeerIDManagerProtocol *)self->_managerSD notePeerToken:v14 forURI:v13 fromURI:v12 service:v11];
}

- (void)clearCacheAndPersistImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  -[IDSPeerIDManagerProtocol clearCacheAndPersistImmediately:](self->_managerOLD, "clearCacheAndPersistImmediately:");
  managerSD = self->_managerSD;

  [(IDSPeerIDManagerProtocol *)managerSD clearCacheAndPersistImmediately:v3];
}

- (id)pleaseDontCopyCacheDictionaryRepresentation
{
  BOOL v3 = [(IDSPeerIDManagerProtocol *)self->_managerOLD pleaseDontCopyCacheDictionaryRepresentation];
  v4 = [(IDSPeerIDManagerProtocol *)self->_managerSD pleaseDontCopyCacheDictionaryRepresentation];
  if (_os_feature_enabled_impl()) {
    id v5 = v4;
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (void)forgetPeerTokensForURIs:(id)a3 services:(id)a4
{
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD forgetPeerTokensForURI:v11 fromURI:v10 service:v9];
  [(IDSPeerIDManagerProtocol *)self->_managerSD forgetPeerTokensForURI:v11 fromURI:v10 service:v9];
}

- (void)forgetPeerTokensForURI:(id)a3 fromURI:(id)a4 services:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD forgetPeerTokensForURI:v11 fromURI:v10 services:v9];
  [(IDSPeerIDManagerProtocol *)self->_managerSD forgetPeerTokensForURI:v11 fromURI:v10 services:v9];
}

- (void)forgetPeerTokensForURI:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD forgetPeerTokensForURI:v8 service:v7];
  [(IDSPeerIDManagerProtocol *)self->_managerSD forgetPeerTokensForURI:v8 service:v7];
}

- (void)forgetPeerTokensForService:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD forgetPeerTokensForService:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD forgetPeerTokensForService:v5];
}

- (BOOL)hasPeerTokensForURI:(id)a3 fromURI:(id)a4 service:(id)a5
{
  managerOLD = self->_managerOLD;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  unsigned __int8 v12 = [(IDSPeerIDManagerProtocol *)managerOLD hasPeerTokensForURI:v11 fromURI:v10 service:v9];
  unsigned __int8 v13 = [(IDSPeerIDManagerProtocol *)self->_managerSD hasPeerTokensForURI:v11 fromURI:v10 service:v9];

  if (_os_feature_enabled_impl()) {
    return v13;
  }
  else {
    return v12;
  }
}

- (BOOL)hasPeerTokensForURIs:(id)a3 fromURI:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    int v14 = 1;
    int v15 = 1;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 &= [(IDSPeerIDManagerProtocol *)self->_managerOLD hasPeerTokensForURI:v17 fromURI:v9 service:v10];
        v15 &= [(IDSPeerIDManagerProtocol *)self->_managerSD hasPeerTokensForURI:v17 fromURI:v9 service:v10];
      }
      id v12 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
  else
  {
    LOBYTE(v14) = 1;
    LOBYTE(v15) = 1;
  }
  if (_os_feature_enabled_impl()) {
    BOOL v18 = v15;
  }
  else {
    BOOL v18 = v14;
  }

  return v18;
}

- (id)activeURIsFromURI:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IDSPeerIDManagerProtocol *)managerOLD activeURIsFromURI:v8 service:v7];
  id v10 = [(IDSPeerIDManagerProtocol *)self->_managerSD activeURIsFromURI:v8 service:v7];

  if (_os_feature_enabled_impl()) {
    id v11 = v10;
  }
  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (id)uriForShortHandle:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  id v6 = [(IDSPeerIDManagerProtocol *)managerOLD uriForShortHandle:v5];
  id v7 = [(IDSPeerIDManagerProtocol *)self->_managerSD uriForShortHandle:v5];

  if (_os_feature_enabled_impl()) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (id)urisMatchingPushToken:(id)a3 service:(id)a4
{
  managerOLD = self->_managerOLD;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IDSPeerIDManagerProtocol *)managerOLD urisMatchingPushToken:v8 service:v7];
  id v10 = [(IDSPeerIDManagerProtocol *)self->_managerSD urisMatchingPushToken:v8 service:v7];

  if (_os_feature_enabled_impl()) {
    id v11 = v10;
  }
  else {
    id v11 = v9;
  }
  id v12 = v11;

  return v12;
}

- (void)addCompletionBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  if (_os_feature_enabled_impl()) {
    id v8 = &stru_100989BD0;
  }
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  if (_os_feature_enabled_impl()) {
    id v9 = v7;
  }
  else {
    id v9 = &stru_100989BF0;
  }
  id v10 = objc_retainBlock(v9);

  [(IDSPeerIDManagerProtocol *)self->_managerOLD addCompletionBlock:v11 forToken:v6];
  [(IDSPeerIDManagerProtocol *)self->_managerSD addCompletionBlock:v10 forToken:v6];
}

- (void)removeCompletionBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD removeCompletionBlockForToken:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD removeCompletionBlockForToken:v5];
}

- (void)addClientDataUpdateBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  if (_os_feature_enabled_impl()) {
    id v8 = &stru_100989C30;
  }
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  if (_os_feature_enabled_impl()) {
    id v9 = v7;
  }
  else {
    id v9 = &stru_100989C50;
  }
  id v10 = objc_retainBlock(v9);

  [(IDSPeerIDManagerProtocol *)self->_managerOLD addClientDataUpdateBlock:v11 forToken:v6];
  [(IDSPeerIDManagerProtocol *)self->_managerSD addClientDataUpdateBlock:v10 forToken:v6];
}

- (void)removeClientDataUpdateBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD removeClientDataUpdateBlockForToken:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD removeClientDataUpdateBlockForToken:v5];
}

- (void)addPurgeClientDataBlock:(id)a3 forToken:(id)a4
{
  id v6 = a4;
  id v7 = (Block_layout *)a3;
  if (_os_feature_enabled_impl()) {
    id v8 = &stru_100989C90;
  }
  else {
    id v8 = v7;
  }
  id v11 = objc_retainBlock(v8);
  if (_os_feature_enabled_impl()) {
    id v9 = v7;
  }
  else {
    id v9 = &stru_100989CB0;
  }
  id v10 = objc_retainBlock(v9);

  [(IDSPeerIDManagerProtocol *)self->_managerOLD addPurgeClientDataBlock:v11 forToken:v6];
  [(IDSPeerIDManagerProtocol *)self->_managerSD addPurgeClientDataBlock:v10 forToken:v6];
}

- (void)removePurgeClientDataBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD removePurgeClientDataBlockForToken:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD removeClientDataUpdateBlockForToken:v5];
}

- (void)addEndpointQueryCompletionBlock:(id)a3 forToken:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (Block_layout *)a3;
  if (_os_feature_enabled_impl()) {
    id v11 = &stru_100989CF0;
  }
  else {
    id v11 = v10;
  }
  int v14 = objc_retainBlock(v11);
  if (_os_feature_enabled_impl()) {
    id v12 = v10;
  }
  else {
    id v12 = &stru_100989D10;
  }
  uint64_t v13 = objc_retainBlock(v12);

  [(IDSPeerIDManagerProtocol *)self->_managerOLD addEndpointQueryCompletionBlock:v14 forToken:v9 queue:v8];
  [(IDSPeerIDManagerProtocol *)self->_managerSD addEndpointQueryCompletionBlock:v13 forToken:v9 queue:v8];
}

- (void)removeEndpointQueryCompletionBlockForToken:(id)a3
{
  managerOLD = self->_managerOLD;
  id v5 = a3;
  [(IDSPeerIDManagerProtocol *)managerOLD removeEndpointQueryCompletionBlockForToken:v5];
  [(IDSPeerIDManagerProtocol *)self->_managerSD removeEndpointQueryCompletionBlockForToken:v5];
}

- (void)endpointsForURIs:(id)a3 serviceIdentifier:(id)a4 localURI:(id)a5 completion:(id)a6 queue:(id)a7
{
  id v12 = a7;
  uint64_t v13 = (Block_layout *)a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  if (_os_feature_enabled_impl()) {
    uint64_t v17 = &stru_100989D30;
  }
  else {
    uint64_t v17 = v13;
  }
  long long v20 = objc_retainBlock(v17);
  if (_os_feature_enabled_impl()) {
    BOOL v18 = v13;
  }
  else {
    BOOL v18 = &stru_100989D50;
  }
  id v19 = objc_retainBlock(v18);

  [(IDSPeerIDManagerProtocol *)self->_managerOLD endpointsForURIs:v16 serviceIdentifier:v15 localURI:v14 completion:v20 queue:v12];
  [(IDSPeerIDManagerProtocol *)self->_managerSD endpointsForURIs:v16 serviceIdentifier:v15 localURI:v14 completion:v19 queue:v12];
}

+ (BOOL)compareEndpoints:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && [v5 count] || v6 && objc_msgSend(v6, "count"))
  {
    id v7 = [v5 count];
    if (v7 == [v6 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = v5;
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v26;
        while (1)
        {
          uint64_t v11 = 0;
LABEL_9:
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v13 = v6;
          id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (!v14) {
            break;
          }
          id v15 = v14;
          uint64_t v16 = *(void *)v22;
LABEL_13:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([v12 isEqualToEndpoint:*(void *)(*((void *)&v21 + 1) + 8 * v17) withDateTolerance:10.0])break; {
            if (v15 == (id)++v17)
            }
            {
              id v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v15) {
                goto LABEL_13;
              }
              goto LABEL_25;
            }
          }

          if ((id)++v11 != v9) {
            goto LABEL_9;
          }
          id v9 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
          BOOL v18 = 1;
          if (!v9) {
            goto LABEL_27;
          }
        }
LABEL_25:

        BOOL v18 = 0;
      }
      else
      {
        BOOL v18 = 1;
      }
LABEL_27:
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

+ (BOOL)compareInfoResult:(id)a3 with:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    id v8 = [(id)v6 uri];
    id v9 = [(id)v7 uri];
    if (![v8 isEqualToString:v9])
    {
      BOOL v17 = 0;
LABEL_21:

      goto LABEL_22;
    }
    uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)v6 status]);
    uint64_t v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [(id)v7 status]);
    if (![v10 isEqualToNumber:v11])
    {
      BOOL v17 = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v12 = [(id)v6 endpoints];
    id v13 = [(id)v7 endpoints];
    if (![a1 compareEndpoints:v12 with:v13])
    {
      BOOL v17 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v14 = [(id)v6 ktData];
    long long v28 = [(id)v7 ktData];
    unsigned __int8 v27 = objc_msgSend(v14, "isEqual:");
    v29 = v14;
    if ((v27 & 1) == 0)
    {
      id v15 = [(id)v6 ktData];
      uint64_t v16 = [(id)v7 ktData];
      if (v15 != v16)
      {
        BOOL v17 = 0;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      long long v23 = v15;
    }
    long long v25 = v12;
    BOOL v18 = objc_msgSend((id)v6, "gameCenterData", v23);
    id v19 = [(id)v7 gameCenterData];
    long long v26 = v18;
    if ([v18 isEqual:v19])
    {

      BOOL v17 = 1;
    }
    else
    {
      long long v20 = [(id)v6 gameCenterData];
      long long v21 = [(id)v7 gameCenterData];
      BOOL v17 = v20 == v21;
    }
    uint64_t v16 = v24;
    id v12 = v25;
    id v15 = v24;
    if (v27) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (void)_triggerAutoBugCaptureWithContext:(id)a3
{
  id v3 = a3;
  v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggering AutoBugCapture for differed query cache results due to %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v5 = v3;
    _IDSLogV();
  }
  if (+[IDSAutoBugCapture isSupported])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003521DC;
    v6[3] = &unk_100980830;
    id v7 = v3;
    +[IDSAutoBugCapture triggerCaptureWithEvent:106 context:v7 completion:v6];
  }
}

- (unint64_t)excessiveQueryCacheEntriesThreshold
{
  v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:@"excessive-query-threshold"];

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

- (void)performCleanupTasks
{
  int v3 = _os_feature_enabled_impl();
  uint64_t v4 = 16;
  if (v3) {
    uint64_t v4 = 24;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);

  [v5 performCleanupTasks];
}

- (NSMutableSet)reportedExcessiveQueryCacheEntries
{
  return self->_reportedExcessiveQueryCacheEntries;
}

- (void)setReportedExcessiveQueryCacheEntries:(id)a3
{
}

- (IDSPeerIDManagerProtocol)managerOLD
{
  return self->_managerOLD;
}

- (void)setManagerOLD:(id)a3
{
}

- (IDSPeerIDManagerProtocol)managerSD
{
  return self->_managerSD;
}

- (void)setManagerSD:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerSD, 0);
  objc_storeStrong((id *)&self->_managerOLD, 0);

  objc_storeStrong((id *)&self->_reportedExcessiveQueryCacheEntries, 0);
}

@end