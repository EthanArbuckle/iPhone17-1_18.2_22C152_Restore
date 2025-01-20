@interface _DASWidgetRefreshScheduler
+ (id)sharedScheduler;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_CDContextualKeyPath)widgetOverrideKeypath;
- (_CDLocalContext)context;
- (_DASScheduler)dasScheduler;
- (_DASWidgetRefreshScheduler)init;
- (_DKKnowledgeSaving)store;
- (id)createRefreshActivityForWidgetBudgetID:(id)a3 containingAppID:(id)a4 refreshAfter:(id)a5 refreshBefore:(id)a6 widgetInfo:(id)a7 refreshHandler:(id)a8;
- (id)createRefreshActivityWithRateLimitConfigurationName:(id)a3 forWidgetBudgetID:(id)a4 withRemoteDeviceID:(id)a5 containingAppID:(id)a6 refreshAfter:(id)a7 refreshBefore:(id)a8 widgetInfo:(id)a9 refreshHandler:(id)a10;
- (id)createRefreshActivityWithWidgetParameters:(id)a3;
- (id)createRefreshActivityWithWidgetParameters:(id)a3 refreshHandler:(id)a4;
- (id)createRefreshActivityWithWidgetParameters:(id)a3 withRefreshHandler:(id)a4;
- (id)decrementBudgetForWidgetID:(id)a3 by:(double)a4;
- (void)cancelActivity:(id)a3;
- (void)createRateLimitConfigurationWithName:(id)a3 rateLimits:(id)a4;
- (void)recordWidgetRefreshes:(id)a3;
- (void)recordWidgetViews:(id)a3;
- (void)setBudget:(id)a3;
- (void)setContext:(id)a3;
- (void)setDasScheduler:(id)a3;
- (void)setLog:(id)a3;
- (void)setOverridesForWidgetBudgetIDs:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)setSystemAddedWidgetBudgetIDs:(id)a3;
- (void)setWidgetOverrideKeypath:(id)a3;
- (void)submitRefreshActivity:(id)a3;
@end

@implementation _DASWidgetRefreshScheduler

- (_DASWidgetRefreshScheduler)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASWidgetRefreshScheduler;
  v2 = [(_DASWidgetRefreshScheduler *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.das.widgetRefreshScheduler", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    os_log_t v7 = os_log_create("com.apple.duetactivityscheduler", "widgetRefreshScheduler");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    uint64_t v9 = +[_DASScheduler sharedScheduler];
    dasScheduler = v2->_dasScheduler;
    v2->_dasScheduler = (_DASScheduler *)v9;

    uint64_t v11 = [MEMORY[0x1E4F5B568] knowledgeStoreWithDirectReadWriteAccess];
    store = v2->_store;
    v2->_store = (_DKKnowledgeSaving *)v11;

    uint64_t v13 = [MEMORY[0x1E4F5B6A0] userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v13;

    uint64_t v15 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:@"/dasd/widgetOverride"];
    widgetOverrideKeypath = v2->_widgetOverrideKeypath;
    v2->_widgetOverrideKeypath = (_CDContextualKeyPath *)v15;
  }
  return v2;
}

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedScheduler_widgetScheduler;

  return v2;
}

