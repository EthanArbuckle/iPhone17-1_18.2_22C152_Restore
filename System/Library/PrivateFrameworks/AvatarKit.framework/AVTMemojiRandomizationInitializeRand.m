@interface AVTMemojiRandomizationInitializeRand
@end

@implementation AVTMemojiRandomizationInitializeRand

void ___AVTMemojiRandomizationInitializeRand_block_invoke()
{
  time_t v0 = time(0);
  srand48(v0);
}

@end