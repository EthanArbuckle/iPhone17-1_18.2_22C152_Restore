@interface CNAutocompleteCachingSearchProvider
@end

@implementation CNAutocompleteCachingSearchProvider

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) localSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recentsSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) stewieSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) suggestionsSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) predictionSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) localExtensionSearches];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) directoryServerSearch];
}

uint64_t __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) calendarServerSearch];
}

@end