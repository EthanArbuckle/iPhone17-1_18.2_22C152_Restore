@interface WKWebpagePreferences
+ (BOOL)accessInstanceVariablesDirectly;
+ (WKWebpagePreferences)defaultPreferences;
- (BOOL)_allowPrivacyProxy;
- (BOOL)_allowSiteSpecificQuirksToOverrideCompatibilityMode;
- (BOOL)_captivePortalModeEnabled;
- (BOOL)_contentBlockersEnabled;
- (BOOL)_networkConnectionIntegrityEnabled;
- (BOOL)_pushAndNotificationAPIEnabled;
- (BOOL)allowsContentJavaScript;
- (BOOL)isLockdownModeEnabled;
- (Object)_apiObject;
- (WKContentMode)preferredContentMode;
- (WKWebpagePreferences)init;
- (id)_activeContentRuleListActionPatterns;
- (id)_applicationNameForUserAgentWithModernCompatibility;
- (id)_customHeaderFields;
- (id)_customNavigatorPlatform;
- (id)_customUserAgent;
- (id)_customUserAgentAsSiteSpecificQuirks;
- (id)_userContentController;
- (id)_visibilityAdjustmentSelectors;
- (id)_visibilityAdjustmentSelectorsIncludingShadowHosts;
- (id)_websiteDataStore;
- (int64_t)_autoplayPolicy;
- (int64_t)preferredHTTPSNavigationPolicy;
- (unint64_t)_allowedAutoplayQuirks;
- (unint64_t)_colorSchemePreference;
- (unint64_t)_deviceOrientationAndMotionAccessPolicy;
- (unint64_t)_modalContainerObservationPolicy;
- (unint64_t)_mouseEventPolicy;
- (unint64_t)_networkConnectionIntegrityPolicy;
- (unint64_t)_popUpPolicy;
- (void)_setActiveContentRuleListActionPatterns:(id)a3;
- (void)_setAllowPrivacyProxy:(BOOL)a3;
- (void)_setAllowSiteSpecificQuirksToOverrideCompatibilityMode:(BOOL)a3;
- (void)_setAllowedAutoplayQuirks:(unint64_t)a3;
- (void)_setApplicationNameForUserAgentWithModernCompatibility:(id)a3;
- (void)_setAutoplayPolicy:(int64_t)a3;
- (void)_setCaptivePortalModeEnabled:(BOOL)a3;
- (void)_setColorSchemePreference:(unint64_t)a3;
- (void)_setContentBlockersEnabled:(BOOL)a3;
- (void)_setContentRuleListsEnabled:(BOOL)a3 exceptions:(id)a4;
- (void)_setCustomHeaderFields:(id)a3;
- (void)_setCustomNavigatorPlatform:(id)a3;
- (void)_setCustomUserAgent:(id)a3;
- (void)_setCustomUserAgentAsSiteSpecificQuirks:(id)a3;
- (void)_setDeviceOrientationAndMotionAccessPolicy:(unint64_t)a3;
- (void)_setModalContainerObservationPolicy:(unint64_t)a3;
- (void)_setMouseEventPolicy:(unint64_t)a3;
- (void)_setNetworkConnectionIntegrityEnabled:(BOOL)a3;
- (void)_setNetworkConnectionIntegrityPolicy:(unint64_t)a3;
- (void)_setPopUpPolicy:(unint64_t)a3;
- (void)_setPushAndNotificationAPIEnabled:(BOOL)a3;
- (void)_setUserContentController:(id)a3;
- (void)_setVisibilityAdjustmentSelectors:(id)a3;
- (void)_setVisibilityAdjustmentSelectorsIncludingShadowHosts:(id)a3;
- (void)_setWebsiteDataStore:(id)a3;
- (void)dealloc;
- (void)setAllowsContentJavaScript:(BOOL)allowsContentJavaScript;
- (void)setLockdownModeEnabled:(BOOL)lockdownModeEnabled;
- (void)setPreferredContentMode:(WKContentMode)preferredContentMode;
- (void)setPreferredHTTPSNavigationPolicy:(int64_t)a3;
@end

