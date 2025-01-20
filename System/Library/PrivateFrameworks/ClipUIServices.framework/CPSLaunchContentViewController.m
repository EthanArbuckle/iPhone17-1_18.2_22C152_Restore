@interface CPSLaunchContentViewController
- (BOOL)_canLaunchAppSimultaneouslyWithInvocationCardDismissal;
- (BOOL)_canShowWhileLocked;
- (BOOL)_userNotificationAuthorizationDenied;
- (BOOL)allowsPullToDismiss;
- (BOOL)dismissalInProgress;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)shouldRequestLocationConfirmationPermission;
- (CPSLaunchContentViewController)initWithCoder:(id)a3;
- (CPSLaunchContentViewController)initWithMetadata:(id)a3;
- (CPSLaunchContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CPSLaunchContentViewController)initWithURL:(id)a3;
- (CPSLaunchContentViewController)initWithURL:(id)a3 displayMode:(unint64_t)a4;
- (CPSLaunchContentViewControllerDelegate)delegate;
- (NSNumber)uiMock_openButtonEnabled;
- (UIImage)_heroImage;
- (id)_reasonStringForError:(id)a3;
- (id)_setUpOpenButtonIfNeeded;
- (void)_dismissCardWithClipDidOpen:(BOOL)a3 andPerformBlockToLaunchApp:(id)a4;
- (void)_dismissCardWithClipDidOpen:(BOOL)a3 completion:(id)a4;
- (void)_dismissWithClipDidOpen:(BOOL)a3 completion:(id)a4;
- (void)_openAppClip:(id)a3;
- (void)_openNonAppClipURL:(id)a3;
- (void)_sendAnalyticsIfNeeded;
- (void)_setHeroImage:(id)a3;
- (void)_updateContent;
- (void)_updateCornerRadiusForButtons;
- (void)_updateHeroImageIfNeeded;
- (void)cancelSession;
- (void)configurePermissionView;
- (void)createNetworkPathMonitor;
- (void)determineClipCompatibility;
- (void)disableOpenButton;
- (void)dismiss:(id)a3;
- (void)enableOpenButton;
- (void)handlePolicyRecovery;
- (void)loadView;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)logDismissalFromCloseButton:(BOOL)a3;
- (void)openAppStore;
- (void)permissionsViewControllerDidFinish:(id)a3;
- (void)playSoundAndHaptic;
- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4;
- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4;
- (void)proxyDidInstallApplicationPlaceholder:(id)a3;
- (void)proxyDidUpdateMetadata:(id)a3;
- (void)proxyRemoteServiceDidCrash:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalInProgress:(BOOL)a3;
- (void)setUnavailableViewHidden:(BOOL)a3;
- (void)setUpCard;
- (void)setUpClipInformationContainerView;
- (void)setUpHeroSection;
- (void)setUpInformationSection;
- (void)showUnavailableViewWithReason:(id)a3;
- (void)signInToAppStore;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)uiMock_setOpenButtonEnabled:(id)a3;
- (void)updateOpenButton;
- (void)updatePreferredContentSizeForCardWidth:(double)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CPSLaunchContentViewController

- (void)loadView
{
  v3 = objc_alloc_init(CPSProxCardAutoSizingView);
  -[CPSLaunchContentViewController setView:](self, "setView:");
}

- (CPSLaunchContentViewController)initWithURL:(id)a3
{
  id v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)CPSLaunchContentViewController,
        (self = [(CPSLaunchContentViewController *)&v9 initWithNibName:0 bundle:0]) != 0))
  {
    v5 = (CPSSessionProxy *)[objc_alloc(MEMORY[0x1E4F59118]) initWithURL:v4];
    sessionProxy = self->_sessionProxy;
    self->_sessionProxy = v5;

    [(CPSSessionProxy *)self->_sessionProxy setDelegate:self];
    [(CPSSessionProxy *)self->_sessionProxy connectToService];
    self->_shouldPlaySoundAndHaptic = 1;
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CPSLaunchContentViewController)initWithURL:(id)a3 displayMode:(unint64_t)a4
{
  v5 = [(CPSLaunchContentViewController *)self initWithURL:a3];
  v6 = v5;
  if (v5)
  {
    v5->_displayMode = a4;
    if (a4 == 1) {
      v5->_shouldPlaySoundAndHaptic = 0;
    }
    v7 = v5;
  }

  return v6;
}

- (CPSLaunchContentViewController)initWithMetadata:(id)a3
{
  id v5 = a3;
  v6 = [v5 clipURL];
  v7 = [(CPSLaunchContentViewController *)self initWithURL:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_clipMetadata, a3);
    [(CPSSessionProxy *)v7->_sessionProxy prewarmClip];
    v8 = v7;
  }

  return v7;
}

- (CPSLaunchContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-initWithCoder: is not supported." userInfo:0];
  objc_exception_throw(v4);
}

- (CPSLaunchContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"-initWithNibName:bundle: is not supported." userInfo:0];
  objc_exception_throw(v7);
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v8 viewDidLoad];
  [(CPSLaunchContentViewController *)self setUpCard];
  [(CPSLaunchContentViewController *)self setUpHeroSection];
  [(CPSLaunchContentViewController *)self setUpInformationSection];
  [(CPSLaunchContentViewController *)self _updateContent];
  id v3 = (void *)MEMORY[0x1E4F42F80];
  id v4 = [(CPSLaunchContentViewController *)self traitCollection];
  id v5 = objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");
  id v6 = [v3 traitCollectionWithPreferredContentSizeCategory:v5];
  id v7 = [(CPSLaunchContentViewController *)self view];
  [v7 _setLocalOverrideTraitCollection:v6];

  [(CPSLaunchContentViewController *)self createNetworkPathMonitor];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v4 viewWillAppear:a3];
  if (self->_shouldPlaySoundAndHaptic)
  {
    self->_shouldPlaySoundAndHaptic = 0;
    [(CPSLaunchContentViewController *)self playSoundAndHaptic];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v6 viewDidAppear:a3];
  delayedPermissionViewUnhideBlock = (void (**)(void))self->_delayedPermissionViewUnhideBlock;
  if (delayedPermissionViewUnhideBlock)
  {
    delayedPermissionViewUnhideBlock[2]();
    id v5 = self->_delayedPermissionViewUnhideBlock;
    self->_delayedPermissionViewUnhideBlock = 0;
  }
}

- (void)playSoundAndHaptic
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "Error creating system sound ID for audio URL: %@ status: (%d)", (uint8_t *)&v3, 0x12u);
}

uint64_t __52__CPSLaunchContentViewController_playSoundAndHaptic__block_invoke(uint64_t a1)
{
  return AudioServicesDisposeSystemSoundID(*(_DWORD *)(a1 + 32));
}

- (void)setUpCard
{
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v5 viewDidLayoutSubviews];
  int v3 = [(CPSLaunchContentViewController *)self view];
  [v3 frame];
  [(CPSLaunchContentViewController *)self updatePreferredContentSizeForCardWidth:CGRectGetWidth(v6)];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CPSLaunchContentViewController_viewDidLayoutSubviews__block_invoke;
  v4[3] = &unk_1E6AE9158;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
}

uint64_t __55__CPSLaunchContentViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCornerRadiusForButtons];
}

- (void)_updateCornerRadiusForButtons
{
  [(CPSVibrantButton *)self->_closeButton updateCornerRadius];
  [(CPSVibrantButton *)self->_openVibrantButton updateCornerRadius];
  int v3 = self->_openButton;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIButton *)v3 updateCornerRadius];
  }
}

- (void)updateViewConstraints
{
  [(NSLayoutConstraint *)self->_heroContainerAspectRatioConstraint setActive:0];
  int v3 = [(CPSLaunchContentViewController *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  objc_super v5 = [(UIView *)self->_heroContainerView widthAnchor];
  CGRect v6 = [(UIView *)self->_heroContainerView heightAnchor];
  double v7 = 1.5;
  if (v4 == 1) {
    double v7 = 2.0;
  }
  objc_super v8 = [v5 constraintEqualToAnchor:v6 multiplier:v7];
  heroContainerAspectRatioConstraint = self->_heroContainerAspectRatioConstraint;
  self->_heroContainerAspectRatioConstraint = v8;

  [(NSLayoutConstraint *)self->_heroContainerAspectRatioConstraint setActive:1];
  v10.receiver = self;
  v10.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v10 updateViewConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v25 traitCollectionDidChange:v4];
  objc_super v5 = [(CPSLaunchContentViewController *)self view];
  CGRect v6 = [(CPSLaunchContentViewController *)self traitCollection];
  double v7 = objc_msgSend(v6, "cps_invocationCardPreferredContentSizeCategory");

  objc_super v8 = objc_msgSend(v4, "cps_invocationCardPreferredContentSizeCategory");
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    objc_super v10 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v7];
    [v5 _setLocalOverrideTraitCollection:v10];
  }
  if (self->_displayMode == 1)
  {
    v11 = [(CPSLaunchContentViewController *)self traitCollection];
    v12 = [v11 preferredContentSizeCategory];
    v13 = [v4 preferredContentSizeCategory];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      v15 = [(CPSLaunchContentViewController *)self traitCollection];
      v16 = [v15 preferredContentSizeCategory];
      v17 = inlineCardButtonFont(v16);
      v18 = [(CPSVibrantButton *)self->_openVibrantButton uiButton];
      v19 = [v18 titleLabel];
      [v19 setFont:v17];

      v20 = [(CPSLaunchContentViewController *)self traitCollection];
      v21 = [v20 preferredContentSizeCategory];
      v22 = inlineCardButtonFont(v21);
      v23 = [(CPSVibrantButton *)self->_closeButton uiButton];
      v24 = [v23 titleLabel];
      [v24 setFont:v22];
    }
  }
  [v5 setNeedsUpdateConstraints];
}

