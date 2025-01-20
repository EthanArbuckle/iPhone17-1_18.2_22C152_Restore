@interface CRKCardSectionViewController
+ (id)cardSectionClasses;
+ (id)cardSectionViewControllerForCardSection:(id)a3;
+ (id)cardSectionViewControllerForViewConfiguration:(id)a3;
+ (void)registerCardSectionViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_checkIfCardSectionIsNull:(id)a3;
- (BOOL)_expectsSearchUIView;
- (BOOL)_hasCorrespondingSearchUIView;
- (BOOL)_isIndicatingActivity;
- (BOOL)_isLoadedWithIntentsUIView;
- (BOOL)_shouldHideButtonOverlay;
- (BOOL)_shouldRenderButtonOverlay;
- (BOOL)isLoading;
- (BOOL)performCommand:(id)a3 forViewController:(id)a4;
- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4;
- (CRCardSection)cardSection;
- (CRKCardSectionViewConfiguration)viewConfiguration;
- (CRKCardSectionViewControllerDelegate)delegate;
- (INUIRemoteViewController)_remoteViewController;
- (NSArray)_extraCommands;
- (id)_backingCardSection;
- (id)_commands;
- (id)_destinationPunchout;
- (id)_generateCardSectionViewAppearanceFeedback;
- (id)_initWithCardSection:(id)a3;
- (id)_preferredPunchoutCommand;
- (void)_buttonOverlayTouchWasCanceled:(id)a3;
- (void)_buttonOverlayWasTouchedDown:(id)a3;
- (void)_buttonOverlayWasTouchedUpInside:(id)a3;
- (void)_buttonOverlayWasTouchedUpOutside:(id)a3;
- (void)_cardSectionTapped;
- (void)_finishLoadingViewIfNecessary;
- (void)_loadCardSectionView;
- (void)_performAllCommands;
- (void)_performCommand:(id)a3;
- (void)_setExtraCommands:(id)a3;
- (void)_setViewExternally:(id)a3;
- (void)_setupCardSectionButtons;
- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5;
- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4;
- (void)cardSectionViewDidInvalidateSize:(id)a3;
- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4;
- (void)cardSectionViewDidInvalidateSizeForCardSection:(id)a3;
- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3;
- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4;
- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4;
- (void)commandWasPerformed:(id)a3;
- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5;
- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5;
- (void)didEngageCardSection:(id)a3;
- (void)didPerformCommand:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setViewConfiguration:(id)a3;
- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissViewController:(id)a3;
@end

@implementation CRKCardSectionViewController

+ (id)cardSectionViewControllerForCardSection:(id)a3
{
  return +[_CRKCardSectionViewControllerFactory cardSectionViewControllerForCardSection:a3];
}

+ (id)cardSectionClasses
{
  return 0;
}

+ (void)registerCardSectionViewController
{
  uint64_t v2 = objc_opt_class();

  +[_CRKCardSectionViewControllerFactory registerCardSectionViewControllerClass:v2];
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  p_viewConfiguration = &self->_viewConfiguration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  v11 = [WeakRetained cardSectionViewController];
  if (([v11 isEqual:self] & 1) == 0)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_viewConfiguration);
    v13 = [v12 cardSectionViewController];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_viewConfiguration);
    v11 = [WeakRetained cardSectionViewController];
    [v11 cardEventDidOccur:a3 withIdentifier:v15 userInfo:v8];
  }

LABEL_5:
}

+ (id)cardSectionViewControllerForViewConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [v3 cardSection];
  v5 = +[_CRKCardSectionViewControllerFactory cardSectionViewControllerForCardSection:v4];

  [v5 setViewConfiguration:v3];
  v6 = [v3 feedbackDelegateProxy];
  [v6 setFeedbackDelegate:v5];

  v7 = [v3 cardSectionViewController];

  [v7 setCardSectionViewControllingDelegate:v5];

  return v5;
}

- (id)_initWithCardSection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKCardSectionViewController;
  v6 = [(CRKCardSectionViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    [(CRKCardSectionViewController *)v6 setViewRespectsSystemMinimumLayoutMargins:0];
    objc_storeStrong((id *)&v7->_cardSection, a3);
    v7->_childVCDesiresInteractivity = 0;
    id v8 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_224F73000, v8, OS_LOG_TYPE_INFO, "Card section view controller initialized\n    CSVC: %@\n    Card section: %@", buf, 0x16u);
    }
  }

  return v7;
}

