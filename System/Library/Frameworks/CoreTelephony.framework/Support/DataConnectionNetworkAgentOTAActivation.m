@interface DataConnectionNetworkAgentOTAActivation
+ (id)agentType;
@end

@implementation DataConnectionNetworkAgentOTAActivation

+ (id)agentType
{
  return @"OTAActivation";
}

@end