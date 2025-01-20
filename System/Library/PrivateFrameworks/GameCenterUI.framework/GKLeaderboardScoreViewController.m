@interface GKLeaderboardScoreViewController
+ (BOOL)restrictToFriendsOnly;
+ (void)setRestrictToFriendsOnly:(BOOL)a3;
- (BOOL)hasData;
- (BOOL)isDeeplinked;
- (BOOL)isLoading;
- (BOOL)shouldAutoRefreshHighlights;
- (BOOL)shouldPreferFocusToPlayerScopeControl;
- (BOOL)shouldRefreshAgain;
- (BOOL)updateHighlightsPersonalView;
- (CAGradientLayer)collectionViewFadeGradient;
- (GKLeaderboard)currentOccurrence;
- (GKLeaderboard)leaderboard;
- (GKLeaderboard)previousOccurrence;
- (GKLeaderboardEntry)localPlayerEntry;
- (GKLeaderboardEntry)playerAboveEntry;
- (GKLeaderboardEntry)playerBelowEntry;
- (GKLeaderboardEntry)topPlayerEntry;
- (GKLeaderboardMetadataView)personalView;
- (GKLeaderboardMetadataView)socialView;
- (GKLeaderboardScoreDataSource)dataSource;
- (GKLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4;
- (GKNoContentView)noContentView;
- (GKTimeScopeButton)timeScopeButton;
- (GKUnfocusableButton)scrollToTopButton;
- (NSLayoutConstraint)collectionContainerHeight;
- (NSLayoutConstraint)collectionGradientViewHeightConstraint;
- (NSLayoutConstraint)collectionGradientViewLandscapeTopConstraint;
- (NSLayoutConstraint)highlightViewHeightConstraint;
- (NSLayoutConstraint)highlightViewLandscapeTopConstraint;
- (NSLayoutConstraint)highlightViewWidthConstraint;
- (NSString)autoScrollToPlayerId;
- (UICollectionView)collectionView;
- (UICollectionViewCell)preferredFocusCell;
- (UIImageView)gameIconImageView;
- (UIImageView)releaseStateIcon;
- (UILabel)releaseStateHeaderText;
- (UILabel)releaseStateInfoText;
- (UILabel)titleLabel;
- (UIScrollView)mainScrollView;
- (UISegmentedControl)playerScopeControl;
- (UIStackView)highlightView;
- (UIStackView)releaseStateInfoBoxContents;
- (UIView)collectionContainer;
- (UIView)collectionGradientView;
- (UIView)releaseStateInfoBox;
- (UIView)timeScopeContainer;
- (double)startTime;
- (id)attributedStringWithSymbol:(id)a3;
- (id)formattedNumber:(id)a3;
- (id)preferredFocusEnvironments;
- (id)timeRemainingFromDate:(id)a3 toDate:(id)a4;
- (int64_t)initialPlayerScope;
- (int64_t)initialTimeScope;
- (int64_t)leaderboardOccurrence;
- (int64_t)playerScope;
- (int64_t)timeScope;
- (int64_t)totalEntries;
- (void)addLeaderboardHighlights;
- (void)addPlayerScopeControl;
- (void)autoRefreshHighlightsPersonalView;
- (void)backButtonPressed:(id)a3;
- (void)challengeWithScore:(id)a3;
- (void)clearSelection;
- (void)collectionViewDidScroll;
- (void)configureCloseButton;
- (void)configureFocusGuidesForPortraitNavigationBar;
- (void)configurePlayerScopeFocusGuide;
- (void)configureTimeScopeMenu;
- (void)dataUpdated:(BOOL)a3 withError:(id)a4;
- (void)dealloc;
- (void)didEnterLoadingState;
- (void)didLoadAdditionalScoresWithUpdatedTotalEntries:(unint64_t)a3;
- (void)didLoadScoresWithLocalPlayerEntry:(id)a3 topPlayer:(id)a4 playerAbove:(id)a5 playerBelow:(id)a6 totalEntries:(int64_t)a7;
- (void)donePressed:(id)a3;
- (void)enableDisableCollectionViewScrolling;
- (void)hideNoContentPlaceholder;
- (void)loadData;
- (void)loadLeaderboardForOccurrence:(int64_t)a3 handler:(id)a4;
- (void)playerScopeChanged:(id)a3;
- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4;
- (void)scrollToTopPressed:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)sendFriendInvitationViaMessagesTo:(id)a3 withPresentingViewController:(id)a4;
- (void)setAutoScrollToPlayerId:(id)a3;
- (void)setCollectionContainer:(id)a3;
- (void)setCollectionContainerHeight:(id)a3;
- (void)setCollectionGradientView:(id)a3;
- (void)setCollectionGradientViewHeightConstraint:(id)a3;
- (void)setCollectionGradientViewLandscapeTopConstraint:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setCollectionViewFadeGradient:(id)a3;
- (void)setCurrentOccurrence:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setGameIconImageView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlightViewHeightConstraint:(id)a3;
- (void)setHighlightViewLandscapeTopConstraint:(id)a3;
- (void)setHighlightViewWidthConstraint:(id)a3;
- (void)setInitialPlayerScope:(int64_t)a3;
- (void)setInitialTimeScope:(int64_t)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardOccurrence:(int64_t)a3;
- (void)setLocalPlayerEntry:(id)a3;
- (void)setMainScrollView:(id)a3;
- (void)setNeedsRefresh;
- (void)setNoContentView:(id)a3;
- (void)setPersonalView:(id)a3;
- (void)setPlayerAboveEntry:(id)a3;
- (void)setPlayerBelowEntry:(id)a3;
- (void)setPlayerScope:(int64_t)a3;
- (void)setPlayerScope:(int64_t)a3 restrictToFriendsOnly:(BOOL)a4;
- (void)setPlayerScopeControl:(id)a3;
- (void)setPreferredFocusCell:(id)a3;
- (void)setPreviousOccurrence:(id)a3;
- (void)setReleaseStateHeaderText:(id)a3;
- (void)setReleaseStateIcon:(id)a3;
- (void)setReleaseStateInfoBox:(id)a3;
- (void)setReleaseStateInfoBoxContents:(id)a3;
- (void)setReleaseStateInfoText:(id)a3;
- (void)setScrollToTopButton:(id)a3;
- (void)setShouldAutoRefreshHighlights:(BOOL)a3;
- (void)setShouldPreferFocusToPlayerScopeControl:(BOOL)a3;
- (void)setShouldRefreshAgain:(BOOL)a3;
- (void)setSocialView:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setTimeScopeButton:(id)a3;
- (void)setTimeScopeContainer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopPlayerEntry:(id)a3;
- (void)setTotalEntries:(int64_t)a3;
- (void)setupFadeGradient;
- (void)setupNoContentView:(id)a3 withError:(id)a4;
- (void)setupReleaseStateInfo;
- (void)setupVisualEffect;
- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5 relativeRect:(CGRect)a6;
- (void)shareWithScore:(id)a3 fromView:(id)a4;
- (void)showNoContentPlaceholderForError:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContentSize;
- (void)updateHighlights;
- (void)updatePlayerScopeLayoutForSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation GKLeaderboardScoreViewController

- (GKLeaderboardScoreViewController)initWithGameRecord:(id)a3 leaderboard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    v8 = @"GKLeaderboardScoreViewController_xrOS";
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    v10 = [v9 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

    v12 = @"GKLeaderboardScoreViewController_iOS";
    if (IsAccessibilityCategory) {
      v12 = @"GKLeaderboardScoreViewControllerAX_iOS";
    }
    v8 = v12;
  }
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v23.receiver = self;
  v23.super_class = (Class)GKLeaderboardScoreViewController;
  v14 = [(GKLoadingViewController *)&v23 initWithNibName:v8 bundle:v13];

  if (v14)
  {
    [(GKLeaderboardScoreViewController *)v14 setInitialPlayerScope:1];
    [(GKLeaderboardScoreViewController *)v14 setLeaderboard:v7];
    if ([v7 type] == 1) {
      [(GKLeaderboardScoreViewController *)v14 setCurrentOccurrence:v7];
    }
    v15 = [v7 title];
    [(GKLeaderboardScoreViewController *)v14 setTitle:v15];

    [(GKLoadingViewController *)v14 setLoadingIndicatorDelay:0.0];
    v16 = [[GKLeaderboardScoreDataSource alloc] initWithGameRecord:v6 leaderboard:v7];
    objc_initWeak(&location, v14);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke;
    v19[3] = &unk_1E5F66478;
    objc_copyWeak(&v21, &location);
    v17 = v14;
    v20 = v17;
    [(GKLeaderboardScoreDataSource *)v16 setInviteFriendHandler:v19];
    [(GKLeaderboardScoreViewController *)v17 setDataSource:v16];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F637E8] shared];
  int v5 = [v4 isAddingFriendsRestricted];

  if (!v5)
  {
    int v17 = _os_feature_enabled_impl();
    if (v3 || !v17)
    {
      if (v3)
      {
        if ([v3 supportsFriendingViaPush])
        {
          v25 = [v3 contactAssociationID];

          if (v25)
          {
            v26 = [*(id *)(a1 + 32) leaderboard];
            v27 = [v26 identifier];
            +[GKMetricsBridge recordInviteFriendClickEventWithType:0 pageType:@"leaderboard" pageId:v27];

            v28 = [v3 contact];
            v29 = [v28 identifier];
            v30 = [v3 contactAssociationID];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_2;
            v35[3] = &unk_1E5F66450;
            id v36 = *(id *)(a1 + 32);
            id v37 = v3;
            objc_copyWeak(&v38, (id *)(a1 + 40));
            +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:v29 contactAssociationID:v30 completionHandler:v35];

            objc_destroyWeak(&v38);
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      v18 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

      if (WeakRetained)
      {
        v20 = [*(id *)(a1 + 32) leaderboard];
        id v21 = [v20 identifier];
        +[GKMetricsBridge recordInviteFriendClickEventWithType:2 pageType:@"leaderboard" pageId:v21];

        id v22 = objc_loadWeakRetained(v18);
        objc_super v23 = +[GKFriendingViewControllers inviteFriendsWithContainerViewController:v22];

        id v24 = objc_loadWeakRetained(v18);
        [v24 presentViewController:v23 animated:1 completion:0];

LABEL_15:
        goto LABEL_16;
      }
    }
    if (v3) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
    v32 = [*(id *)(a1 + 32) leaderboard];
    v33 = [v32 identifier];
    +[GKMetricsBridge recordInviteFriendClickEventWithType:v31 pageType:@"leaderboard" pageId:v33];

    v34 = *(void **)(a1 + 32);
    objc_super v23 = objc_loadWeakRetained((id *)(a1 + 40));
    [v34 sendFriendInvitationViaMessagesTo:v3 withPresentingViewController:v23];
    goto LABEL_15;
  }
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = GKGameCenterUIFrameworkBundle();
  v8 = GKGetLocalizedStringFromTableInBundle();
  v9 = GKGameCenterUIFrameworkBundle();
  v10 = GKGetLocalizedStringFromTableInBundle();
  v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = GKGameCenterUIFrameworkBundle();
  v14 = GKGetLocalizedStringFromTableInBundle();
  v15 = [v12 actionWithTitle:v14 style:0 handler:0];
  [v11 addAction:v15];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  [v16 presentViewController:v11 animated:1 completion:0];

LABEL_16:
}

void __67__GKLeaderboardScoreViewController_initWithGameRecord_leaderboard___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    int v5 = *MEMORY[0x1E4F63858];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63858], OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Unable to send friend invitation via push, falling back to Messages flow. %@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v6 sendFriendInvitationViaMessagesTo:v7 withPresentingViewController:WeakRetained];
  }
}

- (void)addLeaderboardHighlights
{
  id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    int v5 = @"GKLeaderboardMetadataViewAX_iOS";
  }
  else if (GKIsXRUIIdiomShouldUsePadUI())
  {
    int v5 = @"GKLeaderboardMetadataView_xrOS";
  }
  else
  {
    int v5 = +[NSObject _gkPlatformNibName];
  }
  id v6 = [v14 loadNibNamed:v5 owner:self options:0];
  uint64_t v7 = [v6 firstObject];
  [(GKLeaderboardScoreViewController *)self setPersonalView:v7];

  v8 = [v14 loadNibNamed:v5 owner:self options:0];
  int v9 = [v8 firstObject];
  [(GKLeaderboardScoreViewController *)self setSocialView:v9];

  id v10 = [(GKLeaderboardScoreViewController *)self highlightView];
  uint64_t v11 = [(GKLeaderboardScoreViewController *)self personalView];
  [v10 addArrangedSubview:v11];

  v12 = [(GKLeaderboardScoreViewController *)self highlightView];
  v13 = [(GKLeaderboardScoreViewController *)self socialView];
  [v12 addArrangedSubview:v13];

  [(GKLeaderboardScoreViewController *)self updateHighlights];
}

- (void)autoRefreshHighlightsPersonalView
{
  if ([(GKLeaderboardScoreViewController *)self shouldAutoRefreshHighlights])
  {
    if (![(GKLeaderboardScoreViewController *)self leaderboardOccurrence]) {
      [(GKLeaderboardScoreViewController *)self updateHighlightsPersonalView];
    }
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__GKLeaderboardScoreViewController_autoRefreshHighlightsPersonalView__block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__GKLeaderboardScoreViewController_autoRefreshHighlightsPersonalView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoRefreshHighlightsPersonalView];
}

- (id)attributedStringWithSymbol:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = (void *)MEMORY[0x1E4FB0870];
  uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v4];

  v8 = [v6 textAttachmentWithImage:v7];

  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  id v10 = (void *)MEMORY[0x1E4FB2988];
  if (!ShouldUsePadUI) {
    id v10 = (void *)MEMORY[0x1E4FB2928];
  }
  uint64_t v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v10];
  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
  [v5 appendAttributedString:v12];

  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v17[0] = *MEMORY[0x1E4FB06F8];
  v17[1] = v13;
  v18[0] = v11;
  id v14 = [MEMORY[0x1E4FB1618] labelColor];
  v18[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  objc_msgSend(v5, "addAttributes:range:", v15, 0, objc_msgSend(v5, "length"));

  return v5;
}

