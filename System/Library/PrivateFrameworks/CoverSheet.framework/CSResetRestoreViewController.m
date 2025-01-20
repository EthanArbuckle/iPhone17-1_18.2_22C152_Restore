@interface CSResetRestoreViewController
- (CSResetRestoreViewController)initWithStatusProvider:(id)a3;
- (id)_currentTextForResetOrRestoreState;
- (int64_t)presentationPriority;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)viewDidLoad;
@end

@implementation CSResetRestoreViewController

- (CSResetRestoreViewController)initWithStatusProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSResetRestoreViewController;
  v6 = [(CSResetRestoreViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statusProvider, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3 = [(CSModalViewControllerBase *)self view];
  v4 = [(CSResetRestoreViewController *)self _currentTextForResetOrRestoreState];
  [v3 setTitleText:v4];

  v5.receiver = self;
  v5.super_class = (Class)CSResetRestoreViewController;
  [(CSModalViewControllerBase *)&v5 viewDidLoad];
}

- (void)aggregateAppearance:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSResetRestoreViewController;
  id v4 = a3;
  [(CSModalViewControllerBase *)&v16 aggregateAppearance:v4];
  objc_super v5 = +[CSComponent homeAffordance];
  v6 = [v5 priority:80];
  v7 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  v8 = [v6 identifier:v7];
  objc_super v9 = [v8 hidden:1];
  [v4 addComponent:v9];

  v10 = +[CSComponent proudLock];
  v11 = [v10 priority:80];
  v12 = [v11 hidden:1];
  [v4 addComponent:v12];

  v13 = +[CSComponent whitePoint];
  v14 = [v13 priority:80];
  v15 = [v14 hidden:1];
  [v4 addComponent:v15];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSResetRestoreViewController;
  id v3 = a3;
  [(CSModalViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "addRestrictedCapabilities:", 1048632, v4.receiver, v4.super_class);
}

- (int64_t)presentationPriority
{
  return 590;
}

- (id)_currentTextForResetOrRestoreState
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v4 = [(CSResetRestoreStatusProviding *)self->_statusProvider isRestoring];
  statusProvider = self->_statusProvider;
  if (v4)
  {
    switch([(CSResetRestoreStatusProviding *)statusProvider restoreState])
    {
      case 1:
        goto LABEL_8;
      case 2:
        v6 = @"RESTORE_COMPLETE";
        goto LABEL_13;
      case 3:
        v6 = @"RESTORE_CANCELING";
        goto LABEL_13;
      case 4:
        v6 = @"RESTORE_FAILED";
        goto LABEL_13;
      default:
        goto LABEL_9;
    }
  }
  if (![(CSResetRestoreStatusProviding *)statusProvider isResetting])
  {
LABEL_8:
    v6 = @"RESTORE_IN_PROGRESS";
LABEL_13:
    objc_super v9 = [v3 localizedStringForKey:v6 value:&stru_1F3020248 table:@"CoverSheet"];
    goto LABEL_14;
  }
  uint64_t v7 = [(CSResetRestoreStatusProviding *)self->_statusProvider resetState];
  if (v7 == 2)
  {
    v6 = @"RESET_COMPLETE";
    goto LABEL_13;
  }
  if (v7 == 1)
  {
    v8 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"RESET_IN_PROGRESS"];
    objc_super v9 = [v3 localizedStringForKey:v8 value:&stru_1F3020248 table:@"CoverSheet"];
  }
  else
  {
LABEL_9:
    objc_super v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
}

@end