@implementation WKWebpagePreferences

- (void)_setApplicationNameForUserAgentWithModernCompatibility:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[1]._websitePolicies.data.__lx[32], &v6);
  v5 = v6;
  v6 = 0;
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

- (BOOL)_captivePortalModeEnabled
{
  return API::WebsitePolicies::lockdownModeEnabled((API::WebsitePolicies *)&self->_websitePolicies);
}

- (Object)_apiObject
{
  return (Object *)&self->_websitePolicies;
}

- (void)_setAutoplayPolicy:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    self[2]._websitePolicies.data.__lx[8] = a3;
  }
}

- (void)setPreferredContentMode:(WKContentMode)preferredContentMode
{
  unsigned __int8 v3 = preferredContentMode == WKContentModeMobile;
  if (preferredContentMode == WKContentModeDesktop) {
    unsigned __int8 v3 = 2;
  }
  self[2]._websitePolicies.data.__lx[18] = v3;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebpagePreferences accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebpagePreferences accessInstanceVariablesDirectly]::didLogFault = 1;
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

+ (WKWebpagePreferences)defaultPreferences
{
  v2 = (void *)CFMakeCollectable(objc_alloc_init((Class)a1));

  return (WKWebpagePreferences *)v2;
}

- (void)dealloc
{
  char v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::WebsitePolicies::~WebsitePolicies((API::WebsitePolicies *)&self->_websitePolicies, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebpagePreferences;
    [(WKWebpagePreferences *)&v5 dealloc];
  }
}

- (WKWebpagePreferences)init
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebpagePreferences;
  v2 = [(WKWebpagePreferences *)&v5 init];
  char v3 = v2;
  if (v2) {
    *((void *)API::WebsitePolicies::WebsitePolicies((API::WebsitePolicies *)[(WKWebpagePreferences *)v2 _apiObject])+ 1) = v2;
  }
  return v3;
}

- (void)_setContentBlockersEnabled:(BOOL)a3
{
  LOBYTE(self[2].super.isa) = a3;
  v4 = *(WTF::StringImpl ***)self[2]._websitePolicies.data.__lx;
  *(void *)self[2]._websitePolicies.data.__lx = 0;
  if (v4) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v4, (WTF::StringImpl *)a2);
  }
}

- (BOOL)_contentBlockersEnabled
{
  return (BOOL)self[2].super.isa;
}

- (void)_setContentRuleListsEnabled:(BOOL)a3 exceptions:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v26 = 0;
  unsigned int v7 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize([a4 count]);
  if (v7 <= 8) {
    unsigned int v8 = 8;
  }
  else {
    unsigned int v8 = v7;
  }
  uint64_t v9 = WTF::fastZeroedMalloc((WTF *)(8 * v8 + 16));
  v10 = (WTF::StringImpl **)(v9 + 16);
  v26 = (WTF::StringImpl **)(v9 + 16);
  *(_DWORD *)(v9 + 8) = v8 - 1;
  *(_DWORD *)(v9 + 12) = v8;
  *(void *)uint64_t v9 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(a4);
        }
        MEMORY[0x19972EAD0](&v21, *(void *)(*((void *)&v22 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v26, &v21, v15, (uint64_t)&v20);
        v17 = v21;
        v21 = 0;
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
      uint64_t v12 = [a4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
    v10 = v26;
  }
  v26 = 0;
  LOBYTE(self[2].super.isa) = a3;
  v18 = *(WTF::StringImpl ***)self[2]._websitePolicies.data.__lx;
  *(void *)self[2]._websitePolicies.data.__lx = v10;
  if (v18)
  {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v18, v11);
    if (v26) {
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v26, v19);
    }
  }
}

