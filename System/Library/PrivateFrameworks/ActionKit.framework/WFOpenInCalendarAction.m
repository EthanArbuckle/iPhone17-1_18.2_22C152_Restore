@interface WFOpenInCalendarAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFOpenInCalendarAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_264E5DBA0;
  v6[4] = self;
  [v4 generateCollectionByCoercingToItemClasses:v5 completionHandler:v6];
}

void __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [a2 items];
  v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 date];
    [v9 timeIntervalSinceReferenceDate];
    v10 = NSURL;
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"calshow:%lu", (unint64_t)v11);
    v13 = [v10 URLWithString:v12];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      [*(id *)(a1 + 32) finishRunningWithError:v6];
      goto LABEL_8;
    }
    v9 = [v8 event];
    v14 = NSURL;
    v15 = NSString;
    v12 = [v9 eventIdentifier];
    v16 = [v12 stringByReplacingOccurrencesOfString:@":" withString:@"/"];
    v17 = [v15 stringWithFormat:@"x-apple-calevent://%@", v16];
    v13 = [v14 URLWithString:v17];
  }
  if (!v13) {
    goto LABEL_7;
  }
  v18 = (void *)MEMORY[0x263F87080];
  v19 = [*(id *)(a1 + 32) userInterface];
  v20 = [*(id *)(a1 + 32) appDescriptor];
  v21 = [v20 bundleIdentifier];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_2;
  v25[3] = &unk_264E5DF98;
  uint64_t v26 = *(void *)(a1 + 32);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_3;
  v24[3] = &unk_264E5EBC8;
  v24[4] = v26;
  v22 = [v18 requestWithURL:v13 scheme:0 userInterface:v19 bundleIdentifier:v21 successHandler:v25 failureHandler:v24];

  v23 = [MEMORY[0x263F86830] sharedManager];
  [v23 performRequest:v22];

LABEL_8:
}

uint64_t __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

void __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F08570];
  uint64_t v7 = *MEMORY[0x263F08320];
  id v4 = WFLocalizedString(@"Calendar could not be opened.");
  v8[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [v2 errorWithDomain:v3 code:-1002 userInfo:v5];

  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end