@interface DOCServiceActionPopoverTrackerController
- (_TtC17RecentsAppPopover40DOCServiceActionPopoverTrackerController)init;
- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4;
- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation DOCServiceActionPopoverTrackerController

- (void)getFrameForRegion:(unint64_t)a3 completionBlock:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_100067F08;
  v7[4] = v6;
  v10[4] = sub_100067FC8;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100429F8C;
  v10[3] = &unk_1005A80E8;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v8);

  swift_release();
}

- (void)getFrameForRegion:(unint64_t)a3 waitForNewThumbnail:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = sub_100067F08;
  v8[4] = v7;
  v11[4] = sub_100067F14;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100429F8C;
  v11[3] = &unk_1005A8070;
  v9 = _Block_copy(v11);
  v10 = self;
  swift_retain();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v9);

  swift_release();
}

- (_TtC17RecentsAppPopover40DOCServiceActionPopoverTrackerController)init
{
  result = (_TtC17RecentsAppPopover40DOCServiceActionPopoverTrackerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover40DOCServiceActionPopoverTrackerController_action);
}

@end