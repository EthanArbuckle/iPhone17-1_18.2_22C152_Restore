@interface ThumbnailProvider
- (_TtC17ASVAssetThumbnail17ThumbnailProvider)init;
- (void)dealloc;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ThumbnailProvider

- (_TtC17ASVAssetThumbnail17ThumbnailProvider)init
{
  return (_TtC17ASVAssetThumbnail17ThumbnailProvider *)sub_10000CBB0();
}

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_10000CF50(v8, (uint64_t)sub_1000070B0, v7);

  swift_release();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1000146D0;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D9D8();
  sub_100005648(v6, (uint64_t)qword_1000148A8);
  uint64_t v7 = sub_10000D9B8();
  os_log_type_t v8 = sub_10000DAE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "ARQL_Thumbnail deinit ThumbnailProvider shared", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(ThumbnailProvider *)&v10 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17ASVAssetThumbnail17ThumbnailProvider_usdRealityProvider));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC17ASVAssetThumbnail17ThumbnailProvider_objectCaptureProvider);
}

@end