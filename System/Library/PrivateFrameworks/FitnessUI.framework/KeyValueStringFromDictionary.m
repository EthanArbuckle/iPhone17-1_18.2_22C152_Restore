@interface KeyValueStringFromDictionary
@end

@implementation KeyValueStringFromDictionary

uint64_t ___KeyValueStringFromDictionary_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void ___KeyValueStringFromDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSString;
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 objectForKeyedSubscript:v5];
  v6 = [v2 stringWithFormat:@"%@=%@", v5, v7];

  [v3 addObject:v6];
}

@end