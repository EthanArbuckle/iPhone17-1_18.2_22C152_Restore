@interface ScreenSharingInteractionController
- (NSDate)latestRemoteControlDate;
- (_TtC15ConversationKit34ScreenSharingInteractionController)init;
- (int64_t)remoteControlStatus;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4;
- (void)setLatestRemoteControlDate:(id)a3;
@end

@implementation ScreenSharingInteractionController

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  ScreenSharingInteractionController.screenSharingStateMonitor(_:didUpdateScreenSharingBroadcastingState:)((uint64_t)v6, a4);
  swift_unknownObjectRelease();
}

- (int64_t)remoteControlStatus
{
  v2 = self;
  int64_t v3 = ScreenSharingInteractionController.remoteControlStatus.getter();

  return v3;
}

- (NSDate)latestRemoteControlDate
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x1F4188790](v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  ScreenSharingInteractionController.latestRemoteControlDate.getter();
  uint64_t v5 = type metadata accessor for Date();
  Class isa = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSDate *)isa;
}

- (void)setLatestRemoteControlDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  ScreenSharingInteractionController.latestRemoteControlDate.setter((uint64_t)v7);
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
}

- (void)dealloc
{
  uint64_t v2 = self;
  ScreenSharingInteractionController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_groupSessionStateCancellable, (uint64_t *)&demangling cache variable for type metadata for Cancellable?);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_observers));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<ScreenSharingInteractionSession?>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v3();
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_latestRemoteControlDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
  type metadata accessor for DeviceRestrictionController();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit34ScreenSharingInteractionController_eligibilityChecker);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<RemoteControlState>);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_26_2();
  v5();
  swift_release();
}

- (_TtC15ConversationKit34ScreenSharingInteractionController)init
{
}

@end