@interface CFPrefsSynchronizeDirtySourceForDaemonTermination
@end

@implementation CFPrefsSynchronizeDirtySourceForDaemonTermination

uint64_t ___CFPrefsSynchronizeDirtySourceForDaemonTermination_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncWriteToDisk];
}

@end