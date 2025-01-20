@interface FIAnalytics
+ (id)sharedAnalytics;
- (void)sendAnalytics:(id)a3;
- (void)sendEvent:(id)a3 eventDictionary:(id)a4;
@end

@implementation FIAnalytics

+ (id)sharedAnalytics
{
  id WeakRetained = objc_loadWeakRetained(&+[FIAnalytics sharedAnalytics]::sWeakSharedInstance);
  if (!WeakRetained)
  {
    id WeakRetained = objc_alloc_init((Class)a1);
    objc_storeWeak(&+[FIAnalytics sharedAnalytics]::sWeakSharedInstance, WeakRetained);
  }
  return WeakRetained;
}

- (void)sendAnalytics:(id)a3
{
  id v4 = a3;
  if ([v4 validate])
  {
    v5 = [v4 eventName];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__FIAnalytics_sendAnalytics___block_invoke;
    v6[3] = &unk_1E698FE60;
    id v7 = v4;
    [(FIAnalytics *)self sendEvent:v5 eventDictionary:v6];
  }
}

uint64_t __29__FIAnalytics_sendAnalytics___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventDict];
}

- (void)sendEvent:(id)a3 eventDictionary:(id)a4
{
}

@end