@interface ATXCoreDuetLogger
- (ATXCoreDuetLogger)init;
- (ATXCoreDuetLogger)initWithDataStore:(id)a3 intentStream:(id)a4 activityStream:(id)a5 currentDate:(id)a6 tracker:(id)a7;
- (BOOL)actionTypeIsActivity:(id)a3;
- (id)abGroup;
- (void)logCoreDuetActionLogDonationMetrics;
- (void)logDonationCountWithAlogEventCount:(unint64_t)a3 forIntents:(BOOL)a4;
- (void)logDonationRatioWithDuetEventCount:(unint64_t)a3 alogEventCount:(unint64_t)a4 forIntents:(BOOL)a5;
- (void)setabGroup:(id)a3;
@end

@implementation ATXCoreDuetLogger

- (ATXCoreDuetLogger)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = [(ATXCoreDuetLogger *)self initWithDataStore:v3 intentStream:v4 activityStream:v5 currentDate:v6 tracker:v7];

  return v8;
}

- (ATXCoreDuetLogger)initWithDataStore:(id)a3 intentStream:(id)a4 activityStream:(id)a5 currentDate:(id)a6 tracker:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXCoreDuetLogger;
  v17 = [(ATXCoreDuetLogger *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataStore, a3);
    objc_storeStrong((id *)&v18->_intentStream, a4);
    objc_storeStrong((id *)&v18->_activityStream, a5);
    objc_storeStrong((id *)&v18->_currentDate, a6);
    objc_storeStrong((id *)&v18->_tracker, a7);
  }

  return v18;
}

- (void)logCoreDuetActionLogDonationMetrics
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  v4 = self->_currentDate;
  v5 = [(NSDate *)v4 dateByAddingTimeInterval:-86400.0];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v6 = [(ATXIntentStream *)self->_intentStream numberOfIntentEventsBetweenStartDate:v5 endDate:v4];
  uint64_t v7 = [(ATXUserActivityStream *)self->_activityStream numberOfActivityEventsBetweenStartDate:v5 endDate:v4];
  dataStore = self->_dataStore;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__ATXCoreDuetLogger_logCoreDuetActionLogDonationMetrics__block_invoke;
  v14[3] = &unk_1E68ADD68;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v19;
  [(_ATXDataStore *)dataStore enumerateActionTypesOlderThan:v5 block:v14];
  v9 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = v20[3];
    uint64_t v13 = v16[3];
    *(_DWORD *)buf = 138413314;
    v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v6;
    __int16 v27 = 2048;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v12;
    __int16 v31 = 2048;
    uint64_t v32 = v13;
    _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "%@ - has duetIntentCount: %lu duetActivityCount: %lu alogIntentCount: %lu alogActivityCount: %lu", buf, 0x34u);
  }
  [(ATXCoreDuetLogger *)self logDonationCountWithAlogEventCount:v20[3] forIntents:1];
  [(ATXCoreDuetLogger *)self logDonationCountWithAlogEventCount:v16[3] forIntents:0];
  [(ATXCoreDuetLogger *)self logDonationRatioWithDuetEventCount:v6 alogEventCount:v20[3] forIntents:1];
  [(ATXCoreDuetLogger *)self logDonationRatioWithDuetEventCount:v7 alogEventCount:v16[3] forIntents:0];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __56__ATXCoreDuetLogger_logCoreDuetActionLogDonationMetrics__block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "actionTypeIsActivity:")) {
    uint64_t v2 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v2 = *(void *)(a1 + 48);
  }
  ++*(void *)(*(void *)(v2 + 8) + 24);
  return 1;
}

- (void)logDonationRatioWithDuetEventCount:(unint64_t)a3 alogEventCount:(unint64_t)a4 forIntents:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3) {
    double v7 = (double)a4 / (double)a3;
  }
  else {
    double v7 = 0.0;
  }
  v8 = objc_opt_new();
  [v8 setActionType:v5];
  v9 = [(ATXCoreDuetLogger *)self abGroup];
  [v8 setAbGroup:v9];

  [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v8 value:v7];
  v10 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v8 actionType];
    if (v13)
    {
      if (v13 == 1)
      {
        id v14 = @"Intent";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
        id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v14 = @"NSUA";
    }
    uint64_t v15 = [v8 abGroup];
    *(_DWORD *)buf = 138413058;
    id v17 = v12;
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2048;
    double v21 = v7;
    __int16 v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBDonationRatioTracker with type: %@ ratio: %f abGroup: %@", buf, 0x2Au);
  }
}

- (void)logDonationCountWithAlogEventCount:(unint64_t)a3 forIntents:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v7 = objc_opt_new();
  [v7 setActionType:v4];
  v8 = [(ATXCoreDuetLogger *)self abGroup];
  [v7 setAbGroup:v8];

  [(ATXPETEventTracker2Protocol *)self->_tracker trackDistributionForMessage:v7 value:(double)a3];
  v9 = __atxlog_handle_metrics();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v7 actionType];
    if (v12)
    {
      if (v12 == 1)
      {
        uint64_t v13 = @"Intent";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
        uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v13 = @"NSUA";
    }
    id v14 = [v7 abGroup];
    *(_DWORD *)buf = 138413058;
    id v16 = v11;
    __int16 v17 = 2112;
    __int16 v18 = v13;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2112;
    __int16 v22 = v14;
    _os_log_debug_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMDonationCountTracker with type: %@ count: %lu abGroup: %@", buf, 0x2Au);
  }
}

- (id)abGroup
{
  abGroup = self->_abGroup;
  if (!abGroup)
  {
    BOOL v4 = +[_ATXGlobals sharedInstance];
    BOOL v5 = [v4 abGroupIdentifier];
    uint64_t v6 = self->_abGroup;
    self->_abGroup = v5;

    abGroup = self->_abGroup;
  }
  return abGroup;
}

- (void)setabGroup:(id)a3
{
}

- (BOOL)actionTypeIsActivity:(id)a3
{
  return [a3 hasPrefix:@"NSUA_"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end