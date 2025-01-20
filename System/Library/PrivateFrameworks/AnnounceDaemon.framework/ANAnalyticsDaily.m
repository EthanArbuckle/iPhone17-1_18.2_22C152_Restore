@interface ANAnalyticsDaily
- (ANAnalyticsDaily)init;
- (ANAnalyticsDaily)initWithBackgroundActivity:(id)a3 defaults:(id)a4 homesProvider:(id)a5 messagingConnection:(id)a6;
- (ANAnalyticsDailyDelegate)delegate;
- (ANAnalyticsDailyHomesProvider)homesProvider;
- (ANAnalyticsDailyMessagingProtocol)messagingConnection;
- (ANAnalyticsStorage)eventStorage;
- (ANBackgroundActivityProtocol)backgroundActivity;
- (ANDefaultsProtocol)defaults;
- (BOOL)_isCoordinationDevice;
- (id)_dailyResponse;
- (id)_stringForDeferredResult:(int64_t)a3;
- (void)_cleanup;
- (void)_collectForAnnounce:(id)a3;
- (void)_collectForAnnouncementsInHome:(id)a3 completion:(id)a4;
- (void)_collectForHome:(id)a3 homes:(id)a4;
- (void)_collectPayload:(id)a3;
- (void)_executeBackgroundActivity:(id)a3;
- (void)_recordExecutionTime;
- (void)_registerRapportDailyRequest;
- (void)_reportEventStorage;
- (void)_resetDailyAnnouncements;
- (void)announcementSent:(id)a3 inHome:(id)a4;
- (void)recordReachableHomes:(id)a3;
- (void)setBackgroundActivity:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomesProvider:(id)a3;
- (void)setMessagingConnection:(id)a3;
- (void)start;
@end

@implementation ANAnalyticsDaily

- (ANAnalyticsDaily)init
{
  v3 = objc_alloc_init(ANBackgroundActivity);
  v4 = [MEMORY[0x1E4F4A8E0] sharedInstance];
  v5 = +[ANHomeManager shared];
  v6 = objc_alloc_init(ANAnalyticsDailyMessaging);
  v7 = [(ANAnalyticsDaily *)self initWithBackgroundActivity:v3 defaults:v4 homesProvider:v5 messagingConnection:v6];

  return v7;
}

- (ANAnalyticsDaily)initWithBackgroundActivity:(id)a3 defaults:(id)a4 homesProvider:(id)a5 messagingConnection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ANAnalyticsDaily;
  v15 = [(ANAnalyticsDaily *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_backgroundActivity, a3);
    objc_storeStrong((id *)&v16->_defaults, a4);
    uint64_t v17 = objc_opt_new();
    eventStorage = v16->_eventStorage;
    v16->_eventStorage = (ANAnalyticsStorage *)v17;

    objc_storeStrong((id *)&v16->_homesProvider, a5);
    objc_storeStrong((id *)&v16->_messagingConnection, a6);
  }

  return v16;
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(ANAnalyticsDaily *)self defaults];
  char v4 = [v3 BOOLForDefault:*MEMORY[0x1E4F4A588]];

  v5 = ANLogHandleAnalyticsDaily();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v11 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily starting.", buf, 0xCu);
    }

    [(ANAnalyticsDaily *)self _registerRapportDailyRequest];
    objc_initWeak((id *)buf, self);
    v7 = [(ANAnalyticsDaily *)self backgroundActivity];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __25__ANAnalyticsDaily_start__block_invoke;
    v8[3] = &unk_1E6BCE850;
    objc_copyWeak(&v9, (id *)buf);
    [v7 scheduleWithBlock:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      id v11 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily events disabled.", buf, 0xCu);
    }
  }
}

void __25__ANAnalyticsDaily_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = ANLogHandleAnalyticsDaily();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily executing.", buf, 0xCu);
  }

  v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _recordExecutionTime];

  id v7 = objc_loadWeakRetained(v5);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __25__ANAnalyticsDaily_start__block_invoke_5;
  v9[3] = &unk_1E6BCE828;
  id v10 = v3;
  id v8 = v3;
  [v7 _executeBackgroundActivity:v9];
}

uint64_t __25__ANAnalyticsDaily_start__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)recordReachableHomes:(id)a3
{
  id v4 = a3;
  id v5 = [(ANAnalyticsDaily *)self eventStorage];
  [v5 save:@"reachableHome" counter:v4];
}

