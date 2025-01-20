@interface LSStringLocalizer
@end

@implementation LSStringLocalizer

void __40___LSStringLocalizer_coreTypesLocalizer__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/CoreServices/MobileCoreTypes.bundle" isDirectory:1];
  if (v4)
  {
    v0 = [[_LSStringLocalizer alloc] initWithBundleURL:v4 stringsFile:@"InfoPlist" checkMainBundle:0 legacyLocalizationList:0];
    v1 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v0;
  }
  if (!+[_LSStringLocalizer coreTypesLocalizer]::result)
  {
    v2 = objc_alloc_init(_LSStringLocalizer);
    v3 = (void *)+[_LSStringLocalizer coreTypesLocalizer]::result;
    +[_LSStringLocalizer coreTypesLocalizer]::result = (uint64_t)v2;
  }
}

void __52___LSStringLocalizer_missingLocalizationPlaceholder__block_invoke()
{
  id v2 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v0 = [v2 UUIDString];
  v1 = (void *)+[_LSStringLocalizer missingLocalizationPlaceholder]::result;
  +[_LSStringLocalizer missingLocalizationPlaceholder]::result = v0;
}

uint64_t __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) addObject:a4];
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x18530F680]();
  if ([v5 isEqual:&stru_1ECB1A570])
  {
    v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }
  else
  {
    v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_LSBundleLibraryPath"];
    if (v9)
    {
      v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      if (!v10)
      {
        uint64_t v11 = [*(id *)(a1 + 48) bundleURL];
        uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      v14 = [v10 URLByAppendingPathComponent:v9 isDirectory:1];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 URLByAppendingPathComponent:v5 isDirectory:1];
        if (v16)
        {
          v8 = (_LSStringLocalizer *)[objc_alloc(*(Class *)(a1 + 72)) initWithBundleURL:v16 stringsFile:@"InfoPlist" checkMainBundle:*(unsigned __int8 *)(a1 + 80) legacyLocalizationList:*(unsigned __int8 *)(a1 + 81)];
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v19[3] = &unk_1E5230B80;
  id v20 = *(id *)(a1 + 56);
  id v17 = v5;
  uint64_t v18 = *(void *)(a1 + 72);
  id v21 = v17;
  uint64_t v22 = v18;
  [(_LSStringLocalizer *)v8 enumerateLocalizedStringsForKeys:v6 usingBlock:v19];
}

void __137___LSStringLocalizer_gatherLocalizedStringsForLSBundleProvider_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v19 = a3;
  id v8 = a4;
  v9 = [a1[4] objectForKeyedSubscript:v7];
  if (!v9 || (char v10 = [a1[5] isEqual:&stru_1ECB1A570], v9, (v10 & 1) != 0))
  {
    if ([v8 count])
    {
      uint64_t v11 = (void *)[v19 mutableCopy];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
            id v17 = [a1[6] missingLocalizationPlaceholder];
            [v11 setObject:v17 forKeyedSubscript:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      uint64_t v18 = (void *)[v11 copy];
      [a1[4] setObject:v18 forKeyedSubscript:v7];
    }
    else
    {
      [a1[4] setObject:v19 forKeyedSubscript:v7];
    }
  }
}

uint64_t __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) addObject:a4];
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x18530F680]();
  if ([v5 isEqual:&stru_1ECB1A570])
  {
    id v8 = (_LSStringLocalizer *)*(id *)(a1 + 32);
  }
  else
  {
    v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_LSBundleLibraryPath"];
    if (v9)
    {
      char v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (!v10)
      {
        CFURLRef v11 = CFBundleCopyBundleURL(*(CFBundleRef *)(a1 + 64));
        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        char v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      uint64_t v14 = [v10 URLByAppendingPathComponent:v9 isDirectory:1];
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = [v14 URLByAppendingPathComponent:v5 isDirectory:1];
        if (v16)
        {
          id v8 = (_LSStringLocalizer *)[objc_alloc(*(Class *)(a1 + 72)) initWithBundleURL:v16 stringsFile:@"InfoPlist" checkMainBundle:*(unsigned __int8 *)(a1 + 80) legacyLocalizationList:*(unsigned __int8 *)(a1 + 81)];
          _LSStringLocalizerPrewarmAllLocalizations(v8);
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3;
  v19[3] = &unk_1E5230B80;
  id v20 = *(id *)(a1 + 48);
  id v17 = v5;
  uint64_t v18 = *(void *)(a1 + 72);
  id v21 = v17;
  uint64_t v22 = v18;
  [(_LSStringLocalizer *)v8 enumerateLocalizedStringsForKeys:v6 usingBlock:v19];
}

void __129___LSStringLocalizer_gatherLocalizedStringsForCFBundle_infoDictionary_domains_delegatesMightBeMainBundle_legacyLocalizationList___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v19 = a3;
  id v8 = a4;
  v9 = [a1[4] objectForKeyedSubscript:v7];
  if (!v9 || (char v10 = [a1[5] isEqual:&stru_1ECB1A570], v9, (v10 & 1) != 0))
  {
    if ([v8 count])
    {
      CFURLRef v11 = (void *)[v19 mutableCopy];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v8;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
            id v17 = [a1[6] missingLocalizationPlaceholder];
            [v11 setObject:v17 forKeyedSubscript:v16];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v13);
      }

      uint64_t v18 = (void *)[v11 copy];
      [a1[4] setObject:v18 forKeyedSubscript:v7];
    }
    else
    {
      [a1[4] setObject:v19 forKeyedSubscript:v7];
    }
  }
}

@end