@interface ASCMiniProductPageView
- (ASCAgeRatingView)ageRatingView;
- (ASCAppearMetricsPresenter)metricsPresenter;
- (ASCArtworkView)iconArtworkView;
- (ASCExpandableLabel)descriptionLabel;
- (ASCLockup)lockup;
- (ASCLockupMediaPresenter)mediaPresenter;
- (ASCLockupPresenter)lockupPresenter;
- (ASCLockupRequest)request;
- (ASCLockupViewGroup)group;
- (ASCMiniProductPageMediaView)mediaView;
- (ASCMiniProductPagePresenter)miniProductPagePresenter;
- (ASCMiniProductPageTitleView)titleView;
- (ASCMiniProductPageView)initWithCoder:(id)a3;
- (ASCMiniProductPageView)initWithFrame:(CGRect)a3;
- (ASCMiniProductPageViewDelegate)delegate;
- (ASCSkeletonLabel)metadataLabel;
- (ASCSkeletonLabel)subtitleLabel;
- (BOOL)showsPlaceholderContent;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredIconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)loadingColor;
- (UIGestureRecognizer)mediaViewTapGestureRecognizer;
- (UIViewController)presentingViewController;
- (id)makeLayout;
- (void)didSelectMediaView:(id)a3 forEvent:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)lockupPresenterDidBeginRequest;
- (void)lockupPresenterDidFailRequestWithError:(id)a3;
- (void)lockupPresenterDidFinishRequest;
- (void)presentDescriptionViewController;
- (void)presentScreenshotsViewControllerWithSelectedIndex:(unint64_t)a3;
- (void)presentingViewController;
- (void)setAgeRating:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDataChanged;
- (void)setDelegate:(id)a3;
- (void)setDescription:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIconImage:(id)a3 withDecoration:(id)a4;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingColor:(id)a3;
- (void)setLockup:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNumberOfLines;
- (void)setPrefersRightToLeftLayout:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setShowsPlaceholderContent:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ASCMiniProductPageView

