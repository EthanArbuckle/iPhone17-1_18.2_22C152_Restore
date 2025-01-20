@interface ASPasswordManagerIconController
@end

@implementation ASPasswordManagerIconController

void __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = WeakRetained[16];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v1 + 64);
  v2 = (id *)(v1 + 64);
  id v3 = v4;
  if (v4) {
    [v3 addObjectsFromArray:v2[8]];
  }
  else {
    objc_storeStrong(v2, v2[8]);
  }
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke_2;
  v2[3] = &unk_2643953D8;
  uint64_t v1 = *(void **)(a1 + 32);
  v2[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v3, (id *)(a1 + 48));
  [v1 getAllItemsWithCompletionHandler:v2];
  objc_destroyWeak(&v3);
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke_3;
  v6[3] = &unk_2643953B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __49___ASPasswordManagerIconController__fetchHistory__block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v4 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = v3;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v11 = [v10 url];
          v12 = [v11 host];
          uint64_t v13 = objc_msgSend(v12, "safari_highLevelDomainFromHost");

          if (![v13 length])
          {

            goto LABEL_21;
          }
          v14 = [*((id *)WeakRetained + 6) objectForKeyedSubscript:v13];
          if (!v14)
          {
            v14 = [MEMORY[0x263EFF9C0] set];
            [*((id *)WeakRetained + 6) setObject:v14 forKeyedSubscript:v13];
          }
          [v14 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = *((id *)WeakRetained + 8);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * j));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    v20 = (void *)*((void *)WeakRetained + 8);
    *((void *)WeakRetained + 8) = 0;

    *((_WORD *)WeakRetained + 4) = 257;
  }
LABEL_21:
}

void __58___ASPasswordManagerIconController_clearIconFetchingState__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 80);
  uint64_t v4 = (void *)[*(id *)(v2 + 40) copy];
  [v3 cancelRequestsWithTokens:v4];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 112))
  {
    id WBSHistoryClass = getWBSHistoryClass();
    [WBSHistoryClass clearExistingSharedHistory];
  }
}

void __50___ASPasswordManagerIconController_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 80) cancelRequestWithToken:v2];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObject:v2];
  }
  else
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50___ASPasswordManagerIconController_cancelRequest___block_invoke_cold_1(v3);
    }
  }
}

uint64_t __76___ASPasswordManagerIconController_iconForDomain_requestID_responseHandler___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 56) containsObject:a1[5]];
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 56);

  return [v3 addObject:v2];
}

uint64_t __61___ASPasswordManagerIconController_backgroundColorForDomain___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x270F9A758]();
}

void __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke()
{
  container_query_create();
  container_query_set_class();
  xpc_object_t objects = xpc_string_create("com.apple.mobilesafari");
  xpc_object_t v0 = xpc_array_create(&objects, 1uLL);
  container_query_set_identifiers();
  container_query_operation_set_flags();
  container_query_set_persona_unique_string();
  if (container_query_get_single_result())
  {
    uint64_t v1 = [NSString stringWithUTF8String:container_get_path()];
    uint64_t v2 = (void *)_mobileSafariContainerPath_mobileSafariContainerPath;
    _mobileSafariContainerPath_mobileSafariContainerPath = v1;

    uint64_t v3 = (void *)container_copy_sandbox_token();
    if ((sandbox_extension_consume() & 0x8000000000000000) == 0) {
      free(v3);
    }
    container_query_free();
  }
  else
  {
    container_query_get_last_error();
    uint64_t v4 = (void *)container_error_copy_unlocalized_description();
    id v5 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke_cold_1((uint64_t)v4, v5);
    }
    free(v4);
    container_query_free();
    uint64_t v6 = (void *)_mobileSafariContainerPath_mobileSafariContainerPath;
    _mobileSafariContainerPath_mobileSafariContainerPath = 0;
  }
}

void __43___ASPasswordManagerIconController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 cancelRequestsWithTokens:v2];
}

void __79___ASPasswordManagerIconController__checkForLocalVisitToDomain_withCompletion___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  if ([v3 count])
  {
    id v2 = [getWBSHistoryClass() existingSharedHistory];
    [v2 checkIfLocalVisitExistsInAnyOfItems:v3 withCompletion:a1[6]];
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_2;
  v4[3] = &unk_264395508;
  v4[4] = v3;
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v3 _checkForLocalVisitToDomain:v5 withCompletion:v4];
}

uint64_t __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 6;
  }
  else {
    uint64_t v2 = 4;
  }
  return [*(id *)(a1 + 32) _requestTouchIconForDomain:*(void *)(a1 + 40) options:v2 requestID:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
}

