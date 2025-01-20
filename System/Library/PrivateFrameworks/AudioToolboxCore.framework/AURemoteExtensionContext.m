@interface AURemoteExtensionContext
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (AUAudioUnitViewService)viewService;
- (AURemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)iOSViewController;
- (id)open:instanceUUID:reply:;
- (uint64_t)open:instanceUUID:reply:;
- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5;
- (void)open:instanceUUID:reply:;
- (void)requestViewControllerWithCompletionHandler:(id)a3;
- (void)setViewService:(id)a3;
@end

@implementation AURemoteExtensionContext

- (void).cxx_destruct
{
}

- (void)setViewService:(id)a3
{
  self->_viewService = (AUAudioUnitViewService *)a3;
}

- (AUAudioUnitViewService)viewService
{
  return self->_viewService;
}

- (void)open:(AudioComponentDescription *)a3 instanceUUID:(id)a4 reply:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = _Block_copy(v9);
  v32 = v10;
  objc_initWeak(&location, self);
  v11 = [AURemoteHost alloc];
  v12 = [(AURemoteExtensionContext *)self _auxiliaryConnection];
  objc_copyWeak(&to, &location);
  v40 = 0;
  v38 = &unk_1EDF8B030;
  objc_moveWeak(&v39, &to);
  v40 = &v38;
  objc_destroyWeak(&to);
  v13 = [(AURemoteHost *)v11 initWithConnection:v12 config:MEMORY[0x1E4F1CC08] timeOutHandler:&v38];
  host = self->_host;
  self->_host = v13;

  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v38);
  if (self->_host)
  {
    if (self->_isUIExtension) {
      [(AURemoteExtensionContext *)self iOSViewController];
    }
    else {
    v15 = [(AURemoteExtensionContext *)self _principalObject];
    }
    if (!self->_isUIExtension) {
      goto LABEL_10;
    }
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x2050000000;
    v16 = (void *)getAUViewControllerClass(void)::softClass;
    uint64_t v37 = getAUViewControllerClass(void)::softClass;
    if (!getAUViewControllerClass(void)::softClass)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = ___ZL24getAUViewControllerClassv_block_invoke;
      v33[3] = &unk_1E5688B80;
      v33[4] = &v34;
      ___ZL24getAUViewControllerClassv_block_invoke((uint64_t)v33);
      v16 = (void *)v35[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v34, 8);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v19 = [NSString stringWithFormat:@"Principal object %@ must derive from AUViewController but doesn't.", v15];
      -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v32, v19, 0);
    }
    else
    {
LABEL_10:
      if ([v15 conformsToProtocol:&unk_1EDFBB450])
      {
        long long v28 = *(_OWORD *)&a3->componentType;
        UInt32 componentFlagsMask = a3->componentFlagsMask;
        id v27 = 0;
        v18 = [v15 createAudioUnitWithComponentDescription:&v28 error:&v27];
        id v19 = v27;
        if (v18)
        {
          OSType componentType = a3->componentType;
          if (((componentType != 1635087216) ^ [v18 isSpeechSynthesisProvider]))
          {
            if (a3->componentType == 1635087216
              && [v18 conformsToProtocol:&unk_1EDFBB4B0])
            {
              id v21 = v18;
              v22 = self->_host;
              if (v22)
              {
                [(AURemoteHost *)v22 hostAuditToken];
              }
              else
              {
                long long v25 = 0u;
                long long v26 = 0u;
              }
              v24[0] = v25;
              v24[1] = v26;
              objc_msgSend(v21, "set_hostAuditToken:", v24);
            }
            [(AURemoteHost *)self->_host openImpl:v18 reply:v9];
            goto LABEL_25;
          }
          v23 = [NSString stringWithFormat:@"Audio Unit %@ is not a subclass of AVSpeechSynthesisProviderAudioUnit.", v18];
          -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v32, v23, v19);
        }
        else
        {
          v23 = [NSString stringWithFormat:@"Failed to instantiate Audio Unit: %@", v19];
          -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v32, v23, 0);
        }

LABEL_25:
        goto LABEL_26;
      }
      id v19 = [NSString stringWithFormat:@"Principal object %@ does not conform to protocol AUAudioUnitFactory.", v15];
      -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v32, v19, 0);
    }
LABEL_26:

    goto LABEL_27;
  }
  v15 = [NSString stringWithFormat:@"Remote Host Initialisation Failed"];
  -[AURemoteExtensionContext open:instanceUUID:reply:]::$_5::operator()((uint64_t *)&v32, v15, 0);
LABEL_27:

  objc_destroyWeak(&location);
}

- (void)open:instanceUUID:reply:
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x192FC8940);
}

- (id)open:instanceUUID:reply:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EDF8B030;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)open:instanceUUID:reply:
{
  return a1;
}

