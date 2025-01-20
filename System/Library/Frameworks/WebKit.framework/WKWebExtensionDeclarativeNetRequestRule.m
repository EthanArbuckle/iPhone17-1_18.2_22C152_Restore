@interface WKWebExtensionDeclarativeNetRequestRule
@end

@implementation WKWebExtensionDeclarativeNetRequestRule

id __77___WKWebExtensionDeclarativeNetRequestRule_removeInvalidResourceTypesForKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [*(id *)(a1 + 32) _chromeResourceTypeToWebKitResourceType];
  v6 = [v5 objectForKey:v4];

  return v6;
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"replaceOnly"];
  if (v4)
  {
    v5 = (void *)[v3 mutableCopy];
    [v5 setObject:v4 forKeyedSubscript:@"replace-only"];
    [v5 setObject:0 forKeyedSubscript:@"replaceOnly"];
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  return v1;
}

id __113___WKWebExtensionDeclarativeNetRequestRule__webKitRuleWithWebKitActionType_chromeActionType_chromeResourceTypes___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (([v3 hasPrefix:@"*"] & 1) == 0)
  {
    uint64_t v4 = [@"*" stringByAppendingString:v3];

    id v3 = (id)v4;
  }

  return v3;
}

id __90___WKWebExtensionDeclarativeNetRequestRule__convertedResourceTypesForChromeResourceTypes___block_invoke(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");

  return v1;
}

@end