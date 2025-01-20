@interface CRKCardViewController
+ (void)_registerCardSectionViewControllers;
+ (void)initialize;
- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_fireAndForgetOutboundCommand:(id)a3;
- (BOOL)_isActuallyVisible;
- (BOOL)isIndicatingActivity;
- (BOOL)isLoading;
- (BOOL)loadBundles;
- (CGSize)boundingSizeForCardSectionViewController:(id)a3;
- (CGSize)preferredContentSize;
- (CRCard)card;
- (CRKCardSectionViewSourcing)cardSectionViewSource;
- (CRKCardViewController)init;
- (CRKCardViewController)initWithCard:(id)a3 delegate:(id)a4;
- (CRKCardViewController)initWithCoder:(id)a3;
- (CRKCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CRKCardViewControllerDelegate)cardViewControllerDelegate;
- (double)contentHeightForWidth:(double)a3;
- (id)_cardSectionViewControllerForCardSection:(id)a3;
- (id)_generateCardViewAppearanceFeedback;
- (id)_initWithCard:(id)a3;
- (id)_initWithCard:(id)a3 delegate:(id)a4 loadBundles:(BOOL)a5 loadProvidersImmediately:(BOOL)a6;
- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5;
- (id)_loadCardSectionViewControllerFromCardSection:(id)a3;
- (int64_t)_convertSFSeparatorStyleToCRKKeylineStyle:(int)a3;
- (int64_t)_defaultKeylineStyleBetweenLeadingCardSection:(id)a3 andTrailingCardSection:(id)a4;
- (int64_t)_keylineStyleBetweenLeadingCardSectionViewController:(id)a3 andTrailingCardSectionViewController:(id)a4;
- (int64_t)preferredPunchoutIndex;
- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3;
- (void)_addCardSectionViewControllersAsChildViewControllers:(id)a3;
- (void)_cancelTouchesIfNecessary;
- (void)_configureCardSectionViewController:(id)a3 forCardSection:(id)a4;
- (void)_finishLoading;
- (void)_loadCardSectionViewControllersFromCard:(id)a3 currentSourceInvalid:(BOOL)a4;
- (void)_removeCardSectionViewControllersFromParentViewController:(id)a3;
- (void)_resumeTouchesIfNecessary;
- (void)_setCard:(id)a3 loadProvidersImmediately:(BOOL)a4;
- (void)_setCardWithLoadedBundles:(id)a3 loadProvidersImmediately:(BOOL)a4;
- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5;
- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4;
- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4;
- (void)cardSectionViewController:(id)a3 requestsHandlingOfIntent:(id)a4;
- (void)cardSectionViewControllerBoundsDidChange:(id)a3;
- (void)cardSectionViewControllerDidFinishLoading:(id)a3;
- (void)cardSectionViewControllerShouldBeRemoved:(id)a3;
- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4;
- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3;
- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4;
- (void)didEngageCardSection:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)handleCardCommand:(id)a3 reply:(id)a4;
- (void)loadView;
- (void)presentViewController:(id)a3;
- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4;
- (void)setCard:(id)a3;
- (void)setCardSectionViewSource:(id)a3;
- (void)setCardViewControllerDelegate:(id)a3;
- (void)setLoadBundles:(BOOL)a3;
- (void)setPreferredPunchoutIndex:(int64_t)a3;
- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4;
- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissViewController:(id)a3;
@end

@implementation CRKCardViewController

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CRKCardViewController;
  objc_msgSendSuper2(&v3, sel_initialize);
  [a1 _registerCardSectionViewControllers];
  CRLogInitIfNeeded();
}

- (CRKCardViewController)initWithCard:(id)a3 delegate:(id)a4
{
  return (CRKCardViewController *)[(CRKCardViewController *)self _initWithCard:a3 delegate:a4 loadBundles:1 loadProvidersImmediately:1];
}

- (void)cardEventDidOccur:(unint64_t)a3 withIdentifier:(id)a4 userInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = self->_cardSectionViewControllers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v15, "cardEventDidOccur:withIdentifier:userInfo:", a3, v8, v9, (void)v16);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BOOL)isLoading
{
  return [(NSMutableArray *)self->_loadingCardSections count] != 0;
}

- (void)setCard:(id)a3
{
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5
{
  return [(CRKCardViewController *)self _initWithCard:a3 delegate:a4 loadBundles:0 loadProvidersImmediately:a5];
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadBundles:(BOOL)a5 loadProvidersImmediately:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRKCardViewController;
  uint64_t v12 = [(CRKCardViewController *)&v20 initWithNibName:0 bundle:0];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_preferredPunchoutIndex = -1;
    objc_storeWeak((id *)&v12->_cardViewControllerDelegate, v11);
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingDismissalCommands = v13->_pendingDismissalCommands;
    v13->_pendingDismissalCommands = v14;

    v13->_loadBundles = a5;
    [(CRKCardViewController *)v13 _setCard:v10 loadProvidersImmediately:v6];
    long long v16 = (void *)*MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      long long v17 = v16;
      long long v18 = [v10 cardSections];
      *(_DWORD *)buf = 138412802;
      v22 = v13;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_224F73000, v17, OS_LOG_TYPE_INFO, "Card view controller initialized\n    CVC: %@\n    Card: %@\n    Card sections: %@", buf, 0x20u);
    }
  }

  return v13;
}

