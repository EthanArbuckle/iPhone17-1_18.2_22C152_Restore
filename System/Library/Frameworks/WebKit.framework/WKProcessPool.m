@interface WKProcessPool
+ (BOOL)_lockdownModeEnabledGloballyForTesting;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)supportsSecureCoding;
+ (id)_allProcessPoolsForTesting;
+ (id)_gpuProcessInfo;
+ (id)_networkingProcessInfo;
+ (id)_sharedProcessPool;
+ (id)_webContentProcessInfo;
+ (id)_websiteDataURLForContainerWithURL:(id)a3;
+ (id)_websiteDataURLForContainerWithURL:(id)a3 bundleIdentifierIfNotInContainer:(id)a4;
+ (void)_clearCaptivePortalModeEnabledGloballyForTesting;
+ (void)_setCaptivePortalModeEnabledGloballyForTesting:(BOOL)a3;
+ (void)_setLinkedOnOrBeforeEverythingForTesting;
+ (void)_setWebProcessCountLimit:(unsigned int)a3;
- (BOOL)_hasAudibleMediaActivity;
- (BOOL)_hasPrewarmedWebProcess;
- (BOOL)_isCookieStoragePartitioningEnabled;
- (BOOL)_isWebProcessSuspended:(int)a3;
- (BOOL)_requestWebProcessTermination:(int)a3;
- (NSString)description;
- (NSURL)_javaScriptConfigurationDirectory;
- (Object)_apiObject;
- (OpaqueWKNotificationManager)_notificationManagerForTesting;
- (WKGeolocationProviderIOS)_geolocationProvider;
- (WKProcessPool)init;
- (WKProcessPool)initWithCoder:(id)a3;
- (_WKAutomationDelegate)_automationDelegate;
- (_WKDownloadDelegate)_downloadDelegate;
- (_WKGeolocationCoreLocationProvider)_coreLocationProvider;
- (_WKProcessPoolConfiguration)_configuration;
- (id).cxx_construct;
- (id)_downloadURLRequest:(id)a3 websiteDataStore:(id)a4 originatingWebView:(id)a5;
- (id)_initWithConfiguration:(id)a3;
- (id)_objectForBundleParameter:(id)a3;
- (id)_resumeDownloadFromData:(id)a3 websiteDataStore:(id)a4 path:(id)a5 originatingWebView:(id)a6;
- (int)_gpuProcessIdentifier;
- (int)_prewarmedProcessIdentifier;
- (unint64_t)_maximumSuspendedPageCount;
- (unint64_t)_numberOfConnectedGameControllerFrameworkGamepadsForTesting;
- (unint64_t)_numberOfConnectedGamepadsForTesting;
- (unint64_t)_numberOfConnectedHIDGamepadsForTesting;
- (unint64_t)_pluginProcessCount;
- (unint64_t)_processCacheCapacity;
- (unint64_t)_processCacheSize;
- (unint64_t)_serviceWorkerProcessCount;
- (unint64_t)_webPageContentProcessCount;
- (unint64_t)_webProcessCount;
- (unint64_t)_webProcessCountIgnoringPrewarmed;
- (unint64_t)_webProcessCountIgnoringPrewarmedAndCached;
- (void)_addSupportedPlugin:(id)a3 named:(id)a4 withMimeTypes:(id)a5 withExtensions:(id)a6;
- (void)_automationCapabilitiesDidChange;
- (void)_clearPermanentCredentialsForProtectionSpace:(id)a3;
- (void)_clearWebProcessCache;
- (void)_garbageCollectJavaScriptObjectsForTesting;
- (void)_getActivePagesOriginsInWebProcessForTesting:(int)a3 completionHandler:(id)a4;
- (void)_isJITDisabledInAllRemoteWorkerProcesses:(id)a3;
- (void)_makeNextWebProcessLaunchFailForTesting;
- (void)_registerURLSchemeAsBypassingContentSecurityPolicy:(id)a3;
- (void)_registerURLSchemeAsCanDisplayOnlyIfCanRequest:(id)a3;
- (void)_registerURLSchemeAsSecure:(id)a3;
- (void)_seedResourceLoadStatisticsForTestingWithFirstParty:(id)a3 thirdParty:(id)a4 shouldScheduleNotification:(BOOL)a5 completionHandler:(id)a6;
- (void)_setAutomationDelegate:(id)a3;
- (void)_setAutomationSession:(id)a3;
- (void)_setCookieStoragePartitioningEnabled:(BOOL)a3;
- (void)_setCoreLocationProvider:(id)a3;
- (void)_setDomainRelaxationForbiddenForURLScheme:(id)a3;
- (void)_setDownloadDelegate:(id)a3;
- (void)_setJavaScriptConfigurationDirectory:(id)a3;
- (void)_setObject:(id)a3 forBundleParameter:(id)a4;
- (void)_setObjectsForBundleParametersWithDictionary:(id)a3;
- (void)_setUseSeparateServiceWorkerProcess:(BOOL)a3;
- (void)_terminateAllWebContentProcesses;
- (void)_terminateServiceWorkers;
- (void)_warmInitialProcess;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKProcessPool

