@interface ServerRegistryOneTimeInitialization
@end

@implementation ServerRegistryOneTimeInitialization

CFMutableArrayRef __figXPC_ServerRegistryOneTimeInitialization_block_invoke()
{
  gServerRegistry_0 = (uint64_t)dispatch_queue_create("FigXPCServerRegistryQueue", 0);
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  gServerRegistry_1 = (uint64_t)result;
  return result;
}

@end