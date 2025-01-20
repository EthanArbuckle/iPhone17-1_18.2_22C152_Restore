@interface CPActivitySession
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CPActivitySession)init;
- (NSString)description;
- (NSString)persistentSceneIdentifier;
- (NSUUID)identifier;
- (NSXPCListenerEndpoint)endpoint;
- (TUConversationActivity)activity;
- (TUConversationActivitySession)tuConversationActivitySession;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)associateSceneWithSceneID:(id)a3;
- (void)dealloc;
- (void)permitJoin;
- (void)receivedResourceAtURL:(id)a3 withMetadata:(id)a4 fromParticipantIdentifier:(unint64_t)a5;
- (void)resetSession;
- (void)setActivity:(id)a3;
- (void)updateActivityImage:(id)a3;
- (void)updateApplicationState:(unint64_t)a3;
@end

@implementation CPActivitySession

- (NSUUID)identifier
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (NSString)persistentSceneIdentifier
{
  NSUUID v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x1A8);
  v3 = self;
  uint64_t v4 = v2();
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v6 = v4 + 16 * v5;
    uint64_t v7 = *(void *)(v6 + 16);
    uint64_t v8 = *(void *)(v6 + 24);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    v9 = (void *)MEMORY[0x1B3EA1B00](v7, v8);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    v9 = 0;
  }
  return (NSString *)v9;
}

- (TUConversationActivity)activity
{
  NSUUID v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySession_activity);
  swift_beginAccess();
  return (TUConversationActivity *)*v2;
}

- (void)setActivity:(id)a3
{
  uint64_t v5 = (id **)((char *)self + OBJC_IVAR___CPActivitySession_activity);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = (id *)a3;
  id v7 = a3;
  uint64_t v8 = self;
  ActivitySession.activity.didset(v6);
}

- (TUConversationActivitySession)tuConversationActivitySession
{
  NSUUID v2 = self;
  id v3 = ActivitySession.tuConversationActivitySession.getter();

  return (TUConversationActivitySession *)v3;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CPActivitySession_endpoint));
}

- (void)permitJoin
{
  NSUUID v2 = self;
  ActivitySession.permitJoin()();
}

- (void)dealloc
{
  NSUUID v2 = self;
  ActivitySession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR___CPActivitySession_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___CPActivitySession_activityInterval;
  uint64_t v6 = type metadata accessor for DateInterval();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySession_domainAssertion, &demangling cache variable for type metadata for ActivitySession.DomainAssertionWrapper?);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  id v7 = (char *)self + OBJC_IVAR___CPActivitySession__state;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ActivitySession.State>);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  v9 = (char *)self + OBJC_IVAR___CPActivitySession_timestamp;
  uint64_t v10 = type metadata accessor for Date();
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___CPActivitySession_localCreationTimestamp, v10);
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySession_permittedJoinTimestamp, (uint64_t *)&demangling cache variable for type metadata for Date?);
  swift_release();
  swift_bridgeObjectRelease();
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR___CPActivitySession_sessionManager);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPActivitySession_notificationCenter);
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySession_connection);
}

- (void)updateApplicationState:(unint64_t)a3
{
  uint64_t v4 = self;
  ActivitySession.updateApplicationState(_:)(a3);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = specialized ActivitySession.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (void)associateSceneWithSceneID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = v5;
  uint64_t v8 = self;
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  ActivitySession.associateScene(sceneID:)(v7);
  swift_bridgeObjectRelease();
}

- (CPActivitySession)init
{
  result = (CPActivitySession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateActivityImage:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  ActivitySession.updateActivityImage(_:)();
  outlined consume of Data._Representation(v5, v7);
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  specialized ActivitySession.assertionWillInvalidate(_:)();
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  unint64_t v7 = self;
  id v8 = a4;
  specialized ActivitySession.assertion(_:didInvalidateWithError:)(a4);
}

- (void)resetSession
{
  NSUUID v2 = self;
  ActivitySession.resetSession()();
}

- (void)receivedResourceAtURL:(id)a3 withMetadata:(id)a4 fromParticipantIdentifier:(unint64_t)a5
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a4;
  v13 = self;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  ActivitySession.receivedResource(atURL:withMetadata:fromParticipantIdentifier:)((uint64_t)v11, v14, v16, a5);
  outlined consume of Data._Representation(v14, v16);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (NSString)description
{
  NSUUID v2 = self;
  uint64_t v3 = ActivitySession.description.getter();
  uint64_t v5 = v4;

  id v6 = (void *)MEMORY[0x1B3EA1B00](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end