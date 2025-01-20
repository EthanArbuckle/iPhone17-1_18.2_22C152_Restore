@interface SFCard
@end

@implementation SFCard

uint64_t __49__SFCard_CRCard___interactionsByIntentDataHashes__block_invoke()
{
  _interactionsByIntentDataHashes_interactionsByIntentDataHashes = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __41__SFCard_CRCard__loadCardWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end