- (void)_warmInitialProcess
{
}

- (id).cxx_construct
{
  *((void *)self + 126) = 0;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  return self;
}

- (void)_setObject:(id)a3 forBundleParameter:(id)a4
{
  v6 = (const void *)[a3 copy];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v7 encodeObject:v6 forKey:@"parameter"];
  [v7 finishEncoding];
  p_processPool = &self->_processPool;
  if (v6) {
    [WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)p_processPool) setObject:v6 forKey:a4];
  }
  else {
    [WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)p_processPool) removeObjectForKey:a4];
  }
  v9 = (void *)[v7 encodedData];
  MEMORY[0x19972EAD0](&v24, a4);
  if (v9)
  {
    v11 = (const void *)[v9 bytes];
    size_t v12 = [v9 length];
  }
  else
  {
    v11 = 0;
    size_t v12 = 0;
  }
  uint64_t v13 = *(unsigned int *)&self->_anon_38[36];
  if (v13)
  {
    v14 = *(uint64_t **)&self->_anon_38[24];
    uint64_t v15 = 8 * v13;
    do
    {
      uint64_t v16 = *v14;
      uint64_t v17 = *(void *)(*v14 + 136);
      if (v17 && *(unsigned char *)(v17 + 104) || *(void *)(v16 + 144))
      {
        v18 = (IPC::Encoder *)WTF::fastMalloc((WTF *)0x238);
        *(_WORD *)v18 = 2683;
        *((void *)v18 + 1) = 0;
        *((void *)v18 + 66) = (char *)v18 + 16;
        *((void *)v18 + 67) = 512;
        *((void *)v18 + 68) = 0;
        *((void *)v18 + 70) = 0;
        *((void *)v18 + 69) = 0;
        IPC::Encoder::encodeHeader(v18);
        v27 = v18;
        IPC::ArgumentCoder<WTF::String,void>::encode<IPC::Encoder>(v18, (uint64_t *)&v24);
        IPC::ArgumentCoder<std::span<unsigned char const,18446744073709551615ul>,void>::encode<IPC::Encoder>(v18, v11, v12);
        LOBYTE(v25) = 0;
        char v26 = 0;
        WebKit::AuxiliaryProcessProxy::sendMessage(v16, &v27, 0, (uint64_t)&v25, 1);
        if (v26)
        {
          uint64_t v19 = v25;
          uint64_t v25 = 0;
          if (v19) {
            (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
          }
        }
        v20 = v27;
        v27 = 0;
        if (v20)
        {
          IPC::Encoder::~Encoder(v20, v10);
          WTF::fastFree(v21, v22);
        }
      }
      ++v14;
      v15 -= 8;
    }
    while (v15);
  }
  v23 = v24;
  v24 = 0;
  if (!v23)
  {
LABEL_20:
    if (!v7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (*(_DWORD *)v23 != 2)
  {
    *(_DWORD *)v23 -= 2;
    goto LABEL_20;
  }
  WTF::StringImpl::destroy(v23, (WTF::StringImpl *)v10);
  if (v7) {
LABEL_21:
  }
    CFRelease(v7);
LABEL_22:
  if (v6) {
    CFRelease(v6);
  }
}

- (id)_initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKProcessPool;
  v4 = [(WKProcessPool *)&v6 init];
  if (v4) {
    WebKit::WebProcessPool::WebProcessPool((WebKit::WebProcessPool *)[(WKProcessPool *)v4 _apiObject], (API::ProcessPoolConfiguration *)((char *)a3 + 8));
  }
  return 0;
}

- (Object)_apiObject
{
  return (Object *)&self->_processPool;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKProcessPool accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKProcessPool accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (WKProcessPool)init
{
  char v3 = objc_alloc_init(_WKProcessPoolConfiguration);
  v4 = [(WKProcessPool *)self _initWithConfiguration:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebProcessPool::~WebProcessPool((WebKit::WebProcessPool *)&self->_processPool);
    v4.receiver = self;
    v4.super_class = (Class)WKProcessPool;
    [(WKProcessPool *)&v4 dealloc];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (_MergedGlobals_877 == 1)
  {
    char v3 = (WKProcessPool *)qword_1E93CF618;
  }
  else
  {
    char v3 = 0;
    qword_1E93CF618 = 0;
    _MergedGlobals_877 = 1;
  }
  if (v3 == self) {
    [a3 encodeBool:1 forKey:@"isSharedProcessPool"];
  }
}

- (WKProcessPool)initWithCoder:(id)a3
{
  objc_super v4 = [(WKProcessPool *)self init];
  if (!v4 || ![a3 decodeBoolForKey:@"isSharedProcessPool"]) {
    return v4;
  }

  id v5 = +[WKProcessPool _sharedProcessPool];

  return (WKProcessPool *)v5;
}

- (NSString)description
{
  char v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; configuration = %@>",
                       NSStringFromClass(v4),
                       self,
                       *(void *)(*(void *)self->_anon_38 + 8));
}

- (_WKProcessPoolConfiguration)_configuration
{
  API::ProcessPoolConfiguration::copy(*(API::ProcessPoolConfiguration **)self->_anon_38, &v6);
  v2 = (const void *)*((void *)v6 + 1);
  if (v2) {
    CFRetain(*((CFTypeRef *)v6 + 1));
  }
  char v3 = (id)CFMakeCollectable(v2);
  objc_super v4 = v6;
  int v6 = 0;
  if (v4) {
    CFRelease(*((CFTypeRef *)v4 + 1));
  }
  return v3;
}

- (WKGeolocationProviderIOS)_geolocationProvider
{
  result = (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
  if (!result)
  {
    result = [[WKGeolocationProviderIOS alloc] initWithProcessPool:&self->_processPool];
    m_ptr = self->_geolocationProvider.m_ptr;
    self->_geolocationProvider.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_geolocationProvider.m_ptr;
  self->_geolocationProvider.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = self->_automationSession.m_ptr;
  self->_automationSession.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  objc_destroyWeak(&self->_downloadDelegate.m_weakReference);

  objc_destroyWeak(&self->_automationDelegate.m_weakReference);
}

+ (id)_sharedProcessPool
{
  if (qword_1E93CF610 != -1) {
    dispatch_once(&qword_1E93CF610, &__block_literal_global_19);
  }
  if (_MergedGlobals_877 == 1) {
    return (id)qword_1E93CF618;
  }
  id result = 0;
  qword_1E93CF618 = 0;
  _MergedGlobals_877 = 1;
  return result;
}

void __46__WKProcessPool_WKPrivate___sharedProcessPool__block_invoke()
{
  v0 = objc_alloc_init(WKProcessPool);
  if (_MergedGlobals_877)
  {
    v1 = (const void *)qword_1E93CF618;
    qword_1E93CF618 = (uint64_t)v0;
    if (v1)
    {
      CFRelease(v1);
    }
  }
  else
  {
    _MergedGlobals_877 = 1;
    qword_1E93CF618 = (uint64_t)v0;
  }
}

+ (id)_allProcessPoolsForTesting
{
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v9);
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v3 = (void *)[v2 initWithCapacity:v10];
  if (v10)
  {
    uint64_t v4 = v9;
    uint64_t v5 = 8 * v10;
    do
    {
      if (*(void *)(*(void *)v4 + 8)) {
        objc_msgSend(v3, "addObject:");
      }
      v4 += 8;
      v5 -= 8;
    }
    while (v5);
  }
  CFTypeRef v6 = (id)CFMakeCollectable(v3);
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v7);
  return (id)v6;
}

+ (id)_websiteDataURLForContainerWithURL:(id)a3
{
  return +[WKProcessPool _websiteDataURLForContainerWithURL:a3 bundleIdentifierIfNotInContainer:0];
}

+ (id)_websiteDataURLForContainerWithURL:(id)a3 bundleIdentifierIfNotInContainer:(id)a4
{
  uint64_t v5 = (WebKit *)objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", @"Library", 1), "URLByAppendingPathComponent:isDirectory:", @"WebKit", 1);
  BOOL HasContainer = WebKit::processHasContainer(v5);
  if (a4 && !HasContainer) {
    uint64_t v5 = (WebKit *)[(WebKit *)v5 URLByAppendingPathComponent:a4 isDirectory:1];
  }

  return (id)[(WebKit *)v5 URLByAppendingPathComponent:@"WebsiteData" isDirectory:1];
}

- (void)_registerURLSchemeAsCanDisplayOnlyIfCanRequest:(id)a3
{
  p_processPool = &self->_processPool;
  MEMORY[0x19972EAD0](&v8, a3);
  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&self->_anon_38[344], &v8, v5, (uint64_t)v9);
  v9[0] = (uint64_t *)&v8;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::RegisterURLSchemeAsCanDisplayOnlyIfCanRequest>((uint64_t)p_processPool, v9, 0);
  v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)_registerURLSchemeAsSecure:(id)a3
{
  p_processPool = &self->_processPool;
  MEMORY[0x19972EAD0](&v7, a3);
  WebKit::WebProcessPool::registerURLSchemeAsSecure((WebKit::WebProcessPool *)p_processPool, &v7, v4);
  CFTypeRef v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_registerURLSchemeAsBypassingContentSecurityPolicy:(id)a3
{
  p_processPool = &self->_processPool;
  MEMORY[0x19972EAD0](&v7, a3);
  WebKit::WebProcessPool::registerURLSchemeAsBypassingContentSecurityPolicy((WebKit::WebProcessPool *)p_processPool, &v7, v4);
  CFTypeRef v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_setDomainRelaxationForbiddenForURLScheme:(id)a3
{
  p_processPool = &self->_processPool;
  MEMORY[0x19972EAD0](&v8, a3);
  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&self->_anon_38[304], &v8, v5, (uint64_t)v9);
  v9[0] = (uint64_t *)&v8;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::SetDomainRelaxationForbiddenForURLScheme>((uint64_t)p_processPool, v9, 0);
  v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (id)_objectForBundleParameter:(id)a3
{
  return (id)[*(id *)&self->_anon_38[600] objectForKey:a3];
}

- (void)_setObjectsForBundleParametersWithDictionary:(id)a3
{
  uint64_t v4 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3 copyItems:1];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:@"parameters"];
  [v5 finishEncoding];
  [WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)&self->_processPool) setValuesForKeysWithDictionary:v4];
  CFTypeRef v6 = (void *)[v5 encodedData];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = (const void *)[v6 bytes];
    v7 = (void *)[v7 length];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(unsigned int *)&self->_anon_38[36];
  if (v9)
  {
    unsigned int v10 = *(uint64_t **)&self->_anon_38[24];
    uint64_t v11 = 8 * v9;
    do
    {
      uint64_t v12 = *v10;
      uint64_t v13 = *(void *)(*v10 + 136);
      if (v13 && *(unsigned char *)(v13 + 104) || *(void *)(v12 + 144))
      {
        v14 = (IPC::Encoder *)WTF::fastMalloc((WTF *)0x238);
        *(_WORD *)v14 = 2684;
        *((void *)v14 + 1) = 0;
        *((void *)v14 + 66) = (char *)v14 + 16;
        *((void *)v14 + 67) = 512;
        *((void *)v14 + 68) = 0;
        *((void *)v14 + 70) = 0;
        *((void *)v14 + 69) = 0;
        IPC::Encoder::encodeHeader(v14);
        v22 = v14;
        IPC::ArgumentCoder<std::span<unsigned char const,18446744073709551615ul>,void>::encode<IPC::Encoder>(v14, v8, (size_t)v7);
        LOBYTE(v20) = 0;
        char v21 = 0;
        WebKit::AuxiliaryProcessProxy::sendMessage(v12, &v22, 0, (uint64_t)&v20, 1);
        if (v21)
        {
          uint64_t v16 = v20;
          uint64_t v20 = 0;
          if (v16) {
            (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
          }
        }
        uint64_t v17 = v22;
        v22 = 0;
        if (v17)
        {
          IPC::Encoder::~Encoder(v17, v15);
          WTF::fastFree(v18, v19);
        }
      }
      ++v10;
      v11 -= 8;
    }
    while (v11);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
}

- (_WKDownloadDelegate)_downloadDelegate
{
  return (_WKDownloadDelegate *)objc_loadWeak(&self->_downloadDelegate.m_weakReference);
}

- (void)_setDownloadDelegate:(id)a3
{
  objc_storeWeak(&self->_downloadDelegate.m_weakReference, a3);
  uint64_t v5 = WTF::fastMalloc((WTF *)0x20);
  WebKit::LegacyDownloadClient::LegacyDownloadClient(v5, a3);
  CFTypeRef v6 = *(_DWORD **)&self->_anon_38[256];
  *(void *)&self->_anon_38[256] = v5;
  if (v6)
  {
    if (v6[2] == 1)
    {
      v7 = *(void (**)(void))(*(void *)v6 + 8);
      v7();
    }
    else
    {
      --v6[2];
    }
  }
}

- (_WKAutomationDelegate)_automationDelegate
{
  return (_WKAutomationDelegate *)objc_loadWeak(&self->_automationDelegate.m_weakReference);
}

- (void)_setAutomationDelegate:(id)a3
{
  objc_storeWeak(&self->_automationDelegate.m_weakReference, a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x28);
  WebKit::AutomationClient::AutomationClient((uint64_t)v5, (uint64_t)self, a3);
  v7 = v5;
  WebKit::WebProcessPool::setAutomationClient((uint64_t)&self->_processPool, &v7);
  if (v7)
  {
    CFTypeRef v6 = *(void (**)(void))(*v7 + 8);
    v6();
  }
}

- (void)_automationCapabilitiesDidChange
{
  uint64_t v2 = Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)self);

  MEMORY[0x1F40EBE80](v2);
}

