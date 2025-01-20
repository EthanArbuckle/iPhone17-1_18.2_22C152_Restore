@interface DataConnectionNetworkAgentPushEmail
+ (id)agentType;
@end

@implementation DataConnectionNetworkAgentPushEmail

+ (id)agentType
{
  return @"PushEmail";
}

@end