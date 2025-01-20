@interface SWRemoveParticipantAlertController
+ (SWRemoveParticipantAlertController)alertControllerWithParticipant:(SWPerson *)participant highlight:(SWCollaborationHighlight *)highlight;
- (id)_initWithParticipant:(id)a3 highlight:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SWRemoveParticipantAlertController

- (id)_initWithParticipant:(id)a3 highlight:(id)a4
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SWRemoveParticipantAlertController;
  v11 = [(SWRemoveParticipantAlertController *)&v17 init];
  if (v11)
  {
    v12 = [v10 title];
    if (v12)
    {
      v13 = NSString;
      v14 = SWFrameworkBundle();
      uint64_t v4 = [v14 localizedStringForKey:@"PERSON_HAS_BEEN_REMOVED_FROM_THIS_COLLABORATION_WITH_NAME" value:&stru_1EDF19D18 table:@"SharedWithYou"];
      v5 = [v9 displayName];
      v6 = [v10 title];
      objc_msgSend(v13, "stringWithFormat:", v4, v5, v6);
    }
    else
    {
      v14 = SWFrameworkBundle();
      [v14 localizedStringForKey:@"PERSON_HAS_BEEN_REMOVED_FROM_THIS_COLLABORATION_WITHOUT_NAME" value:&stru_1EDF19D18 table:@"SharedWithYou"];
    v15 = };
    objc_storeStrong((id *)&v11->_messageText, v15);
    if (v12)
    {

      v15 = (void *)v4;
    }
  }
  return v11;
}

+ (SWRemoveParticipantAlertController)alertControllerWithParticipant:(SWPerson *)participant highlight:(SWCollaborationHighlight *)highlight
{
  v5 = highlight;
  v6 = participant;
  id v7 = [[SWRemoveParticipantAlertController alloc] _initWithParticipant:v6 highlight:v5];

  [v7 setModalPresentationStyle:6];

  return (SWRemoveParticipantAlertController *)v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SWRemoveParticipantAlertController;
  -[SWRemoveParticipantAlertController viewDidAppear:](&v16, sel_viewDidAppear_);
  v5 = [MEMORY[0x1E4FB1618] clearColor];
  v6 = [(SWRemoveParticipantAlertController *)self view];
  [v6 setBackgroundColor:v5];

  objc_initWeak(&location, self);
  id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:self->_messageText message:0 preferredStyle:1];
  v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = SWFrameworkBundle();
  id v10 = [v9 localizedStringForKey:@"OK" value:&stru_1EDF19D18 table:@"SharedWithYou"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__SWRemoveParticipantAlertController_viewDidAppear___block_invoke;
  v12[3] = &unk_1E5665D08;
  objc_copyWeak(&v13, &location);
  BOOL v14 = v3;
  v11 = [v8 actionWithTitle:v10 style:0 handler:v12];

  [v7 addAction:v11];
  [(SWRemoveParticipantAlertController *)self presentViewController:v7 animated:v3 completion:0];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __52__SWRemoveParticipantAlertController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

- (void).cxx_destruct
{
}

void __54___SWRemoveParticipantAlertController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (v7 && !v6 && WeakRetained)
  {
    [v7 setDelegate:WeakRetained];
    [v9 addChildViewController:v7];
    id v10 = [v9 view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [v7 view];
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

    v20 = [v7 view];
    [v20 setAutoresizingMask:18];

    v21 = [v9 view];
    v22 = [v7 view];
    [v21 addSubview:v22];

    [v7 didMoveToParentViewController:v9];
    v23 = [v9 participant];
    v24 = [v9 highlight];
    objc_msgSend(v7, "_promptToRemoveParticipant:fromHighlight:preferredStyle:", v23, v24, objc_msgSend(v9, "preferredStyle"));
  }
  else
  {
    v25 = SWFrameworkLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412802;
      id v27 = v7;
      __int16 v28 = 2112;
      v29 = v9;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_error_impl(&dword_18FB18000, v25, OS_LOG_TYPE_ERROR, "Failed to present _SWRemoveParticipantAlertRemoteController. Dismissing without prompting the user for changes to the Messages group. remotePromptController: %@, presenter: %@, error: %@", (uint8_t *)&v26, 0x20u);
    }

    [v9 dismissAlert];
  }
}

@end