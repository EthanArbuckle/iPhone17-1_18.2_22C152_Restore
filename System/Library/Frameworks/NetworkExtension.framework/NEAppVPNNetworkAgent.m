@interface NEAppVPNNetworkAgent
+ (id)agentType;
@end

@implementation NEAppVPNNetworkAgent

+ (id)agentType
{
  return @"AppVPN";
}

@end