- (void)_setAutomationSession:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_automationSession.m_ptr;
  self->_automationSession.m_ptr = a3;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  p_processPool = &self->_processPool;
  if (a3)
  {
    v7 = (char *)a3 + 8;
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    v7 = 0;
  }
  uint64_t v9 = v7;
  WebKit::WebProcessPool::setAutomationSession((WebKit::WebProcessPool *)p_processPool, (uint64_t *)&v9);
  if (v9)
  {
    uint64_t v8 = (const void *)*((void *)v9 + 1);
    CFRelease(v8);
  }
}

- (NSURL)_javaScriptConfigurationDirectory
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  if (*(void *)&self->_anon_38[464]) {
    char v3 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    char v3 = &stru_1EEA10550;
  }

  return (NSURL *)[v2 fileURLWithPath:v3 isDirectory:1];
}

- (void)_setJavaScriptConfigurationDirectory:(id)a3
{
  if (a3 && ([a3 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", a3 format];
  }
  MEMORY[0x19972EAD0](&v7, [a3 path]);
  WTF::String::operator=((uint64_t *)&self->_anon_38[464], &v7);
  CFTypeRef v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_addSupportedPlugin:(id)a3 named:(id)a4 withMimeTypes:(id)a5 withExtensions:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v37 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [a5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(a5);
        }
        MEMORY[0x19972EAD0](&v32, *(void *)(*((void *)&v33 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v37, &v32, v13, (uint64_t)v31);
        uint64_t v15 = v32;
        v32 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2) {
            WTF::StringImpl::destroy(v15, v14);
          }
          else {
            *(_DWORD *)v15 -= 2;
          }
        }
      }
      uint64_t v10 = [a5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }
  v32 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v16 = [a6 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(a6);
        }
        MEMORY[0x19972EAD0](&v26, *(void *)(*((void *)&v27 + 1) + 8 * j));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v32, &v26, v19, (uint64_t)v31);
        char v21 = v26;
        char v26 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2) {
            WTF::StringImpl::destroy(v21, v20);
          }
          else {
            *(_DWORD *)v21 -= 2;
          }
        }
      }
      uint64_t v16 = [a6 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v16);
  }
  MEMORY[0x19972EAD0](v31, a3);
  MEMORY[0x19972EAD0](&v26, a4);
  v23 = (WTF::StringImpl **)v32;
  v32 = 0;
  if (v23) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v23, v22);
  }
  v24 = v26;
  char v26 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy(v24, v22);
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
  uint64_t v25 = v31[0];
  v31[0] = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy(v25, v22);
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
  if (v32) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable((WTF::StringImpl **)v32, v22);
  }
  if (v37) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v37, v22);
  }
}

