@interface CKAvatarPickerViewController
- (BOOL)avatarPickerLayoutShouldShowTitle:(id)a3;
- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4;
- (BOOL)chatIsReportedAsSpam;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)hasTitle;
- (BOOL)shouldBeginTouchingAvatarView;
- (CGRect)titleViewFrame;
- (CKAvatarPickerLayout)layout;
- (CKAvatarPickerViewController)initWithConversation:(id)a3;
- (CKAvatarPickerViewControllerDelegate)delegate;
- (CKAvatarTitleCollectionReusableView)titleView;
- (CKConversation)conversation;
- (CKEntity)cachedAppleEntity;
- (CNContactStore)suggestionsEnabledContactStore;
- (CNGroupAvatarViewController)groupAvatarViewController;
- (NSMapTable)visibleTitleViews;
- (NSObject)sharedProfileStateOracle;
- (UICollectionView)collectionView;
- (UILabel)locationLabel;
- (double)avatarPickerLayoutTitleViewHeight;
- (id)_configureCollectionView:(id)a3 avatarCellForItemAtIndexPath:(id)a4;
- (id)_configureCollectionView:(id)a3 bannerViewCellForItemAtIndexPath:(id)a4;
- (id)_configureCollectionView:(id)a3 groupIdentityCellForItemAtIndexPath:(id)a4;
- (id)_cutoutSupplementaryViewAtIndexPath:(id)a3;
- (id)_groupAvatarViewControllerRequiredContactKeys;
- (id)_titleSupplementaryViewAtIndexPath:(id)a3;
- (id)avatarDisplayName;
- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)presentingViewControllerForAvatarView:(id)a3;
- (int)chatWasDetectedAsSMSSpam;
- (int64_t)_KTAvatarTitleAccessoryImageType;
- (int64_t)avatarTitleAccessoryImageType;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indicatorType;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)style;
- (unint64_t)_preferredAvatarLayoutMode;
- (void)_animateInTitleView;
- (void)_animateOutTitleView;
- (void)_chatItemsDidChange:(id)a3;
- (void)_chatPropertiesChanged:(id)a3;
- (void)_handleAddressBookChange:(id)a3;
- (void)_handleConversationIsFilteredChange:(id)a3;
- (void)_handleConversationRecipientsDidChange:(id)a3;
- (void)_handleGroupNameChange:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_setTitle:(id)a3 animated:(BOOL)a4;
- (void)beganTouchingAvatarView;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)endedTouchingAvatarView;
- (void)loadView;
- (void)performAnimationForPhotoUpdate;
- (void)sendUpdatedRecentParticipantsToContacts;
- (void)setAvatarPickerActive:(BOOL)a3;
- (void)setCachedAppleEntity:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroupAvatarViewController:(id)a3;
- (void)setIndicatorType:(int64_t)a3;
- (void)setLayout:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuggestionsEnabledContactStore:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setVisibleTitleViews:(id)a3;
- (void)tappedAvatarPickerViewController;
- (void)updateContentsForConversation:(id)a3;
- (void)updateGroupAvatarView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CKAvatarPickerViewController

- (CKAvatarPickerViewController)initWithConversation:(id)a3
{
  id v4 = a3;
  v5 = [(CKAvatarPickerViewController *)self init];
  v6 = v5;
  if (v5)
  {
    [(CKAvatarPickerViewController *)v5 setConversation:v4];
    v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:5];
    [(CKAvatarPickerViewController *)v6 setVisibleTitleViews:v7];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = [(CKAvatarPickerViewController *)v6 conversation];
    [v8 addObserver:v6 selector:sel__handleConversationRecipientsDidChange_ name:@"CKConversationParticipantsDidChangeNotification" object:v9];

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = [(CKAvatarPickerViewController *)v6 conversation];
    [v10 addObserver:v6 selector:sel__handleConversationRecipientsDidChange_ name:@"CKConversationJoinStateDidChangeNotification" object:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F6B898];
    v14 = [(CKAvatarPickerViewController *)v6 conversation];
    v15 = [v14 chat];
    [v12 addObserver:v6 selector:sel__handleGroupNameChange_ name:v13 object:v15];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel__handleAddressBookChange_ name:*MEMORY[0x1E4F6CA50] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v6 selector:sel__handleAddressBookChange_ name:*MEMORY[0x1E4F6CA60] object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v6 selector:sel__chatPropertiesChanged_ name:*MEMORY[0x1E4F6B9F0] object:0];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v6 selector:sel__handleConversationIsFilteredChange_ name:*MEMORY[0x1E4F6B8D0] object:0];

    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v6 selector:sel__chatItemsDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];

    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v6 selector:sel_nicknameStoreDidChange_ name:*MEMORY[0x1E4F6BB50] object:0];

    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v6 selector:sel__handleKeyTransparencyStatusChangedNotification_ name:*MEMORY[0x1E4F6B998] object:0];
  }
  return v6;
}

