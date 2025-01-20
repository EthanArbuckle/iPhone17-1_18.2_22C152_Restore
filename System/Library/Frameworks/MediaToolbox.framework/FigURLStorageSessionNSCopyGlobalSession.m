@interface FigURLStorageSessionNSCopyGlobalSession
@end

@implementation FigURLStorageSessionNSCopyGlobalSession

void ___FigURLStorageSessionNSCopyGlobalSession_block_invoke()
{
  v0 = (void *)MEMORY[0x199711A30]();
  v1 = (void *)[MEMORY[0x1E4F18DD0] defaultSessionConfiguration];
  objc_msgSend(v1, "set_timingDataOptions:", -1);
  uint64_t v2 = figURLStorageSessionNSCommonCreate(*MEMORY[0x1E4F1CF80], v1, 0, 0);
  if (v2) {
    sGlobalFigURLStorageSessionNS = v2;
  }
  else {
    FigSignalErrorAt();
  }
}

@end