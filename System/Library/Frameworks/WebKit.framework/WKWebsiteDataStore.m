@interface WKWebsiteDataStore
+ (BOOL)_defaultDataStoreExists;
+ (BOOL)_defaultNetworkProcessExists;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)handleNotificationResponse:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSSet)allWebsiteDataTypes;
+ (OpaqueWKNotificationManager)_sharedServiceWorkerNotificationManager;
+ (WKWebsiteDataStore)dataStoreForIdentifier:(NSUUID *)identifier;
+ (WKWebsiteDataStore)defaultDataStore;
+ (WKWebsiteDataStore)nonPersistentDataStore;
+ (id)_allWebsiteDataTypesIncludingPrivate;
+ (void)_allowWebsiteDataRecordsForAllOrigins;
+ (void)_fetchAllIdentifiers:(id)a3;
+ (void)_makeNextNetworkProcessLaunchFailForTesting;
+ (void)_removeDataStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)_setNetworkProcessSuspensionAllowedForTesting:(BOOL)a3;
+ (void)_setWebPushActionHandler:(id)a3;
- (BOOL)_allowsCellularAccess;
- (BOOL)_allowsTLSFallback;
- (BOOL)_hasServiceWorkerBackgroundActivityForTesting;
- (BOOL)_networkProcessExists;
- (BOOL)_networkProcessHasEntitlementForTesting:(id)a3;
- (BOOL)_resourceLoadStatisticsDebugMode;
- (BOOL)_resourceLoadStatisticsEnabled;
- (BOOL)_storageSiteValidationEnabled;
- (BOOL)isPersistent;
- (NSArray)_persistedSites;
- (NSArray)proxyConfigurations;
- (NSDictionary)_proxyConfiguration;
- (NSString)_boundInterfaceIdentifier;
- (NSString)_webPushPartition;
- (NSUUID)_identifier;
- (Object)_apiObject;
- (WKHTTPCookieStore)httpCookieStore;
- (WKWebsiteDataStore)init;
- (WKWebsiteDataStore)initWithCoder:(id)a3;
- (_WKWebsiteDataStoreConfiguration)_configuration;
- (_WKWebsiteDataStoreDelegate)_delegate;
- (id).cxx_construct;
- (id)_initWithConfiguration:(id)a3;
- (int)_networkProcessIdentifier;
- (uint64_t)removeDataOfTypes:(const void *)a1 forDataRecords:completionHandler:;
- (uint64_t)removeDataOfTypes:(const void *)a1 modifiedSince:completionHandler:;
- (uint64_t)removeDataOfTypes:(uint64_t)a1 forDataRecords:completionHandler:;
- (uint64_t)removeDataOfTypes:(uint64_t)a1 modifiedSince:completionHandler:;
- (unint64_t)_perOriginStorageQuota;
- (void)_abortBackgroundFetch:(id)a3 completionHandler:(id)a4;
- (void)_appBoundDomains:(id)a3;
- (void)_appBoundSchemes:(id)a3;
- (void)_clearLoadedSubresourceDomainsFor:(id)a3;
- (void)_clearPrevalentDomain:(id)a3 completionHandler:(id)a4;
- (void)_clearResourceLoadStatistics:(id)a3;
- (void)_clickBackgroundFetch:(id)a3 completionHandler:(id)a4;
- (void)_closeDatabases:(id)a3;
- (void)_countNonDefaultSessionSets:(id)a3;
- (void)_fetchDataRecordsOfTypes:(id)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5;
- (void)_getAllBackgroundFetchIdentifiers:(id)a3;
- (void)_getAppBadgeForTesting:(id)a3;
- (void)_getBackgroundFetchState:(id)a3 completionHandler:(id)a4;
- (void)_getIsPrevalentDomain:(id)a3 completionHandler:(id)a4;
- (void)_getPendingPushMessage:(id)a3;
- (void)_getPendingPushMessages:(id)a3;
- (void)_getResourceLoadStatisticsDataSummary:(id)a3;
- (void)_grantStorageAccessForTesting:(id)a3 withSubFrameDomains:(id)a4 completionHandler:(id)a5;
- (void)_handleNextPushMessageWithCompletionHandler:(id)a3;
- (void)_handleWebPushAction:(id)a3;
- (void)_isRegisteredAsSubresourceUnderFirstParty:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5;
- (void)_isRelationshipOnlyInDatabaseOnce:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5;
- (void)_loadedSubresourceDomainsFor:(id)a3 completionHandler:(id)a4;
- (void)_logUserInteraction:(id)a3 completionHandler:(id)a4;
- (void)_originDirectoryForTesting:(id)a3 topOrigin:(id)a4 type:(id)a5 completionHandler:(id)a6;
- (void)_pauseBackgroundFetch:(id)a3 completionHandler:(id)a4;
- (void)_processPersistentNotificationClick:(id)a3 completionHandler:(id)a4;
- (void)_processPersistentNotificationClose:(id)a3 completionHandler:(id)a4;
- (void)_processPushMessage:(id)a3 completionHandler:(id)a4;
- (void)_processStatisticsAndDataRecords:(id)a3;
- (void)_processWebCorePersistentNotificationClick:(const void *)a3 completionHandler:(id)a4;
- (void)_processWebCorePersistentNotificationClose:(const void *)a3 completionHandler:(id)a4;
- (void)_renameOrigin:(id)a3 to:(id)a4 forDataOfTypes:(id)a5 completionHandler:(id)a6;
- (void)_resumeBackgroundFetch:(id)a3 completionHandler:(id)a4;
- (void)_scheduleCookieBlockingUpdate:(id)a3;
- (void)_scopeURL:(id)a3 hasPushSubscriptionForTesting:(id)a4;
- (void)_sendNetworkProcessDidResume;
- (void)_sendNetworkProcessPrepareToSuspend:(id)a3;
- (void)_sendNetworkProcessWillSuspendImminently;
- (void)_setBackupExclusionPeriodForTesting:(double)a3 completionHandler:(id)a4;
- (void)_setCompletionHandlerForRemovalFromNetworkProcess:(id)a3;
- (void)_setPersistedSites:(id)a3;
- (void)_setPrevalentDomain:(id)a3 completionHandler:(id)a4;
- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3;
- (void)_setPrivateClickMeasurementDebugModeEnabledForTesting:(BOOL)a3;
- (void)_setPrivateTokenIPCForTesting:(BOOL)a3;
- (void)_setResourceLoadStatisticsDebugMode:(BOOL)a3;
- (void)_setResourceLoadStatisticsEnabled:(BOOL)a3;
- (void)_setResourceLoadStatisticsTestingCallback:(id)a3;
- (void)_setResourceLoadStatisticsTimeAdvanceForTesting:(double)a3 completionHandler:(id)a4;
- (void)_setRestrictedOpenerTypeForTesting:(unsigned __int8)a3 forDomain:(id)a4;
- (void)_setServiceWorkerOverridePreferences:(id)a3;
- (void)_setStorageAccessPromptQuirkForTesting:(id)a3 withSubFrameDomains:(id)a4 withTriggerPages:(id)a5 completionHandler:(id)a6;
- (void)_setStorageSiteValidationEnabled:(BOOL)a3;
- (void)_setThirdPartyCookieBlockingMode:(BOOL)a3 onlyOnSitesWithoutUserInteraction:(BOOL)a4 completionHandler:(id)a5;
- (void)_setUserAgentStringQuirkForTesting:(id)a3 withUserAgent:(id)a4 completionHandler:(id)a5;
- (void)_statisticsDatabaseHasAllTables:(id)a3;
- (void)_storeServiceWorkerRegistrations:(id)a3;
- (void)_synthesizeAppIsBackground:(BOOL)a3;
- (void)_terminateNetworkProcess;
- (void)_trustServerForLocalPCMTesting:(__SecTrust *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchDataRecordsOfTypes:(NSSet *)dataTypes completionHandler:(void *)completionHandler;
- (void)removeDataOfTypes:(NSSet *)dataTypes forDataRecords:(NSArray *)dataRecords completionHandler:(void *)completionHandler;
- (void)removeDataOfTypes:(NSSet *)dataTypes modifiedSince:(NSDate *)date completionHandler:(void *)completionHandler;
- (void)setProxyConfigurations:(NSArray *)proxyConfigurations;
- (void)set_delegate:(id)a3;
@end

@implementation WKWebsiteDataStore

- (void)_setResourceLoadStatisticsEnabled:(BOOL)a3
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 32) = 0u;
  return self;
}

+ (void)_fetchAllIdentifiers:(id)a3
{
  v3 = _Block_copy(a3);
  v4 = _Block_copy(v3);
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6C98;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::fetchAllDataStoreIdentifiers((WebKit::WebsiteDataStore *)&v7);
  v6 = v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
  _Block_release(0);
  _Block_release(v3);
}

