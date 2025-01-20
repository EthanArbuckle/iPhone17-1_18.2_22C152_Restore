@interface _UIShareOverviewActionController
- (BOOL)isHomeroomID:(id)a3;
- (BOOL)shareActivityControllerShouldAddParticipants:(id)a3;
- (BOOL)shareActivityControllerShouldPresentActivity:(id)a3;
- (BRShareDocumentInfoView)infoView;
- (BRShareSettings)settings;
- (BRShareSettingsButton)shareSettingsButton;
- (BRTransportRegionView)transportRegion;
- (NSURL)shareURL;
- (UIScrollView)scrollView;
- (UIStackView)vContainer;
- (UIView)transportRegionBottomSeparator;
- (UIView)transportRegionTopSeparator;
- (_BRShareOverviewActivityViewController)embeddedActivityViewController;
- (_UIShareInvitationSettingsController)settingsViewController;
- (_UIShareOverviewActionController)initWithDelegate:(id)a3;
- (id)_ownerLabelTextForName:(id)a3 displayHandle:(id)a4;
- (id)_setupProgressView;
- (id)activityViewControllerOperation:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)addPeopleTitleWithDelegate:(id)a3 isInitial:(BOOL)a4;
- (id)contentScrollView;
- (int)popoverPresentationMode;
- (unint64_t)lastPermissionOptions;
- (void)_updateInfo;
- (void)_updateSubviewsForNewGeometry;
- (void)folderSharingPreparationDidComplete;
- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setEmbeddedActivityViewController:(id)a3;
- (void)setInfoView:(id)a3;
- (void)setItemName:(id)a3;
- (void)setLastPermissionOptions:(unint64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsViewController:(id)a3;
- (void)setShareSettingsButton:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setTransportRegion:(id)a3;
- (void)setTransportRegionBottomSeparator:(id)a3;
- (void)setTransportRegionTopSeparator:(id)a3;
- (void)setVContainer:(id)a3;
- (void)settingsControllerDidChange:(id)a3 changedAllowInviters:(BOOL)a4;
- (void)shareActivityController:(id)a3 prepareActivityPresentation:(id)a4 completion:(id)a5;
- (void)shareActivityController:(id)a3 prepareForActivity:(id)a4 completion:(id)a5;
- (void)shareDidChange;
- (void)shareViewController:(id)a3 addParticipants:(id)a4 activityType:(id)a5 completion:(id)a6;
- (void)showShareSettings:(id)a3;
- (void)updatePermissionOptions;
- (void)updatePreferredContentSize:(id)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)waitForShareCreationWithActivityType:(id)a3 progressView:(id)a4 completion:(id)a5;
- (void)willNavigateFromViewController:(id)a3;
@end

@implementation _UIShareOverviewActionController

