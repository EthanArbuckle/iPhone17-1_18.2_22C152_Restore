@interface NSJSONSerialization
@end

@implementation NSJSONSerialization

uint64_t __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_jsonifyObject__dateFormatter;
  _jsonifyObject__dateFormatter = (uint64_t)v0;

  v2 = (void *)_jsonifyObject__dateFormatter;

  return [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
}

void __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 _jsonifyObject:a3];
  [v4 setObject:v7 forKey:v6];
}

void __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _jsonifyObject:a2];
  [v2 addObject:v3];
}

@end