uint64_t __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([*(id *)(*(void *)(a1 + 32) + 120) initialized]
    && [*(id *)(*(void *)(a1 + 32) + 120) shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v2 _requestTouchIconForDomain:v3 options:14 requestID:v4 responseHandler:v5];
  }
  else
  {
    id v7 = *(unsigned char **)(a1 + 32);
    if (!v7[9]) {
      [v7 _requestTouchIconForDomain:*(void *)(a1 + 40) options:0 requestID:*(void *)(a1 + 48) responseHandler:*(void *)(a1 + 56)];
    }
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 141558275;
      uint64_t v11 = 1752392040;
      __int16 v12 = 2117;
      uint64_t v13 = v9;
      _os_log_impl(&dword_21918F000, v8, OS_LOG_TYPE_DEFAULT, "Fetching touch icon in history; domain=%{sensitive, mask.hash}@",
        (uint8_t *)&v10,
        0x16u);
    }
    return [*(id *)(a1 + 32) _fetchIconInHistoryWithBlock:*(void *)(a1 + 64)];
  }
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained[17] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v5)
    {
      id v6 = [MEMORY[0x263EFF910] now];
      int v7 = objc_msgSend(v6, "safari_isEarlierThanDate:", v5);

      if (v7)
      {
        [v4 _handleIconFetchFailureWithDomain:*(void *)(a1 + 32) options:*(void *)(a1 + 64) requestID:*(void *)(a1 + 40) response:0 responseHandler:*(void *)(a1 + 48)];
LABEL_14:

        goto LABEL_15;
      }
      [v4[17] removeObjectForKey:*(void *)(a1 + 32)];
    }
    getSFScreenScale();
    +[_ASPasswordManagerIconController _preferredIconSize];
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = (*(_DWORD *)(a1 + 64) >> 3) & 1;
      *(_DWORD *)buf = 141558531;
      *(void *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2117;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v29) = v10;
      _os_log_impl(&dword_21918F000, v8, OS_LOG_TYPE_DEFAULT, "Fetching touch icon; domain=%{sensitive, mask.hash}@; enablePrivateRelay=%{BOOL}d",
        buf,
        0x1Cu);
    }
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v11 = (void *)get_SFSavedAccountTouchIconRequestClass_softClass;
    uint64_t v27 = get_SFSavedAccountTouchIconRequestClass_softClass;
    if (!get_SFSavedAccountTouchIconRequestClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __get_SFSavedAccountTouchIconRequestClass_block_invoke;
      v29 = &unk_2643956C0;
      v30 = &v24;
      __get_SFSavedAccountTouchIconRequestClass_block_invoke((uint64_t)buf);
      uint64_t v11 = (void *)v25[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v24, 8);
    uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "safari_bestURLForUserTypedString");
    +[_ASPasswordManagerIconController _minimumIconSize];
    uint64_t v14 = objc_msgSend(v12, "requestWithTitle:url:minimumIconSize:maximumIconSize:options:", 0, v13, *(void *)(a1 + 64));

    id v15 = v4[10];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_42;
    v19[3] = &unk_2643955F8;
    objc_copyWeak(v23, v2);
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void **)(a1 + 64);
    id v20 = v16;
    v23[1] = v17;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    uint64_t v18 = [v15 registerRequest:v14 priority:2 responseHandler:v19];
    if (v18)
    {
      [v4[5] addObject:v18];
      if (*(void *)(a1 + 40)) {
        objc_msgSend(v4[4], "setObject:forKeyedSubscript:", v18);
      }
    }

    objc_destroyWeak(v23);
    goto LABEL_14;
  }
