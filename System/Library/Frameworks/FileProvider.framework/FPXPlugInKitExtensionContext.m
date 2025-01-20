@interface FPXPlugInKitExtensionContext
+ (Class)principalClass;
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
+ (void)setPrincipalClass:(Class)a3;
- (FPXPlugInKitExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
@end

@implementation FPXPlugInKitExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_extensionAuxiliaryVendorProtocol_interface;

  return v2;
}

uint64_t __65__FPXPlugInKitExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol_interface = FPXVendorXPCInterface();

  return MEMORY[0x1F41817F8]();
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)_extensionAuxiliaryHostProtocol_interface;

  return v2;
}

uint64_t __63__FPXPlugInKitExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF6C6358];

  return MEMORY[0x1F41817F8]();
}

+ (void)setPrincipalClass:(Class)a3
{
  _FPXExtensionContextPrincipalClass = (uint64_t)a3;
}

+ (Class)principalClass
{
  return (Class)(id)_FPXExtensionContextPrincipalClass;
}

- (FPXPlugInKitExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FPXPlugInKitExtensionContext;
  v11 = [(FPXPlugInKitExtensionContext *)&v20 initWithInputItems:v8 listenerEndpoint:v9 contextUUID:v10];
  if (v11)
  {
    v12 = objc_alloc_init(FPXExtensionContext);
    context = v11->_context;
    v11->_context = v12;

    v14 = v11->_context;
    v15 = [(FPXPlugInKitExtensionContext *)v11 _auxiliaryConnection];
    [v15 setExportedObject:v14];

    id location = 0;
    objc_initWeak(&location, v11);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
    v17[3] = &unk_1E5AF06C8;
    objc_copyWeak(&v18, &location);
    [(FPXPlugInKitExtensionContext *)v11 _setRequestCleanUpBlock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[3] invalidate];
  }
  else
  {
    v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_cold_1(v3);
    }
  }
}

- (void).cxx_destruct
{
}

void __80__FPXPlugInKitExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleanup of extension context requested, but already deallocated", v1, 2u);
}

@end