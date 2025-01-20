@interface CPConversationManagerHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CPConversationManagerHost)init;
- (CPConversationManagerHost)initWithDataSource:(id)a3;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)conversationManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6;
- (void)conversationManager:(id)a3 sharePlayAllowedChanged:(BOOL)a4;
- (void)dealloc;
@end

@implementation CPConversationManagerHost

- (CPConversationManagerHost)initWithDataSource:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v5 = objc_allocWithZone((Class)CPFeatureFlags);
  swift_unknownObjectRetain();
  v6 = specialized ConversationManagerHost.init(dataSource:featureFlags:)((uint64_t)a3, objc_msgSend(v5, sel_init), (char *)objc_allocWithZone(ObjectType));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (CPConversationManagerHost *)v6;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPConversationManagerHost_listener);
  id v5 = self;
  objc_msgSend(v4, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR___CPConversationManagerHost_listenerDeprecated), sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(CPConversationManagerHost *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPConversationManagerHost____lazy_storage___protectedStorage, (uint64_t *)&demangling cache variable for type metadata for ProtectedStorage?);
}

- (CPConversationManagerHost)init
{
  result = (CPConversationManagerHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  specialized ConversationManagerHost.conversationManager(_:conversationChanged:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 sharePlayAllowedChanged:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectRetain();
  objc_super v6 = self;
  specialized ConversationManagerHost.conversationManager(_:sharePlayAllowedChanged:)(v4);
  swift_unknownObjectRelease();
}

- (void)conversationManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  specialized ConversationManagerHost.conversationManager(_:requestedEndpointWithIdentifier:activitySession:completion:)(v9, v11, v13, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSXPCListenerEndpoint?) -> (), v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized ConversationManagerHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end