@interface Remote
@end

@implementation Remote

uint64_t __55__Remote_Driver_Host_Delegate_delete_storage_settings___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[5] + 720);
  if (v2) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(v2 + 24))(v2, a1[7]);
  }
  else {
    uint64_t result = 560947818;
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __53__Remote_Driver_Host_Delegate_copy_storage_settings___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[6] + 720);
  if (v2) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 8))(v2, a1[8], *(void *)(a1[5] + 8) + 24);
  }
  else {
    uint64_t result = 560947818;
  }
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void __67__Remote_Driver_Host_Delegate_write_storage_settings_storage_data___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 720);
  if (v2)
  {
    mcp_applesauce::CF::PropertyListRef::from_get((mcp_applesauce::CF::PropertyListRef *)&cf, *(CFTypeRef *)(a1 + 56));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 64), *(void *)(a1 + 56));
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 560947818;
  }
}

@end