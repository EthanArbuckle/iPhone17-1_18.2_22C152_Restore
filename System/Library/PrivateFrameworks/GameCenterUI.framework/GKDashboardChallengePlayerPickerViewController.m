@interface GKDashboardChallengePlayerPickerViewController
- (BOOL)shouldApplyInitialOffset;
- (BOOL)shouldIgnoreClearSelection;
- (BOOL)textFieldShouldReturn:(id)a3;
- (GKChallenge)challenge;
- (GKDashboardChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4;
- (NSArray)initiallySelectedPlayers;
- (NSLayoutConstraint)customizeMessageBottomConstraint;
- (NSLayoutConstraint)scrollingHeaderTopConstraint;
- (NSString)message;
- (UIBarButtonItem)customizeMessageButton;
- (UIButton)sendButton;
- (UIEdgeInsets)initialInsets;
- (UILabel)descriptionLabel;
- (UITextField)messageField;
- (UIView)scrollingHeader;
- (UIViewController)composeController;
- (double)initialCustomizeMessageBottomConstraintConstant;
- (double)scrollingHeaderTopConstraintConstant;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (void)_updateButtonEnableState;
- (void)addMessage:(id)a3;
- (void)adjustCustomizeMessageConstraint;
- (void)applyInitialContentOffset;
- (void)cancel:(id)a3;
- (void)clearSelection;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)loadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)selectPlayersAtIndexPaths:(id)a3;
- (void)send:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setComposeController:(id)a3;
- (void)setCustomizeMessageBottomConstraint:(id)a3;
- (void)setCustomizeMessageButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3;
- (void)setInitialInsets:(UIEdgeInsets)a3;
- (void)setInitiallySelectedPlayers:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageField:(id)a3;
- (void)setScrollingHeader:(id)a3;
- (void)setScrollingHeaderTopConstraint:(id)a3;
- (void)setScrollingHeaderTopConstraintConstant:(double)a3;
- (void)setSearchText:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setShouldApplyInitialOffset:(BOOL)a3;
- (void)setShouldIgnoreClearSelection:(BOOL)a3;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKDashboardChallengePlayerPickerViewController

- (GKDashboardChallengePlayerPickerViewController)initWithChallenge:(id)a3 initiallySelectedPlayers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() _gkPlatformNibName];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v15.receiver = self;
  v15.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  v10 = [(GKDashboardCollectionViewController *)&v15 initWithNibName:v8 bundle:v9];

  if (v10)
  {
    [(GKDashboardChallengePlayerPickerViewController *)v10 setChallenge:v6];
    [(GKDashboardChallengePlayerPickerViewController *)v10 setInitiallySelectedPlayers:v7];
    v11 = [[GKDashboardChallengePlayerPickerDataSource alloc] initWithChallenge:v6];
    [(GKDashboardCollectionViewController *)v10 setDataSource:v11];
    v12 = GKGameCenterUIFrameworkBundle();
    v13 = GKGetLocalizedStringFromTableInBundle();
    [(GKDashboardChallengePlayerPickerViewController *)v10 setTitle:v13];

    [(GKLoadingViewController *)v10 setLoadingIndicatorDelay:0.0];
  }

  return v10;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v17 viewDidLoad];
  v3 = [(GKChallenge *)self->_challenge detailGoalText];
  [(UILabel *)self->_descriptionLabel setText:v3];

  v4 = [(GKDashboardCollectionViewController *)self collectionView];
  [(GKDashboardCollectionViewController *)self setToHorizontalLayout:0];
  [(GKDashboardCollectionViewController *)self setAutoWidthUsesTwoColumnsWhenSpace:1];
  id v5 = [v4 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setCentersItemsInExcessSpace:1];
    [v5 setFocusScaleFactor:1.0];
  }
  [v4 setDelegate:self];
  [v4 setClipsToBounds:0];
  scrollingHeaderTopConstraint = self->_scrollingHeaderTopConstraint;
  if (scrollingHeaderTopConstraint)
  {
    [(NSLayoutConstraint *)scrollingHeaderTopConstraint constant];
    -[GKDashboardChallengePlayerPickerViewController setScrollingHeaderTopConstraintConstant:](self, "setScrollingHeaderTopConstraintConstant:");
    [v5 sectionInset];
    -[GKDashboardChallengePlayerPickerViewController setInitialInsets:](self, "setInitialInsets:");
    [(GKDashboardChallengePlayerPickerViewController *)self setShouldApplyInitialOffset:1];
    [(UIView *)self->_scrollingHeader layoutIfNeeded];
    double left = self->_initialInsets.left;
    double bottom = self->_initialInsets.bottom;
    double right = self->_initialInsets.right;
    [(UIView *)self->_scrollingHeader bounds];
    objc_msgSend(v5, "setSectionInset:", self->_initialInsets.top + v10, left, bottom, right);
  }
  if (!self->_sendButton)
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v12 = GKGameCenterUIFrameworkBundle();
    v13 = GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)[v11 initWithTitle:v13 style:2 target:self action:sel_send_];
    objc_super v15 = [(GKDashboardChallengePlayerPickerViewController *)self navigationItem];
    [v15 setRightBarButtonItem:v14];
  }
  [(NSLayoutConstraint *)self->_customizeMessageBottomConstraint constant];
  self->_initialCustomizeMessageBottomConstraintConstant = v16;
  [(GKDashboardChallengePlayerPickerViewController *)self adjustCustomizeMessageConstraint];
  [(GKDashboardChallengePlayerPickerViewController *)self _updateButtonEnableState];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v14 viewWillAppear:a3];
  v4 = [(GKDashboardChallengePlayerPickerViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    id v7 = [(GKDashboardChallengePlayerPickerViewController *)self navigationItem];
    v8 = [v7 leftBarButtonItem];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v10 = GKGameCenterUIFrameworkBundle();
      id v11 = GKGetLocalizedStringFromTableInBundle();
      v12 = (void *)[v9 initWithTitle:v11 style:0 target:self action:sel_cancel_];
      v13 = [(GKDashboardChallengePlayerPickerViewController *)self navigationItem];
      [v13 setLeftBarButtonItem:v12];
    }
  }
  [(GKDashboardChallengePlayerPickerViewController *)self applyInitialContentOffset];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKDashboardChallengePlayerPickerViewController *)self applyInitialContentOffset];
  [(GKDashboardChallengePlayerPickerViewController *)self setShouldIgnoreClearSelection:1];
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 viewDidAppear:v3];
  [(GKDashboardChallengePlayerPickerViewController *)self setShouldIgnoreClearSelection:0];
  [(GKDashboardChallengePlayerPickerViewController *)self setShouldApplyInitialOffset:0];
}

