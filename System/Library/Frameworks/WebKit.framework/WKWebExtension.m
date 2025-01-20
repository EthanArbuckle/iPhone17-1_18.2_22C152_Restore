@interface WKWebExtension
+ (void)extensionWithAppExtensionBundle:(id)a3 completionHandler:(id)a4;
+ (void)extensionWithResourceBaseURL:(id)a3 completionHandler:(id)a4;
+ (void)initialize;
- (BOOL)_hasModularBackgroundContent;
- (BOOL)_hasServiceWorkerBackgroundContent;
- (BOOL)_hasSidebar;
- (BOOL)hasBackgroundContent;
- (BOOL)hasCommands;
- (BOOL)hasContentModificationRules;
- (BOOL)hasInjectedContent;
- (BOOL)hasOptionsPage;
- (BOOL)hasOverrideNewTabPage;
- (BOOL)hasPersistentBackgroundContent;
- (BOOL)supportsManifestVersion:(double)a3;
- (NSArray)errors;
- (NSDictionary)manifest;
- (NSLocale)defaultLocale;
- (NSSet)allRequestedMatchPatterns;
- (NSSet)optionalPermissionMatchPatterns;
- (NSSet)optionalPermissions;
- (NSSet)requestedPermissionMatchPatterns;
- (NSSet)requestedPermissions;
- (NSString)displayActionLabel;
- (NSString)displayDescription;
- (NSString)displayName;
- (NSString)displayShortName;
- (NSString)displayVersion;
- (NSString)version;
- (Object)_apiObject;
- (double)manifestVersion;
- (id)_initWithAppExtensionBundle:(id)a3 error:(id *)a4;
- (id)_initWithManifestDictionary:(id)a3;
- (id)_initWithManifestDictionary:(id)a3 resources:(id)a4;
- (id)_initWithResourceBaseURL:(id)a3 error:(id *)a4;
- (id)_initWithResources:(id)a3;
- (id)actionIconForSize:(CGSize)a3;
- (id)iconForSize:(CGSize)a3;
- (void)_objc_initiateDealloc;
- (void)_webExtension;
- (void)dealloc;
@end

@implementation WKWebExtension

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
  (**(void (***)(void))self->_webExtension.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtension;
  [(WKWebExtension *)&v3 dealloc];
}

+ (void)extensionWithAppExtensionBundle:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WKWebExtension.mm", 48, @"Invalid parameter not satisfying: %@", @"[appExtensionBundle isKindOfClass:NSBundle.class]" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__WKWebExtension_extensionWithAppExtensionBundle_completionHandler___block_invoke;
  block[3] = &unk_1E5811108;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__WKWebExtension_extensionWithAppExtensionBundle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v2 = API::Object::newObject(0x168uLL, 110);
  WebKit::WebExtension::WebExtension(v2, *(void **)(a1 + 32), &v5);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    if (!v2) {
      return;
    }
  }
  else
  {
    v4 = WebKit::WebExtensionAction::wrapper((id *)v2);
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);

    if (!v2) {
      return;
    }
  }
  CFRelease(*(CFTypeRef *)(v2 + 8));
}

+ (void)extensionWithResourceBaseURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WKWebExtension.mm", 68, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WKWebExtension.mm", 69, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL isFileURL]" object file lineNumber description];
  }
  if (([v7 hasDirectoryPath] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"WKWebExtension.mm", 70, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL hasDirectoryPath]" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WKWebExtension_extensionWithResourceBaseURL_completionHandler___block_invoke;
  block[3] = &unk_1E5811108;
  id v15 = v7;
  id v16 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__WKWebExtension_extensionWithResourceBaseURL_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v2 = API::Object::newObject(0x168uLL, 110);
  WebKit::WebExtension::WebExtension(v2, *(void **)(a1 + 32), &v5);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    if (!v2) {
      return;
    }
  }
  else
  {
    v4 = WebKit::WebExtensionAction::wrapper((id *)v2);
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);

    if (!v2) {
      return;
    }
  }
  CFRelease(*(CFTypeRef *)(v2 + 8));
}

- (id)_initWithAppExtensionBundle:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 96, @"Invalid parameter not satisfying: %@", @"[appExtensionBundle isKindOfClass:NSBundle.class]" object file lineNumber description];

    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    *a4 = 0;
LABEL_4:
  v15.receiver = self;
  v15.super_class = (Class)WKWebExtension;
  id v8 = [(WKWebExtension *)&v15 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_8;
  }
  id v14 = 0;
  id v10 = v8;
  *(void *)(WebKit::WebExtension::WebExtension((uint64_t)[(WKWebExtension *)v10 _apiObject], v7, &v14) + 8) = v10;

  if (!v14)
  {
    v11 = v10;
    goto LABEL_10;
  }
  if (a4)
  {
    v11 = 0;
    *a4 = v14;
  }
  else
  {
LABEL_8:
    v11 = 0;
  }
LABEL_10:

  return v11;
}

- (id)_initWithResourceBaseURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 124, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL isKindOfClass:NSURL.class]" object file lineNumber description];
  }
  if (([v7 isFileURL] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 125, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL isFileURL]" object file lineNumber description];
  }
  if (([v7 hasDirectoryPath] & 1) == 0)
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 126, @"Invalid parameter not satisfying: %@", @"[resourceBaseURL hasDirectoryPath]" object file lineNumber description];

    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (a4) {
LABEL_7:
  }
    *a4 = 0;
