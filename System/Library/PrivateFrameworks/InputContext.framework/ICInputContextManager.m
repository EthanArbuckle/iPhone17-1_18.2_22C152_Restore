@interface ICInputContextManager
@end

@implementation ICInputContextManager

uint64_t __39___ICInputContextManager_sharedManager__block_invoke()
{
  sharedManager_sharedInstance = objc_alloc_init(_ICInputContextManager);
  return MEMORY[0x270F9A758]();
}

uint64_t __44___ICInputContextManager_initLexiconManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doInitLexiconManager];
}

uint64_t __47___ICInputContextManager_initPredictionManager__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doInitPredictionManager];
}

@end