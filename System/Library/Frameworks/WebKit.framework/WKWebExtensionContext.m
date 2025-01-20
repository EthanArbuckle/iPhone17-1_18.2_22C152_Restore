@interface WKWebExtensionContext
+ (id)contextForExtension:(id)a3;
+ (void)initialize;
- (BOOL)hasAccessToAllHosts;
- (BOOL)hasAccessToAllURLs;
- (BOOL)hasAccessToPrivateData;
- (BOOL)hasAccessToURL:(id)a3;
- (BOOL)hasAccessToURL:(id)a3 inTab:(id)a4;
- (BOOL)hasActiveUserGestureInTab:(id)a3;
- (BOOL)hasContentModificationRules;
- (BOOL)hasInjectedContent;
- (BOOL)hasInjectedContentForURL:(id)a3;
- (BOOL)hasPermission:(id)a3;
- (BOOL)hasPermission:(id)a3 inTab:(id)a4;
- (BOOL)hasRequestedOptionalAccessToAllHosts;
- (BOOL)isInspectable;
- (BOOL)isLoaded;
- (BOOL)performCommandForKeyCommand:(id)a3;
- (NSArray)commands;
- (NSArray)errors;
- (NSArray)openWindows;
- (NSDictionary)deniedPermissionMatchPatterns;
- (NSDictionary)deniedPermissions;
- (NSDictionary)grantedPermissionMatchPatterns;
- (NSDictionary)grantedPermissions;
- (NSSet)currentPermissionMatchPatterns;
- (NSSet)currentPermissions;
- (NSSet)openTabs;
- (NSSet)unsupportedAPIs;
- (NSString)inspectionName;
- (NSString)uniqueIdentifier;
- (NSURL)_backgroundContentURL;
- (NSURL)baseURL;
- (NSURL)optionsPageURL;
- (NSURL)overrideNewTabPageURL;
- (Object)_apiObject;
- (WKWebExtension)webExtension;
- (WKWebExtensionController)webExtensionController;
- (WKWebExtensionWindow)focusedWindow;
- (WKWebView)_backgroundWebView;
- (WKWebViewConfiguration)webViewConfiguration;
- (id)actionForTab:(id)a3;
- (id)initForExtension:(id)a3;
- (id)menuItemsForTab:(id)a3;
- (id)sidebarForTab:(id)a3;
- (int64_t)permissionStatusForMatchPattern:(id)a3;
- (int64_t)permissionStatusForMatchPattern:(id)a3 inTab:(id)a4;
- (int64_t)permissionStatusForPermission:(id)a3;
- (int64_t)permissionStatusForPermission:(id)a3 inTab:(id)a4;
- (int64_t)permissionStatusForURL:(id)a3;
- (int64_t)permissionStatusForURL:(id)a3 inTab:(id)a4;
- (void)_objc_initiateDealloc;
- (void)_webExtensionContext;
- (void)clearUserGestureInTab:(id)a3;
- (void)dealloc;
- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4;
- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4;
- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4;
- (void)didCloseWindow:(id)a3;
- (void)didDeselectTabs:(id)a3;
- (void)didFocusWindow:(id)a3;
- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5;
- (void)didOpenTab:(id)a3;
- (void)didOpenWindow:(id)a3;
- (void)didReplaceTab:(id)a3 withTab:(id)a4;
- (void)didSelectTabs:(id)a3;
- (void)loadBackgroundContentWithCompletionHandler:(id)a3;
- (void)performActionForTab:(id)a3;
- (void)performCommand:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeniedPermissionMatchPatterns:(id)a3;
- (void)setDeniedPermissions:(id)a3;
- (void)setGrantedPermissionMatchPatterns:(id)a3;
- (void)setGrantedPermissions:(id)a3;
- (void)setHasAccessToPrivateData:(BOOL)a3;
- (void)setHasRequestedOptionalAccessToAllHosts:(BOOL)a3;
- (void)setInspectable:(BOOL)a3;
- (void)setInspectionName:(id)a3;
- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4;
- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4 expirationDate:(id)a5;
- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4;
- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4 expirationDate:(id)a5;
- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4;
- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4 expirationDate:(id)a5;
- (void)setUniqueIdentifier:(id)a3;
- (void)setUnsupportedAPIs:(id)a3;
- (void)userGesturePerformedInTab:(id)a3;
@end

@implementation WKWebExtensionContext

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionContext.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionContext;
  [(WKWebExtensionContext *)&v3 dealloc];
}

+ (id)contextForExtension:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WKWebExtensionContext.mm", 79, @"Invalid parameter not satisfying: %@", @"[extension isKindOfClass:WKWebExtension.class]" object file lineNumber description];
  }
  v6 = (void *)[objc_alloc((Class)a1) initForExtension:v5];

  return v6;
}

- (id)initForExtension:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 86, @"Invalid parameter not satisfying: %@", @"[extension isKindOfClass:WKWebExtension.class]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WKWebExtensionContext;
  v6 = [(WKWebExtensionContext *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 _webExtension];
    v8 = v6;
    uint64_t v9 = [(WKWebExtensionContext *)v8 _apiObject];
    CFRetain(*(CFTypeRef *)(v7 + 8));
    uint64_t v15 = v7;
    WebKit::WebExtensionContext::WebExtensionContext(v9, &v15);
    uint64_t v10 = v15;
    uint64_t v15 = 0;
    if (v10) {
      CFRelease(*(CFTypeRef *)(v10 + 8));
    }
    *(void *)(v9 + 8) = v8;

    v11 = v8;
  }

  return v6;
}

