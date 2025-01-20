@interface NSString
@end

@implementation NSString

id __71__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v4 range];
  v7 = objc_msgSend(v3, "substringWithRange:", v5, v6);
  uint64_t v8 = [v4 range];
  uint64_t v10 = v9;

  v11 = (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v2 + 16))(v2, v7, v8, v10);

  return v11;
}

void __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v11 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v10, a2 - v10);
  [v6 appendString:v11];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 + a3;
}

void __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_3(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    id v4 = a2;
    uint64_t v5 = [v4 range];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, v5, v6);
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
    (*(void (**)(void))(v7 + 16))();
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    [v8 appendString:v9];
  }
}

uint64_t __81__NSString_Regex__calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult___block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes;
  calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__regexes = v0;

  calc_stringByReplacingOccurrencesOfRegex_usingBlockWithResult__lock = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end