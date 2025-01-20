@interface FPConfigurationSettingQueue
@end

@implementation FPConfigurationSettingQueue

uint64_t ___FPConfigurationSettingQueue_block_invoke()
{
  qword_26B1F5090 = (uint64_t)dispatch_queue_create("com.apple.FramePacing.ConfigurationSettingQueue", 0);

  return MEMORY[0x270F9A758]();
}

@end