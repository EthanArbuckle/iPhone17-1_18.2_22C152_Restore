@interface WFMatchTextGetGroupIntentHandler
- (id)matchedTextInString:(id)a3 withResult:(id)a4 atIndex:(int64_t)a5;
- (void)handleMatchTextGetGroup:(id)a3 completion:(id)a4;
- (void)resolveGroupIndexForMatchTextGetGroup:(id)a3 withCompletion:(id)a4;
- (void)resolveMatchesForMatchTextGetGroup:(id)a3 withCompletion:(id)a4;
- (void)resolveTypeForMatchTextGetGroup:(id)a3 withCompletion:(id)a4;
@end

@implementation WFMatchTextGetGroupIntentHandler

- (id)matchedTextInString:(id)a3 withResult:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 rangeAtIndex:a5];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v7, "substringWithRange:", v8, v9);
  }

  return v10;
}

- (void)handleMatchTextGetGroup:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, WFMatchTextGetGroupIntentResponse *))a4;
  uint64_t v8 = [v6 matches];
  uint64_t v41 = [v6 type];
  uint64_t v9 = [v6 groupIndex];
  unint64_t v40 = [v9 integerValue];

  v10 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obj = v8;
  uint64_t v11 = [(WFMatchTextGetGroupIntentResponse *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v43 = *(void *)v47;
    v44 = v10;
    v38 = v7;
    id v39 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "text", v38);
        v16 = [v14 caseSensitive];
        BOOL v17 = v16 == 0;

        v18 = (void *)MEMORY[0x263F08AE8];
        v19 = [v14 pattern];
        id v45 = 0;
        v20 = [v18 regularExpressionWithPattern:v19 options:v17 error:&v45];
        id v21 = v45;

        if (v20)
        {
          v22 = objc_msgSend(v20, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
          v23 = [v14 index];
          unint64_t v24 = [v23 integerValue];

          if (v24 < [v22 count])
          {
            v25 = [v22 objectAtIndexedSubscript:v24];
            v26 = v25;
            if (v41 == 2)
            {
              if ((unint64_t)[v25 numberOfRanges] >= 2)
              {
                uint64_t v27 = 1;
                while (1)
                {
                  uint64_t v28 = [(WFMatchTextGetGroupIntentHandler *)self matchedTextInString:v15 withResult:v26 atIndex:v27];
                  if (!v28) {
                    break;
                  }
                  v29 = (void *)v28;
                  [v44 addObject:v28];

                  if (++v27 >= (unint64_t)[v26 numberOfRanges]) {
                    goto LABEL_18;
                  }
                }
                v34 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:100 userActivity:0];
                uint64_t v35 = [NSNumber numberWithUnsignedInteger:v27];
                goto LABEL_24;
              }
            }
            else
            {
              if ((v40 & 0x8000000000000000) != 0 || v40 >= [v25 numberOfRanges])
              {
                v34 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:101 userActivity:0];
                v37 = [NSNumber numberWithInteger:v40];
                [(WFMatchTextGetGroupIntentResponse *)v34 setRangeErrorGroupNumber:v37];

                v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "numberOfRanges"));
                [(WFMatchTextGetGroupIntentResponse *)v34 setRangeErrorGroupCount:v36];
                goto LABEL_25;
              }
              uint64_t v30 = [(WFMatchTextGetGroupIntentHandler *)self matchedTextInString:v15 withResult:v26 atIndex:v40];
              if (!v30)
              {
                v34 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:100 userActivity:0];
                uint64_t v35 = [NSNumber numberWithInteger:v40];
LABEL_24:
                v36 = (void *)v35;
                [(WFMatchTextGetGroupIntentResponse *)v34 setNoMatchIndex:v35];
LABEL_25:

                id v7 = v38;
                v38[2](v38, v34);

                v32 = obj;
                v33 = obj;
                id v6 = v39;
                v10 = v44;
                goto LABEL_26;
              }
              v31 = (void *)v30;
              [v44 addObject:v30];
            }
LABEL_18:
          }
        }
      }
      uint64_t v12 = [(WFMatchTextGetGroupIntentResponse *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      id v7 = v38;
      id v6 = v39;
      v10 = v44;
      if (v12) {
        continue;
      }
      break;
    }
  }
  v32 = obj;

  v33 = [[WFMatchTextGetGroupIntentResponse alloc] initWithCode:4 userActivity:0];
  [(WFMatchTextGetGroupIntentResponse *)v33 setText:v10];
  v7[2](v7, v33);
LABEL_26:
}

- (void)resolveTypeForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if ([v7 type]) {
    +[WFMatchTextGetGroupTypeResolutionResult successWithResolvedMatchTextGetGroupType:](WFMatchTextGetGroupTypeResolutionResult, "successWithResolvedMatchTextGetGroupType:", [v7 type]);
  }
  else {
  id v6 = +[WFMatchTextGetGroupTypeResolutionResult needsValue];
  }
  v5[2](v5, v6);
}

- (void)resolveMatchesForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 matches];
  id v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_52368);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

id __86__WFMatchTextGetGroupIntentHandler_resolveMatchesForMatchTextGetGroup_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFTextMatchResolutionResult successWithResolvedTextMatch:a2];
}

- (void)resolveGroupIndexForMatchTextGetGroup:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  id v6 = [v9 groupIndex];

  if (v6)
  {
    id v7 = [v9 groupIndex];
    uint64_t v8 = +[INIntegerResolutionResult successWithResolvedValue:](WFMatchTextGetGroupGroupIndexResolutionResult, "successWithResolvedValue:", [v7 integerValue]);
    v5[2](v5, v8);

    v5 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    id v7 = +[WFMatchTextGetGroupGroupIndexResolutionResult needsValue];
    v5[2](v5, (uint64_t)v7);
  }
}

@end