@interface HUQuickControlMediaPlayerViewController
+ (Class)controlItemClass;
+ (id)controlItemPredicate;
- (BOOL)_canShowWhileLocked;
- (BOOL)hasSingleControlView;
- (BOOL)isSiriEndPointAccessory;
- (BOOL)isSpeakerAccessory;
- (HUQuickControlMediaPlayerViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7;
- (MRPlatterViewController)mediaControlViewController;
- (MRUNowPlayingViewController)mediaControlsNowPlayingViewController;
- (NSArray)mediaControlViewControllerConstraints;
- (NSLayoutConstraint)viewHeightConstraint;
- (NSString)mediaRoutingIdentifier;
- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3;
- (id)title;
- (int64_t)mediaAccessoryItemType;
- (void)_addMediaControlView;
- (void)_updateConstraints;
- (void)_updateMediaControlAppearanceForTraitCollection:(id)a3;
- (void)dealloc;
- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5;
- (void)nowPlayingViewControllerDidChangeLayout:(id)a3;
- (void)platterViewController:(id)a3 didReceiveInteractionEvent:(id)a4;
- (void)platterViewController:(id)a3 didUpdateEndpointWithReason:(id)a4;
- (void)setMediaControlViewController:(id)a3;
- (void)setMediaControlViewControllerConstraints:(id)a3;
- (void)setMediaControlsNowPlayingViewController:(id)a3;
- (void)setMediaRoutingIdentifier:(id)a3;
- (void)setPreferredFrameLayoutGuide:(id)a3;
- (void)setSiriEndPointAccessory:(BOOL)a3;
- (void)setSpeakerAccessory:(BOOL)a3;
- (void)setViewHeightConstraint:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation HUQuickControlMediaPlayerViewController

- (HUQuickControlMediaPlayerViewController)initWithControlItems:(id)a3 home:(id)a4 itemUpdater:(id)a5 controlOrientation:(unint64_t)a6 preferredControl:(unint64_t)a7
{
  id v12 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HUQuickControlMediaPlayerViewController;
  v13 = [(HUQuickControlViewController *)&v27 initWithControlItems:v12 home:a4 itemUpdater:a5 controlOrientation:a6 preferredControl:a7];
  v14 = v13;
  if (v13)
  {
    mediaControlViewControllerConstraints = v13->_mediaControlViewControllerConstraints;
    v13->_mediaControlViewControllerConstraints = (NSArray *)MEMORY[0x1E4F1CBF0];

    v16 = objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_13);
    v17 = [v16 mediaProfileContainer];
    uint64_t v18 = objc_msgSend(v17, "hf_mediaRouteIdentifier");
    mediaRoutingIdentifier = v14->_mediaRoutingIdentifier;
    v14->_mediaRoutingIdentifier = (NSString *)v18;

    if (!v14->_mediaRoutingIdentifier)
    {
      v20 = [v16 mediaRoutingIdentifier];

      if (v20)
      {
        uint64_t v21 = [v16 mediaRoutingIdentifier];
        v22 = v14->_mediaRoutingIdentifier;
        v14->_mediaRoutingIdentifier = (NSString *)v21;
      }
    }
    v14->_mediaAccessoryItemType = [v16 mediaAccessoryItemType];
    v23 = [v16 mediaProfileContainer];
    v24 = [v23 accessories];
    v25 = [v24 anyObject];

    v14->_siriEndPointAccessory = objc_msgSend(v25, "hf_isSiriEndpoint");
    v14->_speakerAccessory = objc_msgSend(v25, "hf_isDumbSpeaker");
  }
  return v14;
}

