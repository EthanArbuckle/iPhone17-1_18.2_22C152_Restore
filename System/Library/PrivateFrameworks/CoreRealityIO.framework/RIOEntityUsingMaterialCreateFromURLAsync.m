@interface RIOEntityUsingMaterialCreateFromURLAsync
@end

@implementation RIOEntityUsingMaterialCreateFromURLAsync

const void **__RIOEntityUsingMaterialCreateFromURLAsync_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(const void ***)(*(void *)(a1 + 40) + 32);
  if (v2)
  {
    v3 = *v2;
    v5 = v3;
    if (v3) {
      CFRetain(v3);
    }
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  (*(void (**)(uint64_t, void, const void *))(v1 + 16))(v1, 0, v3);
  return realityio::WrappedCFRef<__CFError *>::~WrappedCFRef(&v5);
}

@end