+ (void)_registerCardSectionViewControllers
{
}

- (id)_initWithCard:(id)a3
{
  return [(CRKCardViewController *)self initWithCard:a3 delegate:0];
}

- (id)_loadCardSectionViewControllerFromCardSection:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(CRKCardSectionViewSourcing *)self->_cardSectionViewSource cardSectionShouldBeDisplayed:v4])
  {
    v5 = [(CRKCardSectionViewSourcing *)self->_cardSectionViewSource viewConfigurationForCardSection:v4];
    if (v5) {
      +[CRKCardSectionViewController cardSectionViewControllerForViewConfiguration:v5];
    }
    else {
    id v8 = +[CRKCardSectionViewController cardSectionViewControllerForCardSection:v4];
    }
    [(CRKCardViewController *)self _configureCardSectionViewController:v8 forCardSection:v4];
  }
  else
  {
    BOOL v6 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      cardSectionViewSource = self->_cardSectionViewSource;
      int v10 = 138412802;
      id v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = cardSectionViewSource;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_224F73000, v6, OS_LOG_TYPE_INFO, "%@ not returning card section view controller because provider manager %@ marked card section %@ ineligble for display", (uint8_t *)&v10, 0x20u);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)_cancelTouchesIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_cardSectionViewControllers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_cancelTouchesIfNecessary", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_resumeTouchesIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_cardSectionViewControllers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_resumeTouchesIfNecessary", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  return [(NSMapTable *)self->_cardSectionsToCardSectionViewControllersMapTable objectForKey:a3];
}

- (int64_t)_keylineStyleBetweenLeadingCardSectionViewController:(id)a3 andTrailingCardSectionViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 cardSection];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0
    && ([v6 cardSection],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        [v10 backingCardSection],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 separatorStyle],
        v11,
        v10,
        v12))
  {
    int64_t v13 = [(CRKCardViewController *)self _convertSFSeparatorStyleToCRKKeylineStyle:v12];
  }
  else
  {
    int64_t v13 = [(CRKCardViewController *)self _defaultKeylineStyleBetweenLeadingCardSection:v6 andTrailingCardSection:v7];
  }
  int64_t v14 = v13;

  return v14;
}

- (int64_t)_defaultKeylineStyleBetweenLeadingCardSection:(id)a3 andTrailingCardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 cardSection];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    long long v10 = [v6 cardSection];
    id v11 = [v10 backingCardSection];
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = [v7 cardSection];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    int64_t v14 = [v7 cardSection];
    id v15 = [v14 backingCardSection];
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = [v6 cardSection];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    long long v18 = [v6 cardSection];
    long long v19 = [v18 actionCommands];
  }
  else
  {
    long long v19 = 0;
  }
  objc_super v20 = [v7 cardSection];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    v22 = [v7 cardSection];
    __int16 v23 = [v22 actionCommands];
  }
  else
  {
    __int16 v23 = 0;
  }
  if ([v19 count] || objc_msgSend(v23, "count"))
  {
    int64_t v24 = 1;
    goto LABEL_16;
  }
  if (objc_msgSend(v11, "_crk_leadingCardSectionSeparatorStyle"))
  {
    v26 = v11;
LABEL_21:
    int64_t v24 = -[CRKCardViewController _convertSFSeparatorStyleToCRKKeylineStyle:](self, "_convertSFSeparatorStyleToCRKKeylineStyle:", objc_msgSend(v26, "_crk_leadingCardSectionSeparatorStyle"));
    goto LABEL_16;
  }
  if (objc_msgSend(v15, "_crk_leadingCardSectionSeparatorStyle"))
  {
    v26 = v15;
    goto LABEL_21;
  }
  if (v11) {
    int64_t v24 = 3;
  }
  else {
    int64_t v24 = 4;
  }
LABEL_16:

  return v24;
}

