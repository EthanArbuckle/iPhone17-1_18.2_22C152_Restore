@interface ShellSceneKitBackedConnectedDisplayRegistry
- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4;
- (_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry)init;
@end

@implementation ShellSceneKitBackedConnectedDisplayRegistry

- (_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry)init
{
  result = (_TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_displayProfile));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21ScreenContinuityShell43ShellSceneKitBackedConnectedDisplayRegistry_profileRegsitry);
}

- (BOOL)displayProfile:(id)a3 shouldConnectToDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_1000127FC((uint64_t)v6, v7);

  return v9 & 1;
}

@end