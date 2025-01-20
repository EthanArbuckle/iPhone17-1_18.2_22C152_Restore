@interface CPActivitySessionManager
+ (BOOL)supportsMultipleActivitySessions;
- (BOOL)handedOff;
- (CPActivitySessionManager)init;
- (CPActivitySessionManager)initWithIdentifier:(id)a3 groupUUID:(id)a4 activities:(id)a5 applicationController:(id)a6 delegate:(id)a7 queue:(id)a8 systemStateObserver:(id)a9;
- (CPActivitySessionManagerDelegate)delegate;
- (CPApplicationLauncher)applicationLauncher;
- (NSSet)activitySessions;
- (NSSet)tuActivitySessions;
- (NSSet)tuSystemActivitySessions;
- (NSUUID)identifier;
- (id)createActivitySessionWithTuActivitySession:(id)a3;
- (void)applicationController:(id)a3 bundleIdentifierChanged:(id)a4;
- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)leaveActivitySessionWithUUID:(id)a3;
- (void)presentSessionDismissalAlertForActivitySessionUUID:(id)a3 allowingCancellation:(BOOL)a4 completionHandler:(id)a5;
- (void)refreshActivitySessionActiveParticipants;
- (void)refreshDataCryptors;
- (void)removeActivitySessionWithUUID:(id)a3 usingHandle:(id)a4;
- (void)removeLocalScreenSharingSessions;
- (void)removeScreenSharingSessions;
- (void)resetNonScreenSharingSessions;
- (void)resetSceneAssociationsForBundleID:(id)a3;
- (void)resetSessions;
- (void)setApplicationLauncher:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandedOff:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 forActivitySessionWithUUID:(id)a4;
- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4;
- (void)updateActivitySessionWithUUID:(id)a3 activity:(id)a4;
- (void)updateVirtualParticipantIdentifier:(unint64_t)a3;
@end

@implementation CPActivitySessionManager

- (NSUUID)identifier
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  return (NSUUID *)v2.super.isa;
}

- (NSSet)activitySessions
{
  NSUUID v2 = self;
  ActivitySessionManager.activitySessions.getter();

  type metadata accessor for ActivitySession(0);
  lazy protocol witness table accessor for type BackgroundSession and conformance BackgroundSession((unint64_t *)&lazy protocol witness table cache variable for type ActivitySession and conformance NSObject, (void (*)(uint64_t))type metadata accessor for ActivitySession);
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v3.super.isa;
}

- (CPActivitySessionManagerDelegate)delegate
{
  NSUUID v2 = (char *)self + OBJC_IVAR___CPActivitySessionManager_delegate;
  swift_beginAccess();
  NSSet v3 = (void *)MEMORY[0x1B3EA3B30](v2);
  return (CPActivitySessionManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (CPApplicationLauncher)applicationLauncher
{
  NSUUID v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___CPActivitySessionManager_applicationLauncher);
  swift_beginAccess();
  return (CPApplicationLauncher *)*v2;
}

- (void)setApplicationLauncher:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___CPActivitySessionManager_applicationLauncher);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BOOL)handedOff
{
  NSUUID v2 = (BOOL *)self + OBJC_IVAR___CPActivitySessionManager_handedOff;
  swift_beginAccess();
  return *v2;
}

- (void)setHandedOff:(BOOL)a3
{
  v5 = (BOOL *)self + OBJC_IVAR___CPActivitySessionManager_handedOff;
  swift_beginAccess();
  BOOL *v5 = a3;
  id v6 = self;
  ActivitySessionManager.handedOff.didset();
}

+ (BOOL)supportsMultipleActivitySessions
{
  return 0;
}

- (NSSet)tuActivitySessions
{
  return (NSSet *)@objc ActivitySessionManager.tuSystemActivitySessions.getter(self, (uint64_t)a2, (void (*)(void))ActivitySessionManager.tuActivitySessions.getter);
}

- (NSSet)tuSystemActivitySessions
{
  return (NSSet *)@objc ActivitySessionManager.tuSystemActivitySessions.getter(self, (uint64_t)a2, (void (*)(void))ActivitySessionManager.tuSystemActivitySessions.getter);
}

