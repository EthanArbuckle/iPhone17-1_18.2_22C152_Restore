@interface BlastDoorWallpaper
- (BlastDoorWallpaper)init;
- (BlastDoorWallpaper_WallpaperImage)highResImage;
- (BlastDoorWallpaper_WallpaperImage)lowResImage;
- (BlastDoorWallpaper_WallpaperMetadata)metadata;
- (NSData)posterArchive;
- (NSString)description;
- (NSString)highResFileName;
- (NSString)lowResFileName;
- (int64_t)version;
@end

@implementation BlastDoorWallpaper

- (NSString)description
{
  return (NSString *)sub_1B177A380((uint64_t)self, (uint64_t)a2, type metadata accessor for Wallpaper, &OBJC_IVAR___BlastDoorWallpaper_wallpaper, type metadata accessor for Wallpaper);
}

- (NSData)posterArchive
{
  v2 = self;
  v3 = (void *)sub_1B1790468();

  return (NSData *)v3;
}

- (NSString)highResFileName
{
  uint64_t v3 = type metadata accessor for Wallpaper(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B17B4094((uint64_t)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper, (uint64_t)v6, type metadata accessor for Wallpaper);
  v7 = &v6[*(int *)(v4 + 28)];
  uint64_t v8 = *((void *)v7 + 3);
  if (v8 == 1)
  {
    result = (NSString *)sub_1B196B120();
    __break(1u);
  }
  else
  {
    uint64_t v9 = *((void *)v7 + 2);
    swift_bridgeObjectRetain();
    sub_1B17B42FC((uint64_t)v6, type metadata accessor for Wallpaper);
    if (v8)
    {
      v10 = (void *)sub_1B196A7E0();
      sub_1B11E7748(v9, v8);
    }
    else
    {
      v10 = 0;
    }
    return (NSString *)v10;
  }
  return result;
}

- (BlastDoorWallpaper_WallpaperImage)highResImage
{
  v2 = self;
  id v3 = sub_1B17908B8();

  return (BlastDoorWallpaper_WallpaperImage *)v3;
}

- (NSString)lowResFileName
{
  return (NSString *)sub_1B1790A68((uint64_t)self, (uint64_t)a2, type metadata accessor for Wallpaper, &OBJC_IVAR___BlastDoorWallpaper_wallpaper, type metadata accessor for Wallpaper, type metadata accessor for Wallpaper);
}

- (BlastDoorWallpaper_WallpaperImage)lowResImage
{
  v2 = self;
  id v3 = sub_1B1790D50();

  return (BlastDoorWallpaper_WallpaperImage *)v3;
}

- (int64_t)version
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper;
  return *(void *)&v2[*(int *)(type metadata accessor for Wallpaper(0) + 36)];
}

- (BlastDoorWallpaper_WallpaperMetadata)metadata
{
  v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_wallpaper;
  uint64_t v3 = type metadata accessor for Wallpaper(0);
  sub_1B11F5244((uint64_t)&v2[*(int *)(v3 + 40)], (uint64_t)v19, &qword_1E9B78148);
  sub_1B11F5244((uint64_t)v19, (uint64_t)v20, &qword_1E9B78148);
  int v4 = sub_1B17B3340((uint64_t)v20);
  uint64_t v5 = 0;
  if (v4 != 1)
  {
    v6 = (objc_class *)type metadata accessor for _ObjCWallpaper_WallpaperMetadataWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    uint64_t v8 = &v7[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata];
    long long v9 = v20[1];
    *(_OWORD *)uint64_t v8 = v20[0];
    *((_OWORD *)v8 + 1) = v9;
    long long v10 = v20[5];
    long long v12 = v20[2];
    long long v11 = v20[3];
    *((_OWORD *)v8 + 4) = v20[4];
    *((_OWORD *)v8 + 5) = v10;
    *((_OWORD *)v8 + 2) = v12;
    *((_OWORD *)v8 + 3) = v11;
    long long v14 = v20[7];
    long long v13 = v21[0];
    long long v15 = v20[6];
    *(_OWORD *)(v8 + 137) = *(_OWORD *)((char *)v21 + 9);
    *((_OWORD *)v8 + 7) = v14;
    *((_OWORD *)v8 + 8) = v13;
    *((_OWORD *)v8 + 6) = v15;
    sub_1B11F5244((uint64_t)v19, (uint64_t)v18, &qword_1E9B78148);
    sub_1B14F07E8((uint64_t)v18);
    v17.receiver = v7;
    v17.super_class = v6;
    uint64_t v5 = [(BlastDoorWallpaper *)&v17 init];
  }
  return (BlastDoorWallpaper_WallpaperMetadata *)v5;
}

- (BlastDoorWallpaper)init
{
  result = (BlastDoorWallpaper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end