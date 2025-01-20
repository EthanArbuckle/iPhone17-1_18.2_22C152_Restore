@interface NSString
@end

@implementation NSString

void __58__NSString_TranslationAdditions__lt_wordRangesWithLocale___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

@end