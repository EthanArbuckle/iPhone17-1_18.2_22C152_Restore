@interface CRSUIMutableWallpaperSceneSettings
- (CRWallpaperData)wallpaper;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setWallpaper:(id)a3;
@end

@implementation CRSUIMutableWallpaperSceneSettings

- (void)setWallpaper:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:1049979832];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CRSUIWallpaperSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (CRWallpaperData)wallpaper
{
  return self->_wallpaper;
}

- (void).cxx_destruct
{
}

@end