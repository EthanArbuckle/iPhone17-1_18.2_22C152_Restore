@interface GKUITheme
+ (id)sharedTheme;
- (CGSize)authenticateExtensionFormSheetSize;
- (CGSize)formSheetSize;
- (GKNetworkImageSource)iconLeaderboardListSource;
- (GKNetworkImageSource)iconLeaderboardSetListSource;
- (GKNetworkImageSource)macGameIconSource;
- (GKNetworkImageSource)photoDetailSource;
- (GKNetworkImageSource)photoListSource;
- (GKNetworkImageSource)untreatedAchievementImageDetailSource;
- (GKNetworkImageSource)untreatedAchievementImageSource;
- (GKUITheme)init;
- (GKUtilityService)utilityService;
- (NSCache)resourceCache;
- (UIImage)interactiveRatingStarsBackground;
- (UIImage)interactiveRatingStarsForeground;
- (UIImage)ratingStarsBackgroundImage;
- (UIImage)ratingStarsForegroundImage;
- (double)formSheetCornerRadius;
- (id)achievementsDefaultIcon;
- (id)achievementsNotStartedIcon;
- (id)avatarSourceWithDimension:(int64_t)a3;
- (id)defaultLeaderboardIcon;
- (id)defaultPlayerPhoto;
- (id)eventIconImage;
- (id)groupImageSourceWithDimension:(int64_t)a3;
- (id)imageNamed:(id)a3;
- (id)localImageSourceWithName:(id)a3 imageBrush:(id)a4;
- (id)messagesInviteBackgroundImage;
- (id)monogramSourceWithDimension:(int64_t)a3;
- (id)navbarActionButtonIcon;
- (id)networkImageSourceWithName:(id)a3 imageBrush:(id)a4;
- (id)placeholderSourceWithDimension:(int64_t)a3;
- (id)playerPickerSelectedImage;
- (id)playerPickerUnselectedImage;
- (id)removePlayerButtonImage;
- (id)resourceForSelector:(SEL)a3 missingHandler:(id)a4;
- (id)resourceWithName:(id)a3 missingHandler:(id)a4;
- (id)secondaryLabelCompositingFilter;
- (id)statusDotImage;
- (void)clearResourceCache;
- (void)setResourceCache:(id)a3;
@end

@implementation GKUITheme

- (GKUtilityService)utilityService
{
  v2 = [MEMORY[0x263F401B0] daemonProxy];
  v3 = [v2 utilityService];

  return (GKUtilityService *)v3;
}

- (void)clearResourceCache
{
  v2 = [(GKUITheme *)self resourceCache];
  [v2 removeAllObjects];

  +[GKImageSource clearCache];
}

+ (id)sharedTheme
{
  if (sharedTheme_onceToken != -1) {
    dispatch_once(&sharedTheme_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedTheme_sSharedTheme;
  return v2;
}

uint64_t __24__GKUITheme_sharedTheme__block_invoke()
{
  sharedTheme_sSharedTheme = objc_alloc_init(GKUITheme);
  return MEMORY[0x270F9A758]();
}

- (GKUITheme)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKUITheme;
  v2 = [(GKUITheme *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [v3 setName:@"com.apple.gamekit.theme.cache"];
    [(GKUITheme *)v2 setResourceCache:v3];
    v4 = v2;
  }
  return v2;
}

- (id)imageNamed:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v4 = GKThemeBundle_onceToken[0];
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(GKThemeBundle_onceToken, &__block_literal_global_202);
  }
  objc_super v6 = [v3 imageNamed:v5 inBundle:GKThemeBundle_bundle];

  return v6;
}

- (id)messagesInviteBackgroundImage
{
  return [(GKUITheme *)self imageNamed:@"GKMessageImage"];
}

- (UIImage)ratingStarsBackgroundImage
{
  return (UIImage *)[(GKUITheme *)self imageNamed:@"GKRatingStarsSmallBackground"];
}

- (UIImage)ratingStarsForegroundImage
{
  return (UIImage *)[(GKUITheme *)self imageNamed:@"GKRatingStarsSmallForeground"];
}

- (UIImage)interactiveRatingStarsForeground
{
  return (UIImage *)[(GKUITheme *)self imageNamed:@"DWGameRatingStars"];
}

- (UIImage)interactiveRatingStarsBackground
{
  return (UIImage *)[(GKUITheme *)self imageNamed:@"DWGameRatingDots"];
}

