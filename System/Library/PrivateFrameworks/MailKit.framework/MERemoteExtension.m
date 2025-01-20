@interface MERemoteExtension
+ (id)allCapabilities;
+ (id)allCapabilitiesRequiringMessageContentAccess;
+ (id)log;
- (BOOL)bodyAccess;
- (BOOL)entitlementVerified;
- (BOOL)hasMessageContentAccess;
- (BOOL)inboundNetworkingAllowed;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)outboundNetworkingAllowed;
- (EFPromise)remoteExtensionProxyPromise;
- (MEComposeSessionHandler)composeSessionInterface;
- (MEComposeSessionHandler_Private)synchronousComposeSessionInterface;
- (MEContentBlocker_Private)synchronousContentBlockerInterface;
- (MEExtensionHostContext)extensionHostContext;
- (MEMailComposeToolbarItemInfo)composeWindowToolbarButtonInfo;
- (MEMessageActionHandler_Private)messageActionProviderInterface;
- (MEMessageActionHandler_Private)synchronousMessageActionProviderInterface;
- (MEMessageSecurityHandler)synchronousMessageSecurityInterface;
- (MERemoteExtension)initWithExtension:(id)a3;
- (MERemoteExtensionContext)extensionContext;
- (NSArray)capabilities;
- (NSDictionary)headerAccessLevels;
- (NSExtension)extension;
- (NSString)containerID;
- (NSString)containerPath;
- (NSString)containingAppDisplayName;
- (NSString)dataAccessReason;
- (NSString)description;
- (NSString)descriptionText;
- (NSString)displayName;
- (NSString)displayVersion;
- (NSString)ef_publicDescription;
- (NSString)extensionID;
- (NSURL)containingAppURL;
- (NSUUID)contextUUID;
- (OS_dispatch_queue)extensionLoadingQueue;
- (UIImage)menuIcon;
- (UIImage)messageSecurityDecoderIcon;
- (UIImage)preferencesIcon;
- (UIImage)toolbarIcon;
- (id)_getInterfaceForExtensionCapability:(id)a3 error:(id *)a4;
- (id)_imageForName:(id)a3;
- (id)_interfaceForExtensionCapability:(id)a3;
- (id)_loadRemoteExtesionProxyFuture;
- (id)_remoteExtensionProxyFuture;
- (id)_synchronousInterfaceForExtensionCapability:(id)a3;
- (id)contentBlockerInterface;
- (id)interfaceForExtensionCapability:(id)a3;
- (id)toolbarIconTooltip;
- (unint64_t)hash;
- (void)_nts_loadBodyAccess;
- (void)_nts_loadDataAccessReason;
- (void)getDecodedMailViewControllerForMessageContext:(id)a3 completionHandler:(id)a4;
- (void)getMailComposeExtensionViewControllerForSession:(id)a3 hostDelegate:(id)a4 completionHandler:(id)a5;
- (void)getMailSignatureVerificationExtensionViewControllerForMessageSigners:(id)a3 completionHandler:(id)a4;
- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4;
- (void)setContainerID:(id)a3;
- (void)setContainerPath:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEntitlementVerified:(BOOL)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionID:(id)a3;
- (void)setExtensionLoadingQueue:(id)a3;
- (void)setRemoteExtensionProxyPromise:(id)a3;
@end

@implementation MERemoteExtension

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__MERemoteExtension_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1) {
    dispatch_once(&log_onceToken_3, block);
  }
  v2 = (void *)log_log_3;
  return v2;
}

void __24__MERemoteExtension_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;
}

