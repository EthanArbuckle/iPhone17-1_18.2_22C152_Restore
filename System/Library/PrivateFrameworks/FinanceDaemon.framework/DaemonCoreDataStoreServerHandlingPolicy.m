@interface DaemonCoreDataStoreServerHandlingPolicy
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3;
- (_TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy)init;
- (id)allowableClassesForClientWithContext:(id)a3;
- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
@end

@implementation DaemonCoreDataStoreServerHandlingPolicy

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1D735740C();

  return self & 1;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  if (sub_1D73585B8())
  {
    v3 = (void *)sub_1D74103A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1D7358750((uint64_t)a4);

  return v9;
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1D73577D8(a3, a4);

  return v10;
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  uint64_t v5 = sub_1D740DA48();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL result = MEMORY[0x1F4188790](v7);
  v12 = (char *)&v19 - v11;
  if (a3)
  {
    uint64_t v13 = (uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_policyLevelProvider;
    uint64_t v14 = *(uint64_t *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_entitlementChecker);
    v15 = (char *)self + OBJC_IVAR____TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy_authStatusProvider;
    v16 = self;
    id v17 = a3;
    sub_1D73570FC(v13, v14, (uint64_t)v15, MEMORY[0x1E4F26508], (uint64_t)v12);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E4F266C0], v5);
    LOBYTE(v13) = sub_1D740DA38();
    v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    v18(v9, v5);
    v18(v12, v5);

    return v13 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy)init
{
  BOOL result = (_TtC13FinanceDaemon39DaemonCoreDataStoreServerHandlingPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end