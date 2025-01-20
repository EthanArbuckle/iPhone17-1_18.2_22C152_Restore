@interface DEBUG
@end

@implementation DEBUG

void __DEBUG_CACHE_MISS_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v28 = *(void *)off_1ECE0A5B0;
  v14 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 136447490;
    uint64_t v17 = a4;
    __int16 v18 = 2082;
    uint64_t v19 = a6;
    __int16 v20 = 2082;
    uint64_t v21 = a7;
    __int16 v22 = 2082;
    uint64_t v23 = a8;
    __int16 v24 = 1024;
    int v25 = a9;
    __int16 v26 = 2082;
    uint64_t v27 = v15;
    _os_log_debug_impl(&dword_182B90000, v14, OS_LOG_TYPE_DEBUG, "no cache for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, loading from %{public}s", (uint8_t *)&v16, 0x3Au);
  }
}

void __DEBUG_NOTIFY_OBSERVERS_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v24 = *(void *)off_1ECE0A5B0;
  v13 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136447234;
    uint64_t v15 = a4;
    __int16 v16 = 2082;
    uint64_t v17 = a6;
    __int16 v18 = 2082;
    uint64_t v19 = a7;
    __int16 v20 = 2082;
    uint64_t v21 = a8;
    __int16 v22 = 1024;
    int v23 = a9;
    _os_log_debug_impl(&dword_182B90000, v13, OS_LOG_TYPE_DEBUG, "Notifying observers of { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)&v14, 0x30u);
  }
}

void __DEBUG_CACHE_EVICT_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v28 = *(void *)off_1ECE0A5B0;
  int v14 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 136447490;
    uint64_t v17 = a4;
    __int16 v18 = 2082;
    uint64_t v19 = a6;
    __int16 v20 = 2082;
    uint64_t v21 = a7;
    __int16 v22 = 2082;
    uint64_t v23 = a8;
    __int16 v24 = 1024;
    int v25 = a9;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    _os_log_debug_impl(&dword_182B90000, v14, OS_LOG_TYPE_DEBUG, "flushing cache for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } because %{public}@", (uint8_t *)&v16, 0x3Au);
  }
}

void __DEBUG_BEGAN_OBSERVING_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v29 = *(void *)off_1ECE0A5B0;
  uint64_t v15 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67241730;
    v16[1] = a2;
    __int16 v17 = 2082;
    uint64_t v18 = a3;
    __int16 v19 = 2082;
    uint64_t v20 = a4;
    __int16 v21 = 2082;
    uint64_t v22 = a6;
    __int16 v23 = 2082;
    uint64_t v24 = a7;
    __int16 v25 = 2082;
    uint64_t v26 = a8;
    __int16 v27 = 1024;
    int v28 = a9;
    _os_log_debug_impl(&dword_182B90000, v15, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) began observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)v16, 0x40u);
  }
}

void __DEBUG_STOPPED_OBSERVING_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v35 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = *(void *)(a1 + 32);
  __int16 v17 = _CFPrefsDaemonLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18)
    {
      int v19 = *(_DWORD *)(a1 + 40);
      int v21 = 67241730;
      int v22 = v19;
      __int16 v23 = 2082;
      uint64_t v24 = a3;
      __int16 v25 = 2082;
      uint64_t v26 = a4;
      __int16 v27 = 2082;
      uint64_t v28 = a6;
      __int16 v29 = 2082;
      uint64_t v30 = a7;
      __int16 v31 = 2082;
      uint64_t v32 = a8;
      __int16 v33 = 1024;
      int v34 = a9;
      uint64_t v20 = "Process %{public}d (%{public}s) requested to stop observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }";
LABEL_7:
      _os_log_debug_impl(&dword_182B90000, v17, OS_LOG_TYPE_DEBUG, v20, (uint8_t *)&v21, 0x40u);
    }
  }
  else if (v18)
  {
    int v21 = 67241730;
    int v22 = a2;
    __int16 v23 = 2082;
    uint64_t v24 = a3;
    __int16 v25 = 2082;
    uint64_t v26 = a4;
    __int16 v27 = 2082;
    uint64_t v28 = a6;
    __int16 v29 = 2082;
    uint64_t v30 = a7;
    __int16 v31 = 2082;
    uint64_t v32 = a8;
    __int16 v33 = 1024;
    int v34 = a9;
    uint64_t v20 = "Process %{public}d (%{public}s) stopped observing { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }";
    goto LABEL_7;
  }
}

