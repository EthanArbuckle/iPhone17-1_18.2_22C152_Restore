@interface HDHealthStoreClientAssertions
- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)init;
- (id)accessibilityAssertions;
- (id)assertionForHKDatabaseAccessibilityAssertionWithHkDatabaseAccessibilityAssertion:(id)a3;
- (id)firstAssertion;
- (void)addAssertionMappingWithAssertion:(id)a3;
- (void)dealloc;
- (void)invalidateAssertions;
- (void)removeAssertionMappingWithAssertion:(id)a3;
@end

@implementation HDHealthStoreClientAssertions

- (void)dealloc
{
  v2 = self;
  sub_1BCBDB244();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for HDHealthStoreClientAssertions();
  [(HDHealthStoreClientAssertions *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

- (void)invalidateAssertions
{
  v2 = self;
  sub_1BCBDB244();
}

- (id)firstAssertion
{
  objc_super v3 = (os_unfair_lock_s *)((char *)self + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions__dbAssertionLock);
  swift_beginAccess();
  v4 = self;
  os_unfair_lock_lock(v3);
  swift_endAccess();
  v5 = (uint64_t *)((char *)v4
                 + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions_databaseAccessibilityAssertions);
  swift_beginAccess();
  sub_1BCBDAEE8(*v5);
  if (v7)
  {
    v8 = v6;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  swift_beginAccess();
  os_unfair_lock_unlock(v3);
  swift_endAccess();

  return v8;
}

- (id)accessibilityAssertions
{
  v2 = self;
  unint64_t v3 = sub_1BCBDB628();

  if (v3)
  {
    sub_1BCBDCA00();
    v4 = (void *)sub_1BD2E47D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)assertionForHKDatabaseAccessibilityAssertionWithHkDatabaseAccessibilityAssertion:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1BCBDB794(v4);

  return v6;
}

- (void)addAssertionMappingWithAssertion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BCBDB9D8(v4);
}

- (void)removeAssertionMappingWithAssertion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BCBDBC18(v4);
}

- (_TtC12HealthDaemon29HDHealthStoreClientAssertions)init
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions__dbAssertionLock) = 0;
  uint64_t v3 = OBJC_IVAR____TtC12HealthDaemon29HDHealthStoreClientAssertions_databaseAccessibilityAssertions;
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1BCBDB09C(MEMORY[0x1E4FBC860]);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HDHealthStoreClientAssertions();
  return [(HDHealthStoreClientAssertions *)&v6 init];
}

@end