@interface HUPlaybackInfluencesViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUPlaybackInfluencesItemManager)playbackInfluencesItemManager;
- (HUPlaybackInfluencesViewController)initWithAccessoryGroupItem:(id)a3;
- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3;
- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (void)dismissPrivacyController;
- (void)setPlaybackInfluencesItemManager:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4;
@end

@implementation HUPlaybackInfluencesViewController

- (HUPlaybackInfluencesViewController)initWithAccessoryGroupItem:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithAccessoryGroupItem_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPlaybackInfluencesViewController.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUPlaybackInfluencesViewController initWithAccessoryGroupItem:]",
    v6);

  return 0;
}

- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3
{
  id v4 = a3;
  v5 = [[HUPlaybackInfluencesItemManager alloc] initWithDelegate:self settingItem:v4];

  v9.receiver = self;
  v9.super_class = (Class)HUPlaybackInfluencesViewController;
  v6 = [(HUItemTableViewController *)&v9 initWithItemManager:v5 tableViewStyle:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_playbackInfluencesItemManager, v5);
  }

  return v7;
}

- (HUPlaybackInfluencesViewController)initWithAccessorySettingItem:(id)a3 module:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HUPlaybackInfluencesItemManager alloc] initWithDelegate:self module:v6 homeKitAccessorySettingItem:v7];

  v12.receiver = self;
  v12.super_class = (Class)HUPlaybackInfluencesViewController;
  objc_super v9 = [(HUItemTableViewController *)&v12 initWithItemManager:v8 tableViewStyle:1];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_playbackInfluencesItemManager, v8);
  }

  return v10;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  id v9 = v6;
  if (objc_opt_isKindOfClass()) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 setDelegate:self];
}

- (void)switchCell:(id)a3 didTurnOn:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(HUPlaybackInfluencesViewController *)self playbackInfluencesItemManager];
  id v7 = [v5 updateUseListeningHistorySetting:v4];

  id v6 = (id)[v7 addFailureBlock:&__block_literal_global_121];
}

void __59__HUPlaybackInfluencesViewController_switchCell_didTurnOn___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = objc_msgSend(v2, "na_isCancelledError");
  BOOL v4 = [MEMORY[0x1E4F69110] sharedHandler];
  id v5 = v4;
  if (v3) {
    [v4 logError:v2 operationDescription:@"Updating playback influences setting failed."];
  }
  else {
    [v4 handleError:v2];
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HUPlaybackInfluencesViewController;
  BOOL v4 = [(HUItemTableViewController *)&v11 tableView:a3 viewForFooterInSection:a4];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 messageTextView];
  id v9 = [v8 textDragInteraction];
  [v9 setEnabled:1];

  return v5;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    v17 = self;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v9 = [(HUPlaybackInfluencesViewController *)self navigationController];
  v10 = (void *)v9;
  if (v9) {
    objc_super v11 = (HUPlaybackInfluencesViewController *)v9;
  }
  else {
    objc_super v11 = self;
  }
  objc_super v12 = v11;

  v13 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:*MEMORY[0x1E4F83B10]];
  v14 = [v13 splashController];
  [v14 setDisplayDeviceType:6];

  [v13 setPresentingViewController:v12];
  [v13 present];

  return 0;
}

- (void)dismissPrivacyController
{
}

- (HUPlaybackInfluencesItemManager)playbackInfluencesItemManager
{
  return self->_playbackInfluencesItemManager;
}

- (void)setPlaybackInfluencesItemManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end