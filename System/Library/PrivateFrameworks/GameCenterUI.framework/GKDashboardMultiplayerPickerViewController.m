@interface GKDashboardMultiplayerPickerViewController
- (BOOL)composeTextViewShowingPlaceholderText;
- (BOOL)excludesContacts;
- (BOOL)hasData;
- (BOOL)isAnimatingComposeTextViewSizeChange;
- (BOOL)nearbyOnly;
- (BOOL)recipientRemovedImplicitly;
- (BOOL)shouldIgnoreClearSelection;
- (BOOL)skipAddressTokenization;
- (BOOL)supportsNearby;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usePreferredFocusCell;
- (CNComposeRecipientTextView)composeTextView;
- (CNContactPickerViewController)contactPicker;
- (GKDashboardMultiplayerPickerDelegate)multiplayerPickerDelegate;
- (GKDashboardMultiplayerPickerViewController)initWithMaxSelectable:(int64_t)a3 hiddenPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6;
- (GKDashboardNearbyBrowserDelegate)nearbyDelegate;
- (GKPickerSearchTextField)searchTextField;
- (NSLayoutConstraint)composeTextViewContainerBackgroundHeightConstraint;
- (NSLayoutConstraint)composeTextViewHeightConstraint;
- (NSLayoutConstraint)customizeMessageBottomConstraint;
- (NSLayoutConstraint)leftBarButtonTopConstraint;
- (NSLayoutConstraint)navigationHeaderHeightConstraint;
- (NSLayoutConstraint)rightBarButtonTopConstraint;
- (NSMutableDictionary)recipientMap;
- (NSMutableDictionary)recipientPlayerMap;
- (NSMutableDictionary)removedRecipientPlayerMap;
- (NSString)message;
- (UIButton)cancelButton;
- (UIButton)customizeMessageButton;
- (UIButton)navBarMessageButton;
- (UIButton)navBarSendButton;
- (UIButton)sendButton;
- (UIButton)showContactPickerButton;
- (UIEdgeInsets)collectionSectionInset;
- (UILabel)collapsedSubtitle;
- (UILabel)collapsedTitle;
- (UILabel)descriptionLabel;
- (UILabel)headerSubtitle;
- (UILabel)headerTitle;
- (UIStackView)headerContentView;
- (UITextField)messageField;
- (UIView)collapsedTitleContainer;
- (UIView)composeTextViewContainer;
- (UIView)composeTextViewContainerBackground;
- (UIView)dividerLine;
- (UIVisualEffectView)backgroundEffectView;
- (UIVisualEffectView)navigationVisualEffectBackground;
- (double)initialCustomizeMessageBottomConstraintConstant;
- (double)keyboardHeight;
- (id)blurEffectForTraitCollection:(id)a3;
- (id)completionHandler;
- (id)composedNameForSuggestedMessageGroup:(id)a3;
- (id)createSortPickerMenu;
- (id)preferredFocusEnvironments;
- (id)searchFieldPlaceHolderText;
- (int64_t)pickerOrigin;
- (void)_updateButtonEnableState;
- (void)_updateCollectionView;
- (void)addMessage:(id)a3;
- (void)addRecipientForPlayers:(id)a3 withName:(id)a4;
- (void)adjustCustomizeMessageConstraint;
- (void)cancel:(id)a3;
- (void)clearSelection;
- (void)collapseHeaderView;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)composeRecipientViewReturnPressed:(id)a3;
- (void)configureComposeTextView;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)customInviteViewController:(id)a3 didFinishWithMessage:(id)a4;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)didBeginSearchTextEditing;
- (void)didEndSearchTextEditing;
- (void)didPressShowContactPickerButton:(id)a3;
- (void)dockHeaderViewIfNeeded;
- (void)handleSearchTextFieldReturn:(id)a3;
- (void)highlightAlreadySelectedPlayers:(id)a3 inGroup:(id)a4;
- (void)highlightRecipients:(id)a3;
- (void)pickerDatasource:(id)a3 didDeselectPlayers:(id)a4 inGroup:(id)a5;
- (void)pickerDatasource:(id)a3 didPickPlayers:(id)a4;
- (void)pickerDatasource:(id)a3 didSelectPlayers:(id)a4 inGroup:(id)a5;
- (void)pickerDatasourceDidSelectAddFriend:(id)a3;
- (void)playerGroupDidExpandInPlace;
- (void)removeRecipientWithName:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)send:(id)a3;
- (void)setBackgroundEffectView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCollapsedSubtitle:(id)a3;
- (void)setCollapsedTitle:(id)a3;
- (void)setCollapsedTitleContainer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setComposeTextView:(id)a3;
- (void)setComposeTextViewContainer:(id)a3;
- (void)setComposeTextViewContainerBackground:(id)a3;
- (void)setComposeTextViewContainerBackgroundHeightConstraint:(id)a3;
- (void)setComposeTextViewHeightConstraint:(id)a3;
- (void)setComposeTextViewShowingPlaceholderText:(BOOL)a3;
- (void)setContactPicker:(id)a3;
- (void)setCustomizeMessageBottomConstraint:(id)a3;
- (void)setCustomizeMessageButton:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setDividerLine:(id)a3;
- (void)setExcludesContacts:(BOOL)a3;
- (void)setHeaderContentView:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3;
- (void)setIsAnimatingComposeTextViewSizeChange:(BOOL)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setLeftBarButtonTopConstraint:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageField:(id)a3;
- (void)setMultiplayerPickerDelegate:(id)a3;
- (void)setNavBarMessageButton:(id)a3;
- (void)setNavBarSendButton:(id)a3;
- (void)setNavigationHeaderHeightConstraint:(id)a3;
- (void)setNavigationVisualEffectBackground:(id)a3;
- (void)setNearbyDelegate:(id)a3;
- (void)setPickerOrigin:(int64_t)a3;
- (void)setRecipientMap:(id)a3;
- (void)setRecipientPlayerMap:(id)a3;
- (void)setRecipientRemovedImplicitly:(BOOL)a3;
- (void)setRemovedRecipientPlayerMap:(id)a3;
- (void)setRightBarButtonTopConstraint:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSearchTextField:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setShouldIgnoreClearSelection:(BOOL)a3;
- (void)setShowContactPickerButton:(id)a3;
- (void)setSkipAddressTokenization:(BOOL)a3;
- (void)setSupportsNearby:(BOOL)a3;
- (void)setUsePreferredFocusCell:(BOOL)a3;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)showCollapsedTitleAndSubtitleInNavBar;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAddMessageButtonVisibility;
- (void)updateCollectionViewContentInsets;
- (void)updateNavHeaderHeightAndOpacity;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willHideKeyboard:(id)a3;
- (void)willShowKeyboard:(id)a3;
@end

@implementation GKDashboardMultiplayerPickerViewController

- (GKDashboardMultiplayerPickerViewController)initWithMaxSelectable:(int64_t)a3 hiddenPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  v11 = [(id)objc_opt_class() _gkPlatformNibName];
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v17.receiver = self;
  v17.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  v13 = [(GKDashboardCollectionViewController *)&v17 initWithNibName:v11 bundle:v12];

  if (v13)
  {
    v14 = [[GKDashboardMultiplayerPickerDataSource alloc] initWithMaxSelectable:a3 previouslyInvitedPlayers:v10 nearbyOnly:v7 pickerOrigin:a6];
    [(GKDashboardMultiplayerPickerDataSource *)v14 setDelegate:v13];
    [(GKCollectionDataSource *)v14 setBreakSearchInputTextIntoMultipleTerms:0];
    [(GKCollectionDataSource *)v14 setPresentationViewController:v13];
    [(GKDashboardCollectionViewController *)v13 setDataSource:v14];
    [(GKLoadingViewController *)v13 setLoadingIndicatorDelay:0.0];
    if ([v10 count])
    {
      v15 = [MEMORY[0x1E4F637F8] reporter];
      [v15 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63288]];
    }
    [(GKDashboardMultiplayerPickerViewController *)v13 setPickerOrigin:a6];
  }
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardMultiplayerPickerViewController *)&v8 viewWillDisappear:a3];
  v4 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  [v4 setDelegate:0];

  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    (*((void (**)(id, void, void))completionHandler + 2))(completionHandler, 0, 0);
    [(GKDashboardMultiplayerPickerViewController *)self setCompletionHandler:0];
  }
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];

  BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardMultiplayerPickerViewController *)&v5 viewDidDisappear:a3];
  v4 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  [v4 setNearbyPlayersChangedHandler:0];

  [(GKDashboardCollectionViewController *)self setDataSource:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardMultiplayerPickerViewController *)&v3 viewDidLayoutSubviews];
  [(GKDashboardMultiplayerPickerViewController *)self updateCollectionViewContentInsets];
}

