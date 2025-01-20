@interface CKConversationConfirmationAlertsController
- (BOOL)_hasChatSharingLocationInConversations:(id)a3;
- (BOOL)_isStoredOnIcloud;
- (BOOL)_shouldConfirmStopSharingLocationForConversations:(id)a3;
- (BOOL)shouldPromptBusinessChatSpamReason;
- (BOOL)shouldPromptStopBusinessChat;
- (NSArray)junkConversations;
- (NSArray)selectedConversations;
- (UIViewController)presentationViewController;
- (id)_conversationDeletionAlertMessageForConversations:(id)a3;
- (id)_identifyBusinessConversationToRemove:(id)a3;
- (id)_identifySpamConversationsToRemove:(id)a3;
- (id)_junkRecoveryAlertMessageForCount:(unint64_t)a3;
- (id)_junkRecoveryAlertTitleForCount:(unint64_t)a3;
- (id)_moveToRecentlyDeletedAlertMessageForMessagesCount:(unint64_t)a3;
- (id)_moveToRecentlyDeletedAlertTitleForConversationsCount:(unint64_t)a3;
- (id)_moveToRecentlyDeletedAlertTitleForMessagesCount:(unint64_t)a3;
- (id)_permanentDeletionAlertMessageForCount:(unint64_t)a3;
- (id)_permanentDeletionAlertTitleForCount:(unint64_t)a3;
- (id)_permanentJunkDeletionAlertTitleForCount:(unint64_t)a3;
- (id)_presentReportSpamReaonsControllerIfNeeded;
- (id)_presentStopBusinessChatAlertIfNeededForConversations:(id)a3;
- (id)_recoveryAlertMessageForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4;
- (id)_recoveryAlertMessageForMessagesCount:(unint64_t)a3;
- (id)_recoveryAlertTitleForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4;
- (id)_recoveryAlertTitleForMessagesCount:(unint64_t)a3;
- (id)_reportSpamConfirmationMessageForJunkConversations;
- (id)_spamReportDestinationsForJunkConversations;
- (int64_t)alertControllerStyle;
- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3;
- (void)_configureAppearanceForAlertController:(id)a3;
- (void)_markConversationsAsSpam:(id)a3;
- (void)_presentEndBusinessChatConfirmationForBusinessConversation:(id)a3 actionCompletionBlock:(id)a4;
- (void)_presentRecoverableDeletionConfirmationWithConfirmedBlock:(id)a3 cancelBlock:(id)a4;
- (void)_presentReportSpamReasonWithConversations:(id)a3 didReportBlock:(id)a4;
- (void)_presentStopSharingLocationConfirmationWithActionCompletionBlock:(id)a3;
- (void)_stopSharingLocationInConversations:(id)a3;
- (void)_trackEvent:(int64_t)a3 forConversations:(id)a4;
- (void)presentPermanentDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7;
- (void)presentPermanentJunkDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7;
- (void)presentRecoverDeletedConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7;
- (void)presentRecoverJunkConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7;
- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7;
- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forMessagesCount:(unint64_t)a4 alertControllerStyle:(int64_t)a5 sender:(id)a6 alertsCompletedBlock:(id)a7 cancelBlock:(id)a8;
- (void)setAlertControllerStyle:(int64_t)a3;
- (void)setJunkConversations:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSelectedConversations:(id)a3;
- (void)setShouldPromptBusinessChatSpamReason:(BOOL)a3;
- (void)setShouldPromptStopBusinessChat:(BOOL)a3;
@end

@implementation CKConversationConfirmationAlertsController

- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  [(CKConversationConfirmationAlertsController *)self setShouldPromptBusinessChatSpamReason:0];
  [(CKConversationConfirmationAlertsController *)self setShouldPromptStopBusinessChat:1];
  [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
  [(CKConversationConfirmationAlertsController *)self setSelectedConversations:v15];
  [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
  [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
  v16 = [(CKConversationConfirmationAlertsController *)self _identifySpamConversationsToRemove:v15];
  [(CKConversationConfirmationAlertsController *)self setJunkConversations:v16];

  BOOL v17 = [(CKConversationConfirmationAlertsController *)self _shouldConfirmStopSharingLocationForConversations:v15];
  v18 = [(CKConversationConfirmationAlertsController *)self _presentReportSpamReaonsControllerIfNeeded];
  v19 = [(CKConversationConfirmationAlertsController *)self _presentStopBusinessChatAlertIfNeededForConversations:v15];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
  aBlock[3] = &unk_1E5628000;
  BOOL v34 = v17;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
  v27[3] = &unk_1E5628078;
  id v30 = v19;
  id v31 = v20;
  id v28 = v12;
  id v29 = v18;
  id v32 = v13;
  id v21 = v13;
  id v22 = v12;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  v26 = _Block_copy(v27);
  [(CKConversationConfirmationAlertsController *)self _presentRecoverableDeletionConfirmationWithConfirmedBlock:v26 cancelBlock:v14];
}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = v3;
    [*(id *)(a1 + 32) _presentStopSharingLocationConfirmationWithActionCompletionBlock:v3];
  }
  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    id v5 = v3;
    (*((void (**)(id))v3 + 2))(v3);
  }
  v4 = v5;
LABEL_6:
}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3;
  v3[3] = &unk_1E5628050;
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4;
  v3[3] = &unk_1E5628028;
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5;
  v3[3] = &unk_1E5622330;
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_6;
  v2[3] = &unk_1E5620F48;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  +[CKUtilities onboardRecentlyDeletedIfNeeded:v1 actionHandler:v2];
}

uint64_t __175__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_presentStopBusinessChatAlertIfNeededForConversations:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__CKConversationConfirmationAlertsController__presentStopBusinessChatAlertIfNeededForConversations___block_invoke;
  v8[3] = &unk_1E56280A0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = _Block_copy(v8);

  return v6;
}

void __100__CKConversationConfirmationAlertsController__presentStopBusinessChatAlertIfNeededForConversations___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) shouldPromptStopBusinessChat])
  {
    id v3 = [*(id *)(a1 + 32) _identifyBusinessConversationToRemove:*(void *)(a1 + 40)];
    if (v3)
    {
      [*(id *)(a1 + 32) _presentEndBusinessChatConfirmationForBusinessConversation:v3 actionCompletionBlock:v5];
    }
    else if (v5)
    {
      v5[2]();
    }
  }
  else
  {
    id v4 = v5;
    if (!v5) {
      goto LABEL_10;
    }
    ((void (*)(void (**)(void)))v5[2])(v5);
  }
  id v4 = v5;
LABEL_10:
}

- (id)_presentReportSpamReaonsControllerIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5626FA0;
  aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);

  return v2;
}

void __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldPromptBusinessChatSpamReason])
  {
    id v4 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [*(id *)(a1 + 32) junkConversations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v10 shouldPresentSpamReasonPicker]) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      [*(id *)(a1 + 32) setShouldPromptStopBusinessChat:0];
      v11 = *(void **)(a1 + 32);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke_2;
      v12[3] = &unk_1E5622330;
      id v13 = v4;
      id v14 = v3;
      [v11 _presentReportSpamReasonWithConversations:v13 didReportBlock:v12];
    }
    else
    {
      v3[2](v3);
    }
  }
  else
  {
    v3[2](v3);
  }
}

