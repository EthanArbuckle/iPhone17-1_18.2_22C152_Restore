@interface CMLLog
+ (id)client;
@end

@implementation CMLLog

+ (id)client
{
  if (client_onceToken != -1) {
    dispatch_once(&client_onceToken, &__block_literal_global);
  }
  v2 = (void *)client__client;
  return v2;
}

uint64_t __16__CMLLog_client__block_invoke()
{
  client__client = (uint64_t)os_log_create(kCMLLogSubsystem, "client");
  return MEMORY[0x270F9A758]();
}

@end