- (BOOL)updateHighlightsPersonalView
{
  v76[1] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = [(GKLeaderboardScoreViewController *)self leaderboard];
  uint64_t v4 = [v3 type];

  if (v4 != 1)
  {
LABEL_4:
    if ([(GKLeaderboardScoreViewController *)self hasData]
      && ([(GKLeaderboardScoreViewController *)self localPlayerEntry],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 rank],
          v10,
          v11 >= 1))
    {
      v12 = [(GKLeaderboardScoreViewController *)self leaderboard];
      if ([v12 playerScope])
      {

LABEL_8:
        uint64_t v13 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
        uint64_t v14 = [v13 selectedSegmentIndex];
        v15 = NSString;
        id v16 = GKGameCenterUIFrameworkBundle();
        GKGetLocalizedStringFromTableInBundle();
        if (v14 < 1) {
          int v17 = {;
        }
          v19 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
          id v21 = objc_msgSend(v15, "localizedStringWithFormat:", v17, objc_msgSend(v19, "rank"), -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
        }
        else {
          int v17 = {;
        }
          v18 = NSNumber;
          v19 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
          v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "rank"));
          id v21 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v20);
        }
        v55 = [(GKLeaderboardScoreViewController *)self personalView];
        v56 = [MEMORY[0x1E4F63760] local];
        v75 = v56;
        v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
        v58 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
        v59 = [v58 formattedScore];
        [v55 configureWithPlayers:v57 title:v59 footnote:v21];

        return 0;
      }
      uint64_t v36 = [(GKLeaderboardScoreViewController *)self totalEntries];

      if (v36 < 1) {
        goto LABEL_8;
      }
      id v37 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      uint64_t v38 = 100 * [v37 rank];
      int64_t v39 = v38 / [(GKLeaderboardScoreViewController *)self totalEntries];

      if (v39 <= 1) {
        unint64_t v40 = 1;
      }
      else {
        unint64_t v40 = v39;
      }
      v41 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      uint64_t v42 = [v41 rank];

      if (v42 > 10)
      {
        if (v40 > 0xA) {
          goto LABEL_8;
        }
        v74 = [(GKLeaderboardScoreViewController *)self personalView];
        v61 = [MEMORY[0x1E4F63760] local];
        v76[0] = v61;
        v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
        v63 = NSString;
        v64 = GKGameCenterUIFrameworkBundle();
        v65 = GKGetLocalizedStringFromTableInBundle();
        v66 = [NSNumber numberWithInteger:v40];
        v67 = objc_msgSend(v63, "localizedStringWithFormat:", v65, v66);
        v68 = NSString;
        v69 = GKGameCenterUIFrameworkBundle();
        v70 = GKGetLocalizedStringFromTableInBundle();
        v71 = objc_msgSend(v68, "localizedStringWithFormat:", v70, -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
        [v74 configureWithPlayers:v62 title:v67 footnote:v71];
      }
      else
      {
        v72 = [(GKLeaderboardScoreViewController *)self personalView];
        v43 = NSString;
        v73 = GKGameCenterUIFrameworkBundle();
        v44 = GKGetLocalizedStringFromTableInBundle();
        v45 = NSNumber;
        v46 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
        v47 = objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "rank"));
        v48 = objc_msgSend(v43, "localizedStringWithFormat:", v44, v47);
        v49 = GKGameCenterUIFrameworkBundle();
        v50 = GKGetLocalizedStringFromTableInBundle();
        v51 = NSString;
        v52 = GKGameCenterUIFrameworkBundle();
        v53 = GKGetLocalizedStringFromTableInBundle();
        v54 = objc_msgSend(v51, "localizedStringWithFormat:", v53, -[GKLeaderboardScoreViewController totalEntries](self, "totalEntries"));
        [v72 configureWithRank:v48 title:v50 footnote:v54 vibrant:1];
      }
    }
    else
    {
      id v22 = [(GKLeaderboardScoreViewController *)self personalView];
      objc_super v23 = GKGameCenterUIFrameworkBundle();
      id v24 = GKGetLocalizedStringFromTableInBundle();
      v25 = GKGameCenterUIFrameworkBundle();
      v26 = GKGetLocalizedStringFromTableInBundle();
      [v22 configureWithRank:@"👏" title:v24 footnote:v26 vibrant:0];
    }
    return 0;
  }
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [(GKLeaderboardScoreViewController *)self leaderboard];
  uint64_t v7 = [v6 startDate];
  v8 = [(GKLeaderboardScoreViewController *)self leaderboard];
  [v8 duration];
  int v9 = objc_msgSend(v7, "dateByAddingTimeInterval:");

  if ([v5 compare:v9] != -1)
  {

    goto LABEL_4;
  }
  v27 = [(GKLeaderboardScoreViewController *)self timeRemainingFromDate:v5 toDate:v9];
  v28 = [(GKLeaderboardScoreViewController *)self attributedStringWithSymbol:@"timer"];
  v29 = [(GKLeaderboardScoreViewController *)self personalView];
  v30 = GKGameCenterUIFrameworkBundle();
  uint64_t v31 = GKGetLocalizedStringFromTableInBundle();
  BOOL v32 = 1;
  [v29 configureWithRank:&stru_1F07B2408 title:v27 footnote:v31 vibrant:1];

  v33 = [(GKLeaderboardScoreViewController *)self personalView];
  v34 = [v33 rank];
  [v34 setAttributedText:v28];

  v35 = [(GKLeaderboardScoreViewController *)self personalView];
  [v35 configureVibrancy:1];

  return v32;
}

- (void)updateHighlights
{
  v68[1] = *MEMORY[0x1E4F143B8];
  [(GKLeaderboardScoreViewController *)self updateHighlightsPersonalView];
  if (![(GKLeaderboardScoreViewController *)self hasData])
  {
    uint64_t v7 = NSString;
    v8 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v8 selectedSegmentIndex];
    int v9 = GKGameCenterUIFrameworkBundle();
    id v10 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v7, "localizedStringWithFormat:", v10, 0);
    id v64 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v11 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    if ([v11 selectedSegmentIndex] == 1)
    {
      v12 = NSString;
      uint64_t v13 = GKGameCenterUIFrameworkBundle();
      uint64_t v14 = GKGetLocalizedStringFromTableInBundle();
      v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, 0);
    }
    else
    {
      uint64_t v13 = GKGameCenterUIFrameworkBundle();
      v15 = GKGetLocalizedStringFromTableInBundle();
    }

    id v16 = [(GKLeaderboardScoreViewController *)self socialView];
    int v17 = [(GKLeaderboardScoreViewController *)self formattedNumber:&unk_1F0812210];
    [v16 configureWithRank:v17 title:v64 footnote:v15 vibrant:1];

    goto LABEL_20;
  }
  dispatch_time_t v3 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  uint64_t v4 = [v3 selectedSegmentIndex];

  if (v4 <= 0)
  {
    v18 = [(GKLeaderboardScoreViewController *)self playerAboveEntry];

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E4F63740];
      v20 = [(GKLeaderboardScoreViewController *)self playerAboveEntry];
      id v21 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      id v22 = [v19 formattedDifferenceBetweenFirstScore:v20 secondScore:v21];

      if ([v22 length])
      {
        v62 = [(GKLeaderboardScoreViewController *)self socialView];
        id v65 = [(GKLeaderboardScoreViewController *)self playerAboveEntry];
        [v65 player];
        v24 = objc_super v23 = v22;
        v68[0] = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
        v26 = [(GKLeaderboardScoreViewController *)self playerAboveEntry];
        v27 = [v26 player];
        v28 = [v27 alias];
        v29 = NSString;
        v30 = GKGameCenterUIFrameworkBundle();
        uint64_t v31 = GKGetLocalizedStringFromTableInBundle();
        BOOL v32 = objc_msgSend(v29, "localizedStringWithFormat:", v31, v23);
        v33 = v62;
        [v62 configureWithPlayers:v25 title:v28 footnote:v32];

LABEL_27:
        return;
      }
LABEL_32:

      goto LABEL_3;
    }
    v49 = [(GKLeaderboardScoreViewController *)self playerBelowEntry];

    if (v49)
    {
      v50 = (void *)MEMORY[0x1E4F63740];
      v51 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      v52 = [(GKLeaderboardScoreViewController *)self playerBelowEntry];
      id v22 = [v50 formattedDifferenceBetweenFirstScore:v51 secondScore:v52];

      if (![v22 length]) {
        goto LABEL_32;
      }
      v63 = [(GKLeaderboardScoreViewController *)self socialView];
      id v65 = [(GKLeaderboardScoreViewController *)self playerBelowEntry];
      [v65 player];
      v24 = objc_super v23 = v22;
      v67 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      v26 = [(GKLeaderboardScoreViewController *)self playerBelowEntry];
      v27 = [v26 player];
      v53 = [v27 alias];
      v54 = NSString;
      v55 = GKGameCenterUIFrameworkBundle();
    }
    else
    {
      id v22 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      if ([v22 rank] < 2) {
        goto LABEL_32;
      }
      v58 = [(GKLeaderboardScoreViewController *)self topPlayerEntry];

      if (!v58) {
        goto LABEL_3;
      }
      v59 = (void *)MEMORY[0x1E4F63740];
      v60 = [(GKLeaderboardScoreViewController *)self topPlayerEntry];
      v61 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
      id v22 = [v59 formattedDifferenceBetweenFirstScore:v60 secondScore:v61];

      if (![v22 length]) {
        goto LABEL_32;
      }
      v63 = [(GKLeaderboardScoreViewController *)self socialView];
      id v65 = [(GKLeaderboardScoreViewController *)self topPlayerEntry];
      [v65 player];
      v24 = objc_super v23 = v22;
      v66 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
      v26 = [(GKLeaderboardScoreViewController *)self topPlayerEntry];
      v27 = [v26 player];
      v53 = [v27 alias];
      v54 = NSString;
      v55 = GKGameCenterUIFrameworkBundle();
    }
    v56 = GKGetLocalizedStringFromTableInBundle();
    v57 = objc_msgSend(v54, "localizedStringWithFormat:", v56, v23);
    v33 = v63;
    [v63 configureWithPlayers:v25 title:v53 footnote:v57];

    goto LABEL_27;
  }
LABEL_3:
  id v5 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  if ([v5 selectedSegmentIndex])
  {
    int64_t v6 = [(GKLeaderboardScoreViewController *)self totalEntries];
  }
  else
  {
    v34 = [(GKLeaderboardScoreViewController *)self localPlayerEntry];
    BOOL v35 = [v34 rank] > 0;
    int64_t v6 = [(GKLeaderboardScoreViewController *)self totalEntries] - v35;
  }
  uint64_t v36 = NSString;
  id v37 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  if ([v37 selectedSegmentIndex])
  {
    objc_msgSend(v36, "localizedStringWithFormat:", @"%ld", v6);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v38 = GKGameCenterUIFrameworkBundle();
    int64_t v39 = GKGetLocalizedStringFromTableInBundle();
    objc_msgSend(v36, "localizedStringWithFormat:", v39, v6);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v40 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  if ([v40 selectedSegmentIndex] == 1)
  {
    v41 = NSString;
    uint64_t v42 = GKGameCenterUIFrameworkBundle();
    v43 = GKGetLocalizedStringFromTableInBundle();
    v44 = objc_msgSend(v41, "localizedStringWithFormat:", v43, v6);
  }
  else
  {
    uint64_t v42 = GKGameCenterUIFrameworkBundle();
    v44 = GKGetLocalizedStringFromTableInBundle();
  }

  v45 = [(GKLeaderboardScoreViewController *)self socialView];
  [v45 configureWithRank:&stru_1F07B2408 title:v64 footnote:v44 vibrant:1];

  v46 = [(GKLeaderboardScoreViewController *)self attributedStringWithSymbol:@"globe"];
  v47 = [(GKLeaderboardScoreViewController *)self socialView];
  v48 = [v47 rank];
  [v48 setAttributedText:v46];

LABEL_20:
}

- (id)formattedNumber:(id)a3
{
  return (id)[MEMORY[0x1E4F28EE0] localizedStringFromNumber:a3 numberStyle:1];
}

- (int64_t)initialTimeScope
{
  return sInitialTimeScope;
}

- (void)setInitialTimeScope:(int64_t)a3
{
  sInitialTimeScope = a3;
}

+ (BOOL)restrictToFriendsOnly
{
  return sRestrictToFriendsOnly;
}

+ (void)setRestrictToFriendsOnly:(BOOL)a3
{
  sRestrictToFriendsOnly = a3;
}

