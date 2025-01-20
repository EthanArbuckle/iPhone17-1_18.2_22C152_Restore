@interface CUIKSuggestionDescriptionGenerator
+ (id)brandedOriginDescriptionStringWithAppName:(id)a3;
+ (id)coalescedInfoForSuggestionNotifications:(id)a3;
+ (id)originDescriptionStringWithAppName:(id)a3;
@end

@implementation CUIKSuggestionDescriptionGenerator

+ (id)originDescriptionStringWithAppName:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = CUIKBundle();
    id v3 = [v4 localizedStringForKey:@"Apps" value:&stru_1F187C430 table:0];
  }
  v5 = NSString;
  v6 = CUIKBundle();
  v7 = [v6 localizedStringForKey:@"Found in %@" value:&stru_1F187C430 table:0];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v3);

  return v8;
}

+ (id)brandedOriginDescriptionStringWithAppName:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v4 = CUIKBundle();
    id v3 = [v4 localizedStringForKey:@"Apps" value:&stru_1F187C430 table:0];
  }
  v5 = NSString;
  v6 = CUIKBundle();
  v7 = [v6 localizedStringForKey:@"Siri Found in %@" value:&stru_1F187C430 table:0];
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v3);

  return v8;
}

+ (id)coalescedInfoForSuggestionNotifications:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 firstObject];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v12 = [v11 startDate];
        v13 = [v5 startDate];
        uint64_t v14 = [v12 compare:v13];

        if (v14 == -1)
        {
          id v15 = v11;

          v5 = v15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v8);
  }

  v16 = [v5 startDate];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 localizedYearMonthAndDayStringShortened:0];
    v19 = NSString;
    v20 = CUIKBundle();
    v21 = [v20 localizedStringForKey:@"Beginning on: %@" value:&stru_1F187C430 table:0];
    v22 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v18);
    [v4 addObject:v22];
  }
  v23 = [v6 firstObject];
  v24 = [v23 originAppName];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v25 = v6;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v41;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = [*(id *)(*((void *)&v40 + 1) + 8 * j) originAppName];
        char v31 = [v30 isEqualToString:v24];

        if ((v31 & 1) == 0)
        {

          v24 = 0;
          goto LABEL_22;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  v32 = +[CUIKSuggestionDescriptionGenerator brandedOriginDescriptionStringWithAppName:v24];
  [v4 addObject:v32];

  v33 = NSString;
  v34 = CUIKBundle();
  v35 = [v34 localizedStringForKey:@"%ld Events Found" value:&stru_1F187C430 table:0];
  v36 = objc_msgSend(v33, "localizedStringWithFormat:", v35, objc_msgSend(v25, "count"));

  v37 = [v4 componentsJoinedByString:@"\n"];
  v38 = [[CUIKSuggestionCoalescedInfo alloc] initWithTitle:v36 descriptionText:v37 earliestSuggestionNotification:v5];

  return v38;
}

@end