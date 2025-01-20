@interface DisplaySetLogicalBrightnessInternal
@end

@implementation DisplaySetLogicalBrightnessInternal

void ____DisplaySetLogicalBrightnessInternal_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (*(unsigned char *)(a1 + 48)) {
      (*(void (**)(void, __CFString *, void))(*(void *)(a1 + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 24), @"BacklightPowerNits", *(void *)(a1 + 40));
    }
    else {
      (*(void (**)(void, __CFString *, void))(*(void *)(a1 + 32) + 16))(*(void *)(*(void *)(a1 + 32) + 24), @"BacklightPowerMilliWatts", *(void *)(a1 + 40));
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

@end