- (id)eventIconImage
{
  id v3 = NSStringFromSelector(a2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__GKUITheme_eventIconImage__block_invoke;
  v6[3] = &unk_26478A8A0;
  v6[4] = self;
  uint64_t v4 = [(GKUITheme *)self resourceWithName:v3 missingHandler:v6];

  return v4;
}

id __27__GKUITheme_eventIconImage__block_invoke(uint64_t a1)
{
  v2 = +[GKBrush brush];
  id v3 = [*(id *)(a1 + 32) imageNamed:@"GKEventIcon"];
  [v3 size];
  uint64_t v4 = objc_msgSend(v2, "drawnImageForSize:opaque:input:", 0, v3);

  return v4;
}

- (id)secondaryLabelCompositingFilter
{
  if (*MEMORY[0x263F402F8]) {
    return (id)*MEMORY[0x263F15D58];
  }
  else {
    return 0;
  }
}

- (id)achievementsNotStartedIcon
{
  v2 = [MEMORY[0x263F1C6B0] systemImageNamed:@"lock.fill"];
  id v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (id)achievementsDefaultIcon
{
  v2 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"list.portrait.on.rectangle.portrait.angled.fill"];
  id v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (CGSize)formSheetSize
{
  [MEMORY[0x263F1CB68] defaultFormSheetSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)authenticateExtensionFormSheetSize
{
  double v2 = 624.0;
  double v3 = 780.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)formSheetCornerRadius
{
  return 10.0;
}

- (id)resourceForSelector:(SEL)a3 missingHandler:(id)a4
{
  id v6 = a4;
  v7 = NSStringFromSelector(a3);
  v8 = [(GKUITheme *)self resourceWithName:v7 missingHandler:v6];

  return v8;
}

- (id)resourceWithName:(id)a3 missingHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = [(GKUITheme *)self resourceCache];
  uint64_t v9 = [v8 objectForKey:v6];
  v10 = (void *)v9;
  if (v7 && !v9)
  {
    v10 = v7[2](v7);
    [v8 setObject:v10 forKey:v6];
  }

  return v10;
}

- (id)networkImageSourceWithName:(id)a3 imageBrush:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(GKImageSource *)[GKNetworkImageSource alloc] initWithName:v6 imageBrush:v5];

  return v7;
}

- (id)localImageSourceWithName:(id)a3 imageBrush:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(GKImageSource *)[GKLocalImageSource alloc] initWithName:v6 imageBrush:v5];

  return v7;
}

- (GKNetworkImageSource)macGameIconSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__GKUITheme_macGameIconSource__block_invoke;
  v4[3] = &unk_26478A8C8;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __30__GKUITheme_macGameIconSource__block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"macGameIcon" imageBrush:v2];

  return v3;
}

- (GKNetworkImageSource)untreatedAchievementImageSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__GKUITheme_untreatedAchievementImageSource__block_invoke;
  v4[3] = &unk_26478A8C8;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __44__GKUITheme_untreatedAchievementImageSource__block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"untreatedAchievementImageSource" imageBrush:v2];
  [v3 setShouldRenderDefaultImageWithBrush:1];

  return v3;
}

- (GKNetworkImageSource)untreatedAchievementImageDetailSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__GKUITheme_untreatedAchievementImageDetailSource__block_invoke;
  v4[3] = &unk_26478A8C8;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __50__GKUITheme_untreatedAchievementImageDetailSource__block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"untreatedAchievementImageDetailSource" imageBrush:v2];
  [v3 setShouldRenderDefaultImageWithBrush:1];

  return v3;
}

- (id)avatarSourceWithDimension:(int64_t)a3
{
  id v5 = NSString;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [v5 stringWithFormat:@"avatarSourceWithDimension%@", v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__GKUITheme_avatarSourceWithDimension___block_invoke;
  v10[3] = &unk_26478A8F0;
  v10[4] = self;
  v10[5] = a3;
  v8 = [(GKUITheme *)self resourceWithName:v7 missingHandler:v10];

  return v8;
}

id __39__GKUITheme_avatarSourceWithDimension___block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  [v2 setDimension:*(void *)(a1 + 40)];
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"avatarImage" imageBrush:v2];

  return v3;
}

- (id)monogramSourceWithDimension:(int64_t)a3
{
  id v5 = NSString;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [v5 stringWithFormat:@"monogramSource_%@", v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__GKUITheme_monogramSourceWithDimension___block_invoke;
  v10[3] = &unk_26478A8F0;
  v10[4] = self;
  v10[5] = a3;
  v8 = [(GKUITheme *)self resourceWithName:v7 missingHandler:v10];

  return v8;
}

id __41__GKUITheme_monogramSourceWithDimension___block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  [v2 setDimension:*(void *)(a1 + 40)];
  double v3 = [*(id *)(a1 + 32) localImageSourceWithName:@"monogram" imageBrush:v2];

  return v3;
}

- (id)placeholderSourceWithDimension:(int64_t)a3
{
  id v5 = NSString;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [v5 stringWithFormat:@"placeholderSource_%@", v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__GKUITheme_placeholderSourceWithDimension___block_invoke;
  v10[3] = &unk_26478A8F0;
  v10[4] = self;
  v10[5] = a3;
  v8 = [(GKUITheme *)self resourceWithName:v7 missingHandler:v10];

  return v8;
}

id __44__GKUITheme_placeholderSourceWithDimension___block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  [v2 setDimension:*(void *)(a1 + 40)];
  double v3 = [*(id *)(a1 + 32) localImageSourceWithName:@"placeholder" imageBrush:v2];

  return v3;
}