- (void)_getResourceLoadStatisticsDataSummary:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6E78;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebsiteDataStore::getResourceLoadStatisticsDataSummary((uint64_t)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (id)_initWithConfiguration:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKWebsiteDataStore;
  v4 = [(WKWebsiteDataStore *)&v11 init];
  if (v4)
  {
    v5 = (PAL::SessionID *)[a3 isPersistent];
    if (v5) {
      uint64_t PersistentSessionID = PAL::SessionID::generatePersistentSessionID(v5);
    }
    else {
      uint64_t PersistentSessionID = PAL::SessionID::generateEphemeralSessionID(v5);
    }
    uint64_t v7 = PersistentSessionID;
    WebKit::WebsiteDataStoreConfiguration::copy((WebKit::WebsiteDataStoreConfiguration *)((char *)a3 + 16), (uint64_t)&v10);
    *(void *)(WebKit::WebsiteDataStore::WebsiteDataStore((uint64_t)[(WKWebsiteDataStore *)v4 _apiObject], &v10, v7)+ 8) = v4;
    uint64_t v8 = v10;
    uint64_t v10 = 0;
    if (v8) {
      CFRelease(*(CFTypeRef *)(v8 + 8));
    }
    WebKit::WebsiteDataStore::resolveDirectoriesAsynchronously((WebKit::WebsiteDataStore *)&v4->_websiteDataStore);
  }
  return v4;
}

- (Object)_apiObject
{
  return (Object *)&self->_websiteDataStore;
}

- (NSUUID)_identifier
{
  if (*(_OWORD *)(*(void *)&self->_anon_38[160] + 32) == 0) {
    return 0;
  }
  else {
    return (NSUUID *)WTF::UUID::operator NSUUID *();
  }
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
  uint64_t v5 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v5 = &unk_1EE9C6FE0;
  *(void *)(v5 + 8) = 0;
  objc_initWeak((id *)(v5 + 8), self);
  *(void *)(v5 + 16) = 0;
  objc_initWeak((id *)(v5 + 16), a3);
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
  char v7 = objc_opt_respondsToSelector();
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  *(unsigned char *)(v5 + 24) = v7 & 1;
  id v8 = objc_loadWeakRetained((id *)(v5 + 16));
  char v9 = objc_opt_respondsToSelector();
  if (v8) {
    CFRelease(v8);
  }
  *(unsigned char *)(v5 + 25) = v9 & 1;
  id v10 = objc_loadWeakRetained((id *)(v5 + 16));
  char v11 = objc_opt_respondsToSelector();
  if (v10) {
    CFRelease(v10);
  }
  *(unsigned char *)(v5 + 26) = v11 & 1;
  id v12 = objc_loadWeakRetained((id *)(v5 + 16));
  char v13 = objc_opt_respondsToSelector();
  if (v12) {
    CFRelease(v12);
  }
  *(unsigned char *)(v5 + 27) = v13 & 1;
  id v14 = objc_loadWeakRetained((id *)(v5 + 16));
  char v15 = objc_opt_respondsToSelector();
  if (v14) {
    CFRelease(v14);
  }
  *(unsigned char *)(v5 + 28) = v15 & 1;
  id v16 = objc_loadWeakRetained((id *)(v5 + 16));
  char v17 = objc_opt_respondsToSelector();
  if (v16) {
    CFRelease(v16);
  }
  *(unsigned char *)(v5 + 29) = v17 & 1;
  id v18 = objc_loadWeakRetained((id *)(v5 + 16));
  char v19 = objc_opt_respondsToSelector();
  if (v18) {
    CFRelease(v18);
  }
  *(unsigned char *)(v5 + 30) = v19 & 1;
  id v20 = objc_loadWeakRetained((id *)(v5 + 16));
  char v21 = objc_opt_respondsToSelector();
  if (v20) {
    CFRelease(v20);
  }
  *(unsigned char *)(v5 + 31) = v21 & 1;
  id v22 = objc_loadWeakRetained((id *)(v5 + 16));
  char v23 = objc_opt_respondsToSelector();
  if (v22) {
    CFRelease(v22);
  }
  *(unsigned char *)(v5 + 32) = v23 & 1;
  id v24 = objc_loadWeakRetained((id *)(v5 + 16));
  char v25 = objc_opt_respondsToSelector();
  if (v24) {
    CFRelease(v24);
  }
  *(unsigned char *)(v5 + 33) = v25 & 1;
  id v26 = objc_loadWeakRetained((id *)(v5 + 16));
  char v27 = objc_opt_respondsToSelector();
  if (v26) {
    CFRelease(v26);
  }
  *(unsigned char *)(v5 + 34) = v27 & 1;
  id v28 = objc_loadWeakRetained((id *)(v5 + 16));
  char v29 = objc_opt_respondsToSelector();
  if (v28) {
    CFRelease(v28);
  }
  *(unsigned char *)(v5 + 35) = v29 & 1;
  id v30 = objc_loadWeakRetained((id *)(v5 + 16));
  char v31 = objc_opt_respondsToSelector();
  if (v30) {
    CFRelease(v30);
  }
  *(unsigned char *)(v5 + 36) = v31 & 1;
  id v32 = objc_loadWeakRetained((id *)(v5 + 16));
  char v33 = objc_opt_respondsToSelector();
  if (v32) {
    CFRelease(v32);
  }
  *(unsigned char *)(v5 + 37) = v33 & 1;
  uint64_t v34 = *(void *)&self->_anon_38[336];
  *(void *)&self->_anon_38[336] = v5;
  if (v34)
  {
    v35 = *(void (**)(void))(*(void *)v34 + 8);
    v35();
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebsiteDataStore accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebsiteDataStore accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

+ (WKWebsiteDataStore)defaultDataStore
{
  WebKit::WebsiteDataStore::defaultDataStore((WebKit::WebsiteDataStore *)a1, (WebKit::WebsiteDataStore **)&v6);
  v2 = (WebKit::WebsiteDataStore *)v6;
  CFTypeRef v3 = v6[1];
  if (v3) {
    CFRetain(v6[1]);
  }
  v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return v4;
}

+ (WKWebsiteDataStore)nonPersistentDataStore
{
  WebKit::WebsiteDataStore::createNonPersistent((WebKit::WebsiteDataStore **)&v6);
  v2 = (WebKit::WebsiteDataStore *)v6;
  CFTypeRef v3 = v6[1];
  if (v3) {
    CFRetain(v6[1]);
  }
  v4 = (id)CFMakeCollectable(v3);
  CFRelease(*((CFTypeRef *)v2 + 1));
  return v4;
}

- (WKWebsiteDataStore)init
{
  if (WTF::linkedOnOrAfterSDKWithBehavior()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Calling [WKWebsiteDataStore init] is not supported."];
  }
  v9.receiver = self;
  v9.super_class = (Class)WKWebsiteDataStore;
  CFTypeRef v3 = [(WKWebsiteDataStore *)&v9 init];
  if (v3)
  {
    v4 = qword_1EB3585F0;
    if (os_log_type_enabled((os_log_t)qword_1EB3585F0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8[0]) = 0;
      _os_log_error_impl(&dword_1985F2000, v4, OS_LOG_TYPE_ERROR, "Application is calling [WKWebsiteDataStore init], which is not supported", (uint8_t *)v8, 2u);
    }
    uint64_t v5 = API::Object::newObject(0x220uLL, 125);
    v8[0] = (PAL::SessionID *)WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration(v5, 0, 1);
    uint64_t EphemeralSessionID = PAL::SessionID::generateEphemeralSessionID(v8[0]);
    *(void *)(WebKit::WebsiteDataStore::WebsiteDataStore((uint64_t)[(WKWebsiteDataStore *)v3 _apiObject], (uint64_t *)v8, EphemeralSessionID)+ 8) = v3;
    if (v8[0]) {
      CFRelease(*((CFTypeRef *)v8[0] + 1));
    }
  }
  return v3;
}

- (void)dealloc
{
  CFTypeRef v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebsiteDataStore::~WebsiteDataStore((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
    v4.receiver = self;
    v4.super_class = (Class)WKWebsiteDataStore;
    [(WKWebsiteDataStore *)&v4 dealloc];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WKWebsiteDataStore)initWithCoder:(id)a3
{
  if ([a3 decodeBoolForKey:@"isDefaultDataStore"]) {
    CFTypeRef v3 = +[WKWebsiteDataStore defaultDataStore];
  }
  else {
    CFTypeRef v3 = +[WKWebsiteDataStore nonPersistentDataStore];
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  if (+[WKWebsiteDataStore defaultDataStore] == self)
  {
    [a3 encodeBool:1 forKey:@"isDefaultDataStore"];
  }
}

- (BOOL)isPersistent
{
  uint64_t v2 = *(void *)&self->_websiteDataStore.data.__lx[24];
  return v2 >= 0 || v2 == -1;
}

+ (NSSet)allWebsiteDataTypes
{
  if ((_MergedGlobals_70 & 1) == 0)
  {
    qword_1EB359848 = 0;
    _MergedGlobals_70 = 1;
  }
  if (qword_1EB359840 != -1) {
    dispatch_once(&qword_1EB359840, &__block_literal_global_20);
  }
  return (NSSet *)qword_1EB359848;
}

void __41__WKWebsiteDataStore_allWebsiteDataTypes__block_invoke()
{
  v3[14] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3[0] = @"WKWebsiteDataTypeDiskCache";
  v3[1] = @"WKWebsiteDataTypeFetchCache";
  v3[2] = @"WKWebsiteDataTypeMemoryCache";
  v3[3] = @"WKWebsiteDataTypeOfflineWebApplicationCache";
  v3[4] = @"WKWebsiteDataTypeCookies";
  v3[5] = @"WKWebsiteDataTypeSessionStorage";
  v3[6] = @"WKWebsiteDataTypeLocalStorage";
  v3[7] = @"WKWebsiteDataTypeIndexedDBDatabases";
  v3[8] = @"WKWebsiteDataTypeServiceWorkerRegistrations";
  v3[9] = @"WKWebsiteDataTypeWebSQLDatabases";
  v3[10] = @"WKWebsiteDataTypeFileSystem";
  v3[11] = @"WKWebsiteDataTypeSearchFieldRecentSearches";
  v3[12] = @"WKWebsiteDataTypeMediaKeys";
  v3[13] = @"WKWebsiteDataTypeHashSalt";
  uint64_t v1 = objc_msgSend(v0, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 14));
  uint64_t v2 = (const void *)qword_1EB359848;
  qword_1EB359848 = v1;
  if (v2) {
    CFRelease(v2);
  }
}

- (WKHTTPCookieStore)httpCookieStore
{
  return (WKHTTPCookieStore *)*((void *)WebKit::WebsiteDataStore::cookieStore((WebKit::WebsiteDataStore *)&self->_websiteDataStore)
                              + 1);
}

- (void)fetchDataRecordsOfTypes:(NSSet *)dataTypes completionHandler:(void *)completionHandler
{
}

- (void)removeDataOfTypes:(NSSet *)dataTypes modifiedSince:(NSDate *)date completionHandler:(void *)completionHandler
{
  v25[16] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = _Block_copy(completionHandler);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v10 = [(NSSet *)dataTypes countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v10)
  {
    int v11 = 0;
    if (date) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  int v11 = 0;
  uint64_t v12 = *(void *)v22;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v22 != v12) {
        objc_enumerationMutation(dataTypes);
      }
      unint64_t v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((void *)&v21 + 1) + 8 * i), v9);
      if (v14 <= 0x100000000) {
        int v15 = 0;
      }
      else {
        int v15 = v14;
      }
      v11 |= v15;
    }
    uint64_t v10 = [(NSSet *)dataTypes countByEnumeratingWithState:&v21 objects:v25 count:16];
  }
  while (v10);
  if (!date) {
LABEL_14:
  }
    date = (NSDate *)[MEMORY[0x1E4F1C9C8] distantPast];
LABEL_15:
  [(NSDate *)date timeIntervalSince1970];
  double v17 = v16;
  id v18 = _Block_copy(v8);
  char v19 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v19 = &unk_1EE9C6C48;
  v19[1] = v18;
  v25[0] = (uint64_t)v19;
  WebKit::WebsiteDataStore::removeData((uint64_t)&self->_websiteDataStore, v11, v25, v17);
  uint64_t v20 = v25[0];
  v25[0] = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  _Block_release(0);
  _Block_release(v8);
}

