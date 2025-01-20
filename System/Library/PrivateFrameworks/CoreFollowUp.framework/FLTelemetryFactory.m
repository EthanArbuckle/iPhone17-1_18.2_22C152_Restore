@interface FLTelemetryFactory
+ (id)sharedTelemetryController;
@end

@implementation FLTelemetryFactory

+ (id)sharedTelemetryController
{
  if (sharedTelemetryController_onceToken != -1) {
    dispatch_once(&sharedTelemetryController_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedTelemetryController_controller;

  return v2;
}

uint64_t __47__FLTelemetryFactory_sharedTelemetryController__block_invoke()
{
  sharedTelemetryController_controller = objc_alloc_init(FLTelemetryAnalyticsController);

  return MEMORY[0x1F41817F8]();
}

@end