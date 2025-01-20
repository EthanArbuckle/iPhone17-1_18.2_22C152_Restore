@interface DBAssetWallpaperDataProvider
- (BOOL)isReady;
- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate;
- (_TtC9DashBoard28DBAssetWallpaperDataProvider)init;
- (_TtC9DashBoard28DBAssetWallpaperDataProvider)initWithThemeAssetDocument:(id)a3 displayID:(id)a4;
- (id)defaultWallpapers;
- (id)displayID;
- (id)dynamicAppearanceWallpapersForVehicle:(id)a3;
- (id)loadWallpaperFromData:(id)a3;
- (id)resolveWallpaper:(id)a3;
- (id)wallpapers;
- (int64_t)version;
- (void)setDataProviderDelegate:(id)a3;
@end

@implementation DBAssetWallpaperDataProvider

- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (CRSUIWallpaperDataProvidingDelegate *)v2;
}

- (void)setDataProviderDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9DashBoard28DBAssetWallpaperDataProvider_dataProviderDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC9DashBoard28DBAssetWallpaperDataProvider)initWithThemeAssetDocument:(id)a3 displayID:(id)a4
{
  uint64_t v5 = sub_22D85E4C8();
  return (_TtC9DashBoard28DBAssetWallpaperDataProvider *)DBAssetWallpaperDataProvider.init(themeAssetDocument:displayID:)(a3, v5, v6);
}

- (BOOL)isReady
{
  return 1;
}

- (int64_t)version
{
  uint64_t v3 = sub_22D85CE18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_22D85CF28();
  int64_t v8 = sub_22D85CDF8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  if ((v8 & 0x8000000000000000) == 0) {
    return v8;
  }
  __break(1u);
  return result;
}

- (id)displayID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)wallpapers
{
  return sub_22D7EC5C4(self, (uint64_t)a2, (void (*)(uint64_t, void *))sub_22D7F1A2C);
}

- (id)defaultWallpapers
{
  return sub_22D7EC5C4(self, (uint64_t)a2, (void (*)(uint64_t, void *))sub_22D7F2170);
}

- (id)dynamicAppearanceWallpapersForVehicle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  DBAssetWallpaperDataProvider.dynamicAppearanceWallpapers(for:)(v4);

  __swift_instantiateConcreteTypeFromMangledName(&qword_26858A468);
  unint64_t v6 = (void *)sub_22D85E5A8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)loadWallpaperFromData:(id)a3
{
  return sub_22D7F0A98(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))DBAssetWallpaperDataProvider.loadWallpaper(from:));
}

- (id)resolveWallpaper:(id)a3
{
  return sub_22D7F0A98(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))DBAssetWallpaperDataProvider.resolve(_:));
}

- (_TtC9DashBoard28DBAssetWallpaperDataProvider)init
{
  int64_t result = (_TtC9DashBoard28DBAssetWallpaperDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9DashBoard28DBAssetWallpaperDataProvider_themeAssetDocument));
  swift_bridgeObjectRelease();
}

@end