- (_UIShareOverviewActionController)initWithDelegate:(id)a3
{
  v154.receiver = self;
  v154.super_class = (Class)_UIShareOverviewActionController;
  id v145 = a3;
  v3 = -[_UIShareOverviewController initWithDelegate:](&v154, "initWithDelegate:");
  if (v3)
  {
    v144 = objc_opt_new();
    [v144 setParentViewController:v3];
    [(_UIShareOverviewActionController *)v3 setView:v144];
    v4 = +[UIColor systemGroupedBackgroundColor];
    v5 = [(_UIShareOverviewActionController *)v3 view];
    [v5 setBackgroundColor:v4];

    v148 = objc_opt_new();
    id v147 = objc_alloc_init((Class)UIScrollView);
    [v147 setClipsToBounds:0];
    [v147 setAlwaysBounceVertical:0];
    [v147 setShowsVerticalScrollIndicator:0];
    [v147 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v147 setDelegate:v3];
    [(_UIShareOverviewActionController *)v3 setScrollView:v147];
    v6 = [v147 topAnchor];
    v7 = [(_UIShareOverviewActionController *)v3 view];
    v8 = [v7 safeAreaLayoutGuide];
    v9 = [v8 topAnchor];
    v10 = [v6 constraintEqualToAnchor:v9];
    [v148 addObject:v10];

    v11 = [v147 trailingAnchor];
    v12 = [(_UIShareOverviewActionController *)v3 view];
    v13 = [v12 safeAreaLayoutGuide];
    v14 = [v13 trailingAnchor];
    v15 = [v11 constraintEqualToAnchor:v14];
    [v148 addObject:v15];

    v16 = [v147 leadingAnchor];
    v17 = [(_UIShareOverviewActionController *)v3 view];
    v18 = [v17 safeAreaLayoutGuide];
    v19 = [v18 leadingAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];
    [v148 addObject:v20];

    v21 = [v147 bottomAnchor];
    v22 = [(_UIShareOverviewActionController *)v3 view];
    v23 = [v22 safeAreaLayoutGuide];
    v24 = [v23 bottomAnchor];
    v25 = [v21 constraintEqualToAnchor:v24];
    [v148 addObject:v25];

    v26 = [(_UIShareOverviewActionController *)v3 view];
    [v26 addSubview:v147];

    id v146 = objc_alloc_init((Class)UIStackView);
    [v146 setAxis:1];
    [v146 setDistribution:0];
    [v146 setAlignment:3];
    [v146 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v146 setLayoutMarginsRelativeArrangement:1];
    LODWORD(v27) = 1148846080;
    [v146 setContentCompressionResistancePriority:1 forAxis:v27];
    LODWORD(v28) = 1148846080;
    [v146 setContentHuggingPriority:1 forAxis:v28];
    [v147 addSubview:v146];
    v29 = [v146 topAnchor];
    v30 = [v147 contentLayoutGuide];
    v31 = [v30 topAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    [v148 addObject:v32];

    v33 = [v146 trailingAnchor];
    v34 = [v147 contentLayoutGuide];
    v35 = [v34 trailingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [v148 addObject:v36];

    v37 = [v146 leadingAnchor];
    v38 = [v147 contentLayoutGuide];
    v39 = [v38 leadingAnchor];
    v40 = [v37 constraintEqualToAnchor:v39];
    [v148 addObject:v40];

    v41 = [v146 bottomAnchor];
    v42 = [v147 contentLayoutGuide];
    v43 = [v42 bottomAnchor];
    v44 = [v41 constraintEqualToAnchor:v43];
    [v148 addObject:v44];

    v45 = [v147 contentLayoutGuide];
    v46 = [v45 widthAnchor];
    v47 = [v147 frameLayoutGuide];
    v48 = [v47 widthAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    [v148 addObject:v49];

    [(_UIShareOverviewActionController *)v3 setVContainer:v146];
    uint64_t v50 = objc_opt_new();
    infoView = v3->_infoView;
    v3->_infoView = (BRShareDocumentInfoView *)v50;

    [(BRShareDocumentInfoView *)v3->_infoView setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = [(BRShareDocumentInfoView *)v3->_infoView leadingAnchor];
    v53 = [(_UIShareOverviewActionController *)v3 vContainer];
    v54 = [v53 leadingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    [v148 addObject:v55];

    v56 = [(BRShareDocumentInfoView *)v3->_infoView trailingAnchor];
    v57 = [(_UIShareOverviewActionController *)v3 vContainer];
    v58 = [v57 trailingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    [v148 addObject:v59];

    LODWORD(v56) = [v145 shareViewControllerIsInitialShare:v3];
    v60 = [(_UIShareOverviewController *)v3 share];
    id v61 = [v60 publicPermission];

    if (v56)
    {
      v62 = [(_UIShareOverviewActionController *)v3 addPeopleTitleWithDelegate:v145 isInitial:1];
      v63 = [(BRShareDocumentInfoView *)v3->_infoView titleLabel];
      [v63 setText:v62];

      v64 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v65 = [v64 localizedStringForKey:@"SHARE_INITIAL_INFO_LABEL" value:@"Add people to this iCloud Drive file and everyone will see the latest changes." table:@"Localizable"];
      v66 = [v145 shareViewControllerItemUTI:v3];
      v67 = _CDAdaptLocalizedStringForItemType();
      v68 = [(BRShareDocumentInfoView *)v3->_infoView infoTextLabel];
      [v68 setText:v67];

      v69 = [(BRShareDocumentInfoView *)v3->_infoView infoTextLabel];
      [v69 setHidden:0];
    }
    else
    {
      if (v61 == (id)1)
      {
        v70 = [(_UIShareOverviewActionController *)v3 addPeopleTitleWithDelegate:v145 isInitial:0];
        v71 = [(BRShareDocumentInfoView *)v3->_infoView titleLabel];
        [v71 setText:v70];
      }
      else
      {
        v70 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v71 = [v70 localizedStringForKey:@"SHARE_RESEND_PUBLIC_TITLE" value:@"Send Link" table:@"Localizable"];
        v72 = [(BRShareDocumentInfoView *)v3->_infoView titleLabel];
        [v72 setText:v71];
      }
      v73 = [(BRShareDocumentInfoView *)v3->_infoView infoTextLabel];
      [v73 setText:&stru_10004DE30];

      v69 = [(BRShareDocumentInfoView *)v3->_infoView infoTextLabel];
      [v69 setHidden:1];
    }

    v74 = [(BRShareDocumentInfoView *)v3->_infoView titleLabel];
    v75 = [v74 text];
    v76 = [(_UIShareOverviewActionController *)v3 navigationItem];
    [v76 setBackButtonTitle:v75];

    [v146 addArrangedSubview:v3->_infoView];
    v77 = [(_UIShareOverviewController *)v3 itemURL];
    if (v77)
    {
      v78 = v152;
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_100026CC4;
      v152[3] = &unk_10004D7A8;
      v152[4] = v3;
      BRSharingCopyCurrentUserNameAndDisplayHandleForURL();
    }
    else
    {
      v78 = v153;
      v153[0] = _NSConcreteStackBlock;
      v153[1] = 3221225472;
      v153[2] = sub_100026BF8;
      v153[3] = &unk_10004D780;
      v153[4] = v3;
      BRSharingCopyCurrentUserNameAndDisplayHandle();
    }

    v79 = (UIView *)objc_opt_new();
    v80 = [(UIView *)v79 leadingAnchor];
    v81 = [(_UIShareOverviewActionController *)v3 view];
    v82 = [v81 leadingAnchor];
    v83 = [v80 constraintEqualToAnchor:v82];
    [v148 addObject:v83];

    v84 = [(UIView *)v79 trailingAnchor];
    v85 = [(_UIShareOverviewActionController *)v3 view];
    v86 = [v85 trailingAnchor];
    v87 = [v84 constraintEqualToAnchor:v86];
    [v148 addObject:v87];

    [v146 addArrangedSubview:v79];
    transportRegionTopSeparator = v3->_transportRegionTopSeparator;
    v3->_transportRegionTopSeparator = v79;

    v143 = objc_alloc_init(BRShareCopyLinkActivity);
    v89 = [_BRShareOverviewActivityViewController alloc];
    v158 = v3;
    v90 = +[NSArray arrayWithObjects:&v158 count:1];
    v157 = v143;
    v91 = +[NSArray arrayWithObjects:&v157 count:1];
    v92 = [(_BRShareOverviewActivityViewController *)v89 initWithActivityItems:v90 applicationActivities:v91];

    [(_BRShareOverviewActivityViewController *)v92 setAllowsEmbedding:1];
    [(_BRShareOverviewActivityViewController *)v92 setDelegate:v3];
    [(_BRShareOverviewActivityViewController *)v92 setExcludedActivityCategories:1];
    v156[0] = UIActivityTypeAirDrop;
    v156[1] = UIActivityTypeAddToReadingList;
    v156[2] = UIActivityTypeCreateReminder;
    v156[3] = UIActivityTypeSaveToNotes;
    v93 = +[NSArray arrayWithObjects:v156 count:4];
    [(_BRShareOverviewActivityViewController *)v92 setExcludedActivityTypes:v93];

    objc_initWeak(&location, v3);
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_100026E1C;
    v149[3] = &unk_10004D7D0;
    objc_copyWeak(&v150, &location);
    [(_BRShareOverviewActivityViewController *)v92 setCompletionWithItemsHandler:v149];
    [(_UIShareOverviewActionController *)v3 setEmbeddedActivityViewController:v92];
    [(_BRShareOverviewActivityViewController *)v92 beginAppearanceTransition:1 animated:0];
    [(_UIShareOverviewActionController *)v3 addChildViewController:v92];
    LODWORD(v93) = [v145 shareViewControllerIsFolderShare:v3];
    unsigned int v94 = [v145 shareViewControllerFolderShareIsPrepared:v3];
    v95 = [BRTransportRegionView alloc];
    v96 = [(_BRShareOverviewActivityViewController *)v92 view];
    v97 = [(BRTransportRegionView *)v95 initWithTransportView:v96];
    transportRegion = v3->_transportRegion;
    v3->_transportRegion = v97;

    if (v93) {
      [(BRTransportRegionView *)v3->_transportRegion setIsPreparingForFolderSharing:v94 ^ 1];
    }
    [v146 addArrangedSubview:v3->_transportRegion];
    [(_BRShareOverviewActivityViewController *)v92 didMoveToParentViewController:v3];
    v99 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
    v100 = +[UITraitCollection traitCollectionWithVerticalSizeClass:1];
    v155[0] = v99;
    v155[1] = v100;
    v101 = +[NSArray arrayWithObjects:v155 count:2];
    v102 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v101];

    [(_UIShareOverviewActionController *)v3 setOverrideTraitCollection:v102 forChildViewController:v92];
    [(_BRShareOverviewActivityViewController *)v92 endAppearanceTransition];
    [(BRTransportRegionView *)v3->_transportRegion setTranslatesAutoresizingMaskIntoConstraints:0];
    v103 = [(BRTransportRegionView *)v3->_transportRegion leadingAnchor];
    v104 = [(_UIShareOverviewActionController *)v3 vContainer];
    v105 = [v104 leadingAnchor];
    v106 = [v103 constraintEqualToAnchor:v105];
    [v148 addObject:v106];

    v107 = [(BRTransportRegionView *)v3->_transportRegion trailingAnchor];
    v108 = [(_UIShareOverviewActionController *)v3 vContainer];
    v109 = [v108 trailingAnchor];
    v110 = [v107 constraintEqualToAnchor:v109];
    [v148 addObject:v110];

    objc_destroyWeak(&v150);
    objc_destroyWeak(&location);

    v111 = (UIView *)objc_opt_new();
    v112 = [(UIView *)v111 leadingAnchor];
    v113 = [(_UIShareOverviewActionController *)v3 view];
    v114 = [v113 leadingAnchor];
    v115 = [v112 constraintEqualToAnchor:v114];
    [v148 addObject:v115];

    v116 = [(UIView *)v111 trailingAnchor];
    v117 = [(_UIShareOverviewActionController *)v3 view];
    v118 = [v117 trailingAnchor];
    v119 = [v116 constraintEqualToAnchor:v118];
    [v148 addObject:v119];

    [v146 addArrangedSubview:v111];
    transportRegionBottomSeparator = v3->_transportRegionBottomSeparator;
    v3->_transportRegionBottomSeparator = v111;

    v121 = objc_alloc_init(BRShareSettingsButton);
    [(BRShareSettingsButton *)v121 addTarget:v3 action:"showShareSettings:" forControlEvents:64];
    [(BRShareSettingsButton *)v121 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v146 addArrangedSubview:v121];
    v122 = [(BRShareSettingsButton *)v121 trailingAnchor];
    v123 = [(_UIShareOverviewActionController *)v3 view];
    v124 = [v123 trailingAnchor];
    v125 = [v122 constraintEqualToAnchor:v124];
    [v148 addObject:v125];

    v126 = [(BRShareSettingsButton *)v121 leadingAnchor];
    v127 = [(_UIShareOverviewActionController *)v3 view];
    v128 = [v127 leadingAnchor];
    v129 = [v126 constraintEqualToAnchor:v128];
    [v148 addObject:v129];

    v130 = [(BRShareSettingsButton *)v121 hContainer];
    v131 = [v130 trailingAnchor];
    v132 = [(_UIShareOverviewActionController *)v3 vContainer];
    v133 = [v132 trailingAnchor];
    v134 = [v131 constraintEqualToAnchor:v133];
    [v148 addObject:v134];

    v135 = [(BRShareSettingsButton *)v121 hContainer];
    v136 = [v135 leadingAnchor];
    v137 = [(_UIShareOverviewActionController *)v3 vContainer];
    v138 = [v137 leadingAnchor];
    v139 = [v136 constraintEqualToAnchor:v138];
    [v148 addObject:v139];

    shareSettingsButton = v3->_shareSettingsButton;
    v3->_shareSettingsButton = v121;

    v3->_lastPermissionOptions = -1;
    [(_UIShareOverviewActionController *)v3 updatePermissionOptions];
    id v141 = [v145 shareViewControllerCurrentParticipantsState];
    if ([v145 shareViewControllerAllowOthersToInvite] != (unint64_t)v141 < 2) {
      [v145 shareViewControllerSetAllowOthersToInvite:(unint64_t)v141 < 2];
    }
    +[NSLayoutConstraint activateConstraints:v148];
  }
  return v3;
}

- (id)addPeopleTitleWithDelegate:(id)a3 isInitial:(BOOL)a4
{
  id v6 = a3;
  v7 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v8 = [v7 localizedStringForKey:@"SHARE_INITIAL_TITLE" value:@"Add People" table:@"Localizable"];

  if (a4)
  {
    v9 = [v6 shareViewControllerItemUTI:self];
    v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v11 = [v10 localizedStringForKey:@"SHARE_INITIAL_TITLE" value:@"Add People" table:@"Localizable"];
    v12 = _CDAdaptLocalizedStringForItemType();

    unsigned int v13 = [v6 shareViewControllerIsDocumentShare:self];
    if (([v6 shareViewControllerIsFolderShare:self] & 1) != 0
      || [v9 isEqualToString:@"com.apple.notes.folder"])
    {
      v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v15 = v14;
      CFStringRef v16 = @"SHARE_INITIAL_TITLE_FOLDER";
      CFStringRef v17 = @"Share Folder";
    }
    else if (v13)
    {
      v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v15 = v14;
      CFStringRef v16 = @"SHARE_INITIAL_TITLE_FILE";
      CFStringRef v17 = @"Share File";
    }
    else
    {
      if (([v9 isEqualToString:@"com.apple.notes.note"] & 1) != 0
        || ([v9 isEqualToString:@"com.apple.reminders.list"] & 1) != 0)
      {
        goto LABEL_6;
      }
      v14 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v15 = v14;
      CFStringRef v16 = @"SHARE_INITIAL_TITLE";
      CFStringRef v17 = @"Add People";
    }
    uint64_t v18 = [v14 localizedStringForKey:v16 value:v17 table:@"Localizable"];

    v12 = (void *)v18;
LABEL_6:
    id v19 = v12;

    goto LABEL_8;
  }
  id v19 = v8;
LABEL_8:

  return v19;
}

- (void)folderSharingPreparationDidComplete
{
}

- (id)contentScrollView
{
  return [(_UIShareOverviewActionController *)self scrollView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIShareOverviewActionController;
  [(_UIShareOverviewController *)&v7 viewWillAppear:a3];
  v4 = objc_opt_new();
  [v4 configureWithTransparentBackground];
  v5 = [(_UIShareOverviewActionController *)self navigationItem];
  [v5 setStandardAppearance:v4];

  id v6 = [(_UIShareOverviewActionController *)self navigationItem];
  [v6 setLargeTitleDisplayMode:2];
}

- (void)viewWillLayoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)_UIShareOverviewActionController;
  [(_UIShareOverviewActionController *)&v25 viewWillLayoutSubviews];
  v3 = [(_UIShareOverviewActionController *)self view];
  [v3 frame];
  double v5 = v4;
  [(_UIShareOverviewActionController *)self preferredContentSize];
  double v7 = v6;
  BOOL v8 = v5 < v6;

  v9 = [(_UIShareOverviewActionController *)self infoView];
  [v9 setCompactMode:v8];

  v10 = [(_UIShareOverviewActionController *)self transportRegion];
  [v10 setCompactMode:v8];

  v11 = [(_UIShareOverviewActionController *)self vContainer];
  v12 = v11;
  infoView = self->_infoView;
  if (v5 >= v7)
  {
    [v11 setCustomSpacing:infoView afterView:23.0];

    v24 = [(_UIShareOverviewActionController *)self vContainer];
    [v24 setCustomSpacing:self->_transportRegionTopSeparator afterView:23.0];

    uint64_t v18 = [(_UIShareOverviewActionController *)self vContainer];
    id v19 = v18;
    double top = 0.0;
    double v21 = 0.0;
    double v22 = 16.0;
    double v23 = 0.0;
  }
  else
  {
    [v11 setCustomSpacing:infoView afterView:11.0];

    v14 = [(_UIShareOverviewActionController *)self vContainer];
    [v14 setCustomSpacing:self->_transportRegionTopSeparator afterView:11.0];

    CGFloat leading = NSDirectionalEdgeInsetsZero.leading;
    CGFloat bottom = NSDirectionalEdgeInsetsZero.bottom;
    CGFloat trailing = NSDirectionalEdgeInsetsZero.trailing;
    uint64_t v18 = [(_UIShareOverviewActionController *)self vContainer];
    id v19 = v18;
    double top = NSDirectionalEdgeInsetsZero.top;
    double v21 = leading;
    double v22 = bottom;
    double v23 = trailing;
  }
  objc_msgSend(v18, "setDirectionalLayoutMargins:", top, v21, v22, v23);
}

- (void)_updateSubviewsForNewGeometry
{
  infoView = self->_infoView;
  v14[0] = self->_scrollView;
  v14[1] = infoView;
  transportRegion = self->_transportRegion;
  shareSettingsButton = self->_shareSettingsButton;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v14[2] = transportRegion;
  v14[3] = shareSettingsButton;
  double v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4, 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setNeedsUpdateConstraints];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v45 = [(_UIShareOverviewController *)self delegate];
  unsigned int v3 = [v45 shareViewControllerAllowOthersToInvite];
  double v4 = [(_UIShareOverviewController *)self share];
  double v5 = [v4 currentUserParticipant];
  if (v4
    && ([v4 owner],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqual:v5],
        v6,
        (v7 & 1) == 0))
  {
    int v9 = 0;
    BOOL v8 = 0;
  }
  else
  {
    if ([(BRShareSettings *)self->_settings hasACL]) {
      BOOL v8 = (id)[(BRShareSettings *)self->_settings defaultPermission] == (id)3;
    }
    else {
      BOOL v8 = 0;
    }
    int v9 = 1;
  }
  if ([(BRShareSettings *)self->_settings shouldShowMode]) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = [(BRShareSettings *)self->_settings shouldShowPermissions] || v8;
  }
  [(BRShareSettingsButton *)self->_shareSettingsButton setHidden:v9 & v10 ^ 1];
  long long v11 = [v45 shareViewControllerItemUTI:self];
  unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.reminders.list"];
  unsigned int v13 = [v45 shareViewControllerIsInitialShare:self];
  unsigned int v14 = [(BRShareSettings *)self->_settings hasACL];
  settings = self->_settings;
  if (!v13)
  {
    if (v14)
    {
      if ((id)[(BRShareSettings *)settings defaultPermission] != (id)3)
      {
        if ((id)[(BRShareSettings *)self->_settings defaultPermission] != (id)2) {
          goto LABEL_42;
        }
        objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v26 = v25;
        CFStringRef v27 = @"SETTINGS_DETAIL_ACL_RO_SUMMARY_TEXT";
        CFStringRef v28 = @"Only people you invite can view.";
        goto LABEL_41;
      }
      v20 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      double v21 = v20;
      if (v3)
      {
        CFStringRef v22 = @"SETTINGS_DETAIL_ACL_RW_ADD_OTHERS_SUMMARY_TEXT";
        CFStringRef v23 = @"People you invite can make changes and add others.";
      }
      else
      {
        CFStringRef v22 = @"SETTINGS_DETAIL_ACL_RW_SUMMARY_TEXT";
        CFStringRef v23 = @"Only people you invite can make changes.";
      }
      v31 = [v20 localizedStringForKey:v22 value:v23 table:@"Localizable"];
      v32 = [(BRShareSettingsButton *)self->_shareSettingsButton detailLabel];
      [v32 setText:v31];

      if (v3)
      {

        if ((v12 & 1) == 0) {
          goto LABEL_42;
        }
        objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
        v26 = v25;
        CFStringRef v27 = @"SETTINGS_DETAIL_ADD_OTHERS_REMINDERS_SUMMARY_TEXT";
        goto LABEL_35;
      }

      if ((v12 & 1) == 0) {
        goto LABEL_42;
      }
      objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
      v26 = v25;
      CFStringRef v27 = @"SETTINGS_DETAIL_REMINDERS_SUMMARY_TEXT";
LABEL_40:
      CFStringRef v28 = @"Only people you invite have access.";
      goto LABEL_41;
    }
LABEL_20:
    id v24 = [(BRShareSettings *)settings publicPermission];
    objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v26 = v25;
    if (v24 == (id)3)
    {
      CFStringRef v27 = @"SETTINGS_DETAIL_PUBLIC_RW_TEXT";
      CFStringRef v28 = @"Anyone with the link can make changes.";
    }
    else
    {
      CFStringRef v27 = @"SETTINGS_DETAIL_PUBLIC_RO_TEXT";
      CFStringRef v28 = @"Anyone with the link can view.";
    }
    goto LABEL_41;
  }
  if (!v14) {
    goto LABEL_20;
  }
  if ((id)[(BRShareSettings *)settings defaultPermission] != (id)3)
  {
    if ((id)[(BRShareSettings *)self->_settings defaultPermission] != (id)2) {
      goto LABEL_42;
    }
    objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v26 = v25;
    CFStringRef v27 = @"SETTINGS_DETAIL_ACL_RO_TEXT";
    CFStringRef v28 = @"People you invite can view.";
    goto LABEL_41;
  }
  CFStringRef v16 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  CFStringRef v17 = v16;
  if (v3)
  {
    CFStringRef v18 = @"SETTINGS_DETAIL_ACL_RW_ADD_OTHERS_TEXT";
    CFStringRef v19 = @"People you invite can make changes and add others.";
  }
  else
  {
    CFStringRef v18 = @"SETTINGS_DETAIL_ACL_RW_TEXT";
    CFStringRef v19 = @"People you invite can make changes.";
  }
  v29 = [v16 localizedStringForKey:v18 value:v19 table:@"Localizable"];
  v30 = [(BRShareSettingsButton *)self->_shareSettingsButton detailLabel];
  [v30 setText:v29];

  if (!v3)
  {

    if ((v12 & 1) == 0) {
      goto LABEL_42;
    }
    objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v26 = v25;
    CFStringRef v27 = @"SETTINGS_DETAIL_REMINDERS_TEXT";
    goto LABEL_40;
  }

  if ((v12 & 1) == 0) {
    goto LABEL_42;
  }
  objc_super v25 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v26 = v25;
  CFStringRef v27 = @"SETTINGS_DETAIL_REMINDERS_ADD_OTHERS_TEXT";
LABEL_35:
  CFStringRef v28 = @"People you invite can add others.";
LABEL_41:
  v33 = [v25 localizedStringForKey:v27 value:v28 table:@"Localizable"];
  v34 = [(BRShareSettingsButton *)self->_shareSettingsButton detailLabel];
  [v34 setText:v33];

LABEL_42:
  unsigned int v35 = [v45 shareViewControllerIsFolderShare:self];
  uint64_t v36 = [v45 shareViewControllerThumbnail:self];
  v37 = (void *)v36;
  if (v35)
  {
    uint64_t v38 = +[UIImage imageNamed:@"Folder140pt"];

    v37 = (void *)v38;
  }
  else if (!v36)
  {
    v37 = +[UIImage imageNamed:@"DefaultThumbnail"];
  }
  uint64_t v39 = [(_UIShareOverviewController *)self itemName];
  v40 = (void *)v39;
  if (v39) {
    CFStringRef v41 = (const __CFString *)v39;
  }
  else {
    CFStringRef v41 = @" ";
  }
  v42 = [(BRShareDocumentInfoView *)self->_infoView itemTitleLabel];
  [v42 setText:v41];

  v43 = [(BRShareDocumentInfoView *)self->_infoView thumbnailView];
  [v43 setImage:v37];

  v44 = [(_UIShareOverviewActionController *)self traitCollection];
  [(_UIShareOverviewActionController *)self updatePreferredContentSize:v44];
}

- (void)setItemName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIShareOverviewActionController;
  [(_UIShareOverviewController *)&v4 setItemName:a3];
  [(_UIShareOverviewActionController *)self _updateInfo];
}