- (void)_setExtraCommands:(id)a3
{
  id v5 = (NSArray *)a3;
  p_extraCommands = &self->_extraCommands;
  if (self->_extraCommands != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_extraCommands, a3);
    p_extraCommands = (NSArray **)[(CRKOverlayButton *)self->_overlayButton setHidden:[(CRKCardSectionViewController *)self _shouldHideButtonOverlay]];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_extraCommands, v5);
}

- (void)_performCommand:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRKCardSectionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(CRKCardSectionViewController *)self delegate];
    int v7 = [v6 canPerformCommand:v4 forCardSectionViewController:self];

    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = [(CRKCardSectionViewController *)self delegate];
  char v9 = [v8 performCommand:v4 forCardSectionViewController:self];

  if ((v9 & 1) == 0)
  {
    objc_super v10 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_224F73000, v10, OS_LOG_TYPE_INFO, "Unable to perform %@ command", (uint8_t *)&v11, 0xCu);
    }
  }
LABEL_8:
}

- (BOOL)_hasCorrespondingSearchUIView
{
  p_viewConfiguration = &self->_viewConfiguration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  id v4 = [WeakRetained _providerIdentifier];
  if ([v4 isEqualToString:@"com.apple.cards.SearchUICardKitProvider"])
  {
    id v5 = objc_loadWeakRetained((id *)p_viewConfiguration);
    v6 = [v5 cardSectionView];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_expectsSearchUIView
{
  id v3 = [(CRKCardSectionViewController *)self cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = 0;
  }
  else {
    char v4 = [(CRKCardSectionViewController *)self isMemberOfClass:objc_opt_class()];
  }

  return v4;
}

- (BOOL)_isLoadedWithIntentsUIView
{
  p_viewConfiguration = &self->_viewConfiguration;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  char v4 = [WeakRetained _providerIdentifier];
  if ([v4 isEqualToString:@"com.apple.cards.IntentsUICardKitProvider"])
  {
    id v5 = objc_loadWeakRetained((id *)p_viewConfiguration);
    v6 = [v5 cardSectionView];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_performAllCommands
{
  v21[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CRKCardSectionViewController *)self _preferredPunchoutCommand];
  uint64_t v15 = (void *)v3;
  if (v3)
  {
    v21[0] = v3;
    char v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  }
  else
  {
    char v4 = [(CRKCardSectionViewController *)self _commands];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v11 = [(CRKCardSectionViewController *)self delegate];
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

LABEL_13:
          id v14 = [(CRKCardSectionViewController *)self delegate];
          [v14 performCommand:v10 forCardSectionViewController:self];

          continue;
        }
        id v12 = [(CRKCardSectionViewController *)self delegate];
        int v13 = [v12 canPerformCommand:v10 forCardSectionViewController:self];

        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (void)_loadCardSectionView
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  char v4 = [a1 cardSection];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_224F73000, v3, OS_LOG_TYPE_ERROR, "No card section view is available for %@ (card section %@)", (uint8_t *)&v5, 0x16u);
}

void __52__CRKCardSectionViewController__loadCardSectionView__block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CRKCardSectionViewController__loadCardSectionView__block_invoke_2;
  block[3] = &unk_26470ED48;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v6);
}

void __52__CRKCardSectionViewController__loadCardSectionView__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_224F73000, v3, OS_LOG_TYPE_INFO, "Setting interceptsTouches to NO for %@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setInterceptsTouches:0];
    WeakRetained[984] = 1;
    id v5 = (void *)*((void *)WeakRetained + 122);
    if (v5)
    {
      [v5 removeFromSuperview];
      id v6 = (void *)*((void *)WeakRetained + 122);
      *((void *)WeakRetained + 122) = 0;
    }
  }
}

- (void)_finishLoadingViewIfNecessary
{
  if ([(CRKCardSectionViewController *)self isLoading])
  {
    [(CRKCardSectionViewController *)self setLoading:0];
    uint64_t v3 = [(CRKCardSectionViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(CRKCardSectionViewController *)self delegate];
      [v5 cardSectionViewControllerDidFinishLoading:self];
    }
  }
}

- (BOOL)_shouldRenderButtonOverlay
{
  int v3 = [(CRKCardSectionViewController *)self isMemberOfClass:objc_opt_class()];
  if (v3) {
    LOBYTE(v3) = !self->_childVCDesiresInteractivity;
  }
  return v3;
}