- (void)setUpHeroSection
{
  v45[7] = *MEMORY[0x1E4F143B8];
  v43 = [(CPSLaunchContentViewController *)self view];
  int v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  heroContainerView = self->_heroContainerView;
  self->_heroContainerView = v3;

  [(UIView *)self->_heroContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v43 addSubview:self->_heroContainerView];
  objc_super v5 = (void *)MEMORY[0x1E4F42AA0];
  CGRect v6 = [MEMORY[0x1E4F428B8] systemFillColor];
  objc_msgSend(v5, "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, v6);
  double v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  heroImageView = self->_heroImageView;
  self->_heroImageView = v7;

  [(UIImageView *)self->_heroImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_heroImageView setAccessibilityIgnoresInvertColors:1];
  [(UIView *)self->_heroContainerView addSubview:self->_heroImageView];
  char v9 = (void *)MEMORY[0x1E4F28DC8];
  v42 = [(UIView *)self->_heroContainerView topAnchor];
  v37 = [v43 topAnchor];
  v36 = objc_msgSend(v42, "constraintEqualToAnchor:");
  v45[0] = v36;
  v41 = [(UIView *)self->_heroContainerView leadingAnchor];
  v35 = [v43 leadingAnchor];
  v34 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v45[1] = v34;
  v40 = [(UIView *)self->_heroContainerView trailingAnchor];
  v33 = [v43 trailingAnchor];
  v32 = objc_msgSend(v40, "constraintEqualToAnchor:");
  v45[2] = v32;
  v39 = [(UIImageView *)self->_heroImageView topAnchor];
  v31 = [(UIView *)self->_heroContainerView topAnchor];
  v30 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v45[3] = v30;
  v38 = [(UIImageView *)self->_heroImageView bottomAnchor];
  v29 = [(UIView *)self->_heroContainerView bottomAnchor];
  v28 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v45[4] = v28;
  objc_super v10 = [(UIImageView *)self->_heroImageView leadingAnchor];
  v11 = [(UIView *)self->_heroContainerView leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v45[5] = v12;
  v13 = [(UIImageView *)self->_heroImageView trailingAnchor];
  char v14 = [(UIView *)self->_heroContainerView trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v45[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:7];
  [v9 activateConstraints:v16];

  if (self->_displayMode != 1)
  {
    v17 = [[CPSVibrantButton alloc] initWithButtonType:7];
    closeButton = self->_closeButton;
    self->_closeButton = v17;

    [(CPSVibrantButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(CPSVibrantButton *)self->_closeButton uiButton];
    [v19 addTarget:self action:sel_dismiss_ forControlEvents:64];

    [(UIView *)self->_heroContainerView addSubview:self->_closeButton];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(UIView *)self->_heroContainerView trailingAnchor];
    v22 = [(CPSVibrantButton *)self->_closeButton trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:16.0];
    v44[0] = v23;
    v24 = [(CPSVibrantButton *)self->_closeButton topAnchor];
    objc_super v25 = [(UIView *)self->_heroContainerView topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25 constant:16.0];
    v44[1] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    [v20 activateConstraints:v27];
  }
}

- (void)setUpInformationSection
{
  v110[26] = *MEMORY[0x1E4F143B8];
  v106 = [(CPSLaunchContentViewController *)self view];
  int v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  informationContainerView = self->_informationContainerView;
  self->_informationContainerView = v3;

  [(UIView *)self->_informationContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v106 addSubview:self->_informationContainerView];
  objc_super v5 = (void *)MEMORY[0x1E4F42AA0];
  CGRect v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  objc_msgSend(v5, "cps_imageViewWithImage:tintColor:backgroundColor:", 0, 0, v6);
  double v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();
  heroMirrorImageView = self->_heroMirrorImageView;
  self->_heroMirrorImageView = v7;

  [(UIImageView *)self->_heroMirrorImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  CGAffineTransformMakeScale(&v109, 1.0, -1.0);
  char v9 = [(UIImageView *)self->_heroMirrorImageView layer];
  CGAffineTransform v108 = v109;
  [v9 setAffineTransform:&v108];

  [(UIImageView *)self->_heroMirrorImageView setAccessibilityIgnoresInvertColors:1];
  [(UIView *)self->_informationContainerView addSubview:self->_heroMirrorImageView];
  id v10 = objc_alloc(MEMORY[0x1E4F43028]);
  v11 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
  v104 = (void *)[v10 initWithEffect:v11];

  [v104 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_informationContainerView addSubview:v104];
  v105 = [v104 contentView];
  id v107 = objc_alloc_init(MEMORY[0x1E4F42DB0]);
  [v107 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v107 setContentInsetAdjustmentBehavior:2];
  [v105 addSubview:v107];
  v12 = objc_alloc_init(CPSAppClipUnavailableView);
  unavailableView = self->_unavailableView;
  self->_unavailableView = v12;

  char v14 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [(CPSAppClipUnavailableView *)self->_unavailableView setBackgroundColor:v14];

  [(CPSAppClipUnavailableView *)self->_unavailableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSAppClipUnavailableView *)self->_unavailableView setHidden:1];
  [v105 addSubview:self->_unavailableView];
  v15 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4F42E20]);
  informationContentView = self->_informationContentView;
  self->_informationContentView = v15;

  [(UIStackView *)self->_informationContentView setAxis:1];
  [(UIStackView *)self->_informationContentView setLayoutMarginsRelativeArrangement:1];
  [(UIStackView *)self->_informationContentView setInsetsLayoutMarginsFromSafeArea:0];
  -[UIStackView setDirectionalLayoutMargins:](self->_informationContentView, "setDirectionalLayoutMargins:", 0.0, 24.0, 0.0, 24.0);
  [(UIStackView *)self->_informationContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v107 addSubview:self->_informationContentView];
  [(UIStackView *)self->_informationContentView cps_addArrangedSpacerWithHeight:20.0];
  [(CPSLaunchContentViewController *)self setUpClipInformationContainerView];
  [(UIStackView *)self->_informationContentView addArrangedSubview:self->_clipInformationContainerView];
  [(UIStackView *)self->_informationContentView setCustomSpacing:self->_clipInformationContainerView afterView:32.0];
  v17 = objc_alloc_init(CPSPermissionView);
  permissionView = self->_permissionView;
  self->_permissionView = v17;

  [(CPSPermissionView *)self->_permissionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSPermissionView *)self->_permissionView setHidden:1];
  [(UIStackView *)self->_informationContentView addArrangedSubview:self->_permissionView];
  objc_msgSend(MEMORY[0x1E4F42FF0], "cps_vibrantSeparator");
  v19 = (UIView *)objc_claimAutoreleasedReturnValue();
  separatorView = self->_separatorView;
  self->_separatorView = v19;

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_informationContentView addArrangedSubview:self->_separatorView];
  [(UIStackView *)self->_informationContentView setCustomSpacing:self->_separatorView afterView:11.0];
  v21 = objc_alloc_init(CPSAppMetadataView);
  appMetadataView = self->_appMetadataView;
  self->_appMetadataView = v21;

  [(CPSAppMetadataView *)self->_appMetadataView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSAppMetadataView *)self->_appMetadataView addTarget:self action:sel_openAppStore forControlEvents:0x2000];
  [(CPSAppMetadataView *)self->_appMetadataView setUserInteractionEnabled:0];
  [(UIStackView *)self->_informationContentView addArrangedSubview:self->_appMetadataView];
  [(UIStackView *)self->_informationContentView cps_addArrangedSpacerWithHeight:24.0];
  v23 = [v107 heightAnchor];
  v24 = [(UIStackView *)self->_informationContentView heightAnchor];
  v103 = [v23 constraintEqualToAnchor:v24];

  LODWORD(v25) = 1132068864;
  [v103 setPriority:v25];
  v26 = (void *)MEMORY[0x1E4F28DC8];
  v102 = [(UIView *)self->_informationContainerView topAnchor];
  v79 = [(UIView *)self->_heroContainerView bottomAnchor];
  v78 = objc_msgSend(v102, "constraintEqualToAnchor:");
  v110[0] = v78;
  v101 = [(UIView *)self->_informationContainerView leadingAnchor];
  v77 = [v106 leadingAnchor];
  v76 = objc_msgSend(v101, "constraintEqualToAnchor:");
  v110[1] = v76;
  v100 = [(UIView *)self->_informationContainerView trailingAnchor];
  v75 = [v106 trailingAnchor];
  v74 = objc_msgSend(v100, "constraintEqualToAnchor:");
  v110[2] = v74;
  v99 = [(UIView *)self->_informationContainerView bottomAnchor];
  v73 = [v106 bottomAnchor];
  v72 = objc_msgSend(v99, "constraintEqualToAnchor:");
  v110[3] = v72;
  v98 = [(CPSAppClipUnavailableView *)self->_unavailableView topAnchor];
  v71 = [(UIView *)self->_heroContainerView bottomAnchor];
  v70 = objc_msgSend(v98, "constraintEqualToAnchor:");
  v110[4] = v70;
  v97 = [(CPSAppClipUnavailableView *)self->_unavailableView leadingAnchor];
  v69 = [v106 leadingAnchor];
  v68 = objc_msgSend(v97, "constraintEqualToAnchor:");
  v110[5] = v68;
  v96 = [(CPSAppClipUnavailableView *)self->_unavailableView trailingAnchor];
  v67 = [v106 trailingAnchor];
  v66 = objc_msgSend(v96, "constraintEqualToAnchor:");
  v110[6] = v66;
  v95 = [(CPSAppClipUnavailableView *)self->_unavailableView bottomAnchor];
  v65 = [v106 bottomAnchor];
  v64 = objc_msgSend(v95, "constraintEqualToAnchor:");
  v110[7] = v64;
  v94 = [(UIImageView *)self->_heroMirrorImageView topAnchor];
  v63 = [(UIView *)self->_informationContainerView topAnchor];
  v62 = objc_msgSend(v94, "constraintEqualToAnchor:");
  v110[8] = v62;
  v93 = [(UIImageView *)self->_heroMirrorImageView leadingAnchor];
  v61 = [(UIImageView *)self->_heroImageView leadingAnchor];
  v60 = objc_msgSend(v93, "constraintEqualToAnchor:");
  v110[9] = v60;
  v92 = [(UIImageView *)self->_heroMirrorImageView trailingAnchor];
  v59 = [(UIImageView *)self->_heroImageView trailingAnchor];
  v58 = objc_msgSend(v92, "constraintEqualToAnchor:");
  v110[10] = v58;
  v91 = [(UIImageView *)self->_heroMirrorImageView heightAnchor];
  v57 = [(UIImageView *)self->_heroImageView heightAnchor];
  v56 = objc_msgSend(v91, "constraintEqualToAnchor:");
  v110[11] = v56;
  v90 = [v104 topAnchor];
  v55 = [(UIView *)self->_informationContainerView topAnchor];
  v54 = objc_msgSend(v90, "constraintEqualToAnchor:");
  v110[12] = v54;
  v89 = [v104 leadingAnchor];
  v53 = [(UIView *)self->_informationContainerView leadingAnchor];
  v52 = objc_msgSend(v89, "constraintEqualToAnchor:");
  v110[13] = v52;
  v88 = [v104 trailingAnchor];
  v51 = [(UIView *)self->_informationContainerView trailingAnchor];
  v50 = objc_msgSend(v88, "constraintEqualToAnchor:");
  v110[14] = v50;
  v87 = [v104 bottomAnchor];
  v49 = [(UIView *)self->_informationContainerView bottomAnchor];
  v48 = objc_msgSend(v87, "constraintEqualToAnchor:");
  v110[15] = v48;
  v86 = [v107 topAnchor];
  v47 = [v105 topAnchor];
  v46 = objc_msgSend(v86, "constraintEqualToAnchor:");
  v110[16] = v46;
  v85 = [v107 leadingAnchor];
  v45 = [v105 leadingAnchor];
  v44 = objc_msgSend(v85, "constraintEqualToAnchor:");
  v110[17] = v44;
  v84 = [v105 trailingAnchor];
  v43 = [v107 trailingAnchor];
  v42 = objc_msgSend(v84, "constraintEqualToAnchor:");
  v110[18] = v42;
  v83 = [v105 bottomAnchor];
  v41 = [v107 bottomAnchor];
  v40 = objc_msgSend(v83, "constraintEqualToAnchor:");
  v110[19] = v40;
  v82 = [(UIStackView *)self->_informationContentView topAnchor];
  v39 = [v107 topAnchor];
  v38 = objc_msgSend(v82, "constraintEqualToAnchor:");
  v110[20] = v38;
  v81 = [(UIStackView *)self->_informationContentView leadingAnchor];
  v37 = [v107 leadingAnchor];
  v36 = objc_msgSend(v81, "constraintEqualToAnchor:");
  v110[21] = v36;
  v80 = [(UIStackView *)self->_informationContentView trailingAnchor];
  v27 = [v107 trailingAnchor];
  v28 = [v80 constraintEqualToAnchor:v27];
  v110[22] = v28;
  v29 = [(UIStackView *)self->_informationContentView bottomAnchor];
  v30 = [v107 bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  v110[23] = v31;
  v32 = [v107 widthAnchor];
  v33 = [(UIStackView *)self->_informationContentView widthAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v110[24] = v34;
  v110[25] = v103;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:26];
  [v26 activateConstraints:v35];
}

