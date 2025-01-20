@interface FakeSecuritydXPCClient
- (FakeSecuritydXPCClient)init;
- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4;
@end

@implementation FakeSecuritydXPCClient

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  if (gSecurityd && (v4 = *(void **)(gSecurityd + 696)) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (FakeSecuritydXPCClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)FakeSecuritydXPCClient;
  return [(FakeSecuritydXPCClient *)&v3 init];
}

@end