uint64_t __88__CKConversationConfirmationAlertsController__presentReportSpamReaonsControllerIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "chat", (void)v9);
        [v7 closeSession];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentRecoverableDeletionConfirmationWithConfirmedBlock:(id)a3 cancelBlock:(id)a4
{
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = 2 * (CKIsRunningInMacCatalyst() == 0);
  uint64_t v8 = CKFrameworkBundle();
  long long v9 = [v8 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke;
  v36[3] = &unk_1E5621380;
  id v29 = v6;
  id v37 = v29;
  long long v10 = +[CKAlertAction actionWithTitle:v9 style:v7 handler:v36];

  long long v11 = CKFrameworkBundle();
  long long v12 = [v11 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_2;
  v34[3] = &unk_1E5621380;
  id v13 = v30;
  id v35 = v13;
  uint64_t v14 = +[CKAlertAction actionWithTitle:v12 style:1 handler:v34];

  if ([(CKConversationConfirmationAlertsController *)self alertControllerStyle] == 1)
  {
    long long v15 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
    long long v16 = -[CKConversationConfirmationAlertsController _moveToRecentlyDeletedAlertTitleForConversationsCount:](self, "_moveToRecentlyDeletedAlertTitleForConversationsCount:", [v15 count]);
  }
  else
  {
    long long v16 = 0;
  }
  long long v17 = [(CKConversationConfirmationAlertsController *)self junkConversations];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = [(CKConversationConfirmationAlertsController *)self _reportSpamConfirmationMessageForJunkConversations];
    CKFrameworkBundle();
    id v31 = v10;
    uint64_t v20 = v16;
    id v21 = v14;
    v23 = id v22 = v13;
    id v24 = [v23 localizedStringForKey:@"REPORT_SPAM_ALERT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_3;
    v32[3] = &unk_1E56280C8;
    v32[4] = self;
    id v33 = v29;
    id v25 = +[CKAlertAction actionWithTitle:v24 style:2 handler:v32];

    id v13 = v22;
    uint64_t v14 = v21;
    long long v16 = v20;
    long long v10 = v31;
    v26 = +[CKAlertController alertControllerWithTitle:v16 message:v19 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v26 addAction:v31];
    [v26 addAction:v25];
  }
  else
  {
    v27 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
    v19 = [(CKConversationConfirmationAlertsController *)self _conversationDeletionAlertMessageForConversations:v27];

    v26 = +[CKAlertController alertControllerWithTitle:v16 message:v19 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v26 addAction:v10];
  }

  [v26 addAction:v14];
  [v26 setPreferredAction:v10];
  [(CKConversationConfirmationAlertsController *)self _configureAppearanceForAlertController:v26];
  id v28 = [(CKConversationConfirmationAlertsController *)self presentationViewController];
  [v26 presentFromViewController:v28 animated:1 completion:0];
}

uint64_t __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __116__CKConversationConfirmationAlertsController__presentRecoverableDeletionConfirmationWithConfirmedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 junkConversations];
  [v2 _markConversationsAsSpam:v3];

  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setShouldPromptBusinessChatSpamReason:1];
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)_presentReportSpamReasonWithConversations:(id)a3 didReportBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [CKReportSpamReasonContoller alloc];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  long long v16 = __103__CKConversationConfirmationAlertsController__presentReportSpamReasonWithConversations_didReportBlock___block_invoke;
  long long v17 = &unk_1E5622330;
  uint64_t v18 = self;
  id v19 = v6;
  id v9 = v6;
  long long v10 = [(CKReportSpamReasonContoller *)v8 initWithConversations:v7 didReportBlock:&v14];

  id v11 = objc_alloc(MEMORY[0x1E4F42BF8]);
  long long v12 = objc_msgSend(v11, "initWithRootViewController:", v10, v14, v15, v16, v17, v18);
  [v12 setModalPresentationStyle:2];
  id v13 = [(CKConversationConfirmationAlertsController *)self presentationViewController];
  [v13 presentViewController:v12 animated:1 completion:0];
}

