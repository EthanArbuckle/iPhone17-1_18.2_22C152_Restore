@interface AVTMemojiRandomize
@end

@implementation AVTMemojiRandomize

uint64_t ___AVTMemojiRandomize_block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"none"];

  return v3;
}

uint64_t ___AVTMemojiRandomize_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end