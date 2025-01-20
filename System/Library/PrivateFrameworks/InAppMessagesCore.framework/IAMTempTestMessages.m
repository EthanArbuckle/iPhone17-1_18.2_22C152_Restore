@interface IAMTempTestMessages
- (IAMTempTestMessages)initWithDisplayType:(int64_t)a3;
- (ICInAppMessageEntry)messageEntry;
- (void)setMessageEntry:(id)a3;
@end

@implementation IAMTempTestMessages

- (IAMTempTestMessages)initWithDisplayType:(int64_t)a3
{
  v47.receiver = self;
  v47.super_class = (Class)IAMTempTestMessages;
  result = [(IAMTempTestMessages *)&v47 init];
  if (result)
  {
    v43 = result;
    int64_t v39 = a3;
    v5 = objc_opt_new();
    [v5 setKey:@"arbitraryKey1"];
    [v5 setValue:@"arbitraryValue1"];
    uint64_t v6 = objc_opt_new();
    [v5 setKey:@"arbitraryKey2"];
    [v5 setValue:@"arbitraryValue2"];
    v7 = objc_opt_new();
    [v7 setIdentifier:@"NumberOfTracksPlayed"];
    [v7 setDataType:2];
    [v7 setComparisonType:4];
    [v7 setTriggerValue:@"2"];
    v8 = objc_opt_new();
    [v8 setIdentifier:@"1234-5678"];
    [v8 setType:0];
    v40 = v8;
    v44 = v7;
    [v8 setTriggerCondition:v7];
    v9 = objc_opt_new();
    [v9 setPageType:1];
    v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v5, v6, 0);
    [v9 setActionDetails:v10];

    [v9 setTargetId:@"action1"];
    [v9 setTargetType:0];
    [v9 setActionType:2];
    v11 = objc_opt_new();
    [v11 setPageType:1];
    v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v5, v6, 0);
    [v11 setActionDetails:v12];

    [v11 setTargetId:@"action2"];
    [v11 setTargetType:0];
    [v11 setActionType:2];
    v13 = objc_opt_new();
    [v13 setIdentifier:@"1234-5678"];
    [v13 setDisplayText:@"Got it!"];
    [v13 setURL:@"http://apple.com"];
    [v13 setRequiresDelegate:0];
    v42 = v9;
    [v13 setClickEvent:v9];
    v14 = objc_opt_new();
    [v14 setIdentifier:@"987-654"];
    [v14 setDisplayText:@"Got it!"];
    [v14 setURL:@"http://apple.com"];
    [v14 setRequiresDelegate:0];
    v41 = v11;
    [v13 setClickEvent:v11];
    v15 = objc_opt_new();
    [v15 setPageId:@"page1"];
    [v15 setPageType:1];
    v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v5, v6, 0);
    [v15 setPageDetails:v16];

    [v15 setTargetId:@"targetId"];
    [v15 setTargetType:0];
    v17 = objc_opt_new();
    [v17 setPageType:1];
    v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v5, v6, 0);
    [v17 setActionDetails:v18];

    [v17 setTargetId:@"xbutton"];
    [v17 setTargetType:0];
    [v17 setActionType:2];
    v19 = objc_opt_new();
    [v19 setPageType:1];
    v45 = (void *)v6;
    v46 = v5;
    v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v5, v6, 0);
    [v19 setActionDetails:v20];

    [v19 setTargetId:@"outsideOfCard"];
    [v19 setTargetType:0];
    [v19 setActionType:2];
    v21 = objc_opt_new();
    [v21 setTitle:@"To Listen to this offline, tap one more time to download it."];
    [v21 setSubtitle:@"Content 1 Subtitle"];
    [v21 setBody:@"Content 1 Body"];
    v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v13, v14, 0);
    [v21 setMessageActions:v22];

    [v21 setPageEvent:v15];
    [v21 setCloseClickEvent:v17];
    [v21 setCardClickEvent:v19];
    v23 = objc_opt_new();
    [v23 setTitle:@"Content 2 Title"];
    [v23 setSubtitle:@"Content 2 Subtitle"];
    [v23 setBody:@"Content 2 Body"];
    v38 = v14;
    v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v13, v14, 0);
    [v23 setMessageActions:v24];

    v37 = v15;
    [v21 setPageEvent:v15];
    v36 = v17;
    [v21 setCloseClickEvent:v17];
    [v21 setCardClickEvent:v19];
    v25 = 0;
    if (v39 == 1)
    {
      v26 = [MEMORY[0x263F086E0] mainBundle];
      v27 = [v26 URLForResource:@"listenOffline" withExtension:@"webarchive"];
      v25 = [v27 URLByStandardizingPath];
    }
    v28 = objc_opt_new();
    [v28 setIdentifier:@"message1"];
    [v28 setMessageType:1];
    v29 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"TEST_CUSTOM_TARGET", 0);
    [v28 setTargets:v29];

    v30 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v21, v23, 0);
    [v28 setContentPages:v30];

    [v28 setRule:v40];
    [v28 setMaximumDisplays:1];
    v31 = [v25 absoluteString];
    [v28 setWebArchiveURL:v31];

    id v32 = objc_alloc(MEMORY[0x263F89158]);
    v33 = [MEMORY[0x263F086E0] mainBundle];
    v34 = [v33 bundleIdentifier];
    v35 = (void *)[v32 initWithApplicationMessage:v28 bundleIdentifier:v34];
    [(IAMTempTestMessages *)v43 setMessageEntry:v35];

    return v43;
  }
  return result;
}

- (ICInAppMessageEntry)messageEntry
{
  return self->_messageEntry;
}

- (void)setMessageEntry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end