- (void)dealloc
{
  [(UICollectionView *)self->_collectionView setDataSource:0];
  [(UICollectionView *)self->_collectionView setDelegate:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewController;
  [(CKAvatarPickerViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [[CKAvatarPickerLayout alloc] initWithLayoutMode:[(CKAvatarPickerViewController *)self _preferredAvatarLayoutMode]];
  [(CKAvatarPickerViewController *)self setLayout:v3];

  objc_super v4 = [(CKAvatarPickerViewController *)self layout];
  [v4 setDelegate:self];

  id v5 = objc_alloc(MEMORY[0x1E4F42858]);
  v6 = [(CKAvatarPickerViewController *)self layout];
  v7 = objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKAvatarPickerViewController *)self setCollectionView:v7];

  v8 = [(CKAvatarPickerViewController *)self collectionView];
  [v8 setScrollEnabled:0];

  v9 = [(CKAvatarPickerViewController *)self collectionView];
  [v9 setAutoresizingMask:18];

  v10 = [(CKAvatarPickerViewController *)self collectionView];
  [v10 setDataSource:self];

  v11 = [(CKAvatarPickerViewController *)self collectionView];
  [v11 setDelegate:self];

  v12 = [MEMORY[0x1E4F428B8] clearColor];
  uint64_t v13 = [(CKAvatarPickerViewController *)self collectionView];
  [v13 setBackgroundColor:v12];

  v14 = [(CKAvatarPickerViewController *)self collectionView];
  [v14 setShowsHorizontalScrollIndicator:0];

  v15 = [(CKAvatarPickerViewController *)self collectionView];
  [v15 setShowsVerticalScrollIndicator:0];

  v16 = [MEMORY[0x1E4F42D90] mainScreen];
  [v16 scale];
  double v18 = v17;
  v19 = [(CKAvatarPickerViewController *)self collectionView];
  v20 = [v19 layer];
  [v20 setRasterizationScale:v18];

  v21 = [(CKAvatarPickerViewController *)self collectionView];
  v22 = [v21 layer];
  [v22 setShouldRasterize:1];

  id v23 = [(CKAvatarPickerViewController *)self collectionView];
  [(CKAvatarPickerViewController *)self setView:v23];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKAvatarPickerViewController;
  [(CKAvatarPickerViewController *)&v4 viewDidAppear:a3];
  [(CKAvatarPickerViewController *)self performAnimationForPhotoUpdate];
}

- (void)updateContentsForConversation:(id)a3
{
  id v7 = a3;
  id v4 = [(CKAvatarPickerViewController *)self conversation];

  id v5 = v7;
  if (v4 != v7)
  {
    [(CKAvatarPickerViewController *)self setConversation:v7];
    v6 = [(CKAvatarPickerViewController *)self collectionView];
    [v6 reloadData];

    id v5 = v7;
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    id v4 = [(CKAvatarPickerViewController *)self collectionView];
    id v5 = [v4 layer];
    [v5 setShouldRasterize:0];

    v6 = [(CKAvatarPickerViewController *)self collectionView];
    [v6 reloadData];

    id v8 = [(CKAvatarPickerViewController *)self collectionView];
    id v7 = [v8 layer];
    [v7 setShouldRasterize:1];
  }
}

- (void)setAvatarPickerActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKAvatarPickerViewController *)self titleView];

  if (v5)
  {
    id v6 = [(CKAvatarPickerViewController *)self titleView];
    [v6 setAvatarPickerActive:v3];
  }
}

- (void)setIndicatorType:(int64_t)a3
{
  self->_indicatorType = a3;
  id v5 = [(CKAvatarPickerViewController *)self titleView];

  if (v5)
  {
    id v6 = [(CKAvatarPickerViewController *)self titleView];
    [v6 setStatusIndicatorType:a3];
  }
}

- (void)setTitleView:(id)a3
{
  id v5 = (CKAvatarTitleCollectionReusableView *)a3;
  if (self->_titleView != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_titleView, a3);
    id v6 = [(CKAvatarPickerViewController *)self titleView];
    [v6 setStatusIndicatorType:self->_indicatorType];

    id v5 = v7;
  }
}

- (void)setLocationLabel:(id)a3
{
  id v5 = (UILabel *)a3;
  if (self->_locationLabel != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_locationLabel, a3);
    id v6 = [(CKAvatarPickerViewController *)self layout];
    [v6 invalidateLayoutAndCache];

    id v7 = [(CKAvatarPickerViewController *)self collectionView];
    [v7 reloadData];

    id v5 = v8;
  }
}