- (int64_t)_convertSFSeparatorStyleToCRKKeylineStyle:(int)a3
{
  uint64_t v3 = (a3 - 2);
  if (v3 < 4) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)_removeCardSectionViewControllersFromParentViewController:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v8 didMoveToParentViewController:0];
        char v9 = [v8 view];
        [v9 removeFromComposedSuperview];

        [v8 removeFromParentViewController];
        [v8 setView:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_addCardSectionViewControllersAsChildViewControllers:(id)a3
{
  id v12 = a3;
  unint64_t v4 = [v12 count];
  if ([(CRKCardViewController *)self isViewLoaded] && v4)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v12 objectAtIndex:v5];
      id v7 = [v6 parentViewController];

      if (v7)
      {
        ++v5;
      }
      else
      {
        [(CRKCardViewController *)self addChildViewController:v6];
        if (v4 <= ++v5)
        {
          long long v8 = 0;
        }
        else
        {
          long long v8 = [v12 objectAtIndex:v5];
        }
        int64_t v9 = [(CRKCardViewController *)self _keylineStyleBetweenLeadingCardSectionViewController:v6 andTrailingCardSectionViewController:v8];
        long long v10 = [(CRKCardViewController *)self view];
        long long v11 = [v6 view];
        [v10 addCardSectionSubview:v11 withKeyline:v9];

        [v6 didMoveToParentViewController:self];
      }
    }
    while (v5 != v4);
    if (![(CRKCardViewController *)self isLoading]) {
      [(CRKCardViewController *)self _finishLoading];
    }
  }
}

- (BOOL)_askDelegateToPerformReferentialCommand:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) != 0
    && ([(CRKCardViewController *)self cardViewControllerDelegate],
        id v3 = objc_claimAutoreleasedReturnValue(),
        ![v3 canPerformReferentialCommand:v5 forCardViewController:self]))
  {
    char v9 = 0;
  }
  else
  {
    long long v8 = [(CRKCardViewController *)self cardViewControllerDelegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      goto LABEL_7;
    }
  }

LABEL_7:
  char v10 = 0;
  if (v5 && (v9 & 1) != 0)
  {
    long long v11 = [(CRKCardViewController *)self cardViewControllerDelegate];
    char v10 = [v11 performReferentialCommand:v5 forCardViewController:self];
  }
  return v10;
}

- (void)_configureCardSectionViewController:(id)a3 forCardSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [v6 setDelegate:self];
    [(NSMutableArray *)self->_cardSectionViewControllers addObject:v6];
    if (v7) {
      [(NSMapTable *)self->_cardSectionsToCardSectionViewControllersMapTable setObject:v6 forKey:v7];
    }
    long long v8 = [(CRKCardViewController *)self card];
    char v9 = [v8 dismissalCommands];
    char v10 = (void *)[v9 mutableCopy];
    [v6 _setExtraCommands:v10];

    if ([v6 _isIndicatingActivity]) {
      self->_indicatingActivity = 1;
    }
  }
  else
  {
    long long v11 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[CRKCardViewController _configureCardSectionViewController:forCardSection:]((uint64_t)v7, v11);
    }
  }
}

- (void)_finishLoading
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ([(CRKCardViewController *)self isViewLoaded]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(CRCard *)v2->_card flexibleSectionOrder])
  {
    id v3 = [(CRKCardViewController *)v2 view];
    uint64_t v27 = [v3 cardSectionSubviews];

    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v28 = v2;
    id v5 = v2->_cardSectionViewControllers;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (!v6) {
      goto LABEL_17;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    char v9 = (os_log_t *)MEMORY[0x263F31630];
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v32 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "view", v27);
        long long v13 = [v12 cardSectionViewIdentifier];

        if (v13)
        {
          int64_t v14 = [v11 view];
          uint64_t v15 = [v14 cardSectionViewIdentifier];
          [v4 setObject:v11 forKey:v15];
LABEL_11:

          goto LABEL_13;
        }
        os_log_t v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          int64_t v14 = v16;
          uint64_t v15 = [v11 cardSection];
          char v17 = [v11 view];
          *(_DWORD *)buf = 138412802;
          v37 = v11;
          __int16 v38 = 2112;
          v39 = v15;
          __int16 v40 = 2112;
          v41 = v17;
          _os_log_error_impl(&dword_224F73000, v14, OS_LOG_TYPE_ERROR, "Card section view controller's view doesn't have a card section view identifier\n    Card section view controller: %@\n    Card section: %@\n    Card section view: %@", buf, 0x20u);

          goto LABEL_11;
        }
LABEL_13:
        ++v10;
      }
      while (v7 != v10);
      uint64_t v18 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v42 count:16];
      uint64_t v7 = v18;
      if (!v18)
      {
LABEL_17:

        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __39__CRKCardViewController__finishLoading__block_invoke;
        v29[3] = &unk_26470EDC0;
        id v30 = v4;
        id v31 = v27;
        id v19 = v27;
        id v20 = v4;
        char v21 = [v19 sortedArrayUsingComparator:v29];
        v2 = v28;
        v22 = [(CRKCardViewController *)v28 view];
        [v22 setCardSectionSubviews:v21];

        __int16 v23 = [(CRKCardViewController *)v28 view];
        [v23 setNeedsLayout];

        break;
      }
    }
  }
  int64_t v24 = [(CRKCardViewController *)v2 cardViewControllerDelegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_cardViewControllerDelegate);
    [WeakRetained cardViewControllerDidLoad:v2];
  }
  v2->_loaded = 1;
}