- (WKWebExtension)webExtension
{
  v2 = *(id **)&self[1]._webExtensionContext.data.__lx[8];
  if (v2) {
    v2 = (id *)WebKit::WebExtensionAction::wrapper(v2);
  }

  return (WKWebExtension *)v2;
}

- (WKWebExtensionController)webExtensionController
{
  uint64_t v2 = *(void *)&self[1]._webExtensionContext.data.__lx[16];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0) {
    id v4 = WebKit::WebExtensionAction::wrapper((id *)(v3 - 16));
  }
  else {
    id v4 = 0;
  }

  return (WKWebExtensionController *)v4;
}

- (BOOL)isLoaded
{
  uint64_t v2 = *(void *)&self[1]._webExtensionContext.data.__lx[16];
  return v2 && *(void *)(v2 + 8) != 0;
}

- (NSArray)errors
{
  return (NSArray *)WebKit::WebExtensionContext::errors((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (NSURL)baseURL
{
  return (NSURL *)WTF::URL::operator NSURL *();
}

- (void)setBaseURL:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 123, @"Invalid parameter not satisfying: %@", @"[baseURL isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  v6 = [v5 scheme];
  MEMORY[0x19972EAD0](&v40, v6);
  WTF::URLParser::maybeCanonicalizeScheme();
  int v8 = v39;
  if (v39)
  {
    uint64_t v9 = v38;
    v38 = 0;
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
  uint64_t v10 = v40;
  v40 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v7);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }

  if (!v8)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    v33 = [v5 scheme];
    [v32 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 124, @"Invalid parameter: '%@' is not a valid URL scheme", v33 object file lineNumber description];
  }
  v11 = [v5 scheme];
  BOOL v12 = +[WKWebView handlesURLScheme:v11];

  if (v12)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = [v5 scheme];
    [v34 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 125, @"Invalid parameter: '%@' is a URL scheme that WKWebView handles natively and cannot be used for extensions", v35 object file lineNumber description];
  }
  objc_super v14 = WebKit::WebExtensionMatchPattern::extensionSchemes(v13);
  uint64_t v15 = [v5 scheme];
  MEMORY[0x19972EAD0](&v38, v15);
  uint64_t v18 = *v14;
  v19 = v38;
  if (v18)
  {
    int v25 = *(_DWORD *)(v18 - 8);
    unsigned int v26 = *((_DWORD *)v38 + 4);
    if (v26 >= 0x100) {
      unsigned int v27 = v26 >> 8;
    }
    else {
      unsigned int v27 = WTF::StringImpl::hashSlowCase(v38);
    }
    for (i = 0; ; unsigned int v27 = i + v29)
    {
      int v29 = v27 & v25;
      v30 = *(WTF **)(v18 + 8 * (v27 & v25));
      if (v30 != (WTF *)-1)
      {
        if (!v30)
        {
          LOBYTE(v18) = 0;
          goto LABEL_42;
        }
        if (WTF::equal(v30, v38, v17)) {
          break;
        }
      }
      ++i;
    }
    LOBYTE(v18) = 1;
LABEL_42:
    v19 = v38;
  }
  v38 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v16);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }

  if ((v18 & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = [v5 scheme];
    [v36 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 126, @"Invalid parameter: '%@' is not a registered custom scheme with WKWebExtensionMatchPattern", v37 object file lineNumber description];
  }
  v20 = [v5 path];
  if ([v20 length])
  {
    v21 = [v5 path];
    char v22 = [v21 isEqualToString:@"/"];

    if (v22) {
      goto LABEL_27;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"WKWebExtensionContext.mm" lineNumber:127 description:@"Invalid parameter: a URL with a path cannot be used"];
  }

LABEL_27:
  MEMORY[0x19972E8A0](&v38, v5);
  WebKit::WebExtensionContext::setBaseURL((WTF::StringImpl *)&self->_webExtensionContext, (WTF::URL *)&v38);
  v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2) {
      WTF::StringImpl::destroy(v24, v23);
    }
    else {
      *(_DWORD *)v24 -= 2;
    }
  }
}

- (NSString)uniqueIdentifier
{
  if (*(void *)&self[2]._webExtensionContext.data.__lx[8]) {
    uint64_t v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v2 = &stru_1EEA10550;
  }
  uint64_t v3 = v2;

  return (NSString *)v3;
}

- (void)setUniqueIdentifier:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 139, @"Invalid parameter not satisfying: %@", @"[uniqueIdentifier isKindOfClass:NSString.class]" object file lineNumber description];
  }
  MEMORY[0x19972EAD0](&v9, v5);
  WebKit::WebExtensionContext::setUniqueIdentifier((uint64_t *)&self->_webExtensionContext, &v9);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
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

- (BOOL)isInspectable
{
  return self[2]._webExtensionContext.data.__lx[32];
}

- (void)setInspectable:(BOOL)a3
{
}

