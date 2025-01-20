@interface NSObject(GKSetupAssistantSupport)
- (id)_gkAuthenticatedPlayerID;
- (void)_gkSetupAccountWithParamaters:()GKSetupAssistantSupport completionHandler:;
@end

@implementation NSObject(GKSetupAssistantSupport)

- (id)_gkAuthenticatedPlayerID
{
  v0 = [MEMORY[0x1E4F63760] localPlayer];
  v1 = [v0 internal];
  v2 = [v1 playerID];

  return v2;
}

- (void)_gkSetupAccountWithParamaters:()GKSetupAssistantSupport completionHandler:
{
  v5 = (void *)MEMORY[0x1E4F636C8];
  id v6 = a4;
  id v7 = a3;
  id v9 = [v5 proxyForLocalPlayer];
  v8 = [v9 accountServicePrivate];
  [v8 setupAccountForParameters:v7 handler:v6];
}

@end