uint64_t __39__CRKCardViewController__finishLoading__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v7 cardSectionViewIdentifier];
  char v9 = [v5 objectForKey:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  long long v11 = [v6 cardSectionViewIdentifier];
  id v12 = [v10 objectForKey:v11];

  int v13 = [v9 _isLoadedWithIntentsUIView];
  int v14 = [v12 _isLoadedWithIntentsUIView];
  uint64_t v15 = [*(id *)(a1 + 40) indexOfObject:v7];

  uint64_t v16 = [*(id *)(a1 + 40) indexOfObject:v6];
  char v17 = [NSNumber numberWithUnsignedInteger:v15];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v16];
  uint64_t v19 = [v17 compare:v18];

  if (v14) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v14) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = -1;
  }
  if (v13) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = v20;
  }

  return v22;
}

- (BOOL)_isActuallyVisible
{
  id v3 = [(CRKCardViewController *)self view];
  id v4 = [(CRKCardViewController *)self view];
  id v5 = [v4 superview];

  if (v5)
  {
    while (1)
    {
      int v6 = objc_msgSend(v5, "_crk_subviewIsVisible:", v3);
      if (!v6) {
        break;
      }
      id v7 = v5;
      id v5 = [v7 superview];

      id v3 = v7;
      if (!v5)
      {
        id v3 = v7;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (id)_generateCardViewAppearanceFeedback
{
  id v3 = [(CRKCardViewController *)self card];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(CRKCardViewController *)self card];
    id v5 = [v4 backingCard];
  }
  else
  {
    id v5 = 0;
  }

  int v6 = (void *)[objc_alloc(MEMORY[0x263F677F0]) initWithCard:v5];
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    uint64_t v10 = [v9 navigationIndexOfCardViewController:self];
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v6 setLevel:v10];

  return v6;
}

- (void)_setCard:(id)a3 loadProvidersImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (([(CRCard *)self->_card isEqual:v6] & 1) == 0)
  {
    if (self->_loadBundles)
    {
      id v7 = +[_CRKProviderBundleManager sharedInstance];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke;
      v8[3] = &unk_26470EE10;
      v8[4] = self;
      id v9 = v6;
      BOOL v10 = v4;
      [v7 getProviderBundlesWithCompletion:v8];
    }
    else
    {
      [(CRKCardViewController *)self _setCardWithLoadedBundles:v6 loadProvidersImmediately:v4];
    }
  }
}

void __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = a1;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x263F31630];
  if (v5)
  {
    id v7 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_cold_1((uint64_t)v5, v7);
    }
  }
  uint64_t v18 = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        int v14 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v27 = v13;
          _os_log_impl(&dword_224F73000, v14, OS_LOG_TYPE_INFO, "Registering bundle provider with CardKit: %@", buf, 0xCu);
        }
        uint64_t v15 = +[CRKIdentifiedProviderRegistry sharedInstance];
        [v15 registerIdentifiedProvider:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_48;
  block[3] = &unk_26470EDE8;
  uint64_t v16 = *(void **)(v17 + 40);
  block[4] = *(void *)(v17 + 32);
  id v20 = v16;
  char v21 = *(unsigned char *)(v17 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCardWithLoadedBundles:*(void *)(a1 + 40) loadProvidersImmediately:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_setCardWithLoadedBundles:(id)a3 loadProvidersImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v7 asynchronous]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke;
    v8[3] = &unk_26470EE60;
    objc_copyWeak(&v10, &location);
    id v9 = v7;
    [v9 loadCardWithCompletion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_storeStrong((id *)&self->_card, a3);
    if (v4) {
      [(CRKCardViewController *)self _loadCardSectionViewControllersFromCard:v7 currentSourceInvalid:1];
    }
  }
}

void __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke_2;
  block[3] = &unk_26470EE38;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

uint64_t __76__CRKCardViewController__setCardWithLoadedBundles_loadProvidersImmediately___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v16 = WeakRetained;
    id v5 = [WeakRetained cardViewControllerDelegate];
    if (!v4)
    {
      uint64_t v12 = objc_opt_respondsToSelector();

      id v3 = v16;
      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v13 = [v16 cardViewControllerDelegate];
      [v13 cardViewController:v16 didFailToLoadCard:*(void *)(a1 + 40)];

      goto LABEL_12;
    }
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x263F31638]);
      id v8 = [v16 cardViewControllerDelegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = [v16 cardViewControllerDelegate];
        uint64_t v11 = [v10 baseCardForCardViewController:v16];
      }
      else
      {
        uint64_t v11 = 0;
      }
      [v7 setBaseCard:v11];
      [v7 setRequestedCard:*(void *)(a1 + 40)];
      [v7 setReceivedCard:*(void *)(a1 + 32)];
      int v14 = [v16 cardViewControllerDelegate];
      [v14 controllerForCard:*(void *)(a1 + 40) didReceiveAsyncCard:*(void *)(a1 + 32) withAsyncCardReceiptFeedback:v7];
    }
    objc_storeStrong(v16 + 130, *(id *)(a1 + 32));
    id WeakRetained = (id *)[v16 isViewLoaded];
    id v3 = v16;
    if (WeakRetained)
    {
      id WeakRetained = (id *)[v16 _loadCardSectionViewControllersFromCard:*(void *)(a1 + 32) currentSourceInvalid:1];
LABEL_12:
      id v3 = v16;
    }
  }
