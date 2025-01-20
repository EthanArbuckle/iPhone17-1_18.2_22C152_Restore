@interface AAAppSessionManager
- (AAAppSessionManager)init;
- (AAAppSessionManager)initWithTrackingConsent:(id)a3;
- (id)createSessionManager;
- (void)appSessionDidTerminate;
- (void)endAppSession:(id)a3;
- (void)startAppSession;
- (void)startAppSessionWithShouldCorrelateSceneSessions:(BOOL)a3;
@end

@implementation AAAppSessionManager

- (AAAppSessionManager)init
{
  return (AAAppSessionManager *)BridgedAppSessionManager.init()();
}

- (AAAppSessionManager)initWithTrackingConsent:(id)a3
{
  id v3 = a3;
  v4 = (AAAppSessionManager *)sub_1A914FC24(v3);

  return v4;
}

- (id)createSessionManager
{
  uint64_t v3 = type metadata accessor for SessionManagerConfiguration();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = self;
  sub_1A914ECC0((uint64_t)v5);
  v7 = AppSessionManager.createSessionManager(with:)(v5);
  sub_1A914FDFC((uint64_t)v5);
  id v8 = objc_allocWithZone((Class)type metadata accessor for BridgedSessionManager());
  id v9 = sub_1A9156088((uint64_t)v7);

  return v9;
}

- (void)startAppSession
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  uint64_t v4 = *(void *)(v3 + 24);
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 1;
  *(void *)(v5 + 24) = v3;
  v6 = self;
  swift_retain();
  sub_1A908CAA8(v4, (uint64_t)sub_1A91465C0, v5);

  swift_release();
}

- (void)startAppSessionWithShouldCorrelateSceneSessions:(BOOL)a3
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAAppSessionManager_appSessionManager);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = v5;
  id v8 = self;
  swift_retain();
  sub_1A908CAA8(v6, (uint64_t)sub_1A91465C0, v7);

  swift_release();
}

- (void)endAppSession:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  BridgedAppSessionManager.endAppSession(_:)((uint64_t)sub_1A90BA534, v5);

  swift_release();
}

- (void)appSessionDidTerminate
{
  v2 = self;
  BridgedAppSessionManager.appSessionDidTerminate()();
}

- (void).cxx_destruct
{
}

@end