@interface BuddyCameraButtonController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)hasBlackBackground;
- (BOOL)usesWhiteBackButton;
- (BYDeviceProvider)deviceProvider;
- (BYPreferencesController)buddyPreferences;
- (_TtC5Setup27BuddyCameraButtonController)init;
- (_TtP5Setup20IntelligenceProvider_)intelligenceProvider;
- (id)viewController;
- (void)cameraButtonViewControllerDidFinish:(id)a3;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setIntelligenceProvider:(id)a3;
@end

@implementation BuddyCameraButtonController

- (_TtC5Setup27BuddyCameraButtonController)init
{
  return (_TtC5Setup27BuddyCameraButtonController *)sub_100013718();
}

- (BYPreferencesController)buddyPreferences
{
  return (BYPreferencesController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences));
}

- (void)setBuddyPreferences:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_buddyPreferences) = (Class)a3;
  id v3 = a3;
}

- (BYDeviceProvider)deviceProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYDeviceProvider *)v2;
}

- (void)setDeviceProvider:(id)a3
{
}

- (_TtP5Setup20IntelligenceProvider_)intelligenceProvider
{
  v2 = (void *)swift_unknownObjectRetain();

  return (_TtP5Setup20IntelligenceProvider_ *)v2;
}

- (void)setIntelligenceProvider:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

+ (id)cloudConfigSkipKey
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_deviceProvider);
  if (v2) {
    LOBYTE(v2) = [v2 hasCameraButton];
  }
  else {
    __break(1u);
  }
  return (char)v2;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  uint64_t v5 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1000146CC;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_100041A28((uint64_t)v7, (uint64_t)&unk_10031D4E8, (uint64_t)v11);
  swift_release();
  swift_release();
}

- (id)viewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_cachedViewController));
}

- (BOOL)hasBlackBackground
{
  return 1;
}

- (BOOL)usesWhiteBackButton
{
  return 1;
}

- (void)controllerWasPopped
{
  NSString v2 = self;
  sub_1000141D0();
}

- (void)cameraButtonViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000145B0();
}

- (void).cxx_destruct
{
  sub_1000144EC((uint64_t)self + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_presentationProvider);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Setup27BuddyCameraButtonController_cachedViewController));

  swift_unknownObjectRelease();
}

@end