- (id)_ownerLabelTextForName:(id)a3 displayHandle:(id)a4
{
  id v5 = a4;
  id v6 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:a3 style:0 options:0];
  unsigned __int8 v7 = +[UIFontMetrics defaultMetrics];
  BOOL v8 = +[UIFont systemFontOfSize:12.0];
  int v9 = [v7 scaledFontForFont:v8];

  id v10 = objc_alloc((Class)NSMutableAttributedString);
  long long v11 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  unsigned __int8 v12 = [v11 localizedStringForKey:@"SHARE_INVITE_SHARE_AS_OWNER_TEXT" value:@"%@ (%@)" table:@"Localizable"];
  unsigned int v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v6, v5);

  v18[0] = NSFontAttributeName;
  v18[1] = NSForegroundColorAttributeName;
  v19[0] = v9;
  unsigned int v14 = +[UIColor secondaryLabelColor];
  v19[1] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v16 = [v10 initWithString:v13 attributes:v15];

  return v16;
}

- (void)updatePreferredContentSize:(id)a3
{
  BOOL v4 = [a3 verticalSizeClass] == (id)1;
  id v5 = [(_UIShareOverviewActionController *)self infoView];
  id v6 = [v5 infoTextLabel];
  [v6 setHidden:v4];

  id v8 = [(_UIShareOverviewActionController *)self infoView];
  unsigned __int8 v7 = [v8 thumbnailView];
  [v7 setHidden:v4];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIShareOverviewActionController;
  [(_UIShareOverviewController *)&v7 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    id v6 = [(_UIShareOverviewActionController *)self traitCollection];
    [(_UIShareOverviewActionController *)self updatePreferredContentSize:v6];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)_UIShareOverviewActionController;
  id v7 = a4;
  -[_UIShareOverviewActionController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027E20;
  v8[3] = &unk_10004D7F8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_10004D838];
}

