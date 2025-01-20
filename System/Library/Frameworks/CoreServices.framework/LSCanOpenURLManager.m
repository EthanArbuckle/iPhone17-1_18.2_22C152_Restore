@interface LSCanOpenURLManager
@end

@implementation LSCanOpenURLManager

void __37___LSCanOpenURLManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(_LSCanOpenURLManager);
  v1 = (void *)+[_LSCanOpenURLManager sharedManager]::result;
  +[_LSCanOpenURLManager sharedManager]::result = (uint64_t)v0;
}

void __74___LSCanOpenURLManager_resetSchemeQueryLimitForApplicationWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) writeSchemesMap];
  }

  JUMPOUT(0x185310460);
}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v12 = 0;
  v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:&v12];
  id v4 = v12;
  if (v3)
  {
    v5 = [(id)__LSDefaultsGetSharedInstance() queriedSchemesMapFileURL];
    if (!v5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"LSCanOpenURLManager.mm" lineNumber:172 description:@"Failed to get URL for lsd-schemes file"];
    }
    id v11 = v4;
    char v6 = [v3 writeToURL:v5 options:268435457 error:&v11];
    id v7 = v11;

    if ((v6 & 1) == 0)
    {
      v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [v5 path];
        __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_2(v9, (uint64_t)v7, buf, v8);
      }
    }
  }
  else
  {
    v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_1((uint64_t)v4, v5);
    }
    id v7 = v4;
  }
}

void __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __111___LSCanOpenURLManager_PrivateSchemeChecking__legacy_isBundleID_bundleData_context_allowedToCheckScheme_error___block_invoke_73(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 arrayByAddingObject:*(void *)(a1 + 48)];

    id v5 = (void *)v4;
  }
  else
  {
    v6[0] = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  MEMORY[0x185310460]([*(id *)(a1 + 32) writeSchemesMap]);
}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Could not serialize lsd-schemes file: %@", (uint8_t *)&v2, 0xCu);
}

void __62___LSCanOpenURLManager_PrivateSchemeChecking__writeSchemesMap__block_invoke_cold_2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Could not store lsd-schemes file at %@: %@", buf, 0x16u);
}

@end