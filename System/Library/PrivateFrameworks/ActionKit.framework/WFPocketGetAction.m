@interface WFPocketGetAction
- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFPocketGetAction

- (void)pocketAPI:(id)a3 receivedResponse:(id)a4 forAPIMethod:(id)a5 error:(id)a6
{
  v32[1] = *MEMORY[0x263EF8340];
  if (a6)
  {
    -[WFPocketGetAction finishRunningWithError:](self, "finishRunningWithError:", a6, a4, a5);
  }
  else
  {
    v6 = [a4 objectForKey:@"list"];
    if ([v6 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v24 = v6;
      v7 = [v6 allValues];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v13 = NSURL;
            v14 = [v12 objectForKey:@"resolved_url"];
            v15 = [v13 URLWithString:v14];

            if (v15)
            {
              v16 = [(WFPocketGetAction *)self output];
              v17 = [v12 objectForKey:@"resolved_title"];
              if (v17)
              {
                [v16 addObject:v15 named:v17];
              }
              else
              {
                v18 = [v12 objectForKey:@"given_title"];
                [v16 addObject:v15 named:v18];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v9);
      }

      [(WFPocketGetAction *)self finishRunningWithError:0];
      v6 = v24;
    }
    else
    {
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08570];
      uint64_t v31 = *MEMORY[0x263F08320];
      v21 = WFLocalizedString(@"No items matching the specified criteria were found in Pocket.");
      v32[0] = v21;
      v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v23 = [v19 errorWithDomain:v20 code:-1100 userInfo:v22];
      [(WFPocketGetAction *)self finishRunningWithError:v23];
    }
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v18[5] = *MEMORY[0x263EF8340];
  v4 = [(WFPocketGetAction *)self parameterValueForKey:@"WFPocketItemCount" ofClass:objc_opt_class()];
  unint64_t v5 = [v4 integerValue];

  v6 = [(WFPocketGetAction *)self parameterValueForKey:@"WFPocketItemState" ofClass:objc_opt_class()];
  v7 = [(WFPocketGetAction *)self parameterValueForKey:@"WFPocketItemSearchTerm" ofClass:objc_opt_class()];
  uint64_t v8 = [(WFPocketGetAction *)self parameterValueForKey:@"WFPocketItemSearchTags" ofClass:objc_opt_class()];
  if ([v6 isEqualToString:@"Unread"])
  {

    uint64_t v9 = @"unread";
  }
  else
  {
    int v10 = [v6 isEqualToString:@"Archived"];

    if (v10) {
      uint64_t v9 = @"archive";
    }
    else {
      uint64_t v9 = @"all";
    }
  }
  if (v5 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v5;
  }
  v17[0] = @"count";
  v12 = [NSNumber numberWithInteger:v11];
  v18[0] = v12;
  v18[1] = v9;
  v13 = &stru_26F008428;
  v17[1] = @"state";
  v17[2] = @"search";
  if (v7) {
    v14 = v7;
  }
  else {
    v14 = &stru_26F008428;
  }
  if (v8) {
    v13 = v8;
  }
  v18[2] = v14;
  v18[3] = v13;
  v17[3] = @"tag";
  v17[4] = @"detailType";
  v18[4] = @"simple";
  v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  v16 = +[PocketAPI sharedAPI];
  [v16 callAPIMethod:@"get" withHTTPMethod:1 arguments:v15 delegate:self];
}

@end