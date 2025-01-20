@interface ActivitySceneDelegateBase
- (UIWindow)window;
- (_TtC10ChronoCore25ActivitySceneDelegateBase)init;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation ActivitySceneDelegateBase

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window));
}

- (void)setWindow:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window) = (Class)a3;
  id v3 = a3;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1DAAFBCD8(v8);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAAFD0A8("[%{public}s] Became active");
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAAFD0A8("[%{public}s] Resigned active");
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAAFD300();
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAAFD7A8();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DAAF9708((uint64_t)v4);
}

- (_TtC10ChronoCore25ActivitySceneDelegateBase)init
{
  return (_TtC10ChronoCore25ActivitySceneDelegateBase *)sub_1DAAFA374();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_logger;
  uint64_t v4 = sub_1DAD23828();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_clientLogger, v4);
  v5((char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_viewLogger, v4);
  swift_bridgeObjectRelease();
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_metricsDefinition, &qword_1EBE48E40);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_activityService, &qword_1EBE4ADF0);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_descriptorService, &qword_1EBE4EEF0);
  sub_1DA9DD290((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_descriptor, &qword_1EBE486D8);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end