uint64_t __103__CKConversationConfirmationAlertsController__presentReportSpamReasonWithConversations_didReportBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentationViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_presentEndBusinessChatConfirmationForBusinessConversation:(id)a3 actionCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E5622750;
  id v30 = v6;
  id v31 = v7;
  id v24 = v7;
  id v23 = v6;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = CKFrameworkBundle();
  long long v10 = [v9 localizedStringForKey:@"BUSINESS_LEAVE_CONVERSATION_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_2;
  v27[3] = &unk_1E5621380;
  id v11 = v8;
  id v28 = v11;
  long long v12 = +[CKAlertAction actionWithTitle:v10 style:0 handler:v27];

  id v13 = CKFrameworkBundle();
  uint64_t v14 = [v13 localizedStringForKey:@"BUSINESS_LEAVE_CONVERSATION_NOT_NOW_BUTTON" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_3;
  v25[3] = &unk_1E5621380;
  id v26 = v11;
  id v15 = v11;
  long long v16 = +[CKAlertAction actionWithTitle:v14 style:1 handler:v25];

  long long v17 = CKFrameworkBundle();
  uint64_t v18 = [v17 localizedStringForKey:@"BUSINESS_LEAVE_CONVERSATION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v19 = CKFrameworkBundle();
  uint64_t v20 = [v19 localizedStringForKey:@"BUSINESS_LEAVE_CONVERSATION_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v21 = +[CKAlertController alertControllerWithTitle:v18 message:v20 preferredStyle:1];

  [v21 addAction:v12];
  [v21 addAction:v16];
  [v21 setPreferredAction:v12];
  id v22 = [(CKConversationConfirmationAlertsController *)self presentationViewController];
  [v21 presentFromViewController:v22 animated:1 completion:0];
}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) chat];
    [v3 closeSession];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __127__CKConversationConfirmationAlertsController__presentEndBusinessChatConfirmationForBusinessConversation_actionCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentStopSharingLocationConfirmationWithActionCompletionBlock:(id)a3
{
  id v4 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke;
  aBlock[3] = &unk_1E56280F0;
  objc_copyWeak(&v29, &location);
  void aBlock[4] = self;
  id v5 = v4;
  id v28 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = CKFrameworkBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"YES" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_2;
  v25[3] = &unk_1E5621380;
  id v9 = v6;
  id v26 = v9;
  long long v10 = +[CKAlertAction actionWithTitle:v8 style:0 handler:v25];

  id v11 = CKFrameworkBundle();
  long long v12 = [v11 localizedStringForKey:@"NO" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  id v22 = __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_3;
  id v23 = &unk_1E5621380;
  id v13 = v9;
  id v24 = v13;
  uint64_t v14 = +[CKAlertAction actionWithTitle:v12 style:1 handler:&v20];

  id v15 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
  if ((unint64_t)[v15 count] >= 2)
  {
    long long v16 = CKFrameworkBundle();
    [v16 localizedStringForKey:@"STOP_SHARING_ON_BULK_DELETE_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    long long v16 = CKFrameworkBundle();
    [v16 localizedStringForKey:@"STOP_SHARING_ON_DELETE_OR_LEAVE_BODY" value:&stru_1EDE4CA38 table:@"ChatKit"];
  long long v17 = };

  uint64_t v18 = +[CKAlertController alertControllerWithTitle:0 message:v17 preferredStyle:1];
  [v18 addAction:v10];
  [v18 addAction:v14];
  [v18 setPreferredAction:v10];
  id v19 = [(CKConversationConfirmationAlertsController *)self presentationViewController];
  [v18 presentFromViewController:v19 animated:1 completion:0];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [*(id *)(a1 + 32) selectedConversations];
    [WeakRetained _stopSharingLocationInConversations:v4];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __111__CKConversationConfirmationAlertsController__presentStopSharingLocationConfirmationWithActionCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_reportSpamConfirmationMessageForJunkConversations
{
  uint64_t v3 = [(CKConversationConfirmationAlertsController *)self _spamReportDestinationsForJunkConversations];
  unint64_t v4 = [v3 count];
  id v5 = [MEMORY[0x1E4F28DF8] localizedStringByJoiningStrings:v3];
  BOOL v6 = [(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud];
  if (v4 < 2)
  {
    if (!v6)
    {
      int64_t v15 = [(CKConversationConfirmationAlertsController *)self alertControllerStyle];
      id v7 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
      unint64_t v16 = [v7 count];
      long long v17 = CKFrameworkBundle();
      uint64_t v18 = v17;
      if (v15 == 1)
      {
        id v19 = @"BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE";
        uint64_t v20 = @"DELETE_AND_REPORT_APPLE_ALERT_MESSAGE";
      }
      else
      {
        id v19 = @"BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_IPHONE";
        uint64_t v20 = @"DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_IPHONE";
      }
      if (v16 >= 2) {
        id v26 = v19;
      }
      else {
        id v26 = v20;
      }
      uint64_t v27 = [v17 localizedStringForKey:v26 value:&stru_1EDE4CA38 table:@"ChatKit"];
      goto LABEL_31;
    }
    id v7 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
    unint64_t v12 = [v7 count];
    id v9 = NSString;
    long long v10 = CKFrameworkBundle();
    if (v12 >= 2)
    {
      uint64_t v21 = @"BATCH_DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_ICLOUD";
      goto LABEL_27;
    }
    id v11 = @"DELETE_AND_REPORT_APPLE_ALERT_MESSAGE_ICLOUD";
  }
  else
  {
    if (v6)
    {
      id v7 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
      unint64_t v8 = [v7 count];
      id v9 = NSString;
      long long v10 = CKFrameworkBundle();
      if (v8 >= 2)
      {
        id v11 = @"BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_ICLOUD";
        goto LABEL_17;
      }
      uint64_t v21 = @"DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_ICLOUD";
LABEL_27:
      id v28 = [v10 localizedStringForKey:v21 value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v18 = objc_msgSend(v9, "stringWithFormat:", v28, v5);

      id v29 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v30 = [v29 userInterfaceLayoutDirection];

      if (v30 == 1) {
        id v25 = @"\u200F";
      }
      else {
        id v25 = @"\u200E";
      }
      goto LABEL_30;
    }
    int64_t v13 = [(CKConversationConfirmationAlertsController *)self alertControllerStyle];
    id v7 = [(CKConversationConfirmationAlertsController *)self selectedConversations];
    unint64_t v14 = [v7 count];
    id v9 = NSString;
    long long v10 = CKFrameworkBundle();
    if (v13 == 1)
    {
      if (v14 >= 2)
      {
        uint64_t v21 = @"BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE";
        goto LABEL_27;
      }
      id v11 = @"DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE";
    }
    else
    {
      if (v14 >= 2)
      {
        uint64_t v21 = @"BATCH_DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_IPHONE";
        goto LABEL_27;
      }
      id v11 = @"DELETE_AND_REPORT_APPLE_CARRIER_ALERT_MESSAGE_IPHONE";
    }
  }
LABEL_17:
  id v22 = [v10 localizedStringForKey:v11 value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v18 = objc_msgSend(v9, "stringWithFormat:", v22, v5);

  id v23 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v24 = [v23 userInterfaceLayoutDirection];

  if (v24 == 1) {
    id v25 = @"\u200F";
  }
  else {
    id v25 = @"\u200E";
  }
LABEL_30:
  uint64_t v27 = [(__CFString *)v25 stringByAppendingString:v18];
LABEL_31:
  id v31 = (void *)v27;

  return v31;
}

- (id)_spamReportDestinationsForJunkConversations
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(CKConversationConfirmationAlertsController *)self junkConversations];
  uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [v6 chat];
        unint64_t v8 = [v7 account];
        id v9 = [v8 service];
        int v10 = [v9 supportsCapability:*MEMORY[0x1E4F6E0E8]];
        if (v10)
        {
          id v11 = (void *)MEMORY[0x1E4F6BC20];
          id v29 = [v6 chat];
          id v2 = [v29 lastFinishedMessageItem];
          uint64_t v3 = [v6 chat];
          if (objc_msgSend(v11, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v2, objc_msgSend(v3, "chatStyle")))
          {
            LOBYTE(v12) = 1;
LABEL_10:

            if ((v12 & 1) == 0) {
              continue;
            }
            goto LABEL_13;
          }
        }
        int64_t v13 = [v6 chat];
        int v12 = [v13 isChatBot];

        if (v10) {
          goto LABEL_10;
        }

        if (!v12) {
          continue;
        }
LABEL_13:
        unint64_t v14 = (void *)MEMORY[0x1E4F6E660];
        int64_t v15 = [v6 chat];
        unint64_t v16 = [v15 lastFinishedMessageItem];
        long long v17 = [v16 destinationCallerID];
        uint64_t v18 = [v14 carrierNameForPhoneNumber:v17];

        if (v18) {
          [v25 addObject:v18];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v28);
  }

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v25 count])
  {
    uint64_t v20 = [v25 allObjects];
    [v19 addObjectsFromArray:v20];
  }
  uint64_t v21 = CKFrameworkBundle();
  id v22 = [v21 localizedStringForKey:@"APPLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v19 addObject:v22];

  id v23 = (void *)[v19 copy];

  return v23;
}

- (void)presentRecoverableDeletionConfirmationsFromViewController:(id)a3 forMessagesCount:(unint64_t)a4 alertControllerStyle:(int64_t)a5 sender:(id)a6 alertsCompletedBlock:(id)a7 cancelBlock:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v39 = a7;
  id v38 = a8;
  if (a4)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v14];
    [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
    if (CKIsRunningInMacCatalyst())
    {
      unint64_t v16 = CKFrameworkBundle();
      uint64_t v17 = [v16 localizedStringForKey:@"DELETE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      id v19 = NSString;
      uint64_t v20 = CKFrameworkBundle();
      uint64_t v21 = [v20 localizedStringForKey:@"DELETE_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
      unint64_t v16 = objc_msgSend(v19, "localizedStringWithFormat:", v21, a4);

      id v22 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v23 = [v22 userInterfaceLayoutDirection];

      if (v23 == 1) {
        uint64_t v24 = @"\u200F";
      }
      else {
        uint64_t v24 = @"\u200E";
      }
      uint64_t v17 = [(__CFString *)v24 stringByAppendingString:v16];
    }
    id v25 = (void *)v17;
    id v37 = v15;

    uint64_t v26 = 2 * (CKIsRunningInMacCatalyst() == 0);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke;
    v42[3] = &unk_1E56280C8;
    id v27 = v14;
    id v43 = v27;
    id v44 = v39;
    uint64_t v28 = +[CKAlertAction actionWithTitle:v25 style:v26 handler:v42];
    id v29 = CKFrameworkBundle();
    long long v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_3;
    v40[3] = &unk_1E5621380;
    id v41 = v38;
    long long v31 = +[CKAlertAction actionWithTitle:v30 style:1 handler:v40];

    long long v32 = [(CKConversationConfirmationAlertsController *)self _moveToRecentlyDeletedAlertTitleForMessagesCount:a4];
    long long v33 = [(CKConversationConfirmationAlertsController *)self _moveToRecentlyDeletedAlertMessageForMessagesCount:a4];
    BOOL v34 = +[CKAlertController alertControllerWithTitle:v32 message:v33 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v34 addAction:v28];
    [v34 addAction:v31];
    [v34 setPreferredAction:v28];
    id WeakRetained = objc_loadWeakRetained(location);
    [WeakRetained _configureAppearanceForAlertController:v34];

    if (!a5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [v34 popoverPresentationController];
        [v36 setBarButtonItem:v37];
      }
    }
    [v34 presentFromViewController:v27 animated:1 completion:0];

    objc_destroyWeak(location);
    id v15 = v37;
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", (uint8_t *)location, 2u);
    }
  }
}

void __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_2;
  v2[3] = &unk_1E5620F48;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  +[CKUtilities onboardRecentlyDeletedIfNeeded:v1 actionHandler:v2];
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverableDeletionConfirmationsFromViewController_forMessagesCount_alertControllerStyle_sender_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentPermanentDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = [(CKConversationConfirmationAlertsController *)self _numberOfRecoverableMessagesInConversations:v13];
  if (v16)
  {
    unint64_t v17 = v16;
    id v35 = v13;
    [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
    [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
    uint64_t v18 = NSString;
    CKFrameworkBundle();
    uint64_t v20 = v19 = v15;
    uint64_t v21 = [v20 localizedStringForKey:@"DELETE_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v22 = objc_msgSend(v18, "localizedStringWithFormat:", v21, v17);

    uint64_t v23 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v24 = [v23 userInterfaceLayoutDirection];

    if (v24 == 1) {
      id v25 = @"\u200F";
    }
    else {
      id v25 = @"\u200E";
    }
    uint64_t v26 = [(__CFString *)v25 stringByAppendingString:v22];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v39[3] = &unk_1E5621380;
    id v36 = v14;
    id v40 = v14;
    id v27 = +[CKAlertAction actionWithTitle:v26 style:2 handler:v39];

    uint64_t v28 = CKFrameworkBundle();
    id v29 = [v28 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v37[3] = &unk_1E5621380;
    id v38 = v19;
    long long v30 = +[CKAlertAction actionWithTitle:v29 style:1 handler:v37];

    long long v31 = [(CKConversationConfirmationAlertsController *)self _permanentDeletionAlertTitleForCount:v17];
    if (a5 == 1)
    {
      long long v32 = [(CKConversationConfirmationAlertsController *)self _permanentDeletionAlertMessageForCount:v17];
    }
    else
    {
      long long v32 = 0;
    }
    BOOL v34 = +[CKAlertController alertControllerWithTitle:v31 message:v32 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v34 addAction:v27];
    [v34 addAction:v30];
    [v34 setPreferredAction:v27];
    [(CKConversationConfirmationAlertsController *)self _configureAppearanceForAlertController:v34];
    [v34 presentFromViewController:v12 animated:1 completion:0];

    id v14 = v36;
    id v15 = v19;
    id v13 = v35;
  }
  else if (IMOSLoggingEnabled())
  {
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", buf, 2u);
    }
  }
}

uint64_t __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __172__CKConversationConfirmationAlertsController_presentPermanentDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentPermanentJunkDeletionConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v13 count];
  if (v16)
  {
    uint64_t v17 = v16;
    id v51 = v12;
    [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
    int64_t v44 = a5;
    [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
    id v48 = v13;
    [(CKConversationConfirmationAlertsController *)self _identifySpamConversationsToRemove:v13];
    v19 = uint64_t v18 = v15;
    [(CKConversationConfirmationAlertsController *)self setJunkConversations:v19];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    aBlock[3] = &unk_1E5620F48;
    id v50 = v14;
    id v45 = v14;
    id v60 = v45;
    uint64_t v20 = _Block_copy(aBlock);
    v47 = [(CKConversationConfirmationAlertsController *)self _presentReportSpamReaonsControllerIfNeeded];
    uint64_t v21 = NSString;
    id v22 = CKFrameworkBundle();
    uint64_t v23 = [v22 localizedStringForKey:@"DELETE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v17);

    id v25 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v26 = [v25 userInterfaceLayoutDirection];

    if (v26 == 1) {
      id v27 = @"\u200F";
    }
    else {
      id v27 = @"\u200E";
    }
    uint64_t v28 = [(__CFString *)v27 stringByAppendingString:v24];

    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v57[3] = &unk_1E5628118;
    id v29 = v20;
    v57[4] = self;
    id v58 = v29;
    long long v30 = +[CKAlertAction actionWithTitle:v28 style:2 handler:v57];

    long long v31 = CKFrameworkBundle();
    long long v32 = [v31 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3;
    v55[3] = &unk_1E5621380;
    v49 = v18;
    id v56 = v18;
    long long v33 = +[CKAlertAction actionWithTitle:v32 style:1 handler:v55];

    if ([(CKConversationConfirmationAlertsController *)self alertControllerStyle] == 1)
    {
      BOOL v34 = [(CKConversationConfirmationAlertsController *)self _permanentJunkDeletionAlertTitleForCount:v17];
    }
    else
    {
      BOOL v34 = 0;
    }
    id v36 = [(CKConversationConfirmationAlertsController *)self junkConversations];
    uint64_t v37 = [v36 count];

    id v13 = v48;
    v46 = v29;
    if (v37)
    {
      id v38 = [(CKConversationConfirmationAlertsController *)self _reportSpamConfirmationMessageForJunkConversations];
      id v39 = CKFrameworkBundle();
      id v40 = [v39 localizedStringForKey:@"REPORT_SPAM_ALERT_BUTTON_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4;
      v52[3] = &unk_1E5628140;
      v52[4] = self;
      id v41 = v47;
      id v53 = v47;
      id v54 = v45;
      v42 = +[CKAlertAction actionWithTitle:v40 style:2 handler:v52];

      id v43 = +[CKAlertController alertControllerWithTitle:v34 message:v38 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
      [v43 addAction:v30];
      [v43 addAction:v42];

      id v12 = v51;
    }
    else
    {
      if (v44 == 1)
      {
        id v38 = [(CKConversationConfirmationAlertsController *)self _conversationDeletionAlertMessageForConversations:v48];
      }
      else
      {
        id v38 = 0;
      }
      id v12 = v51;
      id v43 = +[CKAlertController alertControllerWithTitle:v34 message:v38 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
      [v43 addAction:v30];
      id v41 = v47;
    }

    [v43 addAction:v33];
    [v43 setPreferredAction:v30];
    [(CKConversationConfirmationAlertsController *)self _configureAppearanceForAlertController:v43];
    [v43 presentFromViewController:v12 animated:1 completion:0];

    id v15 = v49;
    id v14 = v50;
  }
  else if (IMOSLoggingEnabled())
  {
    id v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Delete requested on 0 messages", buf, 2u);
    }
  }
}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 junkConversations];
  [v2 _trackEvent:0 forConversations:v3];
}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 junkConversations];
  [v2 _markConversationsAsSpam:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5;
  v7[3] = &unk_1E5620F48;
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v7);
  id v5 = *(void **)(a1 + 32);
  BOOL v6 = [v5 junkConversations];
  [v5 _trackEvent:1 forConversations:v6];
}

uint64_t __176__CKConversationConfirmationAlertsController_presentPermanentJunkDeletionConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentRecoverDeletedConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v43 = a6;
  id v41 = v13;
  id v42 = a7;
  unint64_t v14 = [(CKConversationConfirmationAlertsController *)self _numberOfRecoverableMessagesInConversations:v13];
  id v40 = v12;
  if (v14)
  {
    unint64_t v15 = v14;
    [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
    int64_t v37 = a5;
    [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
    uint64_t v16 = NSString;
    uint64_t v17 = CKFrameworkBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"RECENTLY_DELETED_RECOVER_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    id v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v15);

    uint64_t v20 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v21 = [v20 userInterfaceLayoutDirection];

    if (v21 == 1) {
      id v22 = @"\u200F";
    }
    else {
      id v22 = @"\u200E";
    }
    id v39 = [(__CFString *)v22 stringByAppendingString:v19];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v50[3] = &unk_1E5621380;
    id v51 = v43;
    uint64_t v23 = +[CKAlertAction actionWithTitle:v39 style:0 handler:v50];
    uint64_t v24 = CKFrameworkBundle();
    id v25 = [v24 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v48[3] = &unk_1E5621380;
    id v49 = v42;
    id v38 = +[CKAlertAction actionWithTitle:v25 style:1 handler:v48];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v13;
    id v27 = 0;
    uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = [*(id *)(*((void *)&v44 + 1) + 8 * i) chat];
          unsigned int v32 = [v31 isDeletingIncomingMessages];

          v27 += v32;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v28);
    }

    uint64_t v33 = [v26 count] - (void)v27;
    if (v37 == 1)
    {
      if (v27) {
        [(CKConversationConfirmationAlertsController *)self _recoveryAlertTitleForBlockedConversationsCount:v27 allowedConversationsCount:v33];
      }
      else {
      id v35 = -[CKConversationConfirmationAlertsController _recoveryAlertTitleForMessagesCount:](self, "_recoveryAlertTitleForMessagesCount:", v15, v33);
      }
      id v27 = [(CKConversationConfirmationAlertsController *)self _recoveryAlertMessageForMessagesCount:v15];
    }
    else
    {
      if (v27)
      {
        id v27 = [(CKConversationConfirmationAlertsController *)self _recoveryAlertMessageForBlockedConversationsCount:v27 allowedConversationsCount:v33];
      }
      id v35 = 0;
    }
    id v36 = +[CKAlertController alertControllerWithTitle:v35 message:v27 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v36 addAction:v23];
    [v36 addAction:v38];
    [v36 setPreferredAction:v23];
    [(CKConversationConfirmationAlertsController *)self _configureAppearanceForAlertController:v36];
    [v36 presentFromViewController:v40 animated:1 completion:0];
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Recover requested on 0 messages", buf, 2u);
    }
  }
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __182__CKConversationConfirmationAlertsController_presentRecoverDeletedConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentRecoverJunkConversationsConfirmationFromViewController:(id)a3 forConversations:(id)a4 alertControllerStyle:(int64_t)a5 alertsCompletedBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([v13 count])
  {
    [(CKConversationConfirmationAlertsController *)self setPresentationViewController:v12];
    [(CKConversationConfirmationAlertsController *)self setAlertControllerStyle:a5];
    uint64_t v16 = CKFrameworkBundle();
    [v16 localizedStringForKey:@"REMOVE_FROM_JUNK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v18 = id v17 = v13;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke;
    v32[3] = &unk_1E5621380;
    id v29 = v14;
    id v33 = v14;
    uint64_t v28 = (void *)v18;
    uint64_t v19 = v18;
    id v13 = v17;
    uint64_t v20 = +[CKAlertAction actionWithTitle:v19 style:0 handler:v32];
    uint64_t v21 = CKFrameworkBundle();
    id v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2;
    v30[3] = &unk_1E5621380;
    id v31 = v15;
    uint64_t v23 = +[CKAlertAction actionWithTitle:v22 style:1 handler:v30];

    uint64_t v24 = 0;
    id v25 = 0;
    if (a5 == 1)
    {
      id v25 = -[CKConversationConfirmationAlertsController _junkRecoveryAlertTitleForCount:](self, "_junkRecoveryAlertTitleForCount:", [v13 count]);
      uint64_t v24 = -[CKConversationConfirmationAlertsController _junkRecoveryAlertMessageForCount:](self, "_junkRecoveryAlertMessageForCount:", [v13 count]);
    }
    id v26 = +[CKAlertController alertControllerWithTitle:v25 message:v24 preferredStyle:[(CKConversationConfirmationAlertsController *)self alertControllerStyle]];
    [v26 addAction:v20];
    [v26 addAction:v23];
    [v26 setPreferredAction:v20];
    [(CKConversationConfirmationAlertsController *)self _configureAppearanceForAlertController:v26];
    [v26 presentFromViewController:v12 animated:1 completion:0];

    id v14 = v29;
  }
  else if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "Junk recovery requested on 0 conversations", buf, 2u);
    }
  }
}