- (NSString)inspectionName
{
  return (NSString *)WebKit::WebExtensionContext::backgroundWebViewInspectionName((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (void)setInspectionName:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WebKit::WebExtensionContext::setBackgroundWebViewInspectionName((WebKit::WebExtensionContext *)&self->_webExtensionContext, &v6);
  id v5 = v6;
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

- (NSSet)unsupportedAPIs
{
  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::HashTable((uint64_t *)&v5, (void **)&self[2]._webExtensionContext.data.__lx[40]);
  uint64_t v3 = WebKit::toAPI(&v5);
  if (v5) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v5, v2);
  }

  return (NSSet *)v3;
}

- (void)setUnsupportedAPIs:(id)a3
{
  id v5 = (WebKit *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 171, @"Invalid parameter not satisfying: %@", @"!unsupportedAPIs || [unsupportedAPIs isKindOfClass:NSSet.class]" object file lineNumber description];
    }
  }
  WebKit::toImpl(v5, (uint64_t *)&v11);
  uint64_t v7 = *(void *)&self[1]._webExtensionContext.data.__lx[16];
  if (!v7 || !*(void *)(v7 + 8))
  {
    int v8 = v11;
    v11 = 0;
    uint64_t v9 = *(WTF::StringImpl ***)&self[2]._webExtensionContext.data.__lx[40];
    *(void *)&self[2]._webExtensionContext.data.__lx[40] = v8;
    if (!v9) {
      goto LABEL_9;
    }
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v9, v6);
  }
  if (v11) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v11, v6);
  }
LABEL_9:
}

- (WKWebViewConfiguration)webViewConfiguration
{
  return (WKWebViewConfiguration *)WebKit::WebExtensionContext::webViewConfiguration((uint64_t)&self->_webExtensionContext, 5);
}

- (NSURL)optionsPageURL
{
  WebKit::WebExtensionContext::optionsPageURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (WTF::URL *)&v6);
  id v3 = (id)WTF::URL::operator NSURL *();
  id v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }

  return (NSURL *)v3;
}

- (NSURL)overrideNewTabPageURL
{
  WebKit::WebExtensionContext::overrideNewTabPageURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (WTF::URL *)&v6);
  id v3 = (id)WTF::URL::operator NSURL *();
  id v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }

  return (NSURL *)v3;
}

- (NSDictionary)grantedPermissions
{
  p_webExtensionContext = &self[3]._webExtensionContext;
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext, (double *)&self[3]._webExtensionContext.data.__lx[16], @"WKWebExtensionContextGrantedPermissionsWereRemoved");

  return (NSDictionary *)toAPI(p_webExtensionContext);
}

- (void)setGrantedPermissions:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 252, @"Invalid parameter not satisfying: %@", @"[grantedPermissions isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setGrantedPermissions((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v8, v6);
  }
}

- (NSDictionary)grantedPermissionMatchPatterns
{
  uint64_t v2 = &self[3]._webExtensionContext.data.__lx[32];
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext.data.__lx[32], (double *)&self[4], @"WKWebExtensionContextGrantedPermissionMatchPatternsWereRemoved");

  return (NSDictionary *)toAPI((void **)v2);
}

- (void)setGrantedPermissionMatchPatterns:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 264, @"Invalid parameter not satisfying: %@", @"[grantedPermissionMatchPatterns isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setGrantedPermissionMatchPatterns((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8, 1);
  if (v8) {
    WTF::HashTable<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,WTF::KeyValuePair<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int>>,WTF::DefaultHash<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashMap<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int,WTF::DefaultHash<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashTraits<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashTraits<unsigned int>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>>::deallocateTable(v8, v6);
  }
}

- (NSDictionary)deniedPermissions
{
  uint64_t v2 = &self[3]._webExtensionContext.data.__lx[8];
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext.data.__lx[8], (double *)&self[3]._webExtensionContext.data.__lx[24], @"WKWebExtensionContextDeniedPermissionsWereRemoved");

  return (NSDictionary *)toAPI((void **)v2);
}

- (void)setDeniedPermissions:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 276, @"Invalid parameter not satisfying: %@", @"[deniedPermissions isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setDeniedPermissions((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  if (v8) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v8, v6);
  }
}

- (NSDictionary)deniedPermissionMatchPatterns
{
  uint64_t v2 = &self[3]._webExtensionContext.data.__lx[40];
  WebKit::WebExtensionContext::removeExpired((uint64_t)&self->_webExtensionContext, (uint64_t *)&self[3]._webExtensionContext.data.__lx[40], (double *)self[4]._webExtensionContext.data.__lx, @"WKWebExtensionContextDeniedPermissionMatchPatternsWereRemoved");

  return (NSDictionary *)toAPI((void **)v2);
}

- (void)setDeniedPermissionMatchPatterns:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 288, @"Invalid parameter not satisfying: %@", @"[deniedPermissionMatchPatterns isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  toImpl((uint64_t *)&v8, v5);
  WebKit::WebExtensionContext::setDeniedPermissionMatchPatterns((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8, 1);
  if (v8) {
    WTF::HashTable<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,WTF::KeyValuePair<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int>>,WTF::DefaultHash<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashMap<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>,unsigned int,WTF::DefaultHash<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashTraits<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>,WTF::HashTraits<unsigned int>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RefPtr<API::ContentWorld,WTF::RawPtrTraits<API::ContentWorld>,WTF::DefaultRefDerefTraits<API::ContentWorld>>>>::deallocateTable(v8, v6);
  }
}

