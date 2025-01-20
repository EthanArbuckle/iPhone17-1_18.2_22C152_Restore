@interface _WKWebsiteDataStoreConfiguration
- (BOOL)_shouldAcceptInsecureCertificatesForWebSockets;
- (BOOL)allLoadsBlockedByDeviceManagementRestrictionsForTesting;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsHSTSWithUntrustedRootCertificate;
- (BOOL)allowsServerPreconnect;
- (BOOL)deviceManagementRestrictionsEnabled;
- (BOOL)enableInAppBrowserPrivacyForTesting;
- (BOOL)fastServerTrustEvaluationEnabled;
- (BOOL)isDeclarativeWebPushEnabled;
- (BOOL)isPersistent;
- (BOOL)legacyTLSEnabled;
- (BOOL)networkCacheSpeculativeValidationEnabled;
- (BOOL)preventsSystemHTTPProxyAuthentication;
- (BOOL)requiresSecureHTTPSProxyConnection;
- (BOOL)resourceLoadStatisticsDebugModeEnabled;
- (BOOL)serviceWorkerProcessTerminationDelayEnabled;
- (BOOL)shouldRunServiceWorkersOnMainThreadForTesting;
- (BOOL)suppressesConnectionTerminationOnSystemChange;
- (NSDictionary)proxyConfiguration;
- (NSNumber)defaultTrackingPreventionEnabledOverride;
- (NSNumber)originQuotaRatio;
- (NSNumber)standardVolumeCapacity;
- (NSNumber)totalQuotaRatio;
- (NSNumber)volumeCapacityOverride;
- (NSString)applicationCacheFlatFileSubdirectoryName;
- (NSString)boundInterfaceIdentifier;
- (NSString)dataConnectionServiceType;
- (NSString)pcmMachServiceName;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSString)webPushMachServiceName;
- (NSString)webPushPartitionString;
- (NSURL)_cacheStorageDirectory;
- (NSURL)_cookieStorageFile;
- (NSURL)_indexedDBDatabaseDirectory;
- (NSURL)_resourceLoadStatisticsDirectory;
- (NSURL)_serviceWorkerRegistrationDirectory;
- (NSURL)_webSQLDatabaseDirectory;
- (NSURL)_webStorageDirectory;
- (NSURL)alternativeServicesStorageDirectory;
- (NSURL)applicationCacheDirectory;
- (NSURL)deviceIdHashSaltsStorageDirectory;
- (NSURL)generalStorageDirectory;
- (NSURL)hstsStorageDirectory;
- (NSURL)httpProxy;
- (NSURL)httpsProxy;
- (NSURL)mediaCacheDirectory;
- (NSURL)mediaKeysStorageDirectory;
- (NSURL)networkCacheDirectory;
- (NSURL)standaloneApplicationURL;
- (NSUUID)identifier;
- (Object)_apiObject;
- (_WKWebsiteDataStoreConfiguration)init;
- (_WKWebsiteDataStoreConfiguration)initWithDirectory:(id)a3;
- (_WKWebsiteDataStoreConfiguration)initWithIdentifier:(id)a3;
- (id)initNonPersistentConfiguration;
- (int64_t)unifiedOriginStorageLevel;
- (unint64_t)overrideServiceWorkerRegistrationCountTestingValue;
- (unint64_t)perOriginStorageQuota;
- (unint64_t)testSpeedMultiplier;
- (void)_setCacheStorageDirectory:(id)a3;
- (void)_setCookieStorageFile:(id)a3;
- (void)_setIndexedDBDatabaseDirectory:(id)a3;
- (void)_setResourceLoadStatisticsDirectory:(id)a3;
- (void)_setServiceWorkerRegistrationDirectory:(id)a3;
- (void)_setWebSQLDatabaseDirectory:(id)a3;
- (void)_setWebStorageDirectory:(id)a3;
- (void)dealloc;
- (void)setAllLoadsBlockedByDeviceManagementRestrictionsForTesting:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsHSTSWithUntrustedRootCertificate:(BOOL)a3;
- (void)setAllowsServerPreconnect:(BOOL)a3;
- (void)setAlternativeServicesStorageDirectory:(id)a3;
- (void)setApplicationCacheDirectory:(id)a3;
- (void)setApplicationCacheFlatFileSubdirectoryName:(id)a3;
- (void)setBoundInterfaceIdentifier:(id)a3;
- (void)setDataConnectionServiceType:(id)a3;
- (void)setDefaultTrackingPreventionEnabledOverride:(id)a3;
- (void)setDeviceIdHashSaltsStorageDirectory:(id)a3;
- (void)setDeviceManagementRestrictionsEnabled:(BOOL)a3;
- (void)setEnableInAppBrowserPrivacyForTesting:(BOOL)a3;
- (void)setFastServerTrustEvaluationEnabled:(BOOL)a3;
- (void)setGeneralStorageDirectory:(id)a3;
- (void)setHSTSStorageDirectory:(id)a3;
- (void)setHTTPProxy:(id)a3;
- (void)setHTTPSProxy:(id)a3;
- (void)setIsDeclarativeWebPushEnabled:(BOOL)a3;
- (void)setLegacyTLSEnabled:(BOOL)a3;
- (void)setMediaCacheDirectory:(id)a3;
- (void)setMediaKeysStorageDirectory:(id)a3;
- (void)setNetworkCacheDirectory:(id)a3;
- (void)setNetworkCacheSpeculativeValidationEnabled:(BOOL)a3;
- (void)setOriginQuotaRatio:(id)a3;
- (void)setOverrideServiceWorkerRegistrationCountTestingValue:(unint64_t)a3;
- (void)setPCMMachServiceName:(id)a3;
- (void)setPerOriginStorageQuota:(unint64_t)a3;
- (void)setPreventsSystemHTTPProxyAuthentication:(BOOL)a3;
- (void)setProxyConfiguration:(id)a3;
- (void)setRequiresSecureHTTPSProxyConnection:(BOOL)a3;
- (void)setResourceLoadStatisticsDebugModeEnabled:(BOOL)a3;
- (void)setServiceWorkerProcessTerminationDelayEnabled:(BOOL)a3;
- (void)setShouldRunServiceWorkersOnMainThreadForTesting:(BOOL)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setStandaloneApplicationURL:(id)a3;
- (void)setStandardVolumeCapacity:(id)a3;
- (void)setSuppressesConnectionTerminationOnSystemChange:(BOOL)a3;
- (void)setTestSpeedMultiplier:(unint64_t)a3;
- (void)setTotalQuotaRatio:(id)a3;
- (void)setUnifiedOriginStorageLevel:(int64_t)a3;
- (void)setVolumeCapacityOverride:(id)a3;
- (void)setWebPushMachServiceName:(id)a3;
- (void)setWebPushPartitionString:(id)a3;
@end

