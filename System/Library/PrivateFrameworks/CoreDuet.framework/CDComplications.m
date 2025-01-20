@interface CDComplications
@end

@implementation CDComplications

void __38___CDComplications_sharedComplication__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initForComplications];
  v2 = (void *)sharedInstance;
  sharedInstance = v1;

  if (!sharedInstance)
  {
    v3 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38___CDComplications_sharedComplication__block_invoke_cold_1(v3);
    }
  }
}

uint64_t __40___CDComplications_initForComplications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readOutActiveComplications];
}

uint64_t __40___CDComplications_initForComplications__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) readOutActiveComplications];
}

uint64_t __40___CDComplications_initForComplications__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) readOutActiveComplications];
}

void __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) activeComplications];
  v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  v4 = v3;
  if (!v3 || [v3 unsignedIntegerValue] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = +[_CDLogging admissionCheckChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v2;
      _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "%@ is not in %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke_17;
    v20[3] = &unk_1E560D578;
    v20[4] = v7;
    v9 = v20;
    v10 = v8;
    v11 = (void *)os_transaction_create();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __cd_dispatch_async_capture_tx_block_invoke_2;
    v22 = &unk_1E560D978;
    id v23 = v11;
    id v24 = v9;
    id v12 = v11;
    dispatch_async(v10, buf);

    goto LABEL_6;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) watchIsCharging])
  {
LABEL_15:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_6;
  }
  int v13 = [*(id *)(a1 + 32) remainingPushesOnComplication:*(void *)(a1 + 40) andReduceBy:&unk_1EDE1D9D0];
  v14 = +[_CDLogging admissionCheckChannel];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v13;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v15;
    _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "Found %d complication pushes remaining for %@ today\n", buf, 0x12u);
  }

  v16 = +[_CDLogging admissionCheckChannel];
  v17 = v16;
  if (v13 >= 1)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_DEFAULT, "Approved guaranteed complication push for %@\n", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v19;
    _os_log_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_INFO, "No more complication pushes for %@ for today, denying\n", buf, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_6:
}

uint64_t __65___CDComplications_admissionCheckOnComplication_forRemote_error___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) readOutActiveComplications];
}

void __47___CDComplications_isBundleActiveComplication___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeComplications];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3 != 0;
}

void __38___CDComplications_sharedComplication__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "error: unable to obtain a valid shared complication object\n", v1, 2u);
}

@end