- (BOOL)hasRequestedOptionalAccessToAllHosts
{
  return (BOOL)self[5].super.isa;
}

- (void)setHasRequestedOptionalAccessToAllHosts:(BOOL)a3
{
  LOBYTE(self[5].super.isa) = a3;
}

- (BOOL)hasAccessToPrivateData
{
  return BYTE1(self[5].super.isa);
}

- (void)setHasAccessToPrivateData:(BOOL)a3
{
}

- (NSSet)currentPermissions
{
  WebKit::WebExtensionContext::currentPermissions((WebKit::WebExtensionContext *)&self->_webExtensionContext, &v9);
  if (*v9 && *(_DWORD *)(*v9 - 12))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:");
    id v3 = v10;
    id v4 = v12;
    if (v10 != v12)
    {
      id v5 = v11;
      do
      {
        if (*v3) {
          v6 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
        }
        else {
          v6 = &stru_1EEA10550;
        }
        [v2 addObject:v6];

        while (1)
        {
          v3 += 2;
          if (v3 == v5) {
            break;
          }
          if ((unint64_t)(*v3 + 1) > 1) {
            goto LABEL_12;
          }
        }
        id v3 = v5;
LABEL_12:
        ;
      }
      while (v3 != v4);
    }
    uint64_t v7 = (void *)[v2 copy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v7;
}

- (NSSet)currentPermissionMatchPatterns
{
  WebKit::WebExtensionContext::currentPermissionMatchPatterns((WebKit::WebExtensionContext *)&self->_webExtensionContext, &v9);
  if (*v9 && *(_DWORD *)(*v9 - 12))
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:");
    id v3 = v10;
    id v4 = v12;
    if (v10 != v12)
    {
      id v5 = v11;
      do
      {
        id v6 = WebKit::WebExtensionAction::wrapper(*v3);
        [v2 addObject:v6];

        while (1)
        {
          v3 += 2;
          if (v3 == v5) {
            break;
          }
          if ((unint64_t)*v3 + 1 > 1) {
            goto LABEL_10;
          }
        }
        id v3 = v5;
LABEL_10:
        ;
      }
      while (v3 != v4);
    }
    uint64_t v7 = (void *)[v2 copy];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v7;
}

- (BOOL)hasPermission:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 351, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];
  }
  BOOL v6 = [(WKWebExtensionContext *)self hasPermission:v5 inTab:0];

  return v6;
}

- (BOOL)hasPermission:(id)a3 inTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 358, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 360, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  MEMORY[0x19972EAD0](&v18, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  id v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v19);
    v11 = v19;
    if (v19)
    {
      ++*(_DWORD *)v19;
      v19 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  int v13 = WebKit::WebExtensionContext::permissionState((WTF::StringImpl *)p_webExtensionContext, &v18, v11, 2);
  if (v11) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  }
  objc_super v14 = v18;
  uint64_t v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }

  return (v13 & 0xFFFFFFFE) == 2;
}

- (BOOL)hasAccessToURL:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 367, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  BOOL v6 = [(WKWebExtensionContext *)self hasAccessToURL:v5 inTab:0];

  return v6;
}

- (BOOL)hasAccessToURL:(id)a3 inTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 374, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 376, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  MEMORY[0x19972E8A0](&v18, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  id v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v19);
    v11 = v19;
    if (v19)
    {
      ++LODWORD(v19->m_string.m_impl.m_ptr);
      v19 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  int v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v18, v11, 3);
  if (v11) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  }
  m_ptr = v18.m_string.m_impl.m_ptr;
  v18.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }

  return (v13 & 0xFFFFFFFE) == 2;
}

- (int64_t)permissionStatusForPermission:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 426, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];
  }
  int64_t v6 = [(WKWebExtensionContext *)self permissionStatusForPermission:v5 inTab:0];

  return v6;
}

- (int64_t)permissionStatusForPermission:(id)a3 inTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 433, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    URL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 435, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  MEMORY[0x19972EAD0](&v19, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  id v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v20);
    v11 = v20;
    if (v20)
    {
      ++*(_DWORD *)v20;
      v20 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  int v13 = WebKit::WebExtensionContext::permissionState((WTF::StringImpl *)p_webExtensionContext, &v19, v11, 0);
  if (v11) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  }
  objc_super v14 = v19;
  v19 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  if ((v13 + 2) >= 6) {
    int64_t v15 = -3;
  }
  else {
    int64_t v15 = (v13 + 2) - 2;
  }

  return v15;
}

- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4
{
  id v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 442, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 443, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];
  }
  [(WKWebExtensionContext *)self setPermissionStatus:a3 forPermission:v9 expirationDate:0];
}

- (void)setPermissionStatus:(int64_t)a3 forPermission:(id)a4 expirationDate:(id)a5
{
  id v9 = a4;
  id v10 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 450, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 451, @"Invalid parameter not satisfying: %@", @"[permission isKindOfClass:NSString.class]" object file lineNumber description];
  }
  if ((unint64_t)(a3 + 3) >= 7) {
    LOBYTE(a3) = 0;
  }
  MEMORY[0x19972EAD0](&v16, v9);
  double v12 = toImpl(v10);
  WebKit::WebExtensionContext::setPermissionState((uint64_t)&self->_webExtensionContext, (char)a3, &v16, v12);
  objc_super v14 = v16;
  v16 = 0;
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