- (void)adjustCustomizeMessageConstraint
{
  if (self->_customizeMessageBottomConstraint) {
    BOOL v2 = *MEMORY[0x1E4F63830] == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      id v9 = [(GKDashboardChallengePlayerPickerViewController *)self presentingViewController];
      if (v9)
      {
        [(NSLayoutConstraint *)self->_customizeMessageBottomConstraint setConstant:self->_initialCustomizeMessageBottomConstraintConstant];
      }
      else
      {
        uint64_t v6 = [(GKDashboardChallengePlayerPickerViewController *)self tabBarController];
        id v7 = [v6 tabBar];
        [v7 bounds];
        [(NSLayoutConstraint *)self->_customizeMessageBottomConstraint setConstant:v8 + self->_initialCustomizeMessageBottomConstraintConstant];
      }
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  id v7 = a4;
  -[GKDashboardChallengePlayerPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__GKDashboardChallengePlayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F63B68;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_3];
}

uint64_t __101__GKDashboardChallengePlayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) adjustCustomizeMessageConstraint];
}

- (void)applyInitialContentOffset
{
  if (self->_shouldApplyInitialOffset)
  {
    BOOL v3 = [(GKDashboardCollectionViewController *)self dataSource];
    v4 = [v3 selectedPlayers];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      id v11 = [(GKDashboardCollectionViewController *)self collectionView];
      [v11 contentOffset];
      double v7 = v6;
      [(UIView *)self->_scrollingHeader bounds];
      double v9 = v8;
      [v11 contentInset];
      objc_msgSend(v11, "setContentOffset:animated:", 0, v7, v9 - v10);
    }
  }
}

- (void)setMessage:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    message = self->_message;
    self->_message = v4;

    [(UITextField *)self->_messageField setText:v6];
  }
}

- (void)loadData
{
  if ([(GKChallenge *)self->_challenge detailsLoaded])
  {
    v4.receiver = self;
    v4.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v4 loadData];
  }
  else
  {
    challenge = self->_challenge;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__GKDashboardChallengePlayerPickerViewController_loadData__block_invoke;
    v5[3] = &unk_1E5F62EB0;
    v5[4] = self;
    [(GKChallenge *)challenge loadDetailsWithCompletionHandler:v5];
  }
}

