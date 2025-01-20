@interface CRSUIWallpaperSceneSettings
- (CRWallpaperData)wallpaper;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation CRSUIWallpaperSceneSettings

- (CRWallpaperData)wallpaper
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1049979832];

  return (CRWallpaperData *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRSUIMutableWallpaperSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

@end