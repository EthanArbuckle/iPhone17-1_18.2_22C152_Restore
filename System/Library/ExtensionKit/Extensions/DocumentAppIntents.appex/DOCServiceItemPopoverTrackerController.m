@interface DOCServiceItemPopoverTrackerController
- (_TtC18DocumentAppIntents38DOCServiceItemPopoverTrackerController)init;
- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4;
- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation DOCServiceItemPopoverTrackerController

- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_100068F28(a3, 1, (uint64_t)sub_10006A5B8, v7);

  swift_release();
}

- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  sub_100068F28(a3, a4, (uint64_t)sub_10006A5B8, v9);

  swift_release();
}

- (_TtC18DocumentAppIntents38DOCServiceItemPopoverTrackerController)init
{
  result = (_TtC18DocumentAppIntents38DOCServiceItemPopoverTrackerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents38DOCServiceItemPopoverTrackerController_configuration));

  swift_unknownObjectRelease();
}

@end