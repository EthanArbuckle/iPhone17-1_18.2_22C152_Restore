@interface WKWebExtensionControllerConfiguration
+ (BOOL)supportsSecureCoding;
+ (WKWebExtensionControllerConfiguration)configurationWithIdentifier:(id)a3;
+ (id)_temporaryConfiguration;
+ (id)defaultConfiguration;
+ (id)nonPersistentConfiguration;
+ (void)initialize;
- (BOOL)_isTemporary;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersistent;
- (NSString)_storageDirectoryPath;
- (NSString)debugDescription;
- (NSUUID)identifier;
- (Object)_apiObject;
- (WKWebExtensionControllerConfiguration)initWithCoder:(id)a3;
- (WKWebViewConfiguration)webViewConfiguration;
- (WKWebsiteDataStore)defaultWebsiteDataStore;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_objc_initiateDealloc;
- (void)_setStorageDirectoryPath:(id)a3;
- (void)_webExtensionControllerConfiguration;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultWebsiteDataStore:(id)a3;
- (void)setWebViewConfiguration:(id)a3;
@end

@implementation WKWebExtensionControllerConfiguration

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionControllerConfiguration;
}

- (void)setWebViewConfiguration:(id)a3
{
  WTF::RetainPtr<WKWebViewConfiguration>::operator=((const void **)&self[1].super.isa, a3);
}

- (void)_webExtensionControllerConfiguration
{
  return &self->_webExtensionControllerConfiguration;
}

+ (id)defaultConfiguration
{
  uint64_t v2 = API::Object::newObject(0x40uLL, 115);
  v3 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v2, 1);
  v4 = WebKit::WebExtensionAction::wrapper(v3);
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }

  return v4;
}

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
  (**(void (***)(void))self->_webExtensionControllerConfiguration.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionControllerConfiguration;
  [(WKWebExtensionControllerConfiguration *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)nonPersistentConfiguration
{
  uint64_t v2 = API::Object::newObject(0x40uLL, 115);
  objc_super v3 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v2, 0);
  v4 = WebKit::WebExtensionAction::wrapper(v3);
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }

  return v4;
}

+ (WKWebExtensionControllerConfiguration)configurationWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (WTF::UUID *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WKWebExtensionControllerConfiguration.mm", 70, @"Invalid parameter not satisfying: %@", @"[identifier isKindOfClass:NSUUID.class]" object file lineNumber description];
  }
  WTF::UUID::fromNSUUID(v12, v5, v6);
  if (!v13)
  {
    __break(0xC471u);
    JUMPOUT(0x199487FE0);
  }
  v7 = (CFTypeRef *)API::Object::newObject(0x40uLL, 115);
  v8 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration((WebKit::WebExtensionControllerConfiguration *)v7, (const WTF::UUID *)v12);
  v9 = WebKit::WebExtensionAction::wrapper(v8);
  if (v7) {
    CFRelease(v7[1]);
  }

  return (WKWebExtensionControllerConfiguration *)v9;
}

+ (id)_temporaryConfiguration
{
  uint64_t v2 = API::Object::newObject(0x40uLL, 115);
  v4 = (id *)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v2, v3, MEMORY[0x1E4F30978]);
  v5 = WebKit::WebExtensionAction::wrapper(v4);
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WKWebExtensionControllerConfiguration.mm", 85, @"Invalid parameter not satisfying: %@", @"[coder isKindOfClass:NSCoder.class]" object file lineNumber description];
  }
  v5 = [(WKWebExtensionControllerConfiguration *)self identifier];
  [v10 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v10, "encodeBool:forKey:", -[WKWebExtensionControllerConfiguration isPersistent](self, "isPersistent"), @"persistent");
  v6 = [(WKWebExtensionControllerConfiguration *)self webViewConfiguration];
  [v10 encodeObject:v6 forKey:@"webViewConfiguration"];

  v7 = [(WKWebExtensionControllerConfiguration *)self defaultWebsiteDataStore];
  [v10 encodeObject:v7 forKey:@"defaultWebsiteDataStore"];

  if ([(WKWebExtensionControllerConfiguration *)self _isTemporary])
  {
    [v10 encodeBool:1 forKey:@"temporary"];
    v8 = [(WKWebExtensionControllerConfiguration *)self _storageDirectoryPath];
    [v10 encodeObject:v8 forKey:@"temporaryDirectory"];
  }
}

