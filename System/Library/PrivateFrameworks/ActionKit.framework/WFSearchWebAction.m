@interface WFSearchWebAction
- (id)getDestinationURLFromInputString:(id)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSearchWebAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a web search?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to perform a web search?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFSearchWebAction *)self input];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__WFSearchWebAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5BF50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getStringRepresentation:v7];
}

void __64__WFSearchWebAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    v7 = [*(id *)(a1 + 32) getDestinationURLFromInputString:v5];
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = 0;
    v9 = [MEMORY[0x263F339D0] locationWithURL:v7 error:&v11];
    id v10 = v11;
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)getDestinationURLFromInputString:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSearchWebAction *)self parameterValueForKey:@"WFSearchWebDestination" ofClass:objc_opt_class()];
  id v6 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v7 = (void *)[v6 mutableCopy];

  [v7 removeCharactersInString:@"?&="];
  uint64_t v8 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v7];

  if ([v5 isEqualToString:@"Amazon"])
  {
    v9 = @"https://www.amazon.com/s/s?k=%@";
  }
  else if ([v5 isEqualToString:@"Bing"])
  {
    v9 = @"https://www.bing.com/search?q=%@";
  }
  else if ([v5 isEqualToString:@"DuckDuckGo"])
  {
    v9 = @"https://duckduckgo.com/?q=%@";
  }
  else if ([v5 isEqualToString:@"eBay"])
  {
    v9 = @"https://www.ebay.com/sch/%@";
  }
  else if ([v5 isEqualToString:@"Google"])
  {
    v9 = @"https://google.com/search?q=%@";
  }
  else if ([v5 isEqualToString:@"Reddit"])
  {
    v9 = @"https://m.reddit.com/search?q=%@";
  }
  else if ([v5 isEqualToString:@"Twitter"])
  {
    v9 = @"https://twitter.com/search?q=%@";
  }
  else if ([v5 isEqualToString:@"Yahoo!"])
  {
    v9 = @"https://search.yahoo.com/mobile/s?p=%@";
  }
  else
  {
    if (![v5 isEqualToString:@"YouTube"]) {
      goto LABEL_21;
    }
    v9 = @"https://www.youtube.com/results?search_query=%@";
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [NSURL URLWithString:v10];

    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = 0;
LABEL_22:

  return v12;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EF80;
  v3[4] = self;
  [a3 getStringRepresentation:v3];
}

void __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 length];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7)
  {
    v9 = [v8 getDestinationURLFromInputString:v5];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) userInterface];
      if ([v10 isRunningWithSiriUI])
      {
        id v11 = [*(id *)(a1 + 32) userInterface];
        char v12 = objc_opt_respondsToSelector();

        if (v12)
        {
          v13 = [*(id *)(a1 + 32) userInterface];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_2;
          v21[3] = &unk_264E5BF28;
          v21[4] = *(void *)(a1 + 32);
          [v13 openURL:v9 withBundleIdentifier:0 completionHandler:v21];

          goto LABEL_6;
        }
      }
      else
      {
      }
      v14 = (void *)MEMORY[0x263F87080];
      v15 = [*(id *)(a1 + 32) userInterface];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_3;
      v19[3] = &unk_264E5DF98;
      uint64_t v20 = *(void *)(a1 + 32);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_4;
      v18[3] = &unk_264E5EBC8;
      v18[4] = v20;
      v16 = [v14 requestWithURL:v9 scheme:0 userInterface:v15 bundleIdentifier:0 successHandler:v19 failureHandler:v18];

      v17 = [MEMORY[0x263F86830] sharedManager];
      [v17 performRequest:v16];

      goto LABEL_10;
    }
LABEL_6:
    [*(id *)(a1 + 32) finishRunningWithError:0];
LABEL_10:

    goto LABEL_11;
  }
  [v8 finishRunningWithError:v6];
LABEL_11:
}

void __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 finishRunningWithError:0];
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    [v2 finishRunningWithError:v4];
  }
}

uint64_t __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

uint64_t __48__WFSearchWebAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end