@interface ShareSheetSceneSession
- (_TtC16SharingUIService22ShareSheetSceneSession)init;
- (void)activityContentViewControllerDidUpdateDataSource:(id)a3;
- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3;
- (void)dealloc;
- (void)sheetInteractionController:(id)a3 didReceiveDraggingEvent:(id)a4;
@end

@implementation ShareSheetSceneSession

- (void)dealloc
{
  v2 = self;
  sub_10000E55C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_router);
}

- (_TtC16SharingUIService22ShareSheetSceneSession)init
{
  result = (_TtC16SharingUIService22ShareSheetSceneSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)activityContentViewControllerDidUpdateDataSource:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000108DC();
}

- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000F068(v4);
}

- (void)sheetInteractionController:(id)a3 didReceiveDraggingEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000109CC((uint64_t)v7);
}

@end