- (void)_recordExecutionTime
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANAnalyticsDaily *)self defaults];
  uint64_t v4 = *MEMORY[0x1E4F4A590];
  id v5 = [v3 numberForDefault:*MEMORY[0x1E4F4A590]];

  BOOL v6 = NSNumber;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  id v8 = objc_msgSend(v6, "numberWithDouble:");

  [v8 doubleValue];
  double v10 = v9;
  [v5 doubleValue];
  double v12 = v10 - v11;
  [v5 doubleValue];
  double v14 = v13;
  v15 = ANLogHandleAnalyticsDaily();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 == 0.0)
  {
    if (v16)
    {
      int v19 = 138412546;
      objc_super v20 = &stru_1F34A0E10;
      __int16 v21 = 2048;
      double v22 = v12;
      uint64_t v17 = "%@AnalyticsDaily first scheduled background activity at: %f";
LABEL_6:
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 0x16u);
    }
  }
  else if (v16)
  {
    int v19 = 138412546;
    objc_super v20 = &stru_1F34A0E10;
    __int16 v21 = 2048;
    double v22 = v12;
    uint64_t v17 = "%@AnalyticsDaily time since last scheduled background activity: %f";
    goto LABEL_6;
  }

  v18 = [(ANAnalyticsDaily *)self defaults];
  [v18 setNumber:v8 forDefault:v4];
}

- (void)_executeBackgroundActivity:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = ANLogHandleAnalyticsDaily();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v11 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily collecting.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ANAnalyticsDaily__executeBackgroundActivity___block_invoke;
  v7[3] = &unk_1E6BCE878;
  objc_copyWeak(&v9, (id *)buf);
  id v6 = v4;
  id v8 = v6;
  [(ANAnalyticsDaily *)self _collectPayload:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

uint64_t __47__ANAnalyticsDaily__executeBackgroundActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = ANLogHandleAnalyticsDaily();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
      {
        double v11 = NSString;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        id v5 = [WeakRetained _stringForDeferredResult:a4];
        uint64_t v12 = [v11 stringWithFormat:@"deferred: %@", v5];
      }
      else
      {
        uint64_t v12 = @"completed";
      }
      *(_DWORD *)buf = 138412546;
      double v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily %@.", buf, 0x16u);
      if (a4)
      {
      }
    }
  }
  double v13 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v13 forKeyedSubscript:@"deferred"];

  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = [v14 delegate];
  [v15 dailyReport:@"dailystate" withPayload:v8];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  [v16 _reportEventStorage];

  id v17 = objc_loadWeakRetained((id *)(a1 + 40));
  v18 = [v17 delegate];
  [v18 dailyReportComplete];

  id v19 = objc_loadWeakRetained((id *)(a1 + 40));
  [v19 _cleanup];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_collectPayload:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, uint64_t))a3;
  id v5 = objc_opt_new();
  id v6 = [(ANAnalyticsDaily *)self homesProvider];
  id v7 = [v6 homes];
  id v8 = (void *)[v7 copy];

  id v9 = [(ANAnalyticsDaily *)self backgroundActivity];
  LODWORD(v7) = [v9 shouldDefer];

  if (v7)
  {
    v4[2](v4, v5, 2, 1);
  }
  else
  {
    [(ANAnalyticsDaily *)self _collectForAnnounce:v5];
    double v10 = [(ANAnalyticsDaily *)self backgroundActivity];
    int v11 = [v10 shouldDefer];

    if (v11)
    {
      v4[2](v4, v5, 2, 2);
    }
    else
    {
      [(ANAnalyticsDaily *)self _collectForHome:v5 homes:v8];
      uint64_t v12 = [(ANAnalyticsDaily *)self backgroundActivity];
      int v13 = [v12 shouldDefer];

      if (v13)
      {
        v4[2](v4, v5, 2, 3);
      }
      else
      {
        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __36__ANAnalyticsDaily__collectPayload___block_invoke;
        v14[3] = &unk_1E6BCE8A0;
        objc_copyWeak(&v17, &location);
        id v16 = v4;
        id v15 = v5;
        [(ANAnalyticsDaily *)self _collectForAnnouncementsInHome:v15 completion:v14];

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
    }
  }
}