- (WKWebExtensionControllerConfiguration)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WKWebExtensionControllerConfiguration.mm", 101, @"Invalid parameter not satisfying: %@", @"[coder isKindOfClass:NSCoder.class]" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)WKWebExtensionControllerConfiguration;
  v6 = [(WKWebExtensionControllerConfiguration *)&v28 init];
  if (v6)
  {
    if ([v5 containsValueForKey:@"temporary"])
    {
      if (([v5 decodeBoolForKey:@"temporary"] & 1) == 0)
      {
        __break(0xC471u);
        JUMPOUT(0x1994885DCLL);
      }
      v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"temporaryDirectory"];
      v8 = v6;
      uint64_t v9 = [(WKWebExtensionControllerConfiguration *)v8 _apiObject];
      MEMORY[0x19972EAD0](v29, v7);
      WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration(v9, v10, (_DWORD **)v29);
      v12 = v29[0];
      v29[0] = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 2) {
          WTF::StringImpl::destroy(v12, v11);
        }
        else {
          *(_DWORD *)v12 -= 2;
        }
      }
      *(void *)(v9 + 8) = v8;

      MEMORY[0x19972EAD0](v29, v7);
      WTF::FileSystemImpl::makeAllDirectories((WTF::FileSystemImpl *)v29, v21);
      v23 = v29[0];
      v29[0] = 0;
      if (v23)
      {
        if (*(_DWORD *)v23 == 2) {
          WTF::StringImpl::destroy(v23, v22);
        }
        else {
          *(_DWORD *)v23 -= 2;
        }
      }
      v24 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"webViewConfiguration"];
      [(WKWebExtensionControllerConfiguration *)v8 setWebViewConfiguration:v24];

      v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"defaultWebsiteDataStore"];
      [(WKWebExtensionControllerConfiguration *)v8 setDefaultWebsiteDataStore:v20];
    }
    else
    {
      v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      int v13 = [v5 decodeBoolForKey:@"persistent"];
      WTF::UUID::fromNSUUID((uint64_t *)v29, v7, v14);
      int v15 = v30;
      v16 = v6;
      v17 = v16;
      if (v15) {
        uint64_t v18 = (uint64_t)WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration((WebKit::WebExtensionControllerConfiguration *)[(WKWebExtensionControllerConfiguration *)v16 _apiObject], (const WTF::UUID *)v29);
      }
      else {
        uint64_t v18 = WebKit::WebExtensionControllerConfiguration::WebExtensionControllerConfiguration((uint64_t)[(WKWebExtensionControllerConfiguration *)v16 _apiObject], v13);
      }
      *(void *)(v18 + 8) = v17;

      v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"webViewConfiguration"];
      [(WKWebExtensionControllerConfiguration *)v17 setWebViewConfiguration:v19];

      v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"defaultWebsiteDataStore"];
      [(WKWebExtensionControllerConfiguration *)v17 setDefaultWebsiteDataStore:v20];
    }

    v25 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  WebKit::WebExtensionControllerConfiguration::copy((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration, (uint64_t *)&v6);
  uint64_t v3 = v6;
  v4 = WebKit::WebExtensionAction::wrapper((id *)v6);
  if (v3) {
    CFRelease(*((CFTypeRef *)v3 + 1));
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionControllerConfiguration *)a3;
  if (self != v4)
  {
    objc_opt_class();
    id v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;

      if (v6)
      {
        char v8 = WebKit::WebExtensionControllerConfiguration::operator==((uint64_t)&self->_webExtensionControllerConfiguration, (uint64_t)&v6->_webExtensionControllerConfiguration, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    char v8 = 0;
    goto LABEL_8;
  }
  char v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  if ([(WKWebExtensionControllerConfiguration *)self isPersistent]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  BOOL v7 = [(WKWebExtensionControllerConfiguration *)self _isTemporary];
  uint64_t v8 = [(WKWebExtensionControllerConfiguration *)self identifier];
  uint64_t v9 = (void *)v8;
  if (v7) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; persistent = %@; temporary = %@; identifier = %@>",
    v5,
    self,
    v6,
    v10,
  v11 = v8);

  return (NSString *)v11;
}

- (NSUUID)identifier
{
  if (*(_OWORD *)&self->_webExtensionControllerConfiguration.data.__lx[16] == 0) {
    id v2 = 0;
  }
  else {
    id v2 = (id)WTF::UUID::operator NSUUID *();
  }

  return (NSUUID *)v2;
}

- (BOOL)isPersistent
{
  uint64_t v2 = *(void *)&self->_webExtensionControllerConfiguration.data.__lx[40];
  return v2 && *(_DWORD *)(v2 + 4) != 0;
}

- (WKWebViewConfiguration)webViewConfiguration
{
  return (WKWebViewConfiguration *)WebKit::WebExtensionControllerConfiguration::webViewConfiguration((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration);
}

- (WKWebsiteDataStore)defaultWebsiteDataStore
{
  uint64_t v2 = (void *)WebKit::WebExtensionControllerConfiguration::defaultWebsiteDataStore((WebKit::WebExtensionControllerConfiguration *)&self->_webExtensionControllerConfiguration)[1];

  return (WKWebsiteDataStore *)v2;
}

- (void)setDefaultWebsiteDataStore:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4) {
    uint64_t v5 = (uint64_t)v4 + 8;
  }
  else {
    uint64_t v5 = 0;
  }
  WebKit::WebExtensionControllerConfiguration::setDefaultWebsiteDataStore((uint64_t)&self->_webExtensionControllerConfiguration, v5);
}

- (BOOL)_isTemporary
{
  return self->_webExtensionControllerConfiguration.data.__lx[32];
}

- (NSString)_storageDirectoryPath
{
  uint64_t v2 = *(_DWORD **)&self->_webExtensionControllerConfiguration.data.__lx[40];
  if (v2)
  {
    if (v2[1]) {
      uint64_t v2 = (id)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v2 = 0;
    }
  }

  return (NSString *)v2;
}

- (void)_setStorageDirectoryPath:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WTF::String::operator=((uint64_t *)&self->_webExtensionControllerConfiguration.data.__lx[40], &v6);
  uint64_t v5 = v6;
  id v6 = 0;
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

@end