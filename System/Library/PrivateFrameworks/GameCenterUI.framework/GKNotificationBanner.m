@interface GKNotificationBanner
+ (BOOL)isBannerVisible;
+ (BOOL)isWelcomeOrSignInBannerEnqueued;
+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6;
+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7;
+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7 shortBanner:(BOOL)a8;
+ (id)bannerViewWithTitle:(id)a3 message:(id)a4 actionMessage:(id)a5;
+ (void)setIsWelcomeOrSignInBannerEnqueued:(BOOL)a3;
+ (void)showAchievementBannerWithTitle:(id)a3 achievementImage:(id)a4 message:(id)a5 touchHandler:(id)a6;
+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message completionHandler:(void *)completionHandler;
+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler;
+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 completionHandler:(id)a6;
+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 touchHandler:(id)a6;
+ (void)showBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6;
+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 completionHandler:(id)a6;
+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 touchHandler:(id)a6;
+ (void)showWelcomeBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation GKNotificationBanner

+ (BOOL)isWelcomeOrSignInBannerEnqueued
{
  objc_sync_enter(@"GKNotificationBannerSyncObject");
  char v2 = _isWelcomeOrSignInBannerEnqueued;
  objc_sync_exit(@"GKNotificationBannerSyncObject");
  return v2;
}

+ (void)setIsWelcomeOrSignInBannerEnqueued:(BOOL)a3
{
  objc_sync_enter(@"GKNotificationBannerSyncObject");
  _isWelcomeOrSignInBannerEnqueued = a3;

  objc_sync_exit(@"GKNotificationBannerSyncObject");
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:v11 player:v10 message:v9 actionMessage:0 shortBanner:0];

  return v13;
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(id)objc_opt_class() bannerViewWithTitle:v15 image:v14 player:v13 message:v12 actionMessage:v11 shortBanner:0];

  return v16;
}

+ (id)bannerViewWithTitle:(id)a3 image:(id)a4 player:(id)a5 message:(id)a6 actionMessage:(id)a7 shortBanner:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    v18 = [[GKNotificationBannerView alloc] initWithTitle:v13 image:v14 message:v16 useShortBanner:v8];
LABEL_5:
    v21 = v18;
    goto LABEL_6;
  }
  v19 = [GKNotificationBannerView alloc];
  v20 = v19;
  if (v15)
  {
    v18 = [(GKNotificationBannerView *)v19 initWithTitle:v13 player:v15 leadingAccessoryView:0 message:v16 useShortBanner:v8];
    goto LABEL_5;
  }
  v23 = [MEMORY[0x1E4F63A10] sharedTheme];
  v24 = [v23 eventIconImage];
  v21 = [(GKNotificationBannerView *)v20 initWithTitle:v13 image:v24 message:v16 useShortBanner:v8];

LABEL_6:

  return v21;
}

+ (void)showWelcomeBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:0 player:0 message:v11 actionMessage:0 shortBanner:1];

  [v13 setTouchHandler:v10];
  [v13 setAccessibilityIdentifier:@"UIA.GameCenter.GKNotificationBannerView.WelcomeBanner"];
  [v13 showPlayerAvatarAnimationWithCompletionHandler:v9];
}

+ (void)showBannerWithTitle:(id)a3 message:(id)a4 touchHandler:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:0 player:0 message:v11];

  [v13 setTouchHandler:v10];
  [v13 showWithCompletionHandler:v9];
}

+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message completionHandler:(void *)completionHandler
{
  v7 = completionHandler;
  BOOL v8 = message;
  id v9 = title;
  id v10 = [(id)objc_opt_class() bannerViewWithTitle:v9 image:0 player:0 message:v8];

  [v10 showWithCompletionHandler:v7];
}

+ (void)showBannerWithTitle:(NSString *)title message:(NSString *)message duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler
{
  id v9 = completionHandler;
  id v10 = message;
  id v11 = title;
  id v12 = [(id)objc_opt_class() bannerViewWithTitle:v11 image:0 player:0 message:v10];

  [v12 setDuration:duration];
  [v12 showWithCompletionHandler:v9];
}

+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:v11 player:0 message:v10];

  [v13 showWithCompletionHandler:v9];
}

+ (void)showBannerWithTitle:(id)a3 image:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:v11 player:0 message:v10];

  [v13 showWithTouchHandler:v9];
}

+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:0 player:v11 message:v10];

  [v13 showWithCompletionHandler:v9];
}

+ (void)showBannerWithTitle:(id)a3 player:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() bannerViewWithTitle:v12 image:0 player:v11 message:v10];

  [v13 showWithTouchHandler:v9];
}

+ (BOOL)isBannerVisible
{
  char v2 = +[GKNotificationBannerWindow bannerWindow];
  v3 = [v2 currentBannerViewController];
  char v4 = [v3 bannerVisible];

  return v4;
}

+ (id)bannerViewWithTitle:(id)a3 message:(id)a4 actionMessage:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() bannerViewWithTitle:v9 image:0 player:0 message:v8 actionMessage:v7];

  return v10;
}

+ (void)showAchievementBannerWithTitle:(id)a3 achievementImage:(id)a4 message:(id)a5 touchHandler:(id)a6
{
  id v14 = a4;
  id v9 = a6;
  if (v14)
  {
    id v10 = a5;
    id v11 = a3;
    id v12 = [[_TtC12GameCenterUI35AchievementBannerImageContainerView alloc] initWithAchievementImage:v14];
    id v13 = [[GKNotificationBannerView alloc] initWithTitle:v11 player:0 leadingAccessoryView:v12 message:v10 useShortBanner:0];

    [(GKNotificationBannerView *)v13 showWithTouchHandler:v9];
  }
  else
  {
    id v13 = (GKNotificationBannerView *)a5;
    id v12 = (_TtC12GameCenterUI35AchievementBannerImageContainerView *)a3;
    [(id)objc_opt_class() showBannerWithTitle:v12 image:0 message:v13 touchHandler:v9];
  }
}

@end