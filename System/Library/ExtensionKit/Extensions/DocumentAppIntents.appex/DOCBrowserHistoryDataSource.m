@interface DOCBrowserHistoryDataSource
- (_TtC18DocumentAppIntents27DOCBrowserHistoryDataSource)init;
- (void)dealloc;
- (void)tagRegistry:(id)a3 didRemoveTag:(id)a4;
- (void)tagRegistry:(id)a3 didReplaceTag:(id)a4 withTag:(id)a5;
@end

@implementation DOCBrowserHistoryDataSource

- (void)dealloc
{
  v2 = self;
  sub_1003C42DC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DOCBrowserHistoryDataSource();
  [(DOCBrowserHistoryDataSource *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents27DOCBrowserHistoryDataSource_observableTrashCollection));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents27DOCBrowserHistoryDataSource_sourcesObserverToken));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents27DOCBrowserHistoryDataSource_sourceObserver));

  swift_release();
}

- (_TtC18DocumentAppIntents27DOCBrowserHistoryDataSource)init
{
  result = (_TtC18DocumentAppIntents27DOCBrowserHistoryDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)tagRegistry:(id)a3 didRemoveTag:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a4;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1003D5518;
  *(void *)(v8 + 24) = v7;
  id v9 = a4;
  id v10 = a3;
  v11 = self;
  swift_retain();
  sub_1003C2E44();

  swift_release();

  swift_release();
}

- (void)tagRegistry:(id)a3 didReplaceTag:(id)a4 withTag:(id)a5
{
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a4;
  *(void *)(v9 + 24) = a5;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_1003D5510;
  *(void *)(v10 + 24) = v9;
  id v11 = a4;
  id v12 = a5;
  id v13 = v11;
  id v14 = v12;
  id v15 = a3;
  v16 = self;
  swift_retain();
  sub_1003C2E44();

  swift_release();

  swift_release();
}

@end