- (void)shareDidChange
{
  unsigned int v3 = cdui_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    settings = self->_settings;
    int v7 = 138412290;
    id v8 = settings;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] got a new share, applying settings (%@) to share", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(_UIShareOverviewActionController *)self settings];
  id v6 = [(_UIShareOverviewController *)self share];
  [v5 applyToShare:v6];
}

- (void)updatePermissionOptions
{
  unsigned int v3 = [(_UIShareOverviewController *)self delegate];
  BOOL v4 = [(_UIShareOverviewController *)self share];
  id v5 = [v3 shareViewControllerAllowedPermissions:self];
  unint64_t v6 = (unint64_t)v5;
  if (v5 == (id)-1 || v5 != self->_lastPermissionOptions)
  {
    if ([v3 shareViewControllerIsInitialShare:self])
    {
      int v7 = [[BRShareSettings alloc] initWithPermissions:v6];
      settings = self->_settings;
      self->_settings = v7;

      self->_lastPermissionOptions = v6;
      objc_super v9 = cdui_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10002E6AC((uint64_t)&self->_settings, v6, v9);
      }

      id v10 = [(_UIShareOverviewActionController *)self settings];
      long long v11 = [(_UIShareOverviewController *)self share];
      [v10 applyToShare:v11];
    }
    else
    {
      if ([v4 publicPermission] == (id)1)
      {
        unint64_t v12 = v6 | 2;
        unsigned int v13 = [[BRShareSettings alloc] initWithShare:v4 permissions:v12];
        unsigned int v14 = self->_settings;
        self->_settings = v13;

        self->_lastPermissionOptions = v12;
        if (![(BRShareSettings *)self->_settings defaultPermission]) {
          [(BRShareSettings *)self->_settings setDefaultPermission:3];
        }
        v15 = cdui_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_10002E75C((uint64_t)&self->_settings);
        }
      }
      else
      {
        if ([v4 publicPermission] == (id)2) {
          unint64_t v16 = 5;
        }
        else {
          unint64_t v16 = 9;
        }
        CFStringRef v17 = [[BRShareSettings alloc] initWithShare:v4 permissions:v16];
        CFStringRef v18 = self->_settings;
        self->_settings = v17;

        self->_lastPermissionOptions = v16;
        v15 = cdui_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          sub_10002E7E0((uint64_t)&self->_settings);
        }
      }

      [(BRShareSettings *)self->_settings setShouldHideCopyLink:1];
    }
    [(_UIShareOverviewActionController *)self _updateInfo];
  }
}

