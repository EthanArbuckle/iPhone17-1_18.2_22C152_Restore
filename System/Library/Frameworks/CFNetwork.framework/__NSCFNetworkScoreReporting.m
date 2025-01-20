@interface __NSCFNetworkScoreReporting
- (void)setConnection:(uint64_t)a1;
@end

@implementation __NSCFNetworkScoreReporting

- (void).cxx_destruct
{
}

- (void)setConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), 0);
  }
}

@end