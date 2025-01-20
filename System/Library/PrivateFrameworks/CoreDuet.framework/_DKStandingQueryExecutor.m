@interface _DKStandingQueryExecutor
+ (void)executeAllStandingQueriesWithStorage:(id)a3;
+ (void)executeAllStandingQueriesWithStorage:(id)a3 activity:(id)a4;
@end

@implementation _DKStandingQueryExecutor

+ (void)executeAllStandingQueriesWithStorage:(id)a3
{
}

+ (void)executeAllStandingQueriesWithStorage:(id)a3 activity:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x192FB2F20]();
  v7 = objc_alloc_init(_DKDeviceActivityStandingQuery);
  [(_DKDeviceActivityStandingQuery *)v7 setActivity:v5];
  [(_DKDeviceActivityStandingQuery *)v7 executeWithStorage:v8];
}

@end