- (int64_t)permissionStatusForURL:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 458, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  int64_t v6 = [(WKWebExtensionContext *)self permissionStatusForURL:v5 inTab:0];

  return v6;
}

- (int64_t)permissionStatusForURL:(id)a3 inTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 465, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    URL v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 467, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  MEMORY[0x19972E8A0](&v19, v7);
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  id v10 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v10, (uint64_t)&v20);
    v11 = v20;
    if (v20)
    {
      ++LODWORD(v20->m_string.m_impl.m_ptr);
      v20 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
    }
  }
  else
  {
    v11 = 0;
  }

  int v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, &v19, v11, 1);
  if (v11) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  }
  m_ptr = v19.m_string.m_impl.m_ptr;
  v19.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, v12);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }
  if ((v13 + 2) >= 6) {
    int64_t v15 = -3;
  }
  else {
    int64_t v15 = (v13 + 2) - 2;
  }

  return v15;
}

- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4
{
  id v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 474, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 475, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  [(WKWebExtensionContext *)self setPermissionStatus:a3 forURL:v9 expirationDate:0];
}

- (void)setPermissionStatus:(int64_t)a3 forURL:(id)a4 expirationDate:(id)a5
{
  id v9 = a4;
  id v10 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 482, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 483, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  if ((unint64_t)(a3 + 3) >= 7) {
    LOBYTE(a3) = 0;
  }
  MEMORY[0x19972E8A0](v16, v9);
  double v12 = toImpl(v10);
  WebKit::WebExtensionContext::setPermissionState((double *)self->_webExtensionContext.data.__lx, (char)a3, (uint64_t)v16, v12);
  objc_super v14 = v16[0];
  v16[0] = 0;
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

- (int64_t)permissionStatusForMatchPattern:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 490, @"Invalid parameter not satisfying: %@", @"[pattern isKindOfClass:WKWebExtensionMatchPattern.class]" object file lineNumber description];
  }
  int64_t v6 = [(WKWebExtensionContext *)self permissionStatusForMatchPattern:v5 inTab:0];

  return v6;
}

- (int64_t)permissionStatusForMatchPattern:(id)a3 inTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 497, @"Invalid parameter not satisfying: %@", @"[pattern isKindOfClass:WKWebExtensionMatchPattern.class]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 499, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  uint64_t v9 = [v7 _webExtensionMatchPattern];
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  id v11 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v11, (uint64_t)&v18);
    double v12 = v18;
    if (v18)
    {
      ++*(_DWORD *)v18;
      URL v18 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
    }
  }
  else
  {
    double v12 = 0;
  }

  int v13 = WebKit::WebExtensionContext::permissionState((uint64_t)p_webExtensionContext, v9, v12, 1);
  if (v12) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
  }
  if ((v13 + 2) >= 6) {
    int64_t v14 = -3;
  }
  else {
    int64_t v14 = (v13 + 2) - 2;
  }

  return v14;
}

- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4
{
  id v9 = a4;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 506, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 507, @"Invalid parameter not satisfying: %@", @"[pattern isKindOfClass:WKWebExtensionMatchPattern.class]" object file lineNumber description];
  }
  [(WKWebExtensionContext *)self setPermissionStatus:a3 forMatchPattern:v9 expirationDate:0];
}

- (void)setPermissionStatus:(int64_t)a3 forMatchPattern:(id)a4 expirationDate:(id)a5
{
  id v15 = a4;
  id v9 = (NSDate *)a5;
  if ((unint64_t)(a3 + 3) > 6 || ((1 << (a3 + 3)) & 0x49) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 514, @"Invalid parameter not satisfying: %@", @"status == WKWebExtensionContextPermissionStatusDeniedExplicitly || status == WKWebExtensionContextPermissionStatusUnknown || status == WKWebExtensionContextPermissionStatusGrantedExplicitly" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 515, @"Invalid parameter not satisfying: %@", @"[pattern isKindOfClass:WKWebExtensionMatchPattern.class]" object file lineNumber description];
  }
  if ((unint64_t)(a3 + 3) >= 7) {
    char v11 = 0;
  }
  else {
    char v11 = a3;
  }
  uint64_t v12 = [v15 _webExtensionMatchPattern];
  double v13 = toImpl(v9);
  WebKit::WebExtensionContext::setPermissionState((double *)self->_webExtensionContext.data.__lx, v11, v12, v13);
}

