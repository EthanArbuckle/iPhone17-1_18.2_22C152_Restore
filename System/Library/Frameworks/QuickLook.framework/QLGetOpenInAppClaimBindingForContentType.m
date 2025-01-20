@interface QLGetOpenInAppClaimBindingForContentType
@end

@implementation QLGetOpenInAppClaimBindingForContentType

void ___QLGetOpenInAppClaimBindingForContentType_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!_block_invoke_cachedApps)
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    v3 = (void *)_block_invoke_cachedApps;
    _block_invoke_cachedApps = v2;
  }
  if (*(void *)(a1 + 32))
  {
    v4 = objc_msgSend((id)_block_invoke_cachedApps, "objectForKeyedSubscript:");
    if (v4)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
    else
    {
      v5 = [MEMORY[0x263F018A8] documentProxyForName:0 type:*(void *)(a1 + 32) MIMEType:0 isContentManaged:*(unsigned __int8 *)(a1 + 48) sourceAuditToken:0];
      v6 = v5;
      if (v5)
      {
        uint64_t v7 = _QLGetOpenInAppClaimBindingForDocumentProxy(v5);
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;

        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        if (v10) {
          [(id)_block_invoke_cachedApps setObject:v10 forKeyedSubscript:*(void *)(a1 + 32)];
        }
      }
      else
      {
        v11 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          v13 = (NSObject **)MEMORY[0x263F62940];
          QLSInitLogging();
          v11 = *v13;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v14 = 138412290;
          uint64_t v15 = v12;
          _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "No Open In app for content type: %@ #Generic", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
}

@end