@interface HomesStore.CoreData.XPCStoreServer.RequestHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (_TtCCOC11HomeKitCore10HomesStore8CoreData14XPCStoreServer21RequestHandlingPolicy)init;
@end

@implementation HomesStore.CoreData.XPCStoreServer.RequestHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_236D4DC08(v3);

  return v3 & 1;
}

- (_TtCCOC11HomeKitCore10HomesStore8CoreData14XPCStoreServer21RequestHandlingPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s21RequestHandlingPolicyCMa();
  return [(HomesStore.CoreData.XPCStoreServer.RequestHandlingPolicy *)&v3 init];
}

@end