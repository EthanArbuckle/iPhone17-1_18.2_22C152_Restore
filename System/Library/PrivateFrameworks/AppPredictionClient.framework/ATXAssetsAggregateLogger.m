@interface ATXAssetsAggregateLogger
+ (void)logKey:(id)a3 replaceScalarValueWith:(int64_t)a4;
@end

@implementation ATXAssetsAggregateLogger

+ (void)logKey:(id)a3 replaceScalarValueWith:(int64_t)a4
{
  id v10 = a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"ATXAssetsAggregateLogger.m", 21, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  v7 = objc_opt_new();
  [v7 setKey:v10];
  v8 = [MEMORY[0x1E4F93728] sharedInstance];
  [v8 trackScalarForMessage:v7 count:a4];
}

@end