id __58__GKDashboardChallengePlayerPickerViewController_loadData__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  return objc_msgSendSuper2(&v2, sel_loadData);
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v23 dataUpdated:a3 withError:a4];
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  NSUInteger v7 = [(NSArray *)self->_initiallySelectedPlayers count];
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  double v9 = [v6 arrayWithCapacity:v8];
  if ([(NSArray *)self->_initiallySelectedPlayers count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v10 = self->_initiallySelectedPlayers;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = objc_msgSend(v5, "indexPathForPlayer:", *(void *)(*((void *)&v19 + 1) + 8 * v14), (void)v19);
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    [(GKDashboardChallengePlayerPickerViewController *)self setInitiallySelectedPlayers:0];
  }
  else if ([v5 itemCount] == 1)
  {
    double v16 = [v5 searchText];
    uint64_t v17 = [v16 length];

    if (!v17)
    {
      v18 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      [v9 addObject:v18];
    }
  }
  if (objc_msgSend(v9, "count", (void)v19)) {
    [(GKDashboardChallengePlayerPickerViewController *)self selectPlayersAtIndexPaths:v9];
  }
  [(GKDashboardChallengePlayerPickerViewController *)self _updateButtonEnableState];
}

- (void)selectPlayersAtIndexPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v5, "collectionView:shouldSelectItemAtIndexPath:", v6, v13, (void)v14))
        {
          [v6 selectItemAtIndexPath:v13 animated:0 scrollPosition:18];
          [(GKDashboardChallengePlayerPickerViewController *)self collectionView:v6 didSelectItemAtIndexPath:v13];
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(GKDashboardChallengePlayerPickerViewController *)self setNeedsFocusUpdate];
    }
  }
  else
  {
  }
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(GKDashboardCollectionViewController *)self dataSource];
  uint64_t v9 = [v8 searchText];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = GKGameCenterUIFrameworkBundle();
    uint64_t v12 = GKGetLocalizedStringFromTableInBundle();
    [v6 setMessage:v12];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v13 setupNoContentView:v6 withError:v7];
  }
}

- (id)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(UIButton *)self->_sendButton isEnabled]
    && (BOOL v3 = self->_sendButton) != 0)
  {
    id v4 = v3;
    v8[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    uint64_t v5 = [(GKDashboardCollectionViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (void)clearSelection
{
  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v4 clearSelection];
    BOOL v3 = [(GKDashboardCollectionViewController *)self dataSource];
    [v3 clearSelection];

    [(GKDashboardChallengePlayerPickerViewController *)self _updateButtonEnableState];
  }
}

- (void)send:(id)a3
{
  id v7 = [(GKDashboardCollectionViewController *)self dataSource];
  objc_super v4 = [v7 selectedPlayers];
  if ((unint64_t)[v4 count] < 0xB)
  {
    if ([v4 count])
    {
      [(GKChallenge *)self->_challenge issueToPlayers:v4 message:self->_message];
      completionHandler = (void (**)(id, void *, NSString *))self->_completionHandler;
      if (completionHandler) {
        completionHandler[2](completionHandler, v4, self->_message);
      }
      [(UIViewController *)self _gkRemoveViewController:self animated:1];
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F636A8] tooManyPlayersAlertController];
    [(GKDashboardChallengePlayerPickerViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)addMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKDashboardCollectionViewController *)self dataSource];
  id v6 = [GKChallengeComposeController alloc];
  challenge = self->_challenge;
  message = self->_message;
  uint64_t v9 = [v5 selectedPlayers];
  uint64_t v10 = [(GKChallengeComposeController *)v6 initWithChallenge:challenge defaultMessage:message players:v9];

  id from = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke;
  v11[3] = &unk_1E5F63BB0;
  v11[4] = self;
  objc_copyWeak(&v12, &from);
  [(GKSimpleComposeController *)v10 setDoneHandler:v11];
  [(UIViewController *)self _gkShowViewController:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
}

void __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke_2;
    v8[3] = &unk_1E5F63350;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _gkRemoveViewController:WeakRetained animated:1];
    [WeakRetained setDoneHandler:0];
  }
}

uint64_t __61__GKDashboardChallengePlayerPickerViewController_addMessage___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMessage:*(void *)(a1 + 40)];
  objc_super v2 = *(void **)(a1 + 32);

  return [v2 send:v2];
}

- (void)cancel:(id)a3
{
  id completionHandler = self->_completionHandler;
  if (completionHandler) {
    (*((void (**)(id, void, void))completionHandler + 2))(completionHandler, 0, 0);
  }

  [(UIViewController *)self _gkRemoveViewController:self animated:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  messageField = self->_messageField;
  if (messageField == a3)
  {
    id v6 = [a3 text];
    [(GKDashboardChallengePlayerPickerViewController *)self setMessage:v6];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__GKDashboardChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return messageField != a3;
}

uint64_t __72__GKDashboardChallengePlayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send:*(void *)(a1 + 32)];
}