- (void)_setActiveContentRuleListActionPatterns:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3812000000;
  uint64_t v12 = __Block_byref_object_copy__7;
  uint64_t v13 = __Block_byref_object_dispose__7;
  v14 = &unk_19964AFC1;
  uint64_t v15 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__WKWebpagePreferences__setActiveContentRuleListActionPatterns___block_invoke;
  v8[3] = &unk_1E58123E8;
  v8[4] = &v9;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v5 = v10[6];
  v10[6] = 0;
  uint64_t v6 = *(void *)&self->_websitePolicies.data.__lx[24];
  *(void *)&self->_websitePolicies.data.__lx[24] = v5;
  if (v6) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v6, v4);
  }
  _Block_object_dispose(&v9, 8);
  if (v15) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v15, v7);
  }
}

unint64_t __64__WKWebpagePreferences__setActiveContentRuleListActionPatterns___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unint64_t result = [a3 count];
  if (result)
  {
    if (result >> 29)
    {
      __break(0xC471u);
      return result;
    }
    LODWORD(v21) = result;
    uint64_t v20 = WTF::fastMalloc((WTF *)(8 * result));
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(a3);
        }
        v14[0] = 0;
        v14[0] = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (HIDWORD(v21) == v21)
        {
          WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&v20, v14);
        }
        else
        {
          MEMORY[0x19972EAD0](v20 + 8 * HIDWORD(v21));
          ++HIDWORD(v21);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16, v14[0]);
      uint64_t v7 = v10;
    }
    while (v10);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  MEMORY[0x19972EAD0](&v15, a2);
  WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::add<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)(v11 + 48), &v15, &v20, (uint64_t)v14);
  uint64_t v13 = v15;
  uint64_t v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v20, v12);
}

- (id)_activeContentRuleListActionPatterns
{
  char v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v4 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::variant<WTF::String,unsigned long long,long long,BOOL,double>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin((void **)&self->_websitePolicies.data.__lx[24]);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)&self->_websitePolicies.data.__lx[24];
  if (v8) {
    uint64_t v9 = (void *)(v8 + 24 * *(unsigned int *)(v8 - 4));
  }
  else {
    uint64_t v9 = 0;
  }
  if (v9 != v4)
  {
    do
    {
      uint64_t v10 = (void *)[MEMORY[0x1E4F1CA80] set];
      uint64_t v11 = *((unsigned int *)v5 + 5);
      if (v11)
      {
        uint64_t v12 = (void *)v5[1];
        uint64_t v13 = 8 * v11;
        do
        {
          if (*v12) {
            v14 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            v14 = &stru_1EEA10550;
          }
          [v10 addObject:v14];
          ++v12;
          v13 -= 8;
        }
        while (v13);
      }
      if (*v5) {
        uint64_t v15 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v15 = &stru_1EEA10550;
      }
      [v3 setObject:v10 forKey:v15];
      while (1)
      {
        v5 += 3;
        if (v5 == v7) {
          break;
        }
        if ((unint64_t)(*v5 + 1) > 1) {
          goto LABEL_19;
        }
      }
      uint64_t v5 = v7;
LABEL_19:
      ;
    }
    while (v5 != v9);
  }
  return v3;
}

- (void)_setAllowedAutoplayQuirks:(unint64_t)a3
{
  self[1]._websitePolicies.data.__lx[42] = a3 & 0xF;
}

- (unint64_t)_allowedAutoplayQuirks
{
  return self[1]._websitePolicies.data.__lx[42] & 0xF;
}

- (int64_t)_autoplayPolicy
{
  if (self[2]._websitePolicies.data.__lx[8] - 1 < 3) {
    return (self[2]._websitePolicies.data.__lx[8] - 1) + 1;
  }
  else {
    return 0;
  }
}

- (void)_setDeviceOrientationAndMotionAccessPolicy:(unint64_t)a3
{
  unsigned __int8 v3 = a3 != 1;
  if (!a3) {
    unsigned __int8 v3 = 2;
  }
  self[2]._websitePolicies.data.__lx[19] = v3;
}

