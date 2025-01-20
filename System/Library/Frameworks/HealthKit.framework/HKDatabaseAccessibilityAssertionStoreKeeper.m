@interface HKDatabaseAccessibilityAssertionStoreKeeper
- (HKDatabaseAccessibilityAssertionStoreKeeper)init;
- (HKDatabaseAccessibilityAssertionStoreKeeper)initWithHealthStore:(id)a3;
- (void)connectionConfigured;
- (void)dealloc;
- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)invalidateAllDatabaseAccessibilityAssertions;
- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3;
@end

@implementation HKDatabaseAccessibilityAssertionStoreKeeper

- (HKDatabaseAccessibilityAssertionStoreKeeper)initWithHealthStore:(id)a3
{
  return (HKDatabaseAccessibilityAssertionStoreKeeper *)DatabaseAccessibilityAssertionStoreKeeper.init(healthStore:)(a3);
}

- (void)dealloc
{
  v3 = (_DWORD *)((char *)self
                + OBJC_IVAR___HKDatabaseAccessibilityAssertionStoreKeeper__didBecomeAvailableNotificationToken);
  swift_beginAccess();
  LODWORD(v3) = *v3;
  v4 = self;
  notify_cancel((int)v3);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for DatabaseAccessibilityAssertionStoreKeeper();
  [(HKDatabaseAccessibilityAssertionStoreKeeper *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___HKDatabaseAccessibilityAssertionStoreKeeper____lazy_storage____queue);
}

- (void)fetchDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_19C2D9ED8();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_19C2B9E3C(v8, v10, (uint64_t)sub_19C2AC284, v11, a4);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)connectionConfigured
{
  v2 = self;
  sub_19C2BCB90();
}

- (void)invalidateAllDatabaseAccessibilityAssertions
{
  v2 = self;
  sub_19C2BCED0();
}

- (void)invalidateDatabaseAccessibilityAssertionWithAssertion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_19C2BD20C(v4);
}

- (HKDatabaseAccessibilityAssertionStoreKeeper)init
{
  result = (HKDatabaseAccessibilityAssertionStoreKeeper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end