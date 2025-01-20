@interface PresenceHostSession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)description;
- (_TtC14CopresenceCore19PresenceHostSession)init;
@end

@implementation PresenceHostSession

- (NSString)description
{
  v2 = self;
  uint64_t v3 = PresenceHostSession.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14CopresenceCore19PresenceHostSession)init
{
  result = (_TtC14CopresenceCore19PresenceHostSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();

  outlined destroy of Assertion #1 in PresenceHostSession.acquireSuspensionAssertion()((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_workQueue, (uint64_t (*)(void))type metadata accessor for AsyncSerialQueue);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_reporter);
  swift_release();

  swift_release();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_sessionSuspensionController, &demangling cache variable for type metadata for SessionSuspensionControllerProtocol?);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized PresenceHostSession.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end