- (void)_terminateServiceWorkers
{
}

- (void)_setUseSeparateServiceWorkerProcess:(BOOL)a3
{
}

- (int)_prewarmedProcessIdentifier
{
  uint64_t v2 = *(void *)&self->_anon_38[40];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0 && (v4 = *(void *)(v3 + 136)) != 0) {
    return *(_DWORD *)(v4 + 108);
  }
  else {
    return 0;
  }
}

- (void)_clearWebProcessCache
{
}

- (unint64_t)_webProcessCount
{
  return *(unsigned int *)&self->_anon_38[36];
}

- (int)_gpuProcessIdentifier
{
  uint64_t v2 = *(void *)&self->_anon_38[128];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 136)) != 0) {
    return *(_DWORD *)(v3 + 108);
  }
  else {
    return 0;
  }
}

- (BOOL)_hasAudibleMediaActivity
{
  return self->_anon_38[776];
}

- (BOOL)_requestWebProcessTermination:(int)a3
{
  int v3 = *(_DWORD *)&self->_anon_38[36];
  if (v3)
  {
    uint64_t v4 = **(void **)&self->_anon_38[24];
    uint64_t v5 = (unsigned int *)(v4 + 16);
    atomic_fetch_add((atomic_uint *volatile)(v4 + 16), 1u);
    uint64_t v6 = *(void *)(v4 + 136);
    if (v6) {
      LODWORD(v6) = *(_DWORD *)(v6 + 108);
    }
    if (v6 == a3) {
      WebKit::WebProcessProxy::requestTermination((unsigned int *)v4, 2);
    }
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v5);
  }
  return v3 != 0;
}

