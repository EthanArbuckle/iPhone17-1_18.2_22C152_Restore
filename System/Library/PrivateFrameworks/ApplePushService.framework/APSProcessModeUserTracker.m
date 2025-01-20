@interface APSProcessModeUserTracker
- (APSProcessModeUserTracker)init;
- (APSProcessModeUserTracker)initWithMultiUserMode:(id)a3;
- (APSUser)defaultUser;
- (APSUserTrackerResponder)responder;
- (BOOL)usersAreCurrentlyLoading;
- (NSArray)sortedLoggedInUsers;
- (id)dependenciesForUser:(id)a3;
- (id)userForConnection:(id)a3;
- (void)setResponder:(id)a3;
- (void)startup;
@end

@implementation APSProcessModeUserTracker

- (APSUserTrackerResponder)responder
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (APSUserTrackerResponder *)Strong;
}

- (void)setResponder:(id)a3
{
}

- (APSProcessModeUserTracker)initWithMultiUserMode:(id)a3
{
  id v3 = a3;
  v4 = (APSProcessModeUserTracker *)sub_1000BB6FC(v3);

  return v4;
}

- (APSProcessModeUserTracker)init
{
  result = (APSProcessModeUserTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000BB7F8((uint64_t)self + OBJC_IVAR___APSProcessModeUserTracker_responder);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APSProcessModeUserTracker_userModeUser);
}

- (NSArray)sortedLoggedInUsers
{
  v2 = self;
  sub_1000BB1B4();

  sub_1000B8E78(&qword_10015A598);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v3.super.isa;
}

- (BOOL)usersAreCurrentlyLoading
{
  return 0;
}

- (void)startup
{
  v2 = self;
  sub_1000BB2B4();
}

- (id)userForConnection:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1000BB820();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();

  return v5;
}

- (APSUser)defaultUser
{
  return (APSUser *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___APSProcessModeUserTracker_systemModeUser));
}

- (id)dependenciesForUser:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = sub_1000BB8E4(a3);
  swift_unknownObjectRelease();

  return v6;
}

@end