LABEL_8:
  v17.receiver = self;
  v17.super_class = (Class)WKWebExtension;
  id v8 = [(WKWebExtension *)&v17 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  id v16 = 0;
  id v10 = v8;
  *(void *)(WebKit::WebExtension::WebExtension((uint64_t)[(WKWebExtension *)v10 _apiObject], v7, &v16) + 8) = v10;

  if (!v16)
  {
    v11 = v10;
    goto LABEL_14;
  }
  if (a4)
  {
    v11 = 0;
    *a4 = v16;
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_initWithManifestDictionary:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 148, @"Invalid parameter not satisfying: %@", @"[manifest isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  id v6 = [(WKWebExtension *)self _initWithManifestDictionary:v5 resources:0];

  return v6;
}

- (id)_initWithManifestDictionary:(id)a3 resources:(id)a4
{
  id v7 = (NSDictionary *)a3;
  id v8 = (NSDictionary *)a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 155, @"Invalid parameter not satisfying: %@", @"[manifest isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WKWebExtension;
  id v9 = [(WKWebExtension *)&v15 init];
  id v10 = v9;
  if (v9)
  {
    v11 = v9;
    *(void *)(WebKit::WebExtension::WebExtension((WebKit::WebExtension *)[(WKWebExtension *)v11 _apiObject], v7, v8)+ 8) = v11;

    v12 = v11;
  }

  return v10;
}

- (id)_initWithResources:(id)a3
{
  id v5 = (NSDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WKWebExtension.mm", 167, @"Invalid parameter not satisfying: %@", @"[resources isKindOfClass:NSDictionary.class]" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WKWebExtension;
  id v6 = [(WKWebExtension *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    *((void *)WebKit::WebExtension::WebExtension((WebKit::WebExtension *)[(WKWebExtension *)v8 _apiObject], v5)+ 1) = v8;

    id v9 = v8;
  }

  return v7;
}

- (NSDictionary)manifest
{
  return (NSDictionary *)WebKit::WebExtension::manifest((WebKit::WebExtension *)&self->_webExtension);
}

- (double)manifestVersion
{
  return WebKit::WebExtension::manifestVersion((WebKit::WebExtension *)&self->_webExtension);
}

- (BOOL)supportsManifestVersion:(double)a3
{
  return WebKit::WebExtension::manifestVersion((WebKit::WebExtension *)&self->_webExtension) >= a3;
}

- (NSLocale)defaultLocale
{
  return (NSLocale *)WebKit::WebExtension::defaultLocale((id *)&self->_webExtension);
}

- (NSString)displayName
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (NSString)displayShortName
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (NSString)displayVersion
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (NSString)displayDescription
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (NSString)displayActionLabel
{
  WebKit::WebExtension::populateActionPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (NSString)version
{
  WebKit::WebExtension::populateDisplayStringsIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  WTF::RetainPtr<__IOHIDDevice *>::get();
  return result;
}

- (id)iconForSize:(CGSize)a3
{
  return WebKit::WebExtension::icon((WebKit::WebExtension *)&self->_webExtension, a3);
}

- (id)actionIconForSize:(CGSize)a3
{
  return WebKit::WebExtension::actionIcon((WebKit::WebExtension *)&self->_webExtension, a3);
}

- (NSSet)requestedPermissions
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  return (NSSet *)WebKit::toAPI(&self[2]);
}

- (NSSet)optionalPermissions
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  return (NSSet *)WebKit::toAPI(&self[2]._webExtension);
}

- (NSSet)requestedPermissionMatchPatterns
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  return (NSSet *)WebKit::toAPI((void **)&self[1]._webExtension.data.__lx[32]);
}

- (NSSet)optionalPermissionMatchPatterns
{
  WebKit::WebExtension::populatePermissionsPropertiesIfNeeded((WebKit::WebExtension *)&self->_webExtension);

  return (NSSet *)WebKit::toAPI((void **)&self[1]._webExtension.data.__lx[40]);
}

- (NSSet)allRequestedMatchPatterns
{
  WebKit::WebExtension::allRequestedMatchPatterns((WebKit::WebExtension *)&self->_webExtension, (uint64_t *)&v5);
  uint64_t v3 = WebKit::toAPI(&v5);
  if (v5) {
    WTF::HashTable<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>,WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>,WTF::HashTraits<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>,WTF::HashTraits<WTF::RefPtr<WebKit::WebPageProxy const,WTF::RawPtrTraits<WebKit::WebPageProxy const>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy const>>>>::deallocateTable(v5, v2);
  }

  return (NSSet *)v3;
}

- (NSArray)errors
{
  return (NSArray *)WebKit::WebExtension::errors((id *)&self->_webExtension);
}

- (BOOL)hasBackgroundContent
{
  return WebKit::WebExtension::hasBackgroundContent((id *)&self->_webExtension);
}

- (BOOL)hasPersistentBackgroundContent
{
  return WebKit::WebExtension::backgroundContentIsPersistent((id *)&self->_webExtension);
}

- (BOOL)hasInjectedContent
{
  return *(_DWORD *)&self->_webExtension.data.__lx[36] != 0;
}

- (BOOL)hasOptionsPage
{
  return *(void *)self[6]._webExtension.data.__lx != 0;
}

- (BOOL)hasOverrideNewTabPage
{
  return *(void *)&self[6]._webExtension.data.__lx[8] != 0;
}

- (BOOL)hasCommands
{
  return *(_DWORD *)&self[1]._webExtension.data.__lx[12] != 0;
}

- (BOOL)hasContentModificationRules
{
  return *(_DWORD *)&self[1]._webExtension.data.__lx[28] != 0;
}

- (BOOL)_hasServiceWorkerBackgroundContent
{
  return self[5]._webExtension.data.__lx[40];
}

- (BOOL)_hasModularBackgroundContent
{
  return WebKit::WebExtension::backgroundContentUsesModules((id *)&self->_webExtension);
}

- (BOOL)_hasSidebar
{
  return 0;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtension;
}

- (void)_webExtension
{
  return &self->_webExtension;
}

@end