uint64_t __36__ANAnalyticsDaily__collectPayload___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained backgroundActivity];
  [v3 shouldDefer];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (id)_stringForDeferredResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"None";
  }
  else {
    return off_1E6BCE910[a3 - 1];
  }
}

- (void)_reportEventStorage
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(ANAnalyticsDaily *)self eventStorage];
  id v4 = [v3 eventsToReport];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v20 = *(void *)v29;
    __int16 v21 = v4;
    do
    {
      uint64_t v8 = 0;
      uint64_t v22 = v6;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v28 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isEqualToString:", @"reachableHome", v20, v21))
        {
          double v10 = [ANAnalyticsCounter alloc];
          int v11 = [v4 objectForKeyedSubscript:v9];
          uint64_t v12 = -[ANAnalyticsCounter initWithHexCount:](v10, "initWithHexCount:", [v11 unsignedLongLongValue]);

          int v13 = [(ANAnalyticsCounter *)v12 payload:@"home" keyTwo:@"rooms"];
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
                id v19 = [(ANAnalyticsDaily *)self delegate];
                [v19 dailyReport:v9 withPayload:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
            uint64_t v7 = v20;
            id v4 = v21;
            uint64_t v6 = v22;
          }
        }
        else
        {
          uint64_t v12 = [(ANAnalyticsDaily *)self delegate];
          int v13 = [v4 objectForKeyedSubscript:v9];
          [(ANAnalyticsCounter *)v12 dailyReport:v9 withPayload:v13];
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
}

- (void)_cleanup
{
  id v2 = [(ANAnalyticsDaily *)self eventStorage];
  [v2 erase];
}

- (void)_collectForAnnounce:(id)a3
{
  id v3 = NSNumber;
  id v4 = (void *)MEMORY[0x1E4F4A898];
  id v5 = a3;
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAnnounceEnabled"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v6 forKeyedSubscript:@"enabled"];
}

- (void)_collectForHome:(id)a3 homes:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a4;
  uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  if (v37)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v36 = *(void *)v41;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v41 != v36) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      int v11 = [(ANAnalyticsDaily *)self backgroundActivity];
      char v12 = [v11 shouldDefer];

      if (v12) {
        goto LABEL_18;
      }
      uint64_t v39 = v7;
      uint64_t v13 = v6;
      uint64_t v14 = v5;
      unsigned int v15 = objc_msgSend(v10, "hmu_isCurrentUserAdministrator");
      unsigned int v16 = objc_msgSend(v10, "hmu_isCurrentUserOwner");
      unsigned int v17 = objc_msgSend(v10, "hmu_isRemoteAccessAllowedForCurrentUser");
      uint64_t v18 = [v10 currentUser];
      id v19 = [v18 announceUserSettings];
      uint64_t v20 = [v19 deviceNotificationMode];

      if (v20 == 1)
      {
        ++v33;
        uint64_t v21 = v14;
      }
      else
      {
        uint64_t v21 = v14;
        if (v20 != 2)
        {
          uint64_t v22 = v13;
          if (v20 == 3) {
            ++v32;
          }
          goto LABEL_14;
        }
        ++v34;
      }
      uint64_t v22 = v13;
LABEL_14:
      v8 += v15;
      uint64_t v7 = v39 + v16;
      uint64_t v6 = v22 + (v15 ^ 1);
      ++v9;
      uint64_t v5 = v21 + v17;
      if (v37 == v9)
      {
        uint64_t v37 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v37) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
LABEL_18:

  __int16 v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
  [v31 setObject:v23 forKeyedSubscript:@"homes"];

  long long v24 = [NSNumber numberWithUnsignedInteger:v8];
  [v31 setObject:v24 forKeyedSubscript:@"homesAsAdmin"];

  long long v25 = [NSNumber numberWithUnsignedInteger:v7];
  [v31 setObject:v25 forKeyedSubscript:@"homesAsOwner"];

  long long v26 = [NSNumber numberWithUnsignedInteger:v6];
  [v31 setObject:v26 forKeyedSubscript:@"homesAsSharedUser"];

  long long v27 = [NSNumber numberWithUnsignedInteger:v5];
  [v31 setObject:v27 forKeyedSubscript:@"homesWithRemoteAccess"];

  long long v28 = [NSNumber numberWithUnsignedInteger:v32];
  [v31 setObject:v28 forKeyedSubscript:@"deliveriesSetToAnywhere"];

  long long v29 = [NSNumber numberWithUnsignedInteger:v33];
  [v31 setObject:v29 forKeyedSubscript:@"deliveriesSetToNever"];

  long long v30 = [NSNumber numberWithUnsignedInteger:v34];
  [v31 setObject:v30 forKeyedSubscript:@"deliveriesSetToWhenHome"];
}

