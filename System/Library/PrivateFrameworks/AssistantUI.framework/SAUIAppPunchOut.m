@interface SAUIAppPunchOut
@end

@implementation SAUIAppPunchOut

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F27B40];
  v3 = [MEMORY[0x263F27CC0] bagKeySet];
  v4 = [MEMORY[0x263F27CC0] bagSubProfile];
  v5 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  [v2 registerBagKeySet:v3 forProfile:v4 profileVersion:v5];

  v6 = (void *)MEMORY[0x263F27B28];
  v7 = [MEMORY[0x263F27CC0] bagSubProfile];
  v8 = [MEMORY[0x263F27CC0] bagSubProfileVersion];
  v9 = [v6 bagForProfile:v7 profileVersion:v8];

  id v10 = objc_alloc(MEMORY[0x263F27CC0]);
  v11 = (void *)[v10 initWithBag:v9 caller:*(void *)(a1 + 32) keyProfile:*MEMORY[0x263F27930]];
  v18[0] = *(void *)(a1 + 32);
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v13 = [v11 performLookupWithBundleIdentifiers:v12 itemIdentifiers:0];

  objc_initWeak(&location, *(id *)(a1 + 40));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2;
  v14[3] = &unk_2646928A0;
  objc_copyWeak(&v16, &location);
  id v15 = *(id *)(a1 + 48);
  [v13 addFinishBlock:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = [v5 allItems];
    v9 = [v8 firstObject];

    if (v6)
    {
      id v10 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_3((uint64_t)v6, v10);
      }
    }
    else
    {
      if (v9)
      {
        v14 = [WeakRetained appDisplayName];

        if (!v14)
        {
          id v15 = [v9 displayName];
          [WeakRetained setAppDisplayName:v15];
        }
        id v16 = [WeakRetained appStoreUri];

        if (!v16)
        {
          v17 = [v9 productPageURL];
          [WeakRetained setAppStoreUri:v17];
        }
        v18 = [WeakRetained dictionary];
        [v18 setObject:v9 forKey:@"AFUIStoreServicesData"];

        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_68;
        block[3] = &unk_264691AC8;
        id v21 = *(id *)(a1 + 32);
        dispatch_async(MEMORY[0x263EF83A0], block);

        goto LABEL_17;
      }
      v19 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_2(v19);
      }
    }
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
LABEL_17:

    goto LABEL_18;
  }
  v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_1(v12);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
  }
LABEL_18:
}

uint64_t __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_68(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __82__SAUIAppPunchOut_AssistantUIAdditions__afui_getInstallAppPunchoutWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_afui_installAppPunchout");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    v3 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0);
  }
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SAUIAppPunchOut(AssistantUIAdditions) afui_populateStoreServicesData:]_block_invoke_2";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s Discarding AMS Lookup Result due to block deallocation.", (uint8_t *)&v1, 0xCu);
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[SAUIAppPunchOut(AssistantUIAdditions) afui_populateStoreServicesData:]_block_invoke";
  _os_log_error_impl(&dword_223099000, log, OS_LOG_TYPE_ERROR, "%s Error performing AMS Lookup - item not found", (uint8_t *)&v1, 0xCu);
}

void __72__SAUIAppPunchOut_AssistantUIAdditions__afui_populateStoreServicesData___block_invoke_2_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SAUIAppPunchOut(AssistantUIAdditions) afui_populateStoreServicesData:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_223099000, a2, OS_LOG_TYPE_ERROR, "%s Error performing AMS Lookup: %@", (uint8_t *)&v2, 0x16u);
}

@end