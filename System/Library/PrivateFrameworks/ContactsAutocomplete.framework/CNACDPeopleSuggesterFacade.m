@interface CNACDPeopleSuggesterFacade
@end

@implementation CNACDPeopleSuggesterFacade

void __71___CNACDPeopleSuggesterFacade_suggestPeopleWithContext_settings_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 suggestPeopleWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

@end