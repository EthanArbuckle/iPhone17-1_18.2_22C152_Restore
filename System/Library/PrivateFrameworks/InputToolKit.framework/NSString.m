@interface NSString
@end

@implementation NSString

uint64_t __56__NSString_ITK__itk_whitespaceAndNewlineCoalescedString__block_invoke()
{
  itk_whitespaceAndNewlineCoalescedString_regex = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"[\r\n\\s]+" options:0 error:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __30__NSString_ITK__itk_wordCount__block_invoke(uint64_t result)
{
  return result;
}

void __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  if ([v9 isEqualToString:*MEMORY[0x263F082F8]]
    && (unint64_t)[v9 length] >= *(void *)(a1 + 48))
  {
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", a3, a4);
    [v7 addObject:v8];
  }
}

uint64_t __46__NSString_ITK__itk_uniqueWordsWithMinLength___block_invoke_95(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v3 appendString:@" "];
}

void __60__NSString_ITK__itk_stringByReplacingCharactersInStringMap___block_invoke(uint64_t a1, void *a2)
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

unint64_t __40__NSString_ITK__itk_lengthOfLongestLine__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 length];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  return result;
}

@end