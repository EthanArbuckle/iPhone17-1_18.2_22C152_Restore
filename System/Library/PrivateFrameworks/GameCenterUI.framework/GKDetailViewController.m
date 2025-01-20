@interface GKDetailViewController
- (void)reportProblemAboutPlayer:(id)a3;
- (void)shareAchievement:(id)a3 sendingView:(id)a4;
- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKDetailViewController

- (void)reportProblemAboutPlayer:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F63760] localPlayer];
  char v6 = [v5 alertUserInStoreDemoModeEnabled];

  if ((v6 & 1) == 0)
  {
    v7 = [(GKDetailViewController *)self view];
    [v7 setUserInteractionEnabled:0];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke;
    v9[3] = &unk_1E5F63C60;
    v9[4] = self;
    id v8 = +[GKReportProblemRemoteUIController controllerForProblemPlayer:v4 completionHandler:v9];
  }
}

void __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) view];
  [v7 setUserInteractionEnabled:1];

  if (v6)
  {
    id v8 = *(void **)(a1 + 32);
    GKGameCenterUIFrameworkBundle();
    v9 = (GKRemoteUINavigationController *)objc_claimAutoreleasedReturnValue();
    v10 = GKGetLocalizedStringFromTableInBundle();
    v11 = GKGameCenterUIFrameworkBundle();
    v12 = GKGetLocalizedStringFromTableInBundle();
    id v13 = (id)[v8 _gkPresentAlertForError:v6 title:v10 defaultMessage:v12];
  }
  else
  {
    v14 = [[GKRemoteUINavigationController alloc] initWithRemoteUIController:v5];
    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    if (v16 == 1)
    {
      if (*MEMORY[0x1E4F63830]) {
        BOOL v17 = *MEMORY[0x1E4F63A38] == 0;
      }
      else {
        BOOL v17 = 0;
      }
      if (!v17)
      {
        [(GKRemoteUINavigationController *)v14 setModalPresentationStyle:2];
        v18 = [(GKRemoteUINavigationController *)v14 view];
        v19 = [v18 layer];
        [v19 setMasksToBounds:1];

        v20 = [MEMORY[0x1E4F63A10] sharedTheme];
        [v20 formSheetCornerRadius];
        double v22 = v21;
        v23 = [(GKRemoteUINavigationController *)v14 view];
        v24 = [v23 layer];
        [v24 setCornerRadius:v22];
      }
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke_2;
    v28 = &unk_1E5F63C38;
    uint64_t v29 = *(void *)(a1 + 32);
    v30 = v14;
    v9 = v14;
    [v5 setCompletionHandler:&v25];
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0, v25, v26, v27, v28, v29);
  }
}

uint64_t __66__GKDetailViewController_RequestReport__reportProblemAboutPlayer___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = GKGameCenterUIFrameworkBundle();
    id v6 = GKGetLocalizedStringFromTableInBundle();
    v7 = GKGameCenterUIFrameworkBundle();
    id v8 = GKGetLocalizedStringFromTableInBundle();
    v9 = GKGameCenterUIFrameworkBundle();
    v10 = GKGetLocalizedStringFromTableInBundle();
    id v11 = (id)[v4 _gkPresentAlertWithTitle:v6 message:v8 buttonTitle:v10];
  }
  v12 = *(void **)(a1 + 40);

  return [v12 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)GKDetailViewController;
  [(GKDashboardCollectionViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKDetailViewController;
  [(GKDashboardCollectionViewController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GKDetailViewController;
  [(GKDetailViewController *)&v3 viewWillDisappear:a3];
}

- (void)shareAchievement:(id)a3 sendingView:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F637E8] shared];
  int v9 = [v8 shouldAllowSharing];

  if (v9)
  {
    v18[0] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v11 = (id)[(GKDetailViewController *)self _gkPresentActivityViewControllerForActivityItems:v10 fromView:v7 withCompletionHandler:0];
  }
  else
  {
    v10 = GKGameCenterUIFrameworkBundle();
    v12 = GKGetLocalizedStringFromTableInBundle();
    id v13 = GKGameCenterUIFrameworkBundle();
    v14 = GKGetLocalizedStringFromTableInBundle();
    v15 = GKGameCenterUIFrameworkBundle();
    uint64_t v16 = GKGetLocalizedStringFromTableInBundle();
    id v17 = (id)[(GKDetailViewController *)self _gkPresentAlertWithTitle:v12 message:v14 buttonTitle:v16 dismissHandler:0];
  }
}

- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  int v9 = [MEMORY[0x1E4F637E8] shared];
  int v10 = [v9 shouldAllowSharing];

  if (v10)
  {
    v19[0] = v7;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    id v12 = (id)[(GKDetailViewController *)self _gkPresentActivityViewControllerForActivityItems:v11 fromView:v8 withCompletionHandler:0];
  }
  else
  {
    id v11 = GKGameCenterUIFrameworkBundle();
    id v13 = GKGetLocalizedStringFromTableInBundle();
    v14 = GKGameCenterUIFrameworkBundle();
    v15 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v16 = GKGameCenterUIFrameworkBundle();
    id v17 = GKGetLocalizedStringFromTableInBundle();
    id v18 = (id)[(GKDetailViewController *)self _gkPresentAlertWithTitle:v13 message:v15 buttonTitle:v17 dismissHandler:0];
  }
}

@end