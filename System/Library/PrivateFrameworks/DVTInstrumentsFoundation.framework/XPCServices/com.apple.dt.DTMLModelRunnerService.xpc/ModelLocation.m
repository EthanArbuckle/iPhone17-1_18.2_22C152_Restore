@interface ModelLocation
- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)init;
- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)initWithTempFolderGuid:(id)a3 fileName:(id)a4;
@end

@implementation ModelLocation

- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)initWithTempFolderGuid:(id)a3 fileName:(id)a4
{
  uint64_t v5 = sub_10002C060();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002C050();
  uint64_t v9 = sub_10002C480();
  uint64_t v11 = v10;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_tempFolderGuid, v8, v5);
  v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_fileName);
  uint64_t *v12 = v9;
  v12[1] = v11;
  v13 = (objc_class *)type metadata accessor for ModelLocation();
  v16.receiver = self;
  v16.super_class = v13;
  v14 = [(ModelLocation *)&v16 init];
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14;
}

- (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation)init
{
  result = (_TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC35com_apple_dt_DTMLModelRunnerService13ModelLocation_tempFolderGuid;
  uint64_t v3 = sub_10002C060();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end