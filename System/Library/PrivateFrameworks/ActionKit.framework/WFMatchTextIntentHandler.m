@interface WFMatchTextIntentHandler
- (void)handleMatchText:(id)a3 completion:(id)a4;
- (void)resolveCaseSensitiveForMatchText:(id)a3 withCompletion:(id)a4;
- (void)resolvePatternForMatchText:(id)a3 withCompletion:(id)a4;
- (void)resolveTextForMatchText:(id)a3 withCompletion:(id)a4;
@end

@implementation WFMatchTextIntentHandler

- (void)handleMatchText:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, WFMatchTextIntentResponse *))a4;
  v7 = objc_opt_new();
  v8 = [v5 text];
  v9 = [v5 pattern];
  v10 = [v5 caseSensitive];
  int v11 = [v10 BOOLValue];

  if ([v8 length])
  {
    id v35 = 0;
    v12 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v9 options:v11 ^ 1u error:&v35];
    v13 = (WFMatchTextIntentResponse *)v35;
    v14 = v13;
    if (!v12)
    {
      v29 = [[WFMatchTextIntentResponse alloc] initWithCode:100 userActivity:0];
      v30 = [(WFMatchTextIntentResponse *)v14 localizedDescription];
      [(WFMatchTextIntentResponse *)v29 setErrorDescription:v30];

      v6[2](v6, v29);
      goto LABEL_9;
    }
    v32 = v13;
    v33 = v9;
    v34 = v6;
    v31 = v12;
    v15 = objc_msgSend(v12, "matchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    if ([v15 count])
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v15 objectAtIndexedSubscript:v16];
        uint64_t v18 = [v17 range];
        v20 = objc_msgSend(v8, "substringWithRange:", v18, v19);
        v21 = [WFTextMatch alloc];
        v22 = [MEMORY[0x263F08C38] UUID];
        v23 = [v22 UUIDString];
        v24 = [(WFTextMatch *)v21 initWithIdentifier:v23 displayString:v20];

        v25 = [v5 text];
        [(WFTextMatch *)v24 setText:v25];

        v26 = [v5 pattern];
        [(WFTextMatch *)v24 setPattern:v26];

        v27 = [v5 caseSensitive];
        [(WFTextMatch *)v24 setCaseSensitive:v27];

        v28 = [NSNumber numberWithInt:v16];
        [(WFTextMatch *)v24 setIndex:v28];

        [v7 addObject:v24];
        ++v16;
      }
      while ([v15 count] > v16);
    }

    v9 = v33;
    v6 = v34;
  }
  v14 = [[WFMatchTextIntentResponse alloc] initWithCode:4 userActivity:0];
  [(WFMatchTextIntentResponse *)v14 setMatches:v7];
  v6[2](v6, v14);
LABEL_9:
}

- (void)resolveTextForMatchText:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  v6 = [v10 text];

  v7 = (void *)MEMORY[0x263F10020];
  if (v6)
  {
    v8 = [v10 text];
    uint64_t v9 = [v7 successWithResolvedString:v8];
    v5[2](v5, v9);

    id v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    v8 = [MEMORY[0x263F10020] needsValue];
    v5[2](v5, (uint64_t)v8);
  }
}

- (void)resolvePatternForMatchText:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, uint64_t))a4;
  v6 = [v10 pattern];

  v7 = (void *)MEMORY[0x263F10020];
  if (v6)
  {
    v8 = [v10 pattern];
    uint64_t v9 = [v7 successWithResolvedString:v8];
    v5[2](v5, v9);

    id v5 = (void (**)(id, uint64_t))v9;
  }
  else
  {
    v8 = [MEMORY[0x263F10020] needsValue];
    v5[2](v5, (uint64_t)v8);
  }
}

- (void)resolveCaseSensitiveForMatchText:(id)a3 withCompletion:(id)a4
{
  v6 = (void *)MEMORY[0x263F0F9D0];
  id v7 = a4;
  id v9 = [a3 caseSensitive];
  v8 = objc_msgSend(v6, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
  (*((void (**)(id, void *))a4 + 2))(v7, v8);
}

@end