LABEL_13:

  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)_loadCardSectionViewControllersFromCard:(id)a3 currentSourceInvalid:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_loaded = 0;
  objc_initWeak(location, self);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke;
  v24[3] = &unk_26470EE88;
  objc_copyWeak(&v26, location);
  id v7 = v6;
  id v25 = v7;
  id v8 = (void *)MEMORY[0x22A6282E0](v24);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_3;
  v20[3] = &unk_26470EF00;
  objc_copyWeak(&v23, location);
  id v9 = v8;
  id v22 = v9;
  id v10 = v7;
  id v21 = v10;
  uint64_t v11 = MEMORY[0x22A6282E0](v20);
  uint64_t v12 = (void (**)(void))v11;
  if (v4)
  {
    cardSectionViewSource = self->_cardSectionViewSource;
    self->_cardSectionViewSource = 0;

    int v14 = [(CRKCardViewController *)self cardViewControllerDelegate];
    if (objc_opt_respondsToSelector())
    {
      card = self->_card;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_6;
      v16[3] = &unk_26470EF50;
      objc_copyWeak(&v19, location);
      id v17 = v14;
      uint64_t v18 = v12;
      [v17 cardViewController:self requestCardSectionViewSourceForCard:card reply:v16];

      objc_destroyWeak(&v19);
    }
    else
    {
      v12[2](v12);
    }
  }
  else
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeCardSectionViewControllersFromParentViewController:WeakRetained[122]];
    [(id)v3[122] removeAllObjects];
    BOOL v4 = [*(id *)(a1 + 32) cardSections];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5];
      id v7 = (void *)v3[122];
      v3[122] = v6;

      uint64_t v8 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:5];
      id v9 = (void *)v3[123];
      v3[123] = v8;

      uint64_t v10 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0];
      uint64_t v11 = (void *)v3[124];
      v3[124] = v10;

      *((unsigned char *)v3 + 1032) = 0;
      uint64_t v12 = (void *)MEMORY[0x263EFF980];
      uint64_t v13 = [*(id *)(a1 + 32) cardSections];
      uint64_t v14 = [v12 arrayWithArray:v13];
      uint64_t v15 = (void *)v3[128];
      v3[128] = v14;

      uint64_t v16 = [(id)v3[128] objectAtIndex:0];
      id v17 = [v3 _loadCardSectionViewControllerFromCardSection:v16];

      if (([v17 isLoading] & 1) == 0) {
        [v3 cardSectionViewControllerDidFinishLoading:v17];
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_2;
    block[3] = &unk_26470E988;
    void block[4] = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    v2 = [*(id *)(a1 + 32) view];
    [v2 setNeedsLayout];

    id v3 = [*(id *)(a1 + 32) cardViewControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) cardViewControllerDelegate];
      [v5 cardViewControllerBoundsDidChange:*(void *)(a1 + 32)];
    }
  }
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_3(id *a1)
{
  v2 = a1 + 6;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[132])
    {
      (*((void (**)(void))a1[5] + 2))();
    }
    else
    {
      id v5 = objc_alloc_init(_CRKCardSectionViewLoader);
      objc_storeStrong(v4 + 127, v5);
      objc_storeStrong(v4 + 132, v5);
      uint64_t v6 = [v4 cardViewControllerDelegate];
      NSClassFromString(&cfstr_Siriuilegacyca.isa);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        (*((void (**)(void))a1[5] + 2))();
      }
      else
      {
        uint64_t v8 = objc_alloc_init(_CRKCardSectionViewLoader);
        objc_storeStrong(v4 + 127, v8);
        objc_storeStrong(v4 + 132, v8);
        id v9 = [v4 cardViewControllerDelegate];
        NSClassFromString(&cfstr_Siriuilegacyca.isa);
        char v10 = objc_opt_isKindOfClass();

        if (v10)
        {
          (*((void (**)(void))a1[5] + 2))();
        }
        else
        {
          uint64_t v11 = +[_CRKProviderBundleManager sharedInstance];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_4;
          v12[3] = &unk_26470EED8;
          objc_copyWeak(&v16, v2);
          uint64_t v13 = v8;
          id v14 = a1[4];
          id v15 = a1[5];
          [v11 getProviderBundlesWithCompletion:v12];

          objc_destroyWeak(&v16);
        }
      }
    }
  }
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_5;
  v8[3] = &unk_26470EEB0;
  id v9 = *(id *)(a1 + 48);
  [v6 _loadIdentifiedCardSectionViewProvidersFromCard:v7 identifiedProviders:v4 delegate:WeakRetained completion:v8];
}