- (unint64_t)_deviceOrientationAndMotionAccessPolicy
{
  unint64_t v2 = 1;
  if (self[2]._websitePolicies.data.__lx[19]) {
    unint64_t v2 = 2;
  }
  if (self[2]._websitePolicies.data.__lx[19] == 2) {
    return 0;
  }
  else {
    return v2;
  }
}

- (void)_setPopUpPolicy:(unint64_t)a3
{
  if (a3 <= 2) {
    self[2]._websitePolicies.data.__lx[9] = a3;
  }
}

- (unint64_t)_popUpPolicy
{
  int v2 = self[2]._websitePolicies.data.__lx[9];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (id)_customHeaderFields
{
  unsigned __int8 v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self->_websitePolicies.data.__lx[44]];
  uint64_t v4 = *(unsigned int *)&self->_websitePolicies.data.__lx[44];
  if (v4)
  {
    uint64_t v5 = *(uint64_t **)&self->_websitePolicies.data.__lx[32];
    uint64_t v6 = 32 * v4;
    do
    {
      uint64_t v7 = (CFTypeRef *)API::Object::newObject(0x30uLL, 53);
      *uint64_t v7 = &unk_1EE9D1E28;
      WebKit::InitializeWebKit2((WebKit *)v7);
      *uint64_t v7 = &unk_1EE9B2518;
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v7 + 2), v5);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v7 + 4), (uint64_t)(v5 + 2));
      CFTypeRef v8 = v7[1];
      if (v8)
      {
        CFRetain(v7[1]);
        CFRelease(v7[1]);
        [v3 addObject:v8];
        uint64_t v9 = v8;
      }
      else
      {
        uint64_t v9 = 0;
      }
      CFRelease(v9);
      v5 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  uint64_t v10 = (void *)CFMakeCollectable(v3);

  return v10;
}

- (void)_setCustomHeaderFields:(id)a3
{
  unint64_t v5 = [a3 count];
  unint64_t v7 = v5;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (v5)
  {
    if (v5 >> 27)
    {
      __break(0xC471u);
      return;
    }
    uint64_t v9 = WTF::fastMalloc((WTF *)(32 * v5));
    uint64_t v8 = 0;
    LODWORD(v19) = v7;
    uint64_t v18 = v9;
    uint64_t v12 = v9 + 16;
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v8, v18, v19), "_apiObject");
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v20, (uint64_t *)(v13 + 16));
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v23, v13 + 32);
      uint64_t v14 = v20;
      uint64_t v20 = 0;
      *(void *)(v12 - 16) = v14;
      LODWORD(v14) = v21;
      int v21 = 0;
      *(_DWORD *)(v12 - 8) = v14;
      LODWORD(v14) = v22;
      int v22 = 0;
      *(_DWORD *)(v12 - 4) = v14;
      *(void *)(v12 + 8) = 0;
      uint64_t v15 = v23;
      uint64_t v23 = 0;
      *(void *)uint64_t v12 = v15;
      LODWORD(v15) = v24;
      int v24 = 0;
      *(_DWORD *)(v12 + 8) = v15;
      LODWORD(v15) = v25;
      int v25 = 0;
      *(_DWORD *)(v12 + 12) = v15;
      HIDWORD(v19) = ++v8;
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v23, v16);
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v20, v17);
      v12 += 32;
    }
    while (v7 != v8);
  }
  else
  {
    LODWORD(v8) = 0;
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(unsigned int *)&self->_websitePolicies.data.__lx[44];
  if (v10) {
    WTF::VectorDestructor<true,WebCore::CustomHeaderFields>::destruct(*(void *)&self->_websitePolicies.data.__lx[32], (void *)(*(void *)&self->_websitePolicies.data.__lx[32] + 32 * v10));
  }
  uint64_t v11 = *(WTF **)&self->_websitePolicies.data.__lx[32];
  if (v11)
  {
    *(void *)&self->_websitePolicies.data.__lx[32] = 0;
    *(_DWORD *)&self->_websitePolicies.data.__lx[40] = 0;
    WTF::fastFree(v11, v6);
    uint64_t v9 = v18;
    LODWORD(v7) = v19;
    LODWORD(v8) = HIDWORD(v19);
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  *(void *)&self->_websitePolicies.data.__lx[32] = v9;
  *(_DWORD *)&self->_websitePolicies.data.__lx[40] = v7;
  *(_DWORD *)&self->_websitePolicies.data.__lx[44] = v8;
  WTF::Vector<WebCore::CustomHeaderFields,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v6);
}

