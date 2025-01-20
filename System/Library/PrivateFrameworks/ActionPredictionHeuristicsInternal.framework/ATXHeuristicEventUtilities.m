@interface ATXHeuristicEventUtilities
+ (BOOL)allowSuggestionsForEvent:(id)a3;
+ (BOOL)isEventAtOneWithDate:(id)a3;
+ (BOOL)isEventAtOneWithTimestamp:(id)a3;
@end

@implementation ATXHeuristicEventUtilities

+ (BOOL)allowSuggestionsForEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString alloc];
  v5 = [v3 title];
  uint64_t v6 = [v5 hash];
  v7 = [v3 startDate];
  v8 = [v3 endDate];
  v9 = [v3 eventIdentifier];
  v10 = (void *)[v4 initWithFormat:@"title.hash: %lu, start: %@, end: %@, id: %@", v6, v7, v8, v9];

  v11 = [v3 calendar];
  if ([v11 isSubscribed])
  {
    v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: from a calendar subscription [%@]";
LABEL_22:
      _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if ([v3 status] == 3)
  {
    v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is cancelled [%@]";
      goto LABEL_22;
    }
LABEL_23:
    BOOL v20 = 0;
    goto LABEL_24;
  }
  if ([v3 participationStatus] != 2 && objc_msgSend(v3, "participationStatus") != 4)
  {
    v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is not accepted [%@]";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v14 = [v3 endDate];
  v15 = [v3 startDate];
  [v14 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v17 > 54000.0)
  {
    v12 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      v13 = "Skipping Event: is more than 15 hour long [%@]";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v12 = [v3 customObjectForKey:@"SGEventMetadataKey"];
  v18 = [v12 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
  v19 = v18;
  BOOL v20 = 1;
  if (v12
    && v18
    && (([v18 isEqualToString:@"Lodging"] & 1) != 0
     || [v19 isEqualToString:@"Flight"]))
  {
    v21 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v10;
      _os_log_impl(&dword_1D0F43000, v21, OS_LOG_TYPE_DEFAULT, "Skipping Event: is hotel or flight [%@]", buf, 0xCu);
    }

    BOOL v20 = 0;
  }

LABEL_24:
  return v20;
}

+ (BOOL)isEventAtOneWithTimestamp:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 doubleValue];
  v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  LOBYTE(a1) = [a1 isEventAtOneWithDate:v5];

  return (char)a1;
}

+ (BOOL)isEventAtOneWithDate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:32 fromDate:v4];

  uint64_t v7 = [v6 hour];
  int v8 = objc_msgSend(MEMORY[0x1E4F1CA20], "atx_usesTwelveHourClock");
  BOOL v10 = v7 == 13 || v7 == 1;
  if (v8) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = v7 == 1;
  }

  return v11;
}

@end