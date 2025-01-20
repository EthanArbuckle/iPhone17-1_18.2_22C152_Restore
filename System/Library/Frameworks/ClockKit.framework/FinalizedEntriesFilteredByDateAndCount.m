@interface FinalizedEntriesFilteredByDateAndCount
@end

@implementation FinalizedEntriesFilteredByDateAndCount

BOOL ___FinalizedEntriesFilteredByDateAndCount_block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [a2 date];
  BOOL v5 = [v4 compare:*(void *)(a1 + 32)] == v3;

  return v5;
}

void ___FinalizedEntriesFilteredByDateAndCount_block_invoke_220(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) finalizedCopy];
  [v1 addObject:v2];
}

@end