- (void)recordWidgetViews:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v38 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v3;
  uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v44 != v40) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v5 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v6 = [v5 budgetID];

        if (v6)
        {
          os_log_t v7 = [(_DASWidgetRefreshScheduler *)self log];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            -[_DASWidgetRefreshScheduler recordWidgetViews:](v49, v5, &v50, v7);
          }

          v8 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v9 = [v5 viewID];
          [v8 setObject:v9 forKeyedSubscript:@"viewID"];

          v10 = [v5 extensionBundleID];
          [v8 setObject:v10 forKeyedSubscript:@"extensionBundle"];

          uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "pageID"));
          [v8 setObject:v11 forKeyedSubscript:@"pageID"];

          v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "inStack"));
          [v8 setObject:v12 forKeyedSubscript:@"inStack"];

          uint64_t v13 = NSNumber;
          [v5 timeUntilContentExpiration];
          LODWORD(v15) = llround(v14);
          v16 = [v13 numberWithInt:v15];
          [v8 setObject:v16 forKeyedSubscript:@"expirationDelta"];

          v17 = (void *)MEMORY[0x1E4F5B508];
          objc_super v18 = [MEMORY[0x1E4F5B528] eventStreamWithName:@"/dasd/widgetView"];
          v19 = [v5 startDate];
          v20 = [v5 endDate];
          v21 = [v5 budgetID];
          v22 = [v17 eventWithStream:v18 startDate:v19 endDate:v20 identifierStringValue:v21 metadata:v8];

          [v38 addObject:v22];
          [v5 timeUntilContentExpiration];
          v24 = @"viewed_fresh";
          if ((llround(v23) & 0x80000000) != 0) {
            v24 = @"viewed_stale";
          }
          v48[0] = v24;
          v47[0] = @"metricKey";
          v47[1] = @"metricValue";
          v25 = NSNumber;
          [v5 timeUntilContentExpiration];
          LODWORD(v27) = llround(v26);
          v28 = [v25 numberWithInt:v27];
          v48[1] = v28;
          v47[2] = @"widgetID";
          v29 = NSString;
          v30 = [v5 budgetID];
          v31 = objc_msgSend(v29, "stringWithFormat:", @"%lul", objc_msgSend(v30, "hash"));
          v48[2] = v31;
          v47[3] = @"page";
          v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "pageID"));
          v48[3] = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];

          v42[5] = MEMORY[0x1E4F143A8];
          v42[6] = 3221225472;
          v42[7] = __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke;
          v42[8] = &unk_1E6112C48;
          v42[9] = v33;
          id v34 = v33;
          AnalyticsSendEventLazy();
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v41);
  }

  v35 = [(_DASWidgetRefreshScheduler *)self store];
  queue = self->_queue;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2;
  v42[3] = &unk_1E6112C70;
  v42[4] = self;
  [v35 saveObjects:v38 responseQueue:queue withCompletion:v42];
}

- (void)recordWidgetRefreshes:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v34 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v3;
  uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v36)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obj);
        }
        dispatch_queue_t v5 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v6 = [v5 budgetID];

        if (v6)
        {
          os_log_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
          v8 = [v5 extensionBundleID];
          [v7 setObject:v8 forKeyedSubscript:@"extensionBundle"];

          uint64_t v9 = [v5 refreshReason];
          [v7 setObject:v9 forKeyedSubscript:@"refreshReason"];

          v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isDASInitiated"));
          [v7 setObject:v10 forKeyedSubscript:@"isDASInitiated"];

          uint64_t v11 = (void *)MEMORY[0x1E4F5B508];
          v12 = [MEMORY[0x1E4F5B528] eventStreamWithName:@"/dasd/widgetRefresh"];
          uint64_t v13 = [v5 refreshDate];
          double v14 = [v5 refreshDate];
          uint64_t v15 = [v5 budgetID];
          v16 = [v11 eventWithStream:v12 startDate:v13 endDate:v14 identifierStringValue:v15 metadata:v7];

          [v34 addObject:v16];
          v17 = @"refreshed_notDAS";
          if ([v5 isDASInitiated])
          {
            objc_super v18 = [(_DASWidgetRefreshScheduler *)self context];
            v19 = [v18 objectForKeyedSubscript:self->_widgetOverrideKeypath];

            v20 = [v5 budgetID];
            v17 = @"refreshed_DAS_override";
            if (([v19 containsObject:v20] & 1) == 0)
            {
              v21 = [(_DASWidgetRefreshScheduler *)self context];
              v22 = [MEMORY[0x1E4F5B6B0] keyPathForPluginStatus];
              double v23 = [v21 objectForKeyedSubscript:v22];
              int v24 = [v23 BOOLValue];

              if (v24) {
                v17 = @"refreshed_DAS_pluggedIn";
              }
              else {
                v17 = @"refreshed_DAS";
              }
            }
          }
          v42[0] = @"metricKey";
          v42[1] = @"metricValue";
          v43[0] = v17;
          v43[1] = &unk_1F0E6EC50;
          v42[2] = @"widgetID";
          v25 = NSString;
          double v26 = [v5 budgetID];
          uint64_t v27 = objc_msgSend(v25, "stringWithFormat:", @"%llu", objc_msgSend(v26, "hash"));
          v42[3] = @"page";
          v43[2] = v27;
          v43[3] = &unk_1F0E6EC68;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:4];

          v37[5] = MEMORY[0x1E4F143A8];
          v37[6] = 3221225472;
          v37[7] = __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke;
          v37[8] = &unk_1E6112C48;
          v37[9] = v28;
          id v29 = v28;
          AnalyticsSendEventLazy();
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v36);
  }

  v30 = [(_DASWidgetRefreshScheduler *)self store];
  queue = self->_queue;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2;
  v37[3] = &unk_1E6112C70;
  v37[4] = self;
  [v30 saveObjects:v34 responseQueue:queue withCompletion:v37];
}

