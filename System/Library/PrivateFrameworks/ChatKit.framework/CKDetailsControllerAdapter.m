@interface CKDetailsControllerAdapter
- (BOOL)isDetailsNavigationControllerDetached;
- (BOOL)useBusinessDetails;
- (CKBusinessDetailsController)businessDetails;
- (CKConversation)conversation;
- (CKDetailsController)legacyDetails;
- (CKDetailsControllerAdapter)initWithConversation:(id)a3;
- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4;
- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4 customDetailsController:(id)a5;
- (CKDetailsControllerAdapterDelegate)delegate;
- (UINavigationControllerDelegate)customDetails;
- (UINavigationControllerDelegate)detailsController;
- (UINavigationControllerDelegate)modernDetails;
- (id)detailsControllerBusinessPrivacyInfoPresentingViewController:(id)a3;
- (id)presentingViewControllerForGroupAlertsFromDetailsController:(id)a3;
- (void)detailsController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4;
- (void)detailsController:(id)a3 wantsToStageComposition:(id)a4;
- (void)detailsControllerDidDismiss:(id)a3;
- (void)detailsControllerDidSelectStopSharingLocation:(id)a3;
- (void)detailsControllerWantsToPresentKTContactVerificationUI:(id)a3;
- (void)detailsControllerWantsToPresentReportToAppleUI:(id)a3;
- (void)detailsControllerWillDismiss:(id)a3;
- (void)dismissDetailsNavigationController;
- (void)dismissDetailsViewAndShowConversationList;
- (void)setBusinessDetails:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCustomDetails:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLegacyDetails:(id)a3;
- (void)setModernDetails:(id)a3;
- (void)setUseBusinessDetails:(BOOL)a3;
- (void)stageDetailsFindMyCompositionWithShareType:(int64_t)a3;
@end

@implementation CKDetailsControllerAdapter

- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4
{
  return [(CKDetailsControllerAdapter *)self initWithConversation:a3 delegate:a4 customDetailsController:0];
}

- (CKDetailsControllerAdapter)initWithConversation:(id)a3
{
  return [(CKDetailsControllerAdapter *)self initWithConversation:a3 delegate:0];
}

- (CKDetailsControllerAdapter)initWithConversation:(id)a3 delegate:(id)a4 customDetailsController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CKDetailsControllerAdapter;
  v12 = [(CKDetailsControllerAdapter *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conversation, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isBIAEnabled];
    if (v15) {
      LOBYTE(v15) = [v9 isBusinessConversation];
    }
    v13->_useBusinessDetails = v15;

    v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v17 = [v16 isModernDetailsViewEnabled];

    if (v17)
    {
      if (v11)
      {
        [(CKDetailsControllerAdapter *)v13 setCustomDetails:v11];
        goto LABEL_13;
      }
      if (![(CKDetailsControllerAdapter *)v13 useBusinessDetails])
      {
        uint64_t v27 = +[CKModernDetailsControllerFactory detailsControllerWithConversation:v9 delegate:v13];
        modernDetails = v13->_modernDetails;
        v13->_modernDetails = (UINavigationControllerDelegate *)v27;

        v22 = v13->_modernDetails;
        goto LABEL_12;
      }
    }
    else if (![(CKDetailsControllerAdapter *)v13 useBusinessDetails])
    {
      v18 = [CKDetailsController alloc];
      v19 = [(CKDetailsControllerAdapter *)v13 conversation];
      uint64_t v20 = [(CKDetailsController *)v18 initWithConversation:v19];
      legacyDetails = v13->_legacyDetails;
      v13->_legacyDetails = (CKDetailsController *)v20;

      [(CKDetailsController *)v13->_legacyDetails setDetailsControllerDelegate:v13];
      v22 = v13->_legacyDetails;
LABEL_12:
      objc_storeStrong((id *)&v13->_detailsController, v22);
      goto LABEL_13;
    }
    v23 = [CKBusinessDetailsController alloc];
    v24 = [(CKDetailsControllerAdapter *)v13 conversation];
    uint64_t v25 = [(CKBusinessDetailsController *)v23 initWithConversation:v24 detailsControllerDelegate:v13];
    businessDetails = v13->_businessDetails;
    v13->_businessDetails = (CKBusinessDetailsController *)v25;

    v22 = v13->_businessDetails;
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

- (void)stageDetailsFindMyCompositionWithShareType:(int64_t)a3
{
  v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isWaldoEnabled];

  if (v6)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v7 = (void *)getMSMessageClass_softClass_1;
    uint64_t v16 = getMSMessageClass_softClass_1;
    if (!getMSMessageClass_softClass_1)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getMSMessageClass_block_invoke_1;
      v12[3] = &unk_1E5620B90;
      v12[4] = &v13;
      __getMSMessageClass_block_invoke_1((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v8 findMyLocationShareMessageWithDuration:a3];
      id v10 = +[CKComposition compositionWithMSMessage:v9 appExtensionIdentifier:*MEMORY[0x1E4F6CB30]];
      id v11 = [(CKDetailsControllerAdapter *)self delegate];
      [v11 detailsAdapter:self wantsToStageComposition:v10];
    }
  }
}

