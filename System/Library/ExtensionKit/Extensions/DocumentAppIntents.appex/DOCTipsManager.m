@interface DOCTipsManager
- (_TtC18DocumentAppIntents14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC18DocumentAppIntents14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_1000305BC(&qword_10065D850);
    sub_1004F4A10();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100037DD4((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents14DOCTipsManager_familyFetcher);

  sub_10004B8B4((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents14DOCTipsManager_familyFolderFilePath, (uint64_t *)&unk_10065ACA0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents14DOCTipsManager_familySharedFolderTipView));

  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_1003B33E0(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_1003B7668();
}

- (_TtC18DocumentAppIntents14DOCTipsManager)init
{
  result = (_TtC18DocumentAppIntents14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end