@implementation _WKWebsiteDataStoreConfiguration

- (void)setNetworkCacheSpeculativeValidationEnabled:(BOOL)a3
{
  self[4]._configuration.data.__lx[32] = a3;
}

- (void)setFastServerTrustEvaluationEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[28] = a3;
}

- (_WKWebsiteDataStoreConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  v2 = [(_WKWebsiteDataStoreConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    *(void *)(WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((uint64_t)[(_WKWebsiteDataStoreConfiguration *)v2 _apiObject], 1, 1)+ 8) = v2;
  }
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_configuration;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(void))self->_configuration.data.__lx)();
    v4.receiver = self;
    v4.super_class = (Class)_WKWebsiteDataStoreConfiguration;
    [(_WKWebsiteDataStoreConfiguration *)&v4 dealloc];
  }
}

- (BOOL)isPersistent
{
  return self->_configuration.data.__lx[16];
}

- (id)initNonPersistentConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  v2 = [(_WKWebsiteDataStoreConfiguration *)&v5 init];
  v3 = v2;
  if (v2) {
    *(void *)(WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((uint64_t)[(_WKWebsiteDataStoreConfiguration *)v2 _apiObject], 0, 1)+ 8) = v2;
  }
  return v3;
}

- (_WKWebsiteDataStoreConfiguration)initWithIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  objc_super v5 = [(_WKWebsiteDataStoreConfiguration *)&v14 init];
  if (v5)
  {
    if (!a3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Identifier is nil"];
    }
    WTF::UUID::fromNSUUID((uint64_t *)&v15, (WTF::UUID *)a3, v4);
    if (!v16 || v15 <= 1)
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      MEMORY[0x19972EAD0](&v12, [a3 UUIDString]);
      WTF::String::utf8();
      if (v13) {
        v7 = (char *)v13 + 16;
      }
      else {
        v7 = 0;
      }
      objc_msgSend(v6, "raise:format:", *MEMORY[0x1E4F1C3C8], @"Identifier (%s) is invalid for data store", v7);
      v9 = v13;
      v13 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 1) {
          WTF::fastFree(v9, v8);
        }
        else {
          --*(_DWORD *)v9;
        }
      }
      v10 = v12;
      v12 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, (WTF::StringImpl *)v8);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      if (!v16) {
        __break(1u);
      }
    }
    *((void *)WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((WebKit::WebsiteDataStoreConfiguration *)[(_WKWebsiteDataStoreConfiguration *)v5 _apiObject], (const WTF::UUID *)&v15)+ 1) = v5;
  }
  return v5;
}

