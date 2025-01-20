@interface SFSafariLaunchPlaceholderView
+ (id)blankPlaceholder;
+ (id)compatibilityPlaceholderWithAppName:(id)a3 destinationURL:(id)a4 forAuthentication:(BOOL)a5 dismissalHandler:(id)a6 openHandler:(id)a7;
- (BOOL)showContinueButton;
- (double)topLayoutGuideInset;
- (int64_t)positionForBar:(id)a3;
- (uint64_t)initWithAppName:(void *)a3 destinationURL:(char)a4 forAuthentication:(void *)a5 dismissalHandler:(void *)a6 openHandler:;
- (void)_dismissTapped:(id)a3;
- (void)_openTapped:(id)a3;
- (void)_setUpExplanationViewIfNeeded;
- (void)_updateLargeButton;
- (void)layoutSubviews;
- (void)setShowContinueButton:(BOOL)a3;
- (void)setTopLayoutGuideInset:(double)a3;
- (void)updateBarTintColor:(id)a3;
- (void)updateControlTintColor:(id)a3;
- (void)updateDismissButtonStyle:(int64_t)a3;
@end

@implementation SFSafariLaunchPlaceholderView

+ (id)blankPlaceholder
{
  v2 = (void *)-[SFSafariLaunchPlaceholderView initWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:]((uint64_t)objc_alloc((Class)a1), 0, 0, 0, 0, 0);

  return v2;
}

- (uint64_t)initWithAppName:(void *)a3 destinationURL:(char)a4 forAuthentication:(void *)a5 dismissalHandler:(void *)a6 openHandler:
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    v52.receiver = (id)a1;
    v52.super_class = (Class)SFSafariLaunchPlaceholderView;
    v15 = objc_msgSendSuper2(&v52, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = (uint64_t)v15;
    if (v15)
    {
      v15[408] = a4;
      v16 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      [(id)a1 setBackgroundColor:v16];

      id v17 = objc_alloc_init(MEMORY[0x1E4FB19D0]);
      v18 = *(void **)(a1 + 464);
      *(void *)(a1 + 464) = v17;

      [*(id *)(a1 + 464) setDelegate:a1];
      [*(id *)(a1 + 464) _setAlwaysUseDefaultMetrics:1];
      [(id)a1 addSubview:*(void *)(a1 + 464)];
      if (v12)
      {
        id v51 = v13;
        uint64_t v19 = MEMORY[0x1AD0C36A0](v13);
        v20 = *(void **)(a1 + 432);
        *(void *)(a1 + 432) = v19;

        uint64_t v21 = MEMORY[0x1AD0C36A0](v14);
        v22 = *(void **)(a1 + 440);
        *(void *)(a1 + 440) = v21;

        -[SFSafariLaunchPlaceholderView _setUpExplanationViewIfNeeded]((id *)a1);
        if (*(unsigned char *)(a1 + 408)) {
          uint64_t v23 = 0;
        }
        else {
          uint64_t v23 = 3;
        }
        v24 = [*(id *)(a1 + 448) textContainer];
        [v24 setMaximumNumberOfLines:v23];

        if (*(unsigned char *)(a1 + 408)) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = 5;
        }
        v26 = [*(id *)(a1 + 448) textContainer];
        [v26 setLineBreakMode:v25];

        v27 = [MEMORY[0x1E4FB1818] systemImageNamed:@"globe"];
        [*(id *)(a1 + 424) setImage:v27];

        v28 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928] scale:3];
        [*(id *)(a1 + 424) setPreferredSymbolConfiguration:v28];

        id v50 = v14;
        v31 = _WBSLocalizedString();
        [*(id *)(a1 + 456) setText:v31];

        v32 = NSString;
        if (*(unsigned char *)(a1 + 408))
        {
          v33 = _WBSLocalizedString();
          v34 = objc_msgSend(v12, "safari_userVisibleHost");
          v35 = objc_msgSend(v32, "stringWithFormat:", v33, v11, v34, v11);
        }
        else
        {
          v33 = _WBSLocalizedString();
          v35 = objc_msgSend(v32, "stringWithFormat:", v33, v11);
        }

        id v36 = objc_alloc_init(MEMORY[0x1E4FB1378]);
        [v36 setAlignment:1];
        id v37 = objc_alloc(MEMORY[0x1E4F28E48]);
        v53[0] = *MEMORY[0x1E4FB12B0];
        v38 = [*(id *)(a1 + 448) font];
        v54[0] = v38;
        v53[1] = *MEMORY[0x1E4FB12B8];
        v39 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        v53[2] = *MEMORY[0x1E4FB12D0];
        v54[1] = v39;
        v54[2] = v36;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
        v41 = (void *)[v37 initWithString:v35 attributes:v40];

        if (!*(unsigned char *)(a1 + 408))
        {
          v42 = objc_msgSend(v12, "safari_userVisibleString");
          objc_msgSend(v41, "safari_replaceOccurrenceOfString:withString:link:", @"{some-url}", v42, v12);
        }
        [*(id *)(a1 + 448) setAttributedText:v41];
        -[SFSafariLaunchPlaceholderView _updateLargeButton](a1);
        id v43 = objc_alloc_init(MEMORY[0x1E4FB19F0]);
        uint64_t v44 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1EFB97EB8 style:2 target:a1 action:sel__dismissTapped_];
        v45 = *(void **)(a1 + 472);
        *(void *)(a1 + 472) = v44;

        v46 = [MEMORY[0x1E4FB1438] sharedApplication];
        int v47 = objc_msgSend(v46, "safari_prefersRTLLayout");

        uint64_t v48 = *(void *)(a1 + 472);
        if (v47) {
          [v43 setRightBarButtonItem:v48];
        }
        else {
          [v43 setLeftBarButtonItem:v48];
        }
        [*(id *)(a1 + 464) pushNavigationItem:v43 animated:0];

        id v14 = v50;
        id v13 = v51;
      }
      else
      {
        id v29 = objc_alloc_init(MEMORY[0x1E4FB1DF0]);
        v30 = *(void **)(a1 + 416);
        *(void *)(a1 + 416) = v29;

        [(id)a1 addSubview:*(void *)(a1 + 416)];
      }
    }
  }

  return a1;
}

