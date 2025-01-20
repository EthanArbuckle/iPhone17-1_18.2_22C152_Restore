@interface LTParagraphTranslationRequest
@end

@implementation LTParagraphTranslationRequest

void __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v7 text];
    [v5 appendString:v6];
  }
}

void __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *((void *)WeakRetained + 16);
    if (v8) {
      (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __54___LTParagraphTranslationRequest_translationParagraph__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [v3 text];
    uint64_t v7 = [v6 length];

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    id v9 = [_LTTranslationSpan alloc];
    v10 = [v3 identifier];
    v11 = -[_LTTranslationSpan initWithIdentifier:range:](v9, "initWithIdentifier:range:", v10, v8, v7);

    -[_LTTranslationSpan setShouldTranslate:](v11, "setShouldTranslate:", [v3 shouldTranslate]);
    uint64_t v12 = [v3 metaInfo];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x263F08900];
      v15 = [v3 metaInfo];
      LODWORD(v14) = [v14 isValidJSONObject:v15];

      if (v14)
      {
        v16 = (void *)MEMORY[0x263F08900];
        v17 = [v3 metaInfo];
        uint64_t v22 = 0;
        v18 = [v16 dataWithJSONObject:v17 options:0 error:&v22];
        uint64_t v19 = v22;

        if (!v19) {
          [(_LTTranslationSpan *)v11 setMetaInfoData:v18];
        }
      }
    }
    [*(id *)(a1 + 32) addObject:v11];
    v20 = *(void **)(a1 + 40);
    v21 = [v3 text];
    [v20 appendString:v21];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v7;
  }
}

@end