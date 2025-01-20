@interface DOCItemCollectionCandidateSource
- (_TtC18DocumentAppIntents32DOCItemCollectionCandidateSource)init;
- (void)dealloc;
@end

@implementation DOCItemCollectionCandidateSource

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_nodeCollection);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    sub_10040C1B4();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemCollectionCandidateSource();
  [(DOCItemCollectionCandidateSource *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1000415E0((uint64_t)self + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_itemCollectionConfiguration);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_nodeCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_semaphore));
  sub_100037540(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_updateHandler));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_requestID;
  uint64_t v4 = sub_1004F16E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents32DOCItemCollectionCandidateSource_sortingDescriptor;
  uint64_t v6 = sub_1004F29F0();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC18DocumentAppIntents32DOCItemCollectionCandidateSource)init
{
  result = (_TtC18DocumentAppIntents32DOCItemCollectionCandidateSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end