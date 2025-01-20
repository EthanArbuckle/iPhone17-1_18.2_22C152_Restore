@interface CNAutocompleteSearchProviderFactory
+ (id)cachingProvider;
+ (id)nonCachingProvider;
@end

@implementation CNAutocompleteSearchProviderFactory

+ (id)nonCachingProvider
{
  v2 = objc_alloc_init(_CNAutocompleteNonCachingSearchProvider);
  return v2;
}

+ (id)cachingProvider
{
  v2 = +[CNAutocompleteSearchProviderFactory nonCachingProvider];
  v3 = [[_CNAutocompleteCachingSearchProvider alloc] initWithSearchProvider:v2];

  return v3;
}

@end