@interface CopyHIDInputMode
@end

@implementation CopyHIDInputMode

uint64_t __carEndpoint_CopyHIDInputMode_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 272);
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = APHIDClientCopyInputModeForUUID(result, *(void *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
    uint64_t result = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    if (result)
    {
      return APSLogErrorAt();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -16726;
  }
  return result;
}

@end