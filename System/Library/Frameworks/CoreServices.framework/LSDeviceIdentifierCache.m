@interface LSDeviceIdentifierCache
@end

@implementation LSDeviceIdentifierCache

void __94___LSDeviceIdentifierCache_getIdentifierOfType_vendorName_bundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v9 = 0;
    goto LABEL_41;
  }
  v2 = (uint64_t *)(a1 + 64);
  v3 = [*(id *)(a1 + 48) identifiersOfTypeNotDispatched:*(void *)(a1 + 64)];
  uint64_t v4 = *v2;
  if (*v2 != 1) {
    goto LABEL_7;
  }
  v5 = +[LSApplicationRestrictionsManager sharedInstance]();
  if ((-[LSApplicationRestrictionsManager isAdTrackingEnabled](v5) & 1) == 0)
  {

    goto LABEL_13;
  }
  char v6 = [*(id *)(a1 + 48) deviceUnlockedSinceBoot];

  if ((v6 & 1) == 0)
  {
LABEL_13:
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29128], "_LS_nullUUID");
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(a1 + 64);
LABEL_7:
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      id v7 = *(id *)(*(void *)(a1 + 48) + 16);
      if (v7)
      {
LABEL_38:
        v9 = [*(id *)(a1 + 48) applyPerUserEntropyNotDispatched:v7 type:*(void *)(a1 + 64)];

        goto LABEL_40;
      }
      v8 = [MEMORY[0x1E4F29128] UUID];
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 16), v8);
      [*(id *)(a1 + 48) save];
      goto LABEL_37;
    }
    if (!v3) {
      goto LABEL_39;
    }
    if (+[LSHRNSupport deviceConfiguredForHRN])
    {
      v29[0] = 0;
      v29[1] = 0;
      v11 = [*(id *)(a1 + 48) deviceIdentifierVendorSeed];
      [v11 getUUIDBytes:v29];

      uint64_t v12 = *(void *)(a1 + 32);
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:16];
      v9 = +[LSHRNSupport vendorIDFromVendorName:v12 seedData:v13 error:0];

      goto LABEL_40;
    }
    v14 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v15 = [v14 objectForKeyedSubscript:@"LSVendorIdentifier"];

    if (v15)
    {
      v16 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      v17 = [v16 objectForKeyedSubscript:@"LSApplications"];

      if (v17 && [v17 containsObject:*(void *)(a1 + 40)])
      {
        v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v15];

        if (v8)
        {
LABEL_36:

LABEL_37:
          id v7 = v8;
          if (v8) {
            goto LABEL_38;
          }
LABEL_39:
          v9 = 0;
          goto LABEL_40;
        }
      }
      else
      {
      }
    }
    v18 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v18)
    {
      v19 = [MEMORY[0x1E4F1CA60] dictionary];
      [v3 setObject:v19 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    v20 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v21 = [v20 objectForKeyedSubscript:@"LSVendorIdentifier"];

    if (v21)
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v21];
    }
    else
    {
      v8 = [MEMORY[0x1E4F29128] UUID];
      v22 = [v8 UUIDString];
      v23 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      [v23 setObject:v22 forKeyedSubscript:@"LSVendorIdentifier"];
    }
    v24 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
    v25 = [v24 objectForKeyedSubscript:@"LSApplications"];

    if (!v25)
    {
      uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
      v27 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
      [v27 setObject:v26 forKeyedSubscript:@"LSApplications"];

      v25 = (void *)v26;
    }
    if (([v25 containsObject:*(void *)(a1 + 40)] & 1) == 0) {
      [v25 addObject:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) save];

    goto LABEL_36;
  }
  if (!+[LSHRNSupport deviceConfiguredForHRN]) {
    goto LABEL_39;
  }
  uint64_t v10 = [*(id *)(a1 + 48) deviceIdentifierVendorSeed];
LABEL_16:
  v9 = (void *)v10;
LABEL_40:

LABEL_41:
  uint64_t v28 = *(void *)(a1 + 56);
  if (v28) {
    (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v9);
  }
}