- (MERemoteExtension)initWithExtension:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MERemoteExtension;
  v6 = [(MERemoteExtension *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v8 = [(NSExtension *)v7->_extension _localizedName];
    if (v8)
    {
      v9 = [(NSExtension *)v7->_extension _localizedName];
    }
    else
    {
      v10 = [MEMORY[0x263F08C38] UUID];
      v9 = [v10 UUIDString];
    }
    id v11 = [@"com.apple.email.extension." stringByAppendingString:v9];
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v15 = dispatch_queue_create(v12, v14);
    extensionLoadingQueue = v7->_extensionLoadingQueue;
    v7->_extensionLoadingQueue = (OS_dispatch_queue *)v15;

    *(void *)&v7->_remoteExtensionProxyLock._os_unfair_lock_opaque = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __39__MERemoteExtension_initWithExtension___block_invoke;
    v18[3] = &unk_264283578;
    objc_copyWeak(&v19, &location);
    [(NSExtension *)v7->_extension setRequestInterruptionBlock:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __39__MERemoteExtension_initWithExtension___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[MERemoteExtension log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = WeakRetained;
    _os_log_impl(&dword_2164DB000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Extension interrupted", (uint8_t *)&v5, 0xCu);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    id v3 = +[MERemoteExtension log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_2164DB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting extension _remoteExtensionProxyPromise as Extension interrupted.", (uint8_t *)&v5, 0xCu);
    }

    v4 = *(void **)&WeakRetained[22]._os_unfair_lock_opaque;
    *(void *)&WeakRetained[22]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  int v5 = [(MERemoteExtension *)self extension];
  v6 = (void *)[v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)extensionID
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 _localizedName];

  return (NSString *)v3;
}

- (NSString)displayVersion
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 version];

  return (NSString *)v3;
}

- (NSString)containingAppDisplayName
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 _plugIn];
  uint64_t v4 = [v3 localizedContainingName];

  return (NSString *)v4;
}

- (NSURL)containingAppURL
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 _plugIn];
  uint64_t v4 = [v3 containingUrl];

  return (NSURL *)v4;
}

- (NSString)descriptionText
{
  v2 = [(MERemoteExtension *)self extension];
  id v3 = [v2 _extensionBundle];

  uint64_t v4 = [v3 localizedInfoDictionary];
  int v5 = [v4 objectForKeyedSubscript:@"NSHumanReadableDescription"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length]) {
    goto LABEL_6;
  }
  v6 = [v3 infoDictionary];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"NSHumanReadableDescription"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length])
  {
    int v5 = v7;
LABEL_6:
    v8 = v5;
    uint64_t v7 = v8;
    goto LABEL_8;
  }
  v8 = &stru_26C713DA8;
LABEL_8:

  return (NSString *)v8;
}

- (BOOL)isEnabled
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [(MERemoteExtension *)self extension];
  int v4 = [v3 optedIn];

  int v5 = +[MEExtensionUserPreferences sharedInstance];
  v6 = [(MERemoteExtension *)self extensionID];
  int v7 = [v5 isExtensionEnabled:v6];

  v8 = +[MERemoteExtension log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(MERemoteExtension *)self extensionID];
    v10 = (void *)v9;
    id v11 = @"Not Enabled";
    if (v7) {
      id v11 = @"Enabled";
    }
    v12 = @"NO";
    int v14 = 134218754;
    dispatch_queue_t v15 = self;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    if (v4) {
      v12 = @"YES";
    }
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2112;
    objc_super v21 = v12;
    _os_log_impl(&dword_2164DB000, v8, OS_LOG_TYPE_DEFAULT, "MERemoteExtension<%p>: Extension %{public}@ is userEnabled: %{public}@ and optedIn: %@.", (uint8_t *)&v14, 0x2Au);
  }
  return v4 & v7;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v5 = [(MERemoteExtension *)self isEnabled];
  v6 = +[MERemoteExtension log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(MERemoteExtension *)self extensionID];
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v7;
    __int16 v19 = 1024;
    BOOL v20 = v3;
    _os_log_impl(&dword_2164DB000, v6, OS_LOG_TYPE_DEFAULT, "Settting enabled state for extension: %{public}@ to state: %d.", buf, 0x12u);
  }
  if (!v3 || v5)
  {
    id v8 = 0;
    if (!v5 || v3) {
      goto LABEL_12;
    }
    uint64_t v9 = [(MERemoteExtension *)self extension];
    uint64_t v15 = 0;
    v10 = (id *)&v15;
    [v9 attemptOptOut:&v15];
  }
  else
  {
    uint64_t v9 = [(MERemoteExtension *)self extension];
    uint64_t v16 = 0;
    v10 = (id *)&v16;
    [v9 attemptOptIn:&v16];
  }
  id v8 = *v10;

  if (v8)
  {
    id v11 = +[MERemoteExtension log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = [(MERemoteExtension *)self description];
      *(_DWORD *)buf = 138543874;
      __int16 v18 = v14;
      __int16 v19 = 1024;
      BOOL v20 = v3;
      __int16 v21 = 2114;
      id v22 = v8;
      _os_log_error_impl(&dword_2164DB000, v11, OS_LOG_TYPE_ERROR, "Error settting enabled state for extension: %{public}@ to state: %d. Error: %{public}@", buf, 0x1Cu);
    }
  }