uint64_t __117__HUQuickControlMediaPlayerViewController_initWithControlItems_home_itemUpdater_controlOrientation_preferredControl___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)dealloc
{
  v3 = +[HUHomePodMediaUIVendor sharedInstance];
  [v3 setNowPlayingViewController:0];

  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlMediaPlayerViewController;
  [(HUQuickControlMediaPlayerViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlMediaPlayerViewController;
  [(HUQuickControlMediaPlayerViewController *)&v3 viewDidLoad];
  [(HUQuickControlMediaPlayerViewController *)self _addMediaControlView];
}

- (id)title
{
  return (id)HFLocalizedString();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlMediaPlayerViewController;
  [(HUQuickControlMediaPlayerViewController *)&v5 viewDidLayoutSubviews];
  objc_super v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    [(HUQuickControlMediaPlayerViewController *)self _updateConstraints];
  }
}

+ (id)controlItemPredicate
{
  uint64_t v2 = objc_opt_class();

  return +[HUQuickControlSingleItemPredicate predicateWithControlItemClass:v2];
}

+ (Class)controlItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSingleControlView
{
  return 1;
}

- (void)setPreferredFrameLayoutGuide:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  v8 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  v11 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (v7)
  {
    [v7 layoutFrame];
    v32.origin.x = 0.0;
    v32.origin.y = 0.0;
    v32.size.width = 0.0;
    v32.size.height = 0.0;
    BOOL v14 = CGRectEqualToRect(v29, v32);
    if (v10) {
      goto LABEL_12;
    }
LABEL_15:
    LOBYTE(v15) = 0;
    if (v13) {
      goto LABEL_13;
    }
    goto LABEL_16;
  }
  BOOL v14 = 0;
  if (!v10) {
    goto LABEL_15;
  }
LABEL_12:
  [v10 layoutFrame];
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 0.0;
  v33.size.height = 0.0;
  BOOL v15 = !CGRectEqualToRect(v30, v33);
  if (v13)
  {
LABEL_13:
    [v13 bounds];
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = 0.0;
    v34.size.height = 0.0;
    BOOL v16 = !CGRectEqualToRect(v31, v34);
    goto LABEL_17;
  }
LABEL_16:
  LOBYTE(v16) = 0;
LABEL_17:
  v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "^^^^ preferredFrameLayoutGuide: [%@] newLayoutGuide: [%@] currentLayoutGuide: [%@] currentLayoutGuideView: [%@] ^^^^^", buf, 0x2Au);
  }

  uint64_t v18 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];
  if ([v5 isEqual:v18])
  {
  }
  else
  {
    if (v14)
    {

      if (v15 || v16) {
        goto LABEL_26;
      }
    }
    else
    {
    }
    v19.receiver = self;
    v19.super_class = (Class)HUQuickControlMediaPlayerViewController;
    [(HUQuickControlViewController *)&v19 setPreferredFrameLayoutGuide:v5];
    [(HUQuickControlMediaPlayerViewController *)self _updateConstraints];
  }
LABEL_26:
}

- (void)platterViewController:(id)a3 didUpdateEndpointWithReason:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Media player view %@ updated endpoint with reason %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)platterViewController:(id)a3 didReceiveInteractionEvent:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Media player view %@ received interaction event from %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  id v9 = [(HUQuickControlViewController *)self itemUpdater];
  if (objc_opt_isKindOfClass()) {
    __int16 v10 = v9;
  }
  else {
    __int16 v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [v11 collectionViewLayout];

  [v12 invalidateLayout];
  id v13 = [(HUQuickControlMediaPlayerViewController *)self view];
  [v13 setNeedsLayout];

  BOOL v14 = (void *)MEMORY[0x1E4F42FF0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke;
  v19[3] = &unk_1E6385BF8;
  v19[4] = self;
  id v20 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2;
  v17[3] = &unk_1E6385C20;
  v17[4] = self;
  id v18 = v8;
  id v15 = v7;
  id v16 = v8;
  [v14 animateWithDuration:4 delay:v19 usingSpringWithDamping:v17 initialSpringVelocity:0.7 options:0.0 animations:0.8165 completion:0.0];
}

uint64_t __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 _updateConstraints];
}