- (void)setupReleaseStateInfo
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__GKLeaderboardScoreViewController_setupReleaseStateInfo__block_invoke;
  v25[3] = &unk_1E5F62EB0;
  v25[4] = self;
  dispatch_time_t v3 = (void (**)(void))_Block_copy(v25);
  if (_os_feature_enabled_impl()
    && ([(GKLeaderboardScoreViewController *)self leaderboard],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 releaseState],
        v4,
        v5 == 2))
  {
    int64_t v6 = [MEMORY[0x1E4FB1818] symbolImageNamed:@"clock.fill"];
    id v7 = [MEMORY[0x1E4FB1618] systemGray2Color];
    uint64_t v8 = [v7 CGColor];

    int v9 = [(GKLeaderboardScoreViewController *)self releaseStateInfoBox];
    id v10 = [v9 layer];
    [v10 setBackgroundColor:v8];

    uint64_t v11 = [(GKLeaderboardScoreViewController *)self releaseStateInfoBox];
    v12 = [v11 layer];
    [v12 setCornerRadius:14.0];

    uint64_t v13 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v14 = [(GKLeaderboardScoreViewController *)self releaseStateInfoText];
    v15 = [v14 font];
    [v15 pointSize];
    id v16 = objc_msgSend(v13, "boldSystemFontOfSize:");

    uint64_t v26 = *MEMORY[0x1E4FB06F8];
    v27[0] = v16;
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19 = objc_msgSend(MEMORY[0x1E4F63998], "PRERELEASE_ITEM");
    v20 = (void *)[v18 initWithString:v19 attributes:v17];
    id v21 = [(GKLeaderboardScoreViewController *)self releaseStateHeaderText];
    [v21 setAttributedText:v20];

    id v22 = objc_msgSend(MEMORY[0x1E4F63998], "LEADERBOARD_PENDING_APPROVAL");
    objc_super v23 = [(GKLeaderboardScoreViewController *)self releaseStateInfoText];
    [v23 setText:v22];

    id v24 = [(GKLeaderboardScoreViewController *)self releaseStateIcon];
    [v24 setImage:v6];
  }
  else
  {
    v3[2](v3);
  }
}

void __57__GKLeaderboardScoreViewController_setupReleaseStateInfo__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) releaseStateInfoBox];
  dispatch_time_t v3 = [v2 heightAnchor];
  uint64_t v4 = [v3 constraintEqualToConstant:0.0];
  [v4 setActive:1];

  id v5 = [*(id *)(a1 + 32) releaseStateInfoBox];
  [v5 setHidden:1];
}

- (void)viewDidLoad
{
  v95[1] = *MEMORY[0x1E4F143B8];
  v93.receiver = self;
  v93.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v93 viewDidLoad];
  dispatch_time_t v3 = [MEMORY[0x1E4F636C8] daemonProxy];
  [v3 addDataUpdateDelegate:self];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v5 = [MEMORY[0x1E4F28F08] mainQueue];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke;
  v92[3] = &unk_1E5F664A0;
  v92[4] = self;
  id v6 = (id)[v4 addObserverForName:@"GKRefreshDataTypeFriendRecommendations" object:0 queue:v5 usingBlock:v92];

  id v7 = [(UIViewController *)self _gkExtensionViewController];
  uint64_t v8 = [(GKLeaderboardScoreViewController *)self leaderboard];
  int v9 = [v8 identifier];
  [v7 dashboardDidChangeToLeaderboardIdentifier:v9];

  id v10 = (unsigned char *)MEMORY[0x1E4F63830];
  if (*MEMORY[0x1E4F63830]) {
    [(GKLeaderboardScoreViewController *)self setupVisualEffect];
  }
  uint64_t v11 = [(GKLeaderboardScoreViewController *)self collectionView];
  v12 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v12 setupCollectionView:v11];

  uint64_t v13 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v13 setPresentationViewController:self];

  uint64_t v14 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v14 setLeaderboardScoreDelegate:self];

  v15 = [(GKLeaderboardScoreViewController *)self leaderboard];
  BOOL v16 = [v15 type] == 1;

  if (v16)
  {
    self->_int64_t timeScope = 2;
    int v17 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
    [v17 setLeaderboardOccurrence:0];

    self->_leaderboardOccurrence = 0;
    int64_t timeScope = self->_timeScope;
  }
  else
  {
    uint64_t v19 = sInitialTimeScope;
    v20 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
    [v20 setTimeScope:v19];

    int64_t timeScope = sInitialTimeScope;
    self->_int64_t timeScope = sInitialTimeScope;
  }
  id v21 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v21 setTimeScope:timeScope];

  int64_t v22 = [(GKLeaderboardScoreViewController *)self initialPlayerScope];
  [(GKLeaderboardScoreViewController *)self setPlayerScope:v22 restrictToFriendsOnly:sRestrictToFriendsOnly];
  objc_super v23 = [(GKLeaderboardScoreViewController *)self navigationItem];
  [v23 _setAutoScrollEdgeTransitionDistance:40.0];

  id v24 = [(GKLeaderboardScoreViewController *)self navigationItem];
  [v24 _setManualScrollEdgeAppearanceEnabled:1];

  v25 = [(GKLeaderboardScoreViewController *)self navigationItem];
  [v25 setLargeTitleDisplayMode:2];

  uint64_t v26 = [MEMORY[0x1E4FB1618] clearColor];
  v27 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v27 setBackgroundColor:v26];

  v28 = [(GKLeaderboardScoreViewController *)self collectionContainer];
  v29 = [v28 layer];
  [v29 setCornerRadius:14.0];

  v30 = [(GKLeaderboardScoreViewController *)self collectionContainer];
  uint64_t v31 = [v30 layer];
  [v31 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  BOOL v32 = [(GKLeaderboardScoreViewController *)self collectionContainer];
  v33 = [v32 layer];
  [v33 setMasksToBounds:1];

  [(GKLeaderboardScoreViewController *)self configureCloseButton];
  [(GKLeaderboardScoreViewController *)self addLeaderboardHighlights];
  [(GKLeaderboardScoreViewController *)self addPlayerScopeControl];
  [(GKLeaderboardScoreViewController *)self setupFadeGradient];
  v34 = [MEMORY[0x1E4F63A10] sharedTheme];
  BOOL v35 = [v34 secondaryLabelCompositingFilter];
  uint64_t v36 = [(GKLeaderboardScoreViewController *)self timeScopeContainer];
  id v37 = [v36 layer];
  [v37 setCompositingFilter:v35];

  [(GKLeaderboardScoreViewController *)self configureTimeScopeMenu];
  uint64_t v38 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
  int64_t v39 = [v38 titleLabel];
  [v39 setAdjustsFontForContentSizeCategory:1];

  unint64_t v40 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
  v41 = [v40 titleLabel];
  [v41 setAdjustsFontForContentSizeCategory:1];

  uint64_t v42 = [(GKLeaderboardScoreViewController *)self mainScrollView];
  [v42 setDelegate:self];

  v43 = [(GKLeaderboardScoreViewController *)self timeScopeButton];

  if (v43)
  {
    id v44 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    v45 = [(GKLeaderboardScoreViewController *)self view];
    [v45 addLayoutGuide:v44];

    v46 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
    v95[0] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1];
    [v44 setPreferredFocusEnvironments:v47];

    v48 = (void *)MEMORY[0x1E4F28DC8];
    v49 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
    v50 = [v49 superview];
    [v48 _gkInstallEdgeConstraintsForLayoutGuide:v44 containedWithinParentView:v50];
  }
  if (*v10) {
    goto LABEL_10;
  }
  v51 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
  v52 = [MEMORY[0x1E4FB1618] labelColor];
  [v51 setTitleColor:v52 forState:0];

  v53 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  v54 = [(GKLeaderboardScoreViewController *)self view];
  [v54 setBackgroundColor:v53];

  if (*v10)
  {
LABEL_10:
    v55 = [MEMORY[0x1E4FB1618] whiteColor];
    v56 = [v55 colorWithAlphaComponent:0.1];
    char v57 = 1;
    v58 = v56;
  }
  else
  {
    v85 = (void *)MEMORY[0x1E4FB1618];
    v55 = [MEMORY[0x1E4FB1618] whiteColor];
    v58 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    v56 = objc_msgSend(v85, "gk_dynamicColorWithLightColor:darkColor:", v55, v58);
    char v57 = 0;
  }
  v59 = [(GKLeaderboardScoreViewController *)self timeScopeContainer];
  [v59 setBackgroundColor:v56];

  if ((v57 & 1) == 0) {
  int v60 = *v10;
  }
  BOOL v61 = *v10 == 0;
  v62 = (void *)MEMORY[0x1E4FB1618];
  v63 = [MEMORY[0x1E4FB1618] whiteColor];
  id v64 = v63;
  if (v61)
  {
    v66 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    id v65 = objc_msgSend(v62, "gk_dynamicColorWithLightColor:darkColor:", v64, v66);
  }
  else
  {
    id v65 = [v63 colorWithAlphaComponent:0.08];
    v66 = v65;
  }
  BOOL v67 = v60 == 0;
  v68 = [(GKLeaderboardScoreViewController *)self collectionContainer];
  [v68 setBackgroundColor:v65];

  if (v67) {
  v69 = [(GKLeaderboardScoreViewController *)self collectionGradientView];
  }
  v94[0] = v69;
  v70 = [(GKLeaderboardScoreViewController *)self highlightView];
  v94[1] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  [(GKLoadingViewController *)self setViewsToHideWhileLoading:v71];

  objc_initWeak(&location, self);
  v72 = [(GKLeaderboardScoreViewController *)self dataSource];
  v73 = [v72 gameRecord];
  v74 = [v73 name];

  v75 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  v76 = [v75 preferredContentSizeCategory];
  LODWORD(v73) = UIContentSizeCategoryIsAccessibilityCategory(v76);

  v77 = [(GKLeaderboardScoreViewController *)self dataSource];
  v78 = [v77 gameRecord];
  uint64_t v86 = MEMORY[0x1E4F143A8];
  uint64_t v87 = 3221225472;
  v88 = __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke_2;
  v89 = &unk_1E5F664C8;
  objc_copyWeak(&v90, &location);
  id v79 = (id)[v78 loadIconForStyle:1 withCompletionHandler:&v86];

  v80 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
  v81 = v80;
  if (v73) {
    v82 = &stru_1F07B2408;
  }
  else {
    v82 = v74;
  }
  [v80 setTitle:v82 forState:0];

  v83 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
  [v83 setContentHorizontalAlignment:4];

  v84 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
  objc_msgSend(v84, "setContentEdgeInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  [(GKLeaderboardScoreViewController *)self setupReleaseStateInfo];
  objc_destroyWeak(&v90);

  objc_destroyWeak(&location);
}

void __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 userInfo];
  [v2 refreshContentsForDataType:4 userInfo:v3];
}

void __47__GKLeaderboardScoreViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    objc_copyWeak(&to, (id *)(a1 + 32));
    id v10 = objc_loadWeakRetained(&to);
    uint64_t v11 = [v10 gameIconImageView];
    [v11 setImage:v7];

    objc_destroyWeak(&to);
  }
}

- (id)timeRemainingFromDate:(id)a3 toDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    [v6 timeIntervalSinceDate:v5];
    double v10 = v9;
    if (v9 < 0.0)
    {
      id v11 = v5;

      id v7 = v11;
    }
    if (v10 >= 259200.0)
    {
      v12 = (void *)MEMORY[0x1E4F1C9C8];
      id v13 = v5;
      uint64_t v14 = v7;
      uint64_t v15 = 16;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F1C9C8];
      id v13 = v5;
      uint64_t v14 = v7;
      if (v10 < 86400.0)
      {
        uint64_t v15 = 224;
        uint64_t v16 = 1;
LABEL_11:
        id v8 = [v12 _gkFormattedTimeIntervalStringWithStartDate:v13 endDate:v14 calendarUnits:v15 style:v16];
        goto LABEL_12;
      }
      uint64_t v15 = 48;
    }
    uint64_t v16 = 2;
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (void)setupFadeGradient
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  [v3 setLocations:&unk_1F0812718];
  id v4 = [MEMORY[0x1E4FB1618] blackColor];
  v9[0] = [v4 CGColor];
  id v5 = [MEMORY[0x1E4FB1618] clearColor];
  v9[1] = [v5 CGColor];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 setColors:v6];

  objc_msgSend(v3, "setStartPoint:", 0.5, 0.88);
  objc_msgSend(v3, "setEndPoint:", 0.5, 1.0);
  id v7 = [(GKLeaderboardScoreViewController *)self collectionGradientView];
  id v8 = [v7 layer];
  [v8 setMask:v3];

  [(GKLeaderboardScoreViewController *)self setCollectionViewFadeGradient:v3];
}

- (void)dealloc
{
  id v3 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v3 setDataSource:0];

  id v4 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v4 setDelegate:0];

  id v5 = [MEMORY[0x1E4F636C8] daemonProxy];
  [v5 removeDataUpdateDelegate:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v7 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v14 viewWillAppear:a3];
  id v4 = [(GKLoadingViewController *)self loadingState];
  if (v4 == @"Initial") {
    [(GKLoadingViewController *)self setLoadingState:@"LoadingState"];
  }
  id v5 = [(GKLeaderboardScoreViewController *)self view];
  [v5 bounds];
  -[GKLeaderboardScoreViewController updatePlayerScopeLayoutForSize:](self, "updatePlayerScopeLayoutForSize:", v6, v7);

  [(GKLeaderboardScoreViewController *)self enableDisableCollectionViewScrolling];
  id v8 = [(GKLeaderboardScoreViewController *)self collectionView];
  double v9 = [v8 collectionViewLayout];
  [v9 invalidateLayout];

  id v10 = objc_alloc_init(MEMORY[0x1E4FB1D38]);
  [v10 addTarget:self action:sel_backButtonPressed_];
  [v10 setAllowedPressTypes:&unk_1F0812730];
  id v11 = [(GKLeaderboardScoreViewController *)self view];
  [v11 addGestureRecognizer:v10];

  v12 = [(GKLeaderboardScoreViewController *)self leaderboard];
  uint64_t v13 = [v12 type];

  if (v13 == 1)
  {
    [(GKLeaderboardScoreViewController *)self setShouldAutoRefreshHighlights:1];
    [(GKLeaderboardScoreViewController *)self autoRefreshHighlightsPersonalView];
  }
}