- (void)viewDidLoad
{
  v124.receiver = self;
  v124.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v124 viewDidLoad];
  [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  BOOL v3 = 1;
  id val = (id)objc_claimAutoreleasedReturnValue();
  [val setOnDarkBackground:1];
  v4 = [MEMORY[0x1E4F63760] local];
  if (([v4 isMultiplayerGamingRestricted] & 1) == 0) {
    BOOL v3 = [(GKDashboardMultiplayerPickerViewController *)self pickerOrigin] != 1;
  }
  [(GKDashboardMultiplayerPickerViewController *)self setExcludesContacts:v3];

  objc_initWeak(&location, self);
  objc_super v5 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
  v6 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  [v6 setPlaceholder:v5];

  BOOL v7 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  [v7 setDelegate:self];

  [(GKDashboardMultiplayerPickerViewController *)self configureComposeTextView];
  objc_super v8 = [(GKDashboardCollectionViewController *)self collectionView];
  [(GKDashboardCollectionViewController *)self setAutoWidthUsesTwoColumnsWhenSpace:0];
  [v8 setPrefetchingEnabled:0];
  v9 = [(GKDashboardMultiplayerPickerViewController *)self navigationController];
  id v10 = [v9 navigationBar];
  [v10 setPrefersLargeTitles:0];

  id v11 = objc_alloc(MEMORY[0x1E4FB19D8]);
  v12 = [(GKDashboardMultiplayerPickerViewController *)self navigationController];
  v13 = [v12 navigationBar];
  v14 = [v13 standardAppearance];
  v15 = (void *)[v11 initWithBarAppearance:v14];

  [v15 configureWithTransparentBackground];
  v16 = [MEMORY[0x1E4FB1618] clearColor];
  [v15 setShadowColor:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  [v15 setShadowImage:v17];

  v18 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
  [v18 setStandardAppearance:v15];

  v19 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
  [v19 setScrollEdgeAppearance:v15];

  id v20 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v20 setSpacing:28.0];
  [v20 setAxis:0];
  [v20 setDistribution:3];
  [v20 setAlignment:3];
  v112 = v15;
  v113 = v8;
  v21 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v115 = [v21 statusBarOrientation];

  v22 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2948]];
  v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.bubble" withConfiguration:v22];
  v24 = [v23 imageWithRenderingMode:2];

  v25 = +[GKFocusableButton buttonWithType:1];
  [v25 setImage:v24 forState:0];
  [v25 addTarget:self action:sel_addMessage_ forEvents:0x2000];
  [v20 addArrangedSubview:v25];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [v25 widthAnchor];
  v27 = [v25 heightAnchor];
  [v24 size];
  double v29 = v28;
  [v24 size];
  v31 = [v26 constraintEqualToAnchor:v27 multiplier:v29 / v30];
  [v31 setActive:1];

  v32 = [MEMORY[0x1E4FB1618] labelColor];
  [v25 setTintColor:v32];

  v33 = GKGameCenterUIFrameworkBundle();
  v34 = GKGetLocalizedStringFromTableInBundle();
  [v25 setAccessibilityLabel:v34];

  [(GKDashboardMultiplayerPickerViewController *)self setNavBarMessageButton:v25];
  v35 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2990]];
  v36 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
  uint64_t v37 = [v35 configurationByApplyingConfiguration:v36];

  v38 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.fill" withConfiguration:v37];
  v39 = [v38 imageWithRenderingMode:2];
  v111 = (void *)v37;

  v40 = +[GKFocusableButton buttonWithType:1];
  [v40 setImage:v39 forState:0];
  [v40 addTarget:self action:sel_send_ forEvents:0x2000];
  [v20 addArrangedSubview:v40];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  v41 = [v40 widthAnchor];
  v42 = [v40 heightAnchor];
  [v39 size];
  double v44 = v43;
  [v39 size];
  v46 = [v41 constraintEqualToAnchor:v42 multiplier:v44 / v45];
  [v46 setActive:1];

  v47 = [MEMORY[0x1E4FB1618] labelColor];
  [v40 setTintColor:v47];

  v48 = GKGameCenterUIFrameworkBundle();
  v49 = GKGetLocalizedStringFromTableInBundle();
  [v40 setAccessibilityLabel:v49];

  [(GKDashboardMultiplayerPickerViewController *)self setNavBarSendButton:v40];
  v110 = v39;
  id v50 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v50 addSubview:v20];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v51 = [v20 leadingAnchor];
  v52 = [v50 leadingAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v53 setActive:1];

  v54 = [v20 trailingAnchor];
  v55 = [v50 trailingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [v20 bottomAnchor];
  v58 = [v50 bottomAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v59 setActive:1];

  v60 = [v20 topAnchor];
  v61 = [v50 topAnchor];
  if ((unint64_t)(v115 - 1) < 2
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        v62 = objc_claimAutoreleasedReturnValue(),
        uint64_t v63 = [v62 userInterfaceIdiom],
        v62,
        double v64 = 3.0,
        v63 == 1))
  {
    double v64 = 0.0;
  }
  v65 = [v60 constraintEqualToAnchor:v61 constant:v64];
  [(GKDashboardMultiplayerPickerViewController *)self setRightBarButtonTopConstraint:v65];

  v66 = [(GKDashboardMultiplayerPickerViewController *)self rightBarButtonTopConstraint];
  [v66 setActive:1];

  v67 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v50];
  v68 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
  [v68 setRightBarButtonItem:v67];

  v69 = [MEMORY[0x1E4FB1618] whiteColor];
  v70 = [(GKDashboardMultiplayerPickerViewController *)self navigationController];
  v71 = [v70 navigationBar];
  [v71 setTintColor:v69];

  v72 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  uint64_t v73 = *MEMORY[0x1E4FB2798];
  [v72 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2798]];

  v74 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  [v74 setMaximumContentSizeCategory:v73];

  objc_initWeak(&from, val);
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke;
  v118[3] = &unk_1E5F641B0;
  objc_copyWeak(&v120, &location);
  objc_copyWeak(&v121, &from);
  id v75 = v113;
  id v119 = v75;
  [val setNearbyPlayersChangedHandler:v118];
  [(GKDashboardMultiplayerPickerViewController *)self _updateCollectionView];
  [(NSLayoutConstraint *)self->_customizeMessageBottomConstraint constant];
  self->_initialCustomizeMessageBottomConstraintConstant = v76;
  [(GKDashboardMultiplayerPickerViewController *)self adjustCustomizeMessageConstraint];
  v114 = v75;
  v77 = [(GKDashboardCollectionViewController *)self dataSource];
  uint64_t v78 = [v77 maxSelectable];

  v79 = NSString;
  v80 = GKGameCenterUIFrameworkBundle();
  v81 = GKGetLocalizedStringFromTableInBundle();
  v82 = [val selectedPlayers];
  v116 = objc_msgSend(v79, "localizedStringWithFormat:", v81, objc_msgSend(v82, "count"), v78);

  [(GKDashboardMultiplayerPickerViewController *)self pickerOrigin];
  v83 = GKGameCenterUIFrameworkBundle();
  v84 = GKGetLocalizedStringFromTableInBundle();

  v85 = [(GKDashboardMultiplayerPickerViewController *)self navigationVisualEffectBackground];
  v86 = [v85 layer];
  [v86 setAllowsGroupBlending:0];

  v87 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  [v87 setText:v84];

  v88 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  [v88 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.HeaderTitle"];

  v89 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  [v89 setNumberOfLines:1];

  v90 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  [v90 setAdjustsFontSizeToFitWidth:1];

  v91 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  [v91 setText:v116];

  v92 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  [v92 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.HeaderSubtitle"];

  v93 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  v94 = [v93 text];
  v95 = [(GKDashboardMultiplayerPickerViewController *)self collapsedSubtitle];
  [v95 setText:v94];

  v96 = [(GKDashboardMultiplayerPickerViewController *)self collapsedSubtitle];
  [v96 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.CollapsedSubtitle"];

  v97 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2988]];
  v98 = [v97 fontDescriptorWithSymbolicTraits:2];

  v99 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v98 size:0.0];
  v100 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  [v100 setFont:v99];

  v101 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  v102 = [v101 layer];
  [v102 setCompositingFilter:*MEMORY[0x1E4F3A2E8]];

  [(GKDashboardMultiplayerPickerViewController *)self setTitle:0];
  v103 = [(GKDashboardMultiplayerPickerViewController *)self showContactPickerButton];
  [v103 setHidden:1];

  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
  v104 = GKGameCenterUIFrameworkBundle();
  v105 = GKGetLocalizedStringFromTableInBundle();
  v106 = [(GKDashboardMultiplayerPickerViewController *)self customizeMessageButton];
  [v106 setAccessibilityLabel:v105];

  v107 = GKGameCenterUIFrameworkBundle();
  v108 = GKGetLocalizedStringFromTableInBundle();
  v109 = [(GKDashboardMultiplayerPickerViewController *)self sendButton];
  [v109 setAccessibilityLabel:v108];

  [(GKDashboardMultiplayerPickerViewController *)self setUsePreferredFocusCell:1];
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v8 = objc_loadWeakRetained(a1 + 6);
  v9 = v8;
  if (WeakRetained && v8)
  {
    id v10 = [a1[4] cellForItemAtIndexPath:v5];
    char v11 = [v10 isSelected];

    BOOL v12 = [v9 itemCount] == 0;
    v13 = [WeakRetained noContentView];
    [v13 setLoading:v12];

    id v14 = a1[4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_2;
    v19[3] = &unk_1E5F63E80;
    id v20 = v5;
    id v21 = a1[4];
    id v22 = v6;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_3;
    v15[3] = &unk_1E5F64188;
    id v16 = WeakRetained;
    char v18 = v11;
    id v17 = v22;
    [v14 performBatchUpdates:v19 completion:v15];
  }
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    v2 = (void *)a1[5];
    v8[0] = a1[4];
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v2 deleteItemsAtIndexPaths:v3];
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    id v5 = (void *)a1[5];
    uint64_t v7 = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [v5 insertItemsAtIndexPaths:v6];
  }
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateButtonEnableState];
  if (*(unsigned char *)(a1 + 48) && *(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) pickerDataSource];
    [v2 selectItemAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v47.receiver = self;
  v47.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v47 viewWillAppear:a3];
  uint64_t v4 = [(GKDashboardMultiplayerPickerViewController *)self backgroundEffectView];
  if (v4) {
    goto LABEL_4;
  }
  if ([(GKDashboardMultiplayerPickerViewController *)self pickerOrigin] == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1F00]);
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self traitCollection];
    uint64_t v7 = [(GKDashboardMultiplayerPickerViewController *)self blurEffectForTraitCollection:v6];
    uint64_t v4 = (void *)[v5 initWithEffect:v7];

    id v8 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
    [v4 setBackgroundEffects:v8];

    [v4 _setGroupName:@"gameLayerGroup"];
    v9 = [(GKDashboardMultiplayerPickerViewController *)self view];
    [v9 bounds];
    objc_msgSend(v4, "setFrame:");

    [v4 setAutoresizingMask:18];
    id v10 = [(GKDashboardMultiplayerPickerViewController *)self view];
    [v10 insertSubview:v4 atIndex:0];

    [(GKDashboardMultiplayerPickerViewController *)self setBackgroundEffectView:v4];