- (void)setBudget:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40___DASWidgetRefreshScheduler_setBudget___block_invoke;
  v7[3] = &unk_1E6112B60;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setOverridesForWidgetBudgetIDs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61___DASWidgetRefreshScheduler_setOverridesForWidgetBudgetIDs___block_invoke;
  v7[3] = &unk_1E6112B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)decrementBudgetForWidgetID:(id)a3 by:(double)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(_DASScheduler *)self->_dasScheduler allBudgets];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v25 = self;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 objectForKeyedSubscript:@"name"];
        double v14 = [v12 objectForKeyedSubscript:@"balance"];
        [v14 doubleValue];
        double v16 = v15;

        if ([v13 containsString:v6])
        {
          v17 = objc_alloc_init(_DASWigetBudgetDecrementRequestResult);
          [(_DASWigetBudgetDecrementRequestResult *)v17 setWidgetBudgetID:v6];
          if (v16 <= 0.0)
          {
            v21 = NSNumber;
            double v22 = v16;
          }
          else
          {
            [(_DASScheduler *)v25->_dasScheduler decrementBy:v13 forBudgetWithName:a4];
            objc_super v18 = [(_DASWidgetRefreshScheduler *)v25 log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [v12 objectForKeyedSubscript:@"capacity"];
              v20 = [v12 objectForKeyedSubscript:@"balance"];
              *(_DWORD *)buf = 138413058;
              v31 = v13;
              __int16 v32 = 2112;
              v33 = v19;
              __int16 v34 = 2112;
              uint64_t v35 = v20;
              __int16 v36 = 2048;
              double v37 = a4;
              _os_log_impl(&dword_1B578B000, v18, OS_LOG_TYPE_DEFAULT, "Decremented budget %@ with capacity %@ and balance %@ by %f", buf, 0x2Au);
            }
            v21 = NSNumber;
            double v22 = v16 - a4;
          }
          double v23 = [v21 numberWithDouble:v22];
          [(_DASWigetBudgetDecrementRequestResult *)v17 setBalance:v23];

          [(_DASWigetBudgetDecrementRequestResult *)v17 setSuccessful:v16 > 0.0];
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (void)setSystemAddedWidgetBudgetIDs:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___DASWidgetRefreshScheduler_setSystemAddedWidgetBudgetIDs___block_invoke;
  v7[3] = &unk_1E6112B60;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)createRefreshActivityForWidgetBudgetID:(id)a3 containingAppID:(id)a4 refreshAfter:(id)a5 refreshBefore:(id)a6 widgetInfo:(id)a7 refreshHandler:(id)a8
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  objc_super v18 = [v16 dateByAddingTimeInterval:900.0];
  v19 = [v15 laterDate:v18];

  v20 = [NSString stringWithFormat:@"com.apple.widget.%@", v13];
  v21 = +[_DASActivity activityWithName:v20 priority:_DASSchedulingPriorityUtility duration:_DASActivityDurationShort startingAfter:v16 startingBefore:v19];

  [v21 setWidgetBudgetID:v13];
  v30[0] = v17;
  double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v21 setRelatedApplications:v22];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke;
  v27[3] = &unk_1E6112C98;
  id v28 = v13;
  id v29 = v14;
  v27[4] = self;
  id v23 = v13;
  id v24 = v14;
  [v21 setStartHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308;
  v26[3] = &unk_1E6112CC0;
  v26[4] = self;
  [v21 setSuspendHandler:v26];

  return v21;
}