- (id)_setUpOpenButtonIfNeeded
{
  openButton = self->_openButton;
  if (openButton)
  {
    if (self->_openVibrantButton) {
      openButton = self->_openVibrantButton;
    }
    id v4 = openButton;
  }
  else
  {
    objc_super v5 = objc_msgSend(MEMORY[0x1E4F428B8], "cps_colorNamed:", @"disabledOpenButtonBackground");
    if (self->_displayMode == 1)
    {
      CGRect v6 = [[CPSVibrantButton alloc] initWithButtonType:0];
      openVibrantButton = self->_openVibrantButton;
      self->_openVibrantButton = v6;

      objc_super v8 = [(CPSVibrantButton *)self->_openVibrantButton uiButton];
      char v9 = self->_openButton;
      self->_openButton = v8;

      id v10 = [(CPSLaunchContentViewController *)self traitCollection];
      v11 = [v10 preferredContentSizeCategory];
      v12 = inlineCardButtonFont(v11);
      v13 = [(UIButton *)self->_openButton titleLabel];
      [v13 setFont:v12];

      char v14 = self->_openButton;
      v15 = [MEMORY[0x1E4F428B8] systemBlueColor];
      [(UIButton *)v14 setTitleColor:v15 forState:0];

      [(CPSVibrantButton *)self->_openVibrantButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CPSVibrantButton *)self->_openVibrantButton setAdjustFontSizeToFitWidth:1];
    }
    else
    {
      v16 = [CPSButton alloc];
      v17 = [MEMORY[0x1E4F428B8] whiteColor];
      v18 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.5];
      v19 = [(CPSButton *)v16 initWithTitle:0 enabledTitleColor:v17 disabledTitleColor:v18 backgroundColor:v5 textStyle:*MEMORY[0x1E4F438A0] cornerRadius:1 animatesAlphaWhenHighlighted:0.0];
      v20 = self->_openButton;
      self->_openButton = v19;

      v21 = [(UIButton *)self->_openButton titleLabel];
      [v21 setAdjustsFontForContentSizeCategory:1];
    }
    -[UIButton setContentEdgeInsets:](self->_openButton, "setContentEdgeInsets:", 12.0, 18.0, 12.0, 18.0);
    [(UIButton *)self->_openButton setEnabled:0];
    [(UIButton *)self->_openButton setHidden:1];
    [(UIButton *)self->_openButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v22) = 1144766464;
    [(UIButton *)self->_openButton setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1132134400;
    [(UIButton *)self->_openButton setContentHuggingPriority:0 forAxis:v23];
    v24 = self->_openVibrantButton;
    if (!v24) {
      v24 = self->_openButton;
    }
    id v4 = v24;
  }

  return v4;
}

