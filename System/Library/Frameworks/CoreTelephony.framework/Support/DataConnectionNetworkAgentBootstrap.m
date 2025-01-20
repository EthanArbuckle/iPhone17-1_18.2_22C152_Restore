@interface DataConnectionNetworkAgentBootstrap
+ (id)agentType;
- (BOOL)allowStartAgentForOptions:(id)a3;
@end

@implementation DataConnectionNetworkAgentBootstrap

- (BOOL)allowStartAgentForOptions:(id)a3
{
  return sub_1008B1AEC(a3);
}

+ (id)agentType
{
  return @"BootstrapProvisioning";
}

@end