- (id)_commands
{
  int v3 = [(CRKCardSectionViewController *)self cardSection];
  char v4 = [v3 actionCommands];

  id v5 = [(CRKCardSectionViewController *)self _extraCommands];

  if (v5)
  {
    id v6 = [(CRKCardSectionViewController *)self _extraCommands];
    id v7 = [v4 arrayByAddingObjectsFromArray:v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (id)_destinationPunchout
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = [(CRKCardSectionViewController *)self _preferredPunchoutCommand];
  char v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "crk_backingPunchout");
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(CRKCardSectionViewController *)self _commands];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = objc_msgSend(v11, "crk_backingPunchout");
            if (v12)
            {
              id v5 = (void *)v12;
              goto LABEL_14;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    id v5 = 0;
LABEL_14:
  }

  return v5;
}

- (id)_preferredPunchoutCommand
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (id v6 = objc_loadWeakRetained((id *)p_delegate),
        uint64_t v7 = [v6 preferredPunchoutIndexForCardSectionViewController:self],
        v6,
        v7 < 0))
  {
    id v15 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(CRKCardSectionViewController *)self _commands];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v11 == v7)
            {
              id v15 = v14;
              goto LABEL_16;
            }
            ++v11;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_16:
  }

  return v15;
}

- (void)_cardSectionTapped
{
  int v3 = [(CRKCardSectionViewController *)self cardSection];
  id v7 = [v3 backingCardSection];

  if (v7)
  {
    id v4 = objc_alloc(MEMORY[0x263F677E0]);
    char v5 = [(CRKCardSectionViewController *)self _destinationPunchout];
    id v6 = (void *)[v4 initWithCardSection:v7 destination:v5 triggerEvent:2 actionCardType:1];
    [(CRKCardSectionViewController *)self didEngageCardSection:v6];
  }
}

- (void)_buttonOverlayWasTouchedUpInside:(id)a3
{
  id v4 = a3;
  char v5 = [(CRKCardSectionViewController *)self cardSection];
  id v6 = [v5 backingCardSection];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F677E0]);
    uint64_t v8 = [(CRKCardSectionViewController *)self _destinationPunchout];
    uint64_t v9 = (void *)[v7 initWithCardSection:v6 destination:v8 triggerEvent:2 actionCardType:1];
    [(CRKCardSectionViewController *)self didEngageCardSection:v9];
  }
  else
  {
    [(CRKCardSectionViewController *)self _performAllCommands];
  }
  dispatch_time_t v10 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CRKCardSectionViewController__buttonOverlayWasTouchedUpInside___block_invoke;
  block[3] = &unk_26470E988;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
}

uint64_t __65__CRKCardSectionViewController__buttonOverlayWasTouchedUpInside___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:0 animated:1];
}

- (void)_buttonOverlayWasTouchedUpOutside:(id)a3
{
}

- (void)_buttonOverlayWasTouchedDown:(id)a3
{
}

- (void)_buttonOverlayTouchWasCanceled:(id)a3
{
}

- (BOOL)_isIndicatingActivity
{
  return 0;
}

- (BOOL)_shouldHideButtonOverlay
{
  int v3 = [(CRKCardSectionViewController *)self cardSection];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(CRKCardSectionViewController *)self cardSection];
    char v5 = [v4 actionCommands];
    uint64_t v6 = [v5 count];

    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  uint64_t v8 = [(CRKCardSectionViewController *)self _extraCommands];
  uint64_t v9 = [v8 count];

  return !v9 && v7;
}

- (id)_backingCardSection
{
  if (objc_opt_respondsToSelector())
  {
    int v3 = [(CRCardSection *)self->_cardSection backingCardSection];
  }
  else
  {
    int v3 = 0;
  }
  if ([(CRKCardSectionViewController *)self _checkIfCardSectionIsNull:v3]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_checkIfCardSectionIsNull:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v4 = 1;
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x263F67B28]) initWithFacade:v3];
      BOOL v4 = [v5 type] == 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_generateCardSectionViewAppearanceFeedback
{
  id v3 = objc_alloc_init(MEMORY[0x263F31650]);
  BOOL v4 = [(CRKCardSectionViewController *)self cardSection];
  [v3 setCardSection:v4];

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CRKCardSectionViewController;
  [(CRKCardSectionViewController *)&v3 viewDidLoad];
  [(CRKCardSectionViewController *)self _setupCardSectionButtons];
}

- (void)_setViewExternally:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D866B80])
  {
    [(CRKCardSectionViewController *)self setView:v4];
    [(CRKCardSectionViewController *)self _setupCardSectionButtons];
  }
}