- (_WKWebsiteDataStoreConfiguration)initWithDirectory:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_WKWebsiteDataStoreConfiguration;
  objc_super v4 = [(_WKWebsiteDataStoreConfiguration *)&v11 init];
  if (v4)
  {
    if (!a3) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Directory is nil"];
    }
    uint64_t v5 = [a3 path];
    v6 = [(_WKWebsiteDataStoreConfiguration *)v4 _apiObject];
    MEMORY[0x19972EAD0](&v13, v5);
    MEMORY[0x19972EAD0](&v12, v5);
    WebKit::WebsiteDataStoreConfiguration::WebsiteDataStoreConfiguration((WebKit::WebsiteDataStoreConfiguration *)v6, (const WTF::String *)&v13, (const WTF::String *)&v12);
    v8 = v12;
    v12 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    v6->var1 = v4;
  }
  return v4;
}

- (NSURL)_webStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[2]._configuration.data.__lx[16]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setWebStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _webStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _webStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[16];
  *(void *)&self[2]._configuration.data.__lx[16] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_indexedDBDatabaseDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)self[2]._configuration.data.__lx) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setIndexedDBDatabaseDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _indexedDBDatabaseDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _indexedDBDatabaseDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[2]._configuration.data.__lx;
  *(void *)self[2]._configuration.data.__lx = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)networkCacheDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[2]._configuration.data.__lx[40]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setNetworkCacheDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set networkCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set networkCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[40];
  *(void *)&self[2]._configuration.data.__lx[40] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)deviceIdHashSaltsStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[1]._configuration.data.__lx[40]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setDeviceIdHashSaltsStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set deviceIdHashSaltsStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set deviceIdHashSaltsStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[40];
  *(void *)&self[1]._configuration.data.__lx[40] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_webSQLDatabaseDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[3]._configuration.data.__lx[8]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setWebSQLDatabaseDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _webSQLDatabaseDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _webSQLDatabaseDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[3]._configuration.data.__lx[8];
  *(void *)&self[3]._configuration.data.__lx[8] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)httpProxy
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setHTTPProxy:(id)a3
{
  MEMORY[0x19972E8A0](v6, a3);
  WTF::URL::operator=((uint64_t)&self[5]._configuration.data.__lx[8], (uint64_t)v6);
  uint64_t v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSURL)httpsProxy
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setHTTPSProxy:(id)a3
{
  MEMORY[0x19972E8A0](v6, a3);
  WTF::URL::operator=((uint64_t)&self[6], (uint64_t)v6);
  uint64_t v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSURL)_cookieStorageFile
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[1]._configuration.data.__lx[32]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:0];
}

- (void)_setCookieStorageFile:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _cookieStorageFile on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _cookieStorageFile on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3 && ([a3 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
  }
  if ([a3 hasDirectoryPath]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The cookie storage path must point to a file, not a directory." format];
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[32];
  *(void *)&self[1]._configuration.data.__lx[32] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_resourceLoadStatisticsDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (self[3].super.isa) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setResourceLoadStatisticsDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _resourceLoadStatisticsDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _resourceLoadStatisticsDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  Class isa = self[3].super.isa;
  self[3].super.Class isa = v6;
  if (isa)
  {
    int v8 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v5);
      Class isa = v10;
      v10 = 0;
      if (!isa) {
        return;
      }
      int v8 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v9);
        return;
      }
    }
    *(_DWORD *)Class isa = v8;
  }
}

