@interface IndexOfCompetitionInAllCompetitions
@end

@implementation IndexOfCompetitionInAllCompetitions

uint64_t ___IndexOfCompetitionInAllCompetitions_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 UUID];
  v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

@end