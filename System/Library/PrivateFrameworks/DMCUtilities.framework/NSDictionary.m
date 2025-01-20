@interface NSDictionary
@end

@implementation NSDictionary

void __53__NSDictionary_DMCUtilities__DMCShortenedDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a2;
  id v9 = [v6 DMCShortenedObject:a3];
  v8 = [*(id *)(a1 + 40) DMCShortenedObject:v7];

  [v5 setObject:v9 forKey:v8];
}

@end