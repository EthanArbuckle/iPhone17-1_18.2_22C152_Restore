@interface BPSSubscription
- (NSArray)upstreamSubscriptions;
- (void)cancel;
- (void)requestDemand:(int64_t)a3;
@end

@implementation BPSSubscription

- (void)cancel
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];
}

- (void)requestDemand:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  NSStringFromSelector(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v3 raise:v4, @"Override method %@ in subclass %@", v5, objc_opt_class() format];
}

- (NSArray)upstreamSubscriptions
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Override method %@ in subclass %@", v4, objc_opt_class() format];

  return 0;
}

@end