@interface CNAutocompleteTokenMatcher
+ (BOOL)doSearchTokens:(id)a3 matchNameTokens:(id)a4;
+ (id)indexesOfNameTokens:(id)a3 matchingSearchToken:(id)a4;
+ (id)tokensForNameString:(id)a3;
@end

@implementation CNAutocompleteTokenMatcher

+ (BOOL)doSearchTokens:(id)a3 matchNameTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  if (v8 <= [v7 count])
  {
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      char v9 = 1;
    }
    else
    {
      v10 = [v6 firstObject];
      v11 = [a1 indexesOfNameTokens:v7 matchingSearchToken:v10];
      if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A278] + 16))())
      {
        char v9 = 0;
      }
      else
      {
        v12 = objc_msgSend(v6, "_cn_tail");
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__CNAutocompleteTokenMatcher_doSearchTokens_matchNameTokens___block_invoke;
        v15[3] = &unk_1E63DDBD8;
        id v17 = v12;
        id v18 = a1;
        id v16 = v7;
        id v13 = v12;
        char v9 = objc_msgSend(v11, "_cn_any:", v15);
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

uint64_t __61__CNAutocompleteTokenMatcher_doSearchTokens_matchNameTokens___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)[*(id *)(a1 + 32) mutableCopy];
  [v4 removeObjectAtIndex:a2];
  uint64_t v5 = [*(id *)(a1 + 48) doSearchTokens:*(void *)(a1 + 40) matchNameTokens:v4];

  return v5;
}

+ (id)indexesOfNameTokens:(id)a3 matchingSearchToken:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CNAutocompleteTokenMatcher_indexesOfNameTokens_matchingSearchToken___block_invoke;
  v9[3] = &unk_1E63DDC00;
  id v10 = v5;
  id v6 = v5;
  id v7 = [a3 indexesOfObjectsPassingTest:v9];

  return v7;
}

uint64_t __70__CNAutocompleteTokenMatcher_indexesOfNameTokens_matchingSearchToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_hasPrefix:", *(void *)(a1 + 32));
}

+ (id)tokensForNameString:(id)a3
{
  id v3 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if (tokensForNameString__cn_once_token_0 != -1) {
      dispatch_once(&tokensForNameString__cn_once_token_0, &__block_literal_global_7);
    }
    v4 = [(id)tokensForNameString__cn_once_object_0 tokenizeNameString:v3 inferredNameOrder:0];
  }

  return v4;
}

void __50__CNAutocompleteTokenMatcher_tokensForNameString___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F5A478]);
  id v3 = +[CNAutocompleteResult localeForHashing];
  uint64_t v1 = [v0 initWithLocale:v3];
  v2 = (void *)tokensForNameString__cn_once_object_0;
  tokensForNameString__cn_once_object_0 = v1;
}

@end