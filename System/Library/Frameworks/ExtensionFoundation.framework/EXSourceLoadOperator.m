@interface EXSourceLoadOperator
@end

@implementation EXSourceLoadOperator

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2;
  v7[3] = &unk_1E573D8B0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 96);
  long long v11 = *(_OWORD *)(a1 + 80);
  long long v12 = v6;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v4 _loadItemOfClass:v2 forTypeIdentifier:v8 options:v5 coerceForCoding:1 completionHandler:v7];
}

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  CFStringRef v7 = *(const __CFString **)(a1 + 32);
  if (v7)
  {
    if (UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E4F226F8]))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [MEMORY[0x1E4F1CB10] objectWithItemProviderData:v5 typeIdentifier:*(void *)(a1 + 32) error:0];
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v8 isFileURL])
            {
              id v9 = [_EXItemProviderSandboxedResource alloc];
              id v25 = 0;
              long long v10 = *(_OWORD *)(a1 + 72);
              *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
              *(_OWORD *)&buf[16] = v10;
              long long v11 = [(_EXItemProviderSandboxedResource *)v9 initWithContentsOfURL:v8 auditToken:buf error:&v25];
              id v12 = v25;
              if (v11)
              {
                v13 = v5;
                uint64_t v5 = v11;
              }
              else
              {
                v13 = _EXDefaultLog();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
                  __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2_cold_1();
                }
              }
            }
          }
        }
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 isFileURL])
  {
    v14 = [_EXItemProviderSandboxedResource alloc];
    id v24 = v6;
    long long v15 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&buf[16] = v15;
    uint64_t v16 = [(_EXItemProviderSandboxedResource *)v14 initWithContentsOfURL:v5 auditToken:buf error:&v24];
    id v17 = v24;

    id v6 = v17;
    uint64_t v5 = v16;
  }
  v18 = _EXDefaultLog();
  v19 = v18;
  if (v5)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v21;
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v6;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke_2;
  v4[3] = &unk_1E573D030;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 _loadPreviewImageOfClass:v3 options:v2 coerceForCoding:1 completionHandler:v4];
}

uint64_t __65___EXSourceLoadOperator_previewImageWithClassName_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71___EXSourceLoadOperator_resolveWithIdentifier_className_options_reply___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_191F29000, v0, OS_LOG_TYPE_DEBUG, "Unable to create sandbox resource with error: %@", v1, 0xCu);
}

@end