- (BOOL)hasTitle
{
  v2 = [(CKAvatarPickerViewController *)self titleView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CGRect)titleViewFrame
{
  BOOL v3 = [(CKAvatarPickerViewController *)self conversation];
  char v4 = [v3 isBusinessConversation];

  id v5 = [(CKAvatarPickerViewController *)self view];
  id v6 = [(CKAvatarPickerViewController *)self layout];
  id v7 = [v6 titleSupplementaryAttr];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (v4)
  {
    v16 = [(CKAvatarPickerViewController *)self collectionView];
    objc_msgSend(v5, "convertRect:toView:", v16, v9, v11, v13, v15);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
  }
  else
  {
    v16 = [(CKAvatarPickerViewController *)self groupAvatarViewController];
    v25 = [v16 view];
    objc_msgSend(v5, "convertRect:toView:", v25, v9, v11, v13, v15);
    double v18 = v26;
    double v20 = v27;
    double v22 = v28;
    double v24 = v29;
  }
  double v30 = v18;
  double v31 = v20;
  double v32 = v22;
  double v33 = v24;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)_animateInTitleView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [(CKAvatarPickerViewController *)self visibleTitleViews];
  BOOL v3 = NSAllMapTableValues(v2);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v9 = [v8 layer];
        double v10 = titleViewAlphaAnimation(1);
        [v9 addAnimation:v10 forKey:@"message-in-opacity-animation"];

        double v11 = [v8 layer];
        LODWORD(v12) = 1.0;
        [v11 setOpacity:v12];

        double v13 = [v8 layer];
        double v14 = titleViewScaleAnimation(1);
        [v13 addAnimation:v14 forKey:@"message-in-scale-animation"];

        CATransform3DMakeScale(&v17, 1.0, 1.0, 1.0);
        double v15 = [v8 layer];
        CATransform3D v16 = v17;
        [v15 setTransform:&v16];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (void)_animateOutTitleView
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [(CKAvatarPickerViewController *)self visibleTitleViews];
  BOOL v3 = NSAllMapTableValues(v2);

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v9 = [v8 layer];
        double v10 = titleViewAlphaAnimation(0);
        [v9 addAnimation:v10 forKey:@"message-out-opacity-animation"];

        double v11 = [v8 layer];
        [v11 setOpacity:0.0];

        double v12 = [v8 layer];
        double v13 = titleViewScaleAnimation(0);
        [v12 addAnimation:v13 forKey:@"message-out-scale-animation"];

        CATransform3DMakeScale(&v16, 0.5, 0.5, 1.0);
        double v14 = [v8 layer];
        CATransform3D v15 = v16;
        [v14 setTransform:&v15];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)_setTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CKAvatarPickerViewController *)self titleView];
  [v7 setTitle:v6 animated:v4];
}

- (BOOL)chatIsReportedAsSpam
{
  v2 = [(CKAvatarPickerViewController *)self conversation];
  BOOL v3 = [v2 chat];
  BOOL v4 = [v3 valueForChatProperty:*MEMORY[0x1E4F6BE68]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (int)chatWasDetectedAsSMSSpam
{
  v2 = [(CKAvatarPickerViewController *)self conversation];
  int v3 = [v2 wasDetectedAsSMSSpam];

  return v3;
}

- (void)_chatPropertiesChanged:(id)a3
{
  id v3 = [(CKAvatarPickerViewController *)self collectionView];
  [v3 reloadData];
}

- (void)updateGroupAvatarView
{
  if (self->_groupAvatarViewController)
  {
    id v6 = [(CKAvatarPickerViewController *)self _groupAvatarViewControllerRequiredContactKeys];
    uint64_t v3 = [MEMORY[0x1E4F1BBB8] maxContactAvatars];
    BOOL v4 = [(CKAvatarPickerViewController *)self conversation];
    char v5 = [v4 conversationVisualIdentityWithKeys:v6 requestedNumberOfContactsToFetch:v3];

    [(CNGroupAvatarViewController *)self->_groupAvatarViewController groupIdentityDidUpdate:v5];
  }
}

- (void)_handleConversationIsFilteredChange:(id)a3
{
  id v3 = [(CKAvatarPickerViewController *)self collectionView];
  [v3 reloadData];
}

- (unint64_t)_preferredAvatarLayoutMode
{
  id v3 = [(CKAvatarPickerViewController *)self conversation];
  if ([v3 isBusinessConversation])
  {
    BOOL v4 = [(CKAvatarPickerViewController *)self conversation];
    if ([v4 isAppleConversation])
    {

      unint64_t v5 = 1;
    }
    else
    {
      id v6 = [(CKAvatarPickerViewController *)self conversation];
      id v7 = [v6 businessHandle];
      double v8 = [v7 brandWideLogoImageData];

      if (v8) {
        unint64_t v5 = 2;
      }
      else {
        unint64_t v5 = 1;
      }
    }
  }
  else
  {
    unint64_t v5 = 3;
  }

  return v5;
}

- (void)performAnimationForPhotoUpdate
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Trying to perform animation when view isn't in view hierarchy", v1, 2u);
}

void __62__CKAvatarPickerViewController_performAnimationForPhotoUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v17 = 138412290;
        uint64_t v18 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Peekaboo animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    double v11 = [MEMORY[0x1E4F6BD50] sharedInstance];
    double v12 = [*(id *)(a1 + 40) conversation];
    double v13 = [v12 recipientStrings];
    double v14 = [v13 firstObject];
    [v11 markTransitionAsObservedForHandleID:v14 isAutoUpdate:0];
  }
  else if (a2)
  {
    if (IMOSLoggingEnabled())
    {
      CATransform3D v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v17 = 138412290;
        uint64_t v18 = v16;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "No animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v17 = 138412290;
        uint64_t v18 = v4;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Coin flip animation played for handle IDs: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    unint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 1008) sharedProfileStateOracle];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [*(id *)(*(void *)(a1 + 40) + 1008) sharedProfileStateOracle];
      id v8 = (id)[v7 updateContactAndNicknamesForAutoUpdateWithError:0];
    }
  }
}

