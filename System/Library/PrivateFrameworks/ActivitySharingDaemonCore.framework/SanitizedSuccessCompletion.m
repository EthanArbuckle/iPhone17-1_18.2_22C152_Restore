@interface SanitizedSuccessCompletion
@end

@implementation SanitizedSuccessCompletion

void ___SanitizedSuccessCompletion_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  _SanitizedError(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

@end