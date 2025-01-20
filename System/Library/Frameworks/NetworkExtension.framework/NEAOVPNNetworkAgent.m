@interface NEAOVPNNetworkAgent
+ (id)agentType;
@end

@implementation NEAOVPNNetworkAgent

+ (id)agentType
{
  return @"AOVPN";
}

@end