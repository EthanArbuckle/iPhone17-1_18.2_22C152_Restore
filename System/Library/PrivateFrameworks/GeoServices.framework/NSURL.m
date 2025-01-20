@interface NSURL
@end

@implementation NSURL

uint64_t __58__NSURL_GEOExtras___geo_URLWithString_tokenSubstitutions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [v7 rangeValue];

  v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v10 = [v9 rangeValue];
  v11 = [NSNumber numberWithUnsignedInteger:v8];
  v12 = [NSNumber numberWithUnsignedInteger:v10];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

@end