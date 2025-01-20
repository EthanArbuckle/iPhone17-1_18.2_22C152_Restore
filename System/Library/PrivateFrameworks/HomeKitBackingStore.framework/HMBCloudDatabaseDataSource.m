@interface HMBCloudDatabaseDataSource
- (void)performAfterDelay:(double)a3 block:(id)a4;
@end

@implementation HMBCloudDatabaseDataSource

- (void)performAfterDelay:(double)a3 block:(id)a4
{
  int64_t v4 = (uint64_t)(a3 * 1000000000.0);
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, v4);
  v7 = dispatch_get_global_queue(21, 0);
  dispatch_after(v6, v7, v5);
}

@end