@interface LSInstallNotificationJournaller
@end

@implementation LSInstallNotificationJournaller

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v16 = 0;
  if (*(void *)(a1 + 32))
  {
    int v7 = _LSContextInit(&v16);
    if (v7)
    {
      v8 = _LSInstallLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2(v7, v8);
      }
    }
    else
    {
      int v15 = 0;
      uint64_t v14 = 0;
      int v10 = *(unsigned __int8 *)(a1 + 48) << 10;
      v11 = *(void **)(a1 + 32);
      *(_OWORD *)buf = kLSVersionNumberNull;
      long long v18 = *(_OWORD *)algn_182AF9270;
      if (!_LSBundleFindWithInfo((uint64_t)&v16, 0, v11, 0, buf, 2, v10, &v15, &v14))
      {
        v12 = _LSInstallLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_INFO, "Found registered application for journal entry: %@", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  else
  {
    v9 = _LSInstallLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1(v9);
    }
  }
}

uint64_t __71___LSInstallNotificationJournaller_removeJournalAfterNotificationFence__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeJournalFile];
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Attempting to lookup application with nil bundle identifier", v1, 2u);
}

void __84___LSInstallNotificationJournaller_isApplicationRegisteredWithbundleID_placeholder___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_182959000, a2, OS_LOG_TYPE_FAULT, "couldn't connect to database: %d", (uint8_t *)v2, 8u);
}

@end