- (void)setUpClipInformationContainerView
{
  v89[10] = *MEMORY[0x1E4F143B8];
  int v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  clipInformationContainerView = self->_clipInformationContainerView;
  self->_clipInformationContainerView = v3;

  [(UIView *)self->_clipInformationContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v86 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v86 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_clipInformationContainerView addSubview:v86];
  objc_super v5 = [CPSVibrantLabel alloc];
  CGRect v6 = [(CPSVibrantLabel *)v5 initWithTextStyle:*MEMORY[0x1E4F438F0] textVariant:1280 vibrancyEffectStyle:0];
  clipNameVibrantLabel = self->_clipNameVibrantLabel;
  self->_clipNameVibrantLabel = v6;

  uint64_t v8 = *MEMORY[0x1E4F590C0];
  [(CPSVibrantLabel *)self->_clipNameVibrantLabel setText:*MEMORY[0x1E4F590C0]];
  [(CPSVibrantLabel *)self->_clipNameVibrantLabel setNumberOfLines:2];
  [(CPSVibrantLabel *)self->_clipNameVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v86 addSubview:self->_clipNameVibrantLabel];
  char v9 = [CPSVibrantLabel alloc];
  id v10 = [(CPSVibrantLabel *)v9 initWithTextStyle:*MEMORY[0x1E4F43890] textVariant:256 vibrancyEffectStyle:0];
  clipDescriptionVibrantLabel = self->_clipDescriptionVibrantLabel;
  self->_clipDescriptionVibrantLabel = v10;

  [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel setText:v8];
  [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel setNumberOfLines:2];
  [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [v86 addSubview:self->_clipDescriptionVibrantLabel];
  v85 = [(CPSLaunchContentViewController *)self _setUpOpenButtonIfNeeded];
  -[UIView addSubview:](self->_clipInformationContainerView, "addSubview:");
  v12 = (void *)MEMORY[0x1E4F28DC8];
  v83 = [v86 topAnchor];
  v67 = [(UIView *)self->_clipInformationContainerView topAnchor];
  v51 = objc_msgSend(v83, "constraintGreaterThanOrEqualToAnchor:");
  v89[0] = v51;
  v81 = [v86 leadingAnchor];
  v65 = [(UIView *)self->_clipInformationContainerView leadingAnchor];
  v49 = objc_msgSend(v81, "constraintEqualToAnchor:");
  v89[1] = v49;
  v79 = [(CPSVibrantLabel *)self->_clipNameVibrantLabel topAnchor];
  v63 = [v86 topAnchor];
  v47 = objc_msgSend(v79, "constraintEqualToAnchor:");
  v89[2] = v47;
  v77 = [(CPSVibrantLabel *)self->_clipNameVibrantLabel leadingAnchor];
  v61 = [v86 leadingAnchor];
  v45 = objc_msgSend(v77, "constraintEqualToAnchor:");
  v89[3] = v45;
  v75 = [(CPSVibrantLabel *)self->_clipNameVibrantLabel trailingAnchor];
  v59 = [v86 trailingAnchor];
  v44 = objc_msgSend(v75, "constraintEqualToAnchor:");
  v89[4] = v44;
  v73 = [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel topAnchor];
  v57 = [(CPSVibrantLabel *)self->_clipNameVibrantLabel bottomAnchor];
  v43 = objc_msgSend(v73, "constraintEqualToAnchor:constant:", 2.0);
  v89[5] = v43;
  v71 = [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel leadingAnchor];
  v55 = [v86 leadingAnchor];
  v42 = objc_msgSend(v71, "constraintEqualToAnchor:");
  v89[6] = v42;
  v69 = [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel trailingAnchor];
  v53 = [v86 trailingAnchor];
  v13 = objc_msgSend(v69, "constraintEqualToAnchor:");
  v89[7] = v13;
  char v14 = [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel bottomAnchor];
  v15 = [v86 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v89[8] = v16;
  v17 = [(UIView *)self->_clipInformationContainerView bottomAnchor];
  v18 = [v85 bottomAnchor];
  v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
  v89[9] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:10];
  [v12 activateConstraints:v20];

  if (self->_displayMode)
  {
    v21 = [[CPSVibrantButton alloc] initWithButtonType:0];
    closeButton = self->_closeButton;
    self->_closeButton = v21;

    [(CPSVibrantButton *)self->_closeButton setAdjustFontSizeToFitWidth:1];
    v84 = [(CPSVibrantButton *)self->_closeButton uiButton];
    double v23 = [(CPSLaunchContentViewController *)self traitCollection];
    v24 = [v23 preferredContentSizeCategory];
    double v25 = inlineCardButtonFont(v24);
    v26 = [v84 titleLabel];
    [v26 setFont:v25];

    v27 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v84 setTitleColor:v27 forState:0];

    v28 = _CPSLocalizedString();
    [v84 setTitle:v28 forState:0];

    [(CPSVibrantButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_msgSend(v84, "setContentEdgeInsets:", 12.0, 18.0, 12.0, 18.0);
    [v84 addTarget:self action:sel_dismiss_ forControlEvents:64];
    [(UIView *)self->_clipInformationContainerView addSubview:self->_closeButton];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v82 = [(CPSVibrantButton *)self->_closeButton leadingAnchor];
    v62 = [(UIView *)self->_clipInformationContainerView leadingAnchor];
    v70 = objc_msgSend(v82, "constraintEqualToAnchor:");
    v87[0] = v70;
    v80 = [(CPSVibrantButton *)self->_closeButton topAnchor];
    v60 = [v85 topAnchor];
    v68 = objc_msgSend(v80, "constraintEqualToAnchor:");
    v87[1] = v68;
    v78 = [(CPSVibrantButton *)self->_closeButton bottomAnchor];
    v58 = [v85 bottomAnchor];
    v66 = objc_msgSend(v78, "constraintEqualToAnchor:");
    v87[2] = v66;
    v76 = [(CPSVibrantButton *)self->_closeButton widthAnchor];
    v56 = [(UIView *)self->_clipInformationContainerView widthAnchor];
    v54 = objc_msgSend(v76, "constraintEqualToAnchor:multiplier:constant:", 0.5, -8.0);
    v87[3] = v54;
    v74 = [v85 widthAnchor];
    v52 = [(UIView *)self->_clipInformationContainerView widthAnchor];
    v64 = objc_msgSend(v74, "constraintEqualToAnchor:multiplier:constant:", 0.5, -8.0);
    v87[4] = v64;
    v72 = [v85 topAnchor];
    v50 = [v86 bottomAnchor];
    v30 = objc_msgSend(v72, "constraintGreaterThanOrEqualToAnchor:constant:", 16.0);
    v87[5] = v30;
    v48 = [v85 trailingAnchor];
    v46 = [(UIView *)self->_clipInformationContainerView trailingAnchor];
    v31 = objc_msgSend(v48, "constraintEqualToAnchor:");
    v87[6] = v31;
    v32 = [(UIView *)self->_clipInformationContainerView bottomAnchor];
    v33 = [v85 bottomAnchor];
    v34 = [v32 constraintGreaterThanOrEqualToAnchor:v33];
    v87[7] = v34;
    v35 = [v86 trailingAnchor];
    v36 = [(UIView *)self->_clipInformationContainerView trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v87[8] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:9];
    [v29 activateConstraints:v38];
  }
  else
  {
    v39 = (void *)MEMORY[0x1E4F28DC8];
    v84 = [v85 topAnchor];
    v82 = [(UIView *)self->_clipInformationContainerView topAnchor];
    v62 = objc_msgSend(v84, "constraintGreaterThanOrEqualToAnchor:");
    v88[0] = v62;
    v70 = [v85 centerYAnchor];
    v80 = [v86 centerYAnchor];
    v60 = objc_msgSend(v70, "constraintEqualToAnchor:");
    v88[1] = v60;
    v68 = [v85 leadingAnchor];
    v78 = [v86 trailingAnchor];
    v58 = objc_msgSend(v68, "constraintEqualToAnchor:constant:", 16.0);
    v88[2] = v58;
    v66 = [v85 trailingAnchor];
    v76 = [(UIView *)self->_clipInformationContainerView trailingAnchor];
    v56 = objc_msgSend(v66, "constraintEqualToAnchor:");
    v88[3] = v56;
    v54 = [v85 widthAnchor];
    v40 = [v54 constraintGreaterThanOrEqualToConstant:100.0];
    LODWORD(v41) = 1144750080;
    v74 = v40;
    v52 = objc_msgSend(v40, "cps_setPriority:", v41);
    v88[4] = v52;
    v64 = [(UIView *)self->_clipInformationContainerView bottomAnchor];
    v72 = [v86 bottomAnchor];
    v50 = objc_msgSend(v64, "constraintGreaterThanOrEqualToAnchor:");
    v88[5] = v50;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:6];
    [v39 activateConstraints:v30];
  }
}

- (void)configurePermissionView
{
  objc_initWeak(&location, self);
  self->_willConfigurePermissionView = 1;
  sessionProxy = self->_sessionProxy;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke;
  v4[3] = &unk_1E6AE91D0;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [(CPSSessionProxy *)sessionProxy getLastLaunchOptionsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_2;
  block[3] = &unk_1E6AE91A8;
  block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v7);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] shouldRequestLocationConfirmationPermission];
  id v3 = a1[4];
  id v4 = (void *)*((void *)v3 + 134);
  id v5 = [*((id *)v3 + 132) fullAppName];
  objc_msgSend(v4, "configureWithAppName:requestsNotificationPermission:requestsLocationConfirmationPermission:", v5, objc_msgSend(*((id *)a1[4] + 132), "clipRequestsNotificationPermission"), v2);

  if (v2)
  {
    id v6 = [a1[5] locationConfirmationGranted];
    id v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 BOOLValue];
    }
    else {
      uint64_t v8 = 1;
    }
    [*((id *)a1[4] + 134) setLocationConfirmationPermissionEnabled:v8];
  }
  if ([*((id *)a1[4] + 132) clipRequestsNotificationPermission])
  {
    if ([a1[4] _userNotificationAuthorizationDenied])
    {
      [*((id *)a1[4] + 134) setNotificationPermissionEnabled:0];
    }
    else
    {
      char v9 = [a1[5] userNotificationGranted];
      id v10 = v9;
      if (v9) {
        uint64_t v11 = [v9 BOOLValue];
      }
      else {
        uint64_t v11 = 1;
      }
      [*((id *)a1[4] + 134) setNotificationPermissionEnabled:v11];
    }
  }
  v12 = [CPSPermissionsViewController alloc];
  v13 = [*((id *)a1[4] + 132) fullAppName];
  char v14 = [a1[4] _heroImage];
  uint64_t v15 = [(CPSPermissionsViewController *)v12 initWithAppName:v13 backgroundImage:v14];
  v16 = a1[4];
  v17 = (void *)v16[136];
  v16[136] = v15;

  objc_msgSend(*((id *)a1[4] + 136), "setDelegate:");
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_3;
  v23[3] = &unk_1E6AE9180;
  objc_copyWeak(&v24, a1 + 6);
  [*((id *)a1[4] + 134) setOptionsAction:v23];
  objc_msgSend(*((id *)a1[4] + 136), "setLocationConfirmationPermissionEnabled:", objc_msgSend(*((id *)a1[4] + 134), "locationConfirmationPermissionEnabled"));
  objc_msgSend(*((id *)a1[4] + 136), "setNotificationPermissionEnabled:", objc_msgSend(*((id *)a1[4] + 134), "notificationPermissionEnabled"));
  [*((id *)a1[4] + 127) setCustomSpacing:*((void *)a1[4] + 134) afterView:12.0];
  [*((id *)a1[4] + 134) layoutIfNeeded];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_4;
  v22[3] = &unk_1E6AE9158;
  v22[4] = a1[4];
  v18 = (void (**)(void))MEMORY[0x1D9487A30](v22);
  if ([a1[4] _appearState] == 2)
  {
    v18[2](v18);
  }
  else if ([a1[4] _appearState])
  {
    uint64_t v19 = MEMORY[0x1D9487A30](v18);
    v20 = a1[4];
    v21 = (void *)v20[146];
    v20[146] = v19;
  }
  else
  {
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v18];
  }

  objc_destroyWeak(&v24);
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained navigationController];
    [v2 pushViewController:v3[136] animated:1];

    WeakRetained = v3;
  }
}