- (CPActivitySessionManager)initWithIdentifier:(id)a3 groupUUID:(id)a4 activities:(id)a5 applicationController:(id)a6 delegate:(id)a7 queue:(id)a8 systemStateObserver:(id)a9
{
  v22[1] = self;
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  v17 = (char *)v22 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
  _sSo29TUConversationActivitySessionCSo8NSObjectCSH10ObjectiveCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type TUConversationActivity and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivity);
  uint64_t v18 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v19 = a6;
  swift_unknownObjectRetain();
  id v20 = a8;
  swift_unknownObjectRetain();
  return (CPActivitySessionManager *)ActivitySessionManager.init(id:groupUUID:activities:applicationController:delegate:queue:systemStateObserver:)((uint64_t)v17, (uint64_t)v15, v18, (uint64_t)v19, (uint64_t)a7, (uint64_t)v20, (uint64_t)a9);
}

- (id)createActivitySessionWithTuActivitySession:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)ActivitySessionManager.createActivitySession(tuActivitySession:)(v4);

  return v6;
}

- (void)leaveActivitySessionWithUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  ActivitySessionManager.leaveActivitySession(activitySessionUUID:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)presentSessionDismissalAlertForActivitySessionUUID:(id)a3 allowingCancellation:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  uint64_t v12 = self;
  specialized ActivitySessionManager.presentSessionDismissalAlert(activitySessionUUID:allowingCancellation:completion:)((uint64_t)v10, (char *)v12, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)removeActivitySessionWithUUID:(id)a3 usingHandle:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  v11 = self;
  ActivitySessionManager.removeActivitySession(activitySessionUUID:using:)((uint64_t)v9, a4);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)updateActivitySessionWithUUID:(id)a3 activity:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  v11 = self;
  ActivitySessionManager.updateActivitySession(activitySessionUUID:activity:)((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)setUsingAirplay:(BOOL)a3 forActivitySessionWithUUID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = self;
  ActivitySessionManager.setUsingAirplay(_:_:)(a3, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)refreshDataCryptors
{
  NSUUID v2 = self;
  ActivitySessionManager.refreshDataCryptors()();
}

- (void)refreshActivitySessionActiveParticipants
{
  NSUUID v2 = self;
  ActivitySessionManager.refreshActivitySessionActiveParticipants()();
}

- (void)resetSessions
{
  NSUUID v2 = self;
  ActivitySessionManager.resetSessions()();
}

- (void)resetNonScreenSharingSessions
{
  NSUUID v2 = self;
  ActivitySessionManager.resetNonScreenSharingSessions()();
}

- (void)removeScreenSharingSessions
{
  NSUUID v2 = self;
  ActivitySessionManager.removeScreenSharingSessions()();
}

- (void)removeLocalScreenSharingSessions
{
  NSUUID v2 = self;
  ActivitySessionManager.removeLocalScreenSharingSessions()();
}

- (void)resetSceneAssociationsForBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  ActivitySessionManager.resetSceneAssociations(for:)(v8);

  swift_bridgeObjectRelease();
}

- (void)updateVirtualParticipantIdentifier:(unint64_t)a3
{
  uint64_t v4 = self;
  ActivitySessionManager.updateVirtualParticipantId(_:)(a3);
}

- (CPActivitySessionManager)init
{
  result = (CPActivitySessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSSet v3 = (char *)self + OBJC_IVAR___CPActivitySessionManager_id;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CPActivitySessionManager_groupUUID, v4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v6 = (char *)self + OBJC_IVAR___CPActivitySessionManager___activitySessions;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Set<ActivitySession>>);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR___CPActivitySessionManager_delegate);

  swift_release();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPActivitySessionManager____lazy_storage___protectedStorage, (uint64_t *)&demangling cache variable for type metadata for ProtectedStorage?);
  swift_release();
  swift_release();
  swift_release();
}

- (void)applicationController:(id)a3 bundleIdentifierChanged:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  ActivitySessionManager.applicationController(_:bundleIdentifierChanged:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)systemStateObserver:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
}

- (void)audioPolicyManager:(id)a3 sharePlayAllowedStateChanged:(BOOL)a4
{
}

@end