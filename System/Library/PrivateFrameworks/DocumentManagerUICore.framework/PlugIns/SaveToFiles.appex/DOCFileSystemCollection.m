@interface DOCFileSystemCollection
- (BOOL)isGathering;
- (_TtC11SaveToFiles23DOCFileSystemCollection)init;
- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5;
- (void)childrenAdded:(id)a3 to:(id)a4;
- (void)childrenDeleted:(id)a3 from:(id)a4;
- (void)nodeChanged:(id)a3 for:(unsigned int)a4;
- (void)openSyncCompleted:(id)a3;
- (void)openSyncStarted:(id)a3;
- (void)setIsGathering:(BOOL)a3;
- (void)temporaryNodeDeleted:(id)a3;
@end

@implementation DOCFileSystemCollection

- (BOOL)isGathering
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_isGathering);
}

- (void)setIsGathering:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_isGathering) = a3;
  if (a3)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = self;
    v7[4] = sub_10026A740;
    v7[5] = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_100053418;
    v7[3] = &unk_1005CE2E8;
    v5 = _Block_copy(v7);
    v6 = self;
    swift_release();
    DOCRunInMainThread();
    _Block_release(v5);
  }
}

- (_TtC11SaveToFiles23DOCFileSystemCollection)init
{
  result = (_TtC11SaveToFiles23DOCFileSystemCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_delegate);
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_sourceObserverToken));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_iCloudRootNodeObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_itemFilteringPredicate));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_nodesUpdatesFlushInterval;
  uint64_t v4 = sub_1004D0F40();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_lastFlushTime, &qword_100636950);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles23DOCFileSystemCollection_observer);
}

- (void)childChanged:(id)a3 in:(id)a4 for:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_100261F50(v8, v9, a5);
}

- (void)nodeChanged:(id)a3 for:(unsigned int)a4
{
  id v6 = a3;
  v7 = self;
  sub_100262C10(v6, a4);
}

- (void)childrenAdded:(id)a3 to:(id)a4
{
}

- (void)childrenDeleted:(id)a3 from:(id)a4
{
}

- (void)temporaryNodeDeleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100265A24(v4);
}

- (void)openSyncStarted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10026631C(v4);
}

- (void)openSyncCompleted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100266B30(v4);
}

@end