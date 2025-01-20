@interface AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc
@end

@implementation AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc

void *__get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)libAccessibilityLibrary();
  result = dlsym(v2, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

@end