LABEL_12:
  v12 = +[MEExtensionUserPreferences sharedInstance];
  v13 = [(MERemoteExtension *)self extensionID];
  [v12 setExtensionEnabled:v3 forExtensionID:v13];
}

- (NSArray)capabilities
{
  v2 = [(MERemoteExtension *)self extension];
  BOOL v3 = [v2 attributes];

  int v4 = [v3 objectForKeyedSubscript:@"MEExtensionCapabilities"];
  BOOL v5 = objc_msgSend(v4, "ef_filter:", &__block_literal_global_7);

  return (NSArray *)v5;
}

uint64_t __33__MERemoteExtension_capabilities__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = +[MERemoteExtension allCapabilities];
    uint64_t v4 = [v3 containsObject:v2];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)allCapabilities
{
  if (allCapabilities_onceToken != -1) {
    dispatch_once(&allCapabilities_onceToken, &__block_literal_global_87);
  }
  id v2 = (void *)allCapabilities_allCapabilities;
  return v2;
}

void __36__MERemoteExtension_allCapabilities__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"MEComposeSessionHandler";
  v2[1] = @"MEMessageSecurityHandler";
  v2[2] = @"MEMessageActionHandler";
  v2[3] = @"MEContentBlocker";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  os_log_t v1 = (void *)allCapabilities_allCapabilities;
  allCapabilities_allCapabilities = v0;
}

+ (id)allCapabilitiesRequiringMessageContentAccess
{
  if (allCapabilitiesRequiringMessageContentAccess_onceToken != -1) {
    dispatch_once(&allCapabilitiesRequiringMessageContentAccess_onceToken, &__block_literal_global_90);
  }
  id v2 = (void *)allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess;
  return v2;
}

void __65__MERemoteExtension_allCapabilitiesRequiringMessageContentAccess__block_invoke()
{
  v2[3] = *MEMORY[0x263EF8340];
  v2[0] = @"MEComposeSessionHandler";
  v2[1] = @"MEMessageSecurityHandler";
  v2[2] = @"MEMessageActionHandler";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  os_log_t v1 = (void *)allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess;
  allCapabilitiesRequiringMessageContentAccess_allCapabilitiesRequiringMessageContentAccess = v0;
}

- (BOOL)outboundNetworkingAllowed
{
  id v2 = [(MERemoteExtension *)self extension];
  BOOL v3 = [v2 _plugIn];
  uint64_t v4 = [v3 entitlements];
  BOOL v5 = [v4 objectForKey:@"com.apple.security.network.client"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)inboundNetworkingAllowed
{
  id v2 = [(MERemoteExtension *)self extension];
  BOOL v3 = [v2 _plugIn];
  uint64_t v4 = [v3 entitlements];
  BOOL v5 = [v4 objectForKey:@"com.apple.security.network.server"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v5 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (UIImage)preferencesIcon
{
  return (UIImage *)[(MERemoteExtension *)self _imageForName:@"icon-preferences"];
}

- (UIImage)menuIcon
{
  return (UIImage *)[(MERemoteExtension *)self _imageForName:@"icon-menu"];
}

- (UIImage)toolbarIcon
{
  BOOL v3 = [(MERemoteExtension *)self extension];
  uint64_t v4 = [v3 attributes];
  BOOL v5 = [v4 objectForKeyedSubscript:@"MEComposeSession"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 objectForKeyedSubscript:@"MEComposeIcon"],
        (char v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v7 = [(MERemoteExtension *)self _imageForName:v6];
  }
  else
  {
    int v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"puzzlepiece.extension"];
  }

  return (UIImage *)v7;
}

- (id)_imageForName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MERemoteExtension *)self extension];
  char v6 = [v5 _extensionBundle];

  int v7 = [MEMORY[0x263F1C6B0] imageNamed:v4 inBundle:v6 withConfiguration:0];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"puzzlepiece.extension"];
  }
  v10 = v9;

  return v10;
}