- (id)_websiteDataStore
{
  uint64_t v2 = *(void *)&self[2]._websitePolicies.data.__lx[32];
  if (v2) {
    return *(id *)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (void)_setWebsiteDataStore:(id)a3
{
  uint64_t v4 = (char *)a3 + 8;
  CFRetain(*((CFTypeRef *)a3 + 2));
  uint64_t v5 = *(void *)&self[2]._websitePolicies.data.__lx[32];
  *(void *)&self[2]._websitePolicies.data.__lx[32] = v4;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (id)_userContentController
{
  uint64_t v2 = *(void *)&self[2]._websitePolicies.data.__lx[40];
  if (v2) {
    return *(id *)(v2 + 8);
  }
  else {
    return 0;
  }
}

- (void)_setUserContentController:(id)a3
{
  uint64_t v4 = (char *)a3 + 8;
  if (a3) {
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  uint64_t v5 = *(void *)&self[2]._websitePolicies.data.__lx[40];
  *(void *)&self[2]._websitePolicies.data.__lx[40] = v4;
  if (v5)
  {
    uint64_t v6 = *(const void **)(v5 + 8);
    CFRelease(v6);
  }
}

- (void)_setCustomUserAgent:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[1]._websitePolicies.data.__lx[8], &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
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

- (id)_customUserAgent
{
  if (*(void *)&self[1]._websitePolicies.data.__lx[8]) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1EEA10550;
  }
}

- (void)_setCustomUserAgentAsSiteSpecificQuirks:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[1]._websitePolicies.data.__lx[16], &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
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

- (id)_customUserAgentAsSiteSpecificQuirks
{
  if (*(void *)&self[1]._websitePolicies.data.__lx[16]) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1EEA10550;
  }
}

- (void)_setCustomNavigatorPlatform:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self[1]._websitePolicies.data.__lx[24], &v6);
  uint64_t v5 = v6;
  uint64_t v6 = 0;
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

- (id)_customNavigatorPlatform
{
  if (*(void *)&self[1]._websitePolicies.data.__lx[24]) {
    return (id)WTF::StringImpl::operator NSString *();
  }
  else {
    return &stru_1EEA10550;
  }
}

- (BOOL)_allowSiteSpecificQuirksToOverrideCompatibilityMode
{
  return self[2]._websitePolicies.data.__lx[23];
}

- (void)_setAllowSiteSpecificQuirksToOverrideCompatibilityMode:(BOOL)a3
{
  self[2]._websitePolicies.data.__lx[23] = a3;
}

- (id)_applicationNameForUserAgentWithModernCompatibility
{
  uint64_t v2 = *(WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[32];
  if (!v2) {
    return &stru_1EEA10550;
  }
  *(_DWORD *)v2 += 2;
  uint64_t v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (void)setAllowsContentJavaScript:(BOOL)allowsContentJavaScript
{
  self[2]._websitePolicies.data.__lx[14] = allowsContentJavaScript;
}

- (BOOL)allowsContentJavaScript
{
  return self[2]._websitePolicies.data.__lx[14];
}

- (void)_setCaptivePortalModeEnabled:(BOOL)a3
{
  __int16 v3 = a3;
  if (!a3 && (WTF::processHasEntitlement() & 1) == 0 && (WTF::processHasEntitlement() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The 'com.apple.developer.web-browser' restricted entitlement is required to disable Lockdown mode"];
  }
  LOWORD(self[3].super.isa) = v3 | 0x100;
}

- (void)_setAllowPrivacyProxy:(BOOL)a3
{
  self[2]._websitePolicies.data.__lx[22] = a3;
}

- (BOOL)_allowPrivacyProxy
{
  return self[2]._websitePolicies.data.__lx[22];
}

- (unint64_t)_colorSchemePreference
{
  int v2 = self[2]._websitePolicies.data.__lx[17];
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (void)_setColorSchemePreference:(unint64_t)a3
{
  if (a3 <= 2) {
    self[2]._websitePolicies.data.__lx[17] = a3;
  }
}

- (WKContentMode)preferredContentMode
{
  int v2 = self[2]._websitePolicies.data.__lx[18];
  if (v2 == 2) {
    return 2;
  }
  else {
    return (unint64_t)(v2 == 1);
  }
}

- (void)_setMouseEventPolicy:(unint64_t)a3
{
  self[2]._websitePolicies.data.__lx[15] = a3 == 1;
}

- (unint64_t)_mouseEventPolicy
{
  return self[2]._websitePolicies.data.__lx[15] == 1;
}

- (void)_setModalContainerObservationPolicy:(unint64_t)a3
{
  self[2]._websitePolicies.data.__lx[16] = a3 == 1;
}

- (unint64_t)_modalContainerObservationPolicy
{
  return self[2]._websitePolicies.data.__lx[16];
}

- (BOOL)isLockdownModeEnabled
{
  return API::WebsitePolicies::lockdownModeEnabled((API::WebsitePolicies *)&self->_websitePolicies);
}

- (void)setLockdownModeEnabled:(BOOL)lockdownModeEnabled
{
  __int16 v3 = lockdownModeEnabled;
  if (!lockdownModeEnabled && (WTF::processHasEntitlement() & 1) == 0 && (WTF::processHasEntitlement() & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The 'com.apple.developer.web-browser' restricted entitlement is required to disable lockdown mode"];
  }
  LOWORD(self[3].super.isa) = v3 | 0x100;
}

- (void)setPreferredHTTPSNavigationPolicy:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  self[2]._websitePolicies.data.__lx[20] = v3;
}

- (int64_t)preferredHTTPSNavigationPolicy
{
  if (self[2]._websitePolicies.data.__lx[20] - 1 < 3) {
    return (self[2]._websitePolicies.data.__lx[20] - 1) + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_networkConnectionIntegrityEnabled
{
  return (~*(unsigned __int16 *)&self[1]._websitePolicies.data.__lx[40] & 0x1C1) == 0;
}

- (void)_setNetworkConnectionIntegrityEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 449;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self[1]._websitePolicies.data.__lx[40] = *(_WORD *)&self[1]._websitePolicies.data.__lx[40] & 0xFE3E | v3;
}

- (unint64_t)_networkConnectionIntegrityPolicy
{
  return *(_WORD *)&self[1]._websitePolicies.data.__lx[40] & 0x1FF;
}

- (void)_setNetworkConnectionIntegrityPolicy:(unint64_t)a3
{
  *(_WORD *)&self[1]._websitePolicies.data.__lx[40] = a3 & 0x1FF;
}

- (void)_setVisibilityAdjustmentSelectorsIncludingShadowHosts:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  unint64_t v5 = [a3 count];
  if (v5)
  {
    if (v5 >> 28)
    {
      __break(0xC471u);
LABEL_46:
      JUMPOUT(0x198BC5280);
    }
    LODWORD(v56) = v5;
    uint64_t v55 = WTF::fastMalloc((WTF *)(16 * v5));
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v6)
  {
    uint64_t v37 = *(void *)v52;
    v34 = self;
    id obj = a3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v36 = v6;
      do
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
        uint64_t v49 = 0;
        uint64_t v50 = 0;
        unint64_t v9 = objc_msgSend(v8, "count", v34);
        int v10 = v9;
        if (v9)
        {
          if (v9 >> 29)
          {
            __break(0xC471u);
            goto LABEL_46;
          }
          uint64_t v11 = WTF::fastMalloc((WTF *)(8 * v9));
          LODWORD(v50) = v10;
          uint64_t v49 = v11;
        }
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v13 = [v8 countByEnumeratingWithState:&v45 objects:v58 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v46;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v8);
              }
              long long v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
              v44 = 0;
              unsigned int v17 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize([v16 count]);
              if (v17 <= 8) {
                unsigned int v18 = 8;
              }
              else {
                unsigned int v18 = v17;
              }
              uint64_t v19 = WTF::fastZeroedMalloc((WTF *)(8 * v18 + 16));
              v44 = (WTF::StringImpl **)(v19 + 16);
              *(_DWORD *)(v19 + 8) = v18 - 1;
              *(_DWORD *)(v19 + 12) = v18;
              *(_DWORD *)uint64_t v19 = 0;
              *((_DWORD *)v44 - 3) = 0;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              uint64_t v21 = [v16 countByEnumeratingWithState:&v40 objects:v57 count:16];
              if (v21)
              {
                uint64_t v22 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v41 != v22) {
                      objc_enumerationMutation(v16);
                    }
                    MEMORY[0x19972EAD0](&v39, *(void *)(*((void *)&v40 + 1) + 8 * i));
                    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v44, &v39, v24, (uint64_t)v38);
                    v26 = v39;
                    v39 = 0;
                    if (v26)
                    {
                      if (*(_DWORD *)v26 == 2) {
                        WTF::StringImpl::destroy(v26, v25);
                      }
                      else {
                        *(_DWORD *)v26 -= 2;
                      }
                    }
                  }
                  uint64_t v21 = [v16 countByEnumeratingWithState:&v40 objects:v57 count:16];
                }
                while (v21);
              }
              uint64_t v27 = HIDWORD(v50);
              if (HIDWORD(v50) == v50)
              {
                uint64_t v28 = (WTF::StringImpl ***)WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v49, HIDWORD(v50) + 1, (unint64_t)&v44);
                uint64_t v27 = HIDWORD(v50);
                uint64_t v29 = v49;
                *(void *)(v49 + 8 * HIDWORD(v50)) = 0;
                v30 = *v28;
                *uint64_t v28 = 0;
              }
              else
              {
                uint64_t v29 = v49;
                *(void *)(v49 + 8 * HIDWORD(v50)) = 0;
                v30 = v44;
                v44 = 0;
              }
              *(void *)(v29 + 8 * v27) = v30;
              ++HIDWORD(v50);
              if (v44) {
                WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v44, v20);
              }
              ++v15;
            }
            while (v15 != v13);
            uint64_t v13 = [v8 countByEnumeratingWithState:&v45 objects:v58 count:16];
          }
          while (v13);
        }
        if (HIDWORD(v56) == v56)
        {
          WTF::Vector<WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)&v55, (unint64_t)&v49);
        }
        else
        {
          uint64_t v31 = v55 + 16 * HIDWORD(v56);
          *(void *)uint64_t v31 = 0;
          *(void *)(v31 + 8) = 0;
          uint64_t v32 = v49;
          uint64_t v49 = 0;
          *(void *)uint64_t v31 = v32;
          LODWORD(v32) = v50;
          LODWORD(v50) = 0;
          *(_DWORD *)(v31 + 8) = v32;
          LODWORD(v32) = HIDWORD(v50);
          HIDWORD(v50) = 0;
          *(_DWORD *)(v31 + 12) = v32;
          ++HIDWORD(v56);
        }
        WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v49, v12);
        ++v7;
      }
      while (v7 != v36);
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
      self = v34;
    }
    while (v6);
  }
  API::WebsitePolicies::setVisibilityAdjustmentSelectors((uint64_t)&self->_websitePolicies, (WTF::StringImpl *)&v55);
  WTF::Vector<WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v55, v33);
}