- (id)_setupProgressView
{
  [(BRShareSettingsButton *)self->_shareSettingsButton size];
  double v4 = v3;
  [(BRTransportRegionView *)self->_transportRegion size];
  double v6 = v4 + v5;
  [(BRShareSettingsButton *)self->_shareSettingsButton setHidden:1];
  [(BRTransportRegionView *)self->_transportRegion setHidden:1];
  [(UIView *)self->_transportRegionTopSeparator setHidden:1];
  [(UIView *)self->_transportRegionBottomSeparator setHidden:1];
  int v7 = [[BRShareProgressView alloc] initWithProgress:0];
  [(BRShareProgressView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [(_UIShareOverviewActionController *)self view];
  [v8 addSubview:v7];

  objc_super v9 = [(_UIShareOverviewActionController *)self view];
  [v9 bringSubviewToFront:v7];

  id v10 = objc_opt_new();
  long long v11 = [(BRShareProgressView *)v7 topAnchor];
  unint64_t v12 = [(BRShareDocumentInfoView *)self->_infoView bottomAnchor];
  unsigned int v13 = [v11 constraintEqualToAnchor:v12];
  [v10 addObject:v13];

  unsigned int v14 = [(BRShareProgressView *)v7 leadingAnchor];
  v15 = [(_UIShareOverviewActionController *)self view];
  unint64_t v16 = [v15 leadingAnchor];
  CFStringRef v17 = [v14 constraintEqualToAnchor:v16];
  [v10 addObject:v17];

  CFStringRef v18 = [(BRShareProgressView *)v7 trailingAnchor];
  CFStringRef v19 = [(_UIShareOverviewActionController *)self view];
  v20 = [v19 trailingAnchor];
  double v21 = [v18 constraintEqualToAnchor:v20];
  [v10 addObject:v21];

  CFStringRef v22 = [(BRShareProgressView *)v7 bottomAnchor];
  CFStringRef v23 = [(_UIShareOverviewActionController *)self view];
  id v24 = [v23 bottomAnchor];
  objc_super v25 = [v22 constraintEqualToAnchor:v24];
  [v10 addObject:v25];

  v26 = [(BRShareProgressView *)v7 heightAnchor];
  CFStringRef v27 = [v26 constraintGreaterThanOrEqualToConstant:v6];
  [v10 addObject:v27];

  +[NSLayoutConstraint activateConstraints:v10];

  return v7;
}

- (void)waitForShareCreationWithActivityType:(id)a3 progressView:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  long long v11 = cdui_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] waiting for share to be ready", buf, 2u);
  }

  unint64_t v12 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  unsigned int v13 = [v12 localizedStringForKey:@"PROGRESS_UPLOADING_TEXT" value:@"Uploading" table:@"Localizable"];
  [v8 setTitle:v13];

  unsigned int v14 = [(_UIShareOverviewController *)self delegate];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_100028658;
  v19[3] = &unk_10004D860;
  id v20 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100028664;
  v17[3] = &unk_10004D888;
  v17[4] = self;
  id v18 = v9;
  id v15 = v9;
  id v16 = v8;
  [v14 shareViewController:self activityType:v10 waitForUploadWithProgress:v19 completion:v17];
}

