@interface IDSService
@end

@implementation IDSService

void __44__IDSService_MSPExtras___msp_currentAccount__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  v9 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    v11 = [v8 loginID];
    v12 = objc_msgSend(v8, "_msp_validityDescription");
    int v15 = 134218755;
    uint64_t v16 = a3 + 1;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    __int16 v19 = 2113;
    v20 = v11;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_INFO, "Checking account %lu/%lu: %{private}@ (%{public}@)...", (uint8_t *)&v15, 0x2Au);
  }
  if ([v8 accountType] == 1
    && [v8 isActive]
    && [v8 canSend])
  {
    v13 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 134217984;
      uint64_t v16 = a3 + 1;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "- account %lu is eligible for trip sharing", (uint8_t *)&v15, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    v14 = MSPGetSharedTripLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B87E5000, v14, OS_LOG_TYPE_DEBUG, "- account is NOT eligible for trip sharing", (uint8_t *)&v15, 2u);
    }
  }
}

@end