uint64_t __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __179__CKConversationConfirmationAlertsController_presentRecoverJunkConversationsConfirmationFromViewController_forConversations_alertControllerStyle_alertsCompletedBlock_cancelBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_markConversationsAsSpam:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        int v10 = [v9 chat];
        if (([v10 isBusinessChat] & 1) == 0)
        {

LABEL_10:
          [v5 addObject:v9];
          continue;
        }
        id v11 = [v9 chat];
        int v12 = [v11 isChatBot];

        if (v12) {
          goto LABEL_10;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v6);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v37 = v5;
  uint64_t v40 = [v37 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v44;
    *(void *)&long long v13 = 67109120;
    long long v36 = v13;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(v37);
        }
        id v15 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v16 = objc_msgSend(v15, "chat", v36);
        id v17 = [v16 account];
        uint64_t v18 = [v17 service];
        int v19 = [v18 supportsCapability:*MEMORY[0x1E4F6E0E8]];
        if (v19)
        {
          uint64_t v20 = (void *)MEMORY[0x1E4F6BC20];
          id v42 = [v15 chat];
          id v41 = [v42 lastFinishedMessageItem];
          id v3 = [v15 chat];
          if (objc_msgSend(v20, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v41, objc_msgSend(v3, "chatStyle")))
          {
            LOBYTE(v21) = 1;
LABEL_22:

            if (v21) {
              goto LABEL_23;
            }
            goto LABEL_25;
          }
        }
        id v22 = [v15 chat];
        int v21 = [v22 isChatBot];

        if (v19) {
          goto LABEL_22;
        }

        if (v21)
        {
LABEL_23:
          uint64_t v23 = [v15 chat];
          [v23 reportJunkToCarrier];

          uint64_t v24 = 1;
          goto LABEL_26;
        }
