@interface BlastDoorWallpaper_WallpaperImage
- (BlastDoorImage)image;
- (BlastDoorWallpaper_WallpaperImage)init;
- (NSString)description;
@end

@implementation BlastDoorWallpaper_WallpaperImage

- (NSString)description
{
  return (NSString *)sub_1B17AABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorWallpaper_WallpaperImage_wallpaper_WallpaperImage, (void (*)(uint64_t, unsigned char *))sub_1B17B32C0);
}

- (BlastDoorImage)image
{
  v2 = self;
  v3 = (void *)sub_1B17A9364();

  return (BlastDoorImage *)v3;
}

- (BlastDoorWallpaper_WallpaperImage)init
{
  result = (BlastDoorWallpaper_WallpaperImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B16BC77C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___BlastDoorWallpaper_WallpaperImage_wallpaper_WallpaperImage));
}

@end