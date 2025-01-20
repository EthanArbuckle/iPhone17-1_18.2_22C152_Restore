@interface DOCTipsManager
- (_TtC14RecentsAvocado14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC14RecentsAvocado14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_100031648(&qword_1006301E0);
    sub_1004CE040();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100039184((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado14DOCTipsManager_familyFetcher);

  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado14DOCTipsManager_familyFolderFilePath, (uint64_t *)&unk_10062B3B0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14DOCTipsManager_familySharedFolderTipView));
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_100397F68(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_10039C2B0();
}

- (_TtC14RecentsAvocado14DOCTipsManager)init
{
  result = (_TtC14RecentsAvocado14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end