- (BOOL)hasAccessToAllURLs
{
  return WebKit::WebExtensionContext::hasAccessToAllURLs((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (BOOL)hasAccessToAllHosts
{
  return WebKit::WebExtensionContext::hasAccessToAllHosts((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (BOOL)hasInjectedContent
{
  WebKit::WebExtensionContext::injectedContents((WebKit::WebExtensionContext *)&self->_webExtensionContext, (uint64_t)v5);
  BOOL v2 = v5[3] != 0;
  WTF::Vector<WebKit::WebExtension::InjectedContentData,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v5, v3);
  return v2;
}

- (BOOL)hasInjectedContentForURL:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 537, @"Invalid parameter not satisfying: %@", @"[url isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  MEMORY[0x19972E8A0](v11, v5);
  char hasInjectedContentForURL = WebKit::WebExtensionContext::hasInjectedContentForURL((WebKit::WebExtensionContext *)&self->_webExtensionContext, (const WTF::URL *)v11);
  id v8 = v11[0];
  v11[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }

  return hasInjectedContentForURL;
}

- (BOOL)hasContentModificationRules
{
  return WebKit::WebExtensionContext::hasContentModificationRules((WebKit::WebExtensionContext *)&self->_webExtensionContext);
}

- (void)loadBackgroundContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _Block_copy(v4);
  int64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v6 = &unk_1EEA0F7D8;
  v6[1] = v5;
  id v8 = v6;
  WebKit::WebExtensionContext::loadBackgroundContent((uint64_t)&self->_webExtensionContext, (uint64_t *)&v8);
  uint64_t v7 = (uint64_t)v8;
  id v8 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

- (id)actionForTab:(id)a3
{
  id v5 = a3;
  int64_t v6 = v5;
  if (v5)
  {
    if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 555, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
    }
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v6, (uint64_t)&v14);
    id v8 = v14;
    if (v14)
    {
      ++*(_DWORD *)v14;
      int64_t v14 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
    }
  }
  else
  {
    id v8 = 0;
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  }

  WebKit::WebExtensionContext::getOrCreateAction((WebKit::WebExtensionContext *)p_webExtensionContext, v8, (uint64_t *)&v13);
  id v9 = WebKit::WebExtensionAction::wrapper((id *)v13);
  id v10 = v13;
  double v13 = 0;
  if (v10) {
    CFRelease(*((CFTypeRef *)v10 + 1));
  }
  if (v8) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
  }

  return v9;
}

- (void)performActionForTab:(id)a3
{
  id v5 = a3;
  int64_t v6 = v5;
  if (v5)
  {
    if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 563, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
    }
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v6, (uint64_t)&v10);
    id v8 = v10;
    if (v10)
    {
      ++*(_DWORD *)v10;
      id v10 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
    }
  }
  else
  {
    id v8 = 0;
    p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  }

  WebKit::WebExtensionContext::performAction((WebKit::WebExtensionContext *)p_webExtensionContext, v8, 1);
  if (v8) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
  }
}

- (NSArray)commands
{
  WebKit::WebExtensionContext::commands((WebKit::WebExtensionContext *)&self->_webExtensionContext);
  id v3 = v2;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)v2 + 3)];
  id v5 = v4;
  CFTypeRef cf = v4;
  if (v4) {
    CFRetain(v4);
  }

  uint64_t v6 = *((unsigned int *)v3 + 3);
  if (v6)
  {
    uint64_t v7 = *v3;
    uint64_t v8 = 8 * v6;
    do
    {
      WTF::RetainPtr<NSSet>::get((id *)&cf);
      id v9 = (WTF *)objc_claimAutoreleasedReturnValue();
      id v10 = (NSMutableArray *)*(id *)(*(void *)v7 + 8);
      WTF::addUnlessNil(v9, v10, v11);

      v7 += 8;
      v8 -= 8;
    }
    while (v8);
  }
  uint64_t v12 = WTF::RetainPtr<NSSet>::get((id *)&cf);
  CFTypeRef v13 = cf;
  CFTypeRef cf = 0;
  if (v13) {
    CFRelease(v13);
  }

  return (NSArray *)v12;
}

- (void)performCommand:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 577, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:WKWebExtensionCommand.class]" object file lineNumber description];
  }
  WebKit::WebExtensionContext::performCommand((uint64_t)&self->_webExtensionContext, (WebKit::WebExtensionCommand *)[v6 _webExtensionCommand], 1);
}

- (BOOL)performCommandForKeyCommand:(id)a3
{
  id v5 = (UIKeyCommand *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 585, @"Invalid parameter not satisfying: %@", @"[keyCommand isKindOfClass:UIKeyCommand.class]" object file lineNumber description];
  }
  char v6 = WebKit::WebExtensionContext::performCommand((WebKit::WebExtensionContext *)&self->_webExtensionContext, v5);

  return v6;
}

- (id)menuItemsForTab:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 611, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v11);
  uint64_t v7 = WebKit::WebExtensionContext::platformMenuItems((WebKit::WebExtension **)p_webExtensionContext, v11);
  uint64_t v8 = v11;
  char v11 = 0;
  if (v8) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v8);
  }

  return v7;
}

- (void)userGesturePerformedInTab:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 618, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::userGesturePerformed((WebKit::WebExtensionContext *)p_webExtensionContext, v9);
  uint64_t v7 = v9;
  id v9 = 0;
  if (v7) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v7);
  }
}

- (BOOL)hasActiveUserGestureInTab:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    char v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 625, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  WebKit::WebExtensionContext::getOrCreateTab((uint64_t *)&self->_webExtensionContext, v5, (uint64_t)&v12);
  uint64_t v6 = v12;
  uint64_t v7 = *(void *)&self[1]._webExtensionContext.data.__lx[16];
  if (v7 && *(void *)(v7 + 8))
  {
    int v8 = *(_DWORD *)(v12 + 50) & 1;
    uint64_t v12 = 0;
LABEL_7:
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v6);
    BOOL v9 = v8;
    goto LABEL_8;
  }
  LOBYTE(v8) = 0;
  BOOL v9 = 0;
  uint64_t v12 = 0;
  if (v6) {
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (void)clearUserGestureInTab:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 632, @"Invalid parameter not satisfying: %@", @"[tab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::clearUserGesture((uint64_t)p_webExtensionContext, v9);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v7);
  }
}