- (BOOL)_isWebProcessSuspended:(int)a3
{
  uint64_t v3 = *(unsigned int *)&self->_anon_38[36];
  if (!v3) {
    return 0;
  }
  uint64_t v5 = *(void **)&self->_anon_38[24];
  uint64_t v6 = 8 * v3;
  while (1)
  {
    uint64_t v7 = *v5;
    uint64_t v8 = (atomic_uint *)(*v5 + 16);
    atomic_fetch_add(v8, 1u);
    uint64_t v9 = *(void *)(v7 + 136);
    if (v9) {
      LODWORD(v9) = *(_DWORD *)(v9 + 108);
    }
    if (v9 == a3) {
      break;
    }
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)v8);
    ++v5;
    v6 -= 8;
    if (!v6) {
      return 0;
    }
  }
  if (*(unsigned char *)(v7 + 389)) {
    BOOL v10 = *(void *)(v7 + 224) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)v8);
  return v10;
}

- (void)_makeNextWebProcessLaunchFailForTesting
{
  self->_anon_38[474] = 1;
}

- (BOOL)_hasPrewarmedWebProcess
{
  uint64_t v2 = *(unsigned int *)&self->_anon_38[36];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(uint64_t **)&self->_anon_38[24];
  uint64_t v4 = 8 * v2 - 8;
  do
  {
    uint64_t v5 = *v3++;
    atomic_fetch_add((atomic_uint *volatile)(v5 + 16), 1u);
    int v6 = *(unsigned __int8 *)(v5 + 778);
    BOOL v7 = *(unsigned char *)(v5 + 778) != 0;
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v5 + 16));
    if (v6) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v4 == 0;
    }
    v4 -= 8;
  }
  while (!v8);
  return v7;
}

