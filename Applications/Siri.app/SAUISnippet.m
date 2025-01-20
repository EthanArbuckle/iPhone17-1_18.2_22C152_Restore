@interface SAUISnippet
- (id)_callHistoryRowsForCalls:(id)a3 callOperation:(id)a4;
- (id)_searchCallHistoryIntentForVoicemail:(BOOL)a3;
- (id)_searchCallHistoryIntentResponseForCallRecords:(id)a3;
- (void)sr_applySnippetProperties:(id)a3;
@end

@implementation SAUISnippet

- (id)_callHistoryRowsForCalls:(id)a3 callOperation:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  id v27 = objc_alloc_init((Class)NSMutableArray);
  id v7 = objc_alloc_init((Class)NSDateFormatter);
  [v7 setFormattingContext:3];
  [v7 setDateStyle:1];
  v24 = v7;
  [v7 setTimeStyle:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  id v28 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v30;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = objc_alloc_init((Class)SFRowCardSection);
        v11 = [v9 callTime];
        if ([v11 _isToday])
        {
          v12 = @"TODAY";
LABEL_10:
          uint64_t v13 = sub_1000606C4(v12);
          goto LABEL_15;
        }
        if ([v11 _isYesterday])
        {
          v12 = @"YESTERDAY";
          goto LABEL_10;
        }
        if ([v11 _isWithinTheLastTimePeriodInDays:7])
        {
          v14 = v24;
          CFStringRef v15 = @"EEEE";
        }
        else
        {
          v14 = v24;
          CFStringRef v15 = 0;
        }
        [v14 setDateFormat:v15];
        uint64_t v13 = [v24 stringFromDate:v11];
LABEL_15:
        v16 = (void *)v13;
        id v17 = objc_alloc_init((Class)SFRichText);
        id v18 = objc_alloc_init((Class)SFFormattedText);
        [v18 setText:v16];
        [v18 setTextColor:0];
        id v33 = v18;
        v19 = +[NSArray arrayWithObjects:&v33 count:1];
        [v17 setFormattedTextPieces:v19];

        [v10 setTrailingText:v17];
        v20 = +[NSUUID UUID];
        v21 = [v20 UUIDString];
        [v10 setCardSectionId:v21];

        if (v6) {
          v6[2](v6, v9, v10);
        }
        [v27 addObject:v10];
      }
      id v28 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v28);
  }

  id v22 = [v27 copy];

  return v22;
}

- (id)_searchCallHistoryIntentForVoicemail:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)INSearchCallHistoryIntent);
  if (v3) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = 15;
  }
  id v6 = [v4 initWithDateCreated:0 recipient:0 callCapabilities:3 callTypes:v5 unseen:0];
  id v7 = [v6 backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = objc_alloc_init((Class)_INPBIntentMetadata);
    [v9 setLaunchId:@"com.apple.mobilephone"];
    [v8 setIntentMetadata:v9];
    [v6 setBackingStore:v8];
  }

  return v6;
}

- (id)_searchCallHistoryIntentResponseForCallRecords:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)INSearchCallHistoryIntentResponse) initWithCode:7 userActivity:0];
  [v4 setCallRecords:v3];

  return v4;
}

- (void)sr_applySnippetProperties:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 aceId];
  [(SAUISnippet *)self setAceId:v5];

  id v6 = [v4 refId];
  [(SAUISnippet *)self setRefId:v6];

  -[SAUISnippet setCanBeRefreshed:](self, "setCanBeRefreshed:", [v4 canBeRefreshed]);
  id v7 = [v4 speakableContextInfo];
  [(SAUISnippet *)self setSpeakableContextInfo:v7];

  id v8 = [v4 context];
  [(SAUISnippet *)self setContext:v8];

  id v9 = [v4 deferredRendering];
  [(SAUISnippet *)self setDeferredRendering:v9];

  id v10 = [v4 listenAfterSpeaking];
  [(SAUISnippet *)self setListenAfterSpeaking:v10];

  v11 = [v4 speakableText];
  [(SAUISnippet *)self setSpeakableText:v11];

  v12 = [v4 viewId];
  [(SAUISnippet *)self setViewId:v12];

  uint64_t v13 = [v4 confirmationOptions];
  [(SAUISnippet *)self setConfirmationOptions:v13];

  v14 = [v4 title];
  [(SAUISnippet *)self setTitle:v14];

  CFStringRef v15 = [v4 subtitle];
  [(SAUISnippet *)self setSubtitle:v15];

  id v16 = [v4 summaryTitle];

  [(SAUISnippet *)self setSummaryTitle:v16];
}

@end