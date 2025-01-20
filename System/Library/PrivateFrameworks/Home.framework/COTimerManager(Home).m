@interface COTimerManager(Home)
+ (id)hf_TimerManagerForAccessory:()Home;
@end

@implementation COTimerManager(Home)

+ (id)hf_TimerManagerForAccessory:()Home
{
  id v3 = a3;
  v4 = objc_alloc_init(_HFTimerConnectionProvider);
  v5 = (void *)[objc_alloc(MEMORY[0x263F33FB0]) initForAccessory:v3 withConnectionProvider:v4];

  return v5;
}

@end