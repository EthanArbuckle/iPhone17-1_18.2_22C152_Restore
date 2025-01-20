@interface WFTranslateTextAction
- (id)disabledOnPlatforms;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)translateText:(id)a3 fromLocale:(id)a4 toLocale:(id)a5 translator:(id)a6 completionBlock:(id)a7;
@end

@implementation WFTranslateTextAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ to translate?");
  v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (void)translateText:(id)a3 fromLocale:(id)a4 toLocale:(id)a5 translator:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  if ([v13 isEqual:v14])
  {
    v17 = [(WFTranslateTextAction *)self output];
    [v17 addObject:v12];

    v16[2](v16, 0);
  }
  else
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v18 = (void *)get_LTTextTranslationRequestClass_softClass;
    uint64_t v28 = get_LTTextTranslationRequestClass_softClass;
    if (!get_LTTextTranslationRequestClass_softClass)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __get_LTTextTranslationRequestClass_block_invoke;
      v24[3] = &unk_264E5EC88;
      v24[4] = &v25;
      __get_LTTextTranslationRequestClass_block_invoke((uint64_t)v24);
      v18 = (void *)v26[3];
    }
    v19 = v18;
    _Block_object_dispose(&v25, 8);
    v20 = (void *)[[v19 alloc] initWithSourceLocale:v13 targetLocale:v14];
    v21 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v12];
    [v20 setText:v21];

    [v20 setTaskHint:5];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __86__WFTranslateTextAction_translateText_fromLocale_toLocale_translator_completionBlock___block_invoke;
    v22[3] = &unk_264E57120;
    v22[4] = self;
    v23 = v16;
    [v20 setTextTranslationHandler:v22];
    [v15 translate:v20];
  }
}

void __86__WFTranslateTextAction_translateText_fromLocale_toLocale_translator_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v18 length];
  if (!v7 && !v9)
  {
    v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  if (v18)
  {
    v11 = [*(id *)(a1 + 32) output];
    id v12 = [v18 string];
    [v11 addObject:v12];
  }
  else
  {
    if (!v7) {
      goto LABEL_10;
    }
    id v13 = [v7 translations];
    id v14 = [v13 firstObject];
    id v15 = [v14 formattedString];

    if (!v15) {
      goto LABEL_10;
    }
    v11 = [*(id *)(a1 + 32) output];
    id v12 = [v7 translations];
    v16 = [v12 firstObject];
    v17 = [v16 formattedString];
    [v11 addObject:v17];
  }
LABEL_10:
  v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_11:
  v10();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DB20;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 getStringRepresentations:v6];
}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSelectedFromLanguage" ofClass:objc_opt_class()];
    id v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFSelectedLanguage" ofClass:objc_opt_class()];
    if ([v7 isEqualToString:v8])
    {
      [*(id *)(a1 + 32) setOutput:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
    else
    {
      id v9 = objc_alloc_init((Class)get_LTTranslatorClass());
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x3032000000;
      v23[3] = __Block_byref_object_copy__11224;
      v23[4] = __Block_byref_object_dispose__11225;
      id v24 = 0;
      v10 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v8];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_173;
      v17[3] = &unk_264E570F8;
      id v11 = v7;
      v22 = v23;
      uint64_t v12 = *(void *)(a1 + 32);
      id v18 = v11;
      uint64_t v19 = v12;
      id v13 = v10;
      id v20 = v13;
      id v21 = v9;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_3;
      v15[3] = &unk_264E58610;
      v15[4] = *(void *)(a1 + 32);
      id v14 = v21;
      id v16 = v14;
      objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v15);

      _Block_object_dispose(v23, 8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_173(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (([*(id *)(a1 + 32) isEqualToString:@"Detect Language"] & 1) != 0
    || ![*(id *)(a1 + 32) length])
  {
    id LTTranslatorClass = get_LTTranslatorClass();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_264E570D0;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 64);
    id v18 = v12;
    uint64_t v19 = v13;
    v14[4] = *(void *)(a1 + 40);
    id v15 = v6;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 56);
    [LTTranslatorClass languageForText:v15 completion:v14];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:*(void *)(a1 + 32)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 40) translateText:v6 fromLocale:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) toLocale:*(void *)(a1 + 48) translator:*(void *)(a1 + 56) completionBlock:v7];
  }
}

uint64_t __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3
    && ([v3 dominantLanguage], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 dominantLanguage];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(a1 + 32) translateText:*(void *)(a1 + 40) fromLocale:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) toLocale:*(void *)(a1 + 48) translator:*(void *)(a1 + 56) completionBlock:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v9 = WFLocalizedString(@"Unable to Detect Language");
    v10 = WFLocalizedString(@"The language of the text provided may not be supported by Translate.");
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    uint64_t v14 = *MEMORY[0x263F08320];
    v17[0] = *MEMORY[0x263F08338];
    v17[1] = v14;
    v18[0] = v9;
    v18[1] = v10;
    id v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    id v16 = [v12 errorWithDomain:v13 code:0x7FFFFFFFFFFFFFFFLL userInfo:v15];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v16);
  }
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFTranslateTextAction;
  v2 = [(WFTranslateTextAction *)&v5 disabledOnPlatforms];
  id v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end