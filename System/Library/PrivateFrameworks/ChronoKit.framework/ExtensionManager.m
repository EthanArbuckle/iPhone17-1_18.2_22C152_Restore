@interface ExtensionManager
- (_TtC9ChronoKit16ExtensionManager)init;
- (void)dealloc;
- (void)pluginsDidUninstall:(id)a3;
@end

@implementation ExtensionManager

- (void)dealloc
{
  sub_1DA7A1A44((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_nsExtensionDiscoverer, (uint64_t)v8);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  __swift_project_boxed_opaque_existential_0(v8, v9);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 32);
  v6 = self;
  v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for ExtensionManager();
  [(ExtensionManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_nsExtensionDiscoverer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_remoteWidgetExtensionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_applicationWorkspace);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ChronoKit16ExtensionManager_extensionFactory);
}

- (void)pluginsDidUninstall:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1DA98C288();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1DA85E1FC(v4);

  swift_bridgeObjectRelease();
}

- (_TtC9ChronoKit16ExtensionManager)init
{
  result = (_TtC9ChronoKit16ExtensionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end