- (void)backButtonPressed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1790];
  id v5 = objc_msgSend(MEMORY[0x1E4FB1F48], "keyWindow", a3);
  double v6 = [v4 focusSystemForEnvironment:v5];
  id v9 = [v6 focusedItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(GKLeaderboardScoreViewController *)self setShouldPreferFocusToPlayerScopeControl:1];
    [(GKLeaderboardScoreViewController *)self setNeedsFocusUpdate];
  }
  else
  {
    double v7 = [(GKLeaderboardScoreViewController *)self navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (id)preferredFocusEnvironments
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(GKLeaderboardScoreViewController *)self shouldPreferFocusToPlayerScopeControl])
  {
    id v3 = [(GKLeaderboardScoreViewController *)self playerScopeControl];

    if (v3)
    {
      id v4 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      v19[0] = v4;
      id v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = (void **)v19;
LABEL_11:
      uint64_t v13 = [v5 arrayWithObjects:v6 count:1];

      goto LABEL_12;
    }
  }
  double v7 = [(GKLeaderboardScoreViewController *)self preferredFocusCell];

  if (v7)
  {
    id v4 = [(GKLeaderboardScoreViewController *)self preferredFocusCell];
    id v18 = v4;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    double v6 = &v18;
    goto LABEL_11;
  }
  id v8 = [(GKLeaderboardScoreViewController *)self dataSource];
  id v9 = [v8 localPlayerEntryIndexPath];

  if (!v9)
  {
    id v11 = [(GKLeaderboardScoreViewController *)self collectionView];
    v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    id v4 = [v11 cellForItemAtIndexPath:v12];

    if (v4)
    {
      int v17 = v4;
      id v5 = (void *)MEMORY[0x1E4F1C978];
      double v6 = &v17;
      goto LABEL_11;
    }
  }
  id v10 = [(GKLeaderboardScoreViewController *)self playerScopeControl];

  if (v10)
  {
    id v4 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    uint64_t v16 = v4;
    id v5 = (void *)MEMORY[0x1E4F1C978];
    double v6 = &v16;
    goto LABEL_11;
  }
  v15.receiver = self;
  v15.super_class = (Class)GKLeaderboardScoreViewController;
  uint64_t v13 = [(GKLeaderboardScoreViewController *)&v15 preferredFocusEnvironments];
LABEL_12:

  return v13;
}

- (void)setupVisualEffect
{
  id v7 = (id)objc_opt_new();
  id v3 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
  [v7 setBackgroundEffects:v3];

  [v7 _setGroupName:@"gameLayerGroup"];
  id v4 = [(GKLeaderboardScoreViewController *)self view];
  [v4 insertSubview:v7 atIndex:0];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = (void *)MEMORY[0x1E4F28DC8];
  double v6 = [(GKLeaderboardScoreViewController *)self view];
  [v5 _gkInstallEdgeConstraintsForView:v7 containedWithinParentView:v6];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v4 viewDidLayoutSubviews];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__GKLeaderboardScoreViewController_viewDidLayoutSubviews__block_invoke;
  block[3] = &unk_1E5F62EB0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__GKLeaderboardScoreViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateContentSize];
  id v11 = [*(id *)(a1 + 32) collectionGradientView];
  [v11 bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) collectionViewFadeGradient];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v9 viewDidAppear:a3];
  self->_startTime = CFAbsoluteTimeGetCurrent();
  [(GKLeaderboardScoreViewController *)self clearSelection];
  [(GKLeaderboardScoreViewController *)self setNeedsFocusUpdate];
  double v4 = [(GKLeaderboardScoreViewController *)self view];
  double v5 = [v4 window];
  double v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  double v7 = [(GKLeaderboardScoreViewController *)self leaderboard];
  double v8 = [v7 identifier];
  +[GKMetricsBridge recordLeaderboardPageEventWithPageId:v8 withReferrerData:[(GKLeaderboardScoreViewController *)self isDeeplinked]];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GKLeaderboardScoreViewController *)self setShouldAutoRefreshHighlights:0];
  double v5 = [(GKLeaderboardScoreViewController *)self view];
  [v5 removeAllGestureRecognizers];

  double v6 = [MEMORY[0x1E4F637F8] reporter];
  uint64_t v7 = *MEMORY[0x1E4F63200];
  [(GKLeaderboardScoreViewController *)self startTime];
  objc_msgSend(v6, "reportScreenTimeEventForType:withStartTimestamp:", v7);

  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v8 viewWillDisappear:v3];
}

- (void)configureCloseButton
{
  uint64_t v3 = [MEMORY[0x1E4FB14D0] _gkXmarkedCloseButtonWithTarget:self action:sel_donePressed_];
  int v4 = *MEMORY[0x1E4F63830];
  id v7 = (id)v3;
  if (*MEMORY[0x1E4F63830]) {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v3];
  }
  else {
    double v5 = 0;
  }
  double v6 = [(GKLeaderboardScoreViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  if (v4) {
}
  }

- (void)loadData
{
  uint64_t v3 = [(GKLeaderboardScoreViewController *)self dataSource];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__GKLeaderboardScoreViewController_loadData__block_invoke;
  v4[3] = &unk_1E5F645B0;
  v4[4] = self;
  [v3 loadDataWithCompletionHandler:v4];
}

void __44__GKLeaderboardScoreViewController_loadData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = [*(id *)(a1 + 32) shouldRefreshAgain];
  id v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    [v7 dataUpdated:a2 withError:v5];
    objc_super v8 = [*(id *)(a1 + 32) autoScrollToPlayerId];
    uint64_t v9 = [v8 length];

    id v10 = [*(id *)(a1 + 32) dataSource];
    id v11 = v10;
    if (v9)
    {
      v12 = [*(id *)(a1 + 32) autoScrollToPlayerId];
      id v13 = [v11 indexPathForPlayerId:v12];
    }
    else
    {
      int v14 = [v10 autoScrollToLocalPlayerPosition];

      if (!v14)
      {
        id v13 = 0;
LABEL_10:
        uint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "dataSource", v17, v18, v19, v20, v21);
        [v16 setAutoScrollToLocalPlayerPosition:1];

        goto LABEL_11;
      }
      id v11 = [*(id *)(a1 + 32) dataSource];
      id v13 = [v11 localPlayerEntryIndexPath];
    }

    if (v13)
    {
      objc_super v15 = [*(id *)(a1 + 32) collectionView];
      [v15 setHidden:1];

      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __44__GKLeaderboardScoreViewController_loadData__block_invoke_2;
      v20 = &unk_1E5F63350;
      uint64_t v21 = *(void *)(a1 + 32);
      id v13 = v13;
      id v22 = v13;
      dispatch_async(MEMORY[0x1E4F14428], &v17);
    }
    goto LABEL_10;
  }
  [v7 setShouldRefreshAgain:0];
  [*(id *)(a1 + 32) loadData];
LABEL_11:
}

void __44__GKLeaderboardScoreViewController_loadData__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) collectionView];
  [v2 scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:2 animated:0];

  uint64_t v3 = [*(id *)(a1 + 32) collectionView];
  [v3 setHidden:0];

  int v4 = [*(id *)(a1 + 32) navigationController];
  [v4 setNeedsFocusUpdate];
}

- (BOOL)hasData
{
  double v2 = [(GKLeaderboardScoreViewController *)self dataSource];
  char v3 = [v2 hasData];

  return v3;
}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v32 = a4;
  int v6 = [(GKLeaderboardScoreViewController *)self dataSource];
  uint64_t v7 = [v6 itemCount];

  if (v7 >= 1)
  {
    [(GKLoadingViewController *)self setLoadingState:@"LoadedState"];
    [(GKLeaderboardScoreViewController *)self hideNoContentPlaceholder];
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [(GKLoadingViewController *)self setLoadingState:@"NoContentState"];
  [(GKLeaderboardScoreViewController *)self showNoContentPlaceholderForError:v32];
  if (v4)
  {
LABEL_3:
    objc_super v8 = [(GKLeaderboardScoreViewController *)self collectionView];
    [v8 contentInset];
    double v10 = -v9;
    id v11 = [(GKLeaderboardScoreViewController *)self collectionView];
    objc_msgSend(v11, "setContentOffset:", 0.0, v10);

    v12 = [(GKLeaderboardScoreViewController *)self collectionView];
    [v12 reloadData];

    [(GKLeaderboardScoreViewController *)self setNeedsFocusUpdate];
  }
LABEL_4:
  id v13 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  uint64_t v14 = [v13 selectedSegmentIndex];

  if (!v14)
  {
    objc_super v15 = [(GKLeaderboardScoreViewController *)self dataSource];
    uint64_t v16 = [v15 itemCount];

    uint64_t v17 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v18 = *MEMORY[0x1E4F634E0];
    uint64_t v19 = *MEMORY[0x1E4F630E0];
    v20 = [NSNumber numberWithInteger:v16];
    [v17 reportEvent:v18 type:v19 friendsPlayedThisGame:v20];
  }
  uint64_t v21 = [(GKLeaderboardScoreViewController *)self title];

  if (!v21)
  {
    id v22 = [(GKLeaderboardScoreViewController *)self leaderboard];
    objc_super v23 = [v22 title];
    [(GKLeaderboardScoreViewController *)self setTitle:v23];

    id v24 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    v25 = [v24 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

    v27 = [(GKLeaderboardScoreViewController *)self scrollToTopButton];
    v28 = v27;
    if (IsAccessibilityCategory)
    {
      [v27 setTitle:&stru_1F07B2408 forState:0];
    }
    else
    {
      v29 = [(GKLeaderboardScoreViewController *)self leaderboard];
      v30 = [v29 title];
      uint64_t v31 = [v30 uppercaseString];
      [v28 setTitle:v31 forState:0];
    }
  }
}

- (void)showNoContentPlaceholderForError:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKLeaderboardScoreViewController *)self collectionView];

  if (v5)
  {
    int v6 = [(GKLeaderboardScoreViewController *)self collectionView];
    [v6 setHidden:1];

    uint64_t v7 = [(GKLeaderboardScoreViewController *)self noContentView];

    if (!v7)
    {
      objc_super v8 = [GKNoContentView alloc];
      [(UICollectionView *)self->_collectionView bounds];
      double v9 = -[GKNoContentView initWithFrame:](v8, "initWithFrame:");
      [(GKLeaderboardScoreViewController *)self setNoContentView:v9];

      double v10 = [(GKLeaderboardScoreViewController *)self noContentView];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v11 = [(GKLeaderboardScoreViewController *)self collectionView];
      v12 = [v11 superview];

      id v13 = [(GKLeaderboardScoreViewController *)self noContentView];
      uint64_t v14 = [(GKLeaderboardScoreViewController *)self collectionView];
      [v12 insertSubview:v13 aboveSubview:v14];

      objc_super v15 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v16 = [(GKLeaderboardScoreViewController *)self noContentView];
      uint64_t v17 = [(GKLeaderboardScoreViewController *)self collectionView];
      uint64_t v18 = objc_msgSend(v15, "_gkConstraintsForView:withinView:insets:", v16, v17, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [v12 addConstraints:v18];

      uint64_t v19 = [(GKLeaderboardScoreViewController *)self collectionGradientView];
      v20 = [(GKLeaderboardScoreViewController *)self highlightView];
      v24[1] = v20;
      uint64_t v21 = [(GKLeaderboardScoreViewController *)self noContentView];
      v24[2] = v21;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      [(GKLoadingViewController *)self setViewsToHideWhileLoading:v22];
    }
    [(GKLeaderboardScoreViewController *)self setupNoContentView:self->_noContentView withError:v4];
    objc_super v23 = [(GKLeaderboardScoreViewController *)self noContentView];
    [v23 setHidden:0];
  }
}

- (void)hideNoContentPlaceholder
{
  char v3 = [(GKLeaderboardScoreViewController *)self noContentView];
  [v3 setHidden:1];

  id v4 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v4 setHidden:0];
}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __65__GKLeaderboardScoreViewController_setupNoContentView_withError___block_invoke;
  id v22 = &unk_1E5F664F0;
  objc_copyWeak(&v23, &location);
  [v6 setButtonAction:&v19];
  objc_super v8 = [(GKLeaderboardScoreViewController *)self leaderboard];
  uint64_t v9 = [v8 type];

  if (v9 != 1)
  {
    unint64_t timeScope = self->_timeScope;
    if (timeScope < 2)
    {
      id v13 = GKGameCenterUIFrameworkBundle();
      uint64_t v14 = GKGetLocalizedStringFromTableInBundle();
      [v6 setTitle:v14];

      objc_super v15 = GKGameCenterUIFrameworkBundle();
      uint64_t v16 = GKGetLocalizedStringFromTableInBundle();
      [v6 setMessage:v16];

      goto LABEL_7;
    }
    if (timeScope != 2) {
      goto LABEL_8;
    }
  }
  double v10 = GKGameCenterUIFrameworkBundle();
  id v11 = GKGetLocalizedStringFromTableInBundle();
  [v6 setTitle:v11];

  [v6 setMessage:0];
LABEL_7:
  [v6 setButtonTitle:0];
LABEL_8:
  if (v7)
  {
    uint64_t v17 = GKGameCenterUIFrameworkBundle();
    uint64_t v18 = GKGetLocalizedStringFromTableInBundle();
    [v6 setMessage:v18];
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __65__GKLeaderboardScoreViewController_setupNoContentView_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 timeScopePressed:v3];
  }
  objc_destroyWeak(&to);
}

