@interface USDRealityThumbnailProvider
- (_TtC17ASVAssetThumbnail27USDRealityThumbnailProvider)init;
- (void)dealloc;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation USDRealityThumbnailProvider

- (_TtC17ASVAssetThumbnail27USDRealityThumbnailProvider)init
{
  return (_TtC17ASVAssetThumbnail27USDRealityThumbnailProvider *)sub_10000238C();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1000146A0;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D9D8();
  sub_100005648(v6, (uint64_t)qword_1000146A8);
  v7 = sub_10000D9B8();
  os_log_type_t v8 = sub_10000DAE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "ARQL_Thumbnail deinit USDRealityThumbnailProvider", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(USDRealityThumbnailProvider *)&v10 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC17ASVAssetThumbnail27USDRealityThumbnailProvider_serialQueue));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC17ASVAssetThumbnail27USDRealityThumbnailProvider_singleFileSemaphore);
}

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000D898();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  v14 = self;
  id v15 = [v13 fileURL];
  sub_10000D868();

  sub_100002B58((uint64_t)v10, v13, (uint64_t)sub_1000070B0, v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  swift_release();
}

@end