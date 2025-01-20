@interface Apple80211ServiceTerminatedCallback
@end

@implementation Apple80211ServiceTerminatedCallback

void ___Apple80211ServiceTerminatedCallback_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1816);
    int v3 = *(_DWORD *)(a1 + 40);
    int v4 = *(_DWORD *)(a1 + 44);
    int v10 = 136315906;
    v11 = "_Apple80211ServiceTerminatedCallback_block_invoke";
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v2;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl(&dword_210714000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: [%u] ioucQueue[%p], service:%u, serializing, halting ...\n", (uint8_t *)&v10, 0x22u);
  }
  _Apple80211IOUCHalt(*(void *)(a1 + 32));
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(void, uint64_t, void, void, void))(v5 + 1936);
  if (v6) {
    v6(0, v5, 0, 0, *(void *)(v5 + 1944));
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 1816);
    int v8 = *(_DWORD *)(a1 + 40);
    int v9 = *(_DWORD *)(a1 + 44);
    int v10 = 136315906;
    v11 = "_Apple80211ServiceTerminatedCallback_block_invoke";
    __int16 v12 = 1024;
    int v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = v9;
    _os_log_impl(&dword_210714000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: [%u] ioucQueue[%p], service:%u, serializing, ... halted\n", (uint8_t *)&v10, 0x22u);
  }
}

@end