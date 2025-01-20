@interface NSString
@end

@implementation NSString

void __54__NSString_DC__dc_whitespaceAndNewlineCoalescedString__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[\r\n\\s]+" options:0 error:0];
  v1 = (void *)dc_whitespaceAndNewlineCoalescedString_regex;
  dc_whitespaceAndNewlineCoalescedString_regex = v0;
}

void __58__NSString_DC__dc_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v12 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v12;
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = (void *)MEMORY[0x263F08D40];
  uint64_t v9 = [v3 range];
  v11 = objc_msgSend(v8, "valueWithRange:", v9, v10);
  [v4 addObject:v11];
}

unint64_t __38__NSString_DC__dc_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 length];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

@end