- (void)_handleConversationRecipientsDidChange:(id)a3
{
  unint64_t v4 = [(CKAvatarPickerViewController *)self _preferredAvatarLayoutMode];
  unint64_t v5 = [(CKAvatarPickerViewController *)self layout];
  [v5 setLayoutMode:v4];

  char v6 = [(CKAvatarPickerViewController *)self layout];
  [v6 invalidateLayoutAndCache];

  [(CKAvatarPickerViewController *)self sendUpdatedRecentParticipantsToContacts];
  id v7 = [(CKAvatarPickerViewController *)self collectionView];
  [v7 reloadData];
}

- (void)_chatItemsDidChange:(id)a3
{
  id v18 = a3;
  int64_t v4 = [(CKAvatarTitleCollectionReusableView *)self->_titleView avatarTitleAccessoryImageType];
  if (v4 != [(CKAvatarPickerViewController *)self avatarTitleAccessoryImageType])
  {
    unint64_t v5 = [(CKAvatarPickerViewController *)self collectionView];
    [v5 reloadData];
  }
  char v6 = [(CKAvatarPickerViewController *)self conversation];
  int v7 = [v6 isGroupConversation];

  if (v7)
  {
    id v8 = [v18 userInfo];
    double v9 = v8;
    if (!v8)
    {
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v10 = [v8 valueForKey:*MEMORY[0x1E4F6B8E0]];
    if (![v10 count])
    {
LABEL_14:

      goto LABEL_15;
    }
    double v11 = [(CKAvatarPickerViewController *)self conversation];
    double v12 = [v11 chat];
    double v13 = [v12 chatItems];
    double v14 = [v13 lastObject];

    CATransform3D v15 = objc_opt_class();
    if ([v15 isSubclassOfClass:objc_opt_class()])
    {
      LOBYTE(v16) = 0;
      if (!v14) {
        goto LABEL_13;
      }
    }
    else
    {
      int v17 = objc_opt_class();
      int v16 = [v17 isSubclassOfClass:objc_opt_class()] ^ 1;
      if (!v14)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    if ((v16 & 1) == 0 && ([v14 isFromMe] & 1) == 0) {
      [(CKAvatarPickerViewController *)self sendUpdatedRecentParticipantsToContacts];
    }
    goto LABEL_13;
  }
LABEL_16:
}

- (void)sendUpdatedRecentParticipantsToContacts
{
  id v5 = [(CKAvatarPickerViewController *)self conversation];
  id v3 = [(CKAvatarPickerViewController *)self _groupAvatarViewControllerRequiredContactKeys];
  [v5 setNeedsUpdatedContactOrderForVisualIdentity];
  int64_t v4 = objc_msgSend(v5, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v3, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
  [(CNGroupAvatarViewController *)self->_groupAvatarViewController groupIdentityDidUpdate:v4];
}

- (void)_handleGroupNameChange:(id)a3
{
  id v3 = [(CKAvatarPickerViewController *)self collectionView];
  [v3 reloadData];
}

- (void)_handleAddressBookChange:(id)a3
{
  unint64_t v4 = [(CKAvatarPickerViewController *)self _preferredAvatarLayoutMode];
  unint64_t v5 = v4;
  if (v4 < 3) {
    goto LABEL_2;
  }
  if (v4 == 3)
  {
    id v8 = [(CKAvatarPickerViewController *)self titleView];
    double v9 = [v8 titleLabel];
    uint64_t v10 = [v9 text];
    double v11 = [(CKAvatarPickerViewController *)self avatarDisplayName];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
LABEL_2:
      char v6 = [(CKAvatarPickerViewController *)self layout];
      [v6 setLayoutMode:v5];

      int v7 = [(CKAvatarPickerViewController *)self layout];
      [v7 invalidateLayoutAndCache];

      id v13 = [(CKAvatarPickerViewController *)self collectionView];
      [v13 reloadData];
    }
  }
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v3 = [(CKAvatarPickerViewController *)self collectionView];
  [v3 reloadData];
}

- (BOOL)avatarPickerLayoutShouldShowTitle:(id)a3
{
  return 1;
}

- (double)avatarPickerLayoutTitleViewHeight
{
  id v3 = [(CKAvatarPickerViewController *)self titleView];

  if (!v3) {
    return 0.0;
  }
  unint64_t v4 = [(CKAvatarPickerViewController *)self titleView];
  unint64_t v5 = [(CKAvatarPickerViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "sizeThatFits:", v6, v7);
  double v9 = v8;

  return v9;
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (id)avatarView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v7 = a4;
  if ([a5 isEqualToString:*MEMORY[0x1E4F1BAF8]])
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v26 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = *MEMORY[0x1E4F1ADC8];
      uint64_t v27 = *MEMORY[0x1E4F1AEE0];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          CATransform3D v15 = objc_msgSend(v14, "key", v26);
          int v16 = [v15 isEqualToString:v12];

          if (v16)
          {
            int v17 = [v14 value];
          }
          else
          {
            id v18 = [v14 key];
            int v19 = [v18 isEqualToString:v27];

            if (v19)
            {
              long long v20 = [v14 value];
              int v17 = [v20 stringValue];
            }
            else
            {
              int v17 = 0;
            }
          }
          long long v21 = IMStripFormattingFromAddress();

          uint64_t v22 = [v29 preferredHandle];
          uint64_t v23 = IMStripFormattingFromAddress();
          int v24 = MEMORY[0x192FBAF60](v21, v23);

          if (v24) {
            [v8 insertObject:v14 atIndex:0];
          }
          else {
            [v8 addObject:v14];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v7 = v26;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v5 = [(CKAvatarPickerViewController *)self layout];
  uint64_t v6 = [v5 layoutMode];

  switch(v6)
  {
    case 0:
    case 2:
      id v7 = [(CKAvatarPickerViewController *)self conversation];
      double v8 = [v7 recipients];
      int64_t v9 = [v8 count];

      int64_t result = v9;
      break;
    case 1:
    case 3:
      int64_t result = 1;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  int64_t v9 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [(CKAvatarPickerViewController *)self _titleSupplementaryViewAtIndexPath:v8];
LABEL_5:
    double v14 = (void *)v11;
    goto LABEL_7;
  }
  uint64_t v12 = +[_CKAvatarCutoutSupplementaryView supplementaryViewKind];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    uint64_t v11 = [(CKAvatarPickerViewController *)self _cutoutSupplementaryViewAtIndexPath:v8];
    goto LABEL_5;
  }
  CATransform3D v15 = [NSString stringWithFormat:@"*** %s: Unexpected supplementary element kind %@", "-[CKAvatarPickerViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:]", v7];
  int v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
  [v16 raise];

  double v14 = 0;
LABEL_7:

  return v14;
}

- (id)_titleSupplementaryViewAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[CKAvatarTitleCollectionReusableView reuseIdentifier];
  uint64_t v6 = +[CKAvatarTitleCollectionReusableView supplementaryViewKind];
  id v7 = [(CKAvatarPickerViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:v6 withReuseIdentifier:v5];

  id v8 = [(CKAvatarPickerViewController *)self collectionView];
  int64_t v9 = [v8 dequeueReusableSupplementaryViewOfKind:v6 withReuseIdentifier:v5 forIndexPath:v4];

  [v9 setDelegate:self];
  [(CKAvatarPickerViewController *)self setTitleView:v9];
  int v10 = [(CKAvatarPickerViewController *)self locationLabel];
  [v9 setLocationLabel:v10];

  uint64_t v11 = [(CKAvatarPickerViewController *)self visibleTitleViews];
  [v11 setObject:v9 forKey:v4];

  uint64_t v12 = [(CKAvatarPickerViewController *)self avatarDisplayName];
  [v9 configureWithTitle:v12];

  objc_msgSend(v9, "setStyle:", -[CKAvatarPickerViewController style](self, "style"));
  objc_msgSend(v9, "setAvatarTitleAccessoryImageType:", -[CKAvatarPickerViewController avatarTitleAccessoryImageType](self, "avatarTitleAccessoryImageType"));
  objc_msgSend(v9, "setStatusIndicatorType:", -[CKAvatarPickerViewController indicatorType](self, "indicatorType"));
  int v13 = [(CKAvatarPickerViewController *)self delegate];
  objc_msgSend(v9, "setChevronHidden:", objc_msgSend(v13, "hideChevron"));

  double v14 = [(CKAvatarPickerViewController *)self titleView];
  objc_msgSend(v9, "setAvatarPickerActive:", objc_msgSend(v14, "isAvatarPickerActive"));

  CATransform3D v15 = [(CKAvatarPickerViewController *)self conversation];
  objc_msgSend(v9, "setWantsOpaqueChevron:", objc_msgSend(v15, "hasVerifiedBusiness"));

  int v16 = [(CKAvatarPickerViewController *)self conversation];
  int v17 = [v16 chat];
  int v18 = [v17 isStewieChat];

  if (v18)
  {
    int v19 = +[CKUIBehavior sharedBehaviors];
    long long v20 = [v19 theme];
    long long v21 = [v20 conversationListEmergencyColor];
    uint64_t v22 = [v9 titleLabel];
    [v22 setTextColor:v21];

    uint64_t v23 = +[CKUIBehavior sharedBehaviors];
    int v24 = [v23 avatarNameEmergencyFont];
    v25 = [v9 titleLabel];
    [v25 setFont:v24];
  }
  id v26 = [(CKAvatarPickerViewController *)self conversation];
  uint64_t v27 = [v26 chat];
  int v28 = [v27 isStewieSharingChat];

  if (v28)
  {
    id v29 = +[CKUIBehavior sharedBehaviors];
    long long v30 = [v29 theme];
    long long v31 = [v30 conversationListEmergencyColor];
    long long v32 = [v9 titleLabel];
    [v32 setTextColor:v31];

    long long v33 = +[CKUIBehavior sharedBehaviors];
    v34 = [v33 avatarNameEmergencyFont];
    uint64_t v35 = [v9 titleLabel];
    [v35 setFont:v34];
  }
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_tappedAvatarPickerViewController];
  v37 = [v9 titleLabel];
  [v37 addGestureRecognizer:v36];

  v38 = [v9 titleLabel];
  [v38 setUserInteractionEnabled:1];

  v39 = [v9 titleLabel];
  objc_msgSend(v39, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);

  return v9;
}

- (id)avatarDisplayName
{
  id v3 = [(CKAvatarPickerViewController *)self conversation];
  char v4 = [v3 hasDisplayName];
  unint64_t v5 = [(CKAvatarPickerViewController *)self conversation];
  uint64_t v6 = v5;
  if (v4) {
    [v5 displayName];
  }
  else {
  id v7 = [v5 displayNameForMediaObjects:0 subject:0 shouldListParticipants:0];
  }

  if ([(CKAvatarPickerViewController *)self chatIsReportedAsSpam])
  {
    id v8 = [(CKAvatarPickerViewController *)self conversation];
    int64_t v9 = [v8 chat];
    if ([v9 isFiltered])
    {
    }
    else
    {
      if (![(CKAvatarPickerViewController *)self chatWasDetectedAsSMSSpam])
      {
LABEL_16:

        goto LABEL_17;
      }
      BOOL v10 = +[CKConversation isSMSSpamFilteringEnabled];

      if (v10) {
        goto LABEL_17;
      }
    }
LABEL_12:
    uint64_t v11 = NSString;
    uint64_t v12 = CKFrameworkBundle();
    int v13 = [v12 localizedStringForKey:@"MAYBE_JUNK" value:&stru_1EDE4CA38 table:@"ChatKit"];
    int64_t v9 = objc_msgSend(v11, "stringWithFormat:", v13, v7);

    double v14 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v15 = [v14 userInterfaceLayoutDirection];

    if (v15 == 1) {
      int v16 = @"\u200F";
    }
    else {
      int v16 = @"\u200E";
    }
    [(__CFString *)v16 stringByAppendingString:v9];
    id v7 = v8 = v7;
    goto LABEL_16;
  }
  if ([(CKAvatarPickerViewController *)self chatWasDetectedAsSMSSpam]
    && !+[CKConversation isSMSSpamFilteringEnabled])
  {
    goto LABEL_12;
  }
LABEL_17:

  return v7;
}

- (id)_cutoutSupplementaryViewAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[_CKAvatarCutoutSupplementaryView reuseIdentifier];
  uint64_t v6 = +[_CKAvatarCutoutSupplementaryView supplementaryViewKind];
  id v7 = [(CKAvatarPickerViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:v6 withReuseIdentifier:v5];

  id v8 = [(CKAvatarPickerViewController *)self collectionView];
  int64_t v9 = [v8 dequeueReusableSupplementaryViewOfKind:v6 withReuseIdentifier:v5 forIndexPath:v4];

  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKAvatarPickerViewController *)self layout];
  unint64_t v9 = [v8 layoutMode];

  if (v9 < 2)
  {
    uint64_t v10 = [(CKAvatarPickerViewController *)self _configureCollectionView:v6 avatarCellForItemAtIndexPath:v7];
    goto LABEL_7;
  }
  if (v9 == 3)
  {
    uint64_t v10 = [(CKAvatarPickerViewController *)self _configureCollectionView:v6 groupIdentityCellForItemAtIndexPath:v7];
    goto LABEL_7;
  }
  if (v9 == 2)
  {
    uint64_t v10 = [(CKAvatarPickerViewController *)self _configureCollectionView:v6 bannerViewCellForItemAtIndexPath:v7];
LABEL_7:
    uint64_t v11 = (void *)v10;
    goto LABEL_8;
  }
  uint64_t v11 = 0;
LABEL_8:
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (CKMainScreenScale_once_58 != -1) {
    dispatch_once(&CKMainScreenScale_once_58, &__block_literal_global_151);
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_58 == 0.0) {
    double v20 = 1.0;
  }
  else {
    double v20 = *(double *)&CKMainScreenScale_sMainScreenScale_58;
  }
  objc_msgSend(v11, "setFrame:", round(v13 * v20) / v20, round(v15 * v20) / v20, round(v17 * v20) / v20, round(v19 * v20) / v20);

  return v11;
}