- (void)_collectForAnnouncementsInHome:(id)a3 completion:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if (![(ANAnalyticsDaily *)self _isCoordinationDevice])
  {
    double v10 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = &stru_1F34A0E10;
      uint64_t v33 = "%@AnalyticsDaily ignoring collection for announcements in home. This device is not included in daily events coordination.";
LABEL_18:
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, v33, buf, 0xCu);
    }
LABEL_19:

    v7[2](v7);
    goto LABEL_24;
  }
  uint64_t v8 = [(ANAnalyticsDaily *)self messagingConnection];
  char v9 = [v8 isDeviceAnalyticsCoordinator];

  double v10 = ANLogHandleAnalyticsDaily();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v61 = &stru_1F34A0E10;
      uint64_t v33 = "%@AnalyticsDaily ignoring collection for announcements in home. This HomePod was not elected.";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v38 = v6;
  if (v11)
  {
    *(_DWORD *)buf = 138412290;
    v61 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily this HomePod was elected.", buf, 0xCu);
  }

  char v12 = dispatch_group_create();
  uint64_t v39 = objc_opt_new();
  uint64_t v13 = [(ANAnalyticsDaily *)self defaults];
  uint64_t v14 = [v13 objectForDefault:*MEMORY[0x1E4F4A618]];

  unsigned int v15 = [[ANAnalyticsDailyAnnouncements alloc] initWithDictionary:v14];
  if ([(ANAnalyticsDailyAnnouncements *)v15 shouldReport])
  {
    uint64_t v36 = v14;
    uint64_t v37 = v7;
    unsigned int v16 = self;
    unsigned int v17 = [(ANAnalyticsDaily *)self messagingConnection];
    uint64_t v18 = [v17 devicesCountingAnnouncements];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v56 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          dispatch_group_enter(v12);
          long long v25 = [(ANAnalyticsDaily *)v16 messagingConnection];
          long long v26 = [v19 objectForKeyedSubscript:v24];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke;
          v51[3] = &unk_1E6BCE8C8;
          id v52 = v39;
          v53 = v15;
          v54 = v12;
          [v25 sendDailyRequest:v26 handler:v51];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v21);
    }

    objc_initWeak((id *)buf, v16);
    v35 = dispatch_get_global_queue(9, 0);
    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v35);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_2;
    aBlock[3] = &unk_1E6BCE7E0;
    dispatch_source_t v47 = v27;
    id v6 = v38;
    id v48 = v38;
    v49 = v15;
    uint64_t v7 = v37;
    v50 = v37;
    long long v28 = v27;
    long long v29 = _Block_copy(aBlock);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_3;
    block[3] = &unk_1E6BCE190;
    objc_copyWeak(&v45, (id *)buf);
    id v30 = v29;
    id v44 = v30;
    dispatch_group_notify(v12, v35, block);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_88;
    handler[3] = &unk_1E6BCE190;
    objc_copyWeak(&v42, (id *)buf);
    id v41 = v30;
    id v31 = v30;
    dispatch_source_set_event_handler(v28, handler);
    dispatch_time_t v32 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v28, v32, 0x77359400uLL, 0);
    dispatch_resume(v28);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v45);

    objc_destroyWeak((id *)buf);
    uint64_t v14 = v36;
  }
  else
  {
    uint64_t v34 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v34, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily not reporting for announcements in home since last report was too recent.", buf, 0xCu);
    }

    v7[2](v7);
    id v6 = v38;
  }

LABEL_24:
}

void __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ANAnalyticsDailyAnnouncements alloc] initWithDictionary:v3];

  [*(id *)(a1 + 32) lock];
  [*(id *)(a1 + 40) merge:v4];
  [*(id *)(a1 + 32) unlock];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

intptr_t __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  intptr_t result = dispatch_source_testcancel(v2);
  if (!result)
  {
    dispatch_source_cancel(v2);
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "announcementsCount"));
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"homeAnnouncements"];

    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "homesCount"));
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:@"homesUsingAnnounce"];

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v6();
  }
  return result;
}