- (NSURL)_cacheStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[1]._configuration.data.__lx[24]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setCacheStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _cacheStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _cacheStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[24];
  *(void *)&self[1]._configuration.data.__lx[24] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (NSURL)_serviceWorkerRegistrationDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)self[3]._configuration.data.__lx) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setServiceWorkerRegistrationDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set _serviceWorkerRegistrationDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set _serviceWorkerRegistrationDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  v7 = *(WTF::StringImpl **)self[3]._configuration.data.__lx;
  *(void *)self[3]._configuration.data.__lx = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)v7 = v8;
  }
}

- (BOOL)serviceWorkerProcessTerminationDelayEnabled
{
  return self[6]._configuration.data.__lx[29];
}

- (void)setServiceWorkerProcessTerminationDelayEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[29] = a3;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  uint64_t v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[4]._configuration.data.__lx[40];
  *(void *)&self[4]._configuration.data.__lx[40] = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (NSString)sourceApplicationBundleIdentifier
{
  if (*(void *)&self[4]._configuration.data.__lx[40]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  if (self[5].super.isa) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setSourceApplicationSecondaryIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  uint64_t v5 = v9;
  v9 = 0;
  Class isa = self[5].super.isa;
  self[5].super.Class isa = v5;
  if (isa)
  {
    int v7 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v4);
      Class isa = v9;
      v9 = 0;
      if (!isa) {
        return;
      }
      int v7 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v8);
        return;
      }
    }
    *(_DWORD *)Class isa = v7;
  }
}

- (NSURL)applicationCacheDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[1]._configuration.data.__lx[8]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setApplicationCacheDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set applicationCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set applicationCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[8];
  *(void *)&self[1]._configuration.data.__lx[8] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSString)applicationCacheFlatFileSubdirectoryName
{
  if (*(void *)self[1]._configuration.data.__lx) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setApplicationCacheFlatFileSubdirectoryName:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set applicationCacheFlatFileSubdirectoryName on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set applicationCacheFlatFileSubdirectoryName on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  MEMORY[0x19972EAD0](&v10, a3);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)self[1]._configuration.data.__lx;
  *(void *)self[1]._configuration.data.__lx = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSURL)mediaCacheDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[2]._configuration.data.__lx[24]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setMediaCacheDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set mediaCacheDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set mediaCacheDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[24];
  *(void *)&self[2]._configuration.data.__lx[24] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSURL)mediaKeysStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[2]._configuration.data.__lx[32]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setMediaKeysStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set mediaKeysStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set mediaKeysStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)&self[2]._configuration.data.__lx[32];
  *(void *)&self[2]._configuration.data.__lx[32] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSURL)hstsStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)self[2]._anon_8) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setHSTSStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set hstsStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set hstsStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)self[2]._anon_8;
  *(void *)self[2]._anon_8 = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSURL)alternativeServicesStorageDirectory
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self[1]._configuration.data.__lx[16]) {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)setAlternativeServicesStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set alternativeServicesDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set alternativeServicesStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  int v7 = *(WTF::StringImpl **)&self[1]._configuration.data.__lx[16];
  *(void *)&self[1]._configuration.data.__lx[16] = v6;
  if (v7)
  {
    int v8 = *(_DWORD *)v7 - 2;
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v5);
      int v7 = v10;
      v10 = 0;
      if (!v7) {
        return;
      }
      int v8 = *(_DWORD *)v7 - 2;
      if (*(_DWORD *)v7 == 2)
      {
        WTF::StringImpl::destroy(v7, v9);
        return;
      }
    }
    *(_DWORD *)int v7 = v8;
  }
}

- (NSURL)generalStorageDirectory
{
  result = (NSURL *)self[2].super.isa;
  if (result)
  {
    v3 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v4 = WTF::StringImpl::operator NSString *();
    return (NSURL *)[v3 fileURLWithPath:v4 isDirectory:1];
  }
  return result;
}