+ (id)compatibilityPlaceholderWithAppName:(id)a3 destinationURL:(id)a4 forAuthentication:(BOOL)a5 dismissalHandler:(id)a6 openHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)-[SFSafariLaunchPlaceholderView initWithAppName:destinationURL:forAuthentication:dismissalHandler:openHandler:]((uint64_t)objc_alloc((Class)a1), v15, v14, a5, v13, v12);

  return v16;
}

- (void)_setUpExplanationViewIfNeeded
{
  v66[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a1[53])
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4FB1838]);
      id v3 = a1[53];
      a1[53] = v2;

      [a1[53] setTranslatesAutoresizingMaskIntoConstraints:0];
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
      id v5 = a1[57];
      a1[57] = v4;

      [a1[57] setTextAlignment:1];
      v6 = objc_msgSend(MEMORY[0x1E4FB1798], "_sf_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E4FB2990], 2);
      [a1[57] setFont:v6];

      [a1[57] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1[57] setNumberOfLines:2];
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
      id v8 = a1[56];
      a1[56] = v7;

      [a1[56] setAdjustsFontForContentSizeCategory:1];
      v9 = [MEMORY[0x1E4FB1618] clearColor];
      [a1[56] setBackgroundColor:v9];

      [a1[56] setEditable:0];
      v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [a1[56] setFont:v10];

      [a1[56] _setInteractiveTextSelectionDisabled:1];
      uint64_t v65 = *MEMORY[0x1E4FB12B8];
      id v11 = [MEMORY[0x1E4FB1618] linkColor];
      v66[0] = v11;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
      [a1[56] setLinkTextAttributes:v12];

      [a1[56] setScrollEnabled:0];
      [a1[56] setSelectable:1];
      [a1[56] setShowsVerticalScrollIndicator:0];
      id v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [a1[56] setTextColor:v13];

      id v14 = [a1[56] textContainer];
      [v14 setLineFragmentPadding:0.0];

      objc_msgSend(a1[56], "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
      [a1[56] setTranslatesAutoresizingMaskIntoConstraints:0];
      id v15 = (void *)MEMORY[0x1E4FB14D0];
      v16 = [MEMORY[0x1E4FB14D8] borderedButtonConfiguration];
      uint64_t v17 = [v15 buttonWithConfiguration:v16 primaryAction:0];
      id v18 = a1[60];
      a1[60] = (id)v17;

      [a1[60] setTranslatesAutoresizingMaskIntoConstraints:0];
      [a1 insertSubview:a1[53] belowSubview:a1[58]];
      [a1 insertSubview:a1[57] belowSubview:a1[58]];
      [a1 insertSubview:a1[56] belowSubview:a1[58]];
      [a1 insertSubview:a1[60] belowSubview:a1[58]];
      uint64_t v19 = [a1[56] centerYAnchor];
      v20 = [a1 centerYAnchor];
      uint64_t v21 = [v19 constraintEqualToAnchor:v20];

      int v47 = v21;
      LODWORD(v22) = 1132068864;
      [v21 setPriority:v22];
      uint64_t v23 = [a1[60] topAnchor];
      v24 = [a1[56] bottomAnchor];
      uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:32.0];

      v26 = v25;
      id v43 = v25;
      LODWORD(v27) = 1132068864;
      [v25 setPriority:v27];
      id v51 = (void *)MEMORY[0x1E4F28DC8];
      v63 = [a1[53] centerXAnchor];
      v62 = [a1 centerXAnchor];
      v61 = [v63 constraintEqualToAnchor:v62];
      v64[0] = v61;
      v60 = [a1[57] centerXAnchor];
      v59 = [a1 centerXAnchor];
      v58 = [v60 constraintEqualToAnchor:v59];
      v64[1] = v58;
      v57 = [a1[56] centerXAnchor];
      v56 = [a1 centerXAnchor];
      v55 = [v57 constraintEqualToAnchor:v56];
      v64[2] = v55;
      v54 = [a1[60] centerXAnchor];
      v53 = [a1 centerXAnchor];
      objc_super v52 = [v54 constraintEqualToAnchor:v53];
      v64[3] = v52;
      id v50 = [a1[53] topAnchor];
      v49 = [a1[58] bottomAnchor];
      uint64_t v48 = [v50 constraintGreaterThanOrEqualToAnchor:v49 constant:13.0];
      v64[4] = v48;
      v46 = [a1[57] topAnchor];
      v45 = [a1[53] bottomAnchor];
      uint64_t v44 = [v46 constraintEqualToAnchor:v45 constant:20.0];
      v64[5] = v44;
      v42 = [a1[57] leadingAnchor];
      v41 = [a1 leadingAnchor];
      v40 = [v42 constraintGreaterThanOrEqualToAnchor:v41 constant:30.0];
      v64[6] = v40;
      v39 = [a1 trailingAnchor];
      v38 = [a1[57] trailingAnchor];
      v28 = [v39 constraintGreaterThanOrEqualToAnchor:v38 constant:30.0];
      v64[7] = v28;
      v64[8] = v21;
      id v29 = [a1[56] widthAnchor];
      v30 = [v29 constraintLessThanOrEqualToConstant:300.0];
      v64[9] = v30;
      v31 = [a1[56] topAnchor];
      v32 = [a1[57] bottomAnchor];
      v33 = [v31 constraintEqualToAnchor:v32 constant:13.0];
      v64[10] = v33;
      v64[11] = v26;
      v34 = [a1 bottomAnchor];
      v35 = [a1[60] bottomAnchor];
      id v36 = [v34 constraintGreaterThanOrEqualToAnchor:v35 constant:10.0];
      v64[12] = v36;
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:13];
      [v51 activateConstraints:v37];
    }
  }
}

