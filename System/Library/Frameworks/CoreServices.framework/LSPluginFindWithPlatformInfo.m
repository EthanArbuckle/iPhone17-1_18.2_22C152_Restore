@interface LSPluginFindWithPlatformInfo
@end

@implementation LSPluginFindWithPlatformInfo

uint64_t ___LSPluginFindWithPlatformInfo_block_invoke(uint64_t result, unsigned int a2, int *a3, uint64_t a4, unsigned char *a5)
{
  if (a3[1])
  {
    uint64_t v8 = result;
    int v9 = *(_DWORD *)(result + 64);
    if ((v9 + 1) < 2 || a3[5] == v9)
    {
      result = _LSContainerGet();
      if (result)
      {
        char v12 = 0;
        int v10 = _LSContainerCheckState(*(void **)(v8 + 32), a3[1], result, &v12, 0);
        result = _LSGetNSErrorFromOSStatusImpl(v10, 0, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke", 593);
        if (result) {
          BOOL v11 = v12 == 1;
        }
        else {
          BOOL v11 = 0;
        }
        if (v11)
        {
          result = _LSAliasMatchesPath_NoIO(*(void **)(v8 + 32), *a3, *(void **)(v8 + 40), 0);
          if (result)
          {
            if (!*(unsigned char *)(v8 + 68)
              || (result = _LSPluginIsValid(*(void **)(v8 + 32), a2, (uint64_t)a3, 0, 0, 0), result))
            {
              *(_DWORD *)(*(void *)(*(void *)(v8 + 48) + 8) + 24) = a2;
              *(void *)(*(void *)(*(void *)(v8 + 56) + 8) + 24) = a3;
              *a5 = 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned char *a4)
{
  uint64_t v7 = _LSGetPlugin(*(void *)(a1 + 32), a3);
  if (!v7)
  {
    v23 = _LSDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1();
    }
    goto LABEL_32;
  }
  uint64_t v8 = (_DWORD *)v7;
  int v9 = *(_DWORD *)(a1 + 400);
  if ((v9 + 1) >= 2 && *(_DWORD *)(v7 + 20) != v9) {
    return;
  }
  char v25 = 0;
  int v10 = (unsigned int *)(v7 + 4);
  uint64_t v11 = _LSContainerGet();
  if (!v11)
  {
    v23 = _LSDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2();
    }
LABEL_32:

    return;
  }
  int v12 = _LSContainerCheckState(*(void **)(a1 + 32), *v10, v11, &v25, 0);
  if (_LSGetNSErrorFromOSStatusImpl(v12, 0, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke_2", 623)
    && v25 == 1)
  {
    int v14 = *(_DWORD *)(a1 + 404);
    if (!v14 || v14 == v8[3] || v14 == v8[43] || v14 == v8[44])
    {
      int v15 = *(_DWORD *)(a1 + 408);
      if (!v15 || v15 == v8[55])
      {
        if (!*(unsigned char *)(a1 + 412)
          || (v16 = *(void **)(a1 + 32),
              uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8),
              id obj = *(id *)(v17 + 40),
              BOOL v18 = _LSPluginCheckExtensionPoint(v16, a3, (uint64_t)v8, &obj),
              objc_storeStrong((id *)(v17 + 40), obj),
              v18))
        {
          if (!*(unsigned char *)(a1 + 413)
            || _LSPluginIsValid(*(void **)(a1 + 32), a3, (uint64_t)v8, 0, 0, 0))
          {
            unsigned int v19 = v8[42];
            int v20 = (v19 >> 2) & 1;
            int v21 = *(unsigned __int8 *)(a1 + 414);
            if (*(unsigned char *)(a1 + 414) || (v19 & 4) == 0)
            {
              uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
              if (!*(_DWORD *)(v22 + 24))
              {
                *(_DWORD *)(v22 + 24) = a3;
                *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
              }
              *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
              *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
            }
            if (v20 == v21)
            {
              *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
              *a4 = 1;
            }
          }
        }
      }
    }
  }
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_17_0(&dword_182959000, v0, v1, "LaunchServices: Failed to find pluginData for plugin %s <unitID:%d>", v2, v3);
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_7(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_17_0(&dword_182959000, v0, v1, "LaunchServices: Failed to find containerData for plugin %s <unitID:%d>", v2, v3);
}

@end