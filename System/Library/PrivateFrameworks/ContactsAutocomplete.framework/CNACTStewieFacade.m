@interface CNACTStewieFacade
+ (BOOL)isMemoValid:(id)a3;
+ (BOOL)isMessagesApp;
+ (double)ageOfMemo:(id)a3;
+ (id)localizedAvocetPhrases;
+ (id)localizedEmergencyPhrases;
- (BOOL)isAvocetEnabled;
- (BOOL)isEmergencyEnabled;
- (BOOL)withLock_isAvocetEnabled;
- (BOOL)withLock_isEmergencyEnabled;
- (CNACTStewieFacade)init;
- (CNACTStewieFacade)initWithCoreTelephonyClient:(id)a3 stateMonitor:(id)a4;
- (NSArray)avocetTerms;
- (NSArray)emergencyTerms;
- (NSString)description;
- (id)numbers;
- (void)avocetTerms;
- (void)emergencyTerms;
- (void)numbers;
- (void)startMonitoring;
- (void)stateChanged:(id)a3;
@end

@implementation CNACTStewieFacade

- (CNACTStewieFacade)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.contacts.autocomplete.core-telephony", v3);

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:v4];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F23A60]) initWithDelegate:self queue:v4];
  v7 = [(CNACTStewieFacade *)self initWithCoreTelephonyClient:v5 stateMonitor:v6];

  return v7;
}

- (CNACTStewieFacade)initWithCoreTelephonyClient:(id)a3 stateMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_21);
    }
    v9 = CNGuardOSLog_cn_once_object_0;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
      -[CNACTStewieFacade initWithCoreTelephonyClient:stateMonitor:](v9);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CNACTStewieFacade;
  v10 = [(CNACTStewieFacade *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coreTelephonyClient, a3);
    objc_storeStrong((id *)&v11->_stateMonitor, a4);
    v12 = v11;
  }

  return v11;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"Stewie terms" object:self->_emergencyMemo];
  id v5 = (id)[v3 appendName:@"Avocet terms" object:self->_avocetMemo];
  v6 = [v3 build];

  return (NSString *)v6;
}

- (void)startMonitoring
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BEF57000, log, OS_LOG_TYPE_DEBUG, "Failed to start Stewie Monitor", v1, 2u);
}

+ (BOOL)isMemoValid:(id)a3
{
  [a1 ageOfMemo:a3];
  return v3 < 5.0;
}

+ (double)ageOfMemo:(id)a3
{
  if (!a3) {
    return 978307200.0;
  }
  double v3 = (void *)MEMORY[0x1E4F5A3D8];
  id v4 = a3;
  id v5 = [v3 currentEnvironment];
  v6 = [v5 timeProvider];
  [v6 timestamp];
  double v8 = v7;
  [v4 timestamp];
  double v10 = v9;

  double v11 = v8 - v10;
  return v11;
}