- (void)removeDataOfTypes:(NSSet *)dataTypes forDataRecords:(NSArray *)dataRecords completionHandler:(void *)completionHandler
{
  v31[16] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = _Block_copy(completionHandler);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [(NSSet *)dataTypes countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    int v11 = 0;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(dataTypes);
        }
        unint64_t v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((void *)&v27 + 1) + 8 * i), v9);
        if (v14 <= 0x100000000) {
          int v15 = 0;
        }
        else {
          int v15 = v14;
        }
        v11 |= v15;
      }
      uint64_t v10 = [(NSSet *)dataTypes countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v26 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = -[NSArray countByEnumeratingWithState:objects:count:](dataRecords, "countByEnumeratingWithState:objects:count:", &v27, v31, 16, 0);
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(dataRecords);
        }
        char v19 = (const WebKit::WebsiteDataRecord *)(*(void *)(*((void *)&v27 + 1) + 8 * j) + 24);
        unsigned int v20 = HIDWORD(v26);
        if (HIDWORD(v26) == v26)
        {
          char v19 = (const WebKit::WebsiteDataRecord *)WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v25, HIDWORD(v26) + 1, (unint64_t)v19);
          unsigned int v20 = HIDWORD(v26);
        }
        WebKit::WebsiteDataRecord::WebsiteDataRecord((WebKit::WebsiteDataRecord *)(v25 + 80 * v20), v19);
        ++HIDWORD(v26);
      }
      uint64_t v16 = [(NSArray *)dataRecords countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }
  long long v21 = _Block_copy(v8);
  long long v22 = (void *)WTF::fastMalloc((WTF *)0x10);
  *long long v22 = &unk_1EE9C6C70;
  v22[1] = v21;
  v31[0] = (uint64_t)v22;
  WebKit::WebsiteDataStore::removeData((uint64_t)&self->_websiteDataStore, v11, &v25, v31);
  uint64_t v23 = v31[0];
  v31[0] = 0;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  _Block_release(0);
  WTF::Vector<WebKit::WebsiteDataRecord,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v25, v24);
  _Block_release(v8);
}

+ (WKWebsiteDataStore)dataStoreForIdentifier:(NSUUID *)identifier
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!identifier) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Identifier is nil"];
  }
  WTF::UUID::fromNSUUID((uint64_t *)&v15, (WTF::UUID *)identifier, (NSUUID *)a2);
  if (!v16 || v15 < 2)
  {
    objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
    MEMORY[0x19972EAD0](&v13, [(NSUUID *)identifier UUIDString]);
    WTF::String::utf8();
    if (v14) {
      uint64_t v5 = (char *)v14 + 16;
    }
    else {
      uint64_t v5 = 0;
    }
    objc_msgSend(v4, "raise:format:", *MEMORY[0x1E4F1C3C8], @"Identifier (%s) is invalid for data store", v5);
    char v7 = v14;
    unint64_t v14 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 1) {
        WTF::fastFree(v7, v6);
      }
      else {
        --*(_DWORD *)v7;
      }
    }
    uint64_t v8 = v13;
    char v13 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, (WTF::StringImpl *)v6);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    if (!v16) {
      __break(1u);
    }
  }
  WebKit::WebsiteDataStore::dataStoreForIdentifier((WebKit::WebsiteDataStore *)&v15, &v14);
  objc_super v9 = v14;
  uint64_t v10 = (const void *)*((void *)v14 + 1);
  if (v10) {
    CFRetain(*((CFTypeRef *)v14 + 1));
  }
  int v11 = (id)CFMakeCollectable(v10);
  CFRelease(*((CFTypeRef *)v9 + 1));
  return v11;
}

- (void)setProxyConfigurations:(NSArray *)proxyConfigurations
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[(NSArray *)proxyConfigurations copy];
  m_ptr = self->_proxyConfigurations.m_ptr;
  self->_proxyConfigurations.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v5 = self->_proxyConfigurations.m_ptr;
    if (!v5) {
      goto LABEL_28;
    }
  }
  else if (!v5)
  {
    goto LABEL_28;
  }
  if ([v5 count])
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = [(NSArray *)proxyConfigurations countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v8 = *(void *)v27;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(proxyConfigurations);
        }
        uint64_t v10 = (void *)nw_proxy_config_copy_agent_data();
        long long v32 = 0uLL;
        nw_proxy_config_get_identifier();
        if (!v10)
        {
          LODWORD(v14) = 0;
LABEL_24:
          unsigned long long v15 = 0;
          goto LABEL_14;
        }
        uint64_t v12 = [v10 bytes];
        unint64_t v13 = [v10 length];
        unint64_t v14 = v13;
        if (!v13) {
          goto LABEL_24;
        }
        if (HIDWORD(v13))
        {
          __break(0xC471u);
          return;
        }
        unsigned long long v15 = (WTF *)WTF::fastMalloc((WTF *)v13);
        uint64_t v16 = 0;
        do
        {
          *((unsigned char *)v15 + v16) = *(unsigned char *)(v12 + v16);
          ++v16;
        }
        while (v14 != v16);