LABEL_4:
  }
  char v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_willShowKeyboard_ name:*MEMORY[0x1E4FB2C58] object:0];

  BOOL v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:self selector:sel_willHideKeyboard_ name:*MEMORY[0x1E4FB2C50] object:0];

  v13 = [(GKDashboardMultiplayerPickerViewController *)self navigationController];
  id v14 = [v13 viewControllers];
  uint64_t v15 = [v14 count];

  if (v15 == 1)
  {
    id v16 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
    id v17 = [v16 leftBarButtonItem];

    if (!v17)
    {
      char v18 = [MEMORY[0x1E4FB1438] sharedApplication];
      unint64_t v19 = [v18 statusBarOrientation] - 1;

      id v20 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      id v21 = +[GKFocusableButton buttonWithType:1];
      id v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [v21 setFont:v22];

      v23 = GKGameCenterUIFrameworkBundle();
      v24 = GKGetLocalizedStringFromTableInBundle();
      [v21 setTitle:v24 forState:0];

      [v21 addTarget:self action:sel_cancel_ forEvents:0x2000];
      v25 = [MEMORY[0x1E4FB1618] labelColor];
      [v21 setTintColor:v25];

      uint64_t v26 = *MEMORY[0x1E4F3A2E8];
      v27 = [v21 layer];
      [v27 setCompositingFilter:v26];

      double v28 = [v21 titleLabel];
      [v28 setAdjustsFontForContentSizeCategory:1];

      [v21 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
      [v20 addSubview:v21];
      [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v29 = [v21 leadingAnchor];
      double v30 = [v20 leadingAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [v21 trailingAnchor];
      v33 = [v20 trailingAnchor];
      v34 = [v32 constraintEqualToAnchor:v33];
      [v34 setActive:1];

      v35 = [v21 bottomAnchor];
      v36 = [v20 bottomAnchor];
      uint64_t v37 = [v35 constraintEqualToAnchor:v36];
      [v37 setActive:1];

      v38 = [v21 topAnchor];
      v39 = [v20 topAnchor];
      double v40 = 0.0;
      if (v19 >= 2)
      {
        v41 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", 0.0);
        uint64_t v42 = [v41 userInterfaceIdiom];

        double v40 = 3.0;
        if (v42 == 1) {
          double v40 = 0.0;
        }
      }
      double v43 = [v38 constraintEqualToAnchor:v39 constant:v40];
      [(GKDashboardMultiplayerPickerViewController *)self setLeftBarButtonTopConstraint:v43];

      double v44 = [(GKDashboardMultiplayerPickerViewController *)self leftBarButtonTopConstraint];
      [v44 setActive:1];

      double v45 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v20];
      v46 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
      [v46 setLeftBarButtonItem:v45];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  [(GKDashboardMultiplayerPickerViewController *)self setShouldIgnoreClearSelection:1];
  v13.receiver = self;
  v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v13 viewDidAppear:v3];
  id v5 = [(GKDashboardMultiplayerPickerViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  [(GKDashboardMultiplayerPickerViewController *)self _gkConfigureFocusGuidesForNavigationBar:v6];

  uint64_t v7 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v8 = *MEMORY[0x1E4F63558];
  uint64_t v9 = *MEMORY[0x1E4F632E0];
  uint64_t v10 = *MEMORY[0x1E4F632F0];
  v14[0] = *MEMORY[0x1E4F632F8];
  v14[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F63320];
  v15[0] = *MEMORY[0x1E4F63328];
  v15[1] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v7 reportEvent:v8 type:v9 payload:v12];
}

- (void)updateCollectionViewContentInsets
{
  id v8 = [(GKDashboardMultiplayerPickerViewController *)self headerContentView];
  [v8 frame];
  double v4 = v3 + 16.0;
  [(GKDashboardMultiplayerPickerViewController *)self keyboardHeight];
  double v6 = v5 + 16.0;
  uint64_t v7 = [(GKDashboardCollectionViewController *)self collectionView];
  objc_msgSend(v7, "setContentInset:", v4, 0.0, v6, 0.0);
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
    double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      id v9 = [(GKDashboardMultiplayerPickerViewController *)self presentingViewController];
      if (v9)
      {
        [(NSLayoutConstraint *)self->_customizeMessageBottomConstraint setConstant:self->_initialCustomizeMessageBottomConstraintConstant];
      }
      else
      {
        double v6 = [(GKDashboardMultiplayerPickerViewController *)self tabBarController];
        uint64_t v7 = [v6 tabBar];
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
  v9.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  id v7 = a4;
  -[GKDashboardMultiplayerPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __97__GKDashboardMultiplayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F641D8;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_12];
}

void __97__GKDashboardMultiplayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) adjustCustomizeMessageConstraint];
  if (*(double *)(a1 + 40) >= *(double *)(a1 + 48))
  {
    double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1) {
      double v6 = 0.0;
    }
    else {
      double v6 = 3.0;
    }
    id v7 = [*(id *)(a1 + 32) rightBarButtonTopConstraint];
    [v7 setConstant:v6];

    double v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (v9 == 1) {
      double v3 = 0.0;
    }
    else {
      double v3 = 3.0;
    }
  }
  else
  {
    BOOL v2 = [*(id *)(a1 + 32) rightBarButtonTopConstraint];
    double v3 = 0.0;
    [v2 setConstant:0.0];
  }
  id v10 = [*(id *)(a1 + 32) leftBarButtonTopConstraint];
  [v10 setConstant:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v12 traitCollectionDidChange:v4];
  if (![(GKDashboardCollectionViewController *)self isLoading])
  {
    [(GKDashboardMultiplayerPickerViewController *)self _updateCollectionView];
    [(GKDashboardMultiplayerPickerViewController *)self updateNavHeaderHeightAndOpacity];
    uint64_t v5 = [(GKDashboardMultiplayerPickerViewController *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];

    id v7 = [v4 preferredContentSizeCategory];

    if (v7 != v6)
    {
      double v8 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v9 = [(GKDashboardCollectionViewController *)self collectionView];
      id v10 = objc_msgSend(v8, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "numberOfSections"));

      uint64_t v11 = [(GKDashboardCollectionViewController *)self collectionView];
      [v11 reloadSections:v10];
    }
  }
}

- (id)blurEffectForTraitCollection:(id)a3
{
  BOOL v3 = [a3 userInterfaceStyle] == 2;
  id v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:2 * v3];

  return v4;
}

- (void)configureComposeTextView
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(GKDashboardMultiplayerPickerViewController *)self setRecipientMap:v3];

  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [(GKDashboardMultiplayerPickerViewController *)self setRecipientPlayerMap:v4];

  [MEMORY[0x1E4F5A160] preferredHeight];
  double v6 = v5;
  id v7 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
  [v7 setConstant:v6];

  id v28 = objc_alloc_init(MEMORY[0x1E4F5A160]);
  [v28 setDelegate:self];
  double v8 = NSString;
  uint64_t v9 = GKGameCenterUIFrameworkBundle();
  id v10 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v10, &stru_1F07B2408);
  [v28 setLabel:v11];

  objc_super v12 = [v28 textView];
  [v12 setTextAlignment:4];

  [v28 setSeparatorHidden:1];
  objc_super v13 = [MEMORY[0x1E4FB1618] clearColor];
  [v28 setBackgroundColor:v13];

  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v28 setTintColor:v14];

  uint64_t v15 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  id v16 = [v28 textView];
  [v16 setTextColor:v15];

  id v17 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
  char v18 = [v28 textView];
  [v18 setText:v17];

  [(GKDashboardMultiplayerPickerViewController *)self setComposeTextViewShowingPlaceholderText:1];
  [v28 setShowsAddButtonWhenExpanded:0];
  unint64_t v19 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewContainer];
  [v19 addSubview:v28];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v20 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewContainerBackground];
  [v20 removeFromSuperview];

  id v21 = (void *)MEMORY[0x1E4F28DC8];
  id v22 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewContainer];
  objc_msgSend(v21, "_gkInstallEdgeConstraintsForView:containedWithinParentView:edgeInsets:", v28, v22, 5.0, -6.0, 0.0, 6.0);

  [(GKDashboardMultiplayerPickerViewController *)self setComposeTextView:v28];
  v23 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  v24 = [v23 label];
  [v24 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.composeSection.label"];

  v25 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  [v25 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.composeSection"];

  uint64_t v26 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  v27 = [v26 textView];
  [v27 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.composeSection.placeHolderText"];
}

- (void)addRecipientForPlayers:(id)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v20 = [[GKComposeRecipient alloc] initWithContact:0 address:v6 kind:5];
  double v8 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
  [v8 setObject:v20 forKeyedSubscript:v6];

  uint64_t v9 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
  [v9 setObject:v7 forKeyedSubscript:v20];

  id v10 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  [v10 addRecipient:v20];

  uint64_t v11 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  objc_super v12 = [v11 atomViewForRecipient:v20];

  objc_super v13 = [MEMORY[0x1E4FB1618] whiteColor];
  id v14 = [v13 colorWithAlphaComponent:0.1];
  [v12 setBackgroundColor:v14];

  uint64_t v15 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v12 setTintColor:v15];

  id v16 = [MEMORY[0x1E4FB1618] labelColor];
  id v17 = [v12 titleLabel];
  [v17 setTextColor:v16];

  uint64_t v18 = *MEMORY[0x1E4F3A2E8];
  unint64_t v19 = [v12 layer];
  [v19 setCompositingFilter:v18];
}

- (void)removeRecipientWithName:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v11 = v4;
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
    id v7 = [v6 objectForKeyedSubscript:v11];

    [(GKDashboardMultiplayerPickerViewController *)self setRecipientRemovedImplicitly:1];
    double v8 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
    [v8 removeRecipient:v7];

    [(GKDashboardMultiplayerPickerViewController *)self setRecipientRemovedImplicitly:0];
    if (v7)
    {
      uint64_t v9 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
      [v9 removeObjectForKey:v7];
    }
    id v10 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
    [v10 removeObjectForKey:v11];

    id v5 = v11;
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)highlightRecipients:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        uint64_t v9 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
        id v10 = [v9 atomViewForRecipient:v8];

        id v11 = (void *)MEMORY[0x1E4FB1EB0];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke;
        v16[3] = &unk_1E5F62EB0;
        id v17 = v10;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_2;
        v14[3] = &unk_1E5F63198;
        id v15 = v17;
        id v12 = v17;
        [v11 animateWithDuration:v16 animations:v14 completion:0.25];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  BOOL v2 = [v3 colorWithAlphaComponent:0.4];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_3;
  v2[3] = &unk_1E5F62EB0;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0.25];
}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  BOOL v2 = [v3 colorWithAlphaComponent:0.12];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