- (void)setGeneralStorageDirectory:(id)a3
{
  if (!self->_configuration.data.__lx[16]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Cannot set generalStorageDirectory on a non-persistent _WKWebsiteDataStoreConfiguration."];
  }
  if (*(_OWORD *)&self->_configuration.data.__lx[32] != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Cannot set generalStorageDirectory on a _WKWebsiteDataStoreConfiguration created with identifier"];
  }
  if (a3)
  {
    if (([a3 isFileURL] & 1) == 0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
    }
  }
  MEMORY[0x19972EAD0](&v10, [a3 path]);
  v6 = v10;
  v10 = 0;
  Class isa = self[2].super.isa;
  self[2].super.Class isa = v6;
  if (isa)
  {
    int v8 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v5);
      Class isa = v10;
      v10 = 0;
      if (!isa) {
        return;
      }
      int v8 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v9);
        return;
      }
    }
    *(_DWORD *)Class isa = v8;
  }
}

- (int64_t)unifiedOriginStorageLevel
{
  int v2 = self->_configuration.data.__lx[17];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (void)setUnifiedOriginStorageLevel:(int64_t)a3
{
  unsigned __int8 v3 = a3 == 1;
  if (a3 == 2) {
    unsigned __int8 v3 = 2;
  }
  self->_configuration.data.__lx[17] = v3;
}

- (NSString)webPushPartitionString
{
  if (self[8].super.isa) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setWebPushPartitionString:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  uint64_t v5 = v9;
  v9 = 0;
  Class isa = self[8].super.isa;
  self[8].super.Class isa = v5;
  if (isa)
  {
    int v7 = *(_DWORD *)isa - 2;
    if (*(_DWORD *)isa == 2)
    {
      WTF::StringImpl::destroy(isa, v4);
      Class isa = v9;
      v9 = 0;
      if (!isa) {
        return;
      }
      int v7 = *(_DWORD *)isa - 2;
      if (*(_DWORD *)isa == 2)
      {
        WTF::StringImpl::destroy(isa, v8);
        return;
      }
    }
    *(_DWORD *)Class isa = v7;
  }
}

- (BOOL)deviceManagementRestrictionsEnabled
{
  return self[6]._configuration.data.__lx[24];
}

- (void)setDeviceManagementRestrictionsEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[24] = a3;
}

- (BOOL)networkCacheSpeculativeValidationEnabled
{
  return self[4]._configuration.data.__lx[32];
}

- (BOOL)fastServerTrustEvaluationEnabled
{
  return self[6]._configuration.data.__lx[28];
}

- (unint64_t)perOriginStorageQuota
{
  return *(void *)&self[3]._configuration.data.__lx[24];
}

- (void)setPerOriginStorageQuota:(unint64_t)a3
{
  *(void *)&self[3]._configuration.data.__lx[24] = a3;
}

- (NSNumber)originQuotaRatio
{
  if (self[3]._configuration.data.__lx[40]) {
    return (NSNumber *)[NSNumber numberWithDouble:*(double *)&self[3]._configuration.data.__lx[32]];
  }
  else {
    return 0;
  }
}

- (void)setOriginQuotaRatio:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    double v5 = v4;
    if (v4 < 0.0 || v4 > 1.0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"OriginQuotaRatio must be in the range [0.0, 1]" format];
    }
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = 0;
    double v5 = 0.0;
  }
  *(double *)&self[3]._configuration.data.__lx[32] = v5;
  self[3]._configuration.data.__lx[40] = v7;
}

- (NSNumber)totalQuotaRatio
{
  if (self[4]._anon_8[0]) {
    return (NSNumber *)[NSNumber numberWithDouble:*(double *)&self[4].super.isa];
  }
  else {
    return 0;
  }
}

- (void)setTotalQuotaRatio:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    double v5 = *(objc_class **)&v4;
    if (v4 < 0.0 || v4 > 1.0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"TotalQuotaRatio must be in the range [0.0, 1]" format];
    }
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v7 = 0;
    double v5 = 0;
  }
  self[4].super.Class isa = v5;
  self[4]._anon_8[0] = v7;
}

