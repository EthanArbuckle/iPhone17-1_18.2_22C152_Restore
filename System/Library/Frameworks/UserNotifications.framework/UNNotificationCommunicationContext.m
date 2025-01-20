@interface UNNotificationCommunicationContext
@end

@implementation UNNotificationCommunicationContext

id __77___UNNotificationCommunicationContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) identifier];
  v4 = objc_msgSend(v3, "un_logDigest");
  id v5 = (id)[v2 appendObject:v4 withName:@"identifier"];

  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) associatedObjectUri];
  v8 = objc_msgSend(v7, "un_logDigest");
  id v9 = (id)[v6 appendObject:v8 withName:@"associatedObjectUri"];

  v10 = *(void **)(a1 + 32);
  v11 = [*(id *)(a1 + 40) bundleIdentifier];
  id v12 = (id)[v10 appendObject:v11 withName:@"bundleIdentifier"];

  v13 = *(void **)(a1 + 32);
  v14 = [*(id *)(a1 + 40) displayName];
  v15 = objc_msgSend(v14, "un_logDigest");
  id v16 = (id)[v13 appendObject:v15 withName:@"displayName"];

  v17 = *(void **)(a1 + 32);
  v18 = [*(id *)(a1 + 40) recipients];
  [v17 appendArraySection:v18 withName:@"recipients" skipIfEmpty:1];

  v19 = *(void **)(a1 + 32);
  v20 = [*(id *)(a1 + 40) sender];
  id v21 = (id)[v19 appendObject:v20 withName:@"sender"];

  v22 = *(void **)(a1 + 32);
  v23 = [*(id *)(a1 + 40) contentURL];
  id v24 = (id)[v22 appendObject:v23 withName:@"contentURL"];

  v25 = *(void **)(a1 + 32);
  v26 = [*(id *)(a1 + 40) imageName];
  id v27 = (id)[v25 appendObject:v26 withName:@"imageName"];

  id v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemImage"), @"isSystemImage");
  id v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "mentionsCurrentUser"), @"mentionsCurrentUser");
  id v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "notifyRecipientAnyway"), @"notifyRecipientAnyway");
  id v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReplyToCurrentUser"), @"isReplyToCurrentUser");
  id v32 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "recipientCount"), @"recipientCount");
  v33 = *(void **)(a1 + 32);
  uint64_t v34 = [*(id *)(a1 + 40) capabilities];
  v35 = &stru_1F062A810;
  if (!v34) {
    v35 = @"Unspecified";
  }
  if (v34) {
    v36 = @"Video";
  }
  else {
    v36 = v35;
  }
  [v33 appendString:v36 withName:@"capabilities"];
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isBusinessCorrespondence"), @"isBusinessCorrespondence");
}

@end