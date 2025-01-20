@interface LSDReadClient
@end

@implementation LSDReadClient

uint64_t __50___LSDReadClient_invokeServiceInvocation_isReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

uint64_t __65___LSDReadClient_getServerStoreNonBlockingWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49___LSDReadClient_getDiskUsage_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) XPCConnection];
  id v8 = 0;
  LODWORD(v2) = [v2 _fetchWithXPCConnection:v3 error:&v8];
  id v4 = v8;

  if (v2)
  {
    id v5 = 0;
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
    id v5 = v4;
  }
  uint64_t v7 = (*(uint64_t (**)(void, uint64_t, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v5);
  MEMORY[0x185310460](v7);
}

void __80___LSDReadClient_getExtensionPointRecordForCurrentProcessWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v4 extensionPointRecord];
  }
  else
  {
    v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98___LSDReadClient_getRelatedTypesOfTypeWithIdentifier_maximumDegreeOfSeparation_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  [v5 addObject:v6];
}

void __90___LSDReadClient_getResourceValuesForKeys_mimic_preferredLocalizations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = _LSReplaceURLPropertyValueForEncoding(v5);

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)_CSStringCopyCFString();
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      if (!v5 || [v5 containsObject:v4])
      {
        [*(id *)(a1 + 40) addObject:v4];
        [*(id *)(a1 + 48) addObject:v6];
      }
    }
  }
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  _CSArrayEnumerateAllValues();
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  _CSArrayEnumerateAllValues();
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = _LSGetPlugin(**(void **)(a1 + 48), a3);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  return result;
}

uint64_t __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = _LSBundleGet(**(void ***)(a1 + 48), a3);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  return result;
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_8(uint64_t a1)
{
  id v2 = (id)_CSStringCopyCFString();
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70___LSDReadClient_mapBundleIdentifiers_orMachOUUIDs_completionHandler___block_invoke_9(uint64_t a1)
{
  id v2 = (id)_CSStringCopyCFString();
  if (v2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __92___LSDReadClient_mapPlugInBundleIdentifiersToContainingBundleIdentifiers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = _LSGetPlugin(**(void **)(a1 + 48), a3);
  if (v4 && _LSBundleGet(**(void ***)(a1 + 48), *(_DWORD *)(v4 + 224)) && (uint64_t v5 = _CSStringCopyCFString()) != 0)
  {
    id v6 = (id)v5;
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = 0;
  }
}

@end