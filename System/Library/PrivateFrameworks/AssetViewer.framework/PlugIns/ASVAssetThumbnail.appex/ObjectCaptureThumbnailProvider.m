@interface ObjectCaptureThumbnailProvider
- (_TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider)init;
- (void)dealloc;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ObjectCaptureThumbnailProvider

- (void)dealloc
{
  uint64_t v2 = qword_1000146C8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000D9D8();
  sub_100005648(v4, (uint64_t)qword_100014848);
  v5 = sub_10000D9B8();
  os_log_type_t v6 = sub_10000DAE8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ObjectCapture_Thumbnail deinit ThumbnailProvider", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for ObjectCaptureThumbnailProvider();
  [(ObjectCaptureThumbnailProvider *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider_usdRealityProvider);
}

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  os_log_type_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  objc_super v8 = self;
  sub_10000C70C(v7, v8, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider)init
{
  result = (_TtC17ASVAssetThumbnail30ObjectCaptureThumbnailProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end