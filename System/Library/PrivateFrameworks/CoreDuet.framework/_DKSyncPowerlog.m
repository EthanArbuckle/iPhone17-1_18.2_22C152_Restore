@interface _DKSyncPowerlog
+ (void)recordWithSyncType:(id)a3 transportType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 isEmpty:(BOOL)a7;
@end

@implementation _DKSyncPowerlog

+ (void)recordWithSyncType:(id)a3 transportType:(int64_t)a4 startDate:(id)a5 endDate:(id)a6 isEmpty:(BOOL)a7
{
  v21[4] = *MEMORY[0x1E4F143B8];
  if (a5 && a6)
  {
    BOOL v8 = a7;
    if (a4 == 8) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2 * (a4 == 4);
    }
    v20[0] = @"timestamp";
    v20[1] = @"timestampEnd";
    v21[0] = a5;
    v21[1] = a6;
    v20[2] = @"isEmpty";
    v10 = NSNumber;
    id v11 = a6;
    id v12 = a5;
    v13 = [v10 numberWithBool:v8];
    v21[2] = v13;
    v20[3] = @"transportType";
    v14 = [NSNumber numberWithInteger:v9];
    v21[3] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

    v16 = +[_CDLogging syncChannel];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:]((uint64_t)v15, v16);
    }

    PLLogRegisteredEvent();
  }
  else
  {
    id v17 = a6;
    id v18 = a5;
    v15 = +[_CDLogging instrumentationChannel];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_18ECEB000, v15, OS_LOG_TYPE_DEFAULT, "Skipping sync powerlog recording - startDate or endDate is nil.", v19, 2u);
    }
  }
}

+ (void)recordWithSyncType:(uint64_t)a1 transportType:(NSObject *)a2 startDate:endDate:isEmpty:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Logging sync session to powerlog: %@", (uint8_t *)&v2, 0xCu);
}

@end