LABEL_14:
        long long v22 = v15;
        int v23 = v14;
        int v24 = v14;
        long long v25 = v32;
        if (HIDWORD(v31) == v31)
        {
          WTF::Vector<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>>((uint64_t)&v30, (unint64_t)&v22);
        }
        else
        {
          uint64_t v17 = v30 + 32 * HIDWORD(v31);
          *(void *)uint64_t v17 = 0;
          *(void *)(v17 + 8) = 0;
          id v18 = v22;
          long long v22 = 0;
          *(void *)uint64_t v17 = v18;
          *(_DWORD *)(v17 + 8) = v23;
          LODWORD(v18) = v24;
          int v24 = 0;
          *(_DWORD *)(v17 + 12) = v18;
          *(_OWORD *)(v17 + 16) = v25;
          ++HIDWORD(v31);
        }
        char v19 = v22;
        if (v22)
        {
          long long v22 = 0;
          int v23 = 0;
          WTF::fastFree(v19, v11);
        }
        if (v10) {
          CFRelease(v10);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v20 = [(NSArray *)proxyConfigurations countByEnumeratingWithState:&v26 objects:v33 count:16];
      uint64_t v7 = v20;
      if (!v20)
      {
LABEL_26:
        WebKit::WebsiteDataStore::setProxyConfigData((WebKit::WebsiteDataStore *)&self->_websiteDataStore, &v30);
        WTF::Vector<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::UUID>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v30, v21);
        return;
      }
    }
  }
LABEL_28:

  WebKit::WebsiteDataStore::clearProxyConfigData((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (NSArray)proxyConfigurations
{
  return (NSArray *)self->_proxyConfigurations.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_proxyConfigurations.m_ptr;
  self->_proxyConfigurations.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  objc_destroyWeak(&self->_delegate.m_weakReference);
}

+ (id)_allWebsiteDataTypesIncludingPrivate
{
  if ((byte_1EB359839 & 1) == 0)
  {
    qword_1EB359858 = 0;
    byte_1EB359839 = 1;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__WKWebsiteDataStore_WKPrivate___allWebsiteDataTypesIncludingPrivate__block_invoke;
  block[3] = &unk_1E5812158;
  block[4] = a1;
  if (qword_1EB359850 != -1) {
    dispatch_once(&qword_1EB359850, block);
  }
  return (id)qword_1EB359858;
}

void __69__WKWebsiteDataStore_WKPrivate___allWebsiteDataTypesIncludingPrivate__block_invoke(uint64_t a1)
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"_WKWebsiteDataTypeHSTSCache";
  v4[1] = @"_WKWebsiteDataTypeResourceLoadStatistics";
  v4[2] = @"_WKWebsiteDataTypeCredentials";
  v4[3] = @"_WKWebsiteDataTypeAdClickAttributions";
  v4[4] = @"_WKWebsiteDataTypePrivateClickMeasurements";
  v4[5] = @"_WKWebsiteDataTypeAlternativeServices";
  uint64_t v1 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "allWebsiteDataTypes"), "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 6));
  uint64_t v2 = (uint64_t)v1;
  if (v1) {
    CFRetain(v1);
  }
  CFTypeRef v3 = (const void *)qword_1EB359858;
  qword_1EB359858 = v2;
  if (v3) {
    CFRelease(v3);
  }
}

+ (BOOL)_defaultDataStoreExists
{
  {
    return WebKit::globalDefaultDataStore(void)::globalDefaultDataStore
        && *(void *)(WebKit::globalDefaultDataStore(void)::globalDefaultDataStore + 8) != 0;
  }
  else
  {
    BOOL result = 0;
    WebKit::globalDefaultDataStore(void)::globalDefaultDataStore = 0;
  }
  return result;
}

+ (void)_removeDataStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v6 = _Block_copy(a4);
    WTF::UUID::fromNSUUID(v14, (WTF::UUID *)a3, v7);
    if (v15)
    {
      uint64_t v8 = _Block_copy(v6);
      uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v9 = &unk_1EE9C6CC0;
      v9[1] = v8;
      int v11 = v9;
      WebKit::WebsiteDataStore::removeDataStoreWithIdentifier((WebKit::WebsiteDataStore *)v14, (WTF::RefCountedBase *)&v11);
      uint64_t v10 = v11;
      int v11 = 0;
      if (v10) {
        (*(void (**)(void *))(*v10 + 8))(v10);
      }
      _Block_release(0);
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F28568];
      unint64_t v13 = @"Identifier is invalid";
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"WKWebSiteDataStore", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
    }
    _Block_release(v6);
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Identifier is nil";
    (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"WKWebSiteDataStore", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1)));
  }
}

- (void)_fetchDataRecordsOfTypes:(id)a3 withOptions:(unint64_t)a4 completionHandler:(id)a5
{
  char v5 = a4;
  v21[16] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = _Block_copy(a5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    int v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(a3);
        }
        unint64_t v14 = WebKit::toWebsiteDataType(*(WebKit **)(*((void *)&v17 + 1) + 8 * i), v9);
        if (v14 <= 0x100000000) {
          int v15 = 0;
        }
        else {
          int v15 = v14;
        }
        v11 |= v15;
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v16 = &unk_1EE9C6CE8;
  v16[1] = v8;
  v21[0] = (uint64_t)v16;
  WebKit::WebsiteDataStore::fetchData((WTF::WorkQueue *)&self->_websiteDataStore, v11, v5 & 1, v21);
  if (v21[0]) {
    (*(void (**)(uint64_t))(*(void *)v21[0] + 8))(v21[0]);
  }
  _Block_release(0);
  _Block_release(0);
}

- (BOOL)_resourceLoadStatisticsEnabled
{
  if (self->_anon_38[217]) {
    return self->_anon_38[217] == 2;
  }
  if (*(unsigned __int16 *)(*(void *)&self->_anon_38[160] + 528) >= 0x100u) {
    return *(_WORD *)(*(void *)&self->_anon_38[160] + 528) != 0;
  }
  return WebKit::doesAppHaveTrackingPreventionEnabled((WebKit *)self);
}

- (BOOL)_resourceLoadStatisticsDebugMode
{
  return self->_anon_38[216];
}

- (void)_setResourceLoadStatisticsDebugMode:(BOOL)a3
{
}

- (void)_setPrivateClickMeasurementDebugModeEnabled:(BOOL)a3
{
}

- (BOOL)_storageSiteValidationEnabled
{
  return self->_anon_38[440];
}

- (void)_setStorageSiteValidationEnabled:(BOOL)a3
{
}

- (NSArray)_persistedSites
{
  WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::HashTable((uint64_t *)&v15, (uint64_t *)&self->_anon_38[448]);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v15) {
    uint64_t v3 = *((unsigned int *)v15 - 3);
  }
  else {
    uint64_t v3 = 0;
  }
  objc_super v4 = (void *)[v2 initWithCapacity:v3];
  char v5 = WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::begin((uint64_t *)&v15);
  int v6 = v5;
  uint64_t v8 = v7;
  if (v15) {
    uint64_t v9 = &v15[5 * *((unsigned int *)v15 - 1)];
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9 != v5)
  {
    do
    {
      [v4 addObject:WTF::URL::operator NSURL *()];
      while (1)
      {
        v6 += 5;
        if (v6 == v8) {
          break;
        }
        int v10 = WTF::HashTraitsEmptyValueChecker<WTF::HashTraits<WTF::URL>,false>::isEmptyValue<WTF::URL>(v6);
        if (*v6 == (WTF *)-1) {
          int v11 = 1;
        }
        else {
          int v11 = v10;
        }
        if (v11 != 1) {
          goto LABEL_16;
        }
      }
      int v6 = v8;
LABEL_16:
      ;
    }
    while (v6 != v9);
  }
  unint64_t v13 = (id)CFMakeCollectable(v4);
  if (v15) {
    WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::deallocateTable(v15, v12);
  }
  return v13;
}

- (void)_setPersistedSites:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(a3);
        }
        MEMORY[0x19972E8A0](&v12, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v13) {
          WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::add((uint64_t *)&v18, (uint64_t *)&v12, (uint64_t)&v11);
        }
        uint64_t v9 = v12;
        uint64_t v12 = 0;
        if (v9)
        {
          if (*(_DWORD *)v9 == 2) {
            WTF::StringImpl::destroy(v9, v8);
          }
          else {
            *(_DWORD *)v9 -= 2;
          }
        }
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }
  WebKit::WebsiteDataStore::setPersistedSiteURLs((uint64_t)&self->_websiteDataStore, (WTF::StringImpl *)&v18);
  if (v18) {
    WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::deallocateTable(v18, v10);
  }
}

