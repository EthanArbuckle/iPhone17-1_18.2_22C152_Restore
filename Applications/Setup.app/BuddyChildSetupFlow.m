@interface BuddyChildSetupFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BYRunState)runState;
- (BuddyChildSetupPresenter)childSetupPresenter;
- (BuddyFeatureFlags)featureFlags;
- (MCProfileConnection)managedConfiguration;
- (_TtC5Setup19BuddyChildSetupFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (void)childSetupPresenter:(id)a3 didFail:(id)a4;
- (void)didSucceedWithChildSetupPresenter:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)setChildSetupPresenter:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setRunState:(id)a3;
- (void)setupLocationServicesWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4;
- (void)setupPasscodeWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4;
- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddyChildSetupFlow

- (_TtC5Setup19BuddyChildSetupFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_100041990;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  swift_unknownObjectRetain();
  id v12 = a5;
  return (_TtC5Setup19BuddyChildSetupFlow *)sub_10003AD5C(a3, (uint64_t)a4, a5, (uint64_t)v9, v10);
}

- (MCProfileConnection)managedConfiguration
{
  return (MCProfileConnection *)*(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration];
}

- (void)setManagedConfiguration:(id)a3
{
  id v4 = *(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration];
  *(void *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_managedConfiguration] = a3;
  id v3 = a3;
}

- (BuddyFeatureFlags)featureFlags
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BuddyFeatureFlags *)v2;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (BuddyChildSetupPresenter)childSetupPresenter
{
  return (BuddyChildSetupPresenter *)*(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter];
}

- (void)setChildSetupPresenter:(id)a3
{
  id v4 = *(id *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter];
  *(void *)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter] = a3;
  id v3 = a3;
}

+ (id)allowedFlowItems
{
  sub_10000A84C(&qword_10031D690);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1002366C0;
  *(void *)(v2 + 32) = sub_1000406C8(0, &qword_10031E160);
  *(void *)(v2 + 40) = sub_1000406C8(0, &qword_10031E170);
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

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = *(void **)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_runState];
  if (v2) {
    LOBYTE(v2) = [v2 hasCompletedInitialRun] ^ 1;
  }
  return (char)v2;
}

- (void)startFlowAnimated:(BOOL)a3
{
  NSArray v3 = self;
  sub_1000408A8();
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_10003B2E0((uint64_t)a3, (uint64_t)a4);

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)setupPasscodeWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031E1E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031E1E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031E1F0, (uint64_t)v14);
  swift_release();
}

- (void)setupLocationServicesWithNextTaskInfo:(BuddyAISFlowTaskInfo *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031E1C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031E1C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031E1D0, (uint64_t)v14);
  swift_release();
}

- (void)setupPerformAIDASignInWith:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10031E180;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10031E190;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10003F8F8((uint64_t)v9, (uint64_t)&unk_10031D850, (uint64_t)v14);
  swift_release();
}

- (void)didSucceedWithChildSetupPresenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100040AD4();
}

- (void)childSetupPresenter:(id)a3 didFail:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_100040C74();
}

- (void).cxx_destruct
{
  sub_1000417D8((uint64_t)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_passcodeFlowContinuation], &qword_10031E168);
  sub_1000417D8((uint64_t)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_locationServicesFlowContinuation], &qword_10031E168);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  NSArray v3 = *(void **)&self->managedConfiguration[OBJC_IVAR____TtC5Setup19BuddyChildSetupFlow_childSetupPresenter];
}

@end