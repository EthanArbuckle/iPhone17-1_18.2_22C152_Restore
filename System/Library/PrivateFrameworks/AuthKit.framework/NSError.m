@interface NSError
@end

@implementation NSError

void __74__NSError_AuthKit__errorDescriptionIncludingUnderlyingErrorsWithMaxDepth___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = a2;
  v5 = [v4 domain];
  uint64_t v6 = [v4 code];

  id v7 = [v3 stringWithFormat:@"%@:%ld", v5, v6];

  [*(id *)(a1 + 32) addObject:v7];
}

@end