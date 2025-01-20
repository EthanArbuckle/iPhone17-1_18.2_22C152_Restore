@interface WFCorrectSpellingIntentHandler
- (void)handleCorrectSpelling:(id)a3 completion:(id)a4;
- (void)resolveTextForCorrectSpelling:(id)a3 withCompletion:(id)a4;
@end

@implementation WFCorrectSpellingIntentHandler

- (void)handleCorrectSpelling:(id)a3 completion:(id)a4
{
  v5 = (Class (__cdecl *)())getUITextCheckerClass;
  v6 = (void (**)(id, WFCorrectSpellingIntentResponse *))a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5());
  v9 = [(Class)getUITextCheckerClass() availableLanguages];
  uint64_t v10 = [v9 firstObject];
  v11 = (void *)v10;
  v12 = @"en";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  v14 = [v7 text];

  v15 = [[WFCorrectSpellingIntentResponse alloc] initWithCode:4 userActivity:0];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __67__WFCorrectSpellingIntentHandler_handleCorrectSpelling_completion___block_invoke;
  v22 = &unk_264E55AE0;
  id v23 = v8;
  v24 = v13;
  v16 = v13;
  id v17 = v8;
  v18 = objc_msgSend(v14, "if_map:", &v19);
  -[WFCorrectSpellingIntentResponse setText:](v15, "setText:", v18, v19, v20, v21, v22);

  v6[2](v6, v15);
}

id __67__WFCorrectSpellingIntentHandler_handleCorrectSpelling_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  if ([v3 length])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v3, 0, objc_msgSend(v3, "length"), v4, 0, *(void *)(a1 + 40));
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      v9 = objc_msgSend(*(id *)(a1 + 32), "guessesForWordRange:inString:language:", v5, v6, v3, *(void *)(a1 + 40));
      if ([v9 count])
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v7, v8, v10);
        uint64_t v8 = [v10 length];
      }
      unint64_t v4 = v8 + v7;
    }
    while (v4 < [v3 length]);
  }
  v11 = (void *)[v3 copy];

  return v11;
}

- (void)resolveTextForCorrectSpelling:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 text];
  uint64_t v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_131);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

uint64_t __79__WFCorrectSpellingIntentHandler_resolveTextForCorrectSpelling_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F10020] successWithResolvedString:a2];
}

@end