- (unint64_t)_webProcessCountIgnoringPrewarmed
{
  unint64_t v3 = [(WKProcessPool *)self _webProcessCount];
  return v3 - [(WKProcessPool *)self _hasPrewarmedWebProcess];
}

- (unint64_t)_webProcessCountIgnoringPrewarmedAndCached
{
  uint64_t v2 = *(unsigned int *)&self->_anon_38[36];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = *(void **)&self->_anon_38[24];
  uint64_t v5 = 8 * v2;
  do
  {
    uint64_t v6 = *v4;
    BOOL v7 = (atomic_uint *)(*v4 + 16);
    atomic_fetch_add(v7, 1u);
    if (!*(unsigned char *)(v6 + 712) && !*(unsigned char *)(v6 + 778)) {
      ++v3;
    }
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)v7);
    ++v4;
    v5 -= 8;
  }
  while (v5);
  return v3;
}

- (unint64_t)_webPageContentProcessCount
{
  unint64_t v2 = *(unsigned int *)&self->_anon_38[36];
  if (WebKit::WebProcessPool::s_useSeparateServiceWorkerProcess) {
    v2 -= WebKit::WebProcessPool::serviceWorkerProxiesCount((WebKit::WebProcessPool *)&self->_processPool);
  }
  return v2;
}

- (unint64_t)_pluginProcessCount
{
  return 0;
}

- (unint64_t)_maximumSuspendedPageCount
{
  return *(unsigned int *)(*(void *)&self->_anon_38[712] + 16);
}

- (unint64_t)_processCacheCapacity
{
  return *(unsigned int *)(*(void *)&self->_anon_38[720] + 4);
}

- (unint64_t)_processCacheSize
{
  uint64_t v2 = *(void *)(*(void *)&self->_anon_38[720] + 16);
  if (v2) {
    return *(unsigned int *)(v2 - 12);
  }
  else {
    return 0;
  }
}

- (unint64_t)_serviceWorkerProcessCount
{
  return WebKit::WebProcessPool::serviceWorkerProxiesCount((WebKit::WebProcessPool *)&self->_processPool);
}

- (void)_isJITDisabledInAllRemoteWorkerProcesses:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v5 = &unk_1EE9C4E58;
  v5[1] = v4;
  uint64_t v6 = v5;
  WebKit::WebProcessPool::isJITDisabledInAllRemoteWorkerProcesses((uint64_t)&self->_processPool, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

+ (void)_setLinkedOnOrBeforeEverythingForTesting
{
}

+ (void)_setCaptivePortalModeEnabledGloballyForTesting:(BOOL)a3
{
}

+ (BOOL)_lockdownModeEnabledGloballyForTesting
{
  if (HIBYTE(WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally))
  {
    LOBYTE(isLockdownModeEnabledBySystemIgnoringCaching) = (_BYTE)WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally != 0;
  }
  else
  {
    __int16 isLockdownModeEnabledBySystemIgnoringCaching = WebKit::isLockdownModeEnabledBySystemIgnoringCaching((WebKit *)a1);
    WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally = isLockdownModeEnabledBySystemIgnoringCaching | 0x100;
  }
  return isLockdownModeEnabledBySystemIgnoringCaching;
}

+ (void)_clearCaptivePortalModeEnabledGloballyForTesting
{
}

- (BOOL)_isCookieStoragePartitioningEnabled
{
  return self->_anon_38[632];
}

- (void)_setCookieStoragePartitioningEnabled:(BOOL)a3
{
  self->_anon_38[632] = a3;
}

- (_WKGeolocationCoreLocationProvider)_coreLocationProvider
{
  return (_WKGeolocationCoreLocationProvider *)self->_coreLocationProvider.m_ptr;
}

- (void)_setCoreLocationProvider:(id)a3
{
  if (self->_geolocationProvider.m_ptr) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Changing the location provider is not supported after a web view in the process pool has begun servicing geolocation requests."];
  }
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (id)_downloadURLRequest:(id)a3 websiteDataStore:(id)a4 originatingWebView:(id)a5
{
  p_processPool = &self->_processPool;
  BOOL v7 = (WebKit::WebsiteDataStore *)((char *)a4 + 8);
  if (a5)
  {
    [a5 _page];
    BOOL v8 = v19;
  }
  else
  {
    BOOL v8 = 0;
    uint64_t v19 = 0;
  }
  MEMORY[0x199732A50](v17, a3);
  uint64_t v16 = 0;
  WebKit::WebProcessPool::download((WebKit::WebProcessPool *)p_processPool, v7, v8, v17, (const WTF::String *)&v16, &v20);
  m_ptr = v20[1].m_impl.m_ptr;
  if (m_ptr) {
    CFRetain(v20[1].m_impl.m_ptr);
  }
  uint64_t v11 = +[_WKDownload downloadWithDownload:m_ptr];
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v12 = v20;
  uint64_t v20 = 0;
  if (v12) {
    CFRelease(v12[1].m_impl.m_ptr);
  }
  uint64_t v13 = v16;
  uint64_t v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v10);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  CFTypeRef v14 = cf;
  CFTypeRef cf = 0;
  if (v14) {
    CFRelease(v14);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v17);
  return v11;
}

