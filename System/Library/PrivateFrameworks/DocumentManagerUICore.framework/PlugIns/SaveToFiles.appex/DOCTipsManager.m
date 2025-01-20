@interface DOCTipsManager
- (_TtC11SaveToFiles14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC11SaveToFiles14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_100026870(&qword_10062F710);
    sub_1004D1740();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100035EE0((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles14DOCTipsManager_familyFetcher);

  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles14DOCTipsManager_familyFolderFilePath, &qword_10062D9F0);
  swift_release();

  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_1000A6904(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_1000AACF4();
}

- (_TtC11SaveToFiles14DOCTipsManager)init
{
  result = (_TtC11SaveToFiles14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end