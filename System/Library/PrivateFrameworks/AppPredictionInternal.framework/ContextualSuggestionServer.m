@interface ContextualSuggestionServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21AppPredictionInternal26ContextualSuggestionServer)init;
- (void)requestSnapshotsForEndpoints:(id)a3 completion:(id)a4;
@end

@implementation ContextualSuggestionServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1D13A6C18(v7);

  return v9 & 1;
}

- (void)requestSnapshotsForEndpoints:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = self;
  sub_1D13A7104((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (_TtC21AppPredictionInternal26ContextualSuggestionServer)init
{
  result = (_TtC21AppPredictionInternal26ContextualSuggestionServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal26ContextualSuggestionServer____lazy_storage___xpcListener));
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21AppPredictionInternal26ContextualSuggestionServer_suggestionStore);
}

@end