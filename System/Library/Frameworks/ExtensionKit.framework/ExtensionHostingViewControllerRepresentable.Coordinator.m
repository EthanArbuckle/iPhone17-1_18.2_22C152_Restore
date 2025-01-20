@interface ExtensionHostingViewControllerRepresentable.Coordinator
- (_TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
@end

@implementation ExtensionHostingViewControllerRepresentable.Coordinator

- (void).cxx_destruct
{
}

- (void)hostViewControllerDidActivate:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator_parent;
  uint64_t v6 = *(void *)&v5[*(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28)];
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = a3;
  id v8 = a3;
  v9 = self;

  sub_21570E1F8();
  sub_2156FB25C();
  id v10 = (id)sub_21570E238();
  sub_21570DCC8();
}

- (_TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator)init
{
  result = (_TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end