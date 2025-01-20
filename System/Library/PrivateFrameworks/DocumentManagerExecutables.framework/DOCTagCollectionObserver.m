@interface DOCTagCollectionObserver
- (_TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver)init;
- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4;
- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation DOCTagCollectionObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = sub_22BE92CD8();
    uint64_t v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  sub_22BE934B8();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_22BDD6A0C(&qword_268486DC0, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v15 = sub_22BE92BF8();

LABEL_8:
  sub_22BE5E7E8(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22BDD473C((uint64_t)v18);
}

- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5
{
  id v6 = a3;
  v7 = self;
  sub_22BE5FB98();
}

- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4
{
  id v5 = a3;
  id v6 = self;
  sub_22BE5FB98();
}

- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5
{
  if (a5)
  {
    sub_22BDD9D50(0, (unint64_t *)&qword_26AF00490);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268487560);
    sub_22BE5FE98(&qword_268488098, (unint64_t *)&qword_26AF00490);
    sub_22BE92BF8();
  }
  id v7 = a3;
  v8 = self;
  sub_22BE5FB98();

  swift_bridgeObjectRelease();
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_22BE5FB98();
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;

  sub_22BE5FB98();
  _Block_release(v6);
}

- (_TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver)init
{
  return (_TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver *)sub_22BE5F0FC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_serialQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_group));
  v3 = (char *)self
     + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_spotlightQueryTimeout;
  uint64_t v4 = sub_22BE92AD8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutablesP33_A9279F4482FEAC8D0F3BCF83DF142AB324DOCTagCollectionObserver_collection);
}

@end