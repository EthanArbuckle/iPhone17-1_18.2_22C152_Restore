@interface SharePlayDiscoverabilityAppsController
- (_TtC15ConversationKit38SharePlayDiscoverabilityAppsController)init;
- (void)dealloc;
- (void)handleCallConnected:(id)a3;
@end

@implementation SharePlayDiscoverabilityAppsController

- (_TtC15ConversationKit38SharePlayDiscoverabilityAppsController)init
{
  return (_TtC15ConversationKit38SharePlayDiscoverabilityAppsController *)SharePlayDiscoverabilityAppsController.init()();
}

- (void)dealloc
{
  v2 = self;
  SharePlayDiscoverabilityAppsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_foregroundApp));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController____lazy_storage___suggester));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_entitlementsChecker);
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit38SharePlayDiscoverabilityAppsController_protectedAppsObserver, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
}

- (void)handleCallConnected:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  SharePlayDiscoverabilityAppsController.handleCallConnected(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end