- (void)addPlayerScopeControl
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v3 = GKGameCenterUIFrameworkBundle();
  id v4 = GKGetLocalizedStringFromTableInBundle();
  v36[0] = v4;
  id v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();
  v36[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];

  objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v7];
  uint64_t v9 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 1)
  {
    double v11 = 140.0;
  }
  else if (GKIsXRUIIdiomShouldUsePadUI())
  {
    double v11 = 108.0;
  }
  else
  {
    v12 = [(GKLeaderboardScoreViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    objc_super v15 = [(GKLeaderboardScoreViewController *)self view];
    [v15 bounds];
    double v17 = v16;
    uint64_t v18 = [(GKLeaderboardScoreViewController *)self view];
    [v18 bounds];
    if (v14 >= v17) {
      double v21 = v20;
    }
    else {
      double v21 = v19;
    }
    double v11 = (v21 + -40.0) / (double)(unint64_t)[v7 count];
  }
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __57__GKLeaderboardScoreViewController_addPlayerScopeControl__block_invoke;
  id v32 = &unk_1E5F63D18;
  id v22 = v8;
  id v33 = v22;
  double v34 = v11;
  [v7 enumerateObjectsUsingBlock:&v29];
  objc_msgSend(v22, "addTarget:action:forControlEvents:", self, sel_playerScopeChanged_, 4096, v29, v30, v31, v32);
  uint64_t v35 = *MEMORY[0x1E4F3A370];
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  id v24 = [v22 layer];
  [v24 setBackgroundFilters:v23];

  [(GKLeaderboardScoreViewController *)self setPlayerScopeControl:v22];
  [(GKLeaderboardScoreViewController *)self configurePlayerScopeFocusGuide];
  int64_t v25 = [(GKLeaderboardScoreViewController *)self playerScope];
  if (!v25)
  {
    uint64_t v26 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v27 = v26;
    uint64_t v28 = 1;
    goto LABEL_13;
  }
  if (v25 == 1)
  {
    uint64_t v26 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v27 = v26;
    uint64_t v28 = 0;
LABEL_13:
    [v26 setSelectedSegmentIndex:v28];
  }
}

uint64_t __57__GKLeaderboardScoreViewController_addPlayerScopeControl__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWidth:forSegmentAtIndex:", *(double *)(a1 + 40));
}

- (void)configurePlayerScopeFocusGuide
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKLeaderboardScoreViewController *)self collectionContainer];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(GKLeaderboardScoreViewController *)self playerScopeControl];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1780]);
      id v7 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      v29[0] = v7;
      objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [v6 setPreferredFocusEnvironments:v8];

      uint64_t v9 = [(GKLeaderboardScoreViewController *)self view];
      [v9 addLayoutGuide:v6];

      double v20 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v26 = [v6 leadingAnchor];
      v27 = [(GKLeaderboardScoreViewController *)self view];
      int64_t v25 = [v27 leadingAnchor];
      id v24 = [v26 constraintEqualToAnchor:v25];
      v28[0] = v24;
      id v22 = [v6 trailingAnchor];
      id v23 = [(GKLeaderboardScoreViewController *)self view];
      double v21 = [v23 trailingAnchor];
      double v19 = [v22 constraintEqualToAnchor:v21];
      v28[1] = v19;
      uint64_t v10 = [v6 topAnchor];
      double v11 = [(GKLeaderboardScoreViewController *)self view];
      v12 = [v11 topAnchor];
      double v13 = [v10 constraintEqualToAnchor:v12];
      v28[2] = v13;
      double v14 = [v6 bottomAnchor];
      objc_super v15 = [(GKLeaderboardScoreViewController *)self collectionContainer];
      double v16 = [v15 topAnchor];
      double v17 = [v14 constraintEqualToAnchor:v16];
      v28[3] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
      [v20 activateConstraints:v18];
    }
  }
}

- (void)updatePlayerScopeLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    id v6 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v6 removeFromSuperview];

    [(GKLeaderboardScoreViewController *)self addPlayerScopeControl];
    id v7 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v7 setWidth:0 forSegmentAtIndex:108.0];

    objc_super v8 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v8 setWidth:1 forSegmentAtIndex:108.0];
  }
  else
  {
    uint64_t v9 = [(GKLeaderboardScoreViewController *)self traitCollection];
    uint64_t v10 = [v9 verticalSizeClass];

    double v11 = [(GKLeaderboardScoreViewController *)self navigationItem];
    v12 = [v11 _bottomPalette];
    double v13 = v12;
    if (v10 == 2)
    {
      id v62 = [v12 contentView];

      double v14 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      id v15 = [v14 superview];

      if (!v62 || v15 != v62)
      {
        double v16 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
        [v16 removeFromSuperview];

        double v17 = [(GKLeaderboardScoreViewController *)self navigationItem];
        [v17 setTitleView:0];

        id v18 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        double v19 = (void *)[objc_alloc(MEMORY[0x1E4FB21F8]) initWithContentView:v18];
        double v20 = [(GKLeaderboardScoreViewController *)self navigationItem];
        [v20 _setBottomPalette:v19];

        double v21 = [(GKLeaderboardScoreViewController *)self navigationItem];
        id v22 = [v21 _bottomPalette];
        id v23 = [v22 contentView];
        id v24 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
        [v23 addSubview:v24];

        id v62 = v18;
      }
      int64_t v25 = [(GKLeaderboardScoreViewController *)self navigationItem];
      uint64_t v26 = [v25 _bottomPalette];
      [v26 setPreferredHeight:60.0];

      [v62 setTranslatesAutoresizingMaskIntoConstraints:0];
      v27 = [v62 widthAnchor];
      uint64_t v28 = [v62 superview];
      uint64_t v29 = [v28 widthAnchor];
      uint64_t v30 = [v27 constraintEqualToAnchor:v29];
      [v30 setActive:1];

      uint64_t v31 = [v62 heightAnchor];
      id v32 = [v31 constraintEqualToConstant:60.0];
      [v32 setActive:1];

      id v33 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v34 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      uint64_t v35 = [v34 centerXAnchor];
      uint64_t v36 = [v62 centerXAnchor];
      id v37 = [v35 constraintEqualToAnchor:v36];
      [v37 setActive:1];

      uint64_t v38 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      int64_t v39 = [v38 bottomAnchor];
      unint64_t v40 = [v62 bottomAnchor];
      v41 = [v39 constraintEqualToAnchor:v40 constant:-10.0];
      [v41 setActive:1];

      uint64_t v42 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v43 = [v42 userInterfaceIdiom];

      if (v43 == 1)
      {
        double v44 = 140.0;
      }
      else if (GKIsXRUIIdiom())
      {
        double v44 = 100.0;
      }
      else
      {
        double v44 = (width + -40.0) / 3.0;
      }
      int v60 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      [v60 setWidth:0 forSegmentAtIndex:v44];

      BOOL v61 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
      [v61 setWidth:1 forSegmentAtIndex:v44];

      [(GKLeaderboardScoreViewController *)self configureFocusGuidesForPortraitNavigationBar];
      goto LABEL_22;
    }
    [v12 setPreferredHeight:0.0];

    v45 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v46 = [v45 userInterfaceIdiom];

    if (v46 == 1) {
      double v47 = 140.0;
    }
    else {
      double v47 = (height + -40.0) / 3.0;
    }
    v48 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v48 setWidth:0 forSegmentAtIndex:v47];

    v49 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v49 setWidth:1 forSegmentAtIndex:v47];

    v50 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v51 = [v50 superview];
    v52 = [(GKLeaderboardScoreViewController *)self navigationItem];
    v53 = [v52 titleView];
    if (v51 == v53)
    {
      v58 = [(GKLeaderboardScoreViewController *)self navigationItem];
      v59 = [v58 titleView];

      if (v59) {
        return;
      }
    }
    else
    {
    }
    v54 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v54 removeFromSuperview];

    objc_super v8 = [(GKLeaderboardScoreViewController *)self navigationItem];
    v55 = [v8 _bottomPalette];
    v56 = [v55 contentView];
    [v56 removeFromSuperview];
  }
  id v62 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
  char v57 = [(GKLeaderboardScoreViewController *)self navigationItem];
  [v57 setTitleView:v62];

LABEL_22:
}

- (void)configureFocusGuidesForPortraitNavigationBar
{
  v65[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(GKLeaderboardScoreViewController *)self navigationController];
  id v4 = [v3 navigationBar];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    id v6 = [(GKLeaderboardScoreViewController *)self navigationController];
    id v7 = [v6 navigationBar];
    v65[0] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
    [v5 setPreferredFocusEnvironments:v8];

    uint64_t v9 = [(GKLeaderboardScoreViewController *)self navigationController];
    uint64_t v10 = [v9 navigationBar];
    [v10 addLayoutGuide:v5];

    v41 = (void *)MEMORY[0x1E4F28DC8];
    v58 = [v5 leadingAnchor];
    int v60 = [(GKLeaderboardScoreViewController *)self navigationController];
    v56 = [v60 navigationBar];
    v54 = [v56 leadingAnchor];
    v52 = [v58 constraintEqualToAnchor:v54];
    v64[0] = v52;
    v48 = [v5 trailingAnchor];
    v50 = [(GKLeaderboardScoreViewController *)self navigationController];
    uint64_t v46 = [v50 navigationBar];
    uint64_t v43 = [v46 trailingAnchor];
    unint64_t v40 = [v48 constraintEqualToAnchor:v43];
    v64[1] = v40;
    uint64_t v38 = [v5 topAnchor];
    int64_t v39 = [(GKLeaderboardScoreViewController *)self navigationController];
    id v37 = [v39 navigationBar];
    double v11 = [v37 topAnchor];
    v12 = [v38 constraintEqualToAnchor:v11];
    v64[2] = v12;
    double v13 = [v5 bottomAnchor];
    double v14 = [(GKLeaderboardScoreViewController *)self navigationController];
    id v15 = [v14 navigationBar];
    double v16 = [v15 topAnchor];
    double v17 = [v13 constraintEqualToAnchor:v16 constant:1.0];
    v64[3] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
    [v41 activateConstraints:v18];
  }
  id v19 = [(GKLeaderboardScoreViewController *)self navigationItem];
  double v20 = [v19 _bottomPalette];
  uint64_t v21 = [v20 contentView];
  if (v21)
  {
    id v22 = (void *)v21;
    id v23 = [(GKLeaderboardScoreViewController *)self playerScopeControl];

    if (!v23) {
      return;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1780]);
    id v24 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v63 = v24;
    int64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v19 setPreferredFocusEnvironments:v25];

    uint64_t v26 = [(GKLeaderboardScoreViewController *)self navigationItem];
    v27 = [v26 _bottomPalette];
    uint64_t v28 = [v27 contentView];
    [v28 addLayoutGuide:v19];

    double v47 = (void *)MEMORY[0x1E4F28DC8];
    double v20 = [v19 centerXAnchor];
    BOOL v61 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v59 = [v61 centerXAnchor];
    char v57 = [v20 constraintEqualToAnchor:v59];
    v62[0] = v57;
    v53 = [v19 centerYAnchor];
    v55 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    v51 = [v55 centerYAnchor];
    v49 = [v53 constraintEqualToAnchor:v51];
    v62[1] = v49;
    uint64_t v42 = [v19 widthAnchor];
    v45 = [(GKLeaderboardScoreViewController *)self navigationItem];
    double v44 = [v45 _bottomPalette];
    uint64_t v29 = [v44 contentView];
    uint64_t v30 = [v29 widthAnchor];
    uint64_t v31 = [v42 constraintEqualToAnchor:v30];
    v62[2] = v31;
    id v32 = [v19 heightAnchor];
    id v33 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    double v34 = [v33 heightAnchor];
    uint64_t v35 = [v32 constraintEqualToAnchor:v34];
    v62[3] = v35;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    [v47 activateConstraints:v36];
  }
}

- (void)playerScopeChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 1;
  [(GKLeaderboardScoreViewController *)self setShouldPreferFocusToPlayerScopeControl:1];
  id v6 = [(GKLeaderboardScoreViewController *)self dataSource];
  uint64_t v7 = [v6 playerScope];

  uint64_t v8 = [v4 selectedSegmentIndex];
  if (!v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F631C0];
    uint64_t v9 = 1;
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    uint64_t v5 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = (void *)MEMORY[0x1E4F631C8];
LABEL_5:
    double v11 = [MEMORY[0x1E4F637F8] reporter];
    [v11 reportEvent:*MEMORY[0x1E4F63528] type:*v10];

    goto LABEL_7;
  }
  uint64_t v9 = 0;
  uint64_t v5 = v7;
LABEL_7:

  [(GKLeaderboardScoreViewController *)self setPlayerScope:v5 restrictToFriendsOnly:v9];
}

- (void)setPlayerScope:(int64_t)a3 restrictToFriendsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  -[GKLeaderboardScoreViewController setPlayerScope:](self, "setPlayerScope:");
  uint64_t v7 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v7 setPlayerScope:a3];

  [(id)objc_opt_class() setRestrictToFriendsOnly:v4];
  uint64_t v8 = [(GKLeaderboardScoreViewController *)self dataSource];
  [v8 setRestrictToFriendsOnly:v4];

  uint64_t v9 = [(UIViewController *)self _gkExtensionViewController];
  [v9 dashboardDidChangeToLeaderboardPlayerScope:a3];

  [(GKLeaderboardScoreViewController *)self setNeedsRefresh];
}

- (void)scrollToTopPressed:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F637F8], "reporter", a3);
  [v4 reportEvent:*MEMORY[0x1E4F63528] type:*MEMORY[0x1E4F631E8]];

  uint64_t v5 = [(GKLeaderboardScoreViewController *)self dataSource];
  uint64_t v6 = [v5 startingRank];

  if (v6 < 2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__GKLeaderboardScoreViewController_scrollToTopPressed___block_invoke;
    v8[3] = &unk_1E5F62EB0;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
  }
  else
  {
    uint64_t v7 = [(GKLeaderboardScoreViewController *)self dataSource];
    [v7 setAutoScrollToLocalPlayerPosition:0];

    [(GKLeaderboardScoreViewController *)self setNeedsRefresh];
  }
}

void __55__GKLeaderboardScoreViewController_scrollToTopPressed___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) collectionView];
  [v5 contentInset];
  double v3 = -v2;
  BOOL v4 = [*(id *)(a1 + 32) collectionView];
  objc_msgSend(v4, "setContentOffset:", 0.0, v3);
}

