@interface BKDescribeSenderSet
@end

@implementation BKDescribeSenderSet

void ___BKDescribeSenderSet_block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___BKDescribeSenderSet_block_invoke_2;
  v3[3] = &unk_1E6871038;
  id v4 = v1;
  [v4 appendCollection:v2 withName:0 itemBlock:v3];
}

id ___BKDescribeSenderSet_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0 skipIfNil:0];
}

@end