void __DEBUG_REQUEST_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v33 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    __int16 v19 = 2082;
    uint64_t v20 = a3;
    __int16 v21 = 2082;
    uint64_t v22 = a4;
    __int16 v23 = 2082;
    uint64_t v24 = a6;
    __int16 v25 = 2082;
    uint64_t v26 = a7;
    __int16 v27 = 2082;
    uint64_t v28 = a8;
    __int16 v29 = 1024;
    int v30 = a9;
    __int16 v31 = 2048;
    uint64_t v32 = v17;
    _os_log_debug_impl(&dword_182B90000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) sent a request related to { %{public}s, user: %{public}s, %{public}s, %{public}s, managed: %d } (%p)", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_WRITE_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v32 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17[0] = 67241986;
    v17[1] = a2;
    __int16 v18 = 2082;
    uint64_t v19 = a3;
    __int16 v20 = 2082;
    uint64_t v21 = a5;
    __int16 v22 = 2082;
    uint64_t v23 = a4;
    __int16 v24 = 2082;
    uint64_t v25 = a6;
    __int16 v26 = 2082;
    uint64_t v27 = a7;
    __int16 v28 = 2082;
    uint64_t v29 = a8;
    __int16 v30 = 1024;
    int v31 = a9;
    _os_log_debug_impl(&dword_182B90000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) wrote the key(s) %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }", (uint8_t *)v17, 0x4Au);
  }
}

void __DEBUG_READ_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v33 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    __int16 v19 = 2082;
    uint64_t v20 = a3;
    __int16 v21 = 2082;
    uint64_t v22 = a4;
    __int16 v23 = 2082;
    uint64_t v24 = a6;
    __int16 v25 = 2082;
    uint64_t v26 = a7;
    __int16 v27 = 2082;
    uint64_t v28 = a8;
    __int16 v29 = 1024;
    int v30 = a9;
    __int16 v31 = 2082;
    uint64_t v32 = v17;
    _os_log_debug_impl(&dword_182B90000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) read data for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, backed by %{public}s", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_READ_EMPTY_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v33 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18[0] = 67241986;
    v18[1] = a2;
    __int16 v19 = 2082;
    uint64_t v20 = a3;
    __int16 v21 = 2082;
    uint64_t v22 = a4;
    __int16 v23 = 2082;
    uint64_t v24 = a6;
    __int16 v25 = 2082;
    uint64_t v26 = a7;
    __int16 v27 = 2082;
    uint64_t v28 = a8;
    __int16 v29 = 1024;
    int v30 = a9;
    __int16 v31 = 2082;
    uint64_t v32 = v17;
    _os_log_debug_impl(&dword_182B90000, v16, OS_LOG_TYPE_DEBUG, "Process %{public}d (%{public}s) read nothing for { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d }, backed by %{public}s", (uint8_t *)v18, 0x4Au);
  }
}

void __DEBUG_NEEDS_TOKEN_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v34 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v17 = "write";
    }
    else {
      uint64_t v17 = "read";
    }
    int v18 = 136448002;
    __int16 v19 = v17;
    __int16 v20 = 2082;
    uint64_t v21 = a4;
    __int16 v22 = 2082;
    uint64_t v23 = a6;
    __int16 v24 = 2082;
    uint64_t v25 = a7;
    __int16 v26 = 2082;
    uint64_t v27 = a8;
    __int16 v28 = 1024;
    int v29 = a9;
    __int16 v30 = 1026;
    int v31 = a2;
    __int16 v32 = 2082;
    uint64_t v33 = a3;
    _os_log_debug_impl(&dword_182B90000, v16, OS_LOG_TYPE_DEBUG, "temporarily rejecting %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because an access token is needed", (uint8_t *)&v18, 0x4Au);
  }
}

@end