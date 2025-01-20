@interface WFChangeCaseIntentHandler
- (id)stringByApplyingAlternatingCaseToString:(id)a3;
- (id)stringByApplyingSentenceCaseToString:(id)a3 withLocale:(id)a4;
- (id)stringByApplyingTitleCaseToString:(id)a3;
- (void)handleChangeCase:(id)a3 completion:(id)a4;
- (void)resolveTextForChangeCase:(id)a3 withCompletion:(id)a4;
- (void)resolveTypeForChangeCase:(id)a3 withCompletion:(id)a4;
@end

@implementation WFChangeCaseIntentHandler

- (id)stringByApplyingAlternatingCaseToString:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v3, "length"));
  if ([v3 length])
  {
    int v5 = 0;
    unint64_t v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "substringWithRange:", v6, 1);
      v8 = [v7 uppercaseString];
      uint64_t v9 = [v7 lowercaseString];
      v10 = (void *)v9;
      if (v5) {
        v11 = v8;
      }
      else {
        v11 = (void *)v9;
      }
      id v12 = v11;
      uint64_t v13 = [v12 length];
      if (v13 == [v7 length])
      {
        [v4 appendString:v12];
        v5 ^= [v8 isEqualToString:v10] ^ 1;
      }
      else
      {
        [v4 appendString:v7];
      }

      ++v6;
    }
    while (v6 < [v3 length]);
  }

  return v4;
}

- (id)stringByApplyingTitleCaseToString:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  int v5 = [v3 newlineCharacterSet];
  unint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  v7 = objc_msgSend(v6, "if_map:", &__block_literal_global_175_8519);
  v8 = [v7 componentsJoinedByString:@"\n"];

  return v8;
}

id __63__WFChangeCaseIntentHandler_stringByApplyingTitleCaseToString___block_invoke(uint64_t a1, void *a2)
{
  return VCTitleCaseString(a2);
}

- (id)stringByApplyingSentenceCaseToString:(id)a3 withLocale:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    v23 = v6;
    id v24 = v5;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v5, 0);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v26 = [&unk_26F076650 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v26)
    {
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(&unk_26F076650);
          }
          uint64_t v27 = v9;
          uint64_t v10 = *(void *)(*((void *)&v37 + 1) + 8 * v9);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          v11 = (void *)[v8 copy];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                v17 = [v16 componentsSeparatedByString:v10];
                v30[0] = MEMORY[0x263EF8330];
                v30[1] = 3221225472;
                v30[2] = __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke;
                v30[3] = &unk_264E56D80;
                id v31 = v17;
                uint64_t v32 = v10;
                id v18 = v17;
                v19 = objc_msgSend(v18, "if_map:", v30);
                objc_msgSend(v8, "replaceObjectsInRange:withObjectsFromArray:", objc_msgSend(v8, "indexOfObject:", v16), 1, v19);
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v13);
          }

          uint64_t v9 = v27 + 1;
        }
        while (v27 + 1 != v26);
        uint64_t v26 = [&unk_26F076650 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v26);
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke_2;
    v28[3] = &unk_264E5CF58;
    v7 = v23;
    id v29 = v23;
    v20 = objc_msgSend(v8, "if_map:", v28);
    v21 = [v20 componentsJoinedByString:&stru_26F008428];

    id v5 = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) count] - 1 == a3)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = [v5 stringByAppendingString:*(void *)(a1 + 40)];
  }
  v7 = v6;

  return v7;
}

id __77__WFChangeCaseIntentHandler_stringByApplyingSentenceCaseToString_withLocale___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    id v4 = objc_msgSend(v3, "substringWithRange:", 0, 1);
    id v5 = [v4 capitalizedStringWithLocale:*(void *)(a1 + 32)];

    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 1, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (void)handleChangeCase:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, WFChangeCaseIntentResponse *))a4;
  id v7 = a3;
  v8 = [v7 text];
  uint64_t v9 = [v7 type];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__WFChangeCaseIntentHandler_handleChangeCase_completion___block_invoke;
  v12[3] = &unk_264E56D58;
  v12[4] = self;
  v12[5] = v9;
  uint64_t v10 = objc_msgSend(v8, "if_compactMap:", v12);
  v11 = [[WFChangeCaseIntentResponse alloc] initWithCode:4 userActivity:0];
  [(WFChangeCaseIntentResponse *)v11 setText:v10];
  v6[2](v6, v11);
}

id __57__WFChangeCaseIntentHandler_handleChangeCase_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch(*(void *)(a1 + 40))
  {
    case 1:
      id v4 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v5 = [v3 uppercaseStringWithLocale:v4];
      goto LABEL_8;
    case 2:
      id v4 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v5 = [v3 lowercaseStringWithLocale:v4];
      goto LABEL_8;
    case 3:
      id v4 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v5 = [v3 capitalizedStringWithLocale:v4];
      goto LABEL_8;
    case 4:
      uint64_t v7 = [*(id *)(a1 + 32) stringByApplyingTitleCaseToString:v3];
      goto LABEL_10;
    case 5:
      v8 = *(void **)(a1 + 32);
      id v4 = [MEMORY[0x263EFF960] currentLocale];
      uint64_t v5 = [v8 stringByApplyingSentenceCaseToString:v3 withLocale:v4];
LABEL_8:
      id v6 = (void *)v5;

      break;
    case 6:
      uint64_t v7 = [*(id *)(a1 + 32) stringByApplyingAlternatingCaseToString:v3];
LABEL_10:
      id v6 = (void *)v7;
      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (void)resolveTypeForChangeCase:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  uint64_t v5 = (void (**)(id, void *))a4;
  if ([v7 type]) {
    +[WFChangeCaseTypeResolutionResult successWithResolvedChangeCaseType:](WFChangeCaseTypeResolutionResult, "successWithResolvedChangeCaseType:", [v7 type]);
  }
  else {
  id v6 = +[WFChangeCaseTypeResolutionResult needsValue];
  }
  v5[2](v5, v6);
}

- (void)resolveTextForChangeCase:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 text];
  id v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_8542);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

uint64_t __69__WFChangeCaseIntentHandler_resolveTextForChangeCase_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F10020] successWithResolvedString:a2];
}

@end