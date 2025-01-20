@interface FPConfigurationCheckingQueue
@end

@implementation FPConfigurationCheckingQueue

uint64_t ___FPConfigurationCheckingQueue_block_invoke()
{
  qword_26B1F50A0 = (uint64_t)dispatch_queue_create("com.apple.FramePacing.ConfigurationCheckingQueue", 0);

  return MEMORY[0x270F9A758]();
}

@end