- (void)detailsControllerWillDismiss:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  [v4 detailsAdapterWillDismiss:self];
}

- (void)detailsControllerDidDismiss:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  [v4 detailsAdapterDidDismiss:self];
}

- (void)dismissDetailsNavigationController
{
  id v2 = [(CKDetailsControllerAdapter *)self delegate];
  [v2 dismissDetailsNavigationController];
}

- (void)dismissDetailsViewAndShowConversationList
{
  id v2 = [(CKDetailsControllerAdapter *)self delegate];
  [v2 dismissDetailsViewAndShowConversationList];
}

- (BOOL)isDetailsNavigationControllerDetached
{
  id v2 = [(CKDetailsControllerAdapter *)self delegate];
  char v3 = [v2 isDetailsNavigationControllerDetached];

  return v3;
}

- (id)detailsControllerBusinessPrivacyInfoPresentingViewController:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  v5 = [v4 detailsAdapterBusinessPrivacyInfoPresentingViewController:self];

  return v5;
}

- (void)detailsControllerWantsToPresentReportToAppleUI:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  [v4 detailsAdapterWantsToPresentReportToAppleUI:self];
}

- (void)detailsControllerWantsToPresentKTContactVerificationUI:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  [v4 detailsAdapterWantsToPresentKTContactVerificationUI:self];
}

- (void)detailsController:(id)a3 wantsToStageComposition:(id)a4
{
  id v5 = a4;
  id v6 = [(CKDetailsControllerAdapter *)self delegate];
  [v6 detailsAdapter:self wantsToStageComposition:v5];
}

- (void)detailsControllerDidSelectStopSharingLocation:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  [v4 detailsAdapterDidSelectStopSharingLocation:self];
}

- (void)detailsController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4
{
  id v8 = a4;
  id v5 = [(CKDetailsControllerAdapter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(CKDetailsControllerAdapter *)self delegate];
    [v7 detailsAdapter:self shouldComposeConversationWithRecipientAddresses:v8];
  }
}

- (id)presentingViewControllerForGroupAlertsFromDetailsController:(id)a3
{
  id v4 = [(CKDetailsControllerAdapter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CKDetailsControllerAdapter *)self delegate];
    v7 = [v6 presentingViewControllerForGroupAlertsFromDetailsAdapter:self];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CKDetailsControllerAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKDetailsControllerAdapterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (UINavigationControllerDelegate)detailsController
{
  return self->_detailsController;
}

- (CKDetailsController)legacyDetails
{
  return self->_legacyDetails;
}

- (void)setLegacyDetails:(id)a3
{
}

- (CKBusinessDetailsController)businessDetails
{
  return self->_businessDetails;
}

- (void)setBusinessDetails:(id)a3
{
}

- (UINavigationControllerDelegate)modernDetails
{
  return self->_modernDetails;
}

- (void)setModernDetails:(id)a3
{
}

- (BOOL)useBusinessDetails
{
  return self->_useBusinessDetails;
}

- (void)setUseBusinessDetails:(BOOL)a3
{
  self->_useBusinessDetails = a3;
}

- (UINavigationControllerDelegate)customDetails
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDetails);

  return (UINavigationControllerDelegate *)WeakRetained;
}

- (void)setCustomDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_customDetails);
  objc_storeStrong((id *)&self->_modernDetails, 0);
  objc_storeStrong((id *)&self->_businessDetails, 0);
  objc_storeStrong((id *)&self->_legacyDetails, 0);
  objc_storeStrong((id *)&self->_detailsController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end