uint64_t __107__HUQuickControlMediaPlayerViewController_nowPlayingViewController_didChangeSizeWithAnimations_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    objc_super v3 = [*(id *)(result + 32) mediaControlsNowPlayingViewController];
    id v4 = [v3 view];
    [v4 layoutIfNeeded];

    id v5 = [*(id *)(v2 + 32) view];
    [v5 layoutIfNeeded];

    result = *(void *)(v2 + 40);
    if (result)
    {
      id v6 = *(uint64_t (**)(void))(result + 16);
      return v6();
    }
  }
  return result;
}

- (void)nowPlayingViewControllerDidChangeLayout:(id)a3
{
  objc_opt_class();
  id v4 = [(HUQuickControlViewController *)self itemUpdater];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 collectionViewLayout];

  [v7 invalidateLayout];
}

- (void)_addMediaControlView
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_super v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUQuickControlMediaPlayerViewController *)self mediaRoutingIdentifier];
    int v31 = 138412290;
    CGRect v32 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Media Route %@; showing quick controls",
      (uint8_t *)&v31,
      0xCu);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F74880]);
  id v6 = [(HUQuickControlMediaPlayerViewController *)self mediaRoutingIdentifier];
  id v7 = (void *)[v5 initWithRouteUID:v6];
  [(HUQuickControlMediaPlayerViewController *)self setMediaControlsNowPlayingViewController:v7];

  id v8 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  id v9 = [v8 view];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  __int16 v10 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [v10 setLayout:2];

  if ([(HUQuickControlMediaPlayerViewController *)self isSiriEndPointAccessory]
    && ![(HUQuickControlMediaPlayerViewController *)self isSpeakerAccessory])
  {
    id v11 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    [v11 setLayout:4];
  }
  uint64_t v12 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [v12 setSupportsHorizontalLayout:1];

  id v13 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [v13 setContext:3];

  BOOL v14 = [MEMORY[0x1E4F69138] sharedInstance];
  uint64_t v15 = [v14 hostProcess];

  if (v15 == 100)
  {
    id v16 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:8 andCategory:1];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F74888]) initWithVisualStylingProvider:v16];
    id v18 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    [v18 setStylingProvider:v17];
  }
  else
  {
    id v16 = objc_opt_new();
    v17 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    [v17 setStylingProvider:v16];
  }

  objc_super v19 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  objc_msgSend(v19, "setContentEdgeInsets:", 24.0, 40.0, 24.0, 40.0);

  id v20 = [(HUQuickControlMediaPlayerViewController *)self traitCollection];
  [(HUQuickControlMediaPlayerViewController *)self _updateMediaControlAppearanceForTraitCollection:v20];

  id v21 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [(HUQuickControlMediaPlayerViewController *)self addChildViewController:v21];

  __int16 v22 = [(HUQuickControlMediaPlayerViewController *)self view];
  id v23 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  __int16 v24 = [v23 view];
  [v22 addSubview:v24];

  [(HUQuickControlMediaPlayerViewController *)self _updateConstraints];
  id v25 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [v25 didMoveToParentViewController:self];

  __int16 v26 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  [v26 setDelegate:self];

  id v27 = HFLogForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    int v31 = 138412290;
    CGRect v32 = v28;
    _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "Setting HUHomePodMediaUIVendor to ->  self.mediaControlsNowPlayingViewController = %@", (uint8_t *)&v31, 0xCu);
  }
  CGRect v29 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  CGRect v30 = +[HUHomePodMediaUIVendor sharedInstance];
  [v30 setNowPlayingViewController:v29];
}

- (void)_updateMediaControlAppearanceForTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];
  id v5 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewController];
  id v6 = v5;
  if (v4 == 2)
  {
    [v5 setStyle:0];

    [MEMORY[0x1E4F428B8] systemDarkGrayColor];
  }
  else
  {
    [v5 setStyle:4];

    objc_msgSend(MEMORY[0x1E4F428B8], "hf_mediaPlatterBackgroundColor");
  }
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v11 CGColor];
  id v8 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewController];
  id v9 = [v8 view];
  __int16 v10 = [v9 layer];
  [v10 setBackgroundColor:v7];
}