uint64_t __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_6(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7;
  block[3] = &unk_26470EF28;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v6;
  id v11 = a1[4];
  id v12 = v5;
  id v13 = a1[5];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (*(void *)(a1 + 32))
  {
    id v4 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7_cold_1(a1, (uint64_t *)(a1 + 32), v4);
    }
  }
  else if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 132, *(id *)(a1 + 48));
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (CRKCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (CRKCardViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc_init(CRKComposedStackView);
  [(CRKCardViewController *)self setView:v3];
  [(CRKCardViewController *)self _addCardSectionViewControllersAsChildViewControllers:self->_cardSectionViewControllers];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v5 didMoveToParentViewController:a3];
  id v4 = [(CRKCardViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v9 viewWillAppear:a3];
  id v4 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKCardViewController *)self cardViewControllerDelegate];
    id v7 = [(CRKCardViewController *)self card];
    id v8 = [(CRKCardViewController *)self _generateCardViewAppearanceFeedback];
    [v6 cardViewWillAppearForCard:v7 withAppearanceFeedback:v8];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v9 viewDidAppear:a3];
  if ([(CRKCardViewController *)self _isActuallyVisible])
  {
    id v4 = [(CRKCardViewController *)self cardViewControllerDelegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CRKCardViewController *)self cardViewControllerDelegate];
      id v7 = [(CRKCardViewController *)self card];
      id v8 = [(CRKCardViewController *)self _generateCardViewAppearanceFeedback];
      [v6 cardViewDidAppearForCard:v7 withAppearanceFeedback:v8];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v13 viewWillDisappear:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = self->_pendingDismissalCommands;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CRKCardViewController _askDelegateToPerformReferentialCommand:](self, "_askDelegateToPerformReferentialCommand:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pendingDismissalCommands removeAllObjects];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CRKCardViewController;
  [(CRKCardViewController *)&v14 viewDidDisappear:a3];
  id v4 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CRKCardViewController *)self navigationController];
    uint64_t v7 = [v6 viewControllers];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__CRKCardViewController_viewDidDisappear___block_invoke;
    v13[3] = &unk_26470EF78;
    v13[4] = self;
    uint64_t v8 = [v7 indexOfObjectPassingTest:v13];
    uint64_t v9 = 3;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      if (v8 == [v7 count] - 2) {
        uint64_t v9 = 5;
      }
      else {
        uint64_t v9 = 4;
      }
    }
    long long v10 = (void *)[objc_alloc(MEMORY[0x263F677F8]) initWithEvent:v9];
    long long v11 = [(CRKCardViewController *)self cardViewControllerDelegate];
    long long v12 = [(CRKCardViewController *)self card];
    [v11 cardViewDidDisappearForCard:v12 withDisappearanceFeedback:v10];
  }
}

BOOL __42__CRKCardViewController_viewDidDisappear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_crk_isDescendantOfViewController:", a2) & 1) == 0) {
    return *a4 != 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGSize)preferredContentSize
{
  id v3 = [(CRKCardViewController *)self view];
  [v3 frame];
  double v5 = v4;
  uint64_t v6 = [(CRKCardViewController *)self view];
  [v6 frame];
  [(CRKCardViewController *)self contentHeightForWidth:v7];
  double v9 = v8;

  double v10 = v5;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CRKCardViewController)init
{
  return 0;
}

- (void)cardSectionViewControllerDidFinishLoading:(id)a3
{
  if ([(NSMutableArray *)self->_loadingCardSections count]) {
    [(NSMutableArray *)self->_loadingCardSections removeObjectAtIndex:0];
  }
  if ([(CRKCardViewController *)self isLoading])
  {
    double v4 = [(NSMutableArray *)self->_loadingCardSections objectAtIndex:0];
    id v5 = [(CRKCardViewController *)self _loadCardSectionViewControllerFromCardSection:v4];

    if (([v5 isLoading] & 1) == 0) {
      [(CRKCardViewController *)self cardSectionViewControllerDidFinishLoading:v5];
    }
  }
  else
  {
    [(CRKCardViewController *)self _addCardSectionViewControllersAsChildViewControllers:self->_cardSectionViewControllers];
    [(CRKCardViewController *)self _finishLoading];
  }
}

- (void)cardSectionViewControllerBoundsDidChange:(id)a3
{
  if (self->_loaded)
  {
    double v4 = [(CRKCardViewController *)self view];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __66__CRKCardViewController_cardSectionViewControllerBoundsDidChange___block_invoke;
    v5[3] = &unk_26470EA00;
    v5[4] = self;
    [v4 triggerLayoutAnimated:0 completion:v5];
  }
}