- (id)createRefreshActivityWithRateLimitConfigurationName:(id)a3 forWidgetBudgetID:(id)a4 withRemoteDeviceID:(id)a5 containingAppID:(id)a6 refreshAfter:(id)a7 refreshBefore:(id)a8 widgetInfo:(id)a9 refreshHandler:(id)a10
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = v22;
  if (v16 || v17 || v18)
  {
    uint64_t v35 = v22;
    id v26 = v19;
    long long v27 = [v20 dateByAddingTimeInterval:900.0];
    id v36 = v21;
    id v24 = [v21 laterDate:v27];

    id v28 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple."];
    id v29 = v28;
    if (v18) {
      v30 = @"remotewidget";
    }
    else {
      v30 = @"widget";
    }
    [v28 appendString:v30];
    if (v17)
    {
      v31 = [NSString stringWithFormat:@".%@", v17];
      [v29 appendString:v31];
    }
    __int16 v32 = [NSString stringWithString:v29];
    v25 = +[_DASActivity activityWithName:v32 priority:_DASSchedulingPriorityUtility duration:_DASActivityDurationShort startingAfter:v20 startingBefore:v24];

    if (v16) {
      [v25 setRateLimitConfigurationName:v16];
    }
    if (v17) {
      [v25 setWidgetBudgetID:v17];
    }
    if (v18)
    {
      [v25 setRemoteDevice:v18];
      [v25 setTargetDevice:3];
    }
    v42[0] = v26;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v25 setRelatedApplications:v33];

    id v19 = v26;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke;
    v38[3] = &unk_1E6112CE8;
    v38[4] = self;
    id v39 = v17;
    id v40 = v16;
    id v23 = v35;
    id v41 = v35;
    [v25 setStartHandler:v38];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_325;
    v37[3] = &unk_1E6112CC0;
    v37[4] = self;
    [v25 setSuspendHandler:v37];

    id v21 = v36;
  }
  else
  {
    id v24 = [(_DASWidgetRefreshScheduler *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_DASWidgetRefreshScheduler createRefreshActivityWithRateLimitConfigurationName:forWidgetBudgetID:withRemoteDeviceID:containingAppID:refreshAfter:refreshBefore:widgetInfo:refreshHandler:](v24);
    }
    v25 = 0;
  }

  return v25;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = [v4 widgetBudgetIdentifier];
  if (v5 || ([v4 remoteDeviceIdentifier], (dispatch_queue_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v6 = [v4 refreshBeforeDate];
    id v7 = [v4 refreshAfterDate];
    id v8 = [v7 dateByAddingTimeInterval:900.0];
    uint64_t v9 = [v6 laterDate:v8];

    uint64_t v10 = [MEMORY[0x1E4F28E78] stringWithString:@"com.apple."];
    uint64_t v11 = [v4 remoteDeviceIdentifier];

    if (v11) {
      v12 = @"remotewidget";
    }
    else {
      v12 = @"widget";
    }
    [v10 appendString:v12];
    id v13 = [v4 ratelimitConfigurationName];

    if (v13) {
      [v10 appendString:@".ratelimited"];
    }
    id v14 = [v4 widgetIdentifier];
    id v15 = [v4 widgetBudgetIdentifier];

    if (v15)
    {
      uint64_t v16 = [v4 widgetBudgetIdentifier];

      id v14 = (void *)v16;
    }
    id v17 = [NSString stringWithFormat:@".%@", v14];
    [v10 appendString:v17];

    id v18 = [NSString stringWithString:v10];
    uint64_t v19 = _DASSchedulingPriorityUtility;
    uint64_t v20 = _DASActivityDurationShort;
    id v21 = [v4 refreshAfterDate];
    id v22 = +[_DASActivity activityWithName:v18 priority:v19 duration:v20 startingAfter:v21 startingBefore:v9];

    [v22 setWidgetID:v14];
    id v23 = [v4 ratelimitConfigurationName];

    if (v23)
    {
      id v24 = [v4 ratelimitConfigurationName];
      [v22 setRateLimitConfigurationName:v24];
    }
    v25 = [v4 widgetBudgetIdentifier];

    if (v25)
    {
      id v26 = [v4 widgetBudgetIdentifier];
      [v22 setWidgetBudgetID:v26];
    }
    long long v27 = [v4 remoteDeviceIdentifier];

    if (v27)
    {
      id v28 = [v4 remoteDeviceIdentifier];
      [v22 setRemoteDevice:v28];
      [v22 setTargetDevice:3];
    }
    id v29 = [v4 appIdentifier];
    v34[0] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v22 setRelatedApplications:v30];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __72___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters___block_invoke;
    v33[3] = &unk_1E6112CC0;
    v33[4] = self;
    [v22 setSuspendHandler:v33];

    goto LABEL_18;
  }
  __int16 v32 = [v4 ratelimitConfigurationName];

  if (v32) {
    goto LABEL_4;
  }
  uint64_t v9 = [(_DASWidgetRefreshScheduler *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[_DASWidgetRefreshScheduler createRefreshActivityWithRateLimitConfigurationName:forWidgetBudgetID:withRemoteDeviceID:containingAppID:refreshAfter:refreshBefore:widgetInfo:refreshHandler:](v9);
  }
  id v22 = 0;
LABEL_18:

  return v22;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3 refreshHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_DASWidgetRefreshScheduler *)self createRefreshActivityWithWidgetParameters:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_refreshHandler___block_invoke;
  v12[3] = &unk_1E6112C98;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 setStartHandler:v12];

  return v8;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3 withRefreshHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(_DASWidgetRefreshScheduler *)self createRefreshActivityWithWidgetParameters:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_withRefreshHandler___block_invoke;
  v10[3] = &unk_1E6112D10;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  [v7 setStartHandler:v10];

  return v7;
}

