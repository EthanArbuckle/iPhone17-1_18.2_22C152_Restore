@interface DataConnectionNetworkAgentInternetSlice
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isPersistent;
- (BOOL)requiresAssert;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation DataConnectionNetworkAgentInternetSlice

+ (id)agentType
{
  return @"InternetSlice";
}

- (BOOL)isPersistent
{
  return 0;
}

- (BOOL)requiresAssert
{
  return 1;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  sub_1008B15D4((uint64_t)[(DataConnectionNetworkAgent *)self dataAgent], v4, 0);

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4 = a3;
  sub_1008B168C((uint64_t)[(DataConnectionNetworkAgent *)self dataAgent], v4, 0);
}

@end