- (ASCMiniProductPageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v58[1] = *MEMORY[0x1E4F143B8];
  +[ASCEligibility assertCurrentProcessEligibility]();
  v57.receiver = self;
  v57.super_class = (Class)ASCMiniProductPageView;
  v8 = -[ASCMiniProductPageView initWithFrame:](&v57, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[ASCMiniProductPageView setLayoutMargins:](v8, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCMiniProductPageView *)v9 setInsetsLayoutMarginsFromSafeArea:0];
    [(ASCMiniProductPageView *)v9 setClipsToBounds:1];
    v10 = [ASCArtworkView alloc];
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = -[ASCArtworkView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    iconArtworkView = v9->_iconArtworkView;
    v9->_iconArtworkView = (ASCArtworkView *)v15;

    v17 = -[ASCMiniProductPageTitleView initWithFrame:]([ASCMiniProductPageTitleView alloc], "initWithFrame:", v11, v12, v13, v14);
    titleView = v9->_titleView;
    v9->_titleView = v17;

    v19 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = v19;

    v21 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    metadataLabel = v9->_metadataLabel;
    v9->_metadataLabel = v21;

    v23 = -[ASCExpandableLabel initWithFrame:]([ASCExpandableLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    descriptionLabel = v9->_descriptionLabel;
    v9->_descriptionLabel = v23;

    v25 = -[ASCMiniProductPageMediaView initWithFrame:]([ASCMiniProductPageMediaView alloc], "initWithFrame:", v11, v12, v13, v14);
    mediaView = v9->_mediaView;
    v9->_mediaView = v25;

    [(ASCMiniProductPageMediaView *)v9->_mediaView setScreenshotSpacing:8.0];
    v27 = [[ASCAppearMetricsPresenter alloc] initWithView:v9];
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v27;

    v29 = [[ASCLockupPresenter alloc] initWithView:v9 metricsPresenter:v9->_metricsPresenter];
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v29;

    v31 = [[ASCMiniProductPagePresenter alloc] initWithView:v9 lockupPresenter:v9->_lockupPresenter];
    miniProductPagePresenter = v9->_miniProductPagePresenter;
    v9->_miniProductPagePresenter = v31;

    v33 = [[ASCLockupMediaPresenter alloc] initWithView:v9->_mediaView lockupPresenter:v9->_lockupPresenter];
    mediaPresenter = v9->_mediaPresenter;
    v9->_mediaPresenter = v33;

    [(ASCLockupPresenter *)v9->_lockupPresenter setObserver:v9];
    v35 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:", *MEMORY[0x1E4FB2998], 2);
    [(ASCMiniProductPageTitleView *)v9->_titleView setFont:v35];

    v36 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_preferredFontForTextStyle:withTraits:", *MEMORY[0x1E4FB28D0], 2);
    [(ASCSkeletonLabel *)v9->_subtitleLabel setFont:v36];

    uint64_t v37 = *MEMORY[0x1E4FB28F0];
    v38 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:", *MEMORY[0x1E4FB28F0], *MEMORY[0x1E4FB29C0]);
    [(ASCSkeletonLabel *)v9->_metadataLabel setFont:v38];

    v39 = objc_msgSend(MEMORY[0x1E4FB1798], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:", v37, *MEMORY[0x1E4FB29C8]);
    [(ASCExpandableLabel *)v9->_descriptionLabel setFont:v39];

    [(ASCMiniProductPageTitleView *)v9->_titleView setAdjustsFontForContentSizeCategory:1];
    [(ASCSkeletonLabel *)v9->_metadataLabel setAdjustsFontForContentSizeCategory:1];
    [(ASCSkeletonLabel *)v9->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(ASCExpandableLabel *)v9->_descriptionLabel setAdjustsFontForContentSizeCategory:1];
    v40 = [MEMORY[0x1E4FB1618] labelColor];
    [(ASCMiniProductPageTitleView *)v9->_titleView setTextColor:v40];

    v41 = [MEMORY[0x1E4FB1618] labelColor];
    [(ASCSkeletonLabel *)v9->_subtitleLabel setTextColor:v41];

    v42 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(ASCSkeletonLabel *)v9->_metadataLabel setTextColor:v42];

    v43 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(ASCExpandableLabel *)v9->_descriptionLabel setTextColor:v43];

    [(ASCMiniProductPageView *)v9 setNumberOfLines];
    v44 = +[ASCSemanticColor loading]();
    [(ASCMiniProductPageView *)v9 setLoadingColor:v44];

    [(ASCSkeletonLabel *)v9->_descriptionLabel setSkeletonNumberOfLines:2];
    objc_initWeak(&location, v9);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __40__ASCMiniProductPageView_initWithFrame___block_invoke;
    v54[3] = &unk_1E645E6F0;
    objc_copyWeak(&v55, &location);
    [(ASCArtworkView *)v9->_iconArtworkView setAccessibilityLabelBlock:v54];
    [(ASCArtworkView *)v9->_iconArtworkView setIsAccessibilityElement:1];
    [(ASCArtworkView *)v9->_iconArtworkView setAccessibilityTraits:*MEMORY[0x1E4FB2558]];
    v45 = ASCAXIdentifierWithSuffix(@"Lockup.icon");
    [(ASCArtworkView *)v9->_iconArtworkView setAccessibilityIdentifier:v45];

    v46 = ASCAXIdentifierWithSuffix(@"Lockup.title");
    [(ASCMiniProductPageTitleView *)v9->_titleView setAccessibilityIdentifier:v46];

    v47 = ASCAXIdentifierWithSuffix(@"Lockup.subtitle");
    [(ASCSkeletonLabel *)v9->_subtitleLabel setAccessibilityIdentifier:v47];

    v48 = ASCAXIdentifierWithSuffix(@"Lockup.metadata");
    [(ASCSkeletonLabel *)v9->_metadataLabel setAccessibilityIdentifier:v48];

    v49 = ASCAXIdentifierWithSuffix(@"Lockup.description");
    [(ASCExpandableLabel *)v9->_descriptionLabel setAccessibilityIdentifier:v49];

    [(ASCMiniProductPageView *)v9 addSubview:v9->_iconArtworkView];
    [(ASCMiniProductPageView *)v9 addSubview:v9->_titleView];
    [(ASCMiniProductPageView *)v9 addSubview:v9->_subtitleLabel];
    [(ASCMiniProductPageView *)v9 addSubview:v9->_metadataLabel];
    [(ASCMiniProductPageView *)v9 addSubview:v9->_descriptionLabel];
    [(ASCMiniProductPageView *)v9 addSubview:v9->_mediaView];
    [(ASCExpandableLabel *)v9->_descriptionLabel setUserInteractionEnabled:1];
    v50 = [(ASCExpandableLabel *)v9->_descriptionLabel moreButton];
    [v50 addTarget:v9 action:sel_didSelectDescriptionLabel forControlEvents:64];

    [(ASCMiniProductPageMediaView *)v9->_mediaView setUserInteractionEnabled:1];
    [(ASCMiniProductPageMediaView *)v9->_mediaView addTarget:v9 action:sel_didSelectMediaView_forEvent_ forControlEvents:64];
    v58[0] = objc_opt_class();
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
    id v52 = (id)[(ASCMiniProductPageView *)v9 registerForTraitChanges:v51 withAction:sel_setDataChanged];

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }
  return v9;
}

id __40__ASCMiniProductPageView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained lockup];
  v3 = [v2 title];

  if (v3)
  {
    v5 = NSString;
    v6 = ASCLocalizedFormatString(@"AX_APP_ICON");
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
  }
  else
  {
    v7 = ASCLocalizedString(@"AX_APP_ICON_PLACEHOLDER", v4);
  }

  return v7;
}