- (NSArray)openWindows
{
  WebKit::WebExtensionContext::openWindows((unsigned int *)self->_webExtensionContext.data.__lx, (void *)1, (uint64_t)&v12);
  if (v13)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v3 = (void *)[v2 initWithCapacity:v13];
    if (v13)
    {
      id v4 = v12;
      uint64_t v5 = 8 * v13;
      do
      {
        uint64_t v6 = *v4;
        uint64_t v7 = *v4;
        *uint64_t v7 = **v4 + 1;
        id WeakRetained = objc_loadWeakRetained((id *)v7 + 4);
        if (WeakRetained) {
          [v3 addObject:WeakRetained];
        }

        WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v6);
        ++v4;
        v5 -= 8;
      }
      while (v5);
    }
    uint64_t v9 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1C978] array];
  }
  WTF::Vector<WTF::Ref<WebKit::WebExtensionWindow,WTF::RawPtrTraits<WebKit::WebExtensionWindow>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionWindow>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v10);

  return (NSArray *)v9;
}

- (WKWebExtensionWindow)focusedWindow
{
  if (LOBYTE(self[10].super.isa)
    && (WebKit::WebExtensionContext::getWindow((uint64_t)&self->_webExtensionContext, *(void *)&self[9]._webExtensionContext.data.__lx[40], 0, 0, 1, &v5), (uint64_t v2 = v5) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 32));
    WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v2);
  }
  else
  {
    id WeakRetained = 0;
  }

  return (WKWebExtensionWindow *)WeakRetained;
}

- (NSSet)openTabs
{
  WebKit::WebExtensionContext::openTabs((uint64_t)&self->_webExtensionContext, (void *)1, (uint64_t)&v12);
  if (v13)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v3 = (void *)[v2 initWithCapacity:v13];
    if (v13)
    {
      id v4 = v12;
      uint64_t v5 = 8 * v13;
      do
      {
        uint64_t v6 = *v4;
        uint64_t v7 = *v4;
        *uint64_t v7 = **v4 + 1;
        id WeakRetained = objc_loadWeakRetained((id *)v7 + 4);
        if (WeakRetained) {
          [v3 addObject:WeakRetained];
        }

        WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v6);
        ++v4;
        v5 -= 8;
      }
      while (v5);
    }
    uint64_t v9 = (void *)[v3 copy];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  WTF::Vector<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v12, v10);

  return (NSSet *)v9;
}

- (void)didOpenWindow:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 694, @"Invalid parameter not satisfying: %@", @"[newWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
  p_webExtensionContext = &self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didOpenWindow((uint64_t)p_webExtensionContext, v9, 1, 0);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v7);
  }
}

- (void)didCloseWindow:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 701, @"Invalid parameter not satisfying: %@", @"[closedWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
  p_webExtensionContext = &self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didCloseWindow((WebKit::WebExtensionContext *)p_webExtensionContext, v9);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    WTF::RefCounted<WebKit::WebExtensionWindow>::deref((uint64_t)v7);
  }
}

- (void)didFocusWindow:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (([v5 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 709, @"Invalid parameter not satisfying: %@", @"[focusedWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
    }
    p_webExtensionContext = &self->_webExtensionContext;
    WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v6, (uint64_t)&v11);
    int v8 = v11;
  }
  else
  {
    int v8 = 0;
    p_webExtensionContext = &self->_webExtensionContext;
  }
  WebKit::WebExtensionContext::didFocusWindow((uint64_t)p_webExtensionContext, v8, 0);
  if (v6)
  {
    uint64_t v9 = (uint64_t)v11;
    char v11 = 0;
    if (v9) {
      WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v9);
    }
  }
}

- (void)didOpenTab:(id)a3
{
  id v5 = a3;
  if (([v5 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 739, @"Invalid parameter not satisfying: %@", @"[newTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v5, (uint64_t)&v9);
  WebKit::WebExtensionContext::didOpenTab((uint64_t)p_webExtensionContext, v9, 0);
  uint64_t v7 = v9;
  uint64_t v9 = 0;
  if (v7) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v7);
  }
}

- (void)didCloseTab:(id)a3 windowIsClosing:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([v7 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 746, @"Invalid parameter not satisfying: %@", @"[closedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v11);
  WebKit::WebExtensionContext::didCloseTab(p_webExtensionContext, v11, v4, 0);
  uint64_t v9 = v11;
  char v11 = 0;
  if (v9) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v9);
  }
}

