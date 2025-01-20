@interface HMDResidentSyncClientDefaultDataSource
- (void)performWithDelay:(unsigned int)a3 block:(id)a4;
@end

@implementation HMDResidentSyncClientDefaultDataSource

- (void)performWithDelay:(unsigned int)a3 block:(id)a4
{
  int64_t v4 = 1000000000 * a3;
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, v4);
  v7 = dispatch_get_global_queue(0, 0);
  dispatch_after(v6, v7, v5);
}

@end