- (ASCMiniProductPageView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCMiniProductPageView;
  [(ASCMiniProductPageView *)&v4 invalidateIntrinsicContentSize];
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained miniProductPageViewDidInvalidateIntrinsicContentSize:self];
  }
}

- (CGSize)intrinsicContentSize
{
  [(ASCMiniProductPageView *)self bounds];

  -[ASCMiniProductPageView sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ASCMiniProductPageView *)self layoutMargins];
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  if (width - v7 - v9 >= 0.0) {
    double v14 = width - v7 - v9;
  }
  else {
    double v14 = 0.0;
  }
  if (height - v6 - v8 >= 0.0) {
    double v15 = height - v6 - v8;
  }
  else {
    double v15 = 0.0;
  }
  v16 = [(ASCMiniProductPageView *)self makeLayout];
  v17 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v16, "measuredSizeFittingSize:inTraitEnvironment:", v17, v14, v15);
  double v19 = v18;
  double v21 = v20;

  double v22 = v11 + v13 + v19;
  double v23 = v10 + v12 + v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)layoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)ASCMiniProductPageView;
  [(ASCMiniProductPageView *)&v22 layoutSubviews];
  [(ASCMiniProductPageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(ASCMiniProductPageView *)self layoutMargins];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  double v19 = [(ASCMiniProductPageView *)self makeLayout];
  double v20 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v19, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v12, v14, v16, v18);

  double v21 = [(ASCMiniProductPageView *)self mediaPresenter];
  [v21 viewDidLayoutSubviews];
}

- (id)makeLayout
{
  double v3 = [(ASCMiniProductPageView *)self traitCollection];
  double v4 = [(ASCMiniProductPageView *)self iconArtworkView];
  double v5 = [(ASCMiniProductPageView *)self titleView];
  double v6 = [(ASCMiniProductPageView *)self subtitleLabel];
  double v7 = [(ASCMiniProductPageView *)self metadataLabel];
  double v8 = [(ASCMiniProductPageView *)self descriptionLabel];
  double v9 = [(ASCMiniProductPageView *)self mediaView];
  double v10 = +[__ASCLayoutProxy miniProductPageLayoutWithTraitCollection:v3 iconArtwork:v4 title:v5 subtitle:v6 metadata:v7 description:v8 screenshots:v9];

  return v10;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ASCMiniProductPageView;
  [(ASCMiniProductPageView *)&v3 layoutMarginsDidChange];
  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setDataChanged
{
  [(ASCMiniProductPageView *)self setNumberOfLines];
  [(ASCMiniProductPageView *)self setNeedsLayout];

  [(ASCMiniProductPageView *)self invalidateIntrinsicContentSize];
}

- (void)setBackgroundColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageView;
  id v4 = a3;
  [(ASCMiniProductPageView *)&v7 setBackgroundColor:v4];
  double v5 = [(ASCMiniProductPageView *)self titleView];
  [v5 setBackgroundColor:v4];

  double v6 = [(ASCMiniProductPageView *)self descriptionLabel];
  [v6 setBackgroundColor:v4];
}