- (void)configureTimeScopeMenu
{
  objc_initWeak(&location, self);
  double v3 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
  [v3 setContextMenuIsPrimary:1];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke;
  v5[3] = &unk_1E5F66540;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  BOOL v4 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
  [v4 _setMenuProvider:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

id __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  BOOL v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) leaderboard];
  uint64_t v6 = [v5 type];

  uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = GKGameCenterUIFrameworkBundle();
  GKGetLocalizedStringFromTableInBundle();
  if (v6 == 1) {
    uint64_t v9 = {;
  }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_2;
    v33[3] = &unk_1E5F66518;
    v33[4] = WeakRetained;
    uint64_t v10 = [v7 actionWithTitle:v9 image:0 identifier:0 handler:v33];

    objc_msgSend(v10, "setState:", objc_msgSend(*(id *)(a1 + 32), "leaderboardOccurrence") == 0);
    double v11 = (void *)MEMORY[0x1E4FB13F0];
    v12 = GKGameCenterUIFrameworkBundle();
    double v13 = GKGetLocalizedStringFromTableInBundle();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_3;
    v32[3] = &unk_1E5F66518;
    v32[4] = WeakRetained;
    double v14 = [v11 actionWithTitle:v13 image:0 identifier:0 handler:v32];

    objc_msgSend(v14, "setState:", objc_msgSend(*(id *)(a1 + 32), "leaderboardOccurrence") == 1);
    [v4 addObject:v10];
    [v4 addObject:v14];
    id v15 = (void *)MEMORY[0x1E4FB1970];
    double v16 = GKGameCenterUIFrameworkBundle();
    double v17 = GKGetLocalizedStringFromTableInBundle();
    id v18 = [v15 menuWithTitle:v17 children:v4];
  }
  else {
    id v19 = {;
  }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_4;
    v31[3] = &unk_1E5F66518;
    v31[4] = WeakRetained;
    uint64_t v10 = [v7 actionWithTitle:v19 image:0 identifier:0 handler:v31];

    objc_msgSend(v10, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 0);
    double v20 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v21 = GKGameCenterUIFrameworkBundle();
    id v22 = GKGetLocalizedStringFromTableInBundle();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_5;
    v30[3] = &unk_1E5F66518;
    v30[4] = WeakRetained;
    double v14 = [v20 actionWithTitle:v22 image:0 identifier:0 handler:v30];

    objc_msgSend(v14, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 1);
    id v23 = (void *)MEMORY[0x1E4FB13F0];
    id v24 = GKGameCenterUIFrameworkBundle();
    int64_t v25 = GKGetLocalizedStringFromTableInBundle();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_6;
    v29[3] = &unk_1E5F66518;
    v29[4] = WeakRetained;
    double v16 = [v23 actionWithTitle:v25 image:0 identifier:0 handler:v29];

    objc_msgSend(v16, "setState:", objc_msgSend(*(id *)(a1 + 32), "timeScope") == 2);
    [v4 addObject:v10];
    [v4 addObject:v14];
    [v4 addObject:v16];
    uint64_t v26 = (void *)MEMORY[0x1E4FB1970];
    double v17 = GKGameCenterUIFrameworkBundle();
    v27 = GKGetLocalizedStringFromTableInBundle();
    id v18 = [v26 menuWithTitle:v27 children:v4];
  }

  return v18;
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLeaderboardOccurrence:0];
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLeaderboardOccurrence:1];
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimeScope:0];
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimeScope:1];
}

uint64_t __58__GKLeaderboardScoreViewController_configureTimeScopeMenu__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimeScope:2];
}

- (void)setTimeScope:(int64_t)a3
{
  int64_t timeScope = a3;
  if (self->_timeScope != a3)
  {
    if ((unint64_t)a3 <= 2)
    {
      id v5 = (void *)qword_1E5F665D8[a3];
      uint64_t v6 = [MEMORY[0x1E4F637F8] reporter];
      [v6 reportEvent:*MEMORY[0x1E4F63528] type:*v5];
    }
    self->_int64_t timeScope = timeScope;
    uint64_t v7 = [(GKLeaderboardScoreViewController *)self dataSource];
    [v7 setTimeScope:timeScope];

    [(GKLeaderboardScoreViewController *)self setInitialTimeScope:timeScope];
    uint64_t v8 = [(UIViewController *)self _gkExtensionViewController];
    [v8 dashboardDidChangeToLeaderboardTimeScope:timeScope];

    [(GKLeaderboardScoreViewController *)self setNeedsRefresh];
    int64_t timeScope = self->_timeScope;
  }
  id v9 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
  [v9 setTimeScope:timeScope];
}

- (void)setLeaderboardOccurrence:(int64_t)a3
{
  if (self->_leaderboardOccurrence != a3)
  {
    int64_t timeScope = self->_timeScope;
    uint64_t v6 = [(GKLeaderboardScoreViewController *)self dataSource];
    [v6 setTimeScope:timeScope];

    if (a3)
    {
      if (a3 != 1)
      {
LABEL_7:
        id v9 = [(GKLeaderboardScoreViewController *)self timeScopeButton];
        [v9 setEnabled:0];

        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __61__GKLeaderboardScoreViewController_setLeaderboardOccurrence___block_invoke;
        v10[3] = &unk_1E5F66568;
        v10[4] = self;
        v10[5] = a3;
        [(GKLeaderboardScoreViewController *)self loadLeaderboardForOccurrence:a3 handler:v10];
        return;
      }
      uint64_t v7 = (void *)MEMORY[0x1E4F631B8];
    }
    else
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F631B0];
    }
    uint64_t v8 = [MEMORY[0x1E4F637F8] reporter];
    [v8 reportEvent:*MEMORY[0x1E4F63528] type:*v7];

    goto LABEL_7;
  }
}

void __61__GKLeaderboardScoreViewController_setLeaderboardOccurrence___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = a2;
    uint64_t v6 = [v4 leaderboard];
    objc_msgSend(v5, "setPlayerScope:", objc_msgSend(v6, "playerScope"));

    [v5 setTimeScope:2];
    *(void *)(*(void *)(a1 + 32) + 1256) = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) setLeaderboard:v5];
    uint64_t v7 = [*(id *)(a1 + 32) dataSource];
    [v7 setLeaderboard:v5];

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) dataSource];
    [v9 setLeaderboardOccurrence:v8];

    [*(id *)(a1 + 32) setNeedsRefresh];
  }
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[157];
  v12 = [v10 timeScopeButton];
  [v12 setLeaderboardOccurrence:v11];

  id v13 = [*(id *)(a1 + 32) timeScopeButton];
  [v13 setEnabled:1];
}

- (void)loadLeaderboardForOccurrence:(int64_t)a3 handler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3 != 1)
  {
    id v9 = [(GKLeaderboardScoreViewController *)self currentOccurrence];

    if (v9)
    {
      uint64_t v8 = [(GKLeaderboardScoreViewController *)self currentOccurrence];
      goto LABEL_6;
    }
    double v16 = (void *)MEMORY[0x1E4F63738];
    double v17 = [(GKLeaderboardScoreViewController *)self leaderboard];
    id v18 = [v17 baseLeaderboardID];
    v24[0] = v18;
    id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke_2;
    v20[3] = &unk_1E5F63300;
    v20[4] = self;
    id v21 = v6;
    [v16 loadLeaderboardsWithIDs:v19 completionHandler:v20];

    id v15 = v21;
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v7 = [(GKLeaderboardScoreViewController *)self previousOccurrence];

  if (!v7)
  {
    uint64_t v11 = [(GKLeaderboardScoreViewController *)self leaderboard];
    v12 = [(GKLeaderboardScoreViewController *)self dataSource];
    id v13 = [v12 gameRecord];
    double v14 = [v13 gameDescriptor];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke;
    v22[3] = &unk_1E5F66590;
    v22[4] = self;
    id v23 = v6;
    [v11 loadPreviousOccurrenceWithGameDescriptor:v14 completionHandler:v22];

    id v15 = v23;
    goto LABEL_9;
  }
  uint64_t v8 = [(GKLeaderboardScoreViewController *)self previousOccurrence];
LABEL_6:
  uint64_t v10 = (void *)v8;
  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, v8, 0);

LABEL_10:
}

void __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 setPreviousOccurrence:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__GKLeaderboardScoreViewController_loadLeaderboardForOccurrence_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 count])
  {
    id v6 = [v7 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }
  [*(id *)(a1 + 32) setCurrentOccurrence:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setNeedsRefresh
{
  if ([(GKLeaderboardScoreViewController *)self isLoading])
  {
    [(GKLeaderboardScoreViewController *)self setShouldRefreshAgain:1];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke;
    block[3] = &unk_1E5F62EB0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke()
{
  gk_dispatch_debounce();
  dispatch_time_t v0 = dispatch_time(0, 1000000000);
  dispatch_after(v0, MEMORY[0x1E4F14428], &__block_literal_global_45);
}

uint64_t __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isLoading])
  {
    double v2 = *(void **)(a1 + 32);
    return [v2 setShouldRefreshAgain:1];
  }
  else
  {
    BOOL v4 = *(void **)(a1 + 32);
    return [v4 setLoadingState:@"RefreshingState"];
  }
}

uint64_t __51__GKLeaderboardScoreViewController_setNeedsRefresh__block_invoke_3()
{
  return GKAtomicCompareAndSwap32();
}

- (BOOL)isLoading
{
  double v2 = [(GKLoadingViewController *)self loadingState];
  BOOL v3 = 1;
  if (v2)
  {
    if (v2 != @"Initial" && v2 != @"LoadingState") {
      BOOL v3 = v2 == @"RefreshingState";
    }
  }

  return v3;
}

- (void)didEnterLoadingState
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLoadingViewController *)&v3 didEnterLoadingState];
  [(GKLeaderboardScoreViewController *)self loadData];
}

- (void)donePressed:(id)a3
{
  id v3 = [(UIViewController *)self _gkExtensionViewController];
  [v3 finish];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GKLeaderboardScoreViewController;
  [(GKLeaderboardScoreViewController *)&v43 traitCollectionDidChange:v4];
  id v5 = [(GKLeaderboardScoreViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v6);
  id v7 = [v4 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (v5 == IsAccessibilityCategory)
  {
    id v33 = [v4 preferredContentSizeCategory];

    [(GKLeaderboardScoreViewController *)self enableDisableCollectionViewScrolling];
    double v34 = [(GKLeaderboardScoreViewController *)self collectionView];
    uint64_t v35 = v34;
    if (v33 == v6)
    {
      uint64_t v38 = [v34 collectionViewLayout];
      [v38 invalidateLayout];

      [(GKLeaderboardScoreViewController *)self updateHighlights];
    }
    else
    {
      [v34 reloadData];

      [(GKLeaderboardScoreViewController *)self updateContentSize];
    }
  }
  else
  {
    id v9 = [(GKLeaderboardScoreViewController *)self playerScopeControl];
    [v9 removeFromSuperview];

    uint64_t v10 = [(GKLeaderboardScoreViewController *)self navigationItem];
    uint64_t v11 = [v10 _bottomPalette];
    v12 = [v11 contentView];
    [v12 removeFromSuperview];

    id v13 = [(GKLeaderboardScoreViewController *)self navigationItem];
    double v14 = [v13 _bottomPalette];
    [v14 setPreferredHeight:0.0];

    id v15 = [(GKLeaderboardScoreViewController *)self navigationItem];
    double v16 = [v15 _bottomPalette];
    [v16 removeFromSuperview];

    double v17 = [GKLeaderboardScoreViewController alloc];
    id v18 = [(GKLeaderboardScoreViewController *)self dataSource];
    id v19 = [v18 gameRecord];
    double v20 = [(GKLeaderboardScoreViewController *)self leaderboard];
    id v21 = [(GKLeaderboardScoreViewController *)v17 initWithGameRecord:v19 leaderboard:v20];

    id v22 = (void *)MEMORY[0x1E4F1CA48];
    id v23 = [(GKLeaderboardScoreViewController *)self navigationController];
    id v24 = [v23 viewControllers];
    int64_t v25 = [v22 arrayWithArray:v24];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = 0;
      uint64_t v30 = *(void *)v40;
      while (2)
      {
        uint64_t v31 = 0;
        uint64_t v32 = v29 + v28;
        do
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v26);
          }
          if (*(GKLeaderboardScoreViewController **)(*((void *)&v39 + 1) + 8 * v31) == self)
          {
            uint64_t v32 = v29 + v31;
            goto LABEL_15;
          }
          ++v31;
        }
        while (v28 != v31);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v44 count:16];
        uint64_t v29 = v32;
        if (v28) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
LABEL_15:

    objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v32, v21, (void)v39);
    uint64_t v36 = [(GKLeaderboardScoreViewController *)self navigationController];
    [v36 setViewControllers:v26];

    id v37 = [(GKLeaderboardScoreViewController *)self view];
    [v37 removeFromSuperview];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)GKLeaderboardScoreViewController;
  id v7 = a4;
  -[GKLeaderboardScoreViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__GKLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F641D8;
  v8[4] = self;
  *(double *)&void v8[5] = width;
  *(double *)&v8[6] = height;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __87__GKLeaderboardScoreViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePlayerScopeLayoutForSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)clearSelection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(GKLeaderboardScoreViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        uint64_t v11 = [(GKLeaderboardScoreViewController *)self collectionView];
        [v11 deselectItemAtIndexPath:v10 animated:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)collectionViewDidScroll
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(GKLeaderboardScoreViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;
  uint64_t v7 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v7 contentOffset];
  double v9 = v6 - v8;
  uint64_t v10 = [(GKLeaderboardScoreViewController *)self collectionView];
  [v10 frame];
  double v12 = v9 - v11;

  double v13 = v12 / 20.0;
  if (v12 / 20.0 > 1.0) {
    double v13 = 1.0;
  }
  if (v13 <= 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = 1.0 - v13;
  }
  long long v15 = [NSNumber numberWithDouble:v14];
  v18[0] = v15;
  v18[1] = &unk_1F0812608;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  uint64_t v17 = [(GKLeaderboardScoreViewController *)self collectionViewFadeGradient];
  [v17 setLocations:v16];
}