- (void)setMessage:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    uint64_t v4 = (NSString *)[v7 copy];
    message = self->_message;
    self->_message = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageField);
    [WeakRetained setText:v7];
  }
}

- (BOOL)supportsNearby
{
  BOOL v2 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  char v3 = [v2 supportsNearby];

  return v3;
}

- (void)setSupportsNearby:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  [v5 setSupportsNearby:v3];

  id v7 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
  uint64_t v6 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  [v6 setPlaceholder:v7];
}

- (BOOL)nearbyOnly
{
  BOOL v2 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  char v3 = [v2 nearbyOnly];

  return v3;
}

- (void)setNearbyDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  [v5 setNearbyDelegate:v4];
}

- (BOOL)hasData
{
  return 1;
}

- (id)searchFieldPlaceHolderText
{
  [(GKDashboardMultiplayerPickerViewController *)self excludesContacts];
  BOOL v2 = GKGameCenterUIFrameworkBundle();
  char v3 = GKGetLocalizedStringFromTableInBundle();

  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  id v5 = [v4 textView];
  int v6 = [v5 isFirstResponder];

  if (v6)
  {
    [(GKDashboardMultiplayerPickerViewController *)self setSkipAddressTokenization:1];
    id v7 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
    uint64_t v8 = [v7 textView];
    [v8 resignFirstResponder];

    [(GKDashboardMultiplayerPickerViewController *)self setSkipAddressTokenization:0];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  id v4 = [(GKDashboardCollectionViewController *)self collectionView];
  if (v4 == v6)
  {
    BOOL v5 = [(GKDashboardMultiplayerPickerViewController *)self isAnimatingComposeTextViewSizeChange];

    if (!v5) {
      [(GKDashboardMultiplayerPickerViewController *)self updateNavHeaderHeightAndOpacity];
    }
  }
  else
  {
  }
}

- (void)updateNavHeaderHeightAndOpacity
{
  char v3 = [(GKDashboardCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;

  id v6 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  if ([v6 horizontalSizeClass] == 1)
  {
    id v7 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    BOOL v8 = [v7 verticalSizeClass] != 2;
  }
  else
  {
    BOOL v8 = 1;
  }

  uint64_t v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1 || v8)
  {
    id v11 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
    [v11 constant];
    double v13 = v14;
  }
  else
  {
    id v11 = [(GKDashboardMultiplayerPickerViewController *)self headerContentView];
    [v11 frame];
    double v13 = v12;
  }

  id v15 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v15 safeAreaInsets];
  double v17 = v13 + v16 + 16.0;

  long long v18 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v18 safeAreaInsets];
  double v20 = -v5 - v19 + -16.0;

  if (v13 >= v20) {
    double v20 = v13;
  }
  long long v21 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
  [v21 setConstant:v20];

  double v22 = (v5 + v17) / 24.0;
  if (v22 > 1.0) {
    double v22 = 1.0;
  }
  float v23 = fmax(v22, 0.0);
  v24 = [(GKDashboardMultiplayerPickerViewController *)self navigationVisualEffectBackground];
  v25 = [v24 layer];
  *(float *)&double v26 = v23;
  [v25 setOpacity:v26];

  v27 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  int v29 = v28 == 1 || v8;
  if (v29 == 1
    && (-[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint"), double v30 = objc_claimAutoreleasedReturnValue(), [v30 constant], v32 = v31, v30, v32 <= v13))
  {
    [(GKDashboardMultiplayerPickerViewController *)self showCollapsedTitleAndSubtitleInNavBar];
  }
  else
  {
    id v33 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
    [v33 setTitleView:0];
  }
}

- (void)showCollapsedTitleAndSubtitleInNavBar
{
  id v33 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v3 setAxis:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v5 = [(GKDashboardMultiplayerPickerViewController *)self headerTitle];
  id v6 = [v5 text];
  [v4 setText:v6];

  [v4 sizeToFit];
  id v7 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:*MEMORY[0x1E4FB2908] symbolicTraits:2];
  [v4 setFont:v7];

  BOOL v8 = [MEMORY[0x1E4FB1618] labelColor];
  [v4 setTextColor:v8];

  [v4 setAdjustsFontForContentSizeCategory:1];
  uint64_t v9 = *MEMORY[0x1E4FB27C0];
  [v4 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27C0]];
  [v3 addArrangedSubview:v4];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  id v11 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  double v12 = [v11 text];
  [v10 setText:v12];

  [v10 sizeToFit];
  double v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v10 setFont:v13];

  double v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setTextColor:v14];

  uint64_t v15 = *MEMORY[0x1E4F3A2E8];
  double v16 = [v10 layer];
  [v16 setCompositingFilter:v15];

  [v10 setAdjustsFontForContentSizeCategory:1];
  [v10 setMaximumContentSizeCategory:v9];
  [(GKDashboardMultiplayerPickerViewController *)self setCollapsedSubtitle:v10];
  [v3 addArrangedSubview:v10];
  [v3 setAlignment:3];
  [v3 setDistribution:0];
  [v33 addSubview:v3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = [v3 heightAnchor];
  long long v18 = [v17 constraintGreaterThanOrEqualToConstant:44.0];
  [v18 setActive:1];

  double v19 = [v3 bottomAnchor];
  double v20 = [v33 bottomAnchor];
  long long v21 = [v19 constraintEqualToAnchor:v20];

  LODWORD(v22) = 1144750080;
  [v21 setPriority:v22];
  [v21 setActive:1];
  float v23 = [v3 topAnchor];
  v24 = [v33 topAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v25 setActive:1];

  double v26 = [v3 leadingAnchor];
  v27 = [v33 leadingAnchor];
  uint64_t v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  int v29 = [v3 trailingAnchor];
  double v30 = [v33 trailingAnchor];
  double v31 = [v29 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  double v32 = [(GKDashboardMultiplayerPickerViewController *)self navigationItem];
  [v32 setTitleView:v33];
}

- (void)dockHeaderViewIfNeeded
{
  id v3 = [(GKDashboardCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  id v33 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
  [v33 constant];
  double v9 = v8;
  id v10 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
  [v10 constant];
  if (v9 <= v11)
  {
  }
  else
  {
    double v12 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
    [v12 constant];
    double v14 = v13;
    uint64_t v15 = [(GKDashboardMultiplayerPickerViewController *)self headerContentView];
    [v15 frame];
    double v17 = v16;

    if (v14 >= v17) {
      return;
    }
    long long v18 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
    [v18 constant];
    double v20 = v19;
    long long v21 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
    [v21 constant];
    double v23 = v20 - v22;

    v24 = [(GKDashboardMultiplayerPickerViewController *)self headerContentView];
    [v24 frame];
    double v26 = v25;
    v27 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
    [v27 constant];
    double v29 = v26 - v28;

    if (v23 >= v29 * 0.5) {
      double v30 = -(v29 - v23);
    }
    else {
      double v30 = v23;
    }
    double v31 = v7 + v30;
    double v32 = [(GKDashboardCollectionViewController *)self collectionView];
    [v32 setScrollEnabled:0];

    id v33 = [(GKDashboardCollectionViewController *)self collectionView];
    objc_msgSend(v33, "setContentOffset:animated:", 1, v5, v31);
  }
}

- (void)collapseHeaderView
{
  id v3 = [(GKDashboardCollectionViewController *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
  [v8 constant];
  double v10 = v9;
  double v11 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
  [v11 constant];
  double v13 = v12;

  if (v10 > v13)
  {
    double v14 = [(GKDashboardMultiplayerPickerViewController *)self navigationHeaderHeightConstraint];
    [v14 constant];
    double v16 = v15;
    double v17 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
    [v17 constant];
    double v19 = v16 - v18;

    double v20 = [(GKDashboardCollectionViewController *)self collectionView];
    [v20 setScrollEnabled:0];

    id v21 = [(GKDashboardCollectionViewController *)self collectionView];
    objc_msgSend(v21, "setContentOffset:animated:", 1, v5, v7 + v19);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(GKDashboardCollectionViewController *)self collectionView];

  if (v6 == v5)
  {
    [(GKDashboardMultiplayerPickerViewController *)self dockHeaderViewIfNeeded];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(GKDashboardCollectionViewController *)self collectionView];

  if (v5 == v4)
  {
    [(GKDashboardMultiplayerPickerViewController *)self dockHeaderViewIfNeeded];
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3 = [(GKDashboardCollectionViewController *)self collectionView];
  [v3 setScrollEnabled:1];
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  double v9 = [v8 searchText];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    double v11 = GKGameCenterUIFrameworkBundle();
    double v12 = GKGetLocalizedStringFromTableInBundle();
    [v6 setTitle:v12];

    [v6 setMessage:0];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v13 setupNoContentView:v6 withError:v7];
  }
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 dataUpdated:a3 withError:a4];
  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
}

- (id)preferredFocusEnvironments
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  int v4 = [v3 showsAllFriends];

  if (v4)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F28D58];
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
    id v7 = objc_msgSend(v5, "indexPathForItem:inSection:", (int)objc_msgSend(v6, "numberOfFriendsToShowInitially"), 1);

    double v8 = [(GKDashboardCollectionViewController *)self collectionView];
    double v9 = [v8 cellForItemAtIndexPath:v7];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

LABEL_8:
      goto LABEL_11;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendButton);
  if ([WeakRetained isEnabled])
  {
    id v7 = objc_loadWeakRetained((id *)&self->_sendButton);

    if (v7)
    {
      double v14 = v7;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      goto LABEL_8;
    }
  }
  else
  {
  }
  v13.receiver = self;
  v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  uint64_t v10 = [(GKDashboardCollectionViewController *)&v13 preferredFocusEnvironments];
LABEL_11:

  return v10;
}

