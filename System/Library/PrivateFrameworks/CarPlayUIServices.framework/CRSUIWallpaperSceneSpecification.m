@interface CRSUIWallpaperSceneSpecification
- (Class)settingsClass;
@end

@implementation CRSUIWallpaperSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

@end