- (id)_configureCollectionView:(id)a3 bannerViewCellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = +[CKBannerCollectionViewCell reuseIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  uint64_t v10 = +[CKBannerCollectionViewCell reuseIdentifier];
  uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

  double v12 = [(CKAvatarPickerViewController *)self conversation];
  double v13 = [v12 recipients];
  uint64_t v14 = [v6 item];

  double v15 = [v13 objectAtIndexedSubscript:v14];

  [v11 configureWithEntity:v15];

  return v11;
}

- (id)_configureCollectionView:(id)a3 avatarCellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = +[CKAvatarCollectionViewCell reuseIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  uint64_t v10 = +[CKAvatarCollectionViewCell reuseIdentifier];
  uint64_t v11 = [v7 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v6];

  double v12 = [(CKAvatarPickerViewController *)self conversation];
  double v13 = [v12 recipients];
  uint64_t v14 = [v6 item];

  double v15 = [v13 objectAtIndexedSubscript:v14];

  double v16 = [v15 defaultIMHandle];
  LODWORD(v13) = [v16 isApple];

  if (v13)
  {
    double v17 = [(CKAvatarPickerViewController *)self cachedAppleEntity];
    if (!v17)
    {
      double v18 = [CKEntity alloc];
      double v19 = [v15 defaultIMHandle];
      double v17 = [(CKEntity *)v18 initWithIMHandle:v19];

      [(CKEntity *)v17 setEnlargedContactImage:1];
      [(CKAvatarPickerViewController *)self setCachedAppleEntity:v17];
    }
    [v11 configureWithEntity:v17];
  }
  else
  {
    [v11 configureWithEntity:v15];
  }
  double v20 = [v11 avatarView];
  [v20 setDelegate:self];
  [v20 setShowsContactOnTap:0];
  [v20 setForcePressView:v20];
  [v20 setUserInteractionEnabled:1];
  long long v21 = [(CKAvatarPickerViewController *)self conversation];
  unsigned int v22 = [v21 shouldHaveRoundRectAvatar];

  [v20 setStyle:v22];

  return v11;
}

