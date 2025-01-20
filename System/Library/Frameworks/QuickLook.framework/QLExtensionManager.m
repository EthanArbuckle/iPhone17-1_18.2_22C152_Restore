@interface QLExtensionManager
@end

@implementation QLExtensionManager

void __145__QLExtensionManager_Internal__remoteViewControllerForContentType_applicationBundleIdentifier_extensionType_generatonType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x263F62940];
    v11 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_FAULT, "Error while instantiating view controller: %@ #Remote", (uint8_t *)&v13, 0xCu);
    }
  }
  v12 = [*(id *)(a1 + 32) _extensionContextForUUID:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end