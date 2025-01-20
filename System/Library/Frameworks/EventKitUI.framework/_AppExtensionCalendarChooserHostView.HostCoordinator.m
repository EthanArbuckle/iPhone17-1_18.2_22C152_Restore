@interface _AppExtensionCalendarChooserHostView.HostCoordinator
- (_TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator)init;
- (void)calendarSelectionChanged:(id)a3 allSelected:(BOOL)a4;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5;
@end

@implementation _AppExtensionCalendarChooserHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B4118BF4(v4);
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

- (void)requestPresentViewWithName:(id)a3 viewID:(id)a4 presentationStyle:(int64_t)a5
{
  uint64_t v7 = sub_1B411E8C8();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1B411E8C8();
  uint64_t v12 = v11;
  v13 = self;
  sub_1B4119898(v7, v9, v10, v12, a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)calendarSelectionChanged:(id)a3 allSelected:(BOOL)a4
{
  sub_1B40E1BC8(0, &qword_1E9CFCF00);
  uint64_t v6 = sub_1B411E918();
  uint64_t v7 = self;
  sub_1B4119C84(v6, a4);

  swift_bridgeObjectRelease();
}

- (_TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator)init
{
  result = (_TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                              + 8];
  uint64_t v4 = *(void *)&self->parent[OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_parent
                              + 24];
  swift_release();
  sub_1B40DA270(v3);
  sub_1B40DA270(v4);
  sub_1B40E1C58((uint64_t)self + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_identity, &qword_1E9CFC168);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV10EventKitUI36_AppExtensionCalendarChooserHostView15HostCoordinator_conn));

  swift_release();
}

@end