- (void)_updateConstraints
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  uint64_t v4 = (void *)MEMORY[0x1E4F28DC8];
  id v5 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewControllerConstraints];
  [v4 deactivateConstraints:v5];

  id v6 = [(HUQuickControlMediaPlayerViewController *)self viewHeightConstraint];
  [v6 setActive:0];

  uint64_t v7 = [MEMORY[0x1E4F69138] sharedInstance];
  if ([v7 hostProcess] == 100)
  {
  }
  else
  {
    id v8 = [MEMORY[0x1E4F69138] sharedInstance];
    uint64_t v9 = [v8 hostProcess];

    if (v9 != 3)
    {
      double v20 = 3.40282347e38;
      goto LABEL_9;
    }
  }
  __int16 v10 = [(HUQuickControlMediaPlayerViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  id v13 = [MEMORY[0x1E4F42D90] mainScreen];
  BOOL v14 = [v13 fixedCoordinateSpace];
  [v14 bounds];
  double v16 = v15;

  if (v12 <= v16) {
    double v17 = 2.0;
  }
  else {
    double v17 = 4.0;
  }
  id v18 = [MEMORY[0x1E4F42D90] mainScreen];
  [v18 bounds];
  double v20 = v19 + v17 * -20.0;

LABEL_9:
  id v21 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  __int16 v22 = [v21 view];
  id v23 = [(HUQuickControlMediaPlayerViewController *)self view];
  [v23 bounds];
  objc_msgSend(v22, "sizeThatFits:", v24, v20);
  CGFloat v26 = v25;
  double v28 = v27;

  CGRect v29 = HFLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v30 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    v79.width = v26;
    v79.height = v28;
    int v31 = NSStringFromCGSize(v79);
    CGRect v32 = [(HUQuickControlMediaPlayerViewController *)self view];
    [v32 bounds];
    uint64_t v33 = NSStringFromCGRect(v80);
    *(_DWORD *)buf = 138412802;
    v73 = v30;
    __int16 v74 = 2112;
    v75 = v31;
    __int16 v76 = 2112;
    v77 = v33;
    _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "** Inside _updateConstraints. self.mediaControlsNowPlayingViewController = %@, sizeThatFits returned by mediaControlsNowPlayingViewController = %@; self.view.bounds.size = %@",
      buf,
      0x20u);
  }
  CGRect v34 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];

  if (v34)
  {
    v35 = HFLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = [(HUQuickControlViewController *)self preferredFrameLayoutGuide];
      *(_DWORD *)buf = 138412290;
      v73 = v36;
      _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "*** self.preferredFrameLayoutGuide = %@ ***", buf, 0xCu);
    }
    v70 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    v69 = [v70 view];
    v67 = [v69 topAnchor];
    v68 = [(HUQuickControlMediaPlayerViewController *)self view];
    v66 = [v68 safeAreaLayoutGuide];
    v65 = [v66 topAnchor];
    v64 = [v67 constraintEqualToAnchor:v65];
    v71[0] = v64;
    v63 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    v62 = [v63 view];
    v61 = [v62 heightAnchor];
    v60 = [v61 constraintEqualToConstant:v28];
    v71[1] = v60;
    v59 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    v58 = [v59 view];
    v56 = [v58 leadingAnchor];
    v57 = [(HUQuickControlMediaPlayerViewController *)self view];
    v55 = [v57 safeAreaLayoutGuide];
    v54 = [v55 leadingAnchor];
    v37 = [v56 constraintEqualToAnchor:v54];
    v71[2] = v37;
    v38 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    v39 = [v38 view];
    v40 = [v39 trailingAnchor];
    v41 = [(HUQuickControlMediaPlayerViewController *)self view];
    v42 = [v41 safeAreaLayoutGuide];
    v43 = [v42 trailingAnchor];
    v44 = [v40 constraintEqualToAnchor:v43];
    v71[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
    [(HUQuickControlMediaPlayerViewController *)self setMediaControlViewControllerConstraints:v45];

    v46 = [(HUQuickControlMediaPlayerViewController *)self view];
    v47 = [v46 heightAnchor];
    v48 = [v47 constraintEqualToConstant:v28];
    [(HUQuickControlMediaPlayerViewController *)self setViewHeightConstraint:v48];

    v49 = [(HUQuickControlMediaPlayerViewController *)self viewHeightConstraint];
    [v49 setActive:1];

    unint64_t v3 = 0x1E4F28000;
  }
  else
  {
    [(HUQuickControlMediaPlayerViewController *)self setMediaControlViewControllerConstraints:MEMORY[0x1E4F1CBF0]];
  }
  v50 = HFLogForCategory();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewControllerConstraints];
    *(_DWORD *)buf = 138412290;
    v73 = v51;
    _os_log_impl(&dword_1BE345000, v50, OS_LOG_TYPE_DEFAULT, "*** Activating constraints = %@ ***", buf, 0xCu);
  }
  v52 = *(void **)(v3 + 3528);
  v53 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewControllerConstraints];
  [v52 activateConstraints:v53];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v8 = a3;
  id v5 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  if (v5)
  {
  }
  else
  {
    id v6 = [(HUQuickControlMediaPlayerViewController *)self mediaControlViewController];

    uint64_t v7 = v8;
    if (!v6) {
      goto LABEL_5;
    }
  }
  [(HUQuickControlMediaPlayerViewController *)self _updateMediaControlAppearanceForTraitCollection:v8];
  uint64_t v7 = v8;