- (id)toolbarIconTooltip
{
  id v2 = [(MERemoteExtension *)self extension];
  BOOL v3 = [v2 attributes];
  id v4 = [v3 objectForKeyedSubscript:@"MEComposeSession"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [v4 objectForKeyedSubscript:@"MEComposeIconToolTip"];
  }
  else
  {
    BOOL v5 = &stru_26C713DA8;
  }

  return v5;
}

- (MEMailComposeToolbarItemInfo)composeWindowToolbarButtonInfo
{
  BOOL v3 = [MEMailComposeToolbarItemInfo alloc];
  id v4 = [(MERemoteExtension *)self displayName];
  BOOL v5 = [(MERemoteExtension *)self toolbarIcon];
  char v6 = [(MERemoteExtension *)self toolbarIconTooltip];
  int v7 = [(MEMailComposeToolbarItemInfo *)v3 initWithLabel:v4 image:v5 tooltip:v6];

  return v7;
}

- (MEExtensionHostContext)extensionHostContext
{
  BOOL v3 = [(MERemoteExtension *)self extension];
  id v4 = [(MERemoteExtension *)self contextUUID];
  BOOL v5 = [v3 _extensionContextForUUID:v4];

  return (MEExtensionHostContext *)v5;
}

- (id)_remoteExtensionProxyFuture
{
  BOOL v3 = objc_opt_new();
  id v4 = [(MERemoteExtension *)self _loadRemoteExtesionProxyFuture];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke;
  v15[3] = &unk_2642835A0;
  id v5 = v3;
  id v16 = v5;
  [v4 addSuccessBlock:v15];

  char v6 = [(MERemoteExtension *)self _loadRemoteExtesionProxyFuture];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke_2;
  v13 = &unk_264283150;
  id v7 = v5;
  id v14 = v7;
  [v6 addFailureBlock:&v10];

  id v8 = objc_msgSend(v7, "future", v10, v11, v12, v13);

  return v8;
}

void __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 remoteObjectProxy];
  objc_msgSend(v2, "finishWithResult:");
}