- (id)groupImageSourceWithDimension:(int64_t)a3
{
  id v5 = NSString;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [v5 stringWithFormat:@"groupImageSource_%@", v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __43__GKUITheme_groupImageSourceWithDimension___block_invoke;
  v10[3] = &unk_26478A8F0;
  v10[4] = self;
  v10[5] = a3;
  v8 = [(GKUITheme *)self resourceWithName:v7 missingHandler:v10];

  return v8;
}

id __43__GKUITheme_groupImageSourceWithDimension___block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  [v2 setDimension:*(void *)(a1 + 40)];
  double v3 = [*(id *)(a1 + 32) localImageSourceWithName:@"groupImage" imageBrush:v2];

  return v3;
}

- (GKNetworkImageSource)photoListSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __28__GKUITheme_photoListSource__block_invoke;
  v4[3] = &unk_26478A918;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __28__GKUITheme_photoListSource__block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"listCircularPhoto" imageBrush:v2];
  uint64_t v4 = [*(id *)(a1 + 32) defaultPlayerPhoto];
  [v3 setDefaultImage:v4];

  [v3 setShouldRenderDefaultImageWithBrush:0];
  return v3;
}

- (GKNetworkImageSource)photoDetailSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__GKUITheme_photoDetailSource__block_invoke;
  v4[3] = &unk_26478A918;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __30__GKUITheme_photoDetailSource__block_invoke(uint64_t a1)
{
  double v2 = +[GKBrush brush];
  objc_msgSend(v2, "setSizeOverride:", 60.0, 60.0);
  double v3 = [*(id *)(a1 + 32) networkImageSourceWithName:@"detailCircularPhoto" imageBrush:v2];
  uint64_t v4 = [*(id *)(a1 + 32) defaultPlayerPhoto];
  [v3 setDefaultImage:v4];

  [v3 setShouldRenderDefaultImageWithBrush:0];
  return v3;
}

- (GKNetworkImageSource)iconLeaderboardListSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__GKUITheme_iconLeaderboardListSource__block_invoke;
  v4[3] = &unk_26478A8C8;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __38__GKUITheme_iconLeaderboardListSource__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) networkImageSourceWithName:@"iconLeaderboardList" imageBrush:0];
  double v3 = [*(id *)(a1 + 32) defaultLeaderboardIcon];
  uint64_t v4 = +[GKColorPalette sharedPalette];
  id v5 = [v4 disabledTextColor];
  id v6 = [v3 _gkImageByTintingWithColor:v5];
  [v2 setDefaultImage:v6];

  [v2 setShouldRenderDefaultImageWithBrush:0];
  return v2;
}

- (GKNetworkImageSource)iconLeaderboardSetListSource
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__GKUITheme_iconLeaderboardSetListSource__block_invoke;
  v4[3] = &unk_26478A8C8;
  v4[4] = self;
  double v2 = [(GKUITheme *)self resourceForSelector:a2 missingHandler:v4];
  return (GKNetworkImageSource *)v2;
}

id __41__GKUITheme_iconLeaderboardSetListSource__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) networkImageSourceWithName:@"iconLeaderboardList" imageBrush:0];
  double v3 = [*(id *)(a1 + 32) defaultLeaderboardIcon];
  uint64_t v4 = +[GKColorPalette sharedPalette];
  id v5 = [v4 disabledTextColor];
  id v6 = [v3 _gkImageByTintingWithColor:v5];
  [v2 setDefaultImage:v6];

  [v2 setShouldRenderDefaultImageWithBrush:0];
  return v2;
}

- (id)defaultLeaderboardIcon
{
  double v2 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"list.bullet.below.star.filled"];
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

- (id)defaultPlayerPhoto
{
  return [(GKUITheme *)self imageNamed:@"FriendsGenericProfilePic"];
}

- (id)removePlayerButtonImage
{
  return [(GKUITheme *)self imageNamed:@"RemovePlayerButton"];
}

- (id)playerPickerUnselectedImage
{
  double v2 = [MEMORY[0x263F1C6B0] systemImageNamed:@"circle" compatibleWithTraitCollection:0];
  double v3 = [MEMORY[0x263F1C550] secondaryLabelColor];
  uint64_t v4 = [v2 _flatImageWithColor:v3];

  return v4;
}

- (id)playerPickerSelectedImage
{
  return (id)[MEMORY[0x263F1C6B0] systemImageNamed:@"checkmark.circle.fill" compatibleWithTraitCollection:0];
}

- (id)navbarActionButtonIcon
{
  return (id)[MEMORY[0x263F1C6B0] kitImageNamed:@"UITabBarMoreTemplateSelected"];
}

- (id)statusDotImage
{
  return [(GKUITheme *)self resourceWithName:@"statusDot" missingHandler:&__block_literal_global_115];
}

id __27__GKUITheme_statusDotImage__block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 scale];
  double v2 = +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 4, &__block_literal_global_120, 13.0, 13.0, v1);
  double v3 = [v2 imageWithRenderingMode:2];

  return v3;
}

void __27__GKUITheme_statusDotImage__block_invoke_2()
{
  id v1 = [MEMORY[0x263F1C550] blackColor];
  [v1 set];
  v0 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", 0.0, 0.0, 13.0, 13.0);
  [v0 fill];
}

- (NSCache)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end