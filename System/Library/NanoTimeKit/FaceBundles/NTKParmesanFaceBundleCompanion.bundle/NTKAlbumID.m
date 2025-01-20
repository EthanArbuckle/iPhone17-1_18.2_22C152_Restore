@interface NTKAlbumID
- (NSString)album;
- (NSString)description;
- (NSString)uuidString;
- (_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID)init;
- (_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID)initWithAlbum:(id)a3 uuidString:(id)a4;
- (void)setAlbum:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation NTKAlbumID

- (NSString)album
{
  return (NSString *)sub_246C26574();
}

- (void)setAlbum:(id)a3
{
}

- (NSString)uuidString
{
  return (NSString *)sub_246C26574();
}

- (void)setUuidString:(id)a3
{
}

- (_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID)initWithAlbum:(id)a3 uuidString:(id)a4
{
  uint64_t v5 = sub_246C2CC48();
  uint64_t v7 = v6;
  uint64_t v8 = sub_246C2CC48();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID_album);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID_uuidString);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for NTKAlbumID();
  return [(NTKAlbumID *)&v13 init];
}

- (NSString)description
{
  v2 = self;
  sub_246C26718();

  v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID)init
{
  result = (_TtC30NTKParmesanFaceBundleCompanion10NTKAlbumID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end