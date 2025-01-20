@interface DOCTipsManager
- (_TtC17RecentsAppPopover14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC17RecentsAppPopover14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_100031860(&qword_100620D50);
    sub_1004BEFF0();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10003D0C0((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover14DOCTipsManager_familyFetcher);

  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover14DOCTipsManager_familyFolderFilePath, (uint64_t *)&unk_100616AB0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover14DOCTipsManager_familySharedFolderTipView));
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_100377174(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_10037B3FC();
}

- (_TtC17RecentsAppPopover14DOCTipsManager)init
{
  result = (_TtC17RecentsAppPopover14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end