- (NSNumber)standardVolumeCapacity
{
  if (self[4]._configuration.data.__lx[8]) {
    return (NSNumber *)[NSNumber numberWithUnsignedLongLong:*(void *)self[4]._configuration.data.__lx];
  }
  else {
    return 0;
  }
}

- (void)setStandardVolumeCapacity:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 unsignedLongLongValue];
    unsigned __int8 v5 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    unsigned __int8 v5 = 0;
  }
  *(void *)self[4]._configuration.data.__lx = v4;
  self[4]._configuration.data.__lx[8] = v5;
}

- (NSNumber)volumeCapacityOverride
{
  if (self[4]._configuration.data.__lx[24]) {
    return (NSNumber *)[NSNumber numberWithUnsignedLongLong:*(void *)&self[4]._configuration.data.__lx[16]];
  }
  else {
    return 0;
  }
}

- (void)setVolumeCapacityOverride:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 unsignedLongLongValue];
    unsigned __int8 v5 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    unsigned __int8 v5 = 0;
  }
  *(void *)&self[4]._configuration.data.__lx[16] = v4;
  self[4]._configuration.data.__lx[24] = v5;
}

- (BOOL)isDeclarativeWebPushEnabled
{
  return self[7]._configuration.data.__lx[27];
}

- (void)setIsDeclarativeWebPushEnabled:(BOOL)a3
{
  self[7]._configuration.data.__lx[27] = a3;
}

- (unint64_t)testSpeedMultiplier
{
  return *(unsigned int *)&self[6]._configuration.data.__lx[44];
}

- (void)setTestSpeedMultiplier:(unint64_t)a3
{
  *(_DWORD *)&self[6]._configuration.data.__lx[44] = a3;
}

- (BOOL)suppressesConnectionTerminationOnSystemChange
{
  return self[6]._configuration.data.__lx[31];
}

- (void)setSuppressesConnectionTerminationOnSystemChange:(BOOL)a3
{
  self[6]._configuration.data.__lx[31] = a3;
}

- (BOOL)allowsServerPreconnect
{
  return self[6]._configuration.data.__lx[32];
}

- (void)setAllowsServerPreconnect:(BOOL)a3
{
  self[6]._configuration.data.__lx[32] = a3;
}

- (NSString)boundInterfaceIdentifier
{
  if (*(void *)self[5]._anon_8) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  unsigned __int8 v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)self[5]._anon_8;
  *(void *)self[5]._anon_8 = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)allowsCellularAccess
{
  return self[6]._configuration.data.__lx[26];
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self[6]._configuration.data.__lx[26] = a3;
}

- (BOOL)legacyTLSEnabled
{
  return self[6]._configuration.data.__lx[27];
}

- (void)setLegacyTLSEnabled:(BOOL)a3
{
  self[6]._configuration.data.__lx[27] = a3;
}

- (NSDictionary)proxyConfiguration
{
  return *(NSDictionary **)self[8]._anon_8;
}

- (NSString)dataConnectionServiceType
{
  if (*(void *)self[5]._configuration.data.__lx) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setDataConnectionServiceType:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  unsigned __int8 v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)self[5]._configuration.data.__lx;
  *(void *)self[5]._configuration.data.__lx = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)preventsSystemHTTPProxyAuthentication
{
  return self[6]._configuration.data.__lx[33];
}

- (void)setPreventsSystemHTTPProxyAuthentication:(BOOL)a3
{
  self[6]._configuration.data.__lx[33] = a3;
}

- (BOOL)requiresSecureHTTPSProxyConnection
{
  return self[6]._configuration.data.__lx[34];
}

- (void)setRequiresSecureHTTPSProxyConnection:(BOOL)a3
{
  self[6]._configuration.data.__lx[34] = a3;
}

- (BOOL)shouldRunServiceWorkersOnMainThreadForTesting
{
  return self[6]._configuration.data.__lx[35];
}

- (void)setShouldRunServiceWorkersOnMainThreadForTesting:(BOOL)a3
{
  self[6]._configuration.data.__lx[35] = a3;
}

- (unint64_t)overrideServiceWorkerRegistrationCountTestingValue
{
  if ((*(void *)&self[6]._configuration.data.__lx[36] & 0xFF00000000) != 0) {
    return *(void *)&self[6]._configuration.data.__lx[36];
  }
  else {
    return 0;
  }
}