- (void)didLoadScoresWithLocalPlayerEntry:(id)a3 topPlayer:(id)a4 playerAbove:(id)a5 playerBelow:(id)a6 totalEntries:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  [(GKLeaderboardScoreViewController *)self setLocalPlayerEntry:a3];
  [(GKLeaderboardScoreViewController *)self setTopPlayerEntry:v14];

  [(GKLeaderboardScoreViewController *)self setPlayerAboveEntry:v13];
  [(GKLeaderboardScoreViewController *)self setPlayerBelowEntry:v12];

  [(GKLeaderboardScoreViewController *)self setTotalEntries:a7];
  [(GKLeaderboardScoreViewController *)self updateHighlights];

  [(GKLeaderboardScoreViewController *)self updateContentSize];
}

- (void)didLoadAdditionalScoresWithUpdatedTotalEntries:(unint64_t)a3
{
  if ([(GKLeaderboardScoreViewController *)self totalEntries] != a3)
  {
    [(GKLeaderboardScoreViewController *)self setTotalEntries:a3];
    [(GKLeaderboardScoreViewController *)self updateHighlights];
  }

  [(GKLeaderboardScoreViewController *)self updateContentSize];
}

- (void)updateContentSize
{
  id v3 = [(GKLeaderboardScoreViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;

  if (v6 <= 0.0) {
    double v6 = 300.0;
  }
  uint64_t v7 = [(GKLeaderboardScoreViewController *)self timeScopeContainer];
  [v7 bounds];
  double v9 = v6 + v8;
  uint64_t v10 = [(GKLeaderboardScoreViewController *)self collectionContainerHeight];
  [v10 setConstant:v9];

  [(GKLeaderboardScoreViewController *)self collectionViewDidScroll];
}

- (void)shareScore:(id)a3 fromLeaderboard:(id)a4 sendingView:(id)a5 relativeRect:(CGRect)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 player];
  int v13 = [v12 isLocalPlayer];

  if (v13)
  {
    id v14 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v15 = *MEMORY[0x1E4F634E0];
    [v14 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F63130]];

    double v16 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v17 = (uint64_t *)MEMORY[0x1E4F63118];
  }
  else
  {
    id v18 = [v9 player];
    int v19 = [v18 isFamiliarFriend];

    if (!v19) {
      goto LABEL_6;
    }
    double v20 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v15 = *MEMORY[0x1E4F634E0];
    [v20 reportEvent:*MEMORY[0x1E4F634E0] type:*MEMORY[0x1E4F63128]];

    double v16 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v17 = (uint64_t *)MEMORY[0x1E4F63110];
  }
  uint64_t v21 = *v17;
  id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "rank"));
  [v16 reportEvent:v15 type:v21 scoreRank:v22];

LABEL_6:
  id v23 = [MEMORY[0x1E4F637E8] shared];
  int v24 = [v23 shouldAllowSharing];

  if (v24)
  {
    int64_t v25 = [v9 sharingScoreMessageFromLeaderboard:v10];
    v45[0] = v25;
    id v26 = [v9 sharingScoreURL];
    v45[1] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
    id v28 = (id)[(GKLeaderboardScoreViewController *)self _gkPresentActivityViewControllerForActivityItems:v27 fromView:v11 withCompletionHandler:0];
  }
  else
  {
    int64_t v25 = GKGameCenterUIFrameworkBundle();
    id v26 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v27 = GKGameCenterUIFrameworkBundle();
    uint64_t v29 = GKGetLocalizedStringFromTableInBundle();
    uint64_t v30 = GKGameCenterUIFrameworkBundle();
    uint64_t v31 = GKGetLocalizedStringFromTableInBundle();
    id v32 = (id)[(GKLeaderboardScoreViewController *)self _gkPresentAlertWithTitle:v26 message:v29 buttonTitle:v31 dismissHandler:0];
  }
  id v33 = [v9 player];
  int v34 = [v33 isLocalPlayer];
  uint64_t v35 = @"friendPlayer";
  if (v34) {
    uint64_t v35 = @"localPlayer";
  }
  uint64_t v36 = v35;

  id v37 = [MEMORY[0x1E4F63660] reporter];
  objc_super v43 = @"location";
  v41[0] = @"scorer";
  v41[1] = @"scoreRank";
  v42[0] = v36;
  uint64_t v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "rank"));
  v42[1] = v38;
  long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  double v44 = v39;
  long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

  [v37 recordClickWithAction:@"share" targetId:@"leaderboardEntry" targetType:@"collectionViewCell" pageId:@"leaderboardScores" pageType:@"leaderboard" additionalFields:v40];
}

- (void)sendFriendInvitationViaMessagesTo:(id)a3 withPresentingViewController:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*MEMORY[0x1E4F63830])
  {
    if (v6)
    {
      id v4 = [v6 contact];
      id v14 = v4;
      double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __99__GKLeaderboardScoreViewController_sendFriendInvitationViaMessagesTo_withPresentingViewController___block_invoke_2;
    v10[3] = &unk_1E5F64228;
    id v9 = &v11;
    id v11 = v7;
    +[FriendRequestFacilitator makeViewControllerWithRecipients:v8 chatGUID:0 completionHandler:v10];
    if (v6)
    {
LABEL_8:
    }
  }
  else
  {
    if (v6)
    {
      id v4 = [v6 contact];
      v15[0] = v4;
      double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__GKLeaderboardScoreViewController_sendFriendInvitationViaMessagesTo_withPresentingViewController___block_invoke;
    v12[3] = &unk_1E5F656C0;
    id v9 = &v13;
    id v13 = v7;
    +[FriendRequestFacilitator makeViewControllerForRemoteInviteWithRecipients:v8 chatGUID:0 resultHandler:v12];
    if (v6) {
      goto LABEL_8;
    }
  }
}

void __99__GKLeaderboardScoreViewController_sendFriendInvitationViaMessagesTo_withPresentingViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = v5;
  }
  if (v6) {
    [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
  }
}

uint64_t __99__GKLeaderboardScoreViewController_sendFriendInvitationViaMessagesTo_withPresentingViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) presentViewController:a2 animated:1 completion:0];
}

- (void)challengeWithScore:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(GKLeaderboardScoreViewController *)self leaderboard];
  id v6 = [MEMORY[0x1E4F63760] local];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke;
  void v9[3] = &unk_1E5F665B8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v5 loadEntriesForPlayers:v7 timeScope:2 completionHandler:v9];
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v36 = a3;
  id v37 = a4;
  id v7 = [v36 firstObject];
  id v8 = [v7 _gkScore];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F63800];
    id v10 = objc_msgSend(MEMORY[0x1E4F636F0], "currentGame", v34);
    id v11 = [MEMORY[0x1E4F63760] localPlayer];
    id v12 = [v9 challengeForGame:v10 andPlayer:v11 withScore:v8];

    id v13 = [*(id *)(a1 + 32) leaderboard];
    id v14 = [v13 internal];
    uint64_t v15 = [v12 internal];
    [v15 setLeaderboard:v14];

    double v16 = [*(id *)(a1 + 40) player];
    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 40) player];
      v41[0] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    }
    else
    {
      id v18 = 0;
    }

    uint64_t v30 = [[GKChallengePlayerPickerViewController alloc] initWithChallenge:v12 initiallySelectedPlayers:v18];
    objc_initWeak(&location, v30);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_307;
    v38[3] = &unk_1E5F66478;
    objc_copyWeak(&v39, &location);
    v38[4] = *(void *)(a1 + 32);
    [(GKChallengePlayerPickerViewController *)v30 setInviteFriendHandler:v38];
    uint64_t v31 = [*(id *)(a1 + 32) traitCollection];
    BOOL v32 = [v31 userInterfaceIdiom] == 1;

    if (!v32) {
      [(GKChallengePlayerPickerViewController *)v30 setModalPresentationStyle:5];
    }
    id v33 = [*(id *)(a1 + 32) _gkOriginatingViewController];
    [v33 presentViewController:v30 animated:1 completion:0];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    double v20 = *(void **)(a1 + 32);
    int v19 = (void **)(a1 + 32);
    uint64_t v21 = GKGameCenterUIFrameworkBundle();
    id v22 = GKGetLocalizedStringFromTableInBundle();
    id v23 = GKGameCenterUIFrameworkBundle();
    int v24 = GKGetLocalizedStringFromTableInBundle();
    int64_t v25 = GKGameCenterUIFrameworkBundle();
    id v26 = GKGetLocalizedStringFromTableInBundle();
    id v27 = (id)objc_msgSend(v20, "_gkPresentAlertWithTitle:message:buttonTitle:dismissHandler:", v22, v24, v26, 0, v34);

    if (!*MEMORY[0x1E4F63860]) {
      id v28 = (id)GKOSLoggers();
    }
    uint64_t v29 = (void *)*MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_cold_1(v19, v29);
    }
  }
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_307(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F637E8] shared];
  int v5 = [v4 isAddingFriendsRestricted];

  if (!v5)
  {
    int v17 = _os_feature_enabled_impl();
    if (v3 || !v17)
    {
      if (v3)
      {
        if ([v3 supportsFriendingViaPush])
        {
          int64_t v25 = [v3 contactAssociationID];

          if (v25)
          {
            id v26 = [*(id *)(a1 + 32) leaderboard];
            id v27 = [v26 identifier];
            +[GKMetricsBridge recordInviteFriendClickEventWithType:0 pageType:@"leaderboard" pageId:v27];

            id v28 = [v3 contact];
            uint64_t v29 = [v28 identifier];
            uint64_t v30 = [v3 contactAssociationID];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_2;
            v35[3] = &unk_1E5F66450;
            void v35[4] = *(void *)(a1 + 32);
            id v36 = v3;
            objc_copyWeak(&v37, (id *)(a1 + 40));
            +[GameCenterObjcHelper sendFriendInvitationViaPushWithContactID:v29 contactAssociationID:v30 completionHandler:v35];

            objc_destroyWeak(&v37);
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
      id v18 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

      if (WeakRetained)
      {
        double v20 = [*(id *)(a1 + 32) leaderboard];
        uint64_t v21 = [v20 identifier];
        +[GKMetricsBridge recordInviteFriendClickEventWithType:2 pageType:@"leaderboard" pageId:v21];

        id v22 = objc_loadWeakRetained(v18);
        id v23 = +[GKFriendingViewControllers inviteFriendsWithContainerViewController:v22];

        id v24 = objc_loadWeakRetained(v18);
        [v24 presentViewController:v23 animated:1 completion:0];

LABEL_15:
        goto LABEL_16;
      }
    }
    if (v3) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
    BOOL v32 = [*(id *)(a1 + 32) leaderboard];
    id v33 = [v32 identifier];
    +[GKMetricsBridge recordInviteFriendClickEventWithType:v31 pageType:@"leaderboard" pageId:v33];

    id v34 = *(void **)(a1 + 32);
    id v23 = objc_loadWeakRetained((id *)(a1 + 40));
    [v34 sendFriendInvitationViaMessagesTo:v3 withPresentingViewController:v23];
    goto LABEL_15;
  }
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = GKGameCenterUIFrameworkBundle();
  id v8 = GKGetLocalizedStringFromTableInBundle();
  id v9 = GKGameCenterUIFrameworkBundle();
  id v10 = GKGetLocalizedStringFromTableInBundle();
  id v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = GKGameCenterUIFrameworkBundle();
  id v14 = GKGetLocalizedStringFromTableInBundle();
  uint64_t v15 = [v12 actionWithTitle:v14 style:0 handler:0];
  [v11 addAction:v15];

  id v16 = objc_loadWeakRetained((id *)(a1 + 40));
  [v16 presentViewController:v11 animated:1 completion:0];

LABEL_16:
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v4 = (id)GKOSLoggers();
    }
    int v5 = *MEMORY[0x1E4F63858];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63858], OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1AF250000, v5, OS_LOG_TYPE_INFO, "Unable to send friend invitation via push, falling back to Messages flow. %@", (uint8_t *)&v9, 0xCu);
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v6 sendFriendInvitationViaMessagesTo:v7 withPresentingViewController:WeakRetained];
  }
}

- (void)shareWithScore:(id)a3 fromView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKLeaderboardScoreViewController *)self leaderboard];
  -[GKLeaderboardScoreViewController shareScore:fromLeaderboard:sendingView:relativeRect:](self, "shareScore:fromLeaderboard:sendingView:relativeRect:", v7, v8, v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(GKLeaderboardScoreViewController *)self mainScrollView];

  if (v5 == v4)
  {
    [(GKLeaderboardScoreViewController *)self enableDisableCollectionViewScrolling];
    id v15 = [(GKLeaderboardScoreViewController *)self collectionGradientView];
    [v15 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(GKLeaderboardScoreViewController *)self collectionViewFadeGradient];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  }
}

