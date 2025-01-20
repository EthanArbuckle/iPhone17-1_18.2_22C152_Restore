@interface GKChallenge(UI)
+ (id)challengesNotSupportedAlertController;
+ (id)tooManyPlayersAlertController;
- (id)detailFromText;
- (uint64_t)alertGoalText;
- (uint64_t)composeGoalText;
- (uint64_t)detailGoalText;
- (uint64_t)iconSource;
- (uint64_t)iconURLString;
- (uint64_t)listGoalText;
- (uint64_t)listTitleText;
- (uint64_t)smallIconURLString;
- (void)alertGoalText;
- (void)loadBannerImageWithHandler:()UI;
- (void)loadImageWithCompletionHandler:()UI;
- (void)loadImageWithSource:()UI URLString:withHandler:;
@end

@implementation GKChallenge(UI)

- (void)loadImageWithSource:()UI URLString:withHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__13;
  v29 = __Block_byref_object_dispose__13;
  id v30 = 0;
  v11 = dispatch_group_create();
  v12 = v11;
  if (v9)
  {
    dispatch_group_enter(v11);
    uint64_t v13 = MEMORY[0x1E4F14428];
    id v14 = MEMORY[0x1E4F14428];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke;
    v21[3] = &unk_1E5F66BF0;
    id v22 = v8;
    v24 = &v25;
    v23 = v12;
    [v22 loadImageForURLString:v9 reference:a1 queue:v13 handler:v21];

    id v15 = v22;
  }
  else
  {
    uint64_t v16 = [v8 renderedDefaultImage];
    id v15 = (id)v26[5];
    v26[5] = v16;
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__GKChallenge_UI__loadImageWithSource_URLString_withHandler___block_invoke_2;
  block[3] = &unk_1E5F66C18;
  id v19 = v10;
  v20 = &v25;
  id v17 = v10;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v25, 8);
}

- (void)loadBannerImageWithHandler:()UI
{
  id v4 = a3;
  id v6 = [a1 iconSource];
  v5 = [a1 smallIconURLString];
  [a1 loadImageWithSource:v6 URLString:v5 withHandler:v4];
}

- (void)loadImageWithCompletionHandler:()UI
{
  id v4 = a3;
  id v6 = [a1 iconSource];
  v5 = [a1 iconURLString];
  [a1 loadImageWithSource:v6 URLString:v5 withHandler:v4];
}

- (uint64_t)alertGoalText
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)listTitleText
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)listGoalText
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)composeGoalText
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)detailGoalText
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (id)detailFromText
{
  v2 = NSString;
  v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  v5 = [a1 issuingPlayer];
  id v6 = [v5 displayNameWithOptions:0];
  v7 = objc_msgSend(v2, "stringWithFormat:", v4, v6);

  return v7;
}

- (uint64_t)iconSource
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)smallIconURLString
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

- (uint64_t)iconURLString
{
  if (!*MEMORY[0x1E4F63860]) {
    id v0 = (id)GKOSLoggers();
  }
  v1 = (void *)*MEMORY[0x1E4F63850];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
    -[GKChallenge(UI) alertGoalText](v1);
  }
  return 0;
}

+ (id)challengesNotSupportedAlertController
{
  id v0 = (void *)MEMORY[0x1E4FB1418];
  v1 = GKGameCenterUIFrameworkBundle();
  v2 = GKGetLocalizedStringFromTableInBundle();
  v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  v5 = [v0 alertControllerWithTitle:v2 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  v7 = GKGameCenterUIFrameworkBundle();
  id v8 = GKGetLocalizedStringFromTableInBundle();
  id v9 = [v6 actionWithTitle:v8 style:0 handler:0];
  [v5 addAction:v9];

  return v5;
}

+ (id)tooManyPlayersAlertController
{
  id v0 = NSString;
  v1 = GKGameCenterUIFrameworkBundle();
  v2 = GKGetLocalizedStringFromTableInBundle();
  v3 = objc_msgSend(v0, "stringWithFormat:", v2, 10);

  id v4 = (void *)MEMORY[0x1E4FB1418];
  v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  v7 = [v4 alertControllerWithTitle:v6 message:v3 preferredStyle:1];

  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = GKGameCenterUIFrameworkBundle();
  id v10 = GKGetLocalizedStringFromTableInBundle();
  v11 = [v8 actionWithTitle:v10 style:0 handler:0];
  [v7 addAction:v11];

  return v7;
}

- (void)alertGoalText
{
  id v2 = a1;
  v3 = (objc_class *)OUTLINED_FUNCTION_4_3();
  id v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_8(&dword_1AF250000, v5, v6, "%@ needs to implement me!", v7, v8, v9, v10, v11);
}

@end