- (id)_groupAvatarViewControllerRequiredContactKeys
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1BBB8] descriptorForRequiredKeys];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)_configureCollectionView:(id)a3 groupIdentityCellForItemAtIndexPath:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v30 = a4;
  long long v32 = [(CKAvatarPickerViewController *)self conversation];
  long long v31 = [(CKAvatarPickerViewController *)self _groupAvatarViewControllerRequiredContactKeys];
  id v6 = objc_msgSend(v32, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v31, objc_msgSend(MEMORY[0x1E4F1BBB8], "maxContactAvatars"));
  id v7 = [(CKAvatarPickerViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  unint64_t v9 = +[CKGroupCollectionViewCell reuseIdentifier];
  [v7 registerClass:v8 forCellWithReuseIdentifier:v9];

  uint64_t v10 = [(CKAvatarPickerViewController *)self collectionView];
  uint64_t v11 = +[CKGroupCollectionViewCell reuseIdentifier];
  double v12 = [v10 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v30];

  groupAvatarViewController = self->_groupAvatarViewController;
  int v14 = IMOSLoggingEnabled();
  if (groupAvatarViewController)
  {
    if (v14)
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "GroupAvatarViewController is not nil. We should just update the identity.", buf, 2u);
      }
    }
  }
  else
  {
    if (v14)
    {
      unsigned int v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "GroupAvatarViewController is nil. Creating a new one.", buf, 2u);
      }
    }
    uint64_t v23 = (CNGroupAvatarViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1BBB8]), "initWithGroup:", v6, v29);
    int v24 = self->_groupAvatarViewController;
    self->_groupAvatarViewController = v23;
  }
  if (v12)
  {
    double v16 = [(CNGroupAvatarViewController *)self->_groupAvatarViewController view];
    [v12 setAvatarView:v16];

    if (IMOSLoggingEnabled())
    {
      double v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        double v18 = [v12 recursiveDescription];
        double v19 = [v12 superview];
        double v20 = [v19 recursiveDescription];
        long long v21 = [v12 subviews];
        *(_DWORD *)buf = 138412802;
        v34 = v18;
        __int16 v35 = 2112;
        v36 = v20;
        __int16 v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Setting content view for groupCollectionViewCell:%@ ; superview:%@ ; subviews:%@",
          buf,
          0x20u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "groupCollectionViewCell is nil.", buf, 2u);
    }
  }
  if (groupAvatarViewController) {
    [(CNGroupAvatarViewController *)self->_groupAvatarViewController groupIdentityDidUpdate:v6];
  }
  if (IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v12 subviews];
      *(_DWORD *)buf = 138412290;
      v34 = v27;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Returning cell subview = %@", buf, 0xCu);
    }
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CKAvatarPickerViewController *)self collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else if ([(CKConversation *)self->_conversation isBusinessConversation])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = [(CKAvatarPickerViewController *)self layout];
  uint64_t v6 = [v5 layoutMode];

  if (v6 == 3)
  {
    [(CKAvatarPickerViewController *)self beganTouchingAvatarView];
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = [(CKAvatarPickerViewController *)self layout];
  uint64_t v6 = [v5 layoutMode];

  if (v6 == 3)
  {
    [(CKAvatarPickerViewController *)self endedTouchingAvatarView];
  }
}

- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(CKAvatarPickerViewController *)self groupAvatarViewController];
  unint64_t v9 = [v8 view];

  uint64_t v10 = [(CKAvatarPickerViewController *)self collectionView];
  objc_msgSend(v7, "convertPoint:toView:", v10, x, y);
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [v9 frame];
  v16.double x = v12;
  v16.double y = v14;
  LOBYTE(v10) = CGRectContainsPoint(v17, v16);

  return (char)v10;
}

- (BOOL)shouldBeginTouchingAvatarView
{
  id v3 = [(CKAvatarPickerViewController *)self conversation];
  id v4 = [v3 chat];
  char v5 = [v4 isStewieChat];

  if (v5) {
    return 0;
  }
  id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isTranscriptSharingEnabled];

  if (v8)
  {
    unint64_t v9 = [(CKAvatarPickerViewController *)self conversation];
    uint64_t v10 = [v9 chat];
    char v11 = [v10 isStewieSharingChat];

    if (v11) {
      return 0;
    }
  }
  if (IMIsOscarEnabled()
    && (+[CKConversationList sharedConversationList],
        CGFloat v12 = objc_claimAutoreleasedReturnValue(),
        [(CKAvatarPickerViewController *)self conversation],
        double v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v12 primaryFilterModeForConversation:v13],
        v13,
        v12,
        v14 == 9))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

