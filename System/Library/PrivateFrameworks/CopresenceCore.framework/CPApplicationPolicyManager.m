@interface CPApplicationPolicyManager
+ (CPApplicationPolicyManager)sharedInstance;
- (BOOL)autoLaunchEnabled;
- (BOOL)autoSharePlayEnabled;
- (BOOL)shouldAutoLaunchAppForActivity:(id)a3 onConversation:(id)a4;
- (CPApplicationPolicyManager)init;
- (NSDictionary)authorizedBundleIdentifiers;
- (void)addDelegate:(id)a3 withQueue:(id)a4;
- (void)dealloc;
- (void)handleApplicationUninstalledNotification:(id)a3;
- (void)handleCNContactStoreDidChangeNotification:(id)a3;
- (void)setAuthorization:(BOOL)a3 forBundleID:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)updateAllowedHandlesForConversation:(id)a3;
@end

@implementation CPApplicationPolicyManager

+ (CPApplicationPolicyManager)sharedInstance
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v2 = (void *)static CPApplicationPolicyManager.shared;
  return (CPApplicationPolicyManager *)v2;
}

- (NSDictionary)authorizedBundleIdentifiers
{
  v2 = self;
  CPApplicationPolicyManager.authorizedBundleIdentifiers.getter();

  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3.super.isa;
}

- (BOOL)autoSharePlayEnabled
{
  v2 = self;
  char v3 = CPApplicationPolicyManager.autoSharePlayEnabled.getter();

  return v3 & 1;
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  v4 = self;
  CPApplicationPolicyManager.autoSharePlayEnabled.setter(a3);
}

- (BOOL)autoLaunchEnabled
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  CPApplicationPolicyManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPApplicationPolicyManager_storage);
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPApplicationPolicyManager_protectedAppsObserver, &demangling cache variable for type metadata for ProtectedAppsObserverProtocol?);
  swift_release();
}

- (void)addDelegate:(id)a3 withQueue:(id)a4
{
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0xC0);
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  uint64_t v10 = v7();
  (*(void (**)(id, id))(*(void *)v10 + 160))(a3, v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (BOOL)shouldAutoLaunchAppForActivity:(id)a3 onConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = CPApplicationPolicyManager.shouldAutoLaunchApp(for:on:)(v6, v7);

  return v9 & 1;
}

- (void)updateAllowedHandlesForConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_activitySessions);
  type metadata accessor for TUConversationActivity(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
  lazy protocol witness table accessor for type TUConversationActivitySession and conformance NSObject((unint64_t *)&lazy protocol witness table cache variable for type TUConversationActivitySession and conformance NSObject, (unint64_t *)&lazy cache variable for type metadata for TUConversationActivitySession);
  uint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  id v9 = v4;
  id v8 = v5;
  specialized Sequence.forEach(_:)(v7, v8, (uint64_t)v9);
  swift_bridgeObjectRelease();
}

- (void)setAuthorization:(BOOL)a3 forBundleID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  CPApplicationPolicyManager.setAuthorization(_:for:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (void)handleApplicationUninstalledNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  CPApplicationPolicyManager.handleApplicationUninstalledNotification(_:)((NSNotification)v4);
}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  CPApplicationPolicyManager.handleCNContactStoreDidChangeNotification(_:)((NSNotification)v4);
}

- (CPApplicationPolicyManager)init
{
  result = (CPApplicationPolicyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end