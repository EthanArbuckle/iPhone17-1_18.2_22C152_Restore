@interface UpdateSha1WithDisambiguationList
@end

@implementation UpdateSha1WithDisambiguationList

uint64_t ___UpdateSha1WithDisambiguationList_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 title];
  uint64_t v6 = [v4 title];

  if (v5 | v6) {
    uint64_t v7 = [(id)v5 compare:v6];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

@end