- (void)enableDisableCollectionViewScrolling
{
  id v3 = [(GKLeaderboardScoreViewController *)self traitCollection];
  category = [v3 preferredContentSizeCategory];

  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(category);
  id v5 = [(GKLeaderboardScoreViewController *)self traitCollection];
  if ([v5 horizontalSizeClass] == 1)
  {
    double v6 = [(GKLeaderboardScoreViewController *)self traitCollection];
    BOOL v7 = [v6 verticalSizeClass] == 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  double v8 = [(GKLeaderboardScoreViewController *)self traitCollection];
  uint64_t v9 = [v8 verticalSizeClass];

  if (!IsAccessibilityCategory)
  {
    if (GKIsXRUIIdiomShouldUsePadUI())
    {
      id v14 = [(GKLeaderboardScoreViewController *)self mainScrollView];
      [v14 setScrollEnabled:0];
LABEL_42:

      id v22 = [(GKLeaderboardScoreViewController *)self collectionView];
      [v22 setScrollEnabled:1];
      goto LABEL_43;
    }
    id v15 = (void *)MEMORY[0x1E4FB27B0];
    if (v9 == 1)
    {
      if ([(NSString *)category isEqualToString:*MEMORY[0x1E4FB27B8]]
        || [(NSString *)category isEqualToString:*v15])
      {
        id v16 = [(GKLeaderboardScoreViewController *)self highlightViewWidthConstraint];
        int v17 = v16;
        double v18 = 210.0;
      }
      else
      {
        id v16 = [(GKLeaderboardScoreViewController *)self highlightViewWidthConstraint];
        int v17 = v16;
        double v18 = 162.0;
      }
      [v16 setConstant:v18];

      id v37 = [(GKLeaderboardScoreViewController *)self view];
      [v37 bounds];
      double v39 = v38;

      long long v40 = [(GKLeaderboardScoreViewController *)self highlightViewLandscapeTopConstraint];
      long long v41 = v40;
      if (v39 <= 320.0)
      {
        [v40 setConstant:20.0];

        long long v42 = [(GKLeaderboardScoreViewController *)self collectionGradientViewLandscapeTopConstraint];
        objc_super v43 = v42;
        double v44 = 20.0;
      }
      else
      {
        [v40 setConstant:44.0];

        long long v42 = [(GKLeaderboardScoreViewController *)self collectionGradientViewLandscapeTopConstraint];
        objc_super v43 = v42;
        double v44 = 32.0;
      }
      [v42 setConstant:v44];
    }
    BOOL v45 = [(NSString *)category isEqualToString:*v15];
    uint64_t v46 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v47 = [v46 userInterfaceIdiom];

    if (v45)
    {
      if (v47 != 1)
      {
        BOOL v50 = GKIsXRUIIdiom() == 0;
        double v51 = 145.0;
        double v52 = 100.0;
        goto LABEL_38;
      }
      *(double *)&uint64_t v48 = 100.0;
    }
    else
    {
      if (v47 != 1)
      {
        BOOL v50 = GKIsXRUIIdiom() == 0;
        double v51 = 125.0;
        double v52 = 54.0;
LABEL_38:
        if (v50) {
          double v49 = v51;
        }
        else {
          double v49 = v52;
        }
        goto LABEL_41;
      }
      *(double *)&uint64_t v48 = 80.0;
    }
    double v49 = *(double *)&v48;
LABEL_41:
    id v14 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
    [v14 setConstant:v49];
    goto LABEL_42;
  }
  double v10 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
  [v10 setActive:1];

  if ([(NSString *)category isEqualToString:*MEMORY[0x1E4FB2778]])
  {
    double v11 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
    double v12 = v11;
    double v13 = 544.0;
  }
  else if ([(NSString *)category isEqualToString:*MEMORY[0x1E4FB2780]])
  {
    double v11 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
    double v12 = v11;
    double v13 = 494.0;
  }
  else
  {
    if (![(NSString *)category isEqualToString:*MEMORY[0x1E4FB2788]])
    {
      BOOL v32 = [(NSString *)category isEqualToString:*MEMORY[0x1E4FB2790]];
      id v33 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
      id v34 = v33;
      if (v32)
      {
        double v35 = 244.0;
        double v36 = 404.0;
      }
      else
      {
        double v35 = 204.0;
        double v36 = 364.0;
      }
      if (v7) {
        double v35 = v36;
      }
      [v33 setConstant:v35];

      int v19 = [(GKLeaderboardScoreViewController *)self highlightView];
      double v20 = v19;
      uint64_t v21 = v7;
      goto LABEL_18;
    }
    double v11 = [(GKLeaderboardScoreViewController *)self highlightViewHeightConstraint];
    double v12 = v11;
    double v13 = 444.0;
  }
  [v11 setConstant:v13];

  int v19 = [(GKLeaderboardScoreViewController *)self highlightView];
  double v20 = v19;
  uint64_t v21 = 1;
LABEL_18:
  [v19 setAxis:v21];

  id v22 = [(GKLeaderboardScoreViewController *)self mainScrollView];
  [v22 contentSize];
  if (v23 > 0.0
    && ([v22 contentOffset],
        double v25 = v24,
        [v22 contentSize],
        double v27 = v26,
        [v22 frame],
        v25 >= v27 - v28))
  {
    uint64_t v29 = [(GKLeaderboardScoreViewController *)self collectionView];
    uint64_t v30 = v29;
    uint64_t v31 = 1;
  }
  else
  {
    uint64_t v29 = [(GKLeaderboardScoreViewController *)self collectionView];
    uint64_t v30 = v29;
    uint64_t v31 = 0;
  }
  [v29 setScrollEnabled:v31];

LABEL_43:
}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GKLeaderboardScoreViewController_refreshContentsForDataType_userInfo___block_invoke;
  block[3] = &unk_1E5F65260;
  unsigned int v11 = a3;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__GKLeaderboardScoreViewController_refreshContentsForDataType_userInfo___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a1 + 48) == 4)
  {
    double v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F630B0]];
    id v3 = [*(id *)(a1 + 40) dataSource];
    id v4 = [v3 addInvitedFriendContactIdentifier:v2];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) collectionView];
      v7[0] = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      [v5 reloadItemsAtIndexPaths:v6];
    }
  }
}

- (int64_t)initialPlayerScope
{
  return self->_initialPlayerScope;
}

- (void)setInitialPlayerScope:(int64_t)a3
{
  self->_initialPlayerScope = a3;
}

- (BOOL)isDeeplinked
{
  return self->_isDeeplinked;
}

- (void)setIsDeeplinked:(BOOL)a3
{
  self->_isDeeplinked = a3;
}

- (NSString)autoScrollToPlayerId
{
  return self->_autoScrollToPlayerId;
}

- (void)setAutoScrollToPlayerId:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIStackView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (GKUnfocusableButton)scrollToTopButton
{
  return self->_scrollToTopButton;
}

- (void)setScrollToTopButton:(id)a3
{
}

- (UIView)collectionContainer
{
  return self->_collectionContainer;
}

- (void)setCollectionContainer:(id)a3
{
}

- (UIView)timeScopeContainer
{
  return self->_timeScopeContainer;
}

- (void)setTimeScopeContainer:(id)a3
{
}

- (UIView)releaseStateInfoBox
{
  return self->_releaseStateInfoBox;
}

- (void)setReleaseStateInfoBox:(id)a3
{
  self->_releaseStateInfoBox = (UIView *)a3;
}

- (UIImageView)releaseStateIcon
{
  return self->_releaseStateIcon;
}

- (void)setReleaseStateIcon:(id)a3
{
  self->_releaseStateIcon = (UIImageView *)a3;
}

- (UIStackView)releaseStateInfoBoxContents
{
  return self->_releaseStateInfoBoxContents;
}

- (void)setReleaseStateInfoBoxContents:(id)a3
{
}

- (UILabel)releaseStateHeaderText
{
  return self->_releaseStateHeaderText;
}

- (void)setReleaseStateHeaderText:(id)a3
{
}

- (UILabel)releaseStateInfoText
{
  return self->_releaseStateInfoText;
}

- (void)setReleaseStateInfoText:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UISegmentedControl)playerScopeControl
{
  return self->_playerScopeControl;
}

- (void)setPlayerScopeControl:(id)a3
{
}

- (NSLayoutConstraint)collectionContainerHeight
{
  return self->_collectionContainerHeight;
}

- (void)setCollectionContainerHeight:(id)a3
{
}

- (UIView)collectionGradientView
{
  return self->_collectionGradientView;
}

- (void)setCollectionGradientView:(id)a3
{
}

- (NSLayoutConstraint)collectionGradientViewHeightConstraint
{
  return self->_collectionGradientViewHeightConstraint;
}

- (void)setCollectionGradientViewHeightConstraint:(id)a3
{
}

- (UIScrollView)mainScrollView
{
  return self->_mainScrollView;
}

- (void)setMainScrollView:(id)a3
{
}

- (NSLayoutConstraint)highlightViewHeightConstraint
{
  return self->_highlightViewHeightConstraint;
}

- (void)setHighlightViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)highlightViewWidthConstraint
{
  return self->_highlightViewWidthConstraint;
}

- (void)setHighlightViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)collectionGradientViewLandscapeTopConstraint
{
  return self->_collectionGradientViewLandscapeTopConstraint;
}

- (void)setCollectionGradientViewLandscapeTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)highlightViewLandscapeTopConstraint
{
  return self->_highlightViewLandscapeTopConstraint;
}

- (void)setHighlightViewLandscapeTopConstraint:(id)a3
{
}

- (UIImageView)gameIconImageView
{
  return self->_gameIconImageView;
}

- (void)setGameIconImageView:(id)a3
{
}

- (GKTimeScopeButton)timeScopeButton
{
  return self->_timeScopeButton;
}

- (void)setTimeScopeButton:(id)a3
{
}

- (GKLeaderboardScoreDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (void)setLeaderboard:(id)a3
{
}

- (GKLeaderboard)currentOccurrence
{
  return self->_currentOccurrence;
}

- (void)setCurrentOccurrence:(id)a3
{
}

- (GKLeaderboard)previousOccurrence
{
  return self->_previousOccurrence;
}

- (void)setPreviousOccurrence:(id)a3
{
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (int64_t)playerScope
{
  return self->_playerScope;
}

- (void)setPlayerScope:(int64_t)a3
{
  self->_playerScope = a3;
}

- (int64_t)leaderboardOccurrence
{
  return self->_leaderboardOccurrence;
}

- (GKLeaderboardMetadataView)personalView
{
  return self->_personalView;
}

- (void)setPersonalView:(id)a3
{
}

- (GKLeaderboardMetadataView)socialView
{
  return self->_socialView;
}

- (void)setSocialView:(id)a3
{
}

- (GKNoContentView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
}

- (CAGradientLayer)collectionViewFadeGradient
{
  return self->_collectionViewFadeGradient;
}

- (void)setCollectionViewFadeGradient:(id)a3
{
}

- (GKLeaderboardEntry)localPlayerEntry
{
  return self->_localPlayerEntry;
}

- (void)setLocalPlayerEntry:(id)a3
{
}

- (GKLeaderboardEntry)topPlayerEntry
{
  return self->_topPlayerEntry;
}

- (void)setTopPlayerEntry:(id)a3
{
}

- (GKLeaderboardEntry)playerAboveEntry
{
  return self->_playerAboveEntry;
}

- (void)setPlayerAboveEntry:(id)a3
{
}

- (GKLeaderboardEntry)playerBelowEntry
{
  return self->_playerBelowEntry;
}

- (void)setPlayerBelowEntry:(id)a3
{
}

- (int64_t)totalEntries
{
  return self->_totalEntries;
}

- (void)setTotalEntries:(int64_t)a3
{
  self->_totalEntries = a3;
}

- (BOOL)shouldAutoRefreshHighlights
{
  return self->_shouldAutoRefreshHighlights;
}

- (void)setShouldAutoRefreshHighlights:(BOOL)a3
{
  self->_shouldAutoRefreshHighlights = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (BOOL)shouldPreferFocusToPlayerScopeControl
{
  return self->_shouldPreferFocusToPlayerScopeControl;
}

- (void)setShouldPreferFocusToPlayerScopeControl:(BOOL)a3
{
  self->_shouldPreferFocusToPlayerScopeControl = a3;
}

- (UICollectionViewCell)preferredFocusCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferredFocusCell);

  return (UICollectionViewCell *)WeakRetained;
}

- (void)setPreferredFocusCell:(id)a3
{
}

- (BOOL)shouldRefreshAgain
{
  return self->_shouldRefreshAgain;
}

- (void)setShouldRefreshAgain:(BOOL)a3
{
  self->_shouldRefreshAgain = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferredFocusCell);
  objc_storeStrong((id *)&self->_playerBelowEntry, 0);
  objc_storeStrong((id *)&self->_playerAboveEntry, 0);
  objc_storeStrong((id *)&self->_topPlayerEntry, 0);
  objc_storeStrong((id *)&self->_localPlayerEntry, 0);
  objc_storeStrong((id *)&self->_collectionViewFadeGradient, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_socialView, 0);
  objc_storeStrong((id *)&self->_personalView, 0);
  objc_storeStrong((id *)&self->_previousOccurrence, 0);
  objc_storeStrong((id *)&self->_currentOccurrence, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_timeScopeButton, 0);
  objc_storeStrong((id *)&self->_gameIconImageView, 0);
  objc_storeStrong((id *)&self->_highlightViewLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_collectionGradientViewLandscapeTopConstraint, 0);
  objc_storeStrong((id *)&self->_highlightViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainScrollView, 0);
  objc_storeStrong((id *)&self->_collectionGradientViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionGradientView, 0);
  objc_storeStrong((id *)&self->_collectionContainerHeight, 0);
  objc_storeStrong((id *)&self->_playerScopeControl, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_releaseStateInfoText, 0);
  objc_storeStrong((id *)&self->_releaseStateHeaderText, 0);
  objc_storeStrong((id *)&self->_releaseStateInfoBoxContents, 0);
  objc_storeStrong((id *)&self->_timeScopeContainer, 0);
  objc_storeStrong((id *)&self->_collectionContainer, 0);
  objc_storeStrong((id *)&self->_scrollToTopButton, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_autoScrollToPlayerId, 0);
}

void __55__GKLeaderboardScoreViewController_challengeWithScore___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = *a1;
  id v3 = a2;
  id v4 = [v2 leaderboard];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1AF250000, v3, OS_LOG_TYPE_ERROR, "Cannot issue challenge because localPlayer's score for this leaderboard is nil. Leaderboard: %@", (uint8_t *)&v5, 0xCu);
}

@end