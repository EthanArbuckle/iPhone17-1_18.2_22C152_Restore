@interface HKDatabaseAccessibilityAssertionStore
- (HKDatabaseAccessibilityAssertionStore)init;
- (HKDatabaseAccessibilityAssertionStore)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3;
@end

@implementation HKDatabaseAccessibilityAssertionStore

- (HKDatabaseAccessibilityAssertionStore)initWithHealthStore:(id)a3
{
  return (HKDatabaseAccessibilityAssertionStore *)DatabaseAccessibilityAssertionStore.init(healthStore:)(a3);
}

- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_19C2D9ED8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_19C2AAF34(v6, v8, (uint64_t)sub_19C2AC284, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19C2ABA5C(v4);
}

- (id)exportedInterface
{
  return sub_19C2ABFAC((uint64_t)self, (uint64_t)a2, &protocolRef_HKDatabaseAccessibilityAssertionClientInterface);
}

- (id)remoteInterface
{
  return sub_19C2ABFAC((uint64_t)self, (uint64_t)a2, &protocolRef_HKDatabaseAccessibilityAssertionServerInterface);
}

- (HKDatabaseAccessibilityAssertionStore)init
{
  result = (HKDatabaseAccessibilityAssertionStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___HKDatabaseAccessibilityAssertionStore____lazy_storage____proxyProvider));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___HKDatabaseAccessibilityAssertionStore__healthStore);
}

@end