LABEL_15:
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2;
  v7[3] = &unk_2643955D0;
  id v8 = v3;
  id v4 = v3;
  objc_copyWeak(v12, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 32);
  id v6 = *(void **)(a1 + 64);
  id v9 = v5;
  v12[1] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(v12);
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v2 = (void *)getWBSTouchIconResponseClass_softClass;
  uint64_t v26 = getWBSTouchIconResponseClass_softClass;
  if (!getWBSTouchIconResponseClass_softClass)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __getWBSTouchIconResponseClass_block_invoke;
    v22[3] = &unk_2643956C0;
    v22[4] = &v23;
    __getWBSTouchIconResponseClass_block_invoke((uint64_t)v22);
    uint64_t v2 = (void *)v24[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v23, 8);
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      id v5 = *(id *)(a1 + 32);
      id v6 = [v5 touchIcon];
      int v7 = v6;
      if (v6)
      {
        id v8 = WeakRetained[9];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_44;
        v13[3] = &unk_2643955A8;
        id v14 = v6;
        id v15 = *(id *)(a1 + 40);
        id v9 = *(id *)(a1 + 56);
        id v16 = WeakRetained;
        id v17 = v9;
        dispatch_async(v8, v13);
      }
      else
      {
        id v10 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_cold_1();
        }
        id v11 = WeakRetained[9];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_43;
        block[3] = &unk_264395580;
        objc_copyWeak(&v21, (id *)(a1 + 64));
        id v12 = v5;
        id v19 = v12;
        id v20 = *(id *)(a1 + 40);
        dispatch_async(v11, block);
        [WeakRetained _handleIconFetchFailureWithDomain:*(void *)(a1 + 40) options:*(void *)(a1 + 72) requestID:*(void *)(a1 + 48) response:v12 responseHandler:*(void *)(a1 + 56)];

        objc_destroyWeak(&v21);
      }
    }
  }
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_43(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) nextIconDownloadRetryDate];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) nextIconDownloadRetryDate];
      [WeakRetained[17] setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_44(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
  uint64_t v3 = *(void *)(a1 + 32);
  +[_ASPasswordManagerIconController _preferredIconSize];
  id v4 = objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v3);
  id v5 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 141558275;
      uint64_t v9 = 1752392040;
      __int16 v10 = 2117;
      uint64_t v11 = v7;
      _os_log_impl(&dword_21918F000, v6, OS_LOG_TYPE_DEFAULT, "Finished fetching touch icon; domain=%{sensitive, mask.hash}@",
        (uint8_t *)&v8,
        0x16u);
    }
    [*(id *)(*(void *)(a1 + 48) + 16) setObject:v4 forKey:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 48) _iconDidUpdateForDomain:*(void *)(a1 + 40)];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __113___ASPasswordManagerIconController__handleIconFetchFailureWithDomain_options_requestID_response_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) extractedBackgroundColor];
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

void __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke_2;
    v7[3] = &unk_264395428;
    void v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x263F66570];
        uint64_t v12 = [v10 domain];
        uint64_t v13 = [v11 domainByStrippingSubdomainWildcardPrefixIfNecessary:v12];

        if (([MEMORY[0x263F66570] domainIsProhibitedForSavingCredentials:v13] & 1) == 0)
        {
          id v14 = objc_msgSend(v13, "safari_highLevelDomainFromHost");
          if (v14 && ([MEMORY[0x263F66570] highLevelDomainHasSuiteOfAssociatedApps:v14] & 1) == 0)
          {
            id v15 = [v10 appID];
            [*(id *)(*(void *)(a1 + 32) + 88) setObject:v15 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v23 + 1) + 8 * j));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 96);
  *(void *)(v21 + 96) = 0;
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2;
  v3[3] = &unk_264395670;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _populateDomainToAppIDWithCompletion:v3];

  objc_destroyWeak(&v6);
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[11] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if ([v4 length])
    {
      id v5 = [v4 componentsSeparatedByString:@"."];
      id v6 = [v5 firstObject];

      uint64_t v7 = [v6 length];
      if ([v6 length] && (unint64_t v8 = v7 + 1, v8 < objc_msgSend(v4, "length")))
      {
        uint64_t v9 = [v4 substringFromIndex:v8];
        __int16 v10 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v9];
        uint64_t v11 = [v10 appState];
        char v12 = [v11 isValid];

        if (v12)
        {
          id WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
          id v14 = iconForApplicationProxy(v10);
          +[_ASPasswordManagerIconController _preferredIconSize];
          id v15 = objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v14);

          if (v15)
          {
            [v3[2] setObject:v15 forKey:*(void *)(a1 + 32)];
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            [v3 _iconDidUpdateForDomain:*(void *)(a1 + 32)];
          }
          else
          {
            id v20 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_2();
            }
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
          }
        }
        else
        {
          uint64_t v19 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_3();
          }
        }
      }
      else
      {
        id v16 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_1();
        }
      }
    }
    else
    {
      uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v21 = 141558275;
        uint64_t v22 = 1752392040;
        __int16 v23 = 2117;
        uint64_t v24 = v18;
        _os_log_impl(&dword_21918F000, v17, OS_LOG_TYPE_DEFAULT, "App does not exist for domain; domain=%{sensitive, mask.hash}@",
          (uint8_t *)&v21,
          0x16u);
      }
    }
  }
}

void __50___ASPasswordManagerIconController_cancelRequest___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Asked to cancel icon fetching request, but couldn't find identifier for it", v1, 2u);
}

void __62___ASPasswordManagerIconController__mobileSafariContainerPath__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136380675;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21918F000, a2, OS_LOG_TYPE_ERROR, "Error executing query: %{private}s", (uint8_t *)&v2, 0xCu);
}

void __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21918F000, v0, v1, "Failed to fetch touch icon; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21918F000, v0, v1, "Application identifier for retrieving icon did not match expected format; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21918F000, v0, v1, "Failed to fetch app icon; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21918F000, v0, v1, "Application Proxy stat is invalid; domain=%{sensitive, mask.hash}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end