LABEL_25:
        uint64_t v24 = 0;
LABEL_26:
        id v25 = [v15 chat];
        uint64_t v26 = [v25 isChatBot];

        id v27 = [v15 chat];
        uint64_t v28 = [v27 lastIncomingFinishedMessage];
        id v29 = [v28 sender];
        long long v30 = [v29 service];
        id v31 = [MEMORY[0x1E4F6BDC0] rcsService];
        BOOL v32 = v30 == v31;

        if ((v26 | v32) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            id v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v36;
              int v52 = v26;
              _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Starting to report lazuli spam. isBot: %{BOOL}d", buf, 8u);
            }
          }
          BOOL v34 = [v15 chat];
          [v34 reportLazuliSpam:0 isBot:v26];
        }
        id v35 = [v15 chat];
        objc_msgSend(v35, "markAsSpam:isJunkReportedToCarrier:", +[CKUtilities messageJunkStatus](CKUtilities, "messageJunkStatus"), v24);
      }
      uint64_t v40 = [v37 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v40);
  }
}

- (id)_identifySpamConversationsToRemove:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v4 = IMSMSReportSpamExtensionAvailable();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    char v40 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v11 = [v10 chat];
        if ([v11 isBusinessChat])
        {
        }
        else
        {
          int v12 = [v10 chat];
          uint64_t v13 = [v12 numberOfTimesRespondedToThread];

          if (v13 > 2) {
            continue;
          }
        }
        if (([v10 isStewieConversation] & 1) == 0)
        {
          id v14 = [v10 chat];
          char v15 = [v14 isStewieSharingChat];

          if ((v15 & 1) == 0)
          {
            uint64_t v16 = [v10 chat];
            char v17 = [v16 supportsFilteringExtensions] & v4;

            if ((v17 & 1) == 0)
            {
              uint64_t v18 = [v10 chat];
              char v19 = [v18 hasKnownParticipants];

              if ((v19 & 1) == 0)
              {
                uint64_t v20 = [v10 chat];
                int v21 = [v20 chatItems];
                id v22 = [v21 messages];
                uint64_t v23 = [v22 firstObject];

                uint64_t v24 = [v10 chat];
                if ([v24 isMapKitBusinessChat])
                {

                  goto LABEL_16;
                }
                char v25 = [v23 isFromMe];

                if ((v25 & 1) == 0)
                {
LABEL_16:
                  if (IMShouldHandleInternalPhishingAttempts()) {
                    goto LABEL_25;
                  }
                  uint64_t v26 = [v10 chat];
                  id v27 = [v26 account];
                  uint64_t v28 = [v27 service];
                  id v29 = [MEMORY[0x1E4F6BDB8] rcsService];
                  if (v28 == v29)
                  {
                    uint64_t v39 = [v10 chat];
                    if ([v39 isChatBot])
                    {
                      id v37 = [v10 chat];
                      id v38 = [v37 lastSentMessage];

                      char v4 = v40;
                      if (!v38) {
                        goto LABEL_25;
                      }
                      goto LABEL_23;
                    }
                  }
                  char v4 = v40;
LABEL_23:
                  long long v30 = [v10 chat];
                  int v31 = [v30 supportsFilteringExtensions];

                  if (!v31) {
                    goto LABEL_25;
                  }
                  BOOL v32 = (void *)MEMORY[0x1E4F6BC20];
                  id v33 = [v10 chat];
                  BOOL v34 = [v33 lastFinishedMessageItem];
                  id v35 = [v10 chat];
                  LODWORD(v32) = objc_msgSend(v32, "isReportJunkServiceAllowedForMessageItem:junkChatStyle:", v34, objc_msgSend(v35, "chatStyle"));

                  char v4 = v40;
                  if (v32) {
LABEL_25:
                  }
                    [v41 addObject:v10];
                }

                continue;
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v7);
  }

  return v41;
}

- (BOOL)_hasChatSharingLocationInConversations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "chat", (void)v10);
        char v8 = [v7 hasRecipientsFollowingLocation];

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_stopSharingLocationInConversations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) chat];
        [v8 stopSharingLocation];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unint64_t)_numberOfRecoverableMessagesInConversations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) chat];
        v6 += [v9 recoverableMessagesCount];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_moveToRecentlyDeletedAlertTitleForConversationsCount:(unint64_t)a3
{
  if ([(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud])
  {
    uint64_t v4 = CKFrameworkBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"CONVERSATIONLIST_RECOVERABLE_DELETION_ICLOUD_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    unint64_t v6 = NSString;
    uint64_t v7 = CKFrameworkBundle();
    char v8 = [v7 localizedStringForKey:@"DELETE_CONVERSATION" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v4 = objc_msgSend(v6, "localizedStringWithFormat:", v8, a3);

    long long v9 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    if (v10 == 1) {
      long long v11 = @"\u200F";
    }
    else {
      long long v11 = @"\u200E";
    }
    uint64_t v5 = [(__CFString *)v11 stringByAppendingString:v4];
  }
  long long v12 = (void *)v5;

  return v12;
}

- (id)_conversationDeletionAlertMessageForConversations:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "hasCancellableScheduledMessage", (void)v17))
        {
          char v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  char v9 = 0;
LABEL_11:

  if ([(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud])
  {
    uint64_t v10 = [v4 count];
    long long v11 = CKFrameworkBundle();
    if (v10 == 1)
    {
      if (v9) {
        long long v12 = @"SCHEDULED_DELETE_ALERT_MESSAGE_ON_ICLOUD";
      }
      else {
        long long v12 = @"DELETE_ALERT_MESSAGE_ON_ICLOUD";
      }
    }
    else if (v9)
    {
      long long v12 = @"SCHEDULED_BATCH_DELETE_ALERT_MESSAGE_ON_ICLOUD";
    }
    else
    {
      long long v12 = @"BATCH_DELETE_ALERT_MESSAGE_ON_ICLOUD";
    }
  }
  else
  {
    int64_t v13 = [(CKConversationConfirmationAlertsController *)self alertControllerStyle];
    uint64_t v14 = [v4 count];
    long long v11 = CKFrameworkBundle();
    if (v13 == 1)
    {
      if (v14 == 1)
      {
        if (v9) {
          long long v12 = @"SCHEDULED_DELETE_ALERT_MESSAGE";
        }
        else {
          long long v12 = @"DELETE_ALERT_MESSAGE";
        }
      }
      else if (v9)
      {
        long long v12 = @"SCHEDULED_BATCH_DELETE_ALERT_MESSAGE";
      }
      else
      {
        long long v12 = @"BATCH_DELETE_ALERT_MESSAGE";
      }
    }
    else if (v14 == 1)
    {
      if (v9) {
        long long v12 = @"SCHEDULED_DELETE_CONVERSATION_MESSAGE";
      }
      else {
        long long v12 = @"DELETE_CONVERSATION_MESSAGE";
      }
    }
    else if (v9)
    {
      long long v12 = @"SCHEDULED_BATCH_DELETE_CONVERSATION_MESSAGE";
    }
    else
    {
      long long v12 = @"BATCH_DELETE_CONVERSATION_MESSAGE";
    }
  }
  uint64_t v15 = objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1EDE4CA38, @"ChatKit", (void)v17);

  return v15;
}