- (void)_updateButtonEnableState
{
  id v8 = [(GKDashboardCollectionViewController *)self dataSource];
  BOOL v3 = [v8 selectedPlayers];
  uint64_t v4 = [v3 count];

  [(UIButton *)self->_sendButton setEnabled:v4 != 0];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F637E8] shared];
    -[UIBarButtonItem setEnabled:](self->_customizeMessageButton, "setEnabled:", [v5 shouldAllowCustomCommunication]);
  }
  else
  {
    [(UIBarButtonItem *)self->_customizeMessageButton setEnabled:0];
  }
  if (!self->_sendButton)
  {
    id v6 = [(GKDashboardChallengePlayerPickerViewController *)self navigationItem];
    id v7 = [v6 rightBarButtonItem];
    [v7 setEnabled:v4 != 0];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  [v4 setText:0];
  [v4 resignFirstResponder];

  [(GKDashboardChallengePlayerPickerViewController *)self setSearchText:0];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
}

- (void)setSearchText:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKDashboardCollectionViewController *)self dataSource];
  [v5 setSearchText:v4];
  [(GKDashboardChallengePlayerPickerViewController *)self dataUpdated:1 withError:0];
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];
  id v7 = [v5 selectedPlayers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v5 indexPathForPlayer:*(void *)(*((void *)&v13 + 1) + 8 * v11)];
        [v6 selectItemAtIndexPath:v12 animated:0 scrollPosition:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 collectionView:a3 didSelectItemAtIndexPath:a4];
  [(GKDashboardChallengePlayerPickerViewController *)self _updateButtonEnableState];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardChallengePlayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 collectionView:a3 didDeselectItemAtIndexPath:a4];
  [(GKDashboardChallengePlayerPickerViewController *)self _updateButtonEnableState];
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollingHeaderTopConstraint)
  {
    double scrollingHeaderTopConstraintConstant = self->_scrollingHeaderTopConstraintConstant;
    [a3 contentOffset];
    [(NSLayoutConstraint *)self->_scrollingHeaderTopConstraint setConstant:scrollingHeaderTopConstraintConstant - v5];
    [(GKDashboardChallengePlayerPickerViewController *)self applyInitialContentOffset];
  }
}

- (NSString)message
{
  return self->_message;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSArray)initiallySelectedPlayers
{
  return self->_initiallySelectedPlayers;
}

- (void)setInitiallySelectedPlayers:(id)a3
{
}

- (BOOL)shouldIgnoreClearSelection
{
  return self->_shouldIgnoreClearSelection;
}

- (void)setShouldIgnoreClearSelection:(BOOL)a3
{
  self->_shouldIgnoreClearSelection = a3;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  self->_descriptionLabel = (UILabel *)a3;
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
  self->_sendButton = (UIButton *)a3;
}

- (UIBarButtonItem)customizeMessageButton
{
  return self->_customizeMessageButton;
}

- (void)setCustomizeMessageButton:(id)a3
{
  self->_customizeMessageButton = (UIBarButtonItem *)a3;
}

- (UITextField)messageField
{
  return self->_messageField;
}

- (void)setMessageField:(id)a3
{
  self->_messageField = (UITextField *)a3;
}

- (UIView)scrollingHeader
{
  return self->_scrollingHeader;
}

- (void)setScrollingHeader:(id)a3
{
  self->_scrollingHeader = (UIView *)a3;
}

- (NSLayoutConstraint)scrollingHeaderTopConstraint
{
  return self->_scrollingHeaderTopConstraint;
}

- (void)setScrollingHeaderTopConstraint:(id)a3
{
  self->_scrollingHeaderTopConstraint = (NSLayoutConstraint *)a3;
}

- (double)scrollingHeaderTopConstraintConstant
{
  return self->_scrollingHeaderTopConstraintConstant;
}

- (void)setScrollingHeaderTopConstraintConstant:(double)a3
{
  self->_double scrollingHeaderTopConstraintConstant = a3;
}

- (UIEdgeInsets)initialInsets
{
  double top = self->_initialInsets.top;
  double left = self->_initialInsets.left;
  double bottom = self->_initialInsets.bottom;
  double right = self->_initialInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInitialInsets:(UIEdgeInsets)a3
{
  self->_initialInsets = a3;
}

- (BOOL)shouldApplyInitialOffset
{
  return self->_shouldApplyInitialOffset;
}

- (void)setShouldApplyInitialOffset:(BOOL)a3
{
  self->_shouldApplyInitialOffset = a3;
}

- (NSLayoutConstraint)customizeMessageBottomConstraint
{
  return self->_customizeMessageBottomConstraint;
}

- (void)setCustomizeMessageBottomConstraint:(id)a3
{
  self->_customizeMessageBottomConstraint = (NSLayoutConstraint *)a3;
}

- (double)initialCustomizeMessageBottomConstraintConstant
{
  return self->_initialCustomizeMessageBottomConstraintConstant;
}

- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3
{
  self->_initialCustomizeMessageBottomConstraintConstant = a3;
}

- (UIViewController)composeController
{
  return self->_composeController;
}

- (void)setComposeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeController, 0);
  objc_storeStrong((id *)&self->_initiallySelectedPlayers, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end