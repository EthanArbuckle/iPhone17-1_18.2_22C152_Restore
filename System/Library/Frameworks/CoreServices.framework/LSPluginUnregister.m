@interface LSPluginUnregister
@end

@implementation LSPluginUnregister

uint64_t ___LSPluginUnregister_block_invoke(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  if (*(_DWORD *)(result + 40) == a3)
  {
    _CSArrayRemoveValueAtIndex();
    result = _CSArrayGetCount();
    if (!result)
    {
      _CSArrayDispose();
      result = _CSStoreWriteToUnit();
    }
    *a4 = 1;
  }
  return result;
}

void ___LSPluginUnregister_block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18530F680]();
  softLink_ISInvalidateCacheEntriesForBundleIdentifier(*(NSString **)(a1 + 32));
  v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

@end