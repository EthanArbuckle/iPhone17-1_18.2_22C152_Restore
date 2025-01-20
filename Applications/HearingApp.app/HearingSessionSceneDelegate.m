@interface HearingSessionSceneDelegate
- (_TtC10HearingApp27HearingSessionSceneDelegate)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
@end

@implementation HearingSessionSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10000AA48(v8);
}

- (void)sceneDidDisconnect:(id)a3
{
}

- (void)sceneDidBecomeActive:(id)a3
{
}

- (void)sceneWillResignActive:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (_TtC10HearingApp27HearingSessionSceneDelegate)init
{
  uint64_t v3 = OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider;
  type metadata accessor for LiveListenSystemApertureViewController();
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)[v4 init];
  Logger.init(subsystem:category:)();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HearingSessionSceneDelegate();
  return [(HearingSessionSceneDelegate *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_systemApertureElementProvider));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10HearingApp27HearingSessionSceneDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end