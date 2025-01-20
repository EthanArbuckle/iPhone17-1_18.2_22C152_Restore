@interface BIChargeTimeEstimatorClient
+ (id)sharedEstimator;
- (BIChargeTimeEstimatorClient)init;
- (OS_os_log)logger;
- (id)chargeTime;
- (void)chargeTime;
- (void)setLogger:(id)a3;
@end

@implementation BIChargeTimeEstimatorClient

- (BIChargeTimeEstimatorClient)init
{
  if (isTimeTo80NotificationEnabled_onceToken != -1) {
    dispatch_once(&isTimeTo80NotificationEnabled_onceToken, &__block_literal_global);
  }
  if (isTimeTo80NotificationEnabled_isTT80FeatureFlagEnabled)
  {
    v8.receiver = self;
    v8.super_class = (Class)BIChargeTimeEstimatorClient;
    v3 = [(BIChargeTimeEstimatorClient *)&v8 init];
    if (v3)
    {
      os_log_t v4 = os_log_create("com.apple.BatteryIntelligenceFramework", "BIChargeTimeEstimatorClient");
      logger = v3->_logger;
      v3->_logger = (OS_os_log *)v4;
    }
    self = v3;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)sharedEstimator
{
  if (sharedEstimator_onceToken != -1) {
    dispatch_once(&sharedEstimator_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedEstimator_instance;
  return v2;
}

uint64_t __46__BIChargeTimeEstimatorClient_sharedEstimator__block_invoke()
{
  sharedEstimator_instance = objc_alloc_init(BIChargeTimeEstimatorClient);
  return MEMORY[0x270F9A758]();
}

- (id)chargeTime
{
  v3 = objc_alloc_init(BIChargeTimeEstimatorOutput);
  [(BIChargeTimeEstimatorOutput *)v3 setEstimate:60.0];
  [(BIChargeTimeEstimatorOutput *)v3 setConfidenceScore:100.0];
  [(BIChargeTimeEstimatorOutput *)v3 setEndSOC:80];
  [(BIChargeTimeEstimatorOutput *)v3 setAdditionalInformation:1];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    [(BIChargeTimeEstimatorClient *)(uint64_t)v3 chargeTime];
  }
  return v3;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)chargeTime
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_248B70000, a2, OS_LOG_TYPE_DEBUG, "Returning a dummy output: %@", (uint8_t *)&v2, 0xCu);
}

@end