LABEL_5:
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  uint64_t v4 = [(HUQuickControlMediaPlayerViewController *)self parentViewController];
  do
  {
    id v5 = v4;
    uint64_t v4 = [v4 parentViewController];

    id v6 = [(HUQuickControlMediaPlayerViewController *)self parentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      if (v4) {
        goto LABEL_5;
      }
      goto LABEL_7;
    }
    uint64_t v7 = [v4 parentViewController];
  }
  while (v7);
  if (v4)
  {
LABEL_5:
    id v8 = [v4 view];
    [v8 frame];
    double v10 = v9;

    double v11 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
    double v12 = [v11 view];
    [v12 frame];
    double v14 = v13;

    double v15 = +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v10, v14);
    goto LABEL_8;
  }
LABEL_7:
  double v16 = [(HUQuickControlMediaPlayerViewController *)self mediaControlsNowPlayingViewController];
  double v17 = [v16 view];
  [v17 frame];
  double v15 = +[HUIntrinsicSizeDescriptor descriptorWithIntrinsicSize:flexType:](HUIntrinsicSizeDescriptor, "descriptorWithIntrinsicSize:flexType:", 0, v18, v19);

LABEL_8:

  return v15;
}

- (MRPlatterViewController)mediaControlViewController
{
  return self->_mediaControlViewController;
}

- (void)setMediaControlViewController:(id)a3
{
}

- (MRUNowPlayingViewController)mediaControlsNowPlayingViewController
{
  return self->_mediaControlsNowPlayingViewController;
}

- (void)setMediaControlsNowPlayingViewController:(id)a3
{
}

- (NSArray)mediaControlViewControllerConstraints
{
  return self->_mediaControlViewControllerConstraints;
}

- (void)setMediaControlViewControllerConstraints:(id)a3
{
}

- (NSLayoutConstraint)viewHeightConstraint
{
  return self->_viewHeightConstraint;
}

- (void)setViewHeightConstraint:(id)a3
{
}

- (NSString)mediaRoutingIdentifier
{
  return self->_mediaRoutingIdentifier;
}

- (void)setMediaRoutingIdentifier:(id)a3
{
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (BOOL)isSiriEndPointAccessory
{
  return self->_siriEndPointAccessory;
}

- (void)setSiriEndPointAccessory:(BOOL)a3
{
  self->_siriEndPointAccessory = a3;
}

- (BOOL)isSpeakerAccessory
{
  return self->_speakerAccessory;
}

- (void)setSpeakerAccessory:(BOOL)a3
{
  self->_speakerAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_viewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mediaControlViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_mediaControlsNowPlayingViewController, 0);

  objc_storeStrong((id *)&self->_mediaControlViewController, 0);
}

@end