- (void)_setupCardSectionButtons
{
  if ([(CRKCardSectionViewController *)self isViewLoaded])
  {
    if ([(CRKCardSectionViewController *)self _shouldRenderButtonOverlay])
    {
      objc_super v3 = objc_alloc_init(CRKOverlayButton);
      overlayButton = self->_overlayButton;
      self->_overlayButton = v3;

      id v5 = self->_overlayButton;
      uint64_t v6 = [(CRKCardSectionViewController *)self view];
      [v6 bounds];
      -[CRKOverlayButton setFrame:](v5, "setFrame:");

      [(CRKOverlayButton *)self->_overlayButton addTarget:self action:sel__buttonOverlayWasTouchedUpInside_ forControlEvents:64];
      [(CRKOverlayButton *)self->_overlayButton addTarget:self action:sel__buttonOverlayWasTouchedUpOutside_ forControlEvents:128];
      [(CRKOverlayButton *)self->_overlayButton addTarget:self action:sel__buttonOverlayWasTouchedDown_ forControlEvents:1];
      [(CRKOverlayButton *)self->_overlayButton addTarget:self action:sel__buttonOverlayTouchWasCanceled_ forControlEvents:256];
      [(CRKOverlayButton *)self->_overlayButton setHidden:[(CRKCardSectionViewController *)self _shouldHideButtonOverlay]];
      uint64_t v8 = [(CRKCardSectionViewController *)self view];
      [(CRKOverlayButton *)v8 addSubview:self->_overlayButton];
      BOOL v7 = v8;
    }
    else
    {
      [(CRKOverlayButton *)self->_overlayButton removeFromSuperview];
      BOOL v7 = self->_overlayButton;
      self->_overlayButton = 0;
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)CRKCardSectionViewController;
  [(CRKCardSectionViewController *)&v22 viewDidLayoutSubviews];
  objc_super v3 = [(CRKCardSectionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(CRKOverlayButton *)self->_overlayButton frame];
  v25.origin.x = v12;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  if (!CGRectEqualToRect(v23, v25)) {
    -[CRKOverlayButton setFrame:](self->_overlayButton, "setFrame:", v5, v7, v9, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);
  long long v17 = [WeakRetained _debugOverlayView];

  if (v17)
  {
    [v17 frame];
    v26.origin.x = v18;
    v26.origin.y = v19;
    v26.size.width = v20;
    v26.size.height = v21;
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    if (!CGRectEqualToRect(v24, v26)) {
      objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKCardSectionViewController;
  [(CRKCardSectionViewController *)&v9 viewWillAppear:a3];
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CRKCardSectionViewController *)self delegate];
    double v7 = [(CRKCardSectionViewController *)self cardSection];
    double v8 = [(CRKCardSectionViewController *)self _generateCardSectionViewAppearanceFeedback];
    [v6 cardSectionViewWillAppearForCardSection:v7 withAppearanceFeedback:v8];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKCardSectionViewController;
  [(CRKCardSectionViewController *)&v9 viewDidAppear:a3];
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CRKCardSectionViewController *)self delegate];
    double v7 = [(CRKCardSectionViewController *)self cardSection];
    double v8 = [(CRKCardSectionViewController *)self _generateCardSectionViewAppearanceFeedback];
    [v6 cardSectionViewDidAppearForCardSection:v7 withAppearanceFeedback:v8];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CRKCardSectionViewController;
  [(CRKCardSectionViewController *)&v10 viewDidDisappear:a3];
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F31658]);
    double v7 = [(CRKCardSectionViewController *)self cardSection];
    [v6 setCardSection:v7];

    double v8 = [(CRKCardSectionViewController *)self delegate];
    objc_super v9 = [(CRKCardSectionViewController *)self cardSection];
    [v8 cardSectionViewDidDisappearForCardSection:v9 withDisappearanceFeedback:v6];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didEngageCardSection:(id)a3
{
  id v16 = a3;
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKCardSectionViewController *)self delegate];
    double v7 = (void *)MEMORY[0x263F316B0];
    double v8 = [v16 cardSection];
    objc_super v9 = [v7 cardSectionWithSFCardSection:v8];
    [v6 cardSectionView:v9 willProcessEngagementFeedback:v16];
  }
  [(CRKCardSectionViewController *)self _performAllCommands];
  objc_super v10 = [(CRKCardSectionViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    CGFloat v12 = [(CRKCardSectionViewController *)self delegate];
    CGFloat v13 = (void *)MEMORY[0x263F316B0];
    CGFloat v14 = [v16 cardSection];
    CGFloat v15 = [v13 cardSectionWithSFCardSection:v14];
    [v12 userDidEngageCardSection:v15 withEngagementFeedback:v16];
  }
}

- (void)didPerformCommand:(id)a3
{
  id v7 = a3;
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKCardSectionViewController *)self delegate];
    [v6 commandWasPerformed:v7];
  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  char v5 = [(CRKCardSectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKCardSectionViewController *)self delegate];
    [v7 cardSectionViewControllerBoundsDidChange:self];
  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3
{
}