- (void)presentReachabilityViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  double v6 = [(_UIShareOverviewActionController *)self navigationController];
  id v7 = [v6 popToViewController:self animated:v4];

  [v8 setModalPresentationStyle:6];
  [(_UIShareOverviewActionController *)self presentViewController:v8 animated:v4 completion:0];
}

- (int)popoverPresentationMode
{
  v2 = [(_UIShareOverviewController *)self delegate];
  int v3 = [v2 popoverPresentationMode];

  return v3;
}

- (BOOL)shareActivityControllerShouldPresentActivity:(id)a3
{
  int v3 = [(_UIShareOverviewController *)self error];
  BOOL v4 = v3 == 0;

  return v4;
}

- (BOOL)shareActivityControllerShouldAddParticipants:(id)a3
{
  int v3 = [(_UIShareOverviewController *)self share];
  BOOL v4 = [v3 publicPermission] == (id)1;

  return v4;
}

- (void)shareActivityController:(id)a3 prepareActivityPresentation:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(_UIShareOverviewController *)self delegate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000288FC;
  v11[3] = &unk_10004D160;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 shareViewController:self prepareActivity:v8 completion:v11];
}

- (void)shareViewController:(id)a3 addParticipants:(id)a4 activityType:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(_UIShareOverviewController *)self delegate];
  objc_msgSend(v12, "shareViewController:addParticipants:activityType:permission:completion:", self, v11, v10, -[BRShareSettings defaultPermission](self->_settings, "defaultPermission"), v9);
}

