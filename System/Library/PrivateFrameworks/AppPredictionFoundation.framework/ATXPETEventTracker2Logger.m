@interface ATXPETEventTracker2Logger
- (void)logMessage:(id)a3;
- (void)trackDistributionForMessage:(id)a3 value:(double)a4;
- (void)trackScalarForMessage:(id)a3;
- (void)trackScalarForMessage:(id)a3 count:(int)a4;
@end

@implementation ATXPETEventTracker2Logger

- (void)logMessage:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F93728];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 logMessage:v4];
}

- (void)trackScalarForMessage:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F93728];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 trackScalarForMessage:v4];
}

- (void)trackScalarForMessage:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = (void *)MEMORY[0x1E4F93728];
  id v6 = a3;
  id v7 = [v5 sharedInstance];
  [v7 trackScalarForMessage:v6 count:v4];
}

- (void)trackDistributionForMessage:(id)a3 value:(double)a4
{
  id v5 = (void *)MEMORY[0x1E4F93728];
  id v6 = a3;
  id v7 = [v5 sharedInstance];
  [v7 trackDistributionForMessage:v6 value:a4];
}

@end