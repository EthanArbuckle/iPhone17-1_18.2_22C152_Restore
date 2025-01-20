@interface FAUICreatePDFFromDocumentURLs
@end

@implementation FAUICreatePDFFromDocumentURLs

void ___FAUICreatePDFFromDocumentURLs_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v5 = fauiLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_3(a1, (void *)(a1 + 32), v5);
    }
    goto LABEL_20;
  }
  int v6 = [v3 startAccessingSecurityScopedResource];
  id v15 = 0;
  uint64_t v7 = *MEMORY[0x263EFF780];
  id v14 = 0;
  int v8 = [v4 getResourceValue:&v15 forKey:v7 error:&v14];
  v9 = (__CFString *)v15;
  id v10 = v14;
  if (!v8)
  {
    v12 = fauiLogHandle;
    if (!fauiLogHandle)
    {
      FAUIInitLogging();
      v12 = fauiLogHandle;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_2();
    }
    goto LABEL_17;
  }
  if (UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x263F01A68]))
  {
    v11 = _AppendImageToDocument(v4, *(void **)(a1 + 48));
    if (v11) {
      [*(id *)(a1 + 56) addObject:v11];
    }
  }
  else
  {
    if (!UTTypeConformsTo(v9, (CFStringRef)*MEMORY[0x263F01AC8]))
    {
      v13 = fauiLogHandle;
      if (!fauiLogHandle)
      {
        FAUIInitLogging();
        v13 = fauiLogHandle;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_1();
      }
      goto LABEL_17;
    }
    v11 = (void *)[objc_alloc((Class)getPDFDocumentClass()) initWithURL:v4];
    _AppendDocumentToDocument(v11, *(void **)(a1 + 48));
  }

LABEL_17:
  if (v6) {
    [v4 stopAccessingSecurityScopedResource];
  }

LABEL_20:
}

uint64_t ___FAUICreatePDFFromDocumentURLs_block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_23D38B000, v0, v1, "Error: Unexpected UTI: %@ for file: %@");
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_23D38B000, v0, v1, "Error: Unable to determine UTI for file: %@ error: %@");
}

void ___FAUICreatePDFFromDocumentURLs_block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1(&dword_23D38B000, (uint64_t)a2, a3, "Failed to take a coordinated read on url: %@ error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end