@interface FMDExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation FMDExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  v2 = LogCategory_Extensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0E93000, v2, OS_LOG_TYPE_DEFAULT, "#ext - extensionAuxVendorProto called", v5, 2u);
  }

  if (_extensionAuxiliaryVendorProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_2);
  }
  v3 = (void *)_extensionAuxiliaryVendorProtocol___interface;

  return v3;
}

void __56__FMDExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2707548];
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(id)_extensionAuxiliaryVendorProtocol___interface setClasses:v8 forSelector:sel_fetchAllAccessoriesInfoWithInfo_withCompletion_ argumentIndex:0 ofReply:1];
}

+ (id)_extensionAuxiliaryHostProtocol
{
  v2 = LogCategory_Extensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D0E93000, v2, OS_LOG_TYPE_DEFAULT, "#ext - extensionAuxHostProto called", v5, 2u);
  }

  if (_extensionAuxiliaryHostProtocol_onceToken != -1) {
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_80_0);
  }
  uint64_t v3 = (void *)_extensionAuxiliaryHostProtocol___interface;

  return v3;
}

uint64_t __54__FMDExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2708FF0];

  return MEMORY[0x1F41817F8]();
}

@end