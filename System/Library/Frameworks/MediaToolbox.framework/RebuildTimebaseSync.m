@interface RebuildTimebaseSync
@end

@implementation RebuildTimebaseSync

void __dqr_RebuildTimebaseSync_block_invoke(uint64_t a1)
{
  int v9 = 0;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  long long v3 = 0u;
  long long v2 = 0u;
  int __s1 = 120;
  dqr_SyncServerTimebaseToMoment(*(void *)(a1 + 32), &__s1);
}

@end