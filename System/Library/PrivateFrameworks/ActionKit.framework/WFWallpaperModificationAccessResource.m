@interface WFWallpaperModificationAccessResource
+ (BOOL)isSystemResource;
- (id)localizedAccessResourceErrorString;
- (id)name;
- (unint64_t)status;
@end

@implementation WFWallpaperModificationAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)localizedAccessResourceErrorString
{
  return WFLocalizedString(@"Changing wallpaper is restricted on this device.");
}

- (unint64_t)status
{
  v2 = [MEMORY[0x263F338E8] defaultProfile];
  int v3 = [v2 isWallpaperModificationAllowed];

  if (v3) {
    return 4;
  }
  else {
    return 3;
  }
}

- (id)name
{
  return WFLocalizedStringWithKey(@"Wallpaper (Service Name)", @"Wallpaper");
}

@end