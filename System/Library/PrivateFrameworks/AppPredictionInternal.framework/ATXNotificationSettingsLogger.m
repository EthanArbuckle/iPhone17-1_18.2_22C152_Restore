@interface ATXNotificationSettingsLogger
- (ATXNotificationSettingsLogger)init;
- (ATXNotificationSettingsLogger)initWithNotificationSettingsReader:(id)a3;
- (void)logNotificationSettingsMetrics;
- (void)logNotificationSettingsMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXNotificationSettingsLogger

- (ATXNotificationSettingsLogger)init
{
  v3 = objc_opt_new();
  v4 = [(ATXNotificationSettingsLogger *)self initWithNotificationSettingsReader:v3];

  return v4;
}

- (ATXNotificationSettingsLogger)initWithNotificationSettingsReader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationSettingsLogger;
  v6 = [(ATXNotificationSettingsLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reader, a3);
  }

  return v7;
}

- (void)logNotificationSettingsMetricsWithXPCActivity:(id)a3
{
  id v12 = (id)objc_opt_new();
  v4 = [(ATXNotificationSettingsReader *)self->_reader notificationDigestDeliveryTimes];
  uint64_t v5 = [v4 count];

  [v12 setNumDailyDigests:v5];
  v6 = [(ATXNotificationSettingsReader *)self->_reader allConfiguredDigestApps];
  objc_msgSend(v12, "setNumDigestApps:", objc_msgSend(v6, "count"));

  v7 = [(ATXNotificationSettingsReader *)self->_reader numConfiguredModes];
  v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v9 = 0;
  }
  [v12 setNumConfiguredModes:v9];
  id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  objc_msgSend(v12, "setHasOfferedDigest:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E4F4B500]));
  objc_msgSend(v12, "setHasSetupDigest:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E4F4B518]));
  [v12 logToCoreAnalytics];
}

- (void)logNotificationSettingsMetrics
{
}

- (void).cxx_destruct
{
}

@end