@interface DOCDocumentManager.DocumentCreationSession
- (_TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession)init;
- (void)dealloc;
@end

@implementation DOCDocumentManager.DocumentCreationSession

- (void)dealloc
{
  v2 = self;
  sub_10007B8A0();
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession_identifier;
  uint64_t v4 = sub_1004CA5F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession_targetLocation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession_serviceViewController));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession_snapshotCoverView);
}

- (_TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession)init
{
  result = (_TtCC33com_apple_DocumentManager_Service18DOCDocumentManager23DocumentCreationSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end