- (unint64_t)_perOriginStorageQuota
{
  return 0;
}

- (NSString)_boundInterfaceIdentifier
{
  return 0;
}

- (BOOL)_allowsCellularAccess
{
  return 1;
}

- (BOOL)_allowsTLSFallback
{
  return 0;
}

- (NSDictionary)_proxyConfiguration
{
  return 0;
}

- (void)_setResourceLoadStatisticsTestingCallback:(id)a3
{
  uint64_t v4 = *(void *)&self->_websiteDataStore.data.__lx[24];
  if ((v4 & 0x8000000000000000) == 0 || v4 == -1)
  {
    if (a3)
    {
      uint64_t v5 = _Block_copy(a3);
      uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x18);
      void *v6 = &unk_1EE9C6D10;
      v6[1] = v5;
      v6[2] = self;
      uint64_t v7 = v6;
      WebKit::WebsiteDataStore::setStatisticsTestingCallback((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
      if (v7) {
        (*(void (**)(void *))(*v7 + 8))(v7);
      }
      _Block_release(0);
    }
    else
    {
      uint64_t v7 = 0;
      WebKit::WebsiteDataStore::setStatisticsTestingCallback((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
      if (v7) {
        (*(void (**)(void *))(*v7 + 8))(v7);
      }
    }
  }
}

- (void)_setStorageAccessPromptQuirkForTesting:(id)a3 withSubFrameDomains:(id)a4 withTriggerPages:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = *(void *)&self->_websiteDataStore.data.__lx[24];
  if ((v10 & 0x8000000000000000) == 0 || v10 == -1)
  {
    MEMORY[0x19972EAD0](&v21, a3);
    WTF::makeVector<WTF::String>(a4, (uint64_t)v20);
    WTF::makeVector<WTF::String>(a5, (uint64_t)v19);
    uint64_t v11 = _Block_copy(a6);
    uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v12 = &unk_1EE9C5C00;
    v12[1] = v11;
    long long v18 = v12;
    WebKit::WebsiteDataStore::setStorageAccessPromptQuirkForTesting((uint64_t)&self->_websiteDataStore, &v21, (uint64_t)v20, (uint64_t)v19, (uint64_t *)&v18);
    uint64_t v13 = (uint64_t)v18;
    long long v18 = 0;
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    _Block_release(0);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v14);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v15);
    long long v17 = v21;
    long long v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
}

- (void)_grantStorageAccessForTesting:(id)a3 withSubFrameDomains:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  if ((v8 & 0x8000000000000000) == 0 || v8 == -1)
  {
    MEMORY[0x19972EAD0](&v18, a3);
    WTF::makeVector<WTF::String>(a4, (uint64_t)v17);
    uint64_t v9 = _Block_copy(a5);
    uint64_t v10 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v10 = &unk_1EE9C5C00;
    v10[1] = v9;
    long long v16 = v10;
    WebKit::WebsiteDataStore::grantStorageAccessForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (WebCore::RegistrableDomain *)&v18, (uint64_t)v17, (uint64_t *)&v16);
    uint64_t v11 = (uint64_t)v16;
    long long v16 = 0;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    _Block_release(0);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v17, v12);
    long long v14 = v18;
    long long v18 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
  }
  else
  {
    long long v15 = (void (*)(id))*((void *)a5 + 2);
    v15(a5);
  }
}

