@interface SanitizedBoolCompletion
@end

@implementation SanitizedBoolCompletion

void ___SanitizedBoolCompletion_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  _SanitizedError(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v6 + 16))(v6, a2, a3, v7);
}

@end