- (void)didActivateTab:(id)a3 previousActiveTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 conformsToProtocol:&unk_1EEA97528])
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 753, @"Invalid parameter not satisfying: %@", @"[activatedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 755, @"Invalid parameter not satisfying: %@", @"[previousTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
LABEL_5:
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab((uint64_t *)&self->_webExtensionContext, v7, (uint64_t)&v16);
  uint64_t v10 = v16;
  id v11 = v8;
  if (v8)
  {
    WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v11, (uint64_t)&v17);
    uint64_t v12 = v17;
    if (v17)
    {
      ++*(_DWORD *)v17;
      v17 = 0;
      WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  WebKit::WebExtensionContext::didActivateTab((WebKit::WebExtensionContext *)p_webExtensionContext, v10, v12);
  if (v12) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v12);
  }
  uint64_t v13 = v16;
  uint64_t v16 = 0;
  if (v13) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v13);
  }
}

- (void)didSelectTabs:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 762, @"Invalid parameter not satisfying: %@", @"[selectedTabs isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  toImpl((uint64_t *)&v9, v5, p_webExtensionContext);
  WebKit::WebExtensionContext::didSelectOrDeselectTabs((uint64_t)p_webExtensionContext, &v9);
  if (v9) {
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>>::deallocateTable((uint64_t *)v9, v7);
  }
}

- (void)didDeselectTabs:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 769, @"Invalid parameter not satisfying: %@", @"[deselectedTabs isKindOfClass:NSSet.class]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  toImpl((uint64_t *)&v9, v5, p_webExtensionContext);
  WebKit::WebExtensionContext::didSelectOrDeselectTabs((uint64_t)p_webExtensionContext, &v9);
  if (v9) {
    WTF::HashTable<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>,WTF::HashTraits<WTF::Ref<WebKit::WebExtensionTab,WTF::RawPtrTraits<WebKit::WebExtensionTab>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionTab>>>>::deallocateTable((uint64_t *)v9, v7);
  }
}

- (void)didMoveTab:(id)a3 fromIndex:(unint64_t)a4 inWindow:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if ([v9 conformsToProtocol:&unk_1EEA97528])
  {
    if (!v10) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 776, @"Invalid parameter not satisfying: %@", @"[movedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];

    if (!v10) {
      goto LABEL_5;
    }
  }
  if (([v10 conformsToProtocol:&unk_1EEA97770] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 778, @"Invalid parameter not satisfying: %@", @"[oldWindow conformsToProtocol:@protocol(WKWebExtensionWindow)]" object file lineNumber description];
  }
LABEL_5:
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v9, (uint64_t)&v19);
  uint64_t v12 = v19;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = -1;
  }
  if (v10)
  {
    WebKit::WebExtensionContext::getOrCreateWindow((uint64_t)p_webExtensionContext, v10, (uint64_t)&v18);
    uint64_t v13 = v18;
  }
  else
  {
    uint64_t v13 = 0;
  }
  WebKit::WebExtensionContext::didMoveTab((WebKit::WebExtensionContext *)p_webExtensionContext, v12, a4, v13);
  if (v10)
  {
    uint64_t v14 = (uint64_t)v18;
    URL v18 = 0;
    if (v14) {
      WTF::RefCounted<WebKit::WebExtensionWindow>::deref(v14);
    }
  }
  uint64_t v15 = (uint64_t)v19;
  URL v19 = 0;
  if (v15) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v15);
  }
}

- (void)didReplaceTab:(id)a3 withTab:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 785, @"Invalid parameter not satisfying: %@", @"[oldTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  if (([v8 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 786, @"Invalid parameter not satisfying: %@", @"[newTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v16);
  id v10 = v16;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v8, (uint64_t)&v15);
  WebKit::WebExtensionContext::didReplaceTab(p_webExtensionContext, v10, v15, 0);
  id v11 = v15;
  uint64_t v15 = 0;
  if (v11) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v11);
  }
  uint64_t v12 = (uint64_t)v16;
  uint64_t v16 = 0;
  if (v12) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v12);
  }
}

- (void)didChangeTabProperties:(unint64_t)a3 forTab:(id)a4
{
  __int16 v4 = a3;
  id v7 = a4;
  if (([v7 conformsToProtocol:&unk_1EEA97528] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WKWebExtensionContext.mm", 830, @"Invalid parameter not satisfying: %@", @"[changedTab conformsToProtocol:@protocol(WKWebExtensionTab)]" object file lineNumber description];
  }
  p_webExtensionContext = (uint64_t *)&self->_webExtensionContext;
  WebKit::WebExtensionContext::getOrCreateTab(p_webExtensionContext, v7, (uint64_t)&v11);
  WebKit::WebExtensionContext::didChangeTabProperties((uint64_t)p_webExtensionContext, v11, v4 & 0x3FE);
  id v9 = v11;
  id v11 = 0;
  if (v9) {
    WTF::RefCounted<WebKit::WebExtensionTab>::deref((uint64_t)v9);
  }
}

- (WKWebView)_backgroundWebView
{
  return (WKWebView *)WTF::RetainPtr<NSSet>::get((id *)&self[6].super.isa);
}

- (NSURL)_backgroundContentURL
{
  WebKit::WebExtensionContext::backgroundContentURL((id **)&self->_webExtensionContext, (WTF::URL *)&v6);
  id v3 = (id)WTF::URL::operator NSURL *();
  __int16 v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }

  return (NSURL *)v3;
}

- (id)sidebarForTab:(id)a3
{
  return 0;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionContext;
}

- (void)_webExtensionContext
{
  return &self->_webExtensionContext;
}

@end