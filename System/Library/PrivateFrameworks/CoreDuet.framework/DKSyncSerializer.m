@interface DKSyncSerializer
@end

@implementation DKSyncSerializer

uint64_t __35___DKSyncSerializer_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_dispatcher;
  sharedInstance_dispatcher = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __39___DKSyncSerializer_performAsyncBlock___block_invoke(uint64_t a1)
{
}

void __38___DKSyncSerializer_performSyncBlock___block_invoke(uint64_t a1)
{
}

void __40___DKSyncSerializer_performAfter_block___block_invoke(uint64_t a1)
{
}

@end