- (void)shareActivityController:(id)a3 prepareForActivity:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(_UIShareOverviewActionController *)self _setupProgressView];
  id v10 = cdui_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[INFO] existing subshare preflight check finished, activity controller preparation starts", buf, 2u);
  }

  +[NSDate timeIntervalSinceReferenceDate];
  id v11 = [v8 activityType];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028B4C;
  v13[3] = &unk_10004D2C8;
  id v14 = v7;
  id v12 = v7;
  [(_UIShareOverviewActionController *)self waitForShareCreationWithActivityType:v11 progressView:v9 completion:v13];
}

- (void)willNavigateFromViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v6 = [(_UIShareInvitationSettingsController *)self->_settingsViewController settings];
    [(_UIShareOverviewActionController *)self setSettings:v6];

    [(_UIShareOverviewActionController *)self _updateInfo];
  }
}

- (void)showShareSettings:(id)a3
{
  if (!self->_settingsViewController)
  {
    id v4 = objc_alloc_init(_UIShareInvitationSettingsController);
    settingsViewController = self->_settingsViewController;
    self->_settingsViewController = v4;

    double v6 = self->_settingsViewController;
    id v7 = self;
    [(_UIShareInvitationSettingsController *)v6 setDelegate:v7];
    id v8 = [(_UIShareOverviewActionController *)v7 settings];
    [(_UIShareInvitationSettingsController *)self->_settingsViewController setSettings:v8];

    id v9 = [(_UIShareOverviewController *)v7 delegate];
    [(_UIShareInvitationSettingsController *)self->_settingsViewController setOverviewControllerDelegate:v9];
    [(_UIShareInvitationSettingsController *)self->_settingsViewController setProxiedOverviewController:v7];

    id v10 = [v9 shareViewControllerCurrentParticipantsState];
    if ([v9 shareViewControllerAllowOthersToInvite] != (unint64_t)v10 < 2) {
      [v9 shareViewControllerSetAllowOthersToInvite:(unint64_t)v10 < 2];
    }
  }
  id v11 = [(_UIShareOverviewActionController *)self navigationController];
  [v11 pushViewController:self->_settingsViewController animated:1];
}