- (void)_setResourceLoadStatisticsTimeAdvanceForTesting:(double)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5C00;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebsiteDataStore::setResourceLoadStatisticsTimeAdvanceForTesting((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v9, a3);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

+ (void)_allowWebsiteDataRecordsForAllOrigins
{
  WebKit::allowsWebsiteDataRecordsForAllOrigins = 1;
}

- (void)_loadedSubresourceDomainsFor:(id)a3 completionHandler:(id)a4
{
  if (a3)
  {
    [a3 _page];
    uint64_t v5 = v11;
    if (v11)
    {
      uint64_t v6 = _Block_copy(a4);
      uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v7 = &unk_1EE9C6D38;
      v7[1] = v6;
      uint64_t v10 = v7;
      char v12 = 0;
      WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetLoadedSubresourceDomains,WTF::CompletionHandler<void ()(WTF::Vector<WebCore::RegistrableDomain,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &&)>>(*(void *)(v5 + 256), (uint64_t)&v12, (uint64_t *)&v10, *(void *)(*(void *)(v5 + 32) + 1928), 0, 1);
      uint64_t v8 = (uint64_t)v10;
      uint64_t v10 = 0;
      if (v8) {
        (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
      }
      _Block_release(0);
    }
    else
    {
      (*((void (**)(id, void))a4 + 2))(a4, 0);
    }
  }
  else
  {
    uint64_t v9 = (void (*)(id, void))*((void *)a4 + 2);
    v9(a4, 0);
  }
}

- (void)_clearLoadedSubresourceDomainsFor:(id)a3
{
  if (a3)
  {
    [a3 _page];
    if (v3)
    {
      char v4 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ClearLoadedSubresourceDomains>(*(void *)(v3 + 256), (uint64_t)&v4, *(void *)(*(void *)(v3 + 32) + 1928), 0);
    }
  }
}

- (void)_scheduleCookieBlockingUpdate:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6D60;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::scheduleCookieBlockingUpdate((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_logUserInteraction:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C6D88;
  v7[1] = v6;
  uint64_t v11 = v7;
  WebKit::WebsiteDataStore::logUserInteraction((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  uint64_t v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)_setPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C6DB0;
  v7[1] = v6;
  uint64_t v11 = v7;
  WebKit::WebsiteDataStore::setPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  uint64_t v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)_getIsPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C6DD8;
  v7[1] = v6;
  uint64_t v11 = v7;
  WebKit::WebsiteDataStore::isPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  uint64_t v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)_clearPrevalentDomain:(id)a3 completionHandler:(id)a4
{
  MEMORY[0x19972E8A0](v12, a3);
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C6E00;
  v7[1] = v6;
  uint64_t v11 = v7;
  WebKit::WebsiteDataStore::clearPrevalentResource((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v12, (uint64_t *)&v11);
  uint64_t v8 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  uint64_t v10 = v12[0];
  v12[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (void)_clearResourceLoadStatistics:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6E28;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::scheduleClearInMemoryAndPersistent((uint64_t *)&self->_websiteDataStore, 0, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_closeDatabases:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6E50;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::closeDatabases((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_isRelationshipOnlyInDatabaseOnce:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x19972E8A0](v16, a4);
  MEMORY[0x19972E8A0](v15, a3);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C6EC8;
  v9[1] = v8;
  long long v14 = v9;
  WebKit::WebsiteDataStore::isRelationshipOnlyInDatabaseOnce((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v16, (const WTF::URL *)v15, (uint64_t *)&v14);
  uint64_t v10 = (uint64_t)v14;
  long long v14 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
  char v12 = v15[0];
  v15[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v11);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v16[0];
  v16[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_isRegisteredAsSubresourceUnderFirstParty:(id)a3 thirdParty:(id)a4 completionHandler:(id)a5
{
  MEMORY[0x19972E8A0](v16, a4);
  MEMORY[0x19972E8A0](v15, a3);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C6EF0;
  v9[1] = v8;
  long long v14 = v9;
  WebKit::WebsiteDataStore::isRegisteredAsSubresourceUnder((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (const WTF::URL *)v16, (const WTF::URL *)v15, (uint64_t *)&v14);
  uint64_t v10 = (uint64_t)v14;
  long long v14 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
  char v12 = v15[0];
  v15[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v11);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v16[0];
  v16[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v11);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_statisticsDatabaseHasAllTables:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6F18;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::statisticsDatabaseHasAllTables((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_processStatisticsAndDataRecords:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6F40;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::scheduleStatisticsAndDataRecordsProcessing((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_setThirdPartyCookieBlockingMode:(BOOL)a3 onlyOnSitesWithoutUserInteraction:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C6F68;
  v9[1] = v8;
  char v12 = v9;
  if (v5) {
    int v10 = 3;
  }
  else {
    int v10 = 0;
  }
  if (v6) {
    int v11 = v10;
  }
  else {
    int v11 = 4;
  }
  WebKit::WebsiteDataStore::setThirdPartyCookieBlockingMode((uint64_t)&self->_websiteDataStore, v11, (uint64_t *)&v12);
  if (v12) {
    (*(void (**)(void *))(*v12 + 8))(v12);
  }

  _Block_release(0);
}

- (void)_renameOrigin:(id)a3 to:(id)a4 forDataOfTypes:(id)a5 completionHandler:(id)a6
{
  v36[16] = *(WTF::StringImpl **)MEMORY[0x1E4F143B8];
  if ([a5 count])
  {
    if ((objc_msgSend(a5, "isSubsetOfSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"WKWebsiteDataTypeLocalStorage", @"WKWebsiteDataTypeIndexedDBDatabases", 0)) & 1) == 0)objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"_renameOrigin can only be called with WKWebsiteDataTypeLocalStorage and WKWebsiteDataTypeIndexedDBDatabases right now."); {
    MEMORY[0x19972E8A0](v36, a3);
    }
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness(v34, (WebCore::SecurityOriginData *)v36, v11);
    uint64_t v13 = v36[0];
    v36[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v12);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    MEMORY[0x19972E8A0](v36, a4);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness(v32, (WebCore::SecurityOriginData *)v36, v15);
    long long v17 = v36[0];
    v36[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v19 = [a5 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      int v20 = 0;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(a5);
          }
          unint64_t v23 = WebKit::toWebsiteDataType(*(WebKit **)(*((void *)&v28 + 1) + 8 * i), v18);
          if (v23 <= 0x100000000) {
            int v24 = 0;
          }
          else {
            int v24 = v23;
          }
          v20 |= v24;
        }
        uint64_t v19 = [a5 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }
    else
    {
      int v20 = 0;
    }
    long long v25 = _Block_copy(a6);
    long long v26 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)long long v26 = &unk_1EE9C6F90;
    *((void *)v26 + 1) = v25;
    v36[0] = v26;
    WebKit::WebsiteDataStore::renameOriginInWebsiteData((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t)v34, (uint64_t)v32, v20, (uint64_t *)v36);
    long long v27 = v36[0];
    v36[0] = 0;
    if (v27) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v27 + 8))(v27);
    }
    _Block_release(0);
    if (v33 != -1) {
      ((void (*)(WTF::StringImpl **, uint64_t *))off_1EE9C6980[v33])(v36, v32);
    }
    if (v35 != -1) {
      ((void (*)(WTF::StringImpl **, uint64_t *))off_1EE9C6980[v35])(v36, v34);
    }
  }
  else
  {
    long long v14 = (void (*)(id))*((void *)a6 + 2);
    v14(a6);
  }
}

- (BOOL)_networkProcessHasEntitlementForTesting:(id)a3
{
  p_websiteDataStore = &self->_websiteDataStore;
  MEMORY[0x19972EAD0](&v8, a3);
  char HasEntitlementForTesting = WebKit::WebsiteDataStore::networkProcessHasEntitlementForTesting((WebKit::WebsiteDataStore *)p_websiteDataStore, (const WTF::String *)&v8);
  BOOL v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return HasEntitlementForTesting;
}

- (void)_setUserAgentStringQuirkForTesting:(id)a3 withUserAgent:(id)a4 completionHandler:(id)a5
{
  int v7 = (int)self;
  MEMORY[0x19972EAD0](&v15, a3);
  MEMORY[0x19972EAD0](&v14, a4);
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C6FB8;
  v9[1] = v8;
  uint64_t v13 = v9;
  WebKit::WebsiteDataStore::setUserAgentStringQuirkForTesting(v7 + 8, (WebCore::RegistrableDomain *)&v15, &v14, (uint64_t *)&v13);
  if (v13) {
    (*(void (**)(void *))(*v13 + 8))(v13);
  }
  _Block_release(0);
  int v11 = v14;
  long long v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  char v12 = v15;
  long long v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
}

- (void)_setPrivateTokenIPCForTesting:(BOOL)a3
{
}

- (_WKWebsiteDataStoreDelegate)_delegate
{
  id WeakRetained = (_WKWebsiteDataStoreDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (_WKWebsiteDataStoreConfiguration)_configuration
{
  WebKit::WebsiteDataStoreConfiguration::copy(*(WebKit::WebsiteDataStoreConfiguration **)&self->_anon_38[160], (uint64_t)&v6);
  id v2 = *(const void **)(v6 + 8);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v6 + 8));
  }
  uint64_t v3 = (id)CFMakeCollectable(v2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4) {
    CFRelease(*(CFTypeRef *)(v4 + 8));
  }
  return v3;
}

+ (OpaqueWKNotificationManager)_sharedServiceWorkerNotificationManager
{
  return (OpaqueWKNotificationManager *)*((void *)WebKit::WebNotificationManagerProxy::sharedServiceWorkerManager((WebKit::WebNotificationManagerProxy *)a1)
                                        + 1);
}

- (void)_trustServerForLocalPCMTesting:(__SecTrust *)a3
{
  p_websiteDataStore = &self->_websiteDataStore;
  if (a3)
  {
    BOOL v5 = a3;
    uint64_t v6 = p_websiteDataStore;
    CFRetain(a3);
    a3 = v5;
    p_websiteDataStore = v6;
  }
  int v7 = a3;
  WebKit::WebsiteDataStore::allowTLSCertificateChainForLocalPCMTesting((WebKit::WebsiteDataStore *)p_websiteDataStore, (const WebCore::CertificateInfo *)&v7);
  uint64_t v4 = v7;
  int v7 = 0;
  if (v4) {
    CFRelease(v4);
  }
}

- (void)_setPrivateClickMeasurementDebugModeEnabledForTesting:(BOOL)a3
{
}

- (void)_appBoundDomains:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7140;
  v5[1] = v4;
  uint64_t v6 = v5;
  WebKit::WebsiteDataStore::getAppBoundDomains((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (void)_appBoundSchemes:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7168;
  v5[1] = v4;
  uint64_t v6 = v5;
  WebKit::WebsiteDataStore::getAppBoundSchemes((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (void)_terminateNetworkProcess
{
}

- (void)_sendNetworkProcessPrepareToSuspend:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7190;
  v5[1] = v4;
  int v7 = v5;
  WebKit::WebsiteDataStore::sendNetworkProcessPrepareToSuspendForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_sendNetworkProcessWillSuspendImminently
{
}

- (void)_sendNetworkProcessDidResume
{
}

- (void)_synthesizeAppIsBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (WebKit::NetworkProcessProxy *)WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);

  WebKit::NetworkProcessProxy::synthesizeAppIsBackground(v4, v3);
}

- (int)_networkProcessIdentifier
{
  uint64_t v2 = *(void *)(WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore) + 136);
  if (v2) {
    return *(_DWORD *)(v2 + 108);
  }
  else {
    return 0;
  }
}

+ (void)_makeNextNetworkProcessLaunchFailForTesting
{
  WebKit::nextNetworkProcessLaunchShouldFailForTesting = 1;
}

+ (void)_setNetworkProcessSuspensionAllowedForTesting:(BOOL)a3
{
  WebKit::s_suspensionAllowedForTesting = a3;
}

- (BOOL)_networkProcessExists
{
  return *(void *)&self->_anon_38[352] != 0;
}

+ (BOOL)_defaultNetworkProcessExists
{
  {
    return WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess
        && *(void *)(WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess + 8) != 0;
  }
  else
  {
    BOOL result = 0;
    WebKit::NetworkProcessProxy::defaultNetworkProcess(void)::networkProcess = 0;
  }
  return result;
}

- (void)_countNonDefaultSessionSets:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  BOOL v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C71B8;
  v5[1] = v4;
  int v7 = v5;
  WebKit::WebsiteDataStore::countNonDefaultSessionSets((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (BOOL)_hasServiceWorkerBackgroundActivityForTesting
{
  return WebKit::WebsiteDataStore::hasServiceWorkerBackgroundActivityForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
}

- (void)_getPendingPushMessage:(id)a3
{
  BOOL v5 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Getting pending push message", buf, 2u);
  }
  uint64_t v6 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v7 = *(void *)&self->_websiteDataStore.data.__lx[24];
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C71E0;
  v9[1] = v8;
  *(void *)buf = v7;
  int v11 = v9;
  char v12 = buf;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::GetPendingPushMessage,WTF::CompletionHandler<void ()(std::optional<WebKit::WebPushMessage> const&)>>(v6, (uint64_t **)&v12, (uint64_t *)&v11, 0, 0, 1);
  uint64_t v10 = (uint64_t)v11;
  int v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
}

- (void)_getPendingPushMessages:(id)a3
{
  BOOL v5 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "Getting pending push messages", buf, 2u);
  }
  uint64_t v6 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v7 = *(void *)&self->_websiteDataStore.data.__lx[24];
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C7208;
  v9[1] = v8;
  *(void *)buf = v7;
  int v11 = v9;
  char v12 = buf;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::GetPendingPushMessages,WTF::CompletionHandler<void ()(WTF::Vector<WebKit::WebPushMessage,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)>>(v6, (uint64_t **)&v12, (uint64_t *)&v11, 0, 0, 1);
  uint64_t v10 = (uint64_t)v11;
  int v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
}

- (void)_processPushMessage:(id)a3 completionHandler:(id)a4
{
  WebKit::WebPushMessage::fromDictionary((WebKit::WebPushMessage *)a3, v12);
  if (v12[216])
  {
    uint64_t v6 = _Block_copy(a4);
    uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C7230;
    v7[1] = v6;
    v11[0] = (uint64_t)v7;
    WebKit::WebsiteDataStore::processPushMessage((uint64_t)&self->_websiteDataStore, (uint64_t)v12, v11);
    uint64_t v8 = v11[0];
    v11[0] = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v10 = qword_1EB3583C0;
    if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_1985F2000, v10, OS_LOG_TYPE_ERROR, "Asked to handle an invalid push message", (uint8_t *)v11, 2u);
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  std::__optional_destruct_base<WebKit::WebPushMessage,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v12, v9);
}

- (void)_processWebCorePersistentNotificationClick:(const void *)a3 completionHandler:(id)a4
{
  v17[33] = *MEMORY[0x1E4F143B8];
  WebCore::NotificationData::NotificationData((WebCore::NotificationData *)v17, (const WebCore::NotificationData *)a3);
  if (v17[0] && *(_DWORD *)(v17[0] + 4) && *(unsigned char *)(*(void *)&self->_anon_38[160] + 475))
  {
    uint64_t v6 = qword_1EB3583C0;
    if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "Sending persistent notification clicked with default action URL. Requesting navigation to it now.", buf, 2u);
    }
    (*(void (**)(void, void *))(**(void **)&self->_anon_38[336] + 88))(*(void *)&self->_anon_38[336], v17);
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
  else
  {
    uint64_t v8 = qword_1EB3583C0;
    if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
    {
      WTF::String::utf8();
      uint64_t v9 = v15 ? (uint64_t)v15 + 16 : 0;
      *(_DWORD *)buf = 136642819;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "Sending persistent notification click from origin %{sensitive}s to network process to handle", buf, 0xCu);
      if (v15)
      {
        if (*(_DWORD *)v15 == 1) {
          WTF::fastFree(v15, v10);
        }
        else {
          --*(_DWORD *)v15;
        }
      }
    }
    v17[26] = *(void *)&self->_websiteDataStore.data.__lx[24];
    uint64_t v11 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
    char v12 = _Block_copy(a4);
    uint64_t v13 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v13 = &unk_1EE9C7258;
    v13[1] = v12;
    *(void *)buf = v13;
    WebKit::NetworkProcessProxy::processNotificationEvent(v11, (uint64_t)v17, 0, (uint64_t *)buf);
    uint64_t v14 = *(void *)buf;
    *(void *)buf = 0;
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
    }
    _Block_release(0);
  }
  WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v17, v7);
}

- (void)_processPersistentNotificationClick:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WebCore::NotificationData::fromDictionary(v9, (WebCore::NotificationData *)a3, (NSDictionary *)a2);
  if (v10)
  {
    [(WKWebsiteDataStore *)self _processWebCorePersistentNotificationClick:v9 completionHandler:a4];
  }
  else
  {
    uint64_t v7 = qword_1EB3583C0;
    if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1985F2000, v7, OS_LOG_TYPE_ERROR, "Asked to handle a persistent notification click with an invalid notification dictionary representation", v8, 2u);
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  if (v10) {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v9, v6);
  }
}

- (void)_processWebCorePersistentNotificationClose:(const void *)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_DEFAULT))
  {
    WTF::String::utf8();
    uint64_t v8 = v14 ? (uint64_t)v14 + 16 : 0;
    *(_DWORD *)buf = 136642819;
    *(void *)&buf[4] = v8;
    _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Sending persistent notification close from origin %{sensitive}s to network process to handle", buf, 0xCu);
    if (v14)
    {
      if (*(_DWORD *)v14 == 1) {
        WTF::fastFree(v14, v9);
      }
      else {
        --*(_DWORD *)v14;
      }
    }
  }
  uint64_t v10 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v11 = _Block_copy(a4);
  char v12 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v12 = &unk_1EE9C7280;
  v12[1] = v11;
  *(void *)buf = v12;
  WebKit::NetworkProcessProxy::processNotificationEvent(v10, (uint64_t)a3, 1, (uint64_t *)buf);
  uint64_t v13 = *(void *)buf;
  *(void *)buf = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  _Block_release(0);
}

- (void)_processPersistentNotificationClose:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WebCore::NotificationData::fromDictionary(v9, (WebCore::NotificationData *)a3, (NSDictionary *)a2);
  if (v10)
  {
    [(WKWebsiteDataStore *)self _processWebCorePersistentNotificationClose:v9 completionHandler:a4];
  }
  else
  {
    uint64_t v7 = qword_1EB3583C0;
    if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_error_impl(&dword_1985F2000, v7, OS_LOG_TYPE_ERROR, "Asked to handle a persistent notification click with an invalid notification dictionary representation", v8, 2u);
    }
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  if (v10) {
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)v9, v6);
  }
}

