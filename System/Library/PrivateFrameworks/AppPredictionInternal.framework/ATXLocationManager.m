@interface ATXLocationManager
@end

@implementation ATXLocationManager

void __47__ATXLocationManager_Singleton__sharedInstance__block_invoke()
{
  id v8 = [MEMORY[0x1E4F935D8] sharedInstance];
  v0 = objc_opt_new();
  id v1 = objc_alloc(MEMORY[0x1E4F935E8]);
  v2 = [MEMORY[0x1E4F4B190] sharedInstance];
  v3 = (void *)[v1 initWithLocationParameters:v2];

  id v4 = objc_alloc(MEMORY[0x1E4F935D0]);
  v5 = [MEMORY[0x1E4F4B190] sharedInstance];
  uint64_t v6 = [v4 initWithGPS:v8 routine:v0 stateStore:v3 now:0 modeGlobals:v5];
  v7 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = v6;
}

@end