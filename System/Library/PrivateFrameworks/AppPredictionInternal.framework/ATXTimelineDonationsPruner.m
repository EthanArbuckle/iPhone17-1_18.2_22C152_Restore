@interface ATXTimelineDonationsPruner
- (void)pruneTimelineRelevanceTableWithXPCActivity:(id)a3;
@end

@implementation ATXTimelineDonationsPruner

- (void)pruneTimelineRelevanceTableWithXPCActivity:(id)a3
{
  id v3 = a3;
  v4 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "Pruning timeline donations", buf, 2u);
  }

  v5 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  if ([v3 didDefer])
  {
    v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      v7 = "ATXTimelineDonationsPruner: Asked to defer";
      v8 = (uint8_t *)&v21;
LABEL_20:
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  int v9 = [v5 pruneTimelineEntries];
  v10 = __atxlog_handle_timeline();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v11) {
      goto LABEL_12;
    }
    __int16 v20 = 0;
    v12 = "Sucessfully finished pruning the timeline relevance table";
    v13 = (uint8_t *)&v20;
  }
  else
  {
    if (!v11) {
      goto LABEL_12;
    }
    *(_WORD *)v19 = 0;
    v12 = "Unable to finish pruning the timeline relevance table";
    v13 = v19;
  }
  _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
LABEL_12:

  if ([v3 didDefer])
  {
    v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      v7 = "ATXTimelineDonationsPruner: Asked to defer";
      v8 = (uint8_t *)&v18;
      goto LABEL_20;
    }
  }
  else
  {
    int v14 = [v5 pruneInvalidSuggestions];
    v6 = __atxlog_handle_timeline();
    BOOL v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        __int16 v17 = 0;
        v7 = "Sucessfully finished pruning invalid info suggestions";
        v8 = (uint8_t *)&v17;
        goto LABEL_20;
      }
    }
    else if (v15)
    {
      __int16 v16 = 0;
      v7 = "Unable to finish pruning invalid info suggestions";
      v8 = (uint8_t *)&v16;
      goto LABEL_20;
    }
  }
LABEL_21:
}

@end