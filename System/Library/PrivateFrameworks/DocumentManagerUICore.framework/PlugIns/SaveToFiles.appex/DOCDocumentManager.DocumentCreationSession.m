@interface DOCDocumentManager.DocumentCreationSession
- (_TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession)init;
- (void)dealloc;
@end

@implementation DOCDocumentManager.DocumentCreationSession

- (void)dealloc
{
  v2 = self;
  sub_10016EA4C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession_identifier;
  uint64_t v4 = sub_1004CE540();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession_targetLocation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession_serviceViewController));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession_snapshotCoverView);
}

- (_TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession)init
{
  result = (_TtCC11SaveToFiles18DOCDocumentManager23DocumentCreationSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end