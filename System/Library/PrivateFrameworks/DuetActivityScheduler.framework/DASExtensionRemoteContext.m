@interface DASExtensionRemoteContext
@end

@implementation DASExtensionRemoteContext

uint64_t __61___DASExtensionRemoteContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  _extensionAuxiliaryHostProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E795D0];

  return MEMORY[0x1F41817F8]();
}

uint64_t __63___DASExtensionRemoteContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  _extensionAuxiliaryVendorProtocol___interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E76CC0];

  return MEMORY[0x1F41817F8]();
}

void __51___DASExtensionRemoteContext_hostContextWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  v5 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __51___DASExtensionRemoteContext_hostContextWithError___block_invoke_cold_1((uint64_t)v4, v5);
  }
}

uint64_t __39___DASExtensionRemoteContext_extension__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _principalObject];
  v3 = (void *)extension_extension;
  extension_extension = v2;

  uint64_t result = [(id)extension_extension isMemberOfClass:objc_opt_class()];
  if ((result & 1) == 0)
  {
    v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __39___DASExtensionRemoteContext_extension__block_invoke_cold_1(v5);
    }

    exit(0);
  }
  return result;
}

void __46___DASExtensionRemoteContext_performActivity___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extension];
  [v2 runner:*(void *)(a1 + 40) performActivity:*(void *)(a1 + 48)];
}

void __51___DASExtensionRemoteContext_hostContextWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B578B000, a2, OS_LOG_TYPE_ERROR, "Error getting host context %@", (uint8_t *)&v2, 0xCu);
}

void __39___DASExtensionRemoteContext_extension__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = objc_opt_class();
  __int16 v4 = 2112;
  uint64_t v5 = extension_extension;
  _os_log_fault_impl(&dword_1B578B000, a1, OS_LOG_TYPE_FAULT, "Found unexpected principalObject of class %@: %@.", (uint8_t *)&v2, 0x16u);
}

@end