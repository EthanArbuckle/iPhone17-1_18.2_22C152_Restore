@interface MXExtensionManager
@end

@implementation MXExtensionManager

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = [WeakRetained _applyExtensionPredicateWithExtensionsIfNeeded:v6];

  if (v5)
  {
    v9 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v10 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_3;
    v11 = v5;
  }
  else
  {
    v9 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v10 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_4;
    v11 = v8;
  }
  v9[2] = v10;
  v9[3] = &unk_1E54B8248;
  v9[4] = WeakRetained;
  v9[5] = v11;
  id v12 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extensionManager:*(void *)(a1 + 32) didUpdateAvailableExtensions:*(void *)(a1 + 40)];
}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) extensionProvider];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_2;
  v7 = &unk_1E54B8830;
  objc_copyWeak(&v8, &location);
  v3 = [v2 addExtensionsUpdateHandler:&v4];
  objc_msgSend(*(id *)(a1 + 32), "setMatchingContext:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __29___MXExtensionManager__queue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.maps._MXExtensionManager", v2);
  v1 = (void *)qword_1EB316118;
  qword_1EB316118 = (uint64_t)v0;
}

uint64_t __90___MXExtensionManager_Ridesharing___maps_lookupPolicyForEnabledRidesharingNonUIExtensions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isEnabled]
    && ([v3 extensionPointIdentifier],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqual:*MEMORY[0x1E4F300E8]],
        v4,
        v5))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_maps_ridesharingRequiredIntentClassesForNonUIHandling", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([v3 canSupportIntentClass:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            uint64_t v7 = 1;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __83___MXExtensionManager_Ridesharing___maps_lookupPolicyForRidesharingNonUIExtensions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 extensionPointIdentifier];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F300E8]];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "_maps_ridesharingRequiredIntentClassesForNonUIHandling", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([v3 canSupportIntentClass:*(void *)(*((void *)&v11 + 1) + 8 * i)])
          {
            uint64_t v7 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __56___MXExtensionManager_managerWithLookupPolicy_delegate___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extensionManager:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

void __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) extensionProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke_2;
  v4[3] = &unk_1E54BCD98;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 addExtensionsUpdateHandler:v4];
  [*(id *)(a1 + 32) setMatchingContext:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70___MXExtensionManager_managerWithExtensionLookupPolicy_updateHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = [WeakRetained _applyExtensionPredicateWithExtensionsIfNeeded:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62___MXExtensionManager_lookupPolicyForExtensionWithCapability___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 capabilities];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __64___MXExtensionManager_lookupPolicyForExtensionWithCapabilities___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 capabilities];
  uint64_t v4 = [v2 isSubsetOfSet:v3];

  return v4;
}

uint64_t __63___MXExtensionManager__lookupPolicyForExtensionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 extensionPointIdentifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F300E8]])
  {
  }
  else
  {
    id v5 = [v3 extensionPointIdentifier];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F300F0]];

    if (!v6)
    {
      uint64_t v11 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  id v7 = *(void **)(a1 + 32);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke_2;
  uint64_t v16 = &unk_1E54BCDE8;
  v18 = &v19;
  id v8 = v3;
  id v17 = v8;
  [v7 enumerateObjectsUsingBlock:&v13];
  if (objc_msgSend(*(id *)(a1 + 40), "count", v13, v14, v15, v16))
  {
    if (*((unsigned char *)v20 + 24))
    {
      v9 = *(void **)(a1 + 40);
      v10 = [v8 _containingAppIdentifer];
      uint64_t v11 = [v9 containsObject:v10];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = *((unsigned __int8 *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
LABEL_11:

  return v11;
}

uint64_t __102___MXExtensionManager__lookupPolicyForExtensionWithContainingAppIdentifiers_supportsIntentClassNames___block_invoke_2(uint64_t a1, NSString *aClassName)
{
  Class v3 = NSClassFromString(aClassName);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) canSupportIntentClass:v3];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v4 + 24) = result;
  return result;
}

uint64_t __46___MXExtensionManager__lookupPolicyWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end