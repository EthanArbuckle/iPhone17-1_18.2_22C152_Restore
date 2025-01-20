@interface BuddyButtonConfigurationFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
- (BOOL)controllerNeedsToRun;
- (BYPreferencesController)buddyPreferences;
- (_TtC5Setup28BuddyButtonConfigurationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (void)setBuddyPreferences:(id)a3;
@end

@implementation BuddyButtonConfigurationFlow

- (_TtC5Setup28BuddyButtonConfigurationFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_1000196F8;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = a5;
  return (_TtC5Setup28BuddyButtonConfigurationFlow *)sub_100019198(a3, (uint64_t)a4, a5, (uint64_t)v9, v10);
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)*(id *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences];
}

- (void)setBuddyPreferences:(id)a3
{
  id v4 = *(id *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences];
  *(void *)&self->BFFFlow_opaque[OBJC_IVAR____TtC5Setup28BuddyButtonConfigurationFlow_buddyPreferences] = a3;
  id v3 = a3;
}

+ (id)allowedFlowItems
{
  sub_10000A84C(&qword_10031D690);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1002366C0;
  *(void *)(v2 + 32) = type metadata accessor for BuddyButtonConfigurationController();
  *(void *)(v2 + 40) = type metadata accessor for BuddySilentModeController();
  sub_10000A84C((uint64_t *)&unk_10031E200);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

+ (id)cloudConfigSkipKey
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = self;
  char v3 = sub_100019560();

  return v3 & 1;
}

- (void).cxx_destruct
{
}

@end