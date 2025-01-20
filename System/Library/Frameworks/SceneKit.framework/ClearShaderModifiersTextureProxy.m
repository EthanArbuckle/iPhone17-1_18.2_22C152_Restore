@interface ClearShaderModifiersTextureProxy
@end

@implementation ClearShaderModifiersTextureProxy

uint64_t *___ClearShaderModifiersTextureProxy_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t TypeID = C3DValueGetTypeID();
  result = (uint64_t *)CFGetTypeID(a3);
  if ((uint64_t *)TypeID == result)
  {
    result = (uint64_t *)C3DValueGetTypeSemantic((uint64_t)a3);
    if (result == 1)
    {
      result = (uint64_t *)C3DValueGetBytes((uint64_t)a3);
      uint64_t v6 = *result;
      if (*result)
      {
        result = (uint64_t *)C3DEffectSlotGetImageProxy(*result);
        if (result)
        {
          return (uint64_t *)C3DEffectSlotSetTextureFromImageProxy(v6, 0);
        }
      }
    }
  }
  return result;
}

@end