- (NSArray)emergencyTerms
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if ([(CNACTStewieFacade *)v2 withLock_isEmergencyEnabled])
  {
    if ([(id)objc_opt_class() isMemoValid:v2->_emergencyMemo])
    {
      double v3 = [(CNTimestamped *)v2->_emergencyMemo value];
    }
    else
    {
      id v4 = [(id)objc_opt_class() localizedEmergencyPhrases];
      id v5 = [(CNACTStewieFacade *)v2 numbers];
      v16[0] = v4;
      v16[1] = v5;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
      double v7 = objc_msgSend(v6, "_cn_flatten");
      double v8 = objc_msgSend(v7, "_cn_distinctObjects");

      double v9 = contactSearchLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CNACTStewieFacade emergencyTerms]();
      }

      double v10 = (void *)MEMORY[0x1E4F5A540];
      double v11 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      v12 = [v11 timeProvider];
      [v12 timestamp];
      uint64_t v13 = objc_msgSend(v10, "timestampedWithValue:timestamp:", v8);
      emergencyMemo = v2->_emergencyMemo;
      v2->_emergencyMemo = (CNTimestamped *)v13;

      double v3 = [(CNTimestamped *)v2->_emergencyMemo value];
    }
  }
  else
  {
    double v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isEmergencyEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CNACTStewieFacade *)v2 withLock_isEmergencyEnabled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)withLock_isEmergencyEnabled
{
  int v3 = [(id)objc_opt_class() isMessagesApp];
  if (v3)
  {
    id v4 = [(CTStewieStateMonitor *)self->_stateMonitor getState];
    char v5 = [v4 isAllowedService:1];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSArray)avocetTerms
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(CNACTStewieFacade *)v2 withLock_isAvocetEnabled])
  {
    if ([(id)objc_opt_class() isMemoValid:v2->_avocetMemo])
    {
      int v3 = [(CNTimestamped *)v2->_avocetMemo value];
    }
    else
    {
      id v4 = [(id)objc_opt_class() localizedAvocetPhrases];
      char v5 = objc_msgSend(v4, "_cn_distinctObjects");
      v6 = contactSearchLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[CNACTStewieFacade avocetTerms]();
      }

      double v7 = (void *)MEMORY[0x1E4F5A540];
      double v8 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      double v9 = [v8 timeProvider];
      [v9 timestamp];
      uint64_t v10 = objc_msgSend(v7, "timestampedWithValue:timestamp:", v5);
      avocetMemo = v2->_avocetMemo;
      v2->_avocetMemo = (CNTimestamped *)v10;

      int v3 = [(CNTimestamped *)v2->_avocetMemo value];
    }
  }
  else
  {
    int v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)isAvocetEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CNACTStewieFacade *)v2 withLock_isAvocetEnabled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)withLock_isAvocetEnabled
{
  int v3 = [(id)objc_opt_class() isMessagesApp];
  if (v3)
  {
    id v4 = [(CTStewieStateMonitor *)self->_stateMonitor getState];
    char v5 = [v4 isAllowedService:8];

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)isMessagesApp
{
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v3 = [v2 mainBundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AD08]];

  return v4;
}

+ (id)localizedEmergencyPhrases
{
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v3 = [v2 localizationServices];
  char v4 = [v3 localizedStringForKey:@"STEWIE_SEARCH_PHRASES" value:&stru_1F1A2F2D8 table:@"Localized-Stewie" bundleForClass:objc_opt_class() comment:0];
  char v5 = [v4 componentsSeparatedByString:@"|"];

  return v5;
}

+ (id)localizedAvocetPhrases
{
  v2 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  int v3 = [v2 localizationServices];
  char v4 = [v3 localizedStringForKey:@"AVOCET_SEARCH_PHRASES" value:&stru_1F1A2F2D8 table:@"Localized-Avocet" bundleForClass:objc_opt_class() comment:0];
  char v5 = [v4 componentsSeparatedByString:@"|"];

  return v5;
}

- (id)numbers
{
  coreTelephonyClient = self->_coreTelephonyClient;
  id v9 = 0;
  int v3 = [(CoreTelephonyClient *)coreTelephonyClient getAllEmergencyNumbersWithError:&v9];
  id v4 = v9;
  id v5 = v3;
  v6 = v5;
  if (!v5)
  {
    double v7 = contactSearchLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CNACTStewieFacade numbers]();
    }

    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  v6 = contactSearchLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CNACTStewieFacade stateChanged:]();
  }

  emergencyMemo = v5->_emergencyMemo;
  v5->_emergencyMemo = 0;

  avocetMemo = v5->_avocetMemo;
  v5->_avocetMemo = 0;

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocetMemo, 0);
  objc_storeStrong((id *)&self->_emergencyMemo, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)initWithCoreTelephonyClient:(os_log_t)log stateMonitor:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BEF57000, log, OS_LOG_TYPE_FAULT, "parameter ‘monitor’ must be nonnull", v1, 2u);
}

- (void)emergencyTerms
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Stewie terms: %@", v2, v3, v4, v5, v6);
}

- (void)avocetTerms
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Avocet terms: %@", v2, v3, v4, v5, v6);
}

- (void)numbers
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Failed to fetch Stewie numbers %{public}@", v2, v3, v4, v5, v6);
}

- (void)stateChanged:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1BEF57000, v0, v1, "Clearing cached state because state changed: %@", v2, v3, v4, v5, v6);
}

@end