uint64_t __48__MERemoteExtension__remoteExtensionProxyFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)_loadRemoteExtesionProxyFuture
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = [(MERemoteExtension *)self extension];

  if (!v4)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MERemoteExtension.m", 335, @"Expected non-nil extension for %@", self object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_remoteExtensionProxyLock);
  remoteExtensionProxyPromise = self->_remoteExtensionProxyPromise;
  char v6 = remoteExtensionProxyPromise;
  if (!remoteExtensionProxyPromise)
  {
    id v7 = [MEMORY[0x263F3B398] promise];
    id v8 = self->_remoteExtensionProxyPromise;
    self->_remoteExtensionProxyPromise = v7;

    char v6 = self->_remoteExtensionProxyPromise;
  }
  id v9 = v6;
  os_unfair_lock_unlock(&self->_remoteExtensionProxyLock);
  if (!remoteExtensionProxyPromise)
  {
    uint64_t v10 = +[MERemoteExtension log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "Starting setting up a new request, extension:%@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    uint64_t v11 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke;
    block[3] = &unk_264283088;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v9;
    dispatch_async(v11, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  v12 = [(EFPromise *)v9 future];

  return v12;
}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [(os_unfair_lock_s *)WeakRetained extension];
    id v28 = 0;
    id v5 = [v4 beginExtensionRequestWithOptions:0 inputItems:0 error:&v28];
    id v6 = v28;
    id v7 = v28;

    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__0;
    v26 = __Block_byref_object_dispose__0;
    id v27 = 0;
    if (v7)
    {
      objc_storeStrong(&v27, v6);
      id v8 = +[MERemoteExtension log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        BOOL v20 = objc_msgSend((id)v23[5], "ef_publicDescription");
        *(_DWORD *)buf = 138412802;
        v30 = v5;
        __int16 v31 = 2112;
        v32 = v3;
        __int16 v33 = 2114;
        v34 = v20;
        _os_log_error_impl(&dword_2164DB000, v8, OS_LOG_TYPE_ERROR, "Error setting up a new request, requestID:%@, extension:%@, error:%{public}@", buf, 0x20u);
      }
      id v9 = 0;
    }
    else
    {
      uint64_t v10 = +[MERemoteExtension log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = v5;
        __int16 v31 = 2112;
        v32 = v3;
        _os_log_impl(&dword_2164DB000, v10, OS_LOG_TYPE_DEFAULT, "Finished setting up a new request, requestID:%@, extension:%@", buf, 0x16u);
      }

      uint64_t v11 = [(os_unfair_lock_s *)v3 extension];
      id v8 = [v11 _extensionContextForUUID:v5];

      uint64_t v12 = [v5 copy];
      v13 = *(void **)&v3[26]._os_unfair_lock_opaque;
      *(void *)&v3[26]._os_unfair_lock_opaque = v12;

      id v14 = [v8 _auxiliaryConnection];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_120;
      v21[3] = &unk_2642835C8;
      v21[4] = v3;
      v21[5] = &v22;
      id v9 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v21];
    }
    uint64_t v15 = *(void **)(a1 + 32);
    if (v23[5])
    {
      objc_msgSend(v15, "finishWithError:");
      os_unfair_lock_lock(v3 + 2);
      id v16 = +[MERemoteExtension log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [(os_unfair_lock_s *)v3 ef_publicDescription];
        objc_msgSend((id)v23[5], "ef_publicDescription");
        __int16 v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        __int16 v31 = 2114;
        v32 = v18;
        _os_log_impl(&dword_2164DB000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting extension _remoteExtensionProxyPromise as Extension start failed with error %{public}@.", buf, 0x16u);
      }
      uint64_t v19 = *(void **)&v3[22]._os_unfair_lock_opaque;
      *(void *)&v3[22]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(v3 + 2);
    }
    else
    {
      [v15 finishWithResult:v9];
    }

    _Block_object_dispose(&v22, 8);
  }
}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_120(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = +[MERemoteExtension log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_120_cold_1(a1, (uint64_t)v4, v5);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)interfaceForExtensionCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(MERemoteExtension *)self capabilities];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(MERemoteExtension *)self _remoteExtensionProxyFuture];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F3B368];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"MEMailExtensionErrorDomain" code:2 userInfo:0];
    id v7 = [v8 futureWithError:v9];
  }
  return v7;
}

- (MEComposeSessionHandler)composeSessionInterface
{
  return (MEComposeSessionHandler *)[(MERemoteExtension *)self _interfaceForExtensionCapability:@"MEComposeSessionHandler"];
}

- (MEComposeSessionHandler_Private)synchronousComposeSessionInterface
{
  return (MEComposeSessionHandler_Private *)[(MERemoteExtension *)self _synchronousInterfaceForExtensionCapability:@"MEComposeSessionHandler"];
}

- (void)getMailComposeExtensionViewControllerForSession:(id)a3 hostDelegate:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  int v6 = [(MERemoteExtension *)self capabilities];
  char v7 = [v6 containsObject:@"MEComposeSessionHandler"];

  if ((v7 & 1) == 0) {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (MEMessageActionHandler_Private)messageActionProviderInterface
{
  return (MEMessageActionHandler_Private *)[(MERemoteExtension *)self _interfaceForExtensionCapability:@"MEMessageActionHandler"];
}

- (MEMessageActionHandler_Private)synchronousMessageActionProviderInterface
{
  if (pthread_main_np())
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MERemoteExtension.m" lineNumber:431 description:@"Current thread is main"];
  }
  return (MEMessageActionHandler_Private *)[(MERemoteExtension *)self _synchronousInterfaceForExtensionCapability:@"MEMessageActionHandler"];
}

- (id)contentBlockerInterface
{
  return [(MERemoteExtension *)self _interfaceForExtensionCapability:@"MEContentBlocker"];
}