- (id)_resumeDownloadFromData:(id)a3 websiteDataStore:(id)a4 path:(id)a5 originatingWebView:(id)a6
{
  if (a6)
  {
    [a6 _page];
    BOOL v10 = v23;
  }
  else
  {
    BOOL v10 = 0;
    v23 = 0;
  }
  CFTypeRef cf = a3;
  if (a3) {
    CFRetain(a3);
  }
  API::Data::createWithoutCopying((id *)&cf, &v22);
  uint64_t v11 = v22;
  MEMORY[0x19972EAD0](&v20, a5);
  WebKit::WebProcessPool::resumeDownload((WebKit::WebProcessPool *)&self->_processPool, (WebKit::WebsiteDataStore *)((char *)a4 + 8), v10, (uint64_t)v11, (uint64_t)&v20, 0, &v24);
  uint64_t v12 = *(const void **)(v24 + 8);
  if (v12) {
    CFRetain(*(CFTypeRef *)(v24 + 8));
  }
  CFTypeRef v14 = +[_WKDownload downloadWithDownload:v12];
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v15 = v24;
  uint64_t v24 = 0;
  if (v15) {
    CFRelease(*(CFTypeRef *)(v15 + 8));
  }
  uint64_t v16 = v20;
  uint64_t v20 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v13);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = v22;
  v22 = 0;
  if (v17) {
    CFRelease(*((CFTypeRef *)v17 + 1));
  }
  CFTypeRef v18 = cf;
  CFTypeRef cf = 0;
  if (v18) {
    CFRelease(v18);
  }
  return v14;
}

- (void)_getActivePagesOriginsInWebProcessForTesting:(int)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  BOOL v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C4E80;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebProcessPool::activePagesOriginsInWebProcessForTesting((uint64_t)&self->_processPool, a3, (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)_clearPermanentCredentialsForProtectionSpace:(id)a3
{
  p_processPool = &self->_processPool;
  WebCore::ProtectionSpace::ProtectionSpace((WebCore::ProtectionSpace *)&v8, (NSURLProtectionSpace *)a3);
  WebKit::WebProcessPool::clearPermanentCredentialsForProtectionSpace((uint64_t)p_processPool, (WebCore::ProtectionSpace *)&v8);
  CFTypeRef v5 = cf;
  CFTypeRef cf = 0;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = v9;
  uint64_t v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  BOOL v7 = v8;
  uint64_t v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)_seedResourceLoadStatisticsForTestingWithFirstParty:(id)a3 thirdParty:(id)a4 shouldScheduleNotification:(BOOL)a5 completionHandler:(id)a6
{
  MEMORY[0x19972E8A0](v20, a3);
  WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v21, (const WTF::URL *)v20);
  MEMORY[0x19972E8A0](v18, a4);
  WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v19, (const WTF::URL *)v18);
  BOOL v10 = _Block_copy(a6);
  uint64_t v11 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v11 = &unk_1EE9C4EA8;
  v11[1] = v10;
  uint64_t v17 = v11;
  WebKit::WebProcessPool::seedResourceLoadStatisticsForTesting((uint64_t)&self->_processPool, (uint64_t)&v21, (uint64_t)&v19, a5, (uint64_t *)&v17);
  if (v17) {
    (*(void (**)(void *))(*v17 + 8))(v17);
  }
  _Block_release(0);
  uint64_t v13 = v19;
  uint64_t v19 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  CFTypeRef v14 = v18[0];
  v18[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  uint64_t v15 = v21;
  char v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v12);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = v20[0];
  v20[0] = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v12);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
}

