@interface WFSplitTextIntentHandler
- (void)handleSplitText:(id)a3 completion:(id)a4;
- (void)resolveCustomSeparatorForSplitText:(id)a3 withCompletion:(id)a4;
- (void)resolveSeparatorForSplitText:(id)a3 withCompletion:(id)a4;
- (void)resolveTextForSplitText:(id)a3 withCompletion:(id)a4;
@end

@implementation WFSplitTextIntentHandler

- (void)handleSplitText:(id)a3 completion:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void (**)(id, WFSplitTextIntentResponse *))a4;
  uint64_t v32 = [v5 separator];
  switch(v32)
  {
    case 1:
      v31 = [MEMORY[0x263F08708] newlineCharacterSet];
      v7 = @"\n";
      break;
    case 2:
      v31 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v7 = @" ";
      break;
    case 3:
      v31 = 0;
      v7 = &stru_26F008428;
      break;
    case 4:
      v7 = [v5 customSeparator];
      goto LABEL_7;
    default:
      v7 = 0;
LABEL_7:
      v31 = 0;
      break;
  }
  v8 = [v5 text];
  v9 = [[WFSplitTextIntentResponse alloc] initWithCode:4 userActivity:0];
  if ([v8 count])
  {
    v26 = v9;
    v28 = v6;
    id v29 = v5;
    v10 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v27 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      uint64_t v15 = 2 * (v32 != 1);
      id v30 = v11;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ((-[__CFString isEqualToString:](v7, "isEqualToString:", &stru_26F008428, v26) & 1) != 0
            || (uint64_t v20 = [(__CFString *)v7 length], v32 == 1)
            || !v20)
          {
            uint64_t v18 = [v17 length];
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __55__WFSplitTextIntentHandler_handleSplitText_completion___block_invoke;
            v37[3] = &unk_264E5C058;
            id v38 = v10;
            objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, v15, v37);
            id v19 = v38;
          }
          else
          {
            if (v31) {
              objc_msgSend(v17, "componentsSeparatedByCharactersInSet:");
            }
            else {
            v21 = [v17 componentsSeparatedByString:v7];
            }
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v19 = v21;
            uint64_t v22 = [v19 countByEnumeratingWithState:&v33 objects:v43 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v34;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v34 != v24) {
                    objc_enumerationMutation(v19);
                  }
                  [v10 addObject:*(void *)(*((void *)&v33 + 1) + 8 * j)];
                }
                uint64_t v23 = [v19 countByEnumeratingWithState:&v33 objects:v43 count:16];
              }
              while (v23);
            }

            uint64_t v15 = 2 * (v32 != 1);
            id v11 = v30;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v13);
    }

    v9 = v26;
    [(WFSplitTextIntentResponse *)v26 setText:v10];
    v6 = v28;
    v28[2](v28, v26);

    id v5 = v29;
    v8 = v27;
  }
  else
  {
    v6[2](v6, v9);
  }
}

uint64_t __55__WFSplitTextIntentHandler_handleSplitText_completion___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)resolveTextForSplitText:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 text];
  v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_45226);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

uint64_t __67__WFSplitTextIntentHandler_resolveTextForSplitText_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F10020] successWithResolvedString:a2];
}

- (void)resolveSeparatorForSplitText:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ([v7 separator]) {
    +[WFSplitTextSeparatorResolutionResult successWithResolvedSplitTextSeparator:](WFSplitTextSeparatorResolutionResult, "successWithResolvedSplitTextSeparator:", [v7 separator]);
  }
  else {
  id v6 = +[WFSplitTextSeparatorResolutionResult needsValue];
  }
  v5[2](v5, v6);
}

- (void)resolveCustomSeparatorForSplitText:(id)a3 withCompletion:(id)a4
{
  id v11 = a3;
  id v5 = (void (**)(id, void *))a4;
  if ([v11 separator] == 4)
  {
    id v6 = [v11 customSeparator];
    uint64_t v7 = [v6 length];

    id v8 = (void *)MEMORY[0x263F10020];
    if (v7)
    {
      v9 = [v11 customSeparator];
      v10 = [v8 successWithResolvedString:v9];
      v5[2](v5, v10);
    }
    else
    {
      v9 = [MEMORY[0x263F10020] needsValue];
      v5[2](v5, v9);
    }
  }
  else
  {
    v9 = [MEMORY[0x263F10020] notRequired];
    v5[2](v5, v9);
  }
}

@end