- (void)setNumberOfLines
{
  objc_super v3 = [(ASCMiniProductPageView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  double v6 = [(ASCMiniProductPageView *)self titleView];
  objc_super v7 = [v6 textContainer];
  double v8 = v7;
  if (IsAccessibilityCategory)
  {
    [v7 setMaximumNumberOfLines:0];

    double v9 = [(ASCMiniProductPageView *)self subtitleLabel];
    [v9 setNumberOfLines:0];

    double v10 = [(ASCMiniProductPageView *)self metadataLabel];
    [v10 setNumberOfLines:2];

    double v11 = [(ASCMiniProductPageView *)self descriptionLabel];
    id v15 = v11;
    uint64_t v12 = 3;
  }
  else
  {
    [v7 setMaximumNumberOfLines:2];

    double v13 = [(ASCMiniProductPageView *)self subtitleLabel];
    [v13 setNumberOfLines:1];

    double v14 = [(ASCMiniProductPageView *)self metadataLabel];
    [v14 setNumberOfLines:1];

    double v11 = [(ASCMiniProductPageView *)self descriptionLabel];
    id v15 = v11;
    uint64_t v12 = 2;
  }
  [v11 setNumberOfLines:v12];
}

- (ASCLockup)lockup
{
  v2 = [(ASCMiniProductPageView *)self lockupPresenter];
  objc_super v3 = [v2 lockup];

  return (ASCLockup *)v3;
}

- (void)setLockup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self lockupPresenter];
  [v5 setLockup:v4];
}

- (ASCLockupViewGroup)group
{
  v2 = [(ASCMiniProductPageView *)self lockupPresenter];
  objc_super v3 = [v2 group];

  return (ASCLockupViewGroup *)v3;
}

- (void)setGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self lockupPresenter];
  [v5 setGroup:v4];
}

- (ASCLockupRequest)request
{
  v2 = [(ASCMiniProductPageView *)self lockupPresenter];
  objc_super v3 = [v2 request];

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self lockupPresenter];
  [v5 setRequest:v4];
}

- (void)lockupPresenterDidBeginRequest
{
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id v3 = [(ASCMiniProductPageView *)self delegate];
    [v3 miniProductPageViewDidBeginRequest:self];
  }
}

- (void)lockupPresenterDidFinishRequest
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    id v3 = [(ASCMiniProductPageView *)self delegate];
    [v3 miniProductPageViewDidFinishRequest:self];
  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) != 0)
  {
    id v4 = a3;
    id v5 = [(ASCMiniProductPageView *)self delegate];
    [v5 miniProductPageView:self didFailRequestWithError:v4];
  }
}

- (void)setDelegate:(id)a3
{
  id v12 = a3;
  objc_storeWeak((id *)&self->_delegate, v12);
  id v4 = v12;
  if (v12)
  {
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xEF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 32;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xDF | v9;
    BOOL v10 = (objc_opt_respondsToSelector() & 1) == 0;
    id v4 = v12;
    if (v10) {
      char v11 = 0;
    }
    else {
      char v11 = 64;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xBF | v11;
  }
  else
  {
    *(unsigned char *)&self->_delegateRespondsTo &= 0x80u;
  }
}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCMiniProductPageView *)self lockupPresenter];
  [v4 setShowsPlaceholderContent:v3];
}

- (BOOL)showsPlaceholderContent
{
  v2 = [(ASCMiniProductPageView *)self lockupPresenter];
  char v3 = [v2 showsPlaceholderContent];

  return v3;
}

