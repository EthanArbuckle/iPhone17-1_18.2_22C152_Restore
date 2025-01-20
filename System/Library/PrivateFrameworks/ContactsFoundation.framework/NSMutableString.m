@interface NSMutableString
@end

@implementation NSMutableString

void __59__NSMutableString_CNOrderedDictionary___cn_replaceStrings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeValue];
  uint64_t v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [*(id *)(a1 + 40) objectForKey:v7];
  objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", v3, v5, v6);
}

@end