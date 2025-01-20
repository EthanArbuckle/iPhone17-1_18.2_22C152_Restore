@interface BlastDoorWallpaper_WallpaperMetadata
- (BOOL)isVertical;
- (BlastDoorColor)backgroundColor;
- (BlastDoorColor)fontColor;
- (BlastDoorWallpaper_WallpaperMetadata)init;
- (NSString)description;
- (NSString)fontName;
- (double)fontSize;
- (double)fontWeight;
- (int64_t)type;
@end

@implementation BlastDoorWallpaper_WallpaperMetadata

- (NSString)description
{
  long long v2 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 104];
  v8[6] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 88];
  v8[7] = v2;
  v9[0] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 120];
  *(_OWORD *)((char *)v9 + 9) = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                                            + 129];
  long long v3 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 40];
  v8[2] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 24];
  v8[3] = v3;
  long long v4 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  v8[4] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 56];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata);
  v8[1] = v5;
  sub_1B14F07E8((uint64_t)v8);
  sub_1B196A850();
  v6 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)fontName
{
  return (NSString *)sub_1B17AA7A8();
}

- (double)fontSize
{
  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 32] & 1) == 0)
    return *(double *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                       + 24];
  sub_1B196B120();
  __break(1u);
  return result;
}

- (double)fontWeight
{
  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 64] & 1) == 0)
    return *(double *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                       + 56];
  sub_1B196B120();
  __break(1u);
  return result;
}

- (BlastDoorColor)fontColor
{
  long long v9 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  uint64_t v2 = *(void *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 88];
  uint64_t v3 = *(void *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 96];
  long long v4 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
  long long v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR___BlastDoorColor_color];
  *(_OWORD *)v6 = v9;
  *((void *)v6 + 2) = v2;
  *((void *)v6 + 3) = v3;
  v10.receiver = v5;
  v10.super_class = v4;
  v7 = [(BlastDoorWallpaper_WallpaperMetadata *)&v10 init];
  return (BlastDoorColor *)v7;
}

- (BOOL)isVertical
{
  return self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                         + 104];
}

- (int64_t)type
{
  return sub_1B17A9AD4();
}

- (BlastDoorColor)backgroundColor
{
  uint64_t v2 = (char *)self + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata;
  if ((self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                        + 144] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v5 = *((void *)v2 + 17);
    uint64_t v4 = *((void *)v2 + 18);
    long long v10 = *(_OWORD *)(v2 + 120);
    v6 = (objc_class *)type metadata accessor for _ObjCColorWrapper();
    v7 = (char *)objc_allocWithZone(v6);
    v8 = &v7[OBJC_IVAR___BlastDoorColor_color];
    *(_OWORD *)v8 = v10;
    *((void *)v8 + 2) = v5;
    *((void *)v8 + 3) = v4;
    v11.receiver = v7;
    v11.super_class = v6;
    uint64_t v3 = [(BlastDoorWallpaper_WallpaperMetadata *)&v11 init];
  }
  return (BlastDoorColor *)v3;
}

- (BlastDoorWallpaper_WallpaperMetadata)init
{
  double result = (BlastDoorWallpaper_WallpaperMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 104];
  v6[6] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 88];
  v6[7] = v2;
  v7[0] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 120];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                                            + 129];
  long long v3 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 40];
  v6[2] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 72];
  v6[4] = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                      + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->wallpaper_WallpaperMetadata[OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata
                                                   + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR___BlastDoorWallpaper_WallpaperMetadata_wallpaper_WallpaperMetadata);
  v6[1] = v5;
  sub_1B14F06D4((uint64_t)v6);
}

@end