- (id)_visibilityAdjustmentSelectorsIncludingShadowHosts
{
  cf = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)&self[1]._websitePolicies.data.__lx[4]];
  uint64_t v3 = *(unsigned int *)&self[1]._websitePolicies.data.__lx[4];
  if (v3)
  {
    Class isa = self[1].super.isa;
    unint64_t v5 = (Class)((char *)isa + 16 * v3);
    do
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)isa + 3)];
      uint64_t v7 = *((unsigned int *)isa + 3);
      if (v7)
      {
        uint64_t v8 = *(void ***)isa;
        uint64_t v9 = *(void *)isa + 8 * v7;
        do
        {
          id v10 = objc_alloc(MEMORY[0x1E4F1CA80]);
          if (*v8) {
            uint64_t v11 = *((unsigned int *)*v8 - 3);
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = (void *)[v10 initWithCapacity:v11];
          uint64_t v13 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(v8);
          uint64_t v14 = v13;
          long long v16 = v15;
          if (*v8) {
            uint64_t v17 = (uint64_t)&(*v8)[*((unsigned int *)*v8 - 1)];
          }
          else {
            uint64_t v17 = 0;
          }
          if ((void *)v17 != v13)
          {
            do
            {
              if (*v14) {
                unsigned int v18 = (__CFString *)WTF::StringImpl::operator NSString *();
              }
              else {
                unsigned int v18 = &stru_1EEA10550;
              }
              [v12 addObject:v18];
              while (++v14 != v16)
              {
                if ((unint64_t)(*v14 + 1) > 1) {
                  goto LABEL_18;
                }
              }
              uint64_t v14 = v16;
LABEL_18:
              ;
            }
            while (v14 != (void *)v17);
          }
          [v6 addObject:v12];
          if (v12) {
            CFRelease(v12);
          }
          ++v8;
        }
        while (v8 != (void **)v9);
      }
      [cf addObject:v6];
      if (v6) {
        CFRelease(v6);
      }
      Class isa = (Class)((char *)isa + 16);
    }
    while (isa != v5);
  }
  uint64_t v19 = (void *)CFMakeCollectable(cf);

  return v19;
}