uint64_t __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_5;
  v2[3] = &unk_1E6AE9158;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0 completion:0.2];
}

void __57__CPSLaunchContentViewController_configurePermissionView__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setHidden:0];
  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];

  id v5 = [*(id *)(a1 + 32) navigationController];
  uint64_t v2 = [v5 parentViewController];
  id v3 = [v2 view];
  [v3 layoutIfNeeded];
}

- (BOOL)_userNotificationAuthorizationDenied
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v3 = (void *)getUNNotificationSettingsCenterClass(void)::softClass;
  uint64_t v16 = getUNNotificationSettingsCenterClass(void)::softClass;
  if (!getUNNotificationSettingsCenterClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___ZL36getUNNotificationSettingsCenterClassv_block_invoke;
    v12[3] = &unk_1E6AE9338;
    v12[4] = &v13;
    ___ZL36getUNNotificationSettingsCenterClassv_block_invoke((uint64_t)v12);
    id v3 = (void *)v14[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v13, 8);
  id v5 = [v4 currentNotificationSettingsCenter];
  id v6 = [(CPSClipMetadata *)self->_clipMetadata clipBundleID];
  id v7 = [v5 notificationSourceWithIdentifier:v6];
  uint64_t v8 = [v7 sourceSettings];
  char v9 = [v8 notificationSettings];
  uint64_t v10 = [v9 authorizationStatus];

  return v10 == 1;
}

- (void)enableOpenButton
{
  [(UIButton *)self->_openButton setEnabled:1];
  if (!self->_displayMode)
  {
    id v3 = [MEMORY[0x1E4F428B8] systemBlueColor];
    -[UIButton setBackgroundColor:](self->_openButton, "setBackgroundColor:");
  }
}

- (void)disableOpenButton
{
  [(UIButton *)self->_openButton setEnabled:0];
  if (!self->_displayMode)
  {
    objc_msgSend(MEMORY[0x1E4F428B8], "cps_colorNamed:", @"disabledOpenButtonBackground");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](self->_openButton, "setBackgroundColor:");
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  BOOL v4 = [(CPSLaunchContentViewController *)self shouldRequestLocationConfirmationPermission];
  permissionsViewController = self->_permissionsViewController;
  id v6 = [(CPSLaunchContentViewController *)self navigationController];
  id v7 = [v6 topViewController];
  LODWORD(permissionsViewController) = [(CPSPermissionsViewController *)permissionsViewController isEqual:v7];

  if (!(permissionsViewController ^ 1 | v4))
  {
    uint64_t v8 = [(CPSLaunchContentViewController *)self navigationController];
    id v9 = (id)[v8 popViewControllerAnimated:0];
  }
  permissionView = self->_permissionView;
  uint64_t v11 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];
  [(CPSPermissionView *)permissionView configureWithAppName:v11 requestsNotificationPermission:[(CPSClipMetadata *)self->_clipMetadata clipRequestsNotificationPermission] requestsLocationConfirmationPermission:v4];

  if (!v4)
  {
    [(CPSPermissionView *)self->_permissionView setLocationConfirmationPermissionEnabled:0];
    v12 = self->_permissionsViewController;
    [(CPSPermissionsViewController *)v12 setLocationConfirmationPermissionEnabled:0];
  }
}

- (void)_sendAnalyticsIfNeeded
{
  if (!self->_didSendAnalytics)
  {
    id v11 = [(CPSSessionProxy *)self->_sessionProxy metadata];
    id v3 = [v11 clipBundleID];
    BOOL v4 = [v11 itemID];
    if ([v3 length] && objc_msgSend(v4, "intValue"))
    {
      self->_didSendAnalytics = 1;
      id v5 = [MEMORY[0x1E4F590C8] sharedLogger];
      id v6 = [(CPSSessionProxy *)self->_sessionProxy sourceBundleID];
      id v7 = [(CPSSessionProxy *)self->_sessionProxy referrerBundleID];
      uint64_t v8 = [(CPSSessionProxy *)self->_sessionProxy launchReason];
      id v9 = [v11 clipRequestURL];
      LOBYTE(v10) = self->_displayMode == 1;
      [v5 didPresentInvocationCardForClip:v3 adamID:v4 sourceBundleIdentifier:v6 referrerBundleIdentifier:v7 event:v8 url:v9 didShowCardInline:v10];
    }
  }
}

- (void)_updateContent
{
  [(CPSLaunchContentViewController *)self _updateHeroImageIfNeeded];
  id v20 = [(CPSClipMetadata *)self->_clipMetadata invocationPolicy];
  if (v20)
  {
    id v3 = [(CPSSessionProxy *)self->_sessionProxy launchReason];
    if ([(CPSClipMetadata *)self->_clipMetadata isPhysicalInvocationAllowed])
    {
      int v4 = 0;
    }
    else if (([v3 isEqualToString:*MEMORY[0x1E4F590B8]] & 1) != 0 {
           || ([v3 isEqualToString:*MEMORY[0x1E4F590A0]] & 1) != 0)
    }
    {
      int v4 = 1;
    }
    else
    {
      int v4 = [v3 isEqualToString:*MEMORY[0x1E4F590B0]];
    }
    if ([v20 isEligible])
    {
      if (v4)
      {
LABEL_10:
        id v5 = [MEMORY[0x1E4F590C8] sharedLogger];
        id v6 = [(CPSClipMetadata *)self->_clipMetadata clipBundleID];
        objc_msgSend(v5, "recordDidShowErrorWithBundleID:place:errorCode:", v6, @"card", objc_msgSend(v20, "reason"));

        if (v4) {
          _CPSLocalizedString();
        }
        else {
        uint64_t v19 = [v20 localizedMessageForClipMetadata:self->_clipMetadata];
        }
        [(CPSLaunchContentViewController *)self showUnavailableViewWithReason:v19];
        v17 = (void *)v19;
        goto LABEL_32;
      }
    }
    else if (([v20 isRecoverable] ^ 1 | v4))
    {
      goto LABEL_10;
    }
    [(CPSLaunchContentViewController *)self setUnavailableViewHidden:1];
  }
  id v3 = [(CPSClipMetadata *)self->_clipMetadata fullAppIconURL];
  if (objc_msgSend(v3, "cps_isFileURL"))
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42A80]);
    uint64_t v8 = [v3 path];
    id v9 = (void *)[v7 initWithContentsOfFile:v8];
    [(CPSAppMetadataView *)self->_appMetadataView setAppIcon:v9];
  }
  uint64_t v10 = [(CPSClipMetadata *)self->_clipMetadata clipName];
  id v11 = (void *)v10;
  uint64_t v12 = *MEMORY[0x1E4F590C0];
  if (v10) {
    uint64_t v13 = v10;
  }
  else {
    uint64_t v13 = *MEMORY[0x1E4F590C0];
  }
  [(CPSVibrantLabel *)self->_clipNameVibrantLabel setText:v13];

  [(CPSVibrantLabel *)self->_clipNameVibrantLabel layoutIfNeeded];
  uint64_t v14 = [(CPSClipMetadata *)self->_clipMetadata clipCaption];
  uint64_t v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = v14;
  }
  else {
    uint64_t v16 = v12;
  }
  [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel setText:v16];

  [(CPSVibrantLabel *)self->_clipDescriptionVibrantLabel layoutIfNeeded];
  [(CPSLaunchContentViewController *)self updateOpenButton];
  if (!self->_willConfigurePermissionView
    && (([(CPSClipMetadata *)self->_clipMetadata clipRequestsNotificationPermission] & 1) != 0|| [(CPSLaunchContentViewController *)self shouldRequestLocationConfirmationPermission]))
  {
    [(CPSLaunchContentViewController *)self configurePermissionView];
  }
  [(CPSAppMetadataView *)self->_appMetadataView updateWithMetadata:self->_clipMetadata];
  if ([(CPSClipMetadata *)self->_clipMetadata hasAppMetadata]
    && ([(CPSClipMetadata *)self->_clipMetadata fullAppOnly] & 1) == 0)
  {
    [(CPSAppMetadataView *)self->_appMetadataView setUserInteractionEnabled:1];
  }
  [(CPSAppMetadataView *)self->_appMetadataView layoutIfNeeded];
  [(CPSLaunchContentViewController *)self determineClipCompatibility];
  v17 = [(CPSLaunchContentViewController *)self view];
  [v17 bounds];
  [(CPSLaunchContentViewController *)self updatePreferredContentSizeForCardWidth:v18];
LABEL_32:
}

