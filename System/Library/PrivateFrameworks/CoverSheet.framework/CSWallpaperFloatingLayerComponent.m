@interface CSWallpaperFloatingLayerComponent
- (BOOL)shouldMatchMove;
- (BOOL)shouldRenderInline;
- (CSWallpaperFloatingLayerComponent)init;
- (id)shouldMatchMove:(BOOL)a3;
- (id)shouldRenderForPosterSwitcher:(BOOL)a3;
- (id)shouldRenderInline:(BOOL)a3;
- (void)setShouldMatchMove:(BOOL)a3;
- (void)setShouldRenderInline:(BOOL)a3;
@end

@implementation CSWallpaperFloatingLayerComponent

- (CSWallpaperFloatingLayerComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSWallpaperFloatingLayerComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSComponent *)v2 setType:23];
  }
  return v3;
}

- (id)shouldRenderInline:(BOOL)a3
{
  return self;
}

- (id)shouldMatchMove:(BOOL)a3
{
  return self;
}

- (id)shouldRenderForPosterSwitcher:(BOOL)a3
{
  return self;
}

- (void)setShouldRenderInline:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(CSComponent *)self setValue:v4];
}

- (BOOL)shouldRenderInline
{
  v2 = [(CSComponent *)self value];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setShouldMatchMove:(BOOL)a3
{
  uint64_t v4 = BSSettingFlagForBool();

  [(CSComponent *)self setFlag:v4];
}

- (BOOL)shouldMatchMove
{
  return BSSettingFlagIsExplicitNo() ^ 1;
}

@end