- (id)createSortPickerMenu
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  int v4 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  uint64_t v5 = [v4 friendSortFilterScope];

  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4FB13F0];
  id v7 = GKGameCenterUIFrameworkBundle();
  double v8 = GKGetLocalizedStringFromTableInBundle();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke;
  v25[3] = &unk_1E5F64200;
  objc_copyWeak(&v26, &location);
  double v9 = [v6 actionWithTitle:v8 image:0 identifier:0 handler:v25];

  [v9 setAccessibilityIdentifier:@"GKDashBoardMultiplayerPickerView.Sort.Recents"];
  [v9 setState:v5 == 0];
  uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
  double v11 = GKGameCenterUIFrameworkBundle();
  double v12 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke_2;
  double v23 = &unk_1E5F64200;
  objc_copyWeak(&v24, &location);
  objc_super v13 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:&v20];

  objc_msgSend(v13, "setAccessibilityIdentifier:", @"GKDashBoardMultiplayerPickerView.Sort.ABC", v20, v21, v22, v23);
  [v13 setState:v5 == 1];
  double v14 = (void *)MEMORY[0x1E4FB1970];
  double v15 = GKGameCenterUIFrameworkBundle();
  double v16 = GKGetLocalizedStringFromTableInBundle();
  v28[0] = v9;
  v28[1] = v13;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  double v18 = [v14 menuWithTitle:v16 children:v17];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v18;
}

void __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);
  uint64_t v5 = [v4 pickerDataSource];
  uint64_t v6 = [v5 friendSortFilterScope];

  id v7 = objc_loadWeakRetained(&to);
  double v8 = [v7 pickerDataSource];
  [v8 setFriendSortFilterScope:0];

  if (v6)
  {
    id v9 = objc_loadWeakRetained(&to);
    uint64_t v10 = [v9 collectionView];
    double v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v10 reloadSections:v11];
  }
  objc_destroyWeak(&to);
}

void __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);
  uint64_t v5 = [v4 pickerDataSource];
  uint64_t v6 = [v5 friendSortFilterScope];

  id v7 = objc_loadWeakRetained(&to);
  double v8 = [v7 pickerDataSource];
  [v8 setFriendSortFilterScope:1];

  if (v6 != 1)
  {
    id v9 = objc_loadWeakRetained(&to);
    uint64_t v10 = [v9 collectionView];
    double v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [v10 reloadSections:v11];
  }
  objc_destroyWeak(&to);
}

- (void)pickerDatasource:(id)a3 didPickPlayers:(id)a4
{
  id v11 = a4;
  uint64_t v5 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
    double v8 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
    id v9 = [v8 selectedMessageGroups];
    uint64_t v10 = [(GKDashboardMultiplayerPickerViewController *)self message];
    [v7 multiplayerPicker:self didPickPlayers:v11 messageGroups:v9 customMessage:v10];
  }
}

- (void)pickerDatasourceDidSelectAddFriend:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    +[GKMetricsBridge recordInviteFriendClickEventWithType:2 pageType:@"multiplayer" pageId:@"friendSelect"];
    id v4 = [MEMORY[0x1E4F637E8] shared];
    int v5 = [v4 isAddingFriendsRestricted];

    if (v5)
    {
      char v6 = (void *)MEMORY[0x1E4FB1418];
      id v7 = GKGameCenterUIFrameworkBundle();
      double v8 = GKGetLocalizedStringFromTableInBundle();
      id v9 = GKGameCenterUIFrameworkBundle();
      uint64_t v10 = GKGetLocalizedStringFromTableInBundle();
      id v18 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

      id v11 = (void *)MEMORY[0x1E4FB1410];
      double v12 = GKGameCenterUIFrameworkBundle();
      objc_super v13 = GKGetLocalizedStringFromTableInBundle();
      double v14 = [v11 actionWithTitle:v13 style:0 handler:0];
      [v18 addAction:v14];

      double v15 = self;
      uint64_t v16 = (uint64_t)v18;
    }
    else
    {
      uint64_t v16 = +[GKFriendingViewControllers inviteFriendsWithContainerViewController:self];
      id v18 = (id)v16;
      double v15 = self;
    }
    -[GKDashboardMultiplayerPickerViewController presentViewController:animated:completion:](v15, "presentViewController:animated:completion:", v16, 1, 0, v18);
  }
  else
  {
    double v17 = [MEMORY[0x1E4F63660] reporter];
    [v17 recordClickWithAction:@"navigate" targetId:@"invite" targetType:@"button" pageId:@"friendSelect" pageType:@"multiplayer"];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__GKDashboardMultiplayerPickerViewController_pickerDatasourceDidSelectAddFriend___block_invoke;
    v20[3] = &unk_1E5F64228;
    v20[4] = self;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:MEMORY[0x1E4F1CBF0] chatGUID:0 completionHandler:v20];
  }
}

uint64_t __81__GKDashboardMultiplayerPickerViewController_pickerDatasourceDidSelectAddFriend___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

- (void)pickerDatasource:(id)a3 didSelectPlayers:(id)a4 inGroup:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10 && [v10 fromPeopleSuggester])
  {
    double v12 = [(GKDashboardMultiplayerPickerViewController *)self composedNameForSuggestedMessageGroup:v11];
    [(GKDashboardMultiplayerPickerViewController *)self addRecipientForPlayers:v9 withName:v12];
  }
  else
  {
    id v26 = v9;
    id v27 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v19 = objc_msgSend(v18, "displayName", v26, v27, (void)v28);
          uint64_t v20 = v19;
          if (v19)
          {
            id v21 = v19;
          }
          else
          {
            id v21 = [v18 displayNameWithOptions:0];
          }
          double v22 = v21;

          double v32 = v18;
          double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
          [(GKDashboardMultiplayerPickerViewController *)self addRecipientForPlayers:v23 withName:v22];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    id v9 = v26;
    id v8 = v27;
  }
  id v24 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  int v25 = [v24 isSearching];

  if (v25) {
    [(GKDashboardMultiplayerPickerViewController *)self didEndSearchTextEditing];
  }
  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
}

- (void)highlightAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7 && [v7 fromPeopleSuggester])
  {
    id v9 = [(GKDashboardMultiplayerPickerViewController *)self composedNameForSuggestedMessageGroup:v8];
    id v10 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
    id v11 = [v10 objectForKeyedSubscript:v9];

    if (v11)
    {
      v31[0] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [(GKDashboardMultiplayerPickerViewController *)self highlightRecipients:v12];
    }
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v25 = v6;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [v18 displayName];
          uint64_t v20 = v19;
          if (v19)
          {
            id v21 = v19;
          }
          else
          {
            id v21 = [v18 displayNameWithOptions:0];
          }
          double v22 = v21;

          double v23 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
          id v24 = [v23 objectForKeyedSubscript:v22];

          if (v24) {
            [v9 addObject:v24];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [(GKDashboardMultiplayerPickerViewController *)self highlightRecipients:v9];
    id v6 = v25;
  }
}

- (void)pickerDatasource:(id)a3 didDeselectPlayers:(id)a4 inGroup:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10 && [v10 fromPeopleSuggester])
  {
    id v12 = [(GKDashboardMultiplayerPickerViewController *)self composedNameForSuggestedMessageGroup:v11];
    id v13 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
    uint64_t v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      [(GKDashboardMultiplayerPickerViewController *)self removeRecipientWithName:v12];
      goto LABEL_16;
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v9;
  uint64_t v15 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v20 = [v19 displayName];
        id v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v22 = [v19 displayNameWithOptions:0];
        }
        double v23 = v22;

        [(GKDashboardMultiplayerPickerViewController *)self removeRecipientWithName:v23];
      }
      uint64_t v16 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v16);
  }
LABEL_16:

  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
  id v24 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  id v25 = [v24 textView];
  if (([v25 isFirstResponder] & 1) == 0)
  {
    long long v26 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
    long long v27 = [v26 recipients];
    if ([v27 count])
    {
    }
    else
    {
      [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
      long long v28 = v36 = v8;
      [v28 textView];
      v30 = id v29 = v9;
      long long v31 = [v30 text];
      uint64_t v35 = [v31 length];

      id v9 = v29;
      id v8 = v36;

      if (v35) {
        goto LABEL_21;
      }
      double v32 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
      id v33 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
      uint64_t v34 = [v33 textView];
      [v34 setText:v32];

      [(GKDashboardMultiplayerPickerViewController *)self setComposeTextViewShowingPlaceholderText:1];
      id v24 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      id v25 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
      long long v26 = [v25 textView];
      [v26 setTextColor:v24];
    }
  }
LABEL_21:
}

- (void)playerGroupDidExpandInPlace
{
}

- (void)clearSelection
{
  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKDashboardMultiplayerPickerViewController;
    [(GKDashboardCollectionViewController *)&v4 clearSelection];
    id v3 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
    [v3 clearSelection];

    [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
  }
}

- (id)composedNameForSuggestedMessageGroup:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 players];
  int v5 = [v3 groupName];
  if (![v5 length])
  {
    id v6 = [v3 players];
    uint64_t v7 = [v6 count];

    if (v7 == 1)
    {
      id v8 = [v4 objectAtIndexedSubscript:0];
      uint64_t v9 = [v8 displayNameWithOptions:0];
    }
    else
    {
      id v11 = [v3 players];
      uint64_t v12 = [v11 count];

      if (v12 == 2)
      {
        id v13 = NSString;
        id v8 = GKGameCenterUIFrameworkBundle();
        uint64_t v14 = GKGetLocalizedStringFromTableInBundle();
        uint64_t v15 = [v4 objectAtIndexedSubscript:0];
        uint64_t v16 = [v15 displayNameWithOptions:0];
        uint64_t v17 = [v4 objectAtIndexedSubscript:1];
        id v18 = [v17 displayNameWithOptions:0];
        uint64_t v10 = objc_msgSend(v13, "stringWithFormat:", v14, v16, v18);

        int v5 = (void *)v14;
        goto LABEL_11;
      }
      id v19 = [v3 players];
      uint64_t v20 = [v19 count];

      if (v20 == 3)
      {
        v41 = NSString;
        id v8 = GKGameCenterUIFrameworkBundle();
        uint64_t v40 = GKGetLocalizedStringFromTableInBundle();
        uint64_t v42 = [v4 objectAtIndexedSubscript:0];
        id v21 = [v42 displayNameWithOptions:0];
        id v22 = [v4 objectAtIndexedSubscript:1];
        double v23 = [v22 displayNameWithOptions:0];
        id v24 = [v4 objectAtIndexedSubscript:2];
        id v25 = [v24 displayNameWithOptions:0];
        uint64_t v10 = objc_msgSend(v41, "stringWithFormat:", v40, v21, v23, v25);

        int v5 = (void *)v40;
        goto LABEL_11;
      }
      long long v26 = [v3 players];
      unint64_t v27 = [v26 count];

      if (v27 >= 4)
      {
        long long v28 = NSString;
        id v29 = GKGameCenterUIFrameworkBundle();
        long long v30 = GKGetLocalizedStringFromTableInBundle();
        long long v31 = [v4 objectAtIndexedSubscript:0];
        double v32 = [v31 displayNameWithOptions:0];
        id v33 = [v4 objectAtIndexedSubscript:1];
        uint64_t v34 = [v33 displayNameWithOptions:0];
        uint64_t v35 = objc_msgSend(v28, "stringWithFormat:", v30, v32, v34);

        id v8 = GKGameCenterUIFrameworkBundle();
        int v5 = GKGetLocalizedStringFromTableInBundle();
        id v36 = NSNumber;
        long long v37 = [v3 players];
        long long v38 = objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "count") - 2);
        uint64_t v10 = objc_msgSend(v35, "stringByAppendingFormat:", v5, v38);

        goto LABEL_11;
      }
      id v8 = GKGameCenterUIFrameworkBundle();
      uint64_t v9 = GKGetLocalizedStringFromTableInBundle();
    }
    uint64_t v10 = v9;