- (void)updateOpenButton
{
  if (self->_openButton)
  {
    unint64_t displayMode = self->_displayMode;
    clipMetadata = self->_clipMetadata;
    if (displayMode == 1)
    {
      id v5 = (void *)[(CPSClipMetadata *)clipMetadata clipAction];
      if ((unint64_t)v5 <= 2)
      {
        id v5 = _CPSLocalizedString();
      }
    }
    else
    {
      id v5 = [(CPSClipMetadata *)clipMetadata clipOpenButtonTitle];
    }
    id v6 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __50__CPSLaunchContentViewController_updateOpenButton__block_invoke;
    uint64_t v15 = &unk_1E6AE91F8;
    uint64_t v16 = self;
    id v7 = v5;
    id v17 = v7;
    [v6 performWithoutAnimation:&v12];
    uint64_t v8 = self->_uiMock_openButtonEnabled;
    id v9 = v8;
    if (v8)
    {
      if ([(NSNumber *)v8 BOOLValue]) {
        [(CPSLaunchContentViewController *)self enableOpenButton];
      }
      else {
        [(CPSLaunchContentViewController *)self disableOpenButton];
      }
    }

    uint64_t v10 = [(CPSClipMetadata *)self->_clipMetadata invocationPolicy];
    if (!v10) {
      goto LABEL_19;
    }
    [(CPSLaunchContentViewController *)self disableOpenButton];
    [(UIButton *)self->_openButton removeTarget:self action:0 forControlEvents:0x2000];
    if ([v10 isEligible])
    {
      if (([(CPSClipMetadata *)self->_clipMetadata hasFullAppInstalledOnSystem] & 1) == 0
        && !self->_didInstallApplicationPlaceholder
        && ![(CPSClipMetadata *)self->_clipMetadata fullAppOnly])
      {
        goto LABEL_19;
      }
      [(CPSLaunchContentViewController *)self enableOpenButton];
      id v11 = &selRef__openAppClip_;
    }
    else
    {
      if (![v10 isRecoverable])
      {
LABEL_19:

        return;
      }
      [(CPSLaunchContentViewController *)self enableOpenButton];
      id v11 = &selRef_handlePolicyRecovery;
    }
    -[UIButton addTarget:action:forControlEvents:](self->_openButton, "addTarget:action:forControlEvents:", self, *v11, 0x2000, v12, v13, v14, v15, v16);
    goto LABEL_19;
  }
}

uint64_t __50__CPSLaunchContentViewController_updateOpenButton__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1136) setTitle:*(void *)(a1 + 40) forState:0];
  [*(id *)(a1 + 32) _updateCornerRadiusForButtons];
  BOOL v2 = [*(id *)(a1 + 40) length] == 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 1136);

  return [v3 setHidden:v2];
}

- (void)determineClipCompatibility
{
  if (([(CPSClipMetadata *)self->_clipMetadata clipIncompatibleWithCurrentDevice] & 1) != 0
    || [(CPSClipMetadata *)self->_clipMetadata deviceCapabilitiesDontMatch])
  {
    id v3 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];

    if (v3)
    {
      int v4 = [(CPSClipMetadata *)self->_clipMetadata clipIncompatibleWithCurrentDevice];
      id v5 = NSString;
      if (v4)
      {
        id v6 = _CPSLocalizedString();
        id v7 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];
        [MEMORY[0x1E4F59120] oppositeDeviceFamilyName];
      }
      else
      {
        id v6 = _CPSLocalizedString();
        id v7 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];
        [MEMORY[0x1E4F59120] localizedDeviceName];
      uint64_t v8 = };
      objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      id v9 = [MEMORY[0x1E4F590C8] sharedLogger];
      uint64_t v10 = [(CPSClipMetadata *)self->_clipMetadata clipBundleID];
      [v9 recordDidShowErrorWithBundleID:v10 place:@"card" errorCode:1001];

      [(CPSLaunchContentViewController *)self showUnavailableViewWithReason:v11];
    }
  }
}

- (void)signInToAppStore
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v3 = (void *)getAMSAuthenticateOptionsClass(void)::softClass;
  uint64_t v16 = getAMSAuthenticateOptionsClass(void)::softClass;
  if (!getAMSAuthenticateOptionsClass(void)::softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ___ZL30getAMSAuthenticateOptionsClassv_block_invoke;
    v12[3] = &unk_1E6AE9338;
    v12[4] = &v13;
    ___ZL30getAMSAuthenticateOptionsClassv_block_invoke((uint64_t)v12);
    id v3 = (void *)v14[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v13, 8);
  id v5 = objc_alloc_init(v4);
  [v5 setAllowServerDialogs:1];
  id v6 = objc_alloc(MEMORY[0x1E4F4DF30]);
  id v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v8 = objc_msgSend(v7, "ams_activeiTunesAccount");
  id v9 = (void *)[v6 initWithAccount:v8 presentingViewController:self options:v5];

  [(CPSLaunchContentViewController *)self disableOpenButton];
  uint64_t v10 = [v9 performAuthentication];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__CPSLaunchContentViewController_signInToAppStore__block_invoke;
  v11[3] = &unk_1E6AE9220;
  v11[4] = self;
  [v10 addFinishBlock:v11];
}

void __50__CPSLaunchContentViewController_signInToAppStore__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CPSLaunchContentViewController_signInToAppStore__block_invoke_2;
  v7[3] = &unk_1E6AE91F8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __50__CPSLaunchContentViewController_signInToAppStore__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v2 = *(id **)(a1 + 40);
  if (v3)
  {
    return [v2 enableOpenButton];
  }
  else
  {
    [v2[142] removeTarget:0 action:0 forControlEvents:0x2000];
    [*(id *)(*(void *)(a1 + 40) + 1056) setInvocationPolicy:0];
    uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 1064);
    return [v5 prewarmClip];
  }
}

- (void)handlePolicyRecovery
{
  uint64_t v3 = [(CPSClipMetadata *)self->_clipMetadata invocationPolicy];
  id v4 = [v3 localizedTitle];
  uint64_t v5 = [v3 localizedMessageForClipMetadata:self->_clipMetadata];
  uint64_t v6 = [v3 reason];
  id v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
  id v8 = (void *)MEMORY[0x1E4F42720];
  uint64_t v9 = _CPSLocalizedString();
  uint64_t v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  if (v6 == 1)
  {
    id v11 = (void *)MEMORY[0x1E4F42720];
    uint64_t v12 = _CPSLocalizedString();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke;
    v17[3] = &unk_1E6AE9298;
    v17[4] = self;
    uint64_t v13 = [v11 actionWithTitle:v12 style:0 handler:v17];

    [v7 addAction:v13];
    [v7 addAction:v10];
    [v7 setPreferredAction:v13];
  }
  else
  {
    [v7 addAction:v10];
    uint64_t v14 = (void *)MEMORY[0x1E4F42720];
    uint64_t v15 = _CPSLocalizedString();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_4;
    v16[3] = &unk_1E6AE9298;
    v16[4] = self;
    uint64_t v13 = [v14 actionWithTitle:v15 style:0 handler:v16];

    [v7 addAction:v13];
    [v7 setPreferredAction:v13];
  }

  [(CPSLaunchContentViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA6B38]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_2;
  v5[3] = &unk_1E6AE9270;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = v3;
  id v4 = v2;
  [v4 requestPasscodeUnlockUIWithOptions:0 withCompletion:v5];
}

void __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_2(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_3;
  block[3] = &unk_1E6AE9248;
  id v4 = *(id *)(a1 + 32);
  char v9 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) invalidate];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 signInToAppStore];
  }
  return result;
}

uint64_t __54__CPSLaunchContentViewController_handlePolicyRecovery__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) openAppStore];
}

- (void)setUnavailableViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CPSAppClipUnavailableView *)self->_unavailableView isHidden] != a3)
  {
    [(CPSAppClipUnavailableView *)self->_unavailableView setHidden:v3];
    uint64_t v5 = v3 ^ 1;
    [(UIStackView *)self->_informationContentView setHidden:v5];
    if ((v5 & 1) == 0)
    {
      unavailableView = self->_unavailableView;
      [(CPSAppClipUnavailableView *)unavailableView setReasonString:0];
    }
  }
}

- (void)showUnavailableViewWithReason:(id)a3
{
  id v4 = a3;
  [(CPSLaunchContentViewController *)self setUnavailableViewHidden:0];
  [(CPSAppClipUnavailableView *)self->_unavailableView setReasonString:v4];
  uint64_t v5 = [(CPSClipMetadata *)self->_clipMetadata invocationPolicy];
  if ([v5 reason] == 14)
  {
    id v6 = [(CPSSessionProxy *)self->_sessionProxy launchReason];
    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F590A0]];

    if ((v7 & 1) == 0)
    {
      objc_initWeak(&location, self);
      unavailableView = self->_unavailableView;
      uint64_t v9 = MEMORY[0x1E4F143A8];
      uint64_t v10 = 3221225472;
      id v11 = __64__CPSLaunchContentViewController_showUnavailableViewWithReason___block_invoke;
      uint64_t v12 = &unk_1E6AE9180;
      objc_copyWeak(&v13, &location);
      [(CPSAppClipUnavailableView *)unavailableView enableURLFallbackWithAction:&v9];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
  [(CPSAppClipUnavailableView *)self->_unavailableView layoutIfNeeded];
}

void __64__CPSLaunchContentViewController_showUnavailableViewWithReason___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    id v2 = [WeakRetained[132] clipLaunchURL];
    [v3 _openNonAppClipURL:v2];

    WeakRetained = v3;
  }
}

- (UIImage)_heroImage
{
  return [(UIImageView *)self->_heroImageView image];
}