- (void)submitRefreshActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(_DASWidgetRefreshScheduler *)self dasScheduler];
  [v5 submitActivity:v4];
}

- (void)cancelActivity:(id)a3
{
}

- (void)createRateLimitConfigurationWithName:(id)a3 rateLimits:(id)a4
{
  id v6 = +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:a3 andLimits:a4];
  id v5 = [(_DASWidgetRefreshScheduler *)self dasScheduler];
  [v5 submitRateLimitConfiguration:v6];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_DASScheduler)dasScheduler
{
  return self->_dasScheduler;
}

- (void)setDasScheduler:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_DKKnowledgeSaving)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualKeyPath)widgetOverrideKeypath
{
  return self->_widgetOverrideKeypath;
}

- (void)setWidgetOverrideKeypath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dasScheduler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)recordWidgetViews:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 budgetID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B578B000, a4, OS_LOG_TYPE_DEBUG, "Recording widget view: %@", a1, 0xCu);
}

- (void)createRefreshActivityWithRateLimitConfigurationName:(os_log_t)log forWidgetBudgetID:withRemoteDeviceID:containingAppID:refreshAfter:refreshBefore:widgetInfo:refreshHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B578B000, log, OS_LOG_TYPE_ERROR, "No widget budget id, no remote device id, no rate config name", v1, 2u);
}

@end