LABEL_11:

    int v5 = (void *)v10;
  }

  return v5;
}

- (void)send:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x1E4F63660], "reporter", a3);
  [v4 recordClickWithAction:@"navigate" targetId:@"inviteFriends" targetType:@"button" pageId:@"lobby" pageType:@"multiplayer"];

  id v15 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  int v5 = [v15 selectedPlayers];
  if ([v5 count])
  {
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self message];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F637F8] reporter];
      [v8 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63340]];
    }
    [v15 pickerWillSendInvites];
    uint64_t v9 = [v15 selectedMessageGroups];
    id completionHandler = (void (**)(id, void *, NSString *))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v5, self->_message);
      [(GKDashboardMultiplayerPickerViewController *)self setCompletionHandler:0];
    }
    else
    {
      id v11 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
        uint64_t v14 = [(GKDashboardMultiplayerPickerViewController *)self message];
        [v13 multiplayerPicker:self didPickPlayers:v5 messageGroups:v9 customMessage:v14];
      }
    }
    [(UIViewController *)self _gkRemoveViewController:self animated:1];
  }
}

- (void)addMessage:(id)a3
{
  id v7 = +[NSObject _gkPlatformNibName];
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v5 = [[GKMultiplayerCustomInviteMessageViewController alloc] initWithNibName:v7 bundle:v4];
  [(GKMultiplayerCustomInviteMessageViewController *)v5 setDelegate:self];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  [v6 setOverrideUserInterfaceStyle:2];
  [(GKDashboardMultiplayerPickerViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)cancel:(id)a3
{
  id v8 = a3;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    (*((void (**)(id, void, void))completionHandler + 2))(completionHandler, 0, 0);
    [(GKDashboardMultiplayerPickerViewController *)self setCompletionHandler:0];
  }
  [(UIViewController *)self _gkRemoveViewController:self animated:1];
  int v5 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(GKDashboardMultiplayerPickerViewController *)self multiplayerPickerDelegate];
    [v7 multiplayerPickerDidCancel:self];
  }
}

- (void)updateAddMessageButtonVisibility
{
  id v3 = [MEMORY[0x1E4F637E8] shared];
  if ([v3 shouldAllowCustomCommunication])
  {
    int64_t v4 = [(GKDashboardMultiplayerPickerViewController *)self pickerOrigin];

    if (v4 == 1)
    {
      int v5 = [(GKDashboardMultiplayerPickerViewController *)self navBarMessageButton];
      [v5 setHidden:0];

      char v6 = [(GKDashboardMultiplayerPickerViewController *)self navBarMessageButton];
      [v6 setEnabled:1];

      id v7 = (void *)MEMORY[0x1E4FB1830];
      id v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
      id v16 = [v7 configurationWithFont:v8];

      uint64_t v9 = [(GKDashboardMultiplayerPickerViewController *)self message];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.bubble"];
        char v12 = [v11 imageWithConfiguration:v16];
        id v13 = [v12 imageWithRenderingMode:2];
      }
      else
      {
        uint64_t v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.bubble" withConfiguration:v16];
        id v13 = [v14 imageWithRenderingMode:2];
      }
      id v15 = [(GKDashboardMultiplayerPickerViewController *)self navBarMessageButton];
      [v15 setImage:v13 forState:0];

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v16 = [(GKDashboardMultiplayerPickerViewController *)self navBarMessageButton];
  [v16 setHidden:1];
LABEL_9:
}

- (void)customInviteViewController:(id)a3 didFinishWithMessage:(id)a4
{
  id v5 = a4;
  [(GKDashboardMultiplayerPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(GKDashboardMultiplayerPickerViewController *)self setMessage:v5];

  [(GKDashboardMultiplayerPickerViewController *)self updateAddMessageButtonVisibility];
}

- (void)handleSearchTextFieldReturn:(id)a3
{
  [(GKDashboardMultiplayerPickerViewController *)self didEndSearchTextEditing];
  id v4 = [(GKDashboardMultiplayerPickerViewController *)self showContactPickerButton];
  [v4 setHidden:1];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageField);

  if (WeakRetained == v4)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_messageField);
    id v8 = [v7 text];
    [(GKDashboardMultiplayerPickerViewController *)self setMessage:v8];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__GKDashboardMultiplayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];

    if (v6 == v4)
    {
      [(GKDashboardMultiplayerPickerViewController *)self handleSearchTextFieldReturn:v4];
      [v4 resignFirstResponder];
    }
  }

  return WeakRetained != v4;
}

uint64_t __68__GKDashboardMultiplayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send:*(void *)(a1 + 32)];
}

- (void)_updateButtonEnableState
{
  id v15 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  id v3 = [v15 selectedPlayers];
  BOOL v4 = [v3 count] != 0;

  id v5 = [(GKDashboardMultiplayerPickerViewController *)self navBarSendButton];
  [v5 setEnabled:v4];

  [(GKDashboardMultiplayerPickerViewController *)self updateAddMessageButtonVisibility];
  id v6 = NSString;
  id v7 = GKGameCenterUIFrameworkBundle();
  id v8 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v9 = [v15 selectedPlayers];
  uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"), objc_msgSend(v15, "maxSelectable"));
  id v11 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  [v11 setText:v10];

  char v12 = [(GKDashboardMultiplayerPickerViewController *)self headerSubtitle];
  id v13 = [v12 text];
  uint64_t v14 = [(GKDashboardMultiplayerPickerViewController *)self collapsedSubtitle];
  [v14 setText:v13];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v32 = a4;
  id v7 = a5;
  if ([v7 section])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v32;
      uint64_t v9 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
      uint64_t v10 = [v9 playerForIndexPath:v7];

      id v11 = [v10 internal];
      char v12 = [v11 contact];
      id v13 = [v12 _gkCompositeName];

      uint64_t v14 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
      BOOL v15 = [v14 friendSortFilterScope] == 1;

      id v16 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
      objc_msgSend(v8, "configureWithPlayer:isCoreRecent:matchedContactName:onlyShowContactName:", v10, objc_msgSend(v16, "isPlayerAtIndexPathCoreRecent:", v7), v13, v15);

      [v8 setAccessibilityPrefix:@"picker.friends"];
      uint64_t v17 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
      id v18 = [v17 playerStates];
      id v19 = [v10 referenceKey];
      uint64_t v20 = [v18 objectForKey:v19];
      uint64_t v21 = [v20 integerValue];

      if (v21 != 2)
      {
        [v8 setSelected:v21 == 1];
        int v22 = [v8 isSelected];
        double v23 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
        id v24 = v23;
        if (v22) {
          [v23 selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
        }
        else {
          [v23 deselectItemAtIndexPath:v7 animated:0];
        }
      }
    }
  }
  id v25 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  uint64_t v26 = [v25 cornerMaskForItemAtIndexPath:v7];

  unint64_t v27 = [v32 layer];
  long long v28 = v27;
  if (v26)
  {
    [v27 setMasksToBounds:1];

    id v29 = [v32 layer];
    [v29 setMaskedCorners:v26];

    long long v30 = [v32 layer];
    [v30 setCornerRadius:14.0];

    uint64_t v31 = *MEMORY[0x1E4F39EA8];
    long long v28 = [v32 layer];
    [v28 setCornerCurve:v31];
  }
  else
  {
    [v27 setCornerRadius:0.0];
  }
}

- (void)didPressShowContactPickerButton:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
  [v4 setDelegate:self];
  [(GKDashboardMultiplayerPickerViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5 = a4;
  id v6 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  [v6 didPickContact:v5];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(GKDashboardMultiplayerPickerViewController *)self didBeginSearchTextEditing];
  id v4 = [(GKDashboardMultiplayerPickerViewController *)self showContactPickerButton];
  [v4 setHidden:0];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 text];
  char v12 = [v11 stringByAppendingString:v9];
  [(GKDashboardMultiplayerPickerViewController *)self setSearchText:v12];

  id v13 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v14 = [v10 text];

  BOOL v15 = [v13 stringWithString:v14];

  objc_msgSend(v15, "replaceCharactersInRange:withString:", location, length, v9);
  [(GKDashboardMultiplayerPickerViewController *)self setSearchText:v15];

  return 1;
}

- (void)willShowKeyboard:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(GKDashboardMultiplayerPickerViewController *)self excludesContacts] ^ 1;
  id v5 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
  [v5 setShowsAddButtonWhenExpanded:v4];

  id v6 = [(GKDashboardMultiplayerPickerViewController *)self traitCollection];
  uint64_t v7 = [v6 verticalSizeClass];

  if (v7 == 1) {
    [(GKDashboardMultiplayerPickerViewController *)self collapseHeaderView];
  }
  id v8 = [v17 userInfo];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v9 CGRectValue];
  double v11 = v10;

  char v12 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v12 safeAreaInsets];
  [(GKDashboardMultiplayerPickerViewController *)self setKeyboardHeight:v11 - v13];

  uint64_t v14 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  int v15 = [v14 isFirstResponder];

  if (v15)
  {
    id v16 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
    [v16 setDelegate:self];
  }
}