- (void)setOverrideServiceWorkerRegistrationCountTestingValue:(unint64_t)a3
{
  *(_DWORD *)&self[6]._configuration.data.__lx[36] = a3;
  self[6]._configuration.data.__lx[40] = 1;
}

- (BOOL)_shouldAcceptInsecureCertificatesForWebSockets
{
  return 0;
}

- (void)setProxyConfiguration:(id)a3
{
  uint64_t v4 = (const void *)[a3 copy];
  unsigned __int8 v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  v6 = *(const void **)self[8]._anon_8;
  *(void *)self[8]._anon_8 = v5;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (NSURL)standaloneApplicationURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setStandaloneApplicationURL:(id)a3
{
  MEMORY[0x19972E8A0](v6, a3);
  WTF::URL::operator=((uint64_t)&self[7], (uint64_t)v6);
  unsigned __int8 v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (BOOL)enableInAppBrowserPrivacyForTesting
{
  return self[7]._configuration.data.__lx[24];
}

- (void)setEnableInAppBrowserPrivacyForTesting:(BOOL)a3
{
  self[7]._configuration.data.__lx[24] = a3;
}

- (BOOL)allowsHSTSWithUntrustedRootCertificate
{
  return self[7]._configuration.data.__lx[25];
}

- (void)setAllowsHSTSWithUntrustedRootCertificate:(BOOL)a3
{
  self[7]._configuration.data.__lx[25] = a3;
}

- (NSString)pcmMachServiceName
{
  if (*(void *)&self[7]._configuration.data.__lx[32]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setPCMMachServiceName:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  unsigned __int8 v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[7]._configuration.data.__lx[32];
  *(void *)&self[7]._configuration.data.__lx[32] = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (NSString)webPushMachServiceName
{
  if (*(void *)&self[7]._configuration.data.__lx[40]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setWebPushMachServiceName:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  unsigned __int8 v5 = v9;
  v9 = 0;
  v6 = *(WTF::StringImpl **)&self[7]._configuration.data.__lx[40];
  *(void *)&self[7]._configuration.data.__lx[40] = v5;
  if (v6)
  {
    int v7 = *(_DWORD *)v6 - 2;
    if (*(_DWORD *)v6 == 2)
    {
      WTF::StringImpl::destroy(v6, v4);
      v6 = v9;
      v9 = 0;
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)v6 - 2;
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v8);
        return;
      }
    }
    *(_DWORD *)v6 = v7;
  }
}

- (BOOL)allLoadsBlockedByDeviceManagementRestrictionsForTesting
{
  return self[6]._configuration.data.__lx[25];
}

- (void)setAllLoadsBlockedByDeviceManagementRestrictionsForTesting:(BOOL)a3
{
  self[6]._configuration.data.__lx[25] = a3;
}

- (BOOL)resourceLoadStatisticsDebugModeEnabled
{
  return self[7]._configuration.data.__lx[26];
}

- (void)setResourceLoadStatisticsDebugModeEnabled:(BOOL)a3
{
  self[7]._configuration.data.__lx[26] = a3;
}

- (NSNumber)defaultTrackingPreventionEnabledOverride
{
  if (*(unsigned __int16 *)&self[8]._configuration.data.__lx[16] >= 0x100u) {
    return (NSNumber *)[NSNumber numberWithBool:*(_WORD *)&self[8]._configuration.data.__lx[16] != 0];
  }
  else {
    return 0;
  }
}

- (void)setDefaultTrackingPreventionEnabledOverride:(id)a3
{
  if (a3)
  {
    __int16 v4 = [a3 BOOLValue];
    __int16 v5 = 1;
  }
  else
  {
    __int16 v4 = 0;
    __int16 v5 = 0;
  }
  *(_WORD *)&self[8]._configuration.data.__lx[16] = v4 | (v5 << 8);
}

- (NSUUID)identifier
{
  if (*(_OWORD *)&self->_configuration.data.__lx[32] == 0) {
    return 0;
  }
  else {
    return (NSUUID *)WTF::UUID::operator NSUUID *();
  }
}

@end