- (id)_moveToRecentlyDeletedAlertTitleForMessagesCount:(unint64_t)a3
{
  if ([(CKConversationConfirmationAlertsController *)self alertControllerStyle])
  {
    if ([(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud])
    {
      uint64_t v5 = CKFrameworkBundle();
      uint64_t v6 = [v5 localizedStringForKey:@"CONVERSATIONLIST_RECOVERABLE_DELETION_ICLOUD_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    }
    else
    {
      char v8 = NSString;
      char v9 = CKFrameworkBundle();
      uint64_t v10 = [v9 localizedStringForKey:@"DELETE_MESSAGES" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v5 = objc_msgSend(v8, "localizedStringWithFormat:", v10, a3);

      long long v11 = [MEMORY[0x1E4F42738] sharedApplication];
      uint64_t v12 = [v11 userInterfaceLayoutDirection];

      if (v12 == 1) {
        int64_t v13 = @"\u200F";
      }
      else {
        int64_t v13 = @"\u200E";
      }
      uint64_t v6 = [(__CFString *)v13 stringByAppendingString:v5];
    }
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_moveToRecentlyDeletedAlertMessageForMessagesCount:(unint64_t)a3
{
  if ([(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud])
  {
    id v4 = CKFrameworkBundle();
    if (a3 > 1) {
      uint64_t v5 = @"BATCH_DELETE_INDIVIDUAL_MESSAGE_ON_ICLOUD";
    }
    else {
      uint64_t v5 = @"DELETE_INDIVIDUAL_MESSAGE_ON_ICLOUD";
    }
  }
  else
  {
    if (!CKIsRunningInMacCatalyst())
    {
      uint64_t v6 = 0;
      goto LABEL_11;
    }
    id v4 = CKFrameworkBundle();
    if (a3 > 1) {
      uint64_t v5 = @"DELETE_MULTIPLE_MESSAGES";
    }
    else {
      uint64_t v5 = @"DELETE_SINGLE_MESSAGE";
    }
  }
  uint64_t v6 = [v4 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_11:

  return v6;
}

- (id)_permanentDeletionAlertTitleForCount:(unint64_t)a3
{
  if ([(CKConversationConfirmationAlertsController *)self alertControllerStyle] == 1)
  {
    uint64_t v5 = CKFrameworkBundle();
    if (a3 > 1) {
      uint64_t v6 = @"RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ALERT_TITLE";
    }
    else {
      uint64_t v6 = @"RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ALERT_TITLE";
    }
  }
  else
  {
    BOOL v7 = [(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud];
    uint64_t v5 = CKFrameworkBundle();
    if (v7)
    {
      if (a3 > 1) {
        uint64_t v6 = @"RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ICLOUD_MESSAGE";
      }
      else {
        uint64_t v6 = @"RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ICLOUD_MESSAGE";
      }
    }
    else if (a3 > 1)
    {
      uint64_t v6 = @"RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_TITLE";
    }
    else
    {
      uint64_t v6 = @"RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_TITLE";
    }
  }
  char v8 = [v5 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v8;
}

- (id)_permanentJunkDeletionAlertTitleForCount:(unint64_t)a3
{
  if ([(CKConversationConfirmationAlertsController *)self alertControllerStyle] == 1)
  {
    uint64_t v5 = CKFrameworkBundle();
    if (a3 > 1) {
      uint64_t v6 = @"PERMANENT_PLURAL_CONVERSATION_DELETION_CONFIRMATION";
    }
    else {
      uint64_t v6 = @"PERMANENT_CONVERSATION_DELETION_CONFIRMATION";
    }
  }
  else
  {
    BOOL v7 = [(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud];
    uint64_t v5 = CKFrameworkBundle();
    if (v7)
    {
      if (a3 > 1) {
        uint64_t v6 = @"DELETE_PLURAL_WARNING_ON_ICLOUD";
      }
      else {
        uint64_t v6 = @"DELETE_WARNING_ON_ICLOUD";
      }
    }
    else if (a3 > 1)
    {
      uint64_t v6 = @"PERMANENT_PLURAL_CONVERSATION_DELETION_WARNING";
    }
    else
    {
      uint64_t v6 = @"PERMANENT_CONVERSATION_DELETION_WARNING";
    }
  }
  char v8 = [v5 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v8;
}

- (id)_permanentDeletionAlertMessageForCount:(unint64_t)a3
{
  BOOL v4 = [(CKConversationConfirmationAlertsController *)self _isStoredOnIcloud];
  uint64_t v5 = CKFrameworkBundle();
  uint64_t v6 = v5;
  BOOL v7 = @"RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_ICLOUD_MESSAGE";
  if (a3 < 2) {
    BOOL v7 = @"RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_ICLOUD_MESSAGE";
  }
  char v8 = @"RECENTLY_DELETED_SINGULAR_PERMANENT_DELETION_MESSAGE";
  if (a3 >= 2) {
    char v8 = @"RECENTLY_DELETED_PLURAL_PERMANENT_DELETION_MESSAGE";
  }
  if (v4) {
    char v9 = v7;
  }
  else {
    char v9 = v8;
  }
  uint64_t v10 = [v5 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v10;
}

- (id)_recoveryAlertTitleForMessagesCount:(unint64_t)a3
{
  BOOL v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (a3 <= 1) {
    uint64_t v6 = @"RECENTLY_DELETED_SINGULAR_RECOVERY_TITLE";
  }
  else {
    uint64_t v6 = @"RECENTLY_DELETED_PLURAL_RECOVERY_TITLE";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_recoveryAlertTitleForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4
{
  if (a4)
  {
    uint64_t v6 = NSString;
    BOOL v7 = CKFrameworkBundle();
    char v8 = [v7 localizedStringForKey:@"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_CATALYST" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, a4);

    uint64_t v10 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v11 = [v10 userInterfaceLayoutDirection];

    if (v11 == 1) {
      uint64_t v12 = @"\u200F";
    }
    else {
      uint64_t v12 = @"\u200E";
    }
    uint64_t v15 = [(__CFString *)v12 stringByAppendingString:v9];
  }
  else
  {
    int64_t v13 = CKFrameworkBundle();
    char v9 = v13;
    if (a3 < 2) {
      uint64_t v14 = @"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_SINGLE_CATALYST";
    }
    else {
      uint64_t v14 = @"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_MULTIPLE_CATALYST";
    }
    uint64_t v15 = [v13 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  uint64_t v16 = (void *)v15;

  return v16;
}

- (id)_recoveryAlertMessageForMessagesCount:(unint64_t)a3
{
  BOOL v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (a3 <= 1) {
    uint64_t v6 = @"RECENTLY_DELETED_SINGULAR_RECOVERY_MESSAGE";
  }
  else {
    uint64_t v6 = @"RECENTLY_DELETED_PLURAL_RECOVERY_MESSAGE";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_recoveryAlertMessageForBlockedConversationsCount:(unint64_t)a3 allowedConversationsCount:(unint64_t)a4
{
  if (a3 && a4)
  {
    uint64_t v6 = NSString;
    BOOL v7 = CKFrameworkBundle();
    char v8 = [v7 localizedStringForKey:@"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS" value:&stru_1EDE4CA38 table:@"ChatKit"];
    char v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, a3, a4);

    uint64_t v10 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v11 = [v10 userInterfaceLayoutDirection];

    if (v11 == 1) {
      uint64_t v12 = @"\u200F";
    }
    else {
      uint64_t v12 = @"\u200E";
    }
    uint64_t v15 = [(__CFString *)v12 stringByAppendingString:v9];
  }
  else
  {
    if (!a3)
    {
      uint64_t v16 = 0;
      goto LABEL_14;
    }
    if (a3 == 1)
    {
      int64_t v13 = CKFrameworkBundle();
      char v9 = v13;
      uint64_t v14 = @"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATION_SINGLE";
    }
    else
    {
      int64_t v13 = CKFrameworkBundle();
      char v9 = v13;
      uint64_t v14 = @"RECENTLY_DELETED_RECOVER_BLOCKED_CONVERSATIONS_MULTIPLE";
    }
    uint64_t v15 = [v13 localizedStringForKey:v14 value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  uint64_t v16 = (void *)v15;

LABEL_14:

  return v16;
}

- (id)_junkRecoveryAlertTitleForCount:(unint64_t)a3
{
  BOOL v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (a3 <= 1) {
    uint64_t v6 = @"ARE_YOU_SURE_WANT_TO_REMOVE_THIS_CONVERSATION_FROM_JUNK";
  }
  else {
    uint64_t v6 = @"ARE_YOU_SURE_WANT_TO_REMOVE_THESE_CONVERSATIONS_FROM_JUNK";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_junkRecoveryAlertMessageForCount:(unint64_t)a3
{
  BOOL v4 = CKFrameworkBundle();
  uint64_t v5 = v4;
  if (a3 <= 1) {
    uint64_t v6 = @"THIS_CONVERSATION_WILL_BE_REMOVED_FROM_JUNK";
  }
  else {
    uint64_t v6 = @"THESE_CONVERSATIONS_WILL_BE_REMOVED_FROM_JUNK";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v7;
}

- (id)_identifyBusinessConversationToRemove:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    BOOL v4 = [v3 firstObject];
    if ([v4 isMapKitBusinessConversation]
      && ([v4 isMakoConversation] & 1) == 0)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldConfirmStopSharingLocationForConversations:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6BCB8] sharedInstance];
  if ([v5 restrictLocationSharing])
  {
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F6BCB8] sharedInstance];
    char v7 = [v6 disableLocationSharing];

    if ((v7 & 1) == 0)
    {
      BOOL v8 = [(CKConversationConfirmationAlertsController *)self _hasChatSharingLocationInConversations:v4];
      goto LABEL_6;
    }
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (void)_configureAppearanceForAlertController:(id)a3
{
  id v3 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    [v3 setWantsWindowedPresentation:1];
    [v3 setShouldHidePresentingWindow:1];
  }
}

- (BOOL)_isStoredOnIcloud
{
  id v2 = [MEMORY[0x1E4F6BC68] sharedInstance];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)_trackEvent:(int64_t)a3 forConversations:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v4 = 10;
    uint64_t v5 = 11;
  }
  else
  {
    uint64_t v4 = 8;
    uint64_t v5 = 9;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(CKConversationConfirmationAlertsController *)self junkConversations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = [v11 chat];
        uint64_t v13 = [v12 isFiltered];

        if (v13 == 2)
        {
          uint64_t v14 = [v11 chat];
          int v15 = [v14 isSMS];

          uint64_t v16 = [MEMORY[0x1E4F6E890] sharedInstance];
          long long v17 = v16;
          if (v15)
          {
            uint64_t v24 = &unk_1EDF166B8;
            long long v18 = [NSNumber numberWithBool:IMIsOscarEnabled()];
            char v25 = v18;
            long long v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            [v17 trackiMessageJunkEvent:v5 withDictionary:v19];
          }
          else
          {
            [v16 trackiMessageJunkEvent:v4];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
}

- (int64_t)alertControllerStyle
{
  return self->_alertControllerStyle;
}

- (void)setAlertControllerStyle:(int64_t)a3
{
  self->_alertControllerStyle = a3;
}

- (NSArray)selectedConversations
{
  return self->_selectedConversations;
}

- (void)setSelectedConversations:(id)a3
{
}

- (NSArray)junkConversations
{
  return self->_junkConversations;
}

- (void)setJunkConversations:(id)a3
{
}

- (UIViewController)presentationViewController
{
  return self->_presentationViewController;
}

- (void)setPresentationViewController:(id)a3
{
}

- (BOOL)shouldPromptBusinessChatSpamReason
{
  return self->_shouldPromptBusinessChatSpamReason;
}

- (void)setShouldPromptBusinessChatSpamReason:(BOOL)a3
{
  self->_shouldPromptBusinessChatSpamReason = a3;
}

- (BOOL)shouldPromptStopBusinessChat
{
  return self->_shouldPromptStopBusinessChat;
}

- (void)setShouldPromptStopBusinessChat:(BOOL)a3
{
  self->_shouldPromptStopBusinessChat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_junkConversations, 0);

  objc_storeStrong((id *)&self->_selectedConversations, 0);
}

@end