void __66__CRKCardViewController_cardSectionViewControllerBoundsDidChange___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) cardViewControllerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) cardViewControllerDelegate];
    [v4 cardViewControllerBoundsDidChange:*(void *)(a1 + 32)];
  }
}

- (void)cardSectionViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  id v8 = a4;
  id v5 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v7 cardViewController:self requestsHandlingOfIntent:v8];
  }
}

- (CGSize)boundingSizeForCardSectionViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v7 cardViewController:self boundingSizeForCardSectionViewController:v4];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v9 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)handleCardCommand:(id)a3 reply:(id)a4
{
  id v13 = a3;
  char v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [v13 commandDirection];
  if (v7 && v7 != 2)
  {
    if (v7 != 1) {
      goto LABEL_13;
    }
    if (v6)
    {
      double v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F31628] code:501 userInfo:0];
      v6[2](v6, 0, v8);
    }
  }
  double v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v11 handleCardCommand:v13 reply:v6];
  }
  else
  {
    BOOL v12 = [(CRKCardViewController *)self _fireAndForgetOutboundCommand:v13];
    if (!v6) {
      goto LABEL_13;
    }
    if (v12)
    {
      v6[2](v6, 0, 0);
      goto LABEL_13;
    }
    double v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F31628] code:500 userInfo:0];
    v6[2](v6, 0, v11);
  }

LABEL_13:
}

- (BOOL)_fireAndForgetOutboundCommand:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 conformsToProtocol:&unk_26D87F7A8])
  {
    if ([v4 conformsToProtocol:&unk_26D877DE8])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v16 = [v4 handleForCardViewController:self];
        goto LABEL_40;
      }
LABEL_39:
      char v16 = 0;
      goto LABEL_40;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [(CRKCardViewController *)self cardViewControllerDelegate];
      char v29 = objc_opt_respondsToSelector();

      id v30 = [(CRKCardViewController *)self cardViewControllerDelegate];
      id v31 = v30;
      if (v29)
      {
        [v30 performRequestUserConfirmationCommand:v4 forCardViewController:self];
      }
      else
      {
        char v34 = objc_opt_respondsToSelector();

        if ((v34 & 1) == 0) {
          goto LABEL_39;
        }
        id v31 = [(CRKCardViewController *)self cardViewControllerDelegate];
        [v31 cardViewController:self requestsHandlingOfIntent:0];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v32 = [(CRKCardViewController *)self cardViewControllerDelegate];
        char v33 = objc_opt_respondsToSelector();

        if ((v33 & 1) == 0) {
          goto LABEL_39;
        }
        id v31 = [(CRKCardViewController *)self cardViewControllerDelegate];
        [v31 performBeganEditingCommand:v4 forCardViewController:self];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_39;
        }
        long long v35 = [(CRKCardViewController *)self cardViewControllerDelegate];
        char v36 = objc_opt_respondsToSelector();

        if ((v36 & 1) == 0) {
          goto LABEL_39;
        }
        id v31 = [(CRKCardViewController *)self cardViewControllerDelegate];
        [v31 performFinishedEditingCommand:v4 forCardViewController:self];
      }
    }

    char v16 = 1;
    goto LABEL_40;
  }
  id v5 = v4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v39 = self;
  char v6 = [(CRKCardViewController *)self card];
  uint64_t v7 = [v6 dismissalCommands];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v12 conformsToProtocol:&unk_26D87F7A8])
        {
          id v13 = [v12 referenceIdentifier];
          objc_super v14 = [v5 referenceIdentifier];
          char v15 = [v13 isEqualToString:v14];

          if (v15)
          {

            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            uint64_t v17 = 1000;
            uint64_t v18 = v39;
            id v19 = v39->_pendingDismissalCommands;
            uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v41;
              uint64_t v38 = 1000;
              while (2)
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v41 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                  id v25 = objc_msgSend(v24, "referenceIdentifier", v38);
                  id v26 = [v5 referenceIdentifier];
                  int v27 = [v25 isEqualToString:v26];

                  if (v27)
                  {
                    uint64_t v17 = v38;
                    uint64_t v18 = v39;
                    [*(id *)((char *)&v39->super.super.super.isa + v38) removeObject:v24];
                    goto LABEL_28;
                  }
                }
                uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
                uint64_t v17 = v38;
                uint64_t v18 = v39;
                if (v21) {
                  continue;
                }
                break;
              }
            }
LABEL_28:

            [*(id *)((char *)&v18->super.super.super.isa + v17) addObject:v5];
            char v16 = 1;
            goto LABEL_29;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  char v16 = [(CRKCardViewController *)v39 _askDelegateToPerformReferentialCommand:v5];
LABEL_29:

LABEL_40:
  return v16;
}

- (void)cardSectionViewControllerShouldBeRemoved:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  char v6 = [v4 arrayWithObjects:&v7 count:1];
  -[CRKCardViewController _removeCardSectionViewControllersFromParentViewController:](self, "_removeCardSectionViewControllersFromParentViewController:", v6, v7, v8);

  [(NSMutableArray *)self->_cardSectionViewControllers removeObject:v5];
}

