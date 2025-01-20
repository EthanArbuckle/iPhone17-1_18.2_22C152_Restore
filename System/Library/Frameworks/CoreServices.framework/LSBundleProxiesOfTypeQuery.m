@interface LSBundleProxiesOfTypeQuery
@end

@implementation LSBundleProxiesOfTypeQuery

void __65___LSBundleProxiesOfTypeQuery__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x18530F680]();
  if ([*(id *)(a1 + 32) bundleUnitMeetsRequirements:a2 bundleData:a3 context:*(void *)(a1 + 48)])
  {
    if ([*(id *)(a1 + 32) type] == 5)
    {
      v9 = (void *)_CSStringCopyCFString();
      if (v9)
      {
        uint64_t v10 = +[LSVPNPluginProxy VPNPluginProxyForIdentifier:v9 withContext:*(void *)(a1 + 48)];
      }
      else
      {
        uint64_t v10 = 0;
      }

      v11 = (void *)v10;
      if (v10) {
        goto LABEL_11;
      }
    }
    else
    {
      v11 = +[LSApplicationProxy applicationProxyWithBundleUnitID:a2 withContext:*(void *)(a1 + 48)];
      if (v11)
      {
LABEL_11:
        *a4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() ^ 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      uint64_t v14 = a2;
      _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "Failed to create bundleProxy for bundle %lu", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_12;
  }
LABEL_13:
}

@end