- (void)requestViewControllerWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v6 = v4;
  if (self->_isUIExtension)
  {
    v5 = [(AURemoteExtensionContext *)self iOSViewController];
    v6[2](v6, v5);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (id)iOSViewController
{
  v2 = [(AURemoteExtensionContext *)self viewService];
  v3 = [v2 childViewControllers];
  v4 = [v3 lastObject];

  return v4;
}

- (AURemoteExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v12 = [v11 objectForInfoDictionaryKey:@"NSExtension"];
  v13 = [v12 objectForKeyedSubscript:@"NSExtensionAttributes"];
  +[AURemoteHost _staticInit];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AURemoteExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
  block[3] = &unk_1E5680DF0;
  block[4] = v11;
  id v14 = v13;
  id v23 = v14;
  if (-[AURemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]::once != -1) {
    dispatch_once(&-[AURemoteExtensionContext initWithInputItems:listenerEndpoint:contextUUID:]::once, block);
  }
  v21.receiver = self;
  v21.super_class = (Class)AURemoteExtensionContext;
  v15 = [(AURemoteExtensionContext *)&v21 initWithInputItems:v8 listenerEndpoint:v9 contextUUID:v10];
  if (!v15)
  {
    v18 = 0;
    goto LABEL_10;
  }
  v16 = [v12 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
  if (([v16 isEqualToString:@"com.apple.AudioUnit"] & 1) != 0
    || ([v16 isEqualToString:@"com.apple.AudioUnit-Speech"] & 1) != 0)
  {
    char v17 = 0;
  }
  else
  {
    if (([v16 isEqualToString:@"com.apple.AudioUnit-UI"] & 1) == 0)
    {
      if (kAUExtensionScope)
      {
        v18 = (AURemoteExtensionContext *)*(id *)kAUExtensionScope;
        if (!v18) {
          goto LABEL_8;
        }
      }
      else
      {
        v18 = (AURemoteExtensionContext *)MEMORY[0x1E4F14500];
        id v20 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(&v18->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v25 = "AURemoteExtensionContext.mm";
        __int16 v26 = 1024;
        int v27 = 1499;
        __int16 v28 = 2112;
        v29 = v16;
        _os_log_impl(&dword_18FEC0000, &v18->super.super, OS_LOG_TYPE_ERROR, "%25s:%-5d Unknown extension point: %@", buf, 0x1Cu);
      }

      v18 = 0;
      goto LABEL_8;
    }
    char v17 = 1;
  }
  v15->_isUIExtension = v17;
  v18 = v15;
LABEL_8:

LABEL_10:
  return v18;
}

void __76__AURemoteExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CADeprecated::TSingleton<AURegistrationServerConnection>::instance();
  AURegistrationServerConnection::RegisterExtensionProcess(v2);
  id v3 = *(id *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"AudioComponentBundle"];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v4];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;

      [v7 load];
      id v3 = v7;
LABEL_11:

      goto LABEL_12;
    }
    if (kAUExtensionScope)
    {
      id v8 = *(id *)kAUExtensionScope;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      char v17 = "AURemoteExtensionContext.mm";
      __int16 v18 = 1024;
      int v19 = 1481;
      __int16 v20 = 2112;
      objc_super v21 = v4;
      _os_log_impl(&dword_18FEC0000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: AudioComponentBundle %@ not found", buf, 0x1Cu);
    }

    goto LABEL_11;
  }
LABEL_12:
  id v10 = [*(id *)(a1 + 32) bundleIdentifier];
  id v11 = v3;
  v12 = (void *)AudioComponentMgr_NSExtension::sExtensionServiceIdentifier;
  AudioComponentMgr_NSExtension::sExtensionServiceIdentifier = (uint64_t)v10;
  id v13 = v10;

  id v14 = (void *)AudioComponentMgr_NSExtension::sExtensionServiceBundle;
  AudioComponentMgr_NSExtension::sExtensionServiceBundle = (uint64_t)v11;

  GlobalComponentPluginMgr((uint64_t *)&v15);
  if (v15) {
    std::recursive_mutex::unlock(v15);
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  host = self->_host;
  if (host)
  {
    if (objc_opt_respondsToSelector()) {
      host = self->_host;
    }
    else {
      host = 0;
    }
  }
  return host;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::once != -1) {
    dispatch_once(&+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::once, &__block_literal_global_311);
  }
  uint64_t v2 = (void *)+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol;
  return v2;
}

void __61__AURemoteExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  CreateAUAudioUnitXPCInterface();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&+[AURemoteExtensionContext _extensionAuxiliaryVendorProtocol]::sVendorProtocol, v0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::once != -1) {
    dispatch_once(&+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::once, &__block_literal_global_299);
  }
  uint64_t v2 = (void *)+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
  return v2;
}

void __59__AURemoteExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  id v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB6DE0];
  objc_storeStrong((id *)&+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol, v0);

  v1 = (void *)+[AURemoteExtensionContext _extensionAuxiliaryHostProtocol]::sHostProtocol;
  SetAllowedClassesForAUAudioUnitHostXPCInterface(v1);
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (+[AURemoteHost instancesRespondToSelector:](AURemoteHost, "instancesRespondToSelector:")) {
    return 1;
  }
  v6 = (void *)[a1 superclass];
  return [v6 instancesRespondToSelector:a3];
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if (+[AURemoteHost conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "conformsToProtocol:", v4);
  }

  return v5;
}

@end