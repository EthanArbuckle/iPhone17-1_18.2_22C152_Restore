@interface UIImage(GKDashboardUtils)
+ (uint64_t)_gkHostImageWithBundleIdentifier:()GKDashboardUtils imageName:;
+ (void)_gkMessageGroupImageWithIdentifier:()GKDashboardUtils handler:;
@end

@implementation UIImage(GKDashboardUtils)

+ (uint64_t)_gkHostImageWithBundleIdentifier:()GKDashboardUtils imageName:
{
  return 0;
}

+ (void)_gkMessageGroupImageWithIdentifier:()GKDashboardUtils handler:
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1E4F636D8];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKDashboardUtils.m", 497, "+[UIImage(GKDashboardUtils) _gkMessageGroupImageWithIdentifier:handler:]");
  v9 = [v7 dispatchGroupWithName:v8];

  v10 = [MEMORY[0x1E4F63A10] sharedTheme];
  v11 = [v10 groupImageSourceWithDimension:128];

  v12 = GKAvatarSubdirectoryNameForPlayerID();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke;
  v20[3] = &unk_1E5F66A98;
  id v13 = v11;
  id v21 = v13;
  id v14 = v12;
  id v22 = v14;
  id v15 = v9;
  id v23 = v15;
  id v16 = v5;
  id v24 = v16;
  uint64_t v25 = 128;
  [v15 perform:v20];
  if (v6)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_4;
    v17[3] = &unk_1E5F63988;
    id v19 = v6;
    id v18 = v15;
    [v18 notifyOnMainQueueWithBlock:v17];
  }
}

@end