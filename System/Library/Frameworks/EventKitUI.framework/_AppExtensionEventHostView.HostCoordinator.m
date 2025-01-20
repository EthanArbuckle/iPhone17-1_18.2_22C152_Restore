@interface _AppExtensionEventHostView.HostCoordinator
- (_TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator)init;
- (void)didCompleteWithAction:(int64_t)a3;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)requestDismissViewWithName:(id)a3 presentationStyle:(int64_t)a4;
- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5 sourceRect:(id)a6 preferredContentSize:(id)a7 oopContentBackgroundColor:(id)a8;
@end

@implementation _AppExtensionEventHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B40F6EB0(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  v6 = (void *)MEMORY[0x1E4FBC8C8];
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x90);
  id v8 = a3;
  v9 = self;
  id v11 = a4;
  v10 = (void *)v7();
  objc_msgSend(v10, sel_invalidate);

  (*(void (**)(void))((*v6 & (uint64_t)v9->super.isa) + 0x98))(0);
}

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5 sourceRect:(id)a6 preferredContentSize:(id)a7 oopContentBackgroundColor:(id)a8
{
  uint64_t v12 = sub_1B411E8C8();
  uint64_t v14 = v13;
  v15 = (char *)sub_1B411E8C8();
  uint64_t v17 = v16;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = self;
  sub_1B40F8858(v12, v14, v15, v17, a5, v18, v19, a8);

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
  v9 = self;
  sub_1B40F8CC4(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didCompleteWithAction:(int64_t)a3
{
  id v4 = self;
  sub_1B40F9074(a3);
}

- (_TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator)init
{
  result = (_TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 8];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 24];
  uint64_t v5 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_parent + 40];
  swift_release();
  sub_1B40DA270(v3);
  sub_1B40DA270(v4);
  sub_1B40DA270(v5);
  sub_1B40E1C58((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_identity, &qword_1E9CFC168);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI26_AppExtensionEventHostView15HostCoordinator_conn));

  swift_release();
}

@end