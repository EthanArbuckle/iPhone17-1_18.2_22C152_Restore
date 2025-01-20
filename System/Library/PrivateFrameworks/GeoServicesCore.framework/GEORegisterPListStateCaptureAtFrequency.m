@interface GEORegisterPListStateCaptureAtFrequency
@end

@implementation GEORegisterPListStateCaptureAtFrequency

uint64_t ___GEORegisterPListStateCaptureAtFrequency_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x1E01C0E70]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained _capturePlistState:a2];

  return v6;
}

@end