@interface DisplaySetBrightnessFactor
@end

@implementation DisplaySetBrightnessFactor

uint64_t ___DisplaySetBrightnessFactor_block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16))
  {
    v1 = *(uint64_t (**)(uint64_t, __CFString *, void))(*(void *)(result + 32) + 16);
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 24);
    if (*(_DWORD *)(*(void *)(result + 32) + 44)) {
      return v1(v2, @"DisplayOn", *MEMORY[0x1E4F1CFD0]);
    }
    else {
      return v1(v2, @"DisplayOn", *MEMORY[0x1E4F1CFC8]);
    }
  }
  return result;
}

uint64_t ___DisplaySetBrightnessFactor_block_invoke_2(uint64_t a1)
{
  return notify_post("com.apple.iokit.hid.displayStatus");
}

uint64_t ___DisplaySetBrightnessFactor_block_invoke_748(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 16)) {
    return (*(uint64_t (**)(void, __CFString *, void))(*(void *)(result + 32) + 16))(*(void *)(*(void *)(result + 32) + 24), @"DisplayBrightnessFactorZero", *MEMORY[0x1E4F1CFD0]);
  }
  return result;
}

@end