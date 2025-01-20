@interface UNNotificationContact
@end

@implementation UNNotificationContact

id __64___UNNotificationContact_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) handle];
  v4 = objc_msgSend(v3, "un_logDigest");
  id v5 = (id)[v2 appendObject:v4 withName:@"handle"];

  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "handleType"), @"handleType");
  v7 = *(void **)(a1 + 32);
  v8 = [*(id *)(a1 + 40) serviceName];
  id v9 = (id)[v7 appendObject:v8 withName:@"serviceName"];

  v10 = *(void **)(a1 + 32);
  v11 = [*(id *)(a1 + 40) displayName];
  v12 = objc_msgSend(v11, "un_logDigest");
  id v13 = (id)[v10 appendObject:v12 withName:@"displayName"];

  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDisplayNameSuggested"), @"isDisplayNameSuggested");
  v15 = *(void **)(a1 + 32);
  v16 = [*(id *)(a1 + 40) customIdentifier];
  v17 = objc_msgSend(v16, "un_logDigest");
  id v18 = (id)[v15 appendObject:v17 withName:@"customIdentifier"];

  v19 = *(void **)(a1 + 32);
  v20 = [*(id *)(a1 + 40) cnContactIdentifier];
  id v21 = (id)[v19 appendObject:v20 withName:@"cnContactIdentifier"];

  v22 = *(void **)(a1 + 32);
  v23 = [*(id *)(a1 + 40) cnContactFullname];
  v24 = objc_msgSend(v23, "un_logDigest");
  id v25 = (id)[v22 appendObject:v24 withName:@"cnContactFullname"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCNContactIdentifierSuggested"), @"isCNContactIdentifierSuggested");
}

@end