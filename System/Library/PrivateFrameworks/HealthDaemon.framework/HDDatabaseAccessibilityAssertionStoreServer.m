@interface HDDatabaseAccessibilityAssertionStoreServer
+ (id)taskIdentifier;
- (HDDatabaseAccessibilityAssertionStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_invalidateDatabaseAccessibilityAssertion:(id)a3;
- (void)remote_requestDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4;
@end

@implementation HDDatabaseAccessibilityAssertionStoreServer

- (HDDatabaseAccessibilityAssertionStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  uint64_t v10 = sub_1BD2E46A0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD2E4690();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___HDDatabaseAccessibilityAssertionStoreServer____lazy_storage___queue) = 0;
  id v14 = a4;
  id v15 = a5;
  swift_unknownObjectRetain();
  v16 = (void *)sub_1BD2E4680();
  v17 = (objc_class *)type metadata accessor for DatabaseAccessibilityAssertionStoreServer();
  v22.receiver = self;
  v22.super_class = v17;
  v18 = [(HDStandardTaskServer *)&v22 initWithUUID:v16 configuration:v14 client:v15 delegate:a6];

  v19 = v18;
  id v20 = sub_1BCBD6B6C();

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v19;
}

- (id)exportedInterface
{
  sub_1BD2E4740();
  v2 = (void *)sub_1BD2E4730();

  return v2;
}

- (id)remoteInterface
{
  sub_1BD2E4740();
  v2 = (void *)sub_1BD2E4720();

  return v2;
}

+ (id)taskIdentifier
{
  sub_1BD2E4740();
  sub_1BD2E4710();
  v2 = (void *)sub_1BD2E4760();
  swift_bridgeObjectRelease();

  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HDDatabaseAccessibilityAssertionStoreServer____lazy_storage___queue));
}

- (void)remote_invalidateDatabaseAccessibilityAssertion:(id)a3
{
  id v5 = a3;
  v6 = self;
  DatabaseAccessibilityAssertionStoreServer.remote_invalidateDatabaseAccessibilityAssertion(_:)(a3);
}

- (void)remote_requestDatabaseAccessibilityAssertionForOwnerIdentifier:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_1BD2E4770();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  DatabaseAccessibilityAssertionStoreServer.remote_requestDatabaseAccessibilityAssertion(forOwnerIdentifier:completion:)(v6, v8, (uint64_t)sub_1BCBD7974, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

@end