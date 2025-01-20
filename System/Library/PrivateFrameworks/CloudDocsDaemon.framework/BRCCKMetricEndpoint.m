@interface BRCCKMetricEndpoint
- (BRCCKMetricEndpoint)initWithSession:(id)a3;
- (void)submitEventMetric:(id)a3;
@end

@implementation BRCCKMetricEndpoint

- (BRCCKMetricEndpoint)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCCKMetricEndpoint;
  v6 = [(BRCCKMetricEndpoint *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (void)submitEventMetric:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCCKMetricEndpoint submitEventMetric:]();
    }

    v7 = [v4 associatedCKEventMetricIfAvailable];
    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1A010]);
      objc_super v9 = [v4 eventName];
      v10 = [v4 startTime];
      v7 = (void *)[v8 initWithEventName:v9 atTime:v10];
    }
    v11 = [v4 startTime];
    [v7 setStartTime:v11];

    v12 = [v4 endTime];
    [v7 setEndTime:v12];

    v13 = [v4 additionalPayload];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__BRCCKMetricEndpoint_submitEventMetric___block_invoke;
    v18[3] = &unk_1E6994800;
    id v19 = v7;
    id v14 = v7;
    [v13 enumerateKeysAndObjectsUsingBlock:v18];

    v15 = [(BRCAccountSession *)self->_session syncContextProvider];
    v16 = [v15 defaultSyncContext];
    v17 = [v16 ckContainer];

    [v17 submitEventMetric:v14];
  }
}

uint64_t __41__BRCCKMetricEndpoint_submitEventMetric___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (void).cxx_destruct
{
}

- (void)submitEventMetric:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, (uint64_t)v0, "[DEBUG] analytics: submitting event %@%@", v1);
}

@end