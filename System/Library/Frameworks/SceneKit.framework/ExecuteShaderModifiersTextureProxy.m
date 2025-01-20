@interface ExecuteShaderModifiersTextureProxy
@end

@implementation ExecuteShaderModifiersTextureProxy

CFTypeID ___ExecuteShaderModifiersTextureProxy_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t TypeID = C3DEffectSlotGetTypeID();
  CFTypeID result = CFGetTypeID(a3);
  if (a3)
  {
    if (TypeID == result)
    {
      CFTypeID result = C3DRendererContextExecuteSlotTextureProxy(*(void *)(*(void *)(a1 + 32) + 16), *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 32), (uint64_t)a3);
      *(unsigned char *)(*(void *)(a1 + 32) + 388) |= result;
    }
  }
  return result;
}

@end