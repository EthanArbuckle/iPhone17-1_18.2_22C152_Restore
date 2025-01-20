@interface CNAPITriageLogger
+ (OS_os_log)os_log;
+ (id)threadEntryPoint;
+ (void)setThreadEntryPoint:(SEL)a3;
- (CNAPITriageLogger)init;
- (OS_os_log)log;
- (void)clientStoppedEnumerationForRequest:(id)a3;
- (void)didExecuteFetchRequest:(id)a3 duration:(double)a4;
- (void)didReturnAllResultsForContactFetchRequest:(id)a3;
- (void)request:(id)a3 containsContact:(id)a4;
- (void)request:(id)a3 encounteredError:(id)a4;
- (void)request:(id)a3 failedWithError:(id)a4;
- (void)request:(id)a3 spentTimeInClientCode:(double)a4;
- (void)request:(id)a3 willReturnAnchor:(id)a4;
- (void)willExecuteFetchRequest:(id)a3;
@end

@implementation CNAPITriageLogger

- (void)willExecuteFetchRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = log;
    int v25 = 134218243;
    uint64_t v26 = [(__CFString *)v4 serialNumber];
    __int16 v27 = 2113;
    v28 = v4;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_DEFAULT, "%04llx BEGIN: Will execute fetch for request: %{private}@", (uint8_t *)&v25, 0x16u);
  }
  uint64_t v7 = [(id)objc_opt_class() threadEntryPoint];
  v8 = (void *)v7;
  v9 = @"(unknown)";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v10 = v9;

  v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    uint64_t v13 = [(__CFString *)v4 serialNumber];
    int v25 = 134218242;
    uint64_t v26 = v13;
    __int16 v27 = 2114;
    v28 = v10;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "%04llx Entry point: %{public}@", (uint8_t *)&v25, 0x16u);
  }
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    uint64_t v16 = [(__CFString *)v4 serialNumber];
    v17 = [(__CFString *)v4 predicate];
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = [(__CFString *)v4 predicate];
    int v25 = 134218499;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    v28 = v19;
    __int16 v29 = 2113;
    v30 = v20;
    _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, "%04llx Predicate: %{public}@ %{private}@", (uint8_t *)&v25, 0x20u);
  }
  v21 = [(__CFString *)v4 predicate];
  objc_msgSend(v21, "cn_triageWithLog:serialNumber:", self->_log, -[__CFString serialNumber](v4, "serialNumber"));

  v22 = self->_log;
  uint64_t v23 = [(__CFString *)v4 signpostId];
  if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v24 = v23;
    if (os_signpost_enabled((os_log_t)v22))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_1909E3000, (os_log_t)v22, OS_SIGNPOST_INTERVAL_BEGIN, v24, "Fetching Contacts", "", (uint8_t *)&v25, 2u);
    }
  }
}

+ (id)threadEntryPoint
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKeyedSubscript:@"_triage_logger_entry_point"];

  return v4;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_23 != -1) {
    dispatch_once(&os_log_cn_once_token_0_23, &__block_literal_global_136);
  }
  v2 = (void *)os_log_cn_once_object_0_23;

  return (OS_os_log *)v2;
}

+ (void)setThreadEntryPoint:(SEL)a3
{
  v4 = [MEMORY[0x1E4F29060] currentThread];
  id v7 = [v4 threadDictionary];

  if (a3)
  {
    v5 = [v7 objectForKeyedSubscript:@"_triage_logger_entry_point"];

    if (!v5)
    {
      v6 = NSStringFromSelector(a3);
      [v7 setObject:v6 forKeyedSubscript:@"_triage_logger_entry_point"];
    }
  }
  else
  {
    [v7 setObject:0 forKeyedSubscript:@"_triage_logger_entry_point"];
  }
}

- (void)request:(id)a3 willReturnAnchor:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 isSuccess];
  log = self->_log;
  if (v8)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v10 = log;
      uint64_t v11 = [v6 serialNumber];
      v12 = [v7 value];
      int v13 = 134218242;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1909E3000, v10, OS_LOG_TYPE_DEFAULT, "%04llx History anchor returned to client: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    -[CNAPITriageLogger request:willReturnAnchor:](log, v6, v7);
  }
}

- (void)request:(id)a3 containsContact:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = log;
    id v8 = a4;
    uint64_t v9 = [a3 serialNumber];
    v10 = [v8 identifier];

    int v11 = 134218242;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_DEFAULT, "%04llx Contact: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)didExecuteFetchRequest:(id)a3 duration:(double)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self->_log;
  uint64_t v8 = [v6 signpostId];
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v9 = v8;
    if (os_signpost_enabled((os_log_t)v7))
    {
      LOWORD(v14) = 0;
      _os_signpost_emit_with_name_impl(&dword_1909E3000, (os_log_t)v7, OS_SIGNPOST_INTERVAL_END, v9, "Fetching Contacts", "", (uint8_t *)&v14, 2u);
    }
  }

  v10 = [MEMORY[0x1E4F5A530] stringForTimeInterval:a4];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = log;
    uint64_t v13 = [v6 serialNumber];
    int v14 = 134218242;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1909E3000, v12, OS_LOG_TYPE_DEFAULT, "%04llx FINISH (%{public}@)", (uint8_t *)&v14, 0x16u);
  }
}

- (void)request:(id)a3 spentTimeInClientCode:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F5A530] stringForTimeInterval:a4];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v9 = log;
    int v10 = 134218242;
    uint64_t v11 = [v6 serialNumber];
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1909E3000, v9, OS_LOG_TYPE_DEFAULT, "%04llx Time spent in client code: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)clientStoppedEnumerationForRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = log;
    int v6 = 134217984;
    uint64_t v7 = [a3 serialNumber];
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "%04llx Client stopped enumeration of results", (uint8_t *)&v6, 0xCu);
  }
}

- (CNAPITriageLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNAPITriageLogger;
  v2 = [(CNAPITriageLogger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend((id)objc_opt_class(), "os_log");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

uint64_t __27__CNAPITriageLogger_os_log__block_invoke()
{
  os_log_cn_once_object_0_23 = (uint64_t)os_log_create("com.apple.contacts", "api-triage");

  return MEMORY[0x1F41817F8]();
}

- (void)request:(id)a3 encounteredError:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[CNAPITriageLogger request:encounteredError:](log, a3);
  }
}

- (void)didReturnAllResultsForContactFetchRequest:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = log;
    int v6 = 134217984;
    uint64_t v7 = [a3 serialNumber];
    _os_log_impl(&dword_1909E3000, v5, OS_LOG_TYPE_DEFAULT, "%04llx All results have been returned to the client", (uint8_t *)&v6, 0xCu);
  }
}

- (void)request:(id)a3 failedWithError:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[CNAPITriageLogger request:failedWithError:](log, a3);
  }
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)request:(void *)a1 encounteredError:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 serialNumber];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1909E3000, v4, v5, "%04llx ERROR %{public}@", v6, v7, v8, v9, v10);
}

- (void)request:(void *)a3 willReturnAnchor:.cold.1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [a2 serialNumber];
  __int16 v12 = [a3 error];
  OUTLINED_FUNCTION_0_4(&dword_1909E3000, v6, v7, "%04llx Could not fetch the current history anchor; the client will be handed a nil token, resulting in a full sync o"
    "n the next change history request. Error: %@",
    v8,
    v9,
    v10,
    v11,
    2u);
}

- (void)request:(void *)a1 failedWithError:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 serialNumber];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_1909E3000, v4, v5, "%04llx Request failed with error: %{public}@", v6, v7, v8, v9, v10);
}

@end