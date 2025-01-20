@interface _AppExtensionHostView.HostCoordinator
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (_TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation _AppExtensionHostView.HostCoordinator

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  uint64_t v6 = qword_1E913B6C0;
  id v7 = a3;
  v13 = self;
  id v8 = a4;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_18B984398();
  __swift_project_value_buffer(v9, (uint64_t)qword_1E913C880);
  v10 = sub_18B984378();
  os_log_type_t v11 = sub_18B9861F8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_18B625000, v10, v11, "Will be deactivating the host view...", v12, 2u);
    MEMORY[0x18C137ED0](v12, -1, -1);
  }
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18B68EA94(v4);
}

- (_TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator)init
{
  result = (_TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B68C2C0((uint64_t)self + OBJC_IVAR____TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator_parent, type metadata accessor for _AppExtensionHostView);
  sub_18B66405C((uint64_t)self + OBJC_IVAR____TtCV10ContactsUI21_AppExtensionHostView15HostCoordinator_identity, (uint64_t *)&unk_1E913CB28);

  swift_unknownObjectRelease();
}

@end