@interface DASCTSMagneticInterferenceSensitivityKeySymbolLoc
@end

@implementation DASCTSMagneticInterferenceSensitivityKeySymbolLoc

void *__get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)DuetActivitySchedulerLibrary();
  result = dlsym(v2, "_DASCTSMagneticInterferenceSensitivityKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DASCTSMagneticInterferenceSensitivityKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end