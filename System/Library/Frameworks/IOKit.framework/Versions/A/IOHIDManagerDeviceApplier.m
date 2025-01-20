@interface IOHIDManagerDeviceApplier
@end

@implementation IOHIDManagerDeviceApplier

uint64_t ____IOHIDManagerDeviceApplier_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  --*(_DWORD *)(v1 + 112);
  LOBYTE(v1) = atomic_load((unsigned int *)(v1 + 116));
  if ((v1 & 2) != 0)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 32);
    if (!*(_DWORD *)(v3 + 112))
    {
      result = *(void *)(v3 + 104);
      if (result)
      {
        (*(void (**)(void))(result + 16))();
        _Block_release(*(const void **)(*(void *)(v2 + 32) + 104));
        v4 = *(void **)(v2 + 32);
        v4[13] = 0;
        return _IOHIDObjectInternalRelease(v4);
      }
    }
  }
  return result;
}

@end