@interface NEContentFilterNetworkAgent
+ (id)agentType;
@end

@implementation NEContentFilterNetworkAgent

+ (id)agentType
{
  return @"ContentFilter";
}

@end