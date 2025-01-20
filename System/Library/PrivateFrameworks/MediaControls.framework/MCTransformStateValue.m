@interface MCTransformStateValue
@end

@implementation MCTransformStateValue

void ___MCTransformStateValue_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  _MCTransformStateValue(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

@end