- (void)presentViewController:(id)a3
{
  id v7 = a3;
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKCardSectionViewController *)self delegate];
    [v6 presentViewController:v7 forCardSectionViewController:self];
  }
}

- (void)willDismissViewController:(id)a3
{
  id v7 = a3;
  double v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKCardSectionViewController *)self delegate];
    [v6 cardSectionViewController:self willDismissViewController:v7];
  }
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  char v5 = [(CRKCardSectionViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKCardSectionViewController *)self delegate];
    [v7 cardSectionViewController:self didSelectPreferredPunchoutIndex:a3];
  }
}

- (BOOL)performCommand:(id)a3 forViewController:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [(CRKCardSectionViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(CRKCardSectionViewController *)self delegate];
    int v8 = [v7 canPerformCommand:v5 forCardSectionViewController:self];

    if (!v8)
    {
      objc_super v9 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        id v16 = v5;
LABEL_11:
        _os_log_impl(&dword_224F73000, v9, OS_LOG_TYPE_INFO, "Unable to perform %@ command", (uint8_t *)&v15, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  objc_super v10 = [(CRKCardSectionViewController *)self delegate];
  int v11 = [v10 performCommand:v5 forCardSectionViewController:self];

  objc_super v9 = *MEMORY[0x263F31630];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v12)
    {
      int v15 = 138412290;
      id v16 = v5;
      goto LABEL_11;
    }
LABEL_12:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    int v15 = 138412290;
    id v16 = v5;
    BOOL v13 = 1;
    _os_log_impl(&dword_224F73000, v9, OS_LOG_TYPE_INFO, "Performed %@ command", (uint8_t *)&v15, 0xCu);
  }
  else
  {
    BOOL v13 = 1;
  }
LABEL_14:

  return v13;
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 backingFeedback];
    [(CRKCardSectionViewController *)self didEngageCardSection:v5];
  }
  else
  {
    [(CRKCardSectionViewController *)self _performAllCommands];
  }
}

- (void)commandWasPerformed:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 backingFeedback];
    [(CRKCardSectionViewController *)self didPerformCommand:v5];
  }
  else
  {
    id v6 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[CRKCardSectionViewController commandWasPerformed:](v6);
    }
  }
}

- (BOOL)shouldHandleEngagement:(id)a3 forCardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CRKCardSectionViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    objc_super v10 = [(CRKCardSectionViewController *)self delegate];
    char v11 = [v10 shouldHandleEngagement:v6 forCardSection:v7];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardViewWillAppearForCard:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardViewDidAppearForCard:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardViewDidDisappearForCard:v10 withDisappearanceFeedback:v6];
  }
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardSectionViewWillAppearForCardSection:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardSectionViewDidAppearForCardSection:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardSectionViewDidDisappearForCardSection:v10 withDisappearanceFeedback:v6];
  }
}

- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CRKCardSectionViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    BOOL v12 = [(CRKCardSectionViewController *)self delegate];
    [v12 controllerForCard:v13 didRequestAsyncCard:v8 withAsyncCardRequestFeedback:v9];
  }
}

- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CRKCardSectionViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    BOOL v12 = [(CRKCardSectionViewController *)self delegate];
    [v12 controllerForCard:v13 didReceiveAsyncCard:v8 withAsyncCardReceiptFeedback:v9];
  }
}

- (void)cardSectionViewDidInvalidateSizeForCardSection:(id)a3
{
  id v10 = a3;
  id v4 = [(CRKCardSectionViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKCardSectionViewController *)self delegate];
    [v6 cardSectionViewDidInvalidateSizeForCardSection:v10];
  }
  id v7 = [(CRKCardSectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CRKCardSectionViewController *)self delegate];
    [v9 cardSectionViewControllerBoundsDidChange:self];
  }
}

- (CRKCardSectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKCardSectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (NSArray)_extraCommands
{
  return self->_extraCommands;
}

- (INUIRemoteViewController)_remoteViewController
{
  return self->__remoteViewController;
}

- (CRKCardSectionViewConfiguration)viewConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewConfiguration);

  return (CRKCardSectionViewConfiguration *)WeakRetained;
}

- (void)setViewConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewConfiguration);
  objc_storeStrong((id *)&self->__remoteViewController, 0);
  objc_storeStrong((id *)&self->_extraCommands, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_overlayButton, 0);
}

- (void)commandWasPerformed:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224F73000, log, OS_LOG_TYPE_ERROR, "SFCommandEngagementFeedback is missing", v1, 2u);
}

@end