- (void)settingsControllerDidChange:(id)a3 changedAllowInviters:(BOOL)a4
{
  double v5 = [a3 settings];
  id v6 = [v5 copy];
  [(_UIShareOverviewActionController *)self setSettings:v6];

  id v7 = cdui_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10002E864(self);
  }

  [(_UIShareOverviewActionController *)self _updateInfo];
  id v8 = [(_UIShareOverviewController *)self share];

  if (v8)
  {
    id v9 = [(_UIShareOverviewActionController *)self settings];
    id v10 = [(_UIShareOverviewController *)self share];
    [v9 applyToShare:v10];
  }
}

- (BOOL)isHomeroomID:(id)a3
{
  int v3 = off_100061A20;
  id v4 = a3;
  double v5 = +[NSPredicate predicateWithFormat:@"self LIKE %@", v3];
  LOBYTE(v3) = [v5 evaluateWithObject:v4];

  return (char)v3;
}

- (id)activityViewControllerOperation:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIShareOverviewController *)self error];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028FCC;
    v8[3] = &unk_10004CA00;
    v8[4] = self;
    id v9 = v4;
    id v6 = +[NSBlockOperation blockOperationWithBlock:v8];
  }

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return +[NSURL URLWithString:@"https://www.apple.com/icloud"];
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  double v5 = v4;
  int v6 = v4 > 0.0;
  id v7 = [(_UIShareOverviewActionController *)self navigationItem];
  id v8 = [v7 rightBarButtonItem];
  unsigned int v9 = [v8 _hidden];

  if (v6 != v9)
  {
    id v10 = [(_UIShareOverviewActionController *)self navigationController];
    id v11 = [v10 navigationBar];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100029868;
    v12[3] = &unk_10004D200;
    v12[4] = self;
    BOOL v13 = v5 > 0.0;
    +[UIView transitionWithView:v11 duration:5242880 options:v12 animations:0 completion:0.3];
  }
}

- (_BRShareOverviewActivityViewController)embeddedActivityViewController
{
  return self->_embeddedActivityViewController;
}

- (void)setEmbeddedActivityViewController:(id)a3
{
}

- (UIStackView)vContainer
{
  return self->_vContainer;
}

- (void)setVContainer:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (_UIShareInvitationSettingsController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (BRTransportRegionView)transportRegion
{
  return self->_transportRegion;
}

- (void)setTransportRegion:(id)a3
{
}

- (UIView)transportRegionTopSeparator
{
  return self->_transportRegionTopSeparator;
}

- (void)setTransportRegionTopSeparator:(id)a3
{
}

- (UIView)transportRegionBottomSeparator
{
  return self->_transportRegionBottomSeparator;
}

- (void)setTransportRegionBottomSeparator:(id)a3
{
}

- (BRShareDocumentInfoView)infoView
{
  return self->_infoView;
}

- (void)setInfoView:(id)a3
{
}

- (BRShareSettingsButton)shareSettingsButton
{
  return self->_shareSettingsButton;
}

- (void)setShareSettingsButton:(id)a3
{
}

- (BRShareSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (unint64_t)lastPermissionOptions
{
  return self->_lastPermissionOptions;
}

- (void)setLastPermissionOptions:(unint64_t)a3
{
  self->_lastPermissionOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shareSettingsButton, 0);
  objc_storeStrong((id *)&self->_infoView, 0);
  objc_storeStrong((id *)&self->_transportRegionBottomSeparator, 0);
  objc_storeStrong((id *)&self->_transportRegionTopSeparator, 0);
  objc_storeStrong((id *)&self->_transportRegion, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_vContainer, 0);

  objc_storeStrong((id *)&self->_embeddedActivityViewController, 0);
}

@end