- (UIColor)loadingColor
{
  v2 = [(ASCMiniProductPageView *)self titleView];
  char v3 = [v2 skeletonColor];

  return (UIColor *)v3;
}

- (void)setLoadingColor:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    +[ASCSemanticColor loading]();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v6 = v5;
  char v7 = [(ASCMiniProductPageView *)self titleView];
  [v7 setSkeletonColor:v6];

  char v8 = [(ASCMiniProductPageView *)self subtitleLabel];
  [v8 setSkeletonColor:v6];

  char v9 = [(ASCMiniProductPageView *)self metadataLabel];
  [v9 setSkeletonColor:v6];

  BOOL v10 = [(ASCMiniProductPageView *)self descriptionLabel];
  [v10 setSkeletonColor:v6];

  char v11 = [(ASCMiniProductPageView *)self iconArtworkView];
  [v11 setPlaceholderColor:v6];

  id v12 = [(ASCMiniProductPageView *)self mediaView];
  [v12 setPlaceholderColor:v6];
}

- (void)setIconImage:(id)a3 withDecoration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(ASCMiniProductPageView *)self iconArtworkView];
  [v8 setImage:v7];

  char v9 = [(ASCMiniProductPageView *)self iconArtworkView];
  [v9 setDecoration:v6];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self titleView];
  [v5 setText:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self subtitleLabel];
  [v5 setText:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self metadataLabel];
  [v5 setText:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self descriptionLabel];
  [v5 setText:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setAgeRating:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMiniProductPageView *)self titleView];
  id v6 = [v5 ageRatingView];
  [v6 setText:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setPrefersRightToLeftLayout:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [(ASCMiniProductPageView *)self setSemanticContentAttribute:v4];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = +[ASCContentSkeleton fractionalSkeleton:0.76];
    id v5 = [(ASCMiniProductPageView *)self titleView];
    [v5 setSkeleton:v4];

    id v6 = +[ASCContentSkeleton fractionalSkeleton:0.24];
    id v7 = [(ASCMiniProductPageView *)self subtitleLabel];
    [v7 setSkeleton:v6];

    char v8 = +[ASCContentSkeleton fractionalSkeleton:0.24];
    char v9 = [(ASCMiniProductPageView *)self metadataLabel];
    [v9 setSkeleton:v8];

    BOOL v10 = +[ASCContentSkeleton fractionalSkeleton:1.0];
    char v11 = [(ASCMiniProductPageView *)self descriptionLabel];
    [v11 setSkeleton:v10];

    id v12 = [(ASCMiniProductPageView *)self mediaView];
    id v13 = v12;
    uint64_t v14 = 1;
  }
  else
  {
    id v15 = [(ASCMiniProductPageView *)self titleView];
    [v15 setSkeleton:0];

    double v16 = [(ASCMiniProductPageView *)self subtitleLabel];
    [v16 setSkeleton:0];

    double v17 = [(ASCMiniProductPageView *)self metadataLabel];
    [v17 setSkeleton:0];

    double v18 = [(ASCMiniProductPageView *)self descriptionLabel];
    [v18 setSkeleton:0];

    id v12 = [(ASCMiniProductPageView *)self mediaView];
    id v13 = v12;
    uint64_t v14 = 0;
  }
  [v12 setShowsPlaceholderContent:v14];

  [(ASCMiniProductPageView *)self setDataChanged];
}

- (CGSize)preferredIconSize
{
  +[__ASCLayoutProxy miniProductPagePreferredArtworkSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (UIViewController)presentingViewController
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = [(ASCMiniProductPageView *)self delegate];
  uint64_t v4 = [v3 presentingViewControllerForMiniProductPageView:self];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(ASCMiniProductPageView *)self window];
    id v5 = [v6 rootViewController];

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        BOOL v10 = self;
        _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Mini Product Page view %@ is presenting from root view controller", (uint8_t *)&v9, 0xCu);
      }
      id v7 = v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[ASCMiniProductPageView presentingViewController]((uint64_t)self);
    }
  }

  return (UIViewController *)v5;
}