+ (void)_setWebProcessCountLimit:(unsigned int)a3
{
  WebKit::s_maxProcessCount = a3;
}

- (void)_garbageCollectJavaScriptObjectsForTesting
{
  char v2 = 0;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::GarbageCollectJavaScriptObjects>((uint64_t)&self->_processPool, &v2, 0);
}

- (unint64_t)_numberOfConnectedGamepadsForTesting
{
  {
    WebKit::UIGamepadProvider::UIGamepadProvider((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider);
  }
  return dword_1E93CFD04;
}

- (unint64_t)_numberOfConnectedHIDGamepadsForTesting
{
  return 0;
}

- (unint64_t)_numberOfConnectedGameControllerFrameworkGamepadsForTesting
{
  return 0;
}

- (void)_terminateAllWebContentProcesses
{
}

- (OpaqueWKNotificationManager)_notificationManagerForTesting
{
  v3[0] = "WebNotificationManagerProxy";
  v3[1] = 28;
  id result = (OpaqueWKNotificationManager *)WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)&self->_anon_38[408], (WTF::ASCIILiteralHash *)v3);
  if (result) {
    return (OpaqueWKNotificationManager *)*((void *)result - 1);
  }
  return result;
}

+ (id)_gpuProcessInfo
{
  unint64_t v2 = (unint64_t)&qword_1EB35A000;
    goto LABEL_10;
  if (!WebKit::singleton(void)::singleton)
  {
LABEL_7:
    unint64_t v3 = 0;
    return (id)(id)CFMakeCollectable(v3);
  }
  unint64_t v3 = *(_WKProcessInfo **)(WebKit::singleton(void)::singleton + 8);
  if (v3)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo((uint64_t)v3, (uint64_t)v6);
    if (v7)
    {
      uint64_t v4 = [_WKProcessInfo alloc];
      unint64_t v2 = v7;
      if (v7)
      {
        unint64_t v3 = [(_WKProcessInfo *)v4 initWithTaskInfo:v6];
        return (id)(id)CFMakeCollectable(v3);
      }
      __break(1u);
LABEL_10:
      unint64_t v3 = 0;
      WebKit::singleton(void)::singleton = 0;
      *(unsigned char *)(v2 + 2096) = 1;
      return (id)(id)CFMakeCollectable(v3);
    }
    goto LABEL_7;
  }
  return (id)(id)CFMakeCollectable(v3);
}

+ (id)_networkingProcessInfo
{
  unint64_t v2 = objc_opt_new();
  WebKit::NetworkProcessProxy::allNetworkProcesses(v3, (uint64_t)&v11);
  if (!v12)
  {
LABEL_8:
    WTF::Vector<WTF::Ref<WebKit::NetworkProcessProxy,WTF::RawPtrTraits<WebKit::NetworkProcessProxy>,WTF::DefaultRefDerefTraits<WebKit::NetworkProcessProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v4);
    return (id)(id)CFMakeCollectable(v2);
  }
  CFTypeRef v5 = v11;
  uint64_t v6 = 8 * v12;
  while (1)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo(*v5, (uint64_t)v9);
    if (v10) {
      break;
    }
LABEL_7:
    ++v5;
    v6 -= 8;
    if (!v6) {
      goto LABEL_8;
    }
  }
  id result = [_WKProcessInfo alloc];
  if (v10)
  {
    uint64_t v8 = (const void *)[result initWithTaskInfo:v9];
    [v2 addObject:v8];
    if (v8) {
      CFRelease(v8);
    }
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

+ (id)_webContentProcessInfo
{
  unint64_t v2 = objc_opt_new();
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v13);
  if (!v14)
  {
LABEL_11:
    WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v3);
    return (id)(id)CFMakeCollectable(v2);
  }
  uint64_t v4 = v13;
  uint64_t v5 = v13 + 8 * v14;
  while (1)
  {
    uint64_t v6 = *(unsigned int *)(*(void *)v4 + 84);
    if (v6) {
      break;
    }
LABEL_10:
    v4 += 8;
    if (v4 == v5) {
      goto LABEL_11;
    }
  }
  unsigned __int8 v7 = *(uint64_t **)(*(void *)v4 + 72);
  uint64_t v8 = 8 * v6;
  while (1)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo(*v7, (uint64_t)v11);
    if (v12) {
      break;
    }
LABEL_9:
    ++v7;
    v8 -= 8;
    if (!v8) {
      goto LABEL_10;
    }
  }
  id result = [_WKWebContentProcessInfo alloc];
  if (v12)
  {
    char v10 = (const void *)[result initWithTaskInfo:v11 process:*v7];
    [v2 addObject:v10];
    if (v10) {
      CFRelease(v10);
    }
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

@end