- (void)willHideKeyboard:(id)a3
{
}

- (void)didBeginSearchTextEditing
{
  id v2 = [MEMORY[0x1E4F637F8] reporter];
  [v2 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63368]];
}

- (void)setSearchText:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
  if (([v4 isSearching] & 1) == 0 && objc_msgSend(v6, "length"))
  {
    id v5 = [MEMORY[0x1E4F637F8] reporter];
    [v5 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F63370]];
  }
  [v4 setSearchText:v6];
  [(GKDashboardMultiplayerPickerViewController *)self dataUpdated:1 withError:0];
}

- (void)didEndSearchTextEditing
{
  id v3 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  [v3 setText:0];

  [(GKDashboardMultiplayerPickerViewController *)self setSearchText:0];
  id v4 = [(GKDashboardCollectionViewController *)self collectionView];
  [v4 setNeedsLayout];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
  int v9 = [v8 isFirstResponder];

  if (v9)
  {
    double v10 = [(GKDashboardMultiplayerPickerViewController *)self searchTextField];
    [v10 resignFirstResponder];
  }
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v14 collectionView:v6 didSelectItemAtIndexPath:v7];
  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
  unint64_t v11 = [v7 section];

  if (v11 <= 2)
  {
    char v12 = (void *)qword_1E5F642C0[v11];
    double v13 = [MEMORY[0x1E4F637F8] reporter];
    [v13 reportEvent:*MEMORY[0x1E4F63530] type:*v12];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardCollectionViewController *)&v5 collectionView:a3 didDeselectItemAtIndexPath:a4];
  [(GKDashboardMultiplayerPickerViewController *)self _updateButtonEnableState];
}

- (void)viewSafeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  [(GKDashboardMultiplayerPickerViewController *)&v8 viewSafeAreaInsetsDidChange];
  id v3 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v4 layoutIfNeeded];

  objc_super v5 = [(GKDashboardCollectionViewController *)self collectionView];
  id v6 = [v5 collectionViewLayout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [(GKDashboardMultiplayerPickerViewController *)self collectionSectionInset];
    objc_msgSend(v7, "setSectionInset:");
  }
}

- (UIEdgeInsets)collectionSectionInset
{
  id v3 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4 + 20.0;
  id v6 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v7 + 20.0;

  double v9 = 10.0;
  double v10 = 0.0;
  double v11 = v5;
  double v12 = v8;
  result.right = v12;
  result.bottom = v10;
  result.left = v11;
  result.top = v9;
  return result;
}

- (void)_updateCollectionView
{
  [(GKDashboardCollectionViewController *)self setToHorizontalLayout:0];
  id v8 = [(GKDashboardCollectionViewController *)self collectionView];
  [v8 setDelegate:self];
  [v8 setClipsToBounds:1];
  id v3 = [v8 collectionViewLayout];
  [v3 invalidateLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = (void *)MEMORY[0x1E4F28E60];
    id v5 = v3;
    id v6 = [v4 indexSetWithIndex:0];
    [v5 setSectionsThatShowHeaderWhenEmpty:v6];

    double v7 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
    [v5 setSectionsThatShowFootersWhenEmpty:v7];

    [v5 setMinimumLineSpacing:0.0];
    [(GKDashboardMultiplayerPickerViewController *)self collectionSectionInset];
    objc_msgSend(v5, "setSectionInset:");
    [v5 setCentersItemsInExcessSpace:1];
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5 = a3;
  [v5 clearText];
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  double v7 = [v5 textView];

  [v7 setTextColor:v6];

  [(GKDashboardMultiplayerPickerViewController *)self setComposeTextViewShowingPlaceholderText:0];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (![(GKDashboardMultiplayerPickerViewController *)self skipAddressTokenization])
  {
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
    char v7 = [v5 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
      if ([(GKDashboardMultiplayerPickerViewController *)self excludesContacts])
      {
        id v8 = [(GKDashboardMultiplayerPickerViewController *)self composeTextView];
        [(GKDashboardMultiplayerPickerViewController *)self composeRecipientView:v8 didAddRecipient:0];

        if (!*MEMORY[0x1E4F63860]) {
          id v9 = (id)GKOSLoggers();
        }
        double v10 = (void *)*MEMORY[0x1E4F63870];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63870], OS_LOG_TYPE_INFO))
        {
          double v11 = NSNumber;
          double v12 = (void *)MEMORY[0x1E4F637E8];
          double v13 = v10;
          objc_super v14 = [v12 shared];
          int v15 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "multiplayerAllowedPlayerType"));
          *(_DWORD *)buf = 138412290;
          id v24 = v15;
          _os_log_impl(&dword_1AF250000, v13, OS_LOG_TYPE_INFO, "Not forming contact from address that players input, since GKPreferences.shared.multiplayerAllowedPlayerType is set to: %@", buf, 0xCu);
        }
      }
      else
      {
        id v16 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
        id v17 = [v16 objectForKeyedSubscript:v5];

        if (v17)
        {
          int v22 = v17;
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          [(GKDashboardMultiplayerPickerViewController *)self highlightRecipients:v18];
        }
        else
        {
          id v18 = +[GKMessageUtilities playerWithPhoneNumberOrEmail:v5 givenName:v5];
          if (v18)
          {
            id v19 = [MEMORY[0x1E4F637F8] reporter];
            [v19 reportEvent:*MEMORY[0x1E4F63530] type:*MEMORY[0x1E4F632C0]];

            uint64_t v20 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
            uint64_t v21 = [v18 contact];
            [v20 didPickContact:v21];
          }
        }
      }
    }
  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v12 = a4;
  if (![(GKDashboardMultiplayerPickerViewController *)self recipientRemovedImplicitly])
  {
    id v5 = v12;
    id v6 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
    char v7 = [v6 objectForKeyedSubscript:v5];

    id v8 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
    [v8 removeObjectForKey:v5];

    id v9 = [(GKDashboardMultiplayerPickerViewController *)self recipientMap];
    double v10 = [v5 address];

    [v9 removeObjectForKey:v10];
    double v11 = [(GKDashboardMultiplayerPickerViewController *)self pickerDataSource];
    [v11 didRemoveRecipientPlayers:v7];
  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  if (![(GKDashboardMultiplayerPickerViewController *)self composeTextViewShowingPlaceholderText])[(GKDashboardMultiplayerPickerViewController *)self setSearchText:v5]; {
}
  }

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 recipients];
  char v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = (void *)MEMORY[0x1E4F1CA80];
  id v9 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
  double v10 = [v9 allKeys];
  double v11 = [v8 setWithArray:v10];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke;
  v37[3] = &unk_1E5F64250;
  id v12 = v11;
  id v38 = v12;
  id v26 = v7;
  unint64_t v27 = v6;
  id v39 = v26;
  [v6 enumerateObjectsUsingBlock:v37];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v33 + 1) + 8 * v16);
        id v18 = [(GKDashboardMultiplayerPickerViewController *)self removedRecipientPlayerMap];

        if (!v18)
        {
          id v19 = objc_opt_new();
          [(GKDashboardMultiplayerPickerViewController *)self setRemovedRecipientPlayerMap:v19];
        }
        uint64_t v20 = [(GKDashboardMultiplayerPickerViewController *)self recipientPlayerMap];
        uint64_t v21 = [v20 objectForKeyedSubscript:v17];
        int v22 = [(GKDashboardMultiplayerPickerViewController *)self removedRecipientPlayerMap];
        double v23 = [v17 address];
        [v22 setObject:v21 forKeyedSubscript:v23];

        [(GKDashboardMultiplayerPickerViewController *)self composeRecipientView:v5 didRemoveRecipient:v17];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v14);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_2;
  void v31[3] = &unk_1E5F64278;
  id v24 = v5;
  id v32 = v24;
  [v26 enumerateObjectsUsingBlock:v31];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_3;
  v29[3] = &unk_1E5F64250;
  v29[4] = self;
  id v30 = v24;
  id v25 = v24;
  [v26 enumerateObjectsUsingBlock:v29];
}

void __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v4;
    if ([*(id *)(a1 + 32) containsObject:v3]) {
      [*(id *)(a1 + 32) removeObject:v3];
    }
    else {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

uint64_t __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecipient:a2];
}

uint64_t __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v15;
    id v4 = [*(id *)(a1 + 32) removedRecipientPlayerMap];
    id v5 = [v3 address];
    id v6 = [v4 objectForKeyedSubscript:v5];

    char v7 = *(void **)(a1 + 32);
    if (v6)
    {
      id v8 = [*(id *)(a1 + 32) pickerDataSource];
      [v8 didAddRecipientPlayers:v6];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v8 = [v3 address];
      [v7 composeRecipientView:v13 didFinishEnteringAddress:v8];
    }
  }
  else
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    id v10 = v15;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    id v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v3 = [v15 address];
    [v12 composeRecipientView:v11 didFinishEnteringAddress:v3];
  }

  id v10 = v15;
LABEL_9:

  return MEMORY[0x1F41817F8](isKindOfClass, v10);
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  id v6 = a3;
  [(GKDashboardMultiplayerPickerViewController *)self setIsAnimatingComposeTextViewSizeChange:1];
  char v7 = [(GKDashboardMultiplayerPickerViewController *)self composeTextViewHeightConstraint];
  [v7 constant];
  uint64_t v9 = v8;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  v16[3] = &unk_1AF895502;
  id v10 = [(GKDashboardCollectionViewController *)self collectionView];
  [v10 contentOffset];
  uint64_t v17 = v11;
  uint64_t v18 = v12;

  uint64_t v13 = [(GKDashboardMultiplayerPickerViewController *)self view];
  [v13 layoutIfNeeded];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke;
  void v15[3] = &unk_1E5F642A0;
  v15[6] = fmax(height, 54.0);
  v15[7] = v9;
  void v15[4] = self;
  v15[5] = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke_2;
  v14[3] = &unk_1E5F63198;
  void v14[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v15 animations:v14 completion:0.3];
  _Block_object_dispose(v16, 8);
}

