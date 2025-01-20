@interface LSExtensionPointFindWithStringID
@end

@implementation LSExtensionPointFindWithStringID

void ___LSExtensionPointFindWithStringID_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t v7 = _LSGetExtensionPointData(*(void *)(a1 + 32), a3);
  if (v7)
  {
    uint64_t v8 = v7;
    if (*(_DWORD *)(v7 + 44) == *(_DWORD *)(a1 + 56))
    {
      int v9 = *(_DWORD *)(a1 + 60);
      if (v9)
      {
        if (*(_DWORD *)(v7 + 56) != v9) {
          return;
        }
      }
      else
      {
        v10 = _LSDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          ___LSExtensionPointFindWithStringID_block_invoke_cold_1(a3, v10);
        }
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
      *a4 = 1;
    }
  }
}

void ___LSExtensionPointFindWithStringID_block_invoke_1(uint64_t a1, int a2, _DWORD *a3, uint64_t a4, unsigned char *a5)
{
  if (a3[10] == *(_DWORD *)(a1 + 48) && a3[11] == *(_DWORD *)(a1 + 52))
  {
    int v9 = *(_DWORD *)(a1 + 56);
    if (v9)
    {
      if (a3[14] != v9) {
        return;
      }
    }
    else
    {
      v10 = _LSDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        ___LSExtensionPointFindWithStringID_block_invoke_cold_1(a2, v10);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a5 = 1;
  }
}

void ___LSExtensionPointFindWithStringID_block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "No extension point parent specified, returning first extension point found id: %u", (uint8_t *)v2, 8u);
}

@end