@interface ComputeCustomSlotsUsage
@end

@implementation ComputeCustomSlotsUsage

void ____ComputeCustomSlotsUsage_block_invoke(uint64_t a1, const void *a2, CFTypeRef cf)
{
  uint64_t v3 = (uint64_t)cf;
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == C3DValueGetTypeID())
  {
    if (C3DValueGetTypeSemantic(v3) != 1) {
      return;
    }
    uint64_t v3 = *(void *)C3DValueGetBytes(v3);
  }
  else if (v6 != C3DEffectSlotGetTypeID())
  {
    return;
  }
  if (v3)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(unsigned __int8 *)(v7 + 162);
    if (v8 == 8)
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ____ComputeCustomSlotsUsage_block_invoke_cold_1(v9);
      }
    }
    else
    {
      *(void *)(v7 + 8 * v8 + 216) = a2;
      CFRetain(a2);
      uint64_t UVSet = C3DEffectSlotGetUVSet(v3);
      if (UVSet == -1) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = UVSet;
      }
      BOOL HasInterpolationModesPerKey = C3DKeyframeControllerHasInterpolationModesPerKey(v3);
      *(unsigned char *)(*(void *)(a1 + 32) + v8 + 203) = __UpdateHashCodeUVSetForEffectProperty(*(void *)(a1 + 32), v11, HasInterpolationModesPerKey, v8 + 27);
      ++*(unsigned char *)(*(void *)(a1 + 32) + 162);
    }
  }
}

void ____ComputeCustomSlotsUsage_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 8;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Too many uniform custom samplers given (Max is %d)", (uint8_t *)v1, 8u);
}

@end