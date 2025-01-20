@interface CNWallpaperUtilities
+ (BOOL)supportsWatchImageDataRepairFor:(id)a3;
+ (uint64_t)monogramPosterOffset;
- (_TtC10ContactsUI20CNWallpaperUtilities)init;
@end

@implementation CNWallpaperUtilities

+ (BOOL)supportsWatchImageDataRepairFor:(id)a3
{
  uint64_t v3 = sub_18B985E68();
  BOOL v5 = _s10ContactsUI20CNWallpaperUtilitiesC28supportsWatchImageDataRepair3forSbSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

- (_TtC10ContactsUI20CNWallpaperUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNWallpaperUtilities();
  return [(CNWallpaperUtilities *)&v3 init];
}

+ (uint64_t)monogramPosterOffset
{
  return MEMORY[0x1F4130318]();
}

@end