- (void)presentScreenshotsViewControllerWithSelectedIndex:(unint64_t)a3
{
  id v5 = [ASCMiniProductPageMediaViewController alloc];
  id v6 = [(ASCMiniProductPageView *)self mediaView];
  id v7 = [v6 screenshots];
  char v8 = [(ASCMiniProductPageMediaViewController *)v5 initWithScreenshots:v7 selectedIndex:a3];

  int v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  BOOL v10 = [(ASCMiniProductPageView *)self presentingViewController];
  if (v10)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__ASCMiniProductPageView_presentScreenshotsViewControllerWithSelectedIndex___block_invoke;
    v11[3] = &unk_1E645E718;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    [v10 presentViewController:v9 animated:1 completion:v11];
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __76__ASCMiniProductPageView_presentScreenshotsViewControllerWithSelectedIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[408] & 0x20) != 0)
  {
    uint64_t v4 = WeakRetained;
    double v3 = [WeakRetained delegate];
    [v3 miniProductPageViewDidPresentScreenshots:v4 atIndex:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)presentDescriptionViewController
{
  double v3 = [ASCMiniProductPageDescriptionViewController alloc];
  uint64_t v4 = [(ASCMiniProductPageView *)self miniProductPagePresenter];
  id v5 = [v4 description];
  id v6 = [(ASCMiniProductPageDescriptionViewController *)v3 initWithText:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  char v8 = [(ASCMiniProductPageView *)self presentingViewController];
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__ASCMiniProductPageView_presentDescriptionViewController__block_invoke;
    v9[3] = &unk_1E645D7E8;
    objc_copyWeak(&v10, &location);
    [v8 presentViewController:v7 animated:1 completion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __58__ASCMiniProductPageView_presentDescriptionViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[408] & 0x10) != 0)
  {
    double v3 = WeakRetained;
    double v2 = [WeakRetained delegate];
    [v2 miniProductPageViewDidPresentDescription:v3];

    id WeakRetained = v3;
  }
}

- (void)didSelectMediaView:(id)a3 forEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 allTouches];
  char v8 = [v7 anyObject];

  [v8 locationInView:v6];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = objc_msgSend(v6, "imageViews", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v21;
    while (2)
    {
      uint64_t v18 = 0;
      uint64_t v19 = v16 + v15;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v18) frame];
        v26.double x = v10;
        v26.double y = v12;
        if (CGRectContainsPoint(v27, v26))
        {
          uint64_t v19 = v16 + v18;
          goto LABEL_12;
        }
        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v16 = v19;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_12:

  [(ASCMiniProductPageView *)self presentScreenshotsViewControllerWithSelectedIndex:v19];
}

- (ASCMiniProductPageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASCMiniProductPageViewDelegate *)WeakRetained;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCLockupPresenter)lockupPresenter
{
  return self->_lockupPresenter;
}

- (ASCMiniProductPagePresenter)miniProductPagePresenter
{
  return self->_miniProductPagePresenter;
}

- (ASCLockupMediaPresenter)mediaPresenter
{
  return self->_mediaPresenter;
}

- (ASCArtworkView)iconArtworkView
{
  return self->_iconArtworkView;
}

- (ASCMiniProductPageTitleView)titleView
{
  return self->_titleView;
}

- (ASCAgeRatingView)ageRatingView
{
  return self->_ageRatingView;
}

- (ASCSkeletonLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (ASCSkeletonLabel)metadataLabel
{
  return self->_metadataLabel;
}

- (ASCExpandableLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (ASCMiniProductPageMediaView)mediaView
{
  return self->_mediaView;
}

- (UIGestureRecognizer)mediaViewTapGestureRecognizer
{
  return self->_mediaViewTapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_ageRatingView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_iconArtworkView, 0);
  objc_storeStrong((id *)&self->_mediaPresenter, 0);
  objc_storeStrong((id *)&self->_miniProductPagePresenter, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentingViewController
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Mini Product Page view %@ could not find view controller to present from.", (uint8_t *)&v1, 0xCu);
}

@end