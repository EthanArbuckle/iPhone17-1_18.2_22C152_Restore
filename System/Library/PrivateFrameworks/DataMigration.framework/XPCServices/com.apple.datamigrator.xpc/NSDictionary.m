@interface NSDictionary
- (BOOL)dmps_excludedFromFirstLogin;
- (double)dmps_timeIntervalBeforeReboot;
- (double)dmps_timeIntervalBeforeWatchdog;
- (float)dmps_estimate;
- (id)dmps_concurrentPluginDependencyIdentifier;
- (id)dmps_identifier;
@end

@implementation NSDictionary

- (id)dmps_identifier
{
  return [(NSDictionary *)self objectForKeyedSubscript:@"id"];
}

- (float)dmps_estimate
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"estimate"];
  v3 = v2;
  if (v2)
  {
    [v2 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.1;
  }

  return v5;
}

- (double)dmps_timeIntervalBeforeWatchdog
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"timeout"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)dmps_timeIntervalBeforeReboot
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"timeoutBeforeReboot"];
  v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)dmps_excludedFromFirstLogin
{
  v2 = [(NSDictionary *)self objectForKeyedSubscript:@"excludedFromFirstLogin"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)dmps_concurrentPluginDependencyIdentifier
{
  return [(NSDictionary *)self objectForKeyedSubscript:@"dependency"];
}

@end