- (void)beganTouchingAvatarView
{
  if ([(CKAvatarPickerViewController *)self shouldBeginTouchingAvatarView])
  {
    id v3 = [(CKAvatarPickerViewController *)self collectionView];
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    char v5 = [v3 cellForItemAtIndexPath:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __55__CKAvatarPickerViewController_beganTouchingAvatarView__block_invoke;
      v7[3] = &unk_1E5620AF8;
      id v8 = v5;
      unint64_t v9 = self;
      [v6 animateWithDuration:v7 animations:0.3];
    }
  }
}

void __55__CKAvatarPickerViewController_beganTouchingAvatarView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avatarView];
  [v2 setAlpha:0.3];

  id v3 = [*(id *)(a1 + 40) titleView];
  [v3 setAlpha:0.3];
}

- (void)endedTouchingAvatarView
{
  id v3 = [(CKAvatarPickerViewController *)self collectionView];
  id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  char v5 = [v3 cellForItemAtIndexPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__CKAvatarPickerViewController_endedTouchingAvatarView__block_invoke;
    v7[3] = &unk_1E5620AF8;
    id v8 = v5;
    unint64_t v9 = self;
    [v6 animateWithDuration:v7 animations:0.3];
  }
}

void __55__CKAvatarPickerViewController_endedTouchingAvatarView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avatarView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 40) titleView];
  [v3 setAlpha:1.0];
}

- (void)tappedAvatarPickerViewController
{
  id v3 = [(CKAvatarPickerViewController *)self delegate];
  [v3 tappedAvatarPickerViewController];

  [(CKAvatarPickerViewController *)self endedTouchingAvatarView];
}

- (int64_t)avatarTitleAccessoryImageType
{
  id v3 = [(CKAvatarPickerViewController *)self conversation];
  char v4 = [v3 hasVerifiedBusiness];

  if (v4) {
    return 1;
  }
  uint64_t v6 = [(CKAvatarPickerViewController *)self conversation];
  char v7 = [v6 isStewieConversation];

  if (v7) {
    return 4;
  }
  id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isKeyTransparencyEnabled];

  if (!v9 || !IMIsEnrolledInContactKeyVerification()) {
    return 0;
  }

  return [(CKAvatarPickerViewController *)self _KTAvatarTitleAccessoryImageType];
}

- (int64_t)_KTAvatarTitleAccessoryImageType
{
  id v3 = [(CKAvatarPickerViewController *)self conversation];
  char v4 = [v3 sendingService];
  int v5 = [v4 supportsCapability:*MEMORY[0x1E4F6E070]];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(CKAvatarPickerViewController *)self conversation];
  char v7 = [v6 chat];
  uint64_t v10 = 0;
  unint64_t v8 = [v7 keyTransparencyStatusForAffectedHandles:&v10];

  if (v8 > 0xE) {
    return 2;
  }
  else {
    return qword_18F81CF28[v8];
  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CKAvatarTitleCollectionReusableView)titleView
{
  return self->_titleView;
}

- (int64_t)indicatorType
{
  return self->_indicatorType;
}

- (CKAvatarPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKAvatarPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setGroupAvatarViewController:(id)a3
{
}

- (CKAvatarPickerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CNContactStore)suggestionsEnabledContactStore
{
  return self->_suggestionsEnabledContactStore;
}

- (void)setSuggestionsEnabledContactStore:(id)a3
{
}

- (NSMapTable)visibleTitleViews
{
  return self->_visibleTitleViews;
}

- (void)setVisibleTitleViews:(id)a3
{
}

- (CKEntity)cachedAppleEntity
{
  return self->_cachedAppleEntity;
}

- (void)setCachedAppleEntity:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (NSObject)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_cachedAppleEntity, 0);
  objc_storeStrong((id *)&self->_visibleTitleViews, 0);
  objc_storeStrong((id *)&self->_suggestionsEnabledContactStore, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end