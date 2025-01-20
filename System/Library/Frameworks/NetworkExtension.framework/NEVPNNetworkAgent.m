@interface NEVPNNetworkAgent
+ (id)agentType;
@end

@implementation NEVPNNetworkAgent

+ (id)agentType
{
  return @"VPN";
}

@end