@interface CNLoadFirstAssociatedTrack
@end

@implementation CNLoadFirstAssociatedTrack

void ___CNLoadFirstAssociatedTrack_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = _CNLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      ___CNLoadFirstAssociatedTrack_block_invoke_cold_2((uint64_t)v6, a1, v7);
    }

    uint64_t v8 = 2;
    v9 = v6;
  }
  else
  {
    if ([v5 count])
    {
      uint64_t v12 = *(void *)(a1 + 48);
      v10 = [v5 firstObject];
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
    v13 = _CNLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      ___CNLoadFirstAssociatedTrack_block_invoke_cold_1(a1, v13);
    }

    uint64_t v8 = 3;
    v9 = 0;
  }
  v10 = _CNCinematicError(v8, v9);
  v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
  v11();
}

void ___CNLoadFirstAssociatedTrack_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_243267000, a2, OS_LOG_TYPE_DEBUG, "Error: no tracks associated (type %@) with track %@", (uint8_t *)&v4, 0x16u);
}

void ___CNLoadFirstAssociatedTrack_block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_243267000, log, OS_LOG_TYPE_DEBUG, "Error: (%@) loading tracks associated (type %@) with track %@", (uint8_t *)&v5, 0x20u);
}

@end