- (MEContentBlocker_Private)synchronousContentBlockerInterface
{
  if (pthread_main_np())
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"MERemoteExtension.m" lineNumber:441 description:@"Current thread is main"];
  }
  return (MEContentBlocker_Private *)[(MERemoteExtension *)self _synchronousInterfaceForExtensionCapability:@"MEContentBlocker"];
}

- (void)getMailSignatureVerificationExtensionViewControllerForMessageSigners:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v5 = [(MERemoteExtension *)self capabilities];
  char v6 = [v5 containsObject:@"MEMessageSecurityHandler"];

  if ((v6 & 1) == 0) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)getDecodedMailViewControllerForMessageContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v5 = [(MERemoteExtension *)self capabilities];
  char v6 = [v5 containsObject:@"MEMessageSecurityHandler"];

  if ((v6 & 1) == 0) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)primaryActionClickedForMessageContext:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v5 = [(MERemoteExtension *)self capabilities];
  char v6 = [v5 containsObject:@"MEMessageSecurityHandler"];

  if ((v6 & 1) == 0) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (id)_interfaceForExtensionCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(MERemoteExtension *)self capabilities];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(MERemoteExtension *)self _remoteExtensionProxyFuture];
    id v8 = [v7 resultWithTimeout:0 error:5.0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_synchronousInterfaceForExtensionCapability:(id)a3
{
  id v3 = [(MERemoteExtension *)self _getInterfaceForExtensionCapability:a3 error:0];
  return v3;
}

- (id)_getInterfaceForExtensionCapability:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(MERemoteExtension *)self capabilities];
  int v8 = [v7 containsObject:v6];

  if (!v8)
  {
    uint64_t v12 = 0;
    goto LABEL_18;
  }
  id v9 = [(MERemoteExtension *)self _loadRemoteExtesionProxyFuture];
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v21 = 0;
    uint64_t v10 = (id *)&v21;
    uint64_t v11 = [v9 resultIfAvailable:&v21];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v10 = (id *)&v20;
    uint64_t v11 = [v9 resultWithTimeout:&v20 error:10.0];
  }
  uint64_t v12 = (void *)v11;
  id v13 = *v10;
  id v14 = v13;
  if (v13)
  {
    if (a4) {
      *a4 = v13;
    }

    uint64_t v15 = [v14 domain];
    if ([v15 isEqualToString:*MEMORY[0x263F3B340]])
    {
      BOOL v16 = [v14 code] == 1000000;

      if (v16)
      {
        id v17 = +[MERemoteExtension log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[MERemoteExtension _getInterfaceForExtensionCapability:error:](v17);
        }
LABEL_16:

        uint64_t v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v17 = +[MERemoteExtension log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = objc_msgSend(v14, "ef_publicDescription");
      -[MERemoteExtension _getInterfaceForExtensionCapability:error:](v18, buf, v17);
    }
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  return v12;
}

- (NSString)dataAccessReason
{
  p_accessLevelLock = &self->_accessLevelLock;
  os_unfair_lock_lock(&self->_accessLevelLock);
  dataAccessReason = self->_dataAccessReason;
  if (!dataAccessReason)
  {
    [(MERemoteExtension *)self _nts_loadDataAccessReason];
    dataAccessReason = self->_dataAccessReason;
  }
  id v5 = dataAccessReason;
  os_unfair_lock_unlock(p_accessLevelLock);
  return v5;
}

- (BOOL)bodyAccess
{
  p_accessLevelLock = &self->_accessLevelLock;
  os_unfair_lock_lock(&self->_accessLevelLock);
  unint64_t bodyAccess = self->_bodyAccess;
  if (!bodyAccess)
  {
    [(MERemoteExtension *)self _nts_loadBodyAccess];
    unint64_t bodyAccess = self->_bodyAccess;
  }
  BOOL v5 = bodyAccess == 2;
  os_unfair_lock_unlock(p_accessLevelLock);
  return v5;
}

- (void)_nts_loadDataAccessReason
{
  id v3 = [(MERemoteExtension *)self extension];
  id v6 = [v3 attributes];

  id v4 = [v6 objectForKeyedSubscript:@"MailDataAccessRequirements"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v4 = [v5 objectForKeyedSubscript:@"AccessReason"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&self->_dataAccessReason, v4);
    }
  }
  if (!self->_dataAccessReason)
  {
    self->_dataAccessReason = (NSString *)&stru_26C713DA8;
  }
}

- (void)_nts_loadBodyAccess
{
  id v3 = [(MERemoteExtension *)self extension];
  id v8 = [v3 attributes];

  id v4 = [v8 objectForKeyedSubscript:@"MailDataAccessRequirements"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v4 = [v5 objectForKeyedSubscript:@"Body"];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v4 integerValue];
      unint64_t v7 = 1;
      if (v6 >= 1) {
        unint64_t v7 = 2;
      }
      self->_unint64_t bodyAccess = v7;
    }
  }
  if (!self->_bodyAccess) {
    self->_unint64_t bodyAccess = 1;
  }
}

