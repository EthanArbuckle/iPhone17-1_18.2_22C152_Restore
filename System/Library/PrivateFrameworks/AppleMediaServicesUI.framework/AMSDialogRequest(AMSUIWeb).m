@interface AMSDialogRequest(AMSUIWeb)
- (id)_resultFromDialogAction:()AMSUIWeb;
- (id)_resultFromDialogTextField:()AMSUIWeb;
- (id)generateWebExport;
@end

@implementation AMSDialogRequest(AMSUIWeb)

- (id)generateWebExport
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v4 = [a1 buttonActions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [a1 _resultFromDialogAction:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v6);
  }

  [v2 setObject:v3 forKeyedSubscript:@"actions"];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v11 = objc_msgSend(a1, "textFields", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [a1 _resultFromDialogTextField:*(void *)(*((void *)&v30 + 1) + 8 * j)];
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v13);
  }

  [v2 setObject:v10 forKeyedSubscript:@"textFields"];
  v17 = [a1 appearanceInfo];
  [v2 setObject:v17 forKeyedSubscript:@"appearanceInfo"];

  v18 = [a1 defaultAction];
  v19 = [a1 _resultFromDialogAction:v18];
  [v2 setObject:v19 forKeyedSubscript:@"defaultAction"];

  v20 = [a1 iconURL];
  v21 = [v20 absoluteString];
  [v2 setObject:v21 forKeyedSubscript:@"iconURL"];

  v22 = [a1 identifier];
  [v2 setObject:v22 forKeyedSubscript:@"identifier"];

  v23 = [a1 message];
  [v2 setObject:v23 forKeyedSubscript:@"message"];

  v24 = [a1 metricsEvent];
  v25 = [v24 underlyingDictionary];
  [v2 setObject:v25 forKeyedSubscript:@"metrics"];

  v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "style"));
  [v2 setObject:v26 forKeyedSubscript:@"style"];

  v27 = [a1 title];
  [v2 setObject:v27 forKeyedSubscript:@"title"];

  v28 = [a1 userInfo];
  [v2 setObject:v28 forKeyedSubscript:@"userInfo"];

  return v2;
}

- (id)_resultFromDialogAction:()AMSUIWeb
{
  v38[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v5 = [v3 deepLink];
    uint64_t v6 = [v5 absoluteString];
    [v4 setObject:v6 forKeyedSubscript:@"deepLink"];

    uint64_t v7 = [v3 identifier];
    [v4 setObject:v7 forKeyedSubscript:@"identifier"];

    v8 = [v3 metricsEvent];
    v9 = [v8 underlyingDictionary];
    [v4 setObject:v9 forKeyedSubscript:@"metrics"];

    id v10 = [v3 request];
    if (v10)
    {
      v37[0] = @"url";
      long long v36 = [v3 request];
      long long v35 = [v36 URL];
      uint64_t v11 = [v35 absoluteString];
      uint64_t v12 = (void *)v11;
      uint64_t v13 = &stru_26CC491D8;
      if (v11) {
        uint64_t v13 = (__CFString *)v11;
      }
      v38[0] = v13;
      v37[1] = @"headers";
      long long v34 = [v3 request];
      uint64_t v14 = [v34 allHTTPHeaderFields];
      v15 = (void *)v14;
      uint64_t v16 = MEMORY[0x263EFFA78];
      if (v14) {
        uint64_t v16 = v14;
      }
      v38[1] = v16;
      v37[2] = @"body";
      long long v33 = [v3 request];
      v17 = [v33 HTTPBody];
      if (v17)
      {
        id v18 = [NSString alloc];
        long long v32 = [v3 request];
        long long v31 = [v32 HTTPBody];
        v19 = objc_msgSend(v18, "initWithData:encoding:");
      }
      else
      {
        v19 = 0;
      }
      v38[2] = v19;
      v37[3] = @"method";
      v20 = [v3 request];
      uint64_t v21 = [v20 HTTPMethod];
      v22 = (void *)v21;
      v23 = @"GET";
      if (v21) {
        v23 = (__CFString *)v21;
      }
      v38[3] = v23;
      v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];
      [v4 setObject:v24 forKeyedSubscript:@"request"];

      if (v17)
      {
      }
    }
    else
    {
      [v4 setObject:0 forKeyedSubscript:@"request"];
    }

    v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "style"));
    [v4 setObject:v25 forKeyedSubscript:@"style"];

    v26 = [v3 title];
    [v4 setObject:v26 forKeyedSubscript:@"title"];

    v27 = [v3 iconURL];
    v28 = [v27 absoluteString];
    [v4 setObject:v28 forKeyedSubscript:@"iconURL"];

    v29 = [v3 userInfo];
    [v4 setObject:v29 forKeyedSubscript:@"userInfo"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_resultFromDialogTextField:()AMSUIWeb
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "keyboardType"));
    [v5 setObject:v6 forKeyedSubscript:@"keyboardType"];

    uint64_t v7 = [v4 text];
    [v5 setObject:v7 forKeyedSubscript:@"text"];

    v8 = [v4 placeholder];

    [v5 setObject:v8 forKeyedSubscript:@"placeholder"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end