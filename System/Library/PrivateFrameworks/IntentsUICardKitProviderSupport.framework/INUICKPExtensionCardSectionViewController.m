@interface INUICKPExtensionCardSectionViewController
- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate;
- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5;
- (void)desiresInteractivity:(id)a3;
- (void)remoteViewController:(id)a3 requestsHandlingOfIntent:(id)a4;
- (void)remoteViewControllerWillBeginEditing:(id)a3;
- (void)setCardSectionViewControllingDelegate:(id)a3;
@end

@implementation INUICKPExtensionCardSectionViewController

- (void)desiresInteractivity:(id)a3
{
  id v4 = a3;
  id v5 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
  [v5 desiresInteractivity:v4];
}

- (void)remoteViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  id v6 = [(INUICKPExtensionCardSectionViewController *)self cardSectionViewControllingDelegate];
  id v5 = objc_alloc_init(MEMORY[0x263F316A8]);
  [v6 performCommand:v5 forViewController:self];
}

- (void)remoteViewControllerWillBeginEditing:(id)a3
{
  id v5 = [(INUICKPExtensionCardSectionViewController *)self cardSectionViewControllingDelegate];
  id v4 = objc_alloc_init(MEMORY[0x263F31668]);
  [v5 performCommand:v4 forViewController:self];
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v7 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];

  if (v7)
  {
    switch(a3)
    {
      case 3uLL:
        id v22 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
        [v22 requestCancellation];

        break;
      case 4uLL:
        v8 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
        id v9 = (id)[v8 disconnect];

        [(INUICKPSynchronousRemoteViewController *)self setRemoteViewController:0];
        break;
      case 5uLL:
        v10 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
        v11 = [v10 _cancelTouchesForCurrentEventInHostedContent];
        id touchDeliveryPolicyAssertion = self->_touchDeliveryPolicyAssertion;
        self->_id touchDeliveryPolicyAssertion = v11;

        v13 = (void *)*MEMORY[0x263F31630];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          v15 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
          id v16 = self->_touchDeliveryPolicyAssertion;
          *(_DWORD *)buf = 138412546;
          v24 = v15;
          __int16 v25 = 2112;
          id v26 = v16;
          _os_log_impl(&dword_230990000, v14, OS_LOG_TYPE_INFO, "CRKEventScrollingStarted, cancelling touches for %@ with assertion %@", buf, 0x16u);
        }
        break;
      case 6uLL:
        v17 = (void *)*MEMORY[0x263F31630];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          v19 = [(INUICKPSynchronousRemoteViewController *)self remoteViewController];
          id v20 = self->_touchDeliveryPolicyAssertion;
          *(_DWORD *)buf = 138412546;
          v24 = v19;
          __int16 v25 = 2112;
          id v26 = v20;
          _os_log_impl(&dword_230990000, v18, OS_LOG_TYPE_INFO, "CRKEventScrollingEnded, resuming touches for %@ by invalidating assertion %@", buf, 0x16u);
        }
        [self->_touchDeliveryPolicyAssertion invalidate];
        id v21 = self->_touchDeliveryPolicyAssertion;
        self->_id touchDeliveryPolicyAssertion = 0;

        break;
      default:
        return;
    }
  }
}

- (CRKCardSectionViewControllingDelegate)cardSectionViewControllingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSectionViewControllingDelegate);
  return (CRKCardSectionViewControllingDelegate *)WeakRetained;
}

- (void)setCardSectionViewControllingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionViewControllingDelegate);
  objc_storeStrong(&self->_touchDeliveryPolicyAssertion, 0);
}

@end