void __93___LSDeviceIdentifierCache_clearIdentifiersForUninstallationWithVendorName_bundleIdentifier___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      v3 = [*(id *)(a1 + 48) identifiersOfTypeNotDispatched:_LSAllDeviceIdentifierTypes[i]];
      uint64_t v4 = v3;
      if (v3)
      {
        v5 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
        char v6 = v5;
        if (v5)
        {
          id v7 = [v5 objectForKeyedSubscript:@"LSApplications"];
          [v7 removeObject:*(void *)(a1 + 40)];
          if (![v7 count]) {
            [v4 removeObjectForKey:*(void *)(a1 + 32)];
          }
          [*(id *)(a1 + 48) save];
        }
      }
    }
  }
}

void __54___LSDeviceIdentifierCache_clearAllIdentifiersOfType___block_invoke(uint64_t a1)
{
  if ([(id)__LSDefaultsGetSharedInstance() isInEducationMode])
  {
    id v14 = (id)[*(id *)(*(void *)(a1 + 32) + 48) mutableCopy];
    if (v14)
    {
      v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
      v3 = [v14 objectForKeyedSubscript:v2];

      if (v3)
      {
        uint64_t v4 = [*(id *)(a1 + 32) generateSomePerUserEntropyNotDispatched];
        v5 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
        [v14 setObject:v4 forKeyedSubscript:v5];

        uint64_t v6 = [v14 copy];
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = *(void **)(v7 + 48);
        *(void *)(v7 + 48) = v6;

        [*(id *)(a1 + 32) save];
      }
    }
LABEL_15:

    return;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 == 2)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v11 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = 0;
  }
  else
  {
    if (v9 != 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifiersOfTypeNotDispatched:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 && [v14 count])
      {
        [v14 removeAllObjects];
        [*(id *)(a1 + 32) save];
      }
      goto LABEL_15;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = 0;
  }

  v13 = *(void **)(a1 + 32);

  [v13 save];
}

void __32___LSDeviceIdentifierCache_save__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) allIdentifiersNotDispatched];
  if (v2)
  {
    v3 = *(id *)(*(void *)(a1 + 32) + 56);
    if (!v3)
    {
      uint64_t v6 = _LSDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers file URL.", buf, 2u);
      }
      goto LABEL_22;
    }
    uint64_t v4 = _LSDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [v3 path];
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_182959000, v4, OS_LOG_TYPE_DEFAULT, "Writing identifiers file to %@", buf, 0xCu);
    }
    uint64_t v6 = [v2 mutableCopy];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    if (v8)
    {
      uint64_t v9 = [v8 UUIDString];
      [v6 setObject:v9 forKeyedSubscript:@"LSAdvertiserIdentifier"];

      uint64_t v7 = *(void *)(a1 + 32);
    }
    uint64_t v10 = *(void **)(v7 + 24);
    if (v10)
    {
      v11 = [v10 UUIDString];
      [v6 setObject:v11 forKeyedSubscript:@"LSVendorSeed"];
    }
    id v21 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v21];
    id v13 = v21;
    id v14 = v13;
    if (v12)
    {
      id v20 = v13;
      char v15 = [v12 writeToURL:v3 options:1073741825 error:&v20];
      id v16 = v20;

      if (v15)
      {
LABEL_21:

LABEL_22:
        goto LABEL_23;
      }
      v17 = _LSDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_DEFAULT, "Failed to write plist data for identifiers: %@", buf, 0xCu);
      }
    }
    else
    {
      v17 = _LSDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v14;
        _os_log_impl(&dword_182959000, v17, OS_LOG_TYPE_DEFAULT, "Failed to create plist data for identifiers: %@", buf, 0xCu);
      }
      id v16 = v14;
    }

    goto LABEL_21;
  }
  v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get identifiers.", buf, 2u);
  }
LABEL_23:

  if (*(void *)(*(void *)(a1 + 32) + 48)
    && [(id)__LSDefaultsGetSharedInstance() isInEducationMode])
  {
    v18 = _LSPerUserEntropyURL();
    if (v18)
    {
      v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:*(void *)(*(void *)(a1 + 32) + 48)];
      [v19 writeToURL:v18 options:1073741825 error:0];
    }
  }
}

@end