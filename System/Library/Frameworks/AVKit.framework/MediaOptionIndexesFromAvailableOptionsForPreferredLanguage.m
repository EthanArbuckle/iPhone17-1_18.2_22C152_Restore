@interface MediaOptionIndexesFromAvailableOptionsForPreferredLanguage
@end

@implementation MediaOptionIndexesFromAvailableOptionsForPreferredLanguage

uint64_t ___MediaOptionIndexesFromAvailableOptionsForPreferredLanguage_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 40)];
  }

  return v4;
}

@end