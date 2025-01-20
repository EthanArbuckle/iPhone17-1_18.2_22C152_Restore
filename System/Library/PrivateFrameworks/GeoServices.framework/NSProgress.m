@interface NSProgress
@end

@implementation NSProgress

BOOL __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __42__NSProgress_GEOExtras___geo_setUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) userInfo];
  v5 = [v4 objectForKeyedSubscript:v3];
  if (v5)
  {
    v6 = [*(id *)(a1 + 32) userInfo];
    v7 = [v6 objectForKeyedSubscript:v3];
    v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
    uint64_t v9 = [v7 isEqual:v8] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

@end