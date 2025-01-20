@interface DetectedFaceAngleInfoRollSymbolLoc
@end

@implementation DetectedFaceAngleInfoRollSymbolLoc

void *__getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_DetectedFaceAngleInfoRoll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end