- (void)_setVisibilityAdjustmentSelectors:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(*((void *)&v9 + 1) + 8 * v8)];
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v13, 1));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
  [(WKWebpagePreferences *)self _setVisibilityAdjustmentSelectorsIncludingShadowHosts:v5];
  if (v5) {
    CFRelease(v5);
  }
}

- (id)_visibilityAdjustmentSelectors
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = *(unsigned int *)&self[1]._websitePolicies.data.__lx[4];
  if (v4)
  {
    Class isa = self[1].super.isa;
    uint64_t v6 = (Class)((char *)isa + 16 * v4);
    do
    {
      if (*((_DWORD *)isa + 3) == 1)
      {
        uint64_t v7 = *(void **)isa;
        uint64_t v8 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(*(void ***)isa);
        long long v9 = v8;
        long long v11 = v10;
        uint64_t v12 = *v7 ? *v7 + 8 * *(unsigned int *)(*v7 - 4) : 0;
        if ((void *)v12 != v8)
        {
          do
          {
            if (*v9) {
              uint64_t v13 = (__CFString *)WTF::StringImpl::operator NSString *();
            }
            else {
              uint64_t v13 = &stru_1EEA10550;
            }
            [v3 addObject:v13];
            while (++v9 != v11)
            {
              if ((unint64_t)(*v9 + 1) > 1) {
                goto LABEL_14;
              }
            }
            long long v9 = v11;
LABEL_14:
            ;
          }
          while (v9 != (void *)v12);
        }
      }
      Class isa = (Class)((char *)isa + 16);
    }
    while (isa != v6);
  }
  uint64_t v14 = (void *)CFMakeCollectable(v3);

  return v14;
}

- (BOOL)_pushAndNotificationAPIEnabled
{
  return self[2]._websitePolicies.data.__lx[24] == 2;
}

- (void)_setPushAndNotificationAPIEnabled:(BOOL)a3
{
  if (a3) {
    unsigned __int8 v3 = 2;
  }
  else {
    unsigned __int8 v3 = 1;
  }
  self[2]._websitePolicies.data.__lx[24] = v3;
}

@end