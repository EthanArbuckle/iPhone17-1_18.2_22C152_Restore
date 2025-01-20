@interface GetMCRPForTargetSessionID
@end

@implementation GetMCRPForTargetSessionID

uint64_t __airplayReqProcessor_GetMCRPForTargetSessionID_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CString = (const char *)CFObjectGetCString();
  uint64_t result = CFObjectGetInt64();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(void *)(v7 + 24))
    {
      uint64_t result = strcmp(CString, "control");
      if (!result)
      {
        int v8 = *(_DWORD *)(a1 + 48);
        if (!v8 || v8 == *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
          *(void *)(v7 + 24) = a3;
        }
      }
    }
  }
  return result;
}

@end