- (void)_setHeroImage:(id)a3
{
  id v5 = a3;
  -[UIImageView setImage:](self->_heroImageView, "setImage:");
  [(UIImageView *)self->_heroMirrorImageView setImage:v5];
  if (v5) {
    [MEMORY[0x1E4F428B8] clearColor];
  }
  else {
  id v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  [(CPSAppClipUnavailableView *)self->_unavailableView setBackgroundColor:v4];

  [(CPSPermissionsViewController *)self->_permissionsViewController setBackgroundImage:v5];
}

- (void)_openAppClip:(id)a3
{
  if ([(CPSClipMetadata *)self->_clipMetadata fullAppOnly]
    && ([(CPSClipMetadata *)self->_clipMetadata hasFullAppInstalledOnSystem] & 1) == 0)
  {
    uint64_t v8 = NSString;
    uint64_t v9 = _CPSLocalizedString();
    uint64_t v10 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];
    objc_msgSend(v8, "stringWithFormat:", v9, v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    id v11 = NSString;
    uint64_t v12 = _CPSLocalizedString();
    id v13 = [(CPSClipMetadata *)self->_clipMetadata fullAppName];
    uint64_t v14 = [MEMORY[0x1E4F59120] localizedDeviceName];
    uint64_t v15 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v14);

    uint64_t v16 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v7 message:v15 preferredStyle:1];
    id v17 = (void *)MEMORY[0x1E4F42720];
    double v18 = _CPSLocalizedString();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__CPSLaunchContentViewController__openAppClip___block_invoke;
    v25[3] = &unk_1E6AE9298;
    v25[4] = self;
    uint64_t v19 = [v17 actionWithTitle:v18 style:0 handler:v25];

    id v20 = (void *)MEMORY[0x1E4F42720];
    v21 = _CPSLocalizedString();
    double v22 = [v20 actionWithTitle:v21 style:1 handler:0];

    [v16 addAction:v19];
    [v16 addAction:v22];
    [v16 setPreferredAction:v19];
    [(CPSLaunchContentViewController *)self presentViewController:v16 animated:1 completion:0];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F590E0]);
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CPSPermissionView notificationPermissionEnabled](self->_permissionView, "notificationPermissionEnabled"));
    [v4 setUserNotificationGranted:v5];

    id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CPSPermissionView locationConfirmationPermissionEnabled](self->_permissionView, "locationConfirmationPermissionEnabled"));
    [v4 setLocationConfirmationGranted:v6];

    [v4 setShowsAppAttributionBanner:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __47__CPSLaunchContentViewController__openAppClip___block_invoke_2;
    v23[3] = &unk_1E6AE91F8;
    void v23[4] = self;
    id v7 = v4;
    id v24 = v7;
    [(CPSLaunchContentViewController *)self _dismissCardWithClipDidOpen:1 andPerformBlockToLaunchApp:v23];
  }
}

uint64_t __47__CPSLaunchContentViewController__openAppClip___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openAppStore];
}

uint64_t __47__CPSLaunchContentViewController__openAppClip___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1064);
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1D8589000, v2, OS_LOG_TYPE_DEFAULT, "CPSLaunchContentViewController: Opening clip for proxy (%p)", (uint8_t *)&v10, 0xCu);
  }
  id v4 = [MEMORY[0x1E4F590C8] sharedLogger];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1056) clipBundleID];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 1056);
  uint64_t v8 = [*(id *)(v6 + 1064) launchReason];
  [v4 recordDidTapOpenButtonInCardWithBundleID:v5 metadata:v7 launchReason:v8 launchOptions:*(void *)(a1 + 40) didShowCardInline:*(void *)(*(void *)(a1 + 32) + 1160) == 1];

  return [*(id *)(*(void *)(a1 + 32) + 1064) openClipWithLaunchOptions:*(void *)(a1 + 40) completion:0];
}

- (void)openAppStore
{
  id v3 = [(CPSClipMetadata *)self->_clipMetadata fullAppStoreURL];
  -[CPSLaunchContentViewController _openNonAppClipURL:](self, "_openNonAppClipURL:");
}

- (void)_openNonAppClipURL:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
  uint64_t v24 = *MEMORY[0x1E4F43688];
  uint64_t v6 = [(CPSClipMetadata *)self->_clipMetadata clipBundleID];
  v25[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F62670]];

  if ([(CPSSessionProxy *)self->_sessionProxy originIsControlCenter])
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v8 = (void *)getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr;
    uint64_t v23 = getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr;
    if (!getCCUIAppLaunchOriginControlCenterSymbolLoc(void)::ptr)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = ___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke;
      v19[3] = &unk_1E6AE9338;
      v19[4] = &v20;
      ___ZL44getCCUIAppLaunchOriginControlCenterSymbolLocv_block_invoke(v19);
      uint64_t v8 = (void *)v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v8)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"NSString *getCCUIAppLaunchOriginControlCenter()"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"CPSLaunchContentViewController.mm", 42, @"%s", dlerror());

      __break(1u);
    }
    [v5 setObject:*v8 forKeyedSubscript:*MEMORY[0x1E4F62658]];
  }
  uint64_t v9 = [MEMORY[0x1E4F590C8] sharedLogger];
  int v10 = [(CPSSessionProxy *)self->_sessionProxy metadata];
  uint64_t v11 = [v10 clipBundleID];
  [v9 didCancelInterstitialForClip:v11 withEvent:3 didShowCardInline:self->_displayMode == 1];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__CPSLaunchContentViewController__openNonAppClipURL___block_invoke;
  v16[3] = &unk_1E6AE91F8;
  id v12 = v4;
  id v17 = v12;
  id v13 = v5;
  id v18 = v13;
  [(CPSLaunchContentViewController *)self _dismissCardWithClipDidOpen:0 andPerformBlockToLaunchApp:v16];
}

id __53__CPSLaunchContentViewController__openNonAppClipURL___block_invoke(uint64_t a1)
{
  return (id)[MEMORY[0x1E4F59120] openURL:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];
}

- (BOOL)shouldRequestLocationConfirmationPermission
{
  if (![(CPSClipMetadata *)self->_clipMetadata clipRequestsLocationConfirmationPermission]|| ![(CPSSessionProxy *)self->_sessionProxy canRequestLocationConfirmation])
  {
    return 0;
  }
  id v3 = (void *)MEMORY[0x1E4F59100];

  return [v3 locationServiceEnabled];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CPSLaunchContentViewController;
  [(CPSLaunchContentViewController *)&v4 touchesEnded:a3 withEvent:a4];
}

- (void)dismiss:(id)a3
{
  id v6 = a3;
  id v4 = [(CPSVibrantButton *)self->_closeButton uiButton];

  if (v4 == v6)
  {
    [(CPSLaunchContentViewController *)self logDismissalFromCloseButton:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained launchContentViewController:self didTapCloseButton:1];
    }
  }
  [(CPSLaunchContentViewController *)self _dismissWithClipDidOpen:0 completion:0];
}

- (void)logDismissalFromCloseButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [MEMORY[0x1E4F590C8] sharedLogger];
  id v5 = [(CPSSessionProxy *)self->_sessionProxy metadata];
  uint64_t v6 = [v5 clipBundleID];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_1F306C450;
  }
  if (v3) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  [v10 didCancelInterstitialForClip:v8 withEvent:v9 didShowCardInline:self->_displayMode == 1];
}

- (void)_dismissWithClipDidOpen:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F29060] currentThread];
  int v8 = [v7 isMainThread];

  if (v8)
  {
    [(CPSLaunchContentViewController *)self _dismissCardWithClipDidOpen:v4 completion:v6];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__CPSLaunchContentViewController__dismissWithClipDidOpen_completion___block_invoke;
    block[3] = &unk_1E6AE92C0;
    void block[4] = self;
    BOOL v11 = v4;
    id v10 = v6;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __69__CPSLaunchContentViewController__dismissWithClipDidOpen_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissCardWithClipDidOpen:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_dismissCardWithClipDidOpen:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  self->_dismissalInProgress = 1;
  if (!a3) {
    [(CPSLaunchContentViewController *)self cancelSession];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__CPSLaunchContentViewController__dismissCardWithClipDidOpen_completion___block_invoke;
  v10[3] = &unk_1E6AE92C0;
  v10[4] = self;
  BOOL v12 = a3;
  id v7 = v6;
  id v11 = v7;
  uint64_t v8 = MEMORY[0x1D9487A30](v10);
  uint64_t v9 = (void *)v8;
  if (self->_displayMode == 1) {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
  }
  else {
    [(CPSLaunchContentViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

void __73__CPSLaunchContentViewController__dismissCardWithClipDidOpen_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1184));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained launchContentViewControllerDidDisappear:*(void *)(a1 + 32) didOpenClip:*(unsigned __int8 *)(a1 + 48)];
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (BOOL)_canLaunchAppSimultaneouslyWithInvocationCardDismissal
{
  return [(CPSSessionProxy *)self->_sessionProxy originIsControlCenter];
}

- (void)_dismissCardWithClipDidOpen:(BOOL)a3 andPerformBlockToLaunchApp:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  if ([(CPSLaunchContentViewController *)self _canLaunchAppSimultaneouslyWithInvocationCardDismissal])
  {
    [(CPSLaunchContentViewController *)self _dismissCardWithClipDidOpen:v4 completion:0];
    v6[2]();
  }
  else
  {
    [(CPSLaunchContentViewController *)self _dismissCardWithClipDidOpen:v4 completion:v6];
  }
}

- (void)cancelSession
{
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_updateHeroImageIfNeeded
{
  BOOL v3 = [(CPSLaunchContentViewController *)self _heroImage];

  if (v3) {
    return;
  }
  id v11 = [(CPSClipMetadata *)self->_clipMetadata invocationPolicy];
  int v4 = [v11 canShowHeroImage];

  if (v4)
  {
    id v5 = [(CPSSessionProxy *)self->_sessionProxy heroImageFileURL];
    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F42A80];
      id v12 = v5;
      id v7 = [v5 path];
      uint64_t v8 = [v6 imageWithContentsOfFile:v7];

      id v5 = v12;
      if (v8)
      {
        [(CPSLaunchContentViewController *)self _setHeroImage:v8];
LABEL_10:

        goto LABEL_11;
      }
    }
  }
  id v12 = [(CPSClipMetadata *)self->_clipMetadata clipHeroImageURL];
  if (objc_msgSend(v12, "cps_isFileURL")
    && ([(CPSClipMetadata *)self->_clipMetadata isDeveloperOverride] & 1) == 0)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F42A80]);
    uint64_t v8 = [v12 path];
    id v10 = (void *)[v9 initWithContentsOfFile:v8];
    [(CPSLaunchContentViewController *)self _setHeroImage:v10];

    goto LABEL_10;
  }