- (BOOL)hasMessageContentAccess
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(MERemoteExtension *)self capabilities];
  id v4 = [v2 setWithArray:v3];

  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = +[MERemoteExtension allCapabilitiesRequiringMessageContentAccess];
  unint64_t v7 = [v5 setWithArray:v6];

  LOBYTE(v6) = [v4 intersectsSet:v7];
  return (char)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MERemoteExtension *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MERemoteExtension *)self extensionID];
      unint64_t v7 = [(MERemoteExtension *)v5 extensionID];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  id v2 = [(MERemoteExtension *)self extensionID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = NSString;
  id v4 = [(MERemoteExtension *)self capabilities];
  id v5 = [v4 componentsJoinedByString:@", "];
  uint64_t v6 = [v3 stringWithFormat:@"[%@]", v5];

  unint64_t v7 = NSString;
  char v8 = [(MERemoteExtension *)self extensionID];
  id v9 = [(MERemoteExtension *)self displayName];
  uint64_t v10 = [(MERemoteExtension *)self displayVersion];
  uint64_t v11 = [v7 stringWithFormat:@"%@ - %@ - %@ - %@", v8, v9, v10, v6];

  return (NSString *)v11;
}

- (void)setExtensionID:(id)a3
{
}

- (UIImage)messageSecurityDecoderIcon
{
  return self->_messageSecurityDecoderIcon;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (OS_dispatch_queue)extensionLoadingQueue
{
  return self->_extensionLoadingQueue;
}

- (void)setExtensionLoadingQueue:(id)a3
{
}

- (NSString)containerPath
{
  return self->_containerPath;
}

- (void)setContainerPath:(id)a3
{
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (BOOL)entitlementVerified
{
  return self->_entitlementVerified;
}

- (void)setEntitlementVerified:(BOOL)a3
{
  self->_entitlementVerified = a3;
}

- (EFPromise)remoteExtensionProxyPromise
{
  return self->_remoteExtensionProxyPromise;
}

- (void)setRemoteExtensionProxyPromise:(id)a3
{
}

- (MERemoteExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (NSUUID)contextUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 104, 1);
}

- (NSDictionary)headerAccessLevels
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (MEMessageSecurityHandler)synchronousMessageSecurityInterface
{
  return self->_synchronousMessageSecurityInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousMessageSecurityInterface, 0);
  objc_storeStrong((id *)&self->_headerAccessLevels, 0);
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_remoteExtensionProxyPromise, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_extensionLoadingQueue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_messageSecurityDecoderIcon, 0);
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_dataAccessReason, 0);
}

void __51__MERemoteExtension__loadRemoteExtesionProxyFuture__block_invoke_120_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2164DB000, log, OS_LOG_TYPE_ERROR, "XPC Error %@ fetching remote extension proxy %@", (uint8_t *)&v4, 0x16u);
}

- (void)_getInterfaceForExtensionCapability:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_2164DB000, log, OS_LOG_TYPE_FAULT, "The remote extension proxy is not available.", v1, 2u);
}

- (void)_getInterfaceForExtensionCapability:(os_log_t)log error:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2164DB000, log, OS_LOG_TYPE_ERROR, "Loading remote extension proxy returned error %{public}@", buf, 0xCu);
}

@end