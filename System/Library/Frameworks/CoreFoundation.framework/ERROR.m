@interface ERROR
@end

@implementation ERROR

void __ERROR_LOG_PREUNLOCK_ACCESS_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  v6 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 136446722;
    uint64_t v9 = v7;
    __int16 v10 = 2082;
    uint64_t v11 = a3;
    __int16 v12 = 1024;
    int v13 = a2;
    _os_log_error_impl(&dword_182B90000, v6, OS_LOG_TYPE_ERROR, "#prefsbeforeunlock Attempt to access %{public}s by %{public}s(%d)", (uint8_t *)&v8, 0x1Cu);
  }
}

void __ERROR_WRITE_REJECTED_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v37 = *(void *)off_1ECE0A5B0;
  v17 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = 136448258;
    uint64_t v20 = a5;
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
    __int16 v31 = 1026;
    int v32 = a2;
    __int16 v33 = 2082;
    uint64_t v34 = a3;
    __int16 v35 = 2082;
    uint64_t v36 = v18;
    _os_log_error_impl(&dword_182B90000, v17, OS_LOG_TYPE_ERROR, "rejecting write of key(s) %{public}s in { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because %{public}s", (uint8_t *)&v19, 0x54u);
  }
}

void __ERROR_READ_REJECTED_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v34 = *(void *)off_1ECE0A5B0;
  v16 = _CFPrefsDaemonLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 136448002;
    uint64_t v19 = a4;
    __int16 v20 = 2082;
    uint64_t v21 = a6;
    __int16 v22 = 2082;
    uint64_t v23 = a7;
    __int16 v24 = 2082;
    uint64_t v25 = a8;
    __int16 v26 = 1024;
    int v27 = a9;
    __int16 v28 = 1026;
    int v29 = a2;
    __int16 v30 = 2082;
    uint64_t v31 = a3;
    __int16 v32 = 2082;
    uint64_t v33 = v17;
    _os_log_error_impl(&dword_182B90000, v16, OS_LOG_TYPE_ERROR, "rejecting read of { %{public}s, %{public}s, %{public}s, %{public}s, managed: %d } from process %{public}d (%{public}s) because %{public}s", (uint8_t *)&v18, 0x4Au);
  }
}

@end