void __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) composeTextViewHeightConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) navigationHeaderHeightConstraint];
  double v5 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  [v4 constant];
  [v4 setConstant:v6 + v5];

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 40)
                                                              - (*(double *)(a1 + 48)
                                                               - *(double *)(a1 + 56));
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = *(double *)(v7 + 32);
  double v9 = *(double *)(v7 + 40);
  id v10 = [*(id *)(a1 + 32) collectionView];
  objc_msgSend(v10, "setContentOffset:", v8, v9);

  id v11 = [*(id *)(a1 + 32) view];
  [v11 layoutIfNeeded];
}

uint64_t __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimatingComposeTextViewSizeChange:0];
  [*(id *)(a1 + 32) updateNavHeaderHeightAndOpacity];
  double v2 = *(void **)(a1 + 32);

  return [v2 updateCollectionViewContentInsets];
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  id v12 = a3;
  id v4 = [v12 recipients];
  if ([v4 count]) {
    goto LABEL_2;
  }
  double v5 = [v12 textView];
  double v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    double v9 = [(GKDashboardMultiplayerPickerViewController *)self searchFieldPlaceHolderText];
    id v10 = [v12 textView];
    [v10 setText:v9];

    [(GKDashboardMultiplayerPickerViewController *)self setComposeTextViewShowingPlaceholderText:1];
    id v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    id v11 = [v12 textView];
    [v11 setTextColor:v4];

LABEL_2:
  }
  [(GKDashboardMultiplayerPickerViewController *)self didEndSearchTextEditing];
  double v8 = [v12 textView];
  [v8 resignFirstResponder];
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  id v6 = a3;
  if ([(GKDashboardMultiplayerPickerViewController *)self composeTextViewShowingPlaceholderText])
  {
    [v6 clearText];
    id v4 = [MEMORY[0x1E4FB1618] labelColor];
    double v5 = [v6 textView];
    [v5 setTextColor:v4];

    [(GKDashboardMultiplayerPickerViewController *)self setComposeTextViewShowingPlaceholderText:0];
  }
  [(GKDashboardMultiplayerPickerViewController *)self didBeginSearchTextEditing];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
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

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  return self->_nearbyDelegate;
}

- (GKDashboardMultiplayerPickerDelegate)multiplayerPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_multiplayerPickerDelegate);

  return (GKDashboardMultiplayerPickerDelegate *)WeakRetained;
}

- (void)setMultiplayerPickerDelegate:(id)a3
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

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (BOOL)usePreferredFocusCell
{
  return self->_usePreferredFocusCell;
}

- (void)setUsePreferredFocusCell:(BOOL)a3
{
  self->_usePreferredFocusCell = a3;
}

- (UILabel)descriptionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)sendButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendButton);

  return (UIButton *)WeakRetained;
}

- (void)setSendButton:(id)a3
{
}

- (UIButton)customizeMessageButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customizeMessageButton);

  return (UIButton *)WeakRetained;
}

- (void)setCustomizeMessageButton:(id)a3
{
}

- (UITextField)messageField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageField);

  return (UITextField *)WeakRetained;
}

- (void)setMessageField:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundEffectView);

  return (UIVisualEffectView *)WeakRetained;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (UIVisualEffectView)navigationVisualEffectBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationVisualEffectBackground);

  return (UIVisualEffectView *)WeakRetained;
}

- (void)setNavigationVisualEffectBackground:(id)a3
{
}

- (NSLayoutConstraint)navigationHeaderHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationHeaderHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setNavigationHeaderHeightConstraint:(id)a3
{
}

- (UILabel)headerTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerTitle);

  return (UILabel *)WeakRetained;
}

- (void)setHeaderTitle:(id)a3
{
}

- (UILabel)headerSubtitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerSubtitle);

  return (UILabel *)WeakRetained;
}

- (void)setHeaderSubtitle:(id)a3
{
}

- (UIStackView)headerContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);

  return (UIStackView *)WeakRetained;
}

- (void)setHeaderContentView:(id)a3
{
}

- (UIView)collapsedTitleContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collapsedTitleContainer);

  return (UIView *)WeakRetained;
}

- (void)setCollapsedTitleContainer:(id)a3
{
}

- (UILabel)collapsedTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collapsedTitle);

  return (UILabel *)WeakRetained;
}

- (void)setCollapsedTitle:(id)a3
{
}

- (UILabel)collapsedSubtitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collapsedSubtitle);

  return (UILabel *)WeakRetained;
}

- (void)setCollapsedSubtitle:(id)a3
{
}

- (NSMutableDictionary)recipientPlayerMap
{
  return self->_recipientPlayerMap;
}

- (void)setRecipientPlayerMap:(id)a3
{
}

- (NSMutableDictionary)removedRecipientPlayerMap
{
  return self->_removedRecipientPlayerMap;
}

- (void)setRemovedRecipientPlayerMap:(id)a3
{
}

- (NSMutableDictionary)recipientMap
{
  return self->_recipientMap;
}

- (void)setRecipientMap:(id)a3
{
}

- (BOOL)recipientRemovedImplicitly
{
  return self->_recipientRemovedImplicitly;
}

- (void)setRecipientRemovedImplicitly:(BOOL)a3
{
  self->_recipientRemovedImplicitly = a3;
}

- (BOOL)skipAddressTokenization
{
  return self->_skipAddressTokenization;
}

- (void)setSkipAddressTokenization:(BOOL)a3
{
  self->_skipAddressTokenization = a3;
}

- (BOOL)isAnimatingComposeTextViewSizeChange
{
  return self->_isAnimatingComposeTextViewSizeChange;
}

- (void)setIsAnimatingComposeTextViewSizeChange:(BOOL)a3
{
  self->_isAnimatingComposeTextViewSizeChange = a3;
}

- (NSLayoutConstraint)customizeMessageBottomConstraint
{
  return self->_customizeMessageBottomConstraint;
}

- (void)setCustomizeMessageBottomConstraint:(id)a3
{
}

- (double)initialCustomizeMessageBottomConstraintConstant
{
  return self->_initialCustomizeMessageBottomConstraintConstant;
}

- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3
{
  self->_initialCustomizeMessageBottomConstraintConstant = a3;
}

- (CNContactPickerViewController)contactPicker
{
  return self->_contactPicker;
}

- (void)setContactPicker:(id)a3
{
}

- (BOOL)excludesContacts
{
  return self->_excludesContacts;
}

- (void)setExcludesContacts:(BOOL)a3
{
  self->_excludesContacts = a3;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (UIView)composeTextViewContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeTextViewContainer);

  return (UIView *)WeakRetained;
}

- (void)setComposeTextViewContainer:(id)a3
{
}

- (UIView)composeTextViewContainerBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeTextViewContainerBackground);

  return (UIView *)WeakRetained;
}

- (void)setComposeTextViewContainerBackground:(id)a3
{
}

- (NSLayoutConstraint)composeTextViewContainerBackgroundHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeTextViewContainerBackgroundHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setComposeTextViewContainerBackgroundHeightConstraint:(id)a3
{
}

- (CNComposeRecipientTextView)composeTextView
{
  return self->_composeTextView;
}

- (void)setComposeTextView:(id)a3
{
}

- (NSLayoutConstraint)composeTextViewHeightConstraint
{
  return self->_composeTextViewHeightConstraint;
}

- (void)setComposeTextViewHeightConstraint:(id)a3
{
}

- (BOOL)composeTextViewShowingPlaceholderText
{
  return self->_composeTextViewShowingPlaceholderText;
}

- (void)setComposeTextViewShowingPlaceholderText:(BOOL)a3
{
  self->_composeTextViewShowingPlaceholderText = a3;
}

- (UIButton)navBarMessageButton
{
  return self->_navBarMessageButton;
}

- (void)setNavBarMessageButton:(id)a3
{
}

- (UIButton)navBarSendButton
{
  return self->_navBarSendButton;
}

- (void)setNavBarSendButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIView)dividerLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dividerLine);

  return (UIView *)WeakRetained;
}

- (void)setDividerLine:(id)a3
{
}

- (NSLayoutConstraint)rightBarButtonTopConstraint
{
  return self->_rightBarButtonTopConstraint;
}

- (void)setRightBarButtonTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftBarButtonTopConstraint
{
  return self->_leftBarButtonTopConstraint;
}

- (void)setLeftBarButtonTopConstraint:(id)a3
{
}

- (GKPickerSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (void)setSearchTextField:(id)a3
{
}

- (UIButton)showContactPickerButton
{
  return self->_showContactPickerButton;
}

- (void)setShowContactPickerButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showContactPickerButton, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_leftBarButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTopConstraint, 0);
  objc_destroyWeak((id *)&self->_dividerLine);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_navBarSendButton, 0);
  objc_storeStrong((id *)&self->_navBarMessageButton, 0);
  objc_storeStrong((id *)&self->_composeTextViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_composeTextView, 0);
  objc_destroyWeak((id *)&self->_composeTextViewContainerBackgroundHeightConstraint);
  objc_destroyWeak((id *)&self->_composeTextViewContainerBackground);
  objc_destroyWeak((id *)&self->_composeTextViewContainer);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_customizeMessageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_recipientMap, 0);
  objc_storeStrong((id *)&self->_removedRecipientPlayerMap, 0);
  objc_storeStrong((id *)&self->_recipientPlayerMap, 0);
  objc_destroyWeak((id *)&self->_collapsedSubtitle);
  objc_destroyWeak((id *)&self->_collapsedTitle);
  objc_destroyWeak((id *)&self->_collapsedTitleContainer);
  objc_destroyWeak((id *)&self->_headerContentView);
  objc_destroyWeak((id *)&self->_headerSubtitle);
  objc_destroyWeak((id *)&self->_headerTitle);
  objc_destroyWeak((id *)&self->_navigationHeaderHeightConstraint);
  objc_destroyWeak((id *)&self->_navigationVisualEffectBackground);
  objc_destroyWeak((id *)&self->_backgroundEffectView);
  objc_destroyWeak((id *)&self->_messageField);
  objc_destroyWeak((id *)&self->_customizeMessageButton);
  objc_destroyWeak((id *)&self->_sendButton);
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_multiplayerPickerDelegate);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end