@interface SGMIBiomeEventReducer
+ (void)updateSummaryDict:(id)a3 fetchedUnreadMessages:(id)a4 event:(id)a5 timestamp:(double)a6;
@end

@implementation SGMIBiomeEventReducer

+ (void)updateSummaryDict:(id)a3 fetchedUnreadMessages:(id)a4 event:(id)a5 timestamp:(double)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x1CB79B230]();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"app_launch", @"app_resume", 0);
  v14 = [v11 eventName];
  int v15 = [v13 containsObject:v14];

  if (v15)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v65 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          [v21 updateWithAppLaunchAtTime:a6];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v18);
    }
  }
  v22 = [v11 messageId];

  if (v22)
  {
    id v23 = [NSString alloc];
    v24 = [v11 messageId];
    v25 = (void *)[v23 initWithFormat:@"<%@>", v24];

    v26 = [v9 objectForKeyedSubscript:v25];

    if (!v26)
    {
      v27 = objc_opt_new();
      [v9 setObject:v27 forKeyedSubscript:v25];
    }
    v28 = [v11 eventName];
    int v29 = [v28 isEqualToString:@"message_fetched"];

    if (v29)
    {
      v30 = [v9 objectForKeyedSubscript:v25];
      [v30 updateWithMessageFetchedEventAtTime:a6];

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v31 = v10;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v61 != v34) {
              objc_enumerationMutation(v31);
            }
            v36 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v60 + 1) + 8 * j)];
            [v36 incrementNumberOfMoreRecentUnreadMessageAtFirstViewTime];
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v33);
      }

      [v31 addObject:v25];
      goto LABEL_39;
    }
    v37 = [v11 eventName];
    int v38 = [v37 isEqualToString:@"message_view_start"];

    if (v38)
    {
      if ([v10 containsObject:v25]) {
        [v10 removeObject:v25];
      }
      v39 = [v9 objectForKeyedSubscript:v25];
      objc_msgSend(v39, "updateWithViewStartAtTime:unreadMessageCount:", objc_msgSend(v10, "count"), a6);

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v40 = v10;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v42; ++k)
          {
            if (*(void *)v57 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * k)];
            [v45 incrementNumberOfMailsViewedBeforeSinceAvailable];
          }
          uint64_t v42 = [v40 countByEnumeratingWithState:&v56 objects:v68 count:16];
        }
        while (v42);
      }
      goto LABEL_38;
    }
    v46 = [v11 eventName];
    int v47 = [v46 isEqualToString:@"message_view_end"];

    if (v47)
    {
      id v40 = [v9 objectForKeyedSubscript:v25];
      v48 = [v11 payload];
      [v40 updateWithViewEndWithPayload:v48];
    }
    else
    {
      v49 = [v11 eventName];
      int v50 = [v49 isEqualToString:@"read_changed"];

      if (v50)
      {
        id v40 = [v9 objectForKeyedSubscript:v25];
        v48 = [v11 payload];
        [v40 updateWithReadChangedEventWithPayload:v48];
      }
      else
      {
        v51 = [v11 eventName];
        int v52 = [v51 isEqualToString:@"flag_changed"];

        if (v52)
        {
          id v40 = [v9 objectForKeyedSubscript:v25];
          [v40 updateWithFlagChangedEvent];
          goto LABEL_38;
        }
        v53 = [v11 eventName];
        int v54 = [v53 isEqualToString:@"message_moved"];

        v55 = [v9 objectForKeyedSubscript:v25];
        id v40 = v55;
        if (!v54)
        {
          [v55 updateWithEvent:v11 eventTimestamp:a6];
          goto LABEL_38;
        }
        v48 = [v11 payload];
        [v40 updateWithMessageMovedEventWithPayload:v48];
      }
    }

LABEL_38:
LABEL_39:
  }
}

@end