- (void)_updateLargeButton
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 408))
    {
      [*(id *)(a1 + 480) setHidden:*(unsigned char *)(a1 + 488) == 0];
      [*(id *)(a1 + 480) addTarget:a1 action:sel__openTapped_ forControlEvents:0x2000];
      id v2 = *(void **)(a1 + 480);
      uint64_t v3 = _WBSLocalizedString();
      id v4 = v2;
    }
    else
    {
      [*(id *)(a1 + 480) setHidden:0];
      [*(id *)(a1 + 480) addTarget:a1 action:sel__dismissTapped_ forControlEvents:0x2000];
      id v5 = *(void **)(a1 + 480);
      uint64_t v3 = [*(id *)(a1 + 472) title];
      id v4 = v5;
    }
    id v6 = (id)v3;
    objc_msgSend(v4, "setTitle:forState:");
  }
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SFSafariLaunchPlaceholderView;
  [(SFSafariLaunchPlaceholderView *)&v25 layoutSubviews];
  [(SFSafariLaunchPlaceholderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = [(SFSafariLaunchPlaceholderView *)self window];
  id v12 = [v11 windowScene];
  id v13 = [v12 statusBarManager];
  [v13 statusBarFrame];
  +[_SFNavigationBar estimatedDefaultHeightForStatusBarHeight:CGRectGetHeight(v26)];
  double v15 = v14;

  [(SFSafariLaunchPlaceholderView *)self safeAreaInsets];
  double topLayoutGuideInset = v16;
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    double topLayoutGuideInset = self->_topLayoutGuideInset;
  }
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  -[UINavigationBar setFrame:](self->_topNavigationBar, "setFrame:", 0.0, topLayoutGuideInset, CGRectGetWidth(v27), v15);
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  CGRectGetWidth(v28);
  int IsCompactSizeClass = _SFWidthIsCompactSizeClass();
  bottomToolbar = self->_bottomToolbar;
  if (IsCompactSizeClass)
  {
    -[UIToolbar sizeThatFits:](bottomToolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v21 = v20;
    [(SFSafariLaunchPlaceholderView *)self _sf_bottomUnsafeAreaFrameForToolbar];
    double Height = CGRectGetHeight(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGFloat v23 = CGRectGetHeight(v30) - v21 - Height;
    v31.origin.x = v4;
    v31.origin.y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    -[UIToolbar setFrame:](self->_bottomToolbar, "setFrame:", 0.0, v23, CGRectGetWidth(v31), v21);
    bottomToolbar = self->_bottomToolbar;
    uint64_t v24 = 0;
  }
  else
  {
    uint64_t v24 = 1;
  }
  [(UIToolbar *)bottomToolbar setHidden:v24];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)updateBarTintColor:(id)a3
{
  topNavigationBar = self->_topNavigationBar;
  id v5 = a3;
  [(UINavigationBar *)topNavigationBar setBarTintColor:v5];
  [(UIToolbar *)self->_bottomToolbar setBarTintColor:v5];
}

- (void)updateControlTintColor:(id)a3
{
  topNavigationBar = self->_topNavigationBar;
  id v5 = a3;
  [(UINavigationBar *)topNavigationBar setTintColor:v5];
  [(UIToolbar *)self->_bottomToolbar setTintColor:v5];
}

- (void)updateDismissButtonStyle:(int64_t)a3
{
  +[SFDismissButton titleForDismissButtonStyle:]((uint64_t)SFDismissButton, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIBarButtonItem *)self->_dismissButton setTitle:v4];
  -[SFSafariLaunchPlaceholderView _updateLargeButton]((uint64_t)self);
}

- (void)setShowContinueButton:(BOOL)a3
{
  if (self->_showContinueButton != a3)
  {
    self->_showContinueButton = a3;
    -[SFSafariLaunchPlaceholderView _updateLargeButton]((uint64_t)self);
  }
}

- (void)_dismissTapped:(id)a3
{
  dismissalHandler = (void (**)(void))self->_dismissalHandler;
  if (dismissalHandler) {
    dismissalHandler[2]();
  }
}

- (void)_openTapped:(id)a3
{
  [(UIButton *)self->_largeButton setEnabled:0];
  id openHandler = self->_openHandler;
  if (openHandler)
  {
    id v5 = (void (*)(void))*((void *)openHandler + 2);
    v5();
  }
}

- (double)topLayoutGuideInset
{
  return self->_topLayoutGuideInset;
}

- (void)setTopLayoutGuideInset:(double)a3
{
  self->_double topLayoutGuideInset = a3;
}

- (BOOL)showContinueButton
{
  return self->_showContinueButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_topNavigationBar, 0);
  objc_storeStrong((id *)&self->_linkTitleLabel, 0);
  objc_storeStrong((id *)&self->_linkCaptionTextView, 0);
  objc_storeStrong(&self->_openHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_storeStrong((id *)&self->_browserIconView, 0);

  objc_storeStrong((id *)&self->_bottomToolbar, 0);
}

@end