LABEL_11:
}

- (id)_reasonStringForError:(id)a3
{
  id v4 = a3;
  nw_path_status_t status = nw_path_get_status((nw_path_t)self->_networkPath);
  id v6 = (void *)MEMORY[0x1E4F59098];
  if (status != nw_path_status_unsatisfied) {
    goto LABEL_6;
  }
  id v7 = [v4 domain];
  if (([v7 isEqualToString:*v6] & 1) == 0)
  {

    goto LABEL_6;
  }
  if ([v4 code] != 10)
  {
    uint64_t v12 = [v4 code];

    if (v12 == 2) {
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v8 = [v4 domain];
    if ([v8 isEqualToString:*v6])
    {
      uint64_t v9 = [v4 code];

      if (v9 == 10)
      {
LABEL_12:
        uint64_t v11 = _CPSLocalizedString();
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v10 = [v4 localizedDescription];

    if (v10)
    {
      uint64_t v11 = [v4 localizedDescription];
      goto LABEL_15;
    }
    goto LABEL_12;
  }

LABEL_14:
  uint64_t v11 = cps_networkUnavailableErrorLocalizedDescription();
LABEL_15:
  id v13 = (void *)v11;

  return v13;
}

- (void)createNetworkPathMonitor
{
  BOOL v3 = (OS_nw_path_monitor *)nw_path_monitor_create();
  networkPathMonitor = self->_networkPathMonitor;
  self->_networkPathMonitor = v3;

  id v5 = self->_networkPathMonitor;
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke;
  update_handler[3] = &unk_1E6AE92E8;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v5, update_handler);
  nw_path_monitor_set_queue((nw_path_monitor_t)self->_networkPathMonitor, MEMORY[0x1E4F14428]);
  nw_path_monitor_start((nw_path_monitor_t)self->_networkPathMonitor);
}

void __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = a1 + 32;
  objc_storeStrong((id *)(v6 + 1120), a2);
  if (nw_path_get_status(*(nw_path_t *)(*(void *)v5 + 1120)) == nw_path_status_unsatisfied)
  {
    id v7 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke_cold_1((uint64_t)v4, v5, v7);
    }
    uint64_t v8 = *(void **)v5;
    if (v8[141])
    {
      uint64_t v9 = objc_msgSend(v8, "_reasonStringForError:");
      [v8 showUnavailableViewWithReason:v9];
    }
  }
  else
  {
    id v10 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)v5 + 1128);
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1D8589000, v10, OS_LOG_TYPE_DEFAULT, "Network path: %@ _proxyError: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)permissionsViewControllerDidFinish:(id)a3
{
  id v4 = (CPSPermissionsViewController *)a3;
  if (self->_permissionsViewController == v4)
  {
    id v10 = v4;
    uint64_t v5 = [(CPSLaunchContentViewController *)self navigationController];
    uint64_t v6 = [v5 topViewController];
    permissionsViewController = self->_permissionsViewController;

    id v4 = v10;
    if (v6 == permissionsViewController)
    {
      [(CPSPermissionView *)self->_permissionView setNotificationPermissionEnabled:[(CPSPermissionsViewController *)v10 notificationPermissionEnabled]];
      [(CPSPermissionView *)self->_permissionView setLocationConfirmationPermissionEnabled:[(CPSPermissionsViewController *)v10 locationConfirmationPermissionEnabled]];
      uint64_t v8 = [(CPSLaunchContentViewController *)self navigationController];
      id v9 = (id)[v8 popViewControllerAnimated:1];

      id v4 = v10;
    }
  }
}

- (BOOL)allowsPullToDismiss
{
  return self->_displayMode == 0;
}

- (void)updatePreferredContentSizeForCardWidth:(double)a3
{
  uint64_t v5 = [(CPSLaunchContentViewController *)self view];
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  id v8 = v5;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v6, v7);
  -[CPSLaunchContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CPSLaunchContentViewController_proxyDidUpdateMetadata___block_invoke;
  v6[3] = &unk_1E6AE91F8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __57__CPSLaunchContentViewController_proxyDidUpdateMetadata___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 1056)) {
    [*(id *)(a1 + 40) prewarmClip];
  }
  uint64_t v2 = [*(id *)(a1 + 40) metadata];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1056);
  *(void *)(v3 + 1056) = v2;

  [*(id *)(a1 + 32) _sendAnalyticsIfNeeded];
  id v5 = *(void **)(a1 + 32);

  return [v5 _updateContent];
}

- (void)proxyDidInstallApplicationPlaceholder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v10 = v4;
    _os_log_impl(&dword_1D8589000, v5, OS_LOG_TYPE_DEFAULT, "CPSLaunchContentViewController: Did install placeholder for proxy (%p)", buf, 0xCu);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke;
  v7[3] = &unk_1E6AE91F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1105) = 1;
  [*(id *)(a1 + 32) updateOpenButton];
  if ([*(id *)(a1 + 40) usedByPPT])
  {
    dispatch_time_t v2 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke_2;
    block[3] = &unk_1E6AE9158;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __72__CPSLaunchContentViewController_proxyDidInstallApplicationPlaceholder___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openAppClip:0];
}

- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CPSLaunchContentViewController_proxy_didRetrieveApplicationIcon___block_invoke;
  v7[3] = &unk_1E6AE91F8;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __67__CPSLaunchContentViewController_proxy_didRetrieveApplicationIcon___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F42A80];
    id v5 = [*(id *)(a1 + 40) path];
    id v4 = objc_msgSend(v3, "imageWithContentsOfFile:");
  }
  else
  {
    id v4 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1048) setAppIcon:v4];
  if (v2)
  {
  }
}

- (void)proxy:(id)a3 didRetrieveHeroImage:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CPSLaunchContentViewController_proxy_didRetrieveHeroImage___block_invoke;
  block[3] = &unk_1E6AE9158;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__CPSLaunchContentViewController_proxy_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHeroImageIfNeeded];
}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v3 = a3;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CPSLaunchContentViewController proxyRemoteServiceDidCrash:]((uint64_t)v3, v4);
  }
}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)CPS_LOG_CHANNEL_PREFIXClipUIServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend(v7, "cps_privacyPreservingDescription");
    [(CPSLaunchContentViewController *)(uint64_t)v6 proxy:buf didFinishLoadingWithError:v8];
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CPSLaunchContentViewController_proxy_didFinishLoadingWithError___block_invoke;
  block[3] = &unk_1E6AE9310;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__CPSLaunchContentViewController_proxy_didFinishLoadingWithError___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 141, a1[5]);
  id v5 = [MEMORY[0x1E4F590C8] sharedLogger];
  uint64_t v2 = [a1[6] metadata];
  id v3 = [v2 clipBundleID];
  [v5 recordDidShowErrorWithBundleID:v3 place:@"card" errorCode:1000];

  [a1[4] loadViewIfNeeded];
  id v4 = a1[4];
  id v6 = [v4 _reasonStringForError:a1[5]];
  objc_msgSend(v4, "showUnavailableViewWithReason:");
}

- (CPSLaunchContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSLaunchContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)dismissalInProgress
{
  return self->_dismissalInProgress;
}

- (void)setDismissalInProgress:(BOOL)a3
{
  self->_dismissalInProgress = a3;
}

- (NSNumber)uiMock_openButtonEnabled
{
  return self->_uiMock_openButtonEnabled;
}

- (void)uiMock_setOpenButtonEnabled:(id)a3
{
  self->_uiMock_openButtonEnabled = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_delayedPermissionViewUnhideBlock, 0);
  objc_storeStrong((id *)&self->_openVibrantButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_proxyLoadingError, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_networkPathMonitor, 0);
  objc_storeStrong((id *)&self->_heroContainerAspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_permissionsViewController, 0);
  objc_storeStrong((id *)&self->_unavailableView, 0);
  objc_storeStrong((id *)&self->_permissionView, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_clipMetadata, 0);
  objc_storeStrong((id *)&self->_appMetadataView, 0);
  objc_storeStrong((id *)&self->_clipDescriptionVibrantLabel, 0);
  objc_storeStrong((id *)&self->_clipNameVibrantLabel, 0);
  objc_storeStrong((id *)&self->_clipInformationContainerView, 0);
  objc_storeStrong((id *)&self->_informationContentView, 0);
  objc_storeStrong((id *)&self->_informationContainerView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_heroMirrorImageView, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);

  objc_storeStrong((id *)&self->_heroContainerView, 0);
}

void __58__CPSLaunchContentViewController_createNetworkPathMonitor__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 1128);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "Network path: %@ _proxyError: %@", (uint8_t *)&v4, 0x16u);
}

- (void)proxyRemoteServiceDidCrash:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D8589000, a2, OS_LOG_TYPE_ERROR, "CPSLaunchContentViewController: Remote service did crash for proxy (%p)", (uint8_t *)&v2, 0xCu);
}

- (void)proxy:(uint8_t *)buf didFinishLoadingWithError:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D8589000, log, OS_LOG_TYPE_ERROR, "CPSLaunchContentViewController: -didFinishLoadingWithError: for proxy (%p), error: %{public}@", buf, 0x16u);
}

@end