uint64_t __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _resetDailyAnnouncements];

  id v3 = ANLogHandleAnalyticsDaily();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v3, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily completed collecting announcements made in home.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__ANAnalyticsDaily__collectForAnnouncementsInHome_completion___block_invoke_88(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained backgroundActivity];
  int v4 = [v3 shouldDefer];

  if (v4)
  {
    int v5 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily should defer while collecting announcements in home.", (uint8_t *)&v6, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)announcementSent:(id)a3 inHome:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(ANAnalyticsDaily *)self _isCoordinationDevice])
  {
    uint64_t v8 = [(ANAnalyticsDaily *)self defaults];
    uint64_t v9 = *MEMORY[0x1E4F4A618];
    double v10 = [v8 objectForDefault:*MEMORY[0x1E4F4A618]];

    BOOL v11 = [[ANAnalyticsDailyAnnouncements alloc] initWithDictionary:v10];
    char v12 = [v6 groupID];
    [(ANAnalyticsDailyAnnouncements *)v11 incrementCountInHome:v7 group:v12];

    uint64_t v13 = [(ANAnalyticsDaily *)self defaults];
    uint64_t v14 = [(ANAnalyticsDailyAnnouncements *)v11 dictionary];
    [v13 setObject:v14 forDefault:v9];
  }
  else
  {
    unsigned int v15 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      unsigned int v17 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v15, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily ignoring tracking of announcements sent. This device is not included in daily events coordination.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_registerRapportDailyRequest
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if ([(ANAnalyticsDaily *)self _isCoordinationDevice])
  {
    objc_initWeak(location, self);
    id v3 = [(ANAnalyticsDaily *)self messagingConnection];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__ANAnalyticsDaily__registerRapportDailyRequest__block_invoke;
    v5[3] = &unk_1E6BCE8F0;
    objc_copyWeak(&v6, location);
    [v3 registerDailyRequest:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    int v4 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily ignoring registration for rapport activation. This device is not included in daily events coordination.", (uint8_t *)location, 0xCu);
    }
  }
}

id __48__ANAnalyticsDaily__registerRapportDailyRequest__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    int v4 = [v3 _dailyResponse];
  }
  else
  {
    int v5 = ANLogHandleAnalyticsDaily();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v5, OS_LOG_TYPE_DEFAULT, "%@AnalyticsDaily lost reference count for self on daily request registration.", (uint8_t *)&v7, 0xCu);
    }

    int v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

- (id)_dailyResponse
{
  id v3 = [(ANAnalyticsDaily *)self defaults];
  int v4 = [v3 objectForDefault:*MEMORY[0x1E4F4A618]];

  int v5 = [[ANAnalyticsDailyAnnouncements alloc] initWithDictionary:v4];
  [(ANAnalyticsDaily *)self _resetDailyAnnouncements];
  id v6 = [(ANAnalyticsDailyAnnouncements *)v5 dictionary];

  return v6;
}

- (void)_resetDailyAnnouncements
{
  id v3 = [ANAnalyticsDailyAnnouncements alloc];
  int v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSince1970];
  int v7 = -[ANAnalyticsDailyAnnouncements initWithLastAccess:](v3, "initWithLastAccess:");

  int v5 = [(ANAnalyticsDaily *)self defaults];
  id v6 = [(ANAnalyticsDailyAnnouncements *)v7 dictionary];
  [v5 setObject:v6 forDefault:*MEMORY[0x1E4F4A618]];
}

- (BOOL)_isCoordinationDevice
{
  return 0;
}

- (ANAnalyticsDailyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (ANAnalyticsDailyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ANBackgroundActivityProtocol)backgroundActivity
{
  return self->_backgroundActivity;
}

- (void)setBackgroundActivity:(id)a3
{
}

- (ANDefaultsProtocol)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (ANAnalyticsStorage)eventStorage
{
  return self->_eventStorage;
}

- (ANAnalyticsDailyHomesProvider)homesProvider
{
  return self->_homesProvider;
}

- (void)setHomesProvider:(id)a3
{
}

- (ANAnalyticsDailyMessagingProtocol)messagingConnection
{
  return self->_messagingConnection;
}

- (void)setMessagingConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingConnection, 0);
  objc_storeStrong((id *)&self->_homesProvider, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_backgroundActivity, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end