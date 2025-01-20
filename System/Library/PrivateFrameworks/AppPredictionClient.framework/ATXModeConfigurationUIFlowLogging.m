@interface ATXModeConfigurationUIFlowLogging
- (ATXModeConfigurationUIFlowLogging)init;
- (ATXModeConfigurationUIFlowLogging)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3;
- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 candidateEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10;
- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 currentEntityIdentifiers:(id)a9;
- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 previousEntityIdentifiers:(id)a6 suggestedEntityIdentifiers:(id)a7 currentEntityIdentifiers:(id)a8;
- (void)logModeConfigurationChangesOnboardingDismissedForModeUUID:(id)a3;
@end

@implementation ATXModeConfigurationUIFlowLogging

- (ATXModeConfigurationUIFlowLogging)initWithModeConfigurationUIFlowLoggingBiomeStream:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXModeConfigurationUIFlowLogging;
  v6 = [(ATXModeConfigurationUIFlowLogging *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeConfigurationUIFlowLoggingBiomeStream, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("ATXModeConfigurationUIFlowLogging.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (ATXModeConfigurationUIFlowLogging)init
{
  v3 = objc_opt_new();
  v4 = [(ATXModeConfigurationUIFlowLogging *)self initWithModeConfigurationUIFlowLoggingBiomeStream:v3];

  return v4;
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 previousEntityIdentifiers:(id)a6 suggestedEntityIdentifiers:(id)a7 currentEntityIdentifiers:(id)a8
{
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 currentEntityIdentifiers:(id)a9
{
}

- (void)logModeConfigurationChangesForModeUUID:(id)a3 modeConfigurationUI:(int)a4 modeConfigurationEntityType:(int)a5 modeConfigurationType:(int64_t)a6 previousEntityIdentifiers:(id)a7 suggestedEntityIdentifiers:(id)a8 candidateEntityIdentifiers:(id)a9 currentEntityIdentifiers:(id)a10
{
  uint64_t v36 = *(void *)&a4;
  uint64_t v37 = *(void *)&a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  v19 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self;
    v20 = [v14 UUIDString];
    if (v36 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E5D054A0[(int)v36];
    }
    v22 = v21;
    id v34 = v14;
    if (v37 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E5D054C0[(int)v37];
    }
    NSStringForATXModeConfigurationType(a6);
    v25 = int64_t v24 = a6;
    *(_DWORD *)buf = 138414082;
    v39 = v20;
    __int16 v40 = 2112;
    v41 = v22;
    __int16 v42 = 2112;
    v43 = v23;
    __int16 v44 = 2112;
    id v45 = v15;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 2112;
    id v51 = v18;
    __int16 v52 = 2112;
    v53 = v25;
    _os_log_impl(&dword_1A790D000, v19, OS_LOG_TYPE_DEFAULT, "ModeConfigurationUIFlow logging returned from preferences: dndModeUUID: %@ modeConfigurationUI: %@ modeConfigurationEntityType: %@ previousEntityIdentifiers: %@ suggestedEntityIdentifiers: %@ candidateEntityIdentifiers: %@ currentEntityIdentifiers: %@ modeConfigurationType: %@", buf, 0x52u);

    a6 = v24;
    id v14 = v34;
    self = v35;
  }

  if (v16)
  {
    if (v17) {
      goto LABEL_11;
    }
  }
  else
  {
    v26 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:].cold.4();
    }

    if (v17)
    {
LABEL_11:
      if (v15) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  v27 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
    -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:]();
  }

  if (v15)
  {
LABEL_12:
    if (v18) {
      goto LABEL_26;
    }
    goto LABEL_23;
  }
LABEL_20:
  v28 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
    -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:]();
  }

  if (!v18)
  {
LABEL_23:
    v29 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[ATXModeConfigurationUIFlowLogging logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:]();
    }
  }
LABEL_26:
  v30 = [ATXModeConfigurationUIFlowLoggingEvent alloc];
  v31 = [MEMORY[0x1E4F1C9C8] now];
  v32 = [(ATXModeConfigurationUIFlowLoggingEvent *)v30 initWithDndModeUUID:v14 modeConfigurationUI:v36 modeConfigurationEntityType:v37 modeConfigurationType:a6 suggestedEntityIdentifiers:v16 candidateEntityIdentifiers:v17 previousEntityIdentifiers:v15 currentEntityIdentifiers:v18 eventDate:v31];

  v33 = [(ATXModeConfigurationUIFlowLoggingBiomeStream *)self->_modeConfigurationUIFlowLoggingBiomeStream source];
  [v33 sendEvent:v32];
}

- (void)logModeConfigurationChangesOnboardingDismissedForModeUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__ATXModeConfigurationUIFlowLogging_logModeConfigurationChangesOnboardingDismissedForModeUUID___block_invoke;
  block[3] = &unk_1E5D05300;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

void __95__ATXModeConfigurationUIFlowLogging_logModeConfigurationChangesOnboardingDismissedForModeUUID___block_invoke(uint64_t a1)
{
  id v5 = +[ATXDNDModeConfigurationClient sharedInstance];
  v2 = [v5 dndModeForDNDModeWithUUID:*(void *)(a1 + 32)];
  v3 = objc_opt_new();
  [v3 setOnboardingOutcome:2];
  [v2 semanticType];
  id v4 = DNDModeSemanticTypeToString();
  [v3 setModeSemanticType:v4];

  [v3 sendToCoreAnalytics];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_modeConfigurationUIFlowLoggingBiomeStream, 0);
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil currentEntityIdentifiers", v2, v3, v4, v5, v6);
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil previousEntityIdentifiers", v2, v3, v4, v5, v6);
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil candidateEntityIdentifiers", v2, v3, v4, v5, v6);
}

- (void)logModeConfigurationChangesForModeUUID:modeConfigurationUI:modeConfigurationEntityType:modeConfigurationType:previousEntityIdentifiers:suggestedEntityIdentifiers:candidateEntityIdentifiers:currentEntityIdentifiers:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1A790D000, v0, v1, "ATXModeConfigurationUIFlowLogging was passed nil suggestedEntityIdentifiers", v2, v3, v4, v5, v6);
}

@end