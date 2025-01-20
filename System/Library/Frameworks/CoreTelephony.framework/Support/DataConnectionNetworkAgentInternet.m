@interface DataConnectionNetworkAgentInternet
+ (id)agentType;
- (BOOL)isPersistent;
- (BOOL)requiresAssert;
@end

@implementation DataConnectionNetworkAgentInternet

+ (id)agentType
{
  return @"Internet";
}

- (BOOL)isPersistent
{
  return 1;
}

- (BOOL)requiresAssert
{
  return 0;
}

@end