- (void)_getAllBackgroundFetchIdentifiers:(id)a3
{
  uint64_t v5 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v6 = *(void *)&self->_websiteDataStore.data.__lx[24];
  uint64_t v7 = _Block_copy(a3);
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v8 = &unk_1EE9C72A8;
  v8[1] = v7;
  char v10 = v8;
  WebKit::NetworkProcessProxy::getAllBackgroundFetchIdentifiers(v5, v6, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  char v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)_getBackgroundFetchState:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v9 = _Block_copy(a4);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C72D0;
  v10[1] = v9;
  uint64_t v14 = v10;
  WebKit::NetworkProcessProxy::getBackgroundFetchState(v7, v8, (uint64_t *)&v15, (uint64_t *)&v14);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15;
  long long v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_abortBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = a4;
  if (!a4)
  {
    uint64_t v4 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___abortBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___abortBackgroundFetch_completionHandler__E4__55_e5_v8__0l;
  }
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v9 = _Block_copy(v4);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C72F8;
  v10[1] = v9;
  uint64_t v14 = v10;
  uint64_t v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::AbortBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15;
  long long v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_pauseBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = a4;
  if (!a4)
  {
    uint64_t v4 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___pauseBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___pauseBackgroundFetch_completionHandler__E4__57_e5_v8__0l;
  }
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v9 = _Block_copy(v4);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C7320;
  v10[1] = v9;
  uint64_t v14 = v10;
  uint64_t v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::PauseBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15;
  long long v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_resumeBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = a4;
  if (!a4)
  {
    uint64_t v4 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    v16[2] = __74__WKWebsiteDataStore_WKPrivate___resumeBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c88_ZTSKZ74__WKWebsiteDataStore_WKPrivate___resumeBackgroundFetch_completionHandler__E4__59_e5_v8__0l;
  }
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v9 = _Block_copy(v4);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C7348;
  v10[1] = v9;
  uint64_t v14 = v10;
  uint64_t v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::ResumeBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15;
  long long v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_clickBackgroundFetch:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = a4;
  if (!a4)
  {
    uint64_t v4 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    v16[2] = __73__WKWebsiteDataStore_WKPrivate___clickBackgroundFetch_completionHandler___block_invoke;
    v16[3] = &__block_descriptor_33_e8_32c87_ZTSKZ73__WKWebsiteDataStore_WKPrivate___clickBackgroundFetch_completionHandler__E4__61_e5_v8__0l;
  }
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972EAD0](&v15, a3);
  uint64_t v9 = _Block_copy(v4);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C7370;
  v10[1] = v9;
  uint64_t v14 = v10;
  uint64_t v18 = v8;
  v17[0] = &v18;
  v17[1] = (uint64_t *)&v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::ClickBackgroundFetch,WTF::CompletionHandler<void ()(void)>>(v7, v17, (uint64_t *)&v14, 0, 0, 1);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15;
  long long v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_storeServiceWorkerRegistrations:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7398;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::storeServiceWorkerRegistrations((uint64_t *)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_setServiceWorkerOverridePreferences:(id)a3
{
  if (a3) {
    uint64_t v4 = (char *)a3 + 8;
  }
  else {
    uint64_t v4 = 0;
  }
  if (a3) {
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  uint64_t v5 = *(void *)&self->_anon_38[384];
  *(void *)&self->_anon_38[384] = v4;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)_scopeURL:(id)a3 hasPushSubscriptionForTesting:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = WebKit::WebsiteDataStore::networkProcess((WebKit::WebsiteDataStore *)&self->_websiteDataStore);
  uint64_t v8 = *(void *)&self->_websiteDataStore.data.__lx[24];
  MEMORY[0x19972E8A0](v15, a3);
  uint64_t v9 = _Block_copy(v6);
  char v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v10 = &unk_1EE9C73C0;
  v10[1] = v9;
  uint64_t v14 = v10;
  uint64_t v17 = v8;
  v16[0] = &v17;
  v16[1] = (uint64_t *)v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::NetworkProcess::HasPushSubscriptionForTesting,WTF::CompletionHandler<void ()(BOOL)>>(v7, v16, (uint64_t *)&v14, 0, 0, 1);
  uint64_t v11 = (uint64_t)v14;
  uint64_t v14 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v15[0];
  v15[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  _Block_release(v6);
}

- (void)_originDirectoryForTesting:(id)a3 topOrigin:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = WebKit::toWebsiteDataType((WebKit *)a5, (NSString *)a2);
  if (HIDWORD(v10))
  {
    int v12 = v10;
    uint64_t v13 = _Block_copy(a6);
    MEMORY[0x19972E8A0](v23, a4);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness(v24, (WebCore::SecurityOriginData *)v23, v14);
    MEMORY[0x19972E8A0](v22, a3);
    WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness(v26, (WebCore::SecurityOriginData *)v22, v15);
    uint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v16 = &unk_1EE9C73E8;
    v16[1] = v13;
    uint64_t v21 = v16;
    WebKit::WebsiteDataStore::originDirectoryForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t)v24, v12, (uint64_t *)&v21);
    uint64_t v17 = (uint64_t)v21;
    uint64_t v21 = 0;
    if (v17) {
      (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    }
    _Block_release(0);
    if (v27 != -1) {
      ((void (*)(void **, uint64_t *))off_1EE9C6980[v27])(&v21, v26);
    }
    int v27 = -1;
    if (v25 != -1) {
      ((void (*)(void **, uint64_t *))off_1EE9C6980[v25])(&v21, v24);
    }
    int v25 = -1;
    uint64_t v19 = v22[0];
    v22[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2) {
        WTF::StringImpl::destroy(v19, v18);
      }
      else {
        *(_DWORD *)v19 -= 2;
      }
    }
    int v20 = v23[0];
    v23[0] = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2) {
        WTF::StringImpl::destroy(v20, v18);
      }
      else {
        *(_DWORD *)v20 -= 2;
      }
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v11 = (void (*)(id, void))*((void *)a6 + 2);
    v11(a6, 0);
  }
}

