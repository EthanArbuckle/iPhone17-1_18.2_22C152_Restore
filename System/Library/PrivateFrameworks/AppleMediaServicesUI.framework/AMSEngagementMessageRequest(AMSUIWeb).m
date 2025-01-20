@interface AMSEngagementMessageRequest(AMSUIWeb)
- (id)_resultFromMessageAction:()AMSUIWeb;
- (id)generateWebExport;
@end

@implementation AMSEngagementMessageRequest(AMSUIWeb)

- (id)generateWebExport
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = objc_msgSend(a1, "actions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [a1 _resultFromMessageAction:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  [v2 setObject:v3 forKeyedSubscript:@"actions"];
  v10 = [a1 appearanceInfo];
  [v2 setObject:v10 forKeyedSubscript:@"appearanceInfo"];

  v11 = [a1 defaultAction];
  v12 = [a1 _resultFromMessageAction:v11];
  [v2 setObject:v12 forKeyedSubscript:@"defaultAction"];

  v13 = [a1 iconURL];
  v14 = [v13 absoluteString];
  [v2 setObject:v14 forKeyedSubscript:@"iconURL"];

  v15 = [a1 subtitle];
  [v2 setObject:v15 forKeyedSubscript:@"message"];

  v16 = [a1 metricsEvent];
  v17 = [v16 underlyingDictionary];
  [v2 setObject:v17 forKeyedSubscript:@"metrics"];

  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "presentationAction"));
  [v2 setObject:v18 forKeyedSubscript:@"presentationAction"];

  v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "style"));
  [v2 setObject:v19 forKeyedSubscript:@"style"];

  v20 = [a1 title];
  [v2 setObject:v20 forKeyedSubscript:@"title"];

  return v2;
}

- (id)_resultFromMessageAction:()AMSUIWeb
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    uint64_t v6 = [v4 deepLink];
    uint64_t v7 = [v6 absoluteString];
    [v5 setObject:v7 forKeyedSubscript:@"deepLink"];

    v8 = [v4 metricsEvent];
    v9 = [v8 underlyingDictionary];
    [v5 setObject:v9 forKeyedSubscript:@"metrics"];

    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "style"));
    [v5 setObject:v10 forKeyedSubscript:@"style"];

    v11 = [v4 title];
    [v5 setObject:v11 forKeyedSubscript:@"title"];

    v12 = [v4 iconURL];

    v13 = [v12 absoluteString];
    [v5 setObject:v13 forKeyedSubscript:@"iconURL"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end