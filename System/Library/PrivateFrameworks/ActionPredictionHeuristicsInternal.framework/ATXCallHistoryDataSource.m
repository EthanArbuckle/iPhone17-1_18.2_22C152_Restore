@interface ATXCallHistoryDataSource
- (ATXCallHistoryDataSource)initWithDevice:(id)a3;
- (id)_dictForCall:(id)a3;
- (id)_dictForHandle:(id)a3;
- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7;
@end

@implementation ATXCallHistoryDataSource

- (void)callNewerThan:(double)a3 showIncoming:(BOOL)a4 showOutgoing:(BOOL)a5 missedOnly:(BOOL)a6 callback:(id)a7
{
  BOOL v37 = a6;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v10 = a7;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727320))
  {
    double v11 = 7776000.0;
    id v33 = v10;
    if (a3 <= 7776000.0)
    {
      double v11 = a3;
    }
    else
    {
      v12 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:](v12, a3);
      }
    }
    v43[0] = *MEMORY[0x1E4F57D00];
    v13 = [(ATXHeuristicDevice *)self->_device now];
    v14 = [v13 dateByAddingTimeInterval:-v11];
    v44[0] = v14;
    v43[1] = *MEMORY[0x1E4F57CF8];
    v15 = [(ATXHeuristicDevice *)self->_device now];
    v44[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

    id v17 = objc_alloc(MEMORY[0x1E4F57C80]);
    v32 = (void *)v16;
    v18 = (void *)[v17 initWithFetchingLimitsDictionary:v16 andCoalescingStrategy:*MEMORY[0x1E4F57CF0] andPostFetchingPredicate:0 withQueue:0];
    v34 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v31 = v18;
    v19 = [v18 recentCalls];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      int v23 = *MEMORY[0x1E4F57CB0];
      int v24 = *MEMORY[0x1E4F57CC0];
      int v36 = *MEMORY[0x1E4F57CB8];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          int v27 = [v26 callStatus];
          if ((a4 || (v23 & v27) == 0) && (a5 || (v24 & v27) == 0) && (!v37 || (v36 & v27) != 0))
          {
            v28 = [v26 date];

            if (v28)
            {
              v29 = [(ATXCallHistoryDataSource *)self _dictForCall:v26];
              if (v29) {
                [v34 addObject:v29];
              }
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v21);
    }

    v30 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[ATXCallHistoryDataSource callNewerThan:showIncoming:showOutgoing:missedOnly:callback:](v34, v30);
    }

    id v10 = v33;
    (*((void (**)(id, void *, void))v33 + 2))(v33, v34, 0);
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, MEMORY[0x1E4F1CBF0], 0);
  }
}

- (ATXCallHistoryDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCallHistoryDataSource;
  v6 = [(ATXCallHistoryDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)_dictForCall:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [v4 localParticipantUUID];
  v7 = [v6 UUIDString];
  [v5 setObject:v7 forKeyedSubscript:@"localParticipantUUID"];

  v8 = [v4 uniqueId];
  [v5 setObject:v8 forKeyedSubscript:@"uniqueId"];

  int v9 = [v4 callStatus];
  id v10 = objc_opt_new();
  double v11 = v10;
  if ((*MEMORY[0x1E4F57CB0] & v9) != 0) {
    [v10 addObject:@"incoming"];
  }
  if ((*MEMORY[0x1E4F57CC0] & v9) != 0) {
    [v11 addObject:@"outgoing"];
  }
  int v12 = *MEMORY[0x1E4F57CB8];
  if ((*MEMORY[0x1E4F57CB8] & v9) != 0) {
    [v11 addObject:@"missed"];
  }
  v13 = (void *)[v11 copy];

  [v5 setObject:v13 forKeyedSubscript:@"callStatus"];
  v14 = NSNumber;
  v15 = [v4 date];
  [v15 timeIntervalSinceReferenceDate];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
  [v5 setObject:v16 forKeyedSubscript:@"date"];

  id v17 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(v4, "callStatus") & v12) != 0);
  [v5 setObject:v17 forKeyedSubscript:@"missed"];

  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "unreadCount"));
  [v5 setObject:v18 forKeyedSubscript:@"unreadCount"];

  v19 = [v4 contactIdentifier];
  [v5 setObject:v19 forKeyedSubscript:@"contactIdentifier"];

  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "mediaType"));
  [v5 setObject:v20 forKeyedSubscript:@"mediaType"];

  uint64_t v21 = [v4 callerNameForDisplay];
  [v5 setObject:v21 forKeyedSubscript:@"callerNameForDisplay"];

  uint64_t v22 = [v4 serviceProvider];
  [v5 setObject:v22 forKeyedSubscript:@"serviceProvider"];

  [v5 setObject:v4 forKeyedSubscript:@"CHRecentCall"];
  int v23 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  int v24 = objc_msgSend(v4, "remoteParticipantHandles", 0);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [(ATXCallHistoryDataSource *)self _dictForHandle:*(void *)(*((void *)&v31 + 1) + 8 * i)];
        if (v29) {
          [v23 addObject:v29];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v26);
  }

  [v5 setObject:v23 forKeyedSubscript:@"remoteParticipantHandles"];

  return v5;
}

- (id)_dictForHandle:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v9[0] = @"type";
    id v3 = a3;
    uint64_t v4 = [v3 type];
    if ((unint64_t)(v4 - 1) > 2) {
      id v5 = @"unknown";
    }
    else {
      id v5 = off_1E68A53D0[v4 - 1];
    }
    v10[0] = v5;
    v9[1] = @"value";
    v7 = [v3 value];

    v10[1] = v7;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (void)callNewerThan:(void *)a1 showIncoming:(NSObject *)a2 showOutgoing:missedOnly:callback:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "Found %lu call(s) for query", (uint8_t *)&v3, 0xCu);
}

- (void)callNewerThan:(os_log_t)log showIncoming:(double)a2 showOutgoing:missedOnly:callback:.cold.2(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 1024;
  int v5 = 7776000;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "maxAge %f too big; maximum is %i",
    (uint8_t *)&v2,
    0x12u);
}

@end