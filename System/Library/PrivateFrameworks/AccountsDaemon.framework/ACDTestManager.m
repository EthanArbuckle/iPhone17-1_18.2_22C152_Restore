@interface ACDTestManager
+ (id)testServer;
- (NSXPCListenerEndpoint)remoteAccountStoreEndpoint;
- (NSXPCListenerEndpoint)remoteOAuthSignerEndpoint;
- (void)startTestServer;
- (void)stopTestServer;
@end

@implementation ACDTestManager

+ (id)testServer
{
  return (id)sTestServer;
}

- (void)startTestServer
{
  if (sTestServer)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"ACDTestManager.m" lineNumber:28 description:@"There can only be one test server running at a time"];
  }
  sTestServer = objc_alloc_init(ACDServer);

  MEMORY[0x270F9A758]();
}

- (void)stopTestServer
{
  if (sTestServer)
  {
    [(id)sTestServer shutdown];
    v2 = (void *)sTestServer;
    sTestServer = 0;
  }
}

- (NSXPCListenerEndpoint)remoteAccountStoreEndpoint
{
  v2 = [(id)sTestServer accountStoreListener];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (NSXPCListenerEndpoint)remoteOAuthSignerEndpoint
{
  v2 = [(id)sTestServer oauthSignerListener];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

@end