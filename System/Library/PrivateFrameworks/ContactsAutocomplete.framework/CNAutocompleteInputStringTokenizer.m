@interface CNAutocompleteInputStringTokenizer
+ (id)lazyNameStringTokenizerWithLocale:(id)a3;
+ (id)tokensFromString:(id)a3;
- (CNAutocompleteInputStringTokenizer)init;
- (CNAutocompleteInputStringTokenizer)initWithLocale:(id)a3;
- (CNFuture)nameStringTokenizer;
- (id)expandCJKNames;
- (id)tokensFromString:(id)a3;
- (void)setNameStringTokenizer:(id)a3;
@end

@implementation CNAutocompleteInputStringTokenizer

+ (id)tokensFromString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v5 tokensFromString:v4];

  return v6;
}

- (CNAutocompleteInputStringTokenizer)init
{
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [(CNAutocompleteInputStringTokenizer *)self initWithLocale:v3];

  return v4;
}

- (CNAutocompleteInputStringTokenizer)initWithLocale:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAutocompleteInputStringTokenizer;
  id v3 = a3;
  id v4 = [(CNAutocompleteInputStringTokenizer *)&v7 init];
  id v5 = objc_msgSend((id)objc_opt_class(), "lazyNameStringTokenizerWithLocale:", v3, v7.receiver, v7.super_class);

  [(CNAutocompleteInputStringTokenizer *)v4 setNameStringTokenizer:v5];
  return v4;
}

+ (id)lazyNameStringTokenizerWithLocale:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F5A408];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke;
  v8[3] = &unk_1E63DDF10;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 lazyFutureWithBlock:v8];
  [v6 addFailureBlock:&__block_literal_global_11];

  return v6;
}

id __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F5A478]) initWithLocale:*(void *)(a1 + 32)];
  return v1;
}

void __72__CNAutocompleteInputStringTokenizer_lazyNameStringTokenizerWithLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (id)tokensFromString:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@" "];
  id v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_10);

  v6 = [(CNAutocompleteInputStringTokenizer *)self expandCJKNames];
  objc_super v7 = objc_msgSend(v5, "_cn_flatMap:", v6);

  return v7;
}

- (id)expandCJKNames
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__CNAutocompleteInputStringTokenizer_expandCJKNames__block_invoke;
  aBlock[3] = &unk_1E63DDD18;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

id __52__CNAutocompleteInputStringTokenizer_expandCJKNames__block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (CNStringContainsChineseJapaneseKoreanCharacters())
  {
    id v4 = [*(id *)(a1 + 32) nameStringTokenizer];
    id v5 = [v4 result:0];

    v6 = [v5 tokenizeNameString:v3 inferredNameOrder:0];
  }
  else
  {
    v8[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  return v6;
}

- (CNFuture)nameStringTokenizer
{
  return (CNFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNameStringTokenizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end