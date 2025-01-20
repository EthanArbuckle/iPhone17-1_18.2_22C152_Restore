@interface LookupThemeProvider
@end

@implementation LookupThemeProvider

void *___LookupThemeProvider_block_invoke(uint64_t a1, NSMapTable *table)
{
  result = NSMapGet(table, *(const void **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end