- (void)_setBackupExclusionPeriodForTesting:(double)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C7410;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebsiteDataStore::setBackupExclusionPeriodForTesting((WebKit::WebsiteDataStore *)&self->_websiteDataStore, (uint64_t *)&v9, a3);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (NSString)_webPushPartition
{
  if (*(void *)(*(void *)&self->_anon_38[160] + 496)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_setCompletionHandlerForRemovalFromNetworkProcess:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7438;
  v5[1] = v4;
  uint64_t v6 = v5;
  WebKit::WebsiteDataStore::setCompletionHandlerForRemovalFromNetworkProcess((uint64_t)&self->_websiteDataStore, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (void)_setRestrictedOpenerTypeForTesting:(unsigned __int8)a3 forDomain:(id)a4
{
  MEMORY[0x19972EAD0](&v10, a4);
  uint64_t v6 = v10;
  if (v10 && *((_DWORD *)v10 + 1))
  {
    unint64_t v10 = 0;
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    uint64_t v6 = v11[1];
  }
  v11[0] = v6;
  WebKit::WebsiteDataStore::setRestrictedOpenerTypeForDomainForTesting((uint64_t)&self->_websiteDataStore, v11, a3);
  uint64_t v8 = v11[0];
  v11[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  uint64_t v9 = v10;
  unint64_t v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v7);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
}

- (void)_getAppBadgeForTesting:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C7460;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebsiteDataStore::getAppBadgeForTesting((uint64_t)&self->_websiteDataStore, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

+ (void)_setWebPushActionHandler:(id)a3
{
  if (+[WKWebsiteDataStore(WKPrivate) _setWebPushActionHandler:]::once != -1) {
    dispatch_once(&+[WKWebsiteDataStore(WKPrivate) _setWebPushActionHandler:]::once, &__block_literal_global_959);
  }
  id v4 = +[_WKWebsiteDataStoreBSActionHandler shared];

  [v4 setWebPushActionHandler:a3];
}

uint64_t __58__WKWebsiteDataStore_WKPrivate___setWebPushActionHandler___block_invoke()
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "_registerBSActionHandler:", +[_WKWebsiteDataStoreBSActionHandler shared](_WKWebsiteDataStoreBSActionHandler, "shared"));
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F44680], "currentNotificationCenter"), "delegate");
  if (!result)
  {
    if (byte_1EB35983A == 1)
    {
      uint64_t v1 = (_WKWebsiteDataStoreNotificationCenterDelegate *)qword_1EB359860;
    }
    else
    {
      uint64_t v1 = objc_alloc_init(_WKWebsiteDataStoreNotificationCenterDelegate);
      qword_1EB359860 = (uint64_t)v1;
      byte_1EB35983A = 1;
    }
    uint64_t v2 = (void *)[MEMORY[0x1E4F44680] currentNotificationCenter];
    return [v2 setDelegate:v1];
  }
  return result;
}

+ (BOOL)handleNotificationResponse:(id)a3
{
  id v4 = +[_WKWebsiteDataStoreBSActionHandler shared];

  return [v4 handleNotificationResponse:a3];
}

- (void)_handleNextPushMessageWithCompletionHandler:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__WKWebsiteDataStore_WKPrivate___handleNextPushMessageWithCompletionHandler___block_invoke;
  v3[3] = &unk_1E5812450;
  v3[4] = self;
  v3[5] = a3;
  [(WKWebsiteDataStore *)self _getPendingPushMessage:v3];
}

uint64_t __77__WKWebsiteDataStore_WKPrivate___handleNextPushMessageWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __77__WKWebsiteDataStore_WKPrivate___handleNextPushMessageWithCompletionHandler___block_invoke_2;
    v4[3] = &unk_1E5812428;
    return [*(id *)(a1 + 32) _processPushMessage:a2 completionHandler:v4];
  }
  else
  {
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
}

uint64_t __77__WKWebsiteDataStore_WKPrivate___handleNextPushMessageWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNextPushMessageWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_handleWebPushAction:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 beginBackgroundTaskForHandling];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  uint64_t v13 = __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke;
  uint64_t v14 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v15 = v5;
  if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"_WKWebPushActionTypePushEvent"))
  {
    [(WKWebsiteDataStore *)self _handleNextPushMessageWithCompletionHandler:v12];
    return;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"_WKWebPushActionTypeNotificationClick"))
  {
    if (a3 && ([a3 coreNotificationData], v18))
    {
      WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)buf, v6);
      [a3 coreNotificationData];
      if (v18)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        uint64_t v11[2] = __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke_2;
        v11[3] = &unk_1E5812478;
        v11[4] = v12;
        [(WKWebsiteDataStore *)self _processWebCorePersistentNotificationClick:buf completionHandler:v11];
        goto LABEL_13;
      }
    }
    else
    {
      __break(0xC471u);
    }
    goto LABEL_20;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"_WKWebPushActionTypeNotificationClose"))
  {
    if (!a3) {
      goto LABEL_21;
    }
    [a3 coreNotificationData];
    if (!v18) {
      goto LABEL_21;
    }
    WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)buf, v8);
    [a3 coreNotificationData];
    if (v18)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke_3;
      v10[3] = &unk_1E5812478;
      v10[4] = v12;
      [(WKWebsiteDataStore *)self _processWebCorePersistentNotificationClose:buf completionHandler:v10];
LABEL_13:
      if (v18) {
        WebCore::NotificationData::~NotificationData((WebCore::NotificationData *)buf, v7);
      }
      return;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    __break(0xC471u);
    return;
  }
  uint64_t v9 = qword_1EB3583C0;
  if (os_log_type_enabled((os_log_t)qword_1EB3583C0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = a3;
    _os_log_error_impl(&dword_1985F2000, v9, OS_LOG_TYPE_ERROR, "Unhandled webPushAction: %@", buf, 0xCu);
  }
  v13((uint64_t)v12);
}

uint64_t __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 endBackgroundTask:v3];
}

uint64_t __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__WKWebsiteDataStore_WKPrivate___handleWebPushAction___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 modifiedSince:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(const void *)a1 modifiedSince:completionHandler:
{
  *a1 = &unk_1EE9C6C48;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)removeDataOfTypes:(uint64_t)a1 forDataRecords:completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)removeDataOfTypes:(const void *)a1 forDataRecords:completionHandler:
{
  *a1 = &unk_1EE9C6C70;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end