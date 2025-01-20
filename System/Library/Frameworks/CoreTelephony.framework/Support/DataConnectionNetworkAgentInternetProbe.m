@interface DataConnectionNetworkAgentInternetProbe
+ (id)agentType;
@end

@implementation DataConnectionNetworkAgentInternetProbe

+ (id)agentType
{
  return @"InternetProbe";
}

@end