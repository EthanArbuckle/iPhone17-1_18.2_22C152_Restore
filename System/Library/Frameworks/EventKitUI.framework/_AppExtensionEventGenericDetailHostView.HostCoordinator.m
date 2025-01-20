@interface _AppExtensionEventGenericDetailHostView.HostCoordinator
- (_TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator)init;
- (void)didChangeBottomStatusButtonsWithBottomStatusButtonActions:(id)a3;
- (void)didChangeNavigationBarButtonsWithLeftBarButtonIDs:(id)a3 rightBarButtonIDs:(id)a4;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)requestDismissViewWithName:(id)a3 presentationStyle:(int64_t)a4;
- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5;
@end

@implementation _AppExtensionEventGenericDetailHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B40DDD88(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  v6 = (void *)MEMORY[0x1E4FBC8C8];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x88);
  id v8 = a3;
  v9 = self;
  id v11 = a4;
  v10 = (void *)v7();
  objc_msgSend(v10, sel_invalidate);

  (*(void (**)(void))((*v6 & (uint64_t)v9->super.isa) + 0x90))(0);
}

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5
{
  uint64_t v7 = sub_1B411E8C8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B411E8C8();
  uint64_t v12 = v11;
  v13 = self;
  sub_1B40DE71C(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)requestDismissViewWithName:(id)a3 presentationStyle:(int64_t)a4
{
  if (a3)
  {
    uint64_t v6 = sub_1B411E8C8();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v9 = self;
  sub_1B40DEB08(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didChangeNavigationBarButtonsWithLeftBarButtonIDs:(id)a3 rightBarButtonIDs:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v6 = sub_1B411E918();
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  if (a4) {
LABEL_3:
  }
    uint64_t v4 = sub_1B411E918();
LABEL_4:
  uint64_t v7 = self;
  sub_1B40DEEB8(v6, v4);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didChangeBottomStatusButtonsWithBottomStatusButtonActions:(id)a3
{
  if (a3)
  {
    sub_1B40E1BC8(0, &qword_1E9CFC350);
    uint64_t v4 = sub_1B411E918();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1B40DF280(v4);

  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator)init
{
  result = (_TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 8];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 24];
  uint64_t v5 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 40];
  uint64_t v6 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_parent
                              + 56];
  swift_release();
  sub_1B40DA270(v3);
  sub_1B40DA270(v4);
  sub_1B40DA270(v5);
  sub_1B40DA270(v6);
  sub_1B40E1C58((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_identity, &qword_1E9CFC168);
  uint64_t v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV10EventKitUI39_AppExtensionEventGenericDetailHostView15HostCoordinator_conn);
}

@end