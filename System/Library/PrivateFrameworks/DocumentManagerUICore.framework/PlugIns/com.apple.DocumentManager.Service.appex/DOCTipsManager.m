@interface DOCTipsManager
- (_TtC33com_apple_DocumentManager_Service14DOCTipsManager)init;
- (void)dealloc;
- (void)initiateShareFlow;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DOCTipsManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_sourceObserver);
  v3 = self;
  [v2 stopObservingSources];
  if (*(Class *)((char *)&v3->super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_sharingFlowTask))
  {
    swift_retain();
    sub_100027178((uint64_t *)&unk_10062BE00);
    sub_1004CD7F0();
    swift_release();
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DOCTipsManager(0);
  [(DOCTipsManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1000384F0((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_familyFetcher);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_sourceObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_fileManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_fpItemManager));
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_familyFolderFilePath, (uint64_t *)&unk_10062D2E0);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service14DOCTipsManager_familySharedFolderTipView));
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v7 = a3;
  v6 = self;
  sub_1001D1E80(v7, a4);
}

- (void)initiateShareFlow
{
  v2 = self;
  sub_1001D6124();
}

- (_TtC33com_apple_DocumentManager_Service14DOCTipsManager)init
{
  result = (_TtC33com_apple_DocumentManager_Service14DOCTipsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end