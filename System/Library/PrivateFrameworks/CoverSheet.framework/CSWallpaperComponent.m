@interface CSWallpaperComponent
- (BOOL)shouldMatchBackgroundStyle;
- (CSWallpaperComponent)init;
- (id)shouldMatchBackgroundStyle:(BOOL)a3;
- (void)setShouldMatchBackgroundStyle:(BOOL)a3;
@end

@implementation CSWallpaperComponent

- (CSWallpaperComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSWallpaperComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSComponent *)v2 setType:6];
  }
  return v3;
}

- (id)shouldMatchBackgroundStyle:(BOOL)a3
{
  return self;
}

- (void)setShouldMatchBackgroundStyle:(BOOL)a3
{
  uint64_t v4 = BSSettingFlagForBool();

  [(CSComponent *)self setFlag:v4];
}

- (BOOL)shouldMatchBackgroundStyle
{
  return BSSettingFlagIsExplicitNo() ^ 1;
}

@end