- (void)presentViewController:(id)a3 forCardSectionViewController:(id)a4
{
  id v8 = a3;
  id v5 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v7 presentViewController:v8 forCardViewController:self];
  }
}

- (void)cardSectionViewController:(id)a3 didSelectPreferredPunchoutIndex:(int64_t)a4
{
  self->_preferredPunchoutIndex = a4;
}

- (int64_t)preferredPunchoutIndexForCardSectionViewController:(id)a3
{
  return self->_preferredPunchoutIndex;
}

- (void)didEngageCardSection:(id)a3
{
  id v4 = a3;
  id v7 = [v4 cardSection];
  id v5 = [MEMORY[0x263F316B0] cardSectionWithSFCardSection:v7];
  char v6 = [(NSMapTable *)self->_cardSectionsToCardSectionViewControllersMapTable objectForKey:v5];
  [v6 didEngageCardSection:v4];
}

- (void)presentViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v6 presentViewController:v7 forCardViewController:self];
  }
}

- (void)willDismissViewController:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v6 cardViewController:self willDismissViewController:v7];
  }
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndex = a3;
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 cardSectionView:v10 willProcessEngagementFeedback:v6];
  }
}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 userDidEngageCardSection:v10 withEngagementFeedback:v6];
  }
}

- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 userDidReportFeedback:v10 fromCardSection:v6];
  }
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 cardSectionViewWillAppearForCardSection:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 cardSectionViewDidAppearForCardSection:v10 withAppearanceFeedback:v6];
  }
}

- (void)cardSectionViewDidDisappearForCardSection:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(CRKCardViewController *)self cardViewControllerDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(CRKCardViewController *)self cardViewControllerDelegate];
    [v9 cardSectionViewDidDisappearForCardSection:v10 withDisappearanceFeedback:v6];
  }
}

- (void)setCardSectionViewSource:(id)a3
{
  char v5 = (CRKCardSectionViewSourcing *)a3;
  p_cardSectionViewSource = &self->_cardSectionViewSource;
  if (self->_cardSectionViewSource != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_cardSectionViewSource, a3);
    p_cardSectionViewSource = (CRKCardSectionViewSourcing **)[(CRKCardViewController *)self _loadCardSectionViewControllersFromCard:self->_card currentSourceInvalid:0];
    char v5 = v7;
  }

  MEMORY[0x270F9A758](p_cardSectionViewSource, v5);
}

- (double)contentHeightForWidth:(double)a3
{
  id v4 = [(CRKCardViewController *)self view];
  objc_msgSend(v4, "sizeThatFits:", a3, 3.40282347e38);
  double v6 = v5;

  return v6;
}

- (CRCard)card
{
  return self->_card;
}

- (CRKCardViewControllerDelegate)cardViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewControllerDelegate);

  return (CRKCardViewControllerDelegate *)WeakRetained;
}

- (void)setCardViewControllerDelegate:(id)a3
{
}

- (CRKCardSectionViewSourcing)cardSectionViewSource
{
  return self->_cardSectionViewSource;
}

- (BOOL)isIndicatingActivity
{
  return self->_indicatingActivity;
}

- (BOOL)loadBundles
{
  return self->_loadBundles;
}

- (void)setLoadBundles:(BOOL)a3
{
  self->_loadBundles = a3;
}

- (int64_t)preferredPunchoutIndex
{
  return self->_preferredPunchoutIndex;
}

- (void)setPreferredPunchoutIndex:(int64_t)a3
{
  self->_preferredPunchoutIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSectionViewSource, 0);
  objc_destroyWeak((id *)&self->_cardViewControllerDelegate);
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_loadingCardSections, 0);
  objc_storeStrong((id *)&self->_builtInCardSectionViewSource, 0);
  objc_storeStrong((id *)&self->_pendingDismissalCommands, 0);
  objc_storeStrong((id *)&self->_handledParametersForInteraction, 0);
  objc_storeStrong((id *)&self->_cardSectionsToCardSectionViewControllersMapTable, 0);

  objc_storeStrong((id *)&self->_cardSectionViewControllers, 0);
}

- (void)_configureCardSectionViewController:(uint64_t)a1 forCardSection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224F73000, a2, OS_LOG_TYPE_ERROR, "No cardSectionViewController for card section: %@. Dropping and continuing", (uint8_t *)&v2, 0xCu);
}

void __59__CRKCardViewController__setCard_loadProvidersImmediately___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224F73000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void __86__CRKCardViewController__loadCardSectionViewControllersFromCard_currentSourceInvalid___block_invoke_7_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_224F73000, log, OS_LOG_TYPE_ERROR, "Delegate %@ failed to provide card section view source: %@", (uint8_t *)&v5, 0x16u);
}

@end