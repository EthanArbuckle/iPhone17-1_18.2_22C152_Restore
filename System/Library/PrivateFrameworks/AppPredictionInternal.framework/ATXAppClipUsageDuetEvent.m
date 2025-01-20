@interface ATXAppClipUsageDuetEvent
- (ATXAppClipUsageDuetEvent)initWithContext:(id)a3 modifiedDate:(id)a4;
- (ATXAppClipUsageDuetEvent)initWithContextValue:(id)a3;
- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues;
- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues:(id)a3;
- (ATXAppClipUsageDuetEvent)initWithDKEvent:(id)a3;
- (ATXAppClipUsageDuetEvent)initWithLaunchDate:(id)a3 timeSinceDownload:(double)a4 urlHash:(id)a5 clipBundleId:(id)a6 parentAppBundleId:(id)a7 webClipBundleId:(id)a8 launchReason:(int)a9;
- (NSDate)launchDate;
- (NSString)clipBundleId;
- (NSString)parentAppBundleId;
- (NSString)urlHash;
- (NSString)webClipBundleId;
- (double)timeSinceDownload;
- (id)identifier;
- (id)loadNumberFromMetadata:(id)a3 key:(id)a4;
- (id)loadStringFromMetadata:(id)a3 key:(id)a4;
- (int)launchReason;
- (int)launchReasonFromString:(id)a3;
@end

@implementation ATXAppClipUsageDuetEvent

- (ATXAppClipUsageDuetEvent)initWithLaunchDate:(id)a3 timeSinceDownload:(double)a4 urlHash:(id)a5 clipBundleId:(id)a6 parentAppBundleId:(id)a7 webClipBundleId:(id)a8 launchReason:(int)a9
{
  id v16 = a3;
  id v25 = a5;
  id v17 = a6;
  id v24 = a7;
  id v18 = a8;
  v19 = 0;
  if (v18 && v17 && v16 && v25 && v24)
  {
    v26.receiver = self;
    v26.super_class = (Class)ATXAppClipUsageDuetEvent;
    v20 = [(ATXDuetEvent *)&v26 initWithStartDate:v16 endDate:0];
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_launchDate, a3);
      v21->_timeSinceDownload = a4;
      objc_storeStrong((id *)&v21->_urlHash, a5);
      objc_storeStrong((id *)&v21->_clipBundleId, a6);
      objc_storeStrong((id *)&v21->_parentAppBundleId, a7);
      objc_storeStrong((id *)&v21->_webClipBundleId, a8);
      v21->_launchReason = a9;
    }
    self = v21;
    v19 = self;
  }

  return v19;
}

- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues
{
  v3 = objc_opt_new();
  v4 = [(ATXAppClipUsageDuetEvent *)self initWithCurrentContextStoreValues:v3];

  return v4;
}

- (ATXAppClipUsageDuetEvent)initWithContext:(id)a3 modifiedDate:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F5B6B8];
  id v8 = a3;
  v9 = [v7 timeSinceDownloadKey];
  v10 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v9];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [MEMORY[0x1E4F5B6B8] URLHashKey];
  v14 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v13];

  v15 = [MEMORY[0x1E4F5B6B8] clipBundleIDKey];
  id v16 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v15];

  id v17 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  id v18 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v17];

  v19 = [MEMORY[0x1E4F5B6B8] webAppBundleIDKey];
  v20 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v19];

  v21 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
  v22 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v8 key:v21];

  if (v22)
  {
    self = [(ATXAppClipUsageDuetEvent *)self initWithLaunchDate:v6 timeSinceDownload:v14 urlHash:v16 clipBundleId:v18 parentAppBundleId:v20 webClipBundleId:[(ATXAppClipUsageDuetEvent *)self launchReasonFromString:v22] launchReason:v12];
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (ATXAppClipUsageDuetEvent)initWithCurrentContextStoreValues:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F5B6B8];
  id v5 = a3;
  id v6 = [v4 keyPathForAppClipLaunch];
  v7 = [v5 fetchDataDictionaryForKeyPath:v6];
  id v8 = [v5 lastModifiedDateForKeyPath:v6];

  v9 = [(ATXAppClipUsageDuetEvent *)self initWithContext:v7 modifiedDate:v8];
  return v9;
}

- (ATXAppClipUsageDuetEvent)initWithContextValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastModifiedDate];
  id v6 = [v4 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self = [(ATXAppClipUsageDuetEvent *)self initWithContext:v6 modifiedDate:v5];
    v7 = self;
  }
  else
  {
    id v8 = __atxlog_handle_hero();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXAppClipUsageDuetEvent initWithContextValue:]((uint64_t)v6, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (ATXAppClipUsageDuetEvent)initWithDKEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 metadata];

  if (v5)
  {
    id v6 = [v4 metadata];
    v7 = [MEMORY[0x1E4F5B4A0] timeSinceDownload];
    v29 = [(ATXAppClipUsageDuetEvent *)self loadNumberFromMetadata:v6 key:v7];

    id v8 = [v4 startDate];
    v9 = [v4 metadata];
    v10 = [MEMORY[0x1E4F5B4A0] URLHash];
    double v11 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v9 key:v10];

    double v12 = [v4 metadata];
    v13 = [MEMORY[0x1E4F5B4A0] clipBundleID];
    v14 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v12 key:v13];

    v15 = [v4 metadata];
    id v16 = [MEMORY[0x1E4F5B4A0] appBundleID];
    id v17 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v15 key:v16];

    id v18 = [v4 metadata];
    v19 = [MEMORY[0x1E4F5B4A0] webAppBundleID];
    v20 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v18 key:v19];

    v21 = [v4 metadata];
    v22 = [MEMORY[0x1E4F5B4A0] launchReason];
    v23 = [(ATXAppClipUsageDuetEvent *)self loadStringFromMetadata:v21 key:v22];

    if (v23)
    {
      id v24 = v29;
      [v29 doubleValue];
      self = [(ATXAppClipUsageDuetEvent *)self initWithLaunchDate:v8 timeSinceDownload:v11 urlHash:v14 clipBundleId:v17 parentAppBundleId:v20 webClipBundleId:[(ATXAppClipUsageDuetEvent *)self launchReasonFromString:v23] launchReason:v25];
      objc_super v26 = self;
    }
    else
    {
      objc_super v26 = 0;
      id v24 = v29;
    }
  }
  else
  {
    v27 = __atxlog_handle_hero();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ATXAppClipUsageDuetEvent initWithDKEvent:](v27);
    }

    objc_super v26 = 0;
  }

  return v26;
}

- (id)loadStringFromMetadata:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:v6];
    v10 = (void *)v9;
    double v11 = &stru_1F2740B58;
    if (v9) {
      double v11 = (__CFString *)v9;
    }
    double v12 = v11;
  }
  else
  {
    v13 = [MEMORY[0x1E4F5B6B8] timeSinceDownloadKey];
    char v14 = [v6 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      v15 = __atxlog_handle_hero();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:]();
      }
    }
    double v12 = 0;
  }

  return v12;
}

- (id)loadNumberFromMetadata:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    v10 = __atxlog_handle_hero();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXAppClipUsageDuetEvent loadStringFromMetadata:key:]();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (int)launchReasonFromString:(id)a3
{
  id v3 = a3;
  id v4 = [&unk_1F27F3BC8 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = [&unk_1F27F3BC8 objectForKeyedSubscript:v3];
    int v6 = [v5 intValue];
  }
  else
  {
    v7 = __atxlog_handle_hero();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXAppClipUsageDuetEvent launchReasonFromString:]();
    }

    int v6 = 9;
  }

  return v6;
}

- (id)identifier
{
  id v3 = [NSString alloc];
  id v4 = [(ATXAppClipUsageDuetEvent *)self urlHash];
  id v5 = [(ATXAppClipUsageDuetEvent *)self clipBundleId];
  int v6 = (void *)[v3 initWithFormat:@"%@-%@", v4, v5];

  return v6;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (double)timeSinceDownload
{
  return self->_timeSinceDownload;
}

- (NSString)urlHash
{
  return self->_urlHash;
}

- (int)launchReason
{
  return self->_launchReason;
}

- (NSString)parentAppBundleId
{
  return self->_parentAppBundleId;
}

- (NSString)clipBundleId
{
  return self->_clipBundleId;
}

- (NSString)webClipBundleId
{
  return self->_webClipBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClipBundleId, 0);
  objc_storeStrong((id *)&self->_clipBundleId, 0);
  objc_storeStrong((id *)&self->_parentAppBundleId, 0);
  objc_storeStrong((id *)&self->_urlHash, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
}

- (void)initWithContextValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Clip usage context value was %@ instead of NSDictionary", v5, 0xCu);
}

- (void)initWithDKEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "_DKEvent missing metadata", v1, 2u);
}

- (void)loadStringFromMetadata:key:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for key %@ not the expected type", v2, v3, v4, v5, v6);
}

- (void)launchReasonFromString:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Encountered unexpected launch reason %@", v2, v3, v4, v5, v6);
}

@end