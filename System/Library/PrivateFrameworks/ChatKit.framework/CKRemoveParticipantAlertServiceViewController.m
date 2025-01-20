@interface CKRemoveParticipantAlertServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)_dismissAndCleanup;
- (void)promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 usingPreferredStyle:(int64_t)a5;
- (void)viewDidLoad;
@end

@implementation CKRemoveParticipantAlertServiceViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CKRemoveParticipantAlertServiceViewController;
  [(CKRemoveParticipantAlertServiceViewController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(CKRemoveParticipantAlertServiceViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 usingPreferredStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  id location = 0;
  objc_initWeak(&location, self);
  v10 = [v8 displayName];
  v11 = [MEMORY[0x1E4F6BDA8] sharedController];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke;
  v14[3] = &unk_1E562AB00;
  objc_copyWeak(v18, &location);
  id v12 = v8;
  id v15 = v12;
  id v13 = v10;
  v18[1] = (id)a5;
  id v16 = v13;
  v17 = self;
  [v11 fetchAttributionsForHighlight:v9 completionHandler:v14];

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 attributions];
  if ((unint64_t)[v4 count] < 2)
  {
    v6 = [v4 firstObject];
    v7 = [v6 conversationIdentifier];
    id v8 = [MEMORY[0x1E4F6BC40] sharedRegistryIfAvailable];
    id v9 = v8;
    if (!v8)
    {
      _IMWarn();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      [WeakRetained _dismissAndCleanup];

LABEL_26:
      goto LABEL_27;
    }
    v10 = [v8 existingChatWithGUID:v7];
    v11 = v10;
    if (v10)
    {
      if ([v10 isGroupChat])
      {
        id v12 = [v11 account];
        id v13 = [*(id *)(a1 + 32) handle];
        v52 = [v12 existingIMHandleWithID:v13];

        if (v52)
        {
          v46 = [[CKConversation alloc] initWithChat:v11];
          v14 = [(CKConversation *)v46 displayName];
          id v15 = v14;
          if (v14)
          {
            id v51 = v14;
          }
          else
          {
            id v51 = [(CKConversation *)v46 name];
          }

          v61[0] = v52;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
          char v20 = [v11 canRemoveParticipants:v19];

          if (v20)
          {
            v49 = NSString;
            v21 = CKFrameworkBundle();
            v22 = [v21 localizedStringForKey:@"REMOVE_PARTICIPANT_FROM_GROUP" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v50 = objc_msgSend(v49, "stringWithFormat:", v22, *(void *)(a1 + 40), v51);

            v47 = NSString;
            v23 = CKFrameworkBundle();
            v24 = [v23 localizedStringForKey:@"PARTICIPANT_REMOVED_FROM_COLLABORATIVE_DOCUMENT_SHARED_WITH_GROUP" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v48 = objc_msgSend(v47, "stringWithFormat:", v24, *(void *)(a1 + 40), v51);

            v44 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v50 message:v48 preferredStyle:*(void *)(a1 + 64)];
            v42 = (void *)MEMORY[0x1E4F42720];
            v25 = NSString;
            v26 = CKFrameworkBundle();
            v27 = [v26 localizedStringForKey:@"REMOVE_FROM_GROUP" value:&stru_1EDE4CA38 table:@"ChatKit"];
            objc_msgSend(v25, "stringWithFormat:", v27, v51);
            id location = (id *)objc_claimAutoreleasedReturnValue();
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_3;
            v55[3] = &unk_1E562AAD8;
            v56 = v46;
            id v57 = v52;
            objc_copyWeak(&v58, (id *)(a1 + 56));
            v43 = [v42 actionWithTitle:location style:0 handler:v55];

            v28 = (void *)MEMORY[0x1E4F42720];
            v29 = CKFrameworkBundle();
            v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_4;
            v53[3] = &unk_1E5621850;
            objc_copyWeak(&v54, (id *)(a1 + 56));
            v31 = [v28 actionWithTitle:v30 style:1 handler:v53];

            [v44 addAction:v43];
            [v44 addAction:v31];
            [*(id *)(a1 + 48) presentViewController:v44 animated:1 completion:0];
            id v32 = objc_loadWeakRetained((id *)(a1 + 56));
            [v32 _dismissAndCleanup];

            objc_destroyWeak(&v54);
            objc_destroyWeak(&v58);
          }
          else
          {
            if (_IMWillLog()) {
              _IMAlwaysLog();
            }
            v33 = NSString;
            v34 = CKFrameworkBundle();
            v35 = [v34 localizedStringForKey:@"PARTICIPANT_IS_STILL_IN_MESSAGES_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v50 = objc_msgSend(v33, "stringWithFormat:", v35, *(void *)(a1 + 40), v51);

            v48 = [MEMORY[0x1E4F42728] alertControllerWithTitle:0 message:v50 preferredStyle:*(void *)(a1 + 64)];
            v36 = (void *)MEMORY[0x1E4F42720];
            v37 = NSString;
            v45 = CKFrameworkBundle();
            v38 = [v45 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
            v39 = objc_msgSend(v37, "stringWithFormat:", v38, v51);
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_2;
            v59[3] = &unk_1E5621850;
            objc_copyWeak(&v60, (id *)(a1 + 56));
            v40 = [v36 actionWithTitle:v39 style:0 handler:v59];

            [v48 addAction:v40];
            [*(id *)(a1 + 48) presentViewController:v48 animated:1 completion:0];

            objc_destroyWeak(&v60);
          }
        }
        else
        {
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          id v18 = objc_loadWeakRetained((id *)(a1 + 56));
          [v18 _dismissAndCleanup];
        }
        goto LABEL_25;
      }
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
    }
    else
    {
      _IMWarn();
    }
    id v17 = objc_loadWeakRetained((id *)(a1 + 56));
    [v17 _dismissAndCleanup];

LABEL_25:
    goto LABEL_26;
  }
  _IMWarn();
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  [v5 _dismissAndCleanup];

LABEL_27:
}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndCleanup];
}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  v2 = *(void **)(a1 + 32);
  v5[0] = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 removeRecipientHandles:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _dismissAndCleanup];
}

void __109__CKRemoveParticipantAlertServiceViewController_promptToRemoveParticipant_fromHighlight_usingPreferredStyle___block_invoke_4(uint64_t a1)
{
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndCleanup];
}

- (void)_dismissAndCleanup
{
  id v2 = [(CKRemoveParticipantAlertServiceViewController *)self _remoteViewControllerProxy];
  [v2 dismissAlert];
}

+ (id)_remoteViewControllerInterface
{
  if (_remoteViewControllerInterface_onceToken != -1) {
    dispatch_once(&_remoteViewControllerInterface_onceToken, &__block_literal_global_209);
  }
  id v2 = (void *)_remoteViewControllerInterface_interface;

  return v2;
}

void __79__CKRemoveParticipantAlertServiceViewController__remoteViewControllerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE10ABB0];
  v1 = (void *)_remoteViewControllerInterface_interface;
  _remoteViewControllerInterface_interface = v0;
}

+ (id)_exportedInterface
{
  if (_exportedInterface_onceToken != -1) {
    dispatch_once(&_exportedInterface_onceToken, &__block_literal_global_137_1);
  }
  id v2 = (void *)_exportedInterface_interface;

  return v2;
}

void __67__CKRemoveParticipantAlertServiceViewController__exportedInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE063530];
  v1 = (void *)_exportedInterface_interface;
  _exportedInterface_interface = v0;

  id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [(id)_exportedInterface_interface setClasses:v3 forSelector:sel_promptToRemoveParticipant_fromHighlight_usingPreferredStyle_ argumentIndex:0 ofReply:0];
  [(id)_exportedInterface_interface setClasses:v2 forSelector:sel_promptToRemoveParticipant_fromHighlight_usingPreferredStyle_ argumentIndex:1 ofReply:0];
}

@end