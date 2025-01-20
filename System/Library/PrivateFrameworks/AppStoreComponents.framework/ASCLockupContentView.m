@interface ASCLockupContentView
+ (BOOL)isOfferButtonFixedHeightForSize:(id)a3;
+ (BOOL)isSmallOfferButtonLockupForSize:(id)a3;
+ (BOOL)offerButtonShouldExpandBackgroundForSize:(id)a3;
+ (BOOL)offerButtonShouldTopAlignForSize:(id)a3;
+ (double)offerButtonTopPaddingForSize:(id)a3;
- (ASCArtworkView)iconArtworkView;
- (ASCLockupContentView)initWithCoder:(id)a3;
- (ASCLockupContentView)initWithFrame:(CGRect)a3;
- (ASCLockupDisplayContext)displayContext;
- (ASCLockupTheme)lockupTheme;
- (ASCOfferButton)offerButton;
- (ASCOfferTheme)offerTheme;
- (ASCSkeletonLabel)subtitleLabel;
- (ASCSkeletonLabel)titleLabel;
- (BOOL)isMiniLockup;
- (BOOL)isOfferButtonOnlyLockup;
- (BOOL)isSmallOfferButtonOnlyLockup;
- (BOOL)shouldHideHeading;
- (BOOL)shouldHideOfferStatus;
- (BOOL)shouldHideSubtitle;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredIconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (NSString)lockupSize;
- (UIColor)loadingColor;
- (UILabel)headingLabel;
- (UILabel)headingLabelIfLoaded;
- (UILabel)offerStatusLabel;
- (UILabel)offerStatusLabelIfLoaded;
- (UIView)badgeView;
- (double)minimumLockupHeight;
- (id)defaultOfferTheme;
- (id)makeLayout;
- (id)saveOfferState;
- (void)addOfferTarget:(id)a3 action:(SEL)a4;
- (void)beginOfferModalStateWithCancelBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endOfferModalState;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)offerButton:(id)a3 willTransitionToMetadata:(id)a4 usingAnimator:(id)a5;
- (void)removeOfferTarget:(id)a3 action:(SEL)a4;
- (void)setBadge:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setDataChanged;
- (void)setDisplayContext:(id)a3;
- (void)setHeading:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconImage:(id)a3 withDecoration:(id)a4;
- (void)setLoading:(BOOL)a3;
- (void)setLoadingColor:(id)a3;
- (void)setLockupSize:(id)a3;
- (void)setLockupTheme:(id)a3;
- (void)setOfferEnabled:(BOOL)a3;
- (void)setOfferInteractive:(BOOL)a3;
- (void)setOfferMetadata:(id)a3;
- (void)setOfferStatus:(id)a3;
- (void)setOfferTheme:(id)a3;
- (void)setPrefersRightToLeftLayout:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateLockupTheme;
- (void)updateOfferLayoutPropertiesForSize:(void *)a1;
- (void)updateOfferTheme;
- (void)updateViewsVisibility;
@end

@implementation ASCLockupContentView

- (BOOL)isOfferButtonOnlyLockup
{
  v3 = [(ASCLockupContentView *)self lockupSize];
  if (ASCLockupViewSizeIsSmallOfferButton(v3, v4))
  {
    char IsMediumOfferButton = 1;
  }
  else
  {
    v6 = [(ASCLockupContentView *)self lockupSize];
    char IsMediumOfferButton = ASCLockupViewSizeIsMediumOfferButton(v6, v7);
  }
  return IsMediumOfferButton;
}

+ (BOOL)isSmallOfferButtonLockupForSize:(id)a3
{
  return ASCLockupViewSizeIsSmallOfferButton(a3, a2);
}

- (BOOL)isSmallOfferButtonOnlyLockup
{
  v2 = [(ASCLockupContentView *)self lockupSize];
  BOOL v3 = +[ASCLockupContentView isSmallOfferButtonLockupForSize:v2];

  return v3;
}

- (BOOL)isMiniLockup
{
  v2 = [(ASCLockupContentView *)self lockupSize];
  char IsMini = ASCLockupViewSizeIsMini(v2, v3);

  return IsMini;
}

+ (BOOL)isOfferButtonFixedHeightForSize:(id)a3
{
  id v3 = a3;
  if (ASCLockupViewSizeIsLargeAppShowcase(v3, v4)) {
    char IsLargeAppAd = 1;
  }
  else {
    char IsLargeAppAd = ASCLockupViewSizeIsLargeAppAd(v3, v5);
  }

  return IsLargeAppAd;
}

+ (BOOL)offerButtonShouldTopAlignForSize:(id)a3
{
  id v4 = a3;
  if (([a1 isOfferButtonFixedHeightForSize:v4] & 1) != 0
    || ([a1 offerButtonTopPaddingForSize:v4], v6 > 0.0))
  {
    char IsMediumOfferButton = 1;
  }
  else
  {
    char IsMediumOfferButton = ASCLockupViewSizeIsMediumOfferButton(v4, v5);
  }

  return IsMediumOfferButton;
}

+ (double)offerButtonTopPaddingForSize:(id)a3
{
  return 0.0;
}

+ (BOOL)offerButtonShouldExpandBackgroundForSize:(id)a3
{
  return ASCLockupViewSizeIsMediumOfferButton(a3, a2);
}

- (BOOL)shouldHideHeading
{
  BOOL v3 = [(ASCLockupContentView *)self isOfferButtonOnlyLockup];
  if (!v3) {
    [(ASCLockupContentView *)self isMiniLockup];
  }
  return v3;
}

- (BOOL)shouldHideSubtitle
{
  if ([(ASCLockupContentView *)self isOfferButtonOnlyLockup]) {
    return 1;
  }
  if ([(ASCLockupContentView *)self isMiniLockup])
  {
    id v4 = [(ASCLockupContentView *)self headingLabelIfLoaded];
    v5 = [v4 text];
    uint64_t v6 = [v5 length];
    BOOL v3 = v6 != 0;
    if (!v6) {
      [(ASCLockupContentView *)self isMiniLockup];
    }
  }
  else
  {
    [(ASCLockupContentView *)self isMiniLockup];
    return 0;
  }
  return v3;
}

- (BOOL)shouldHideOfferStatus
{
  if ([(ASCLockupContentView *)self isOfferButtonOnlyLockup]) {
    return 1;
  }

  return [(ASCLockupContentView *)self isMiniLockup];
}

- (ASCLockupContentView)initWithFrame:(CGRect)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)ASCLockupContentView;
  BOOL v3 = -[ASCLockupContentView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_lockupSize, @"small");
    v5 = [ASCArtworkView alloc];
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = -[ASCArtworkView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    iconArtworkView = v4->_iconArtworkView;
    v4->_iconArtworkView = (ASCArtworkView *)v10;

    v12 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    v14 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    v16 = -[ASCOfferButton initWithFrame:]([ASCOfferButton alloc], "initWithFrame:", v6, v7, v8, v9);
    offerButton = v4->_offerButton;
    v4->_offerButton = v16;

    -[ASCLockupContentView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(ASCLockupContentView *)v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(ASCLockupContentView *)v4 addSubview:v4->_iconArtworkView];
    [(ASCLockupContentView *)v4 addSubview:v4->_titleLabel];
    [(ASCLockupContentView *)v4 addSubview:v4->_subtitleLabel];
    -[ASCLockupContentView updateLockupTheme](v4);
    [(ASCOfferButton *)v4->_offerButton setDelegate:v4];
    [(ASCLockupContentView *)v4 addSubview:v4->_offerButton];
    -[ASCLockupContentView updateOfferLayoutPropertiesForSize:](v4, v4->_lockupSize);
    -[ASCLockupContentView updateOfferTheme](v4);
    v18 = ASCAXIdentifierWithSuffix(@"Lockup.icon");
    [(ASCArtworkView *)v4->_iconArtworkView setAccessibilityIdentifier:v18];

    v19 = ASCAXIdentifierWithSuffix(@"Lockup.title");
    [(ASCSkeletonLabel *)v4->_titleLabel setAccessibilityIdentifier:v19];

    v20 = ASCAXIdentifierWithSuffix(@"Lockup.subtitle");
    [(ASCSkeletonLabel *)v4->_subtitleLabel setAccessibilityIdentifier:v20];

    v21 = self;
    v26[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v23 = (id)[(ASCLockupContentView *)v4 registerForTraitChanges:v22 withAction:sel_onPreferredContentSizeCategoryChange];
  }
  return v4;
}

- (void)updateLockupTheme
{
  if (a1)
  {
    v2 = +[ASCDefaultLockupTheme sharedTheme];
    BOOL v3 = [a1 traitCollection];
    [v2 applyToLockupContentView:a1 compatibleWithTraitCollection:v3];

    id v5 = [a1 lockupTheme];
    id v4 = [a1 traitCollection];
    [v5 applyToLockupContentView:a1 compatibleWithTraitCollection:v4];
  }
}

- (void)updateOfferLayoutPropertiesForSize:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = ASCLockupViewSizeGetOfferButtonSize(v3);
    id v5 = [a1 offerButton];
    [v5 setSize:v4];

    uint64_t v6 = ASCLockupViewSizeOfferButtonSubtitlePosition(v3);
    double v7 = [a1 offerButton];
    [v7 setSubtitlePosition:v6];

    BOOL v8 = +[ASCLockupContentView isOfferButtonFixedHeightForSize:v3];
    double v9 = [a1 offerButton];
    [v9 setFixedHeight:v8];

    BOOL v10 = +[ASCLockupContentView offerButtonShouldTopAlignForSize:v3];
    v11 = [a1 offerButton];
    [v11 setShouldTopAlign:v10];

    +[ASCLockupContentView offerButtonTopPaddingForSize:v3];
    double v13 = v12;
    v14 = [a1 offerButton];
    [v14 setTopPadding:v13];

    BOOL v15 = +[ASCLockupContentView offerButtonShouldExpandBackgroundForSize:v3];
    id v16 = [a1 offerButton];
    [v16 setShouldExpandBackground:v15];
  }
}

- (void)updateOfferTheme
{
  if (!a1) {
    return;
  }
  v2 = [a1 offerTheme];

  if (!v2)
  {
    id v4 = [a1 titleLabel];
    uint64_t v5 = [v4 skeleton];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      double v7 = [a1 subtitleLabel];
      BOOL v8 = [v7 skeleton];

      if (v8)
      {
        uint64_t v3 = +[ASCOfferTheme loadingTheme];
        goto LABEL_9;
      }
    }
    else
    {
    }
    uint64_t v3 = -[ASCLockupContentView defaultOfferTheme](a1);
    goto LABEL_9;
  }
  uint64_t v3 = [a1 offerTheme];
LABEL_9:
  id v10 = (id)v3;
  double v9 = [a1 offerButton];
  [v9 setTheme:v10];
}

- (ASCLockupContentView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UILabel)offerStatusLabel
{
  p_offerStatusLabelIfLoaded = &self->_offerStatusLabelIfLoaded;
  offerStatusLabelIfLoaded = self->_offerStatusLabelIfLoaded;
  if (offerStatusLabelIfLoaded)
  {
    id v4 = offerStatusLabelIfLoaded;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v4 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UILabel *)v4 setSemanticContentAttribute:[(ASCLockupContentView *)self semanticContentAttribute]];
    [(ASCLockupContentView *)self addSubview:v4];
    objc_storeStrong((id *)p_offerStatusLabelIfLoaded, v4);
    double v7 = ASCAXIdentifierWithSuffix(@"Lockup.offerStatus");
    [(UILabel *)*p_offerStatusLabelIfLoaded setAccessibilityIdentifier:v7];

    -[ASCLockupContentView updateLockupTheme](self);
  }

  return v4;
}

- (UILabel)headingLabel
{
  p_headingLabelIfLoaded = &self->_headingLabelIfLoaded;
  headingLabelIfLoaded = self->_headingLabelIfLoaded;
  if (headingLabelIfLoaded)
  {
    id v4 = headingLabelIfLoaded;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v4 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UILabel *)v4 setSemanticContentAttribute:[(ASCLockupContentView *)self semanticContentAttribute]];
    [(ASCLockupContentView *)self addSubview:v4];
    objc_storeStrong((id *)p_headingLabelIfLoaded, v4);
    double v7 = ASCAXIdentifierWithSuffix(@"Lockup.heading");
    [(UILabel *)*p_headingLabelIfLoaded setAccessibilityIdentifier:v7];

    -[ASCLockupContentView updateLockupTheme](self);
  }

  return v4;
}

- (CGSize)preferredIconSize
{
  v2 = [(ASCLockupContentView *)self iconArtworkView];
  [v2 preferredSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setLockupSize:(id)a3
{
  v18 = (NSString *)a3;
  double v5 = self->_lockupSize;
  double v6 = v5;
  if (!v18 || !v5)
  {

    if (v6 == v18) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v7 = -[NSString isEqual:](v5, "isEqual:");

  if ((v7 & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_lockupSize, a3);
    -[ASCLockupContentView updateLockupTheme](self);
    -[ASCLockupContentView updateOfferLayoutPropertiesForSize:](self, v18);
    -[ASCLockupContentView updateOfferTheme](self);
    BOOL v8 = [(ASCLockupContentView *)self shouldHideIconArtwork];
    double v9 = [(ASCLockupContentView *)self iconArtworkView];
    [v9 setHidden:v8];

    BOOL v10 = [(ASCLockupContentView *)self shouldHideTitle];
    v11 = [(ASCLockupContentView *)self titleLabel];
    [v11 setHidden:v10];

    BOOL v12 = [(ASCLockupContentView *)self shouldHideSubtitle];
    double v13 = [(ASCLockupContentView *)self subtitleLabel];
    [v13 setHidden:v12];

    BOOL v14 = [(ASCLockupContentView *)self shouldHideHeading];
    BOOL v15 = [(ASCLockupContentView *)self headingLabelIfLoaded];
    [v15 setHidden:v14];

    BOOL v16 = [(ASCLockupContentView *)self shouldHideOfferStatus];
    v17 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
    [v17 setHidden:v16];

    [(ASCLockupContentView *)self invalidateIntrinsicContentSize];
    [(ASCLockupContentView *)self setNeedsLayout];
  }
LABEL_7:
}

- (UIColor)loadingColor
{
  v2 = [(ASCLockupContentView *)self titleLabel];
  double v3 = [v2 skeletonColor];

  return (UIColor *)v3;
}

- (void)setLoadingColor:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    id v5 = v4;
    double v6 = [(ASCLockupContentView *)self iconArtworkView];
    [v6 setPlaceholderColor:v5];

    id v7 = v5;
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = +[ASCSemanticColor artworkPlaceholder]();
    double v9 = [(ASCLockupContentView *)self iconArtworkView];
    [v9 setPlaceholderColor:v8];

    +[ASCSemanticColor loading]();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v10 = [(ASCLockupContentView *)self titleLabel];
  [v10 setSkeletonColor:v7];

  v11 = [(ASCLockupContentView *)self subtitleLabel];
  [v11 setSkeletonColor:v7];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView setHighlighted:](&v6, sel_setHighlighted_);
  id v5 = [(ASCLockupContentView *)self iconArtworkView];
  [v5 setHighlighted:v3];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView setSemanticContentAttribute:](&v11, sel_setSemanticContentAttribute_);
  id v5 = [(ASCLockupContentView *)self headingLabelIfLoaded];
  [v5 setSemanticContentAttribute:a3];

  objc_super v6 = [(ASCLockupContentView *)self iconArtworkView];
  [v6 setSemanticContentAttribute:a3];

  id v7 = [(ASCLockupContentView *)self titleLabel];
  [v7 setSemanticContentAttribute:a3];

  BOOL v8 = [(ASCLockupContentView *)self subtitleLabel];
  [v8 setSemanticContentAttribute:a3];

  double v9 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
  [v9 setSemanticContentAttribute:a3];

  BOOL v10 = [(ASCLockupContentView *)self offerButton];
  [v10 setSemanticContentAttribute:a3];
}

- (id)makeLayout
{
  BOOL v3 = [(ASCLockupContentView *)self lockupSize];
  id v4 = [(ASCLockupContentView *)self traitCollection];
  id v5 = [(ASCLockupContentView *)self iconArtworkView];
  objc_super v6 = [(ASCLockupContentView *)self headingLabelIfLoaded];
  id v7 = [(ASCLockupContentView *)self titleLabel];
  BOOL v8 = [(ASCLockupContentView *)self subtitleLabel];
  double v9 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
  BOOL v10 = [(ASCLockupContentView *)self offerButton];
  objc_super v11 = [(ASCLockupContentView *)self badgeView];
  id v12 = +[__ASCLayoutProxy lockupLayoutOfSize:v3 traitCollection:v4 artworkView:v5 headingText:v6 titleText:v7 subtitleText:v8 offerText:v9 offerButton:v10 badge:v11];

  return v12;
}

- (double)minimumLockupHeight
{
  v2 = [(ASCLockupContentView *)self iconArtworkView];
  [v2 preferredSize];
  double v4 = v3;

  return v4;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCLockupContentView;
  [(ASCLockupContentView *)&v4 invalidateIntrinsicContentSize];
  if ([(ASCLockupContentView *)self translatesAutoresizingMaskIntoConstraints])
  {
    double v3 = [(ASCLockupContentView *)self superview];
    [v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  -[ASCLockupContentView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ASCLockupContentView *)self layoutMargins];
  double v10 = v6;
  double v11 = v8;
  if (width - v7 - v9 >= 0.0) {
    double v12 = width - v7 - v9;
  }
  else {
    double v12 = 0.0;
  }
  if (height - v6 - v8 >= 0.0) {
    double v13 = height - v6 - v8;
  }
  else {
    double v13 = 0.0;
  }
  BOOL v14 = [(ASCLockupContentView *)self makeLayout];
  BOOL v15 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v14, "measuredSizeFittingSize:inTraitEnvironment:", v15, v12, v13);
  double v17 = v16;
  double v19 = v18;

  if ([(ASCLockupContentView *)self isSmallOfferButtonOnlyLockup])
  {
    v20 = [(ASCLockupContentView *)self offerButton];
    v21 = [v20 size];
    +[__ASCLayoutProxy offerButtonRegularWidthForSize:v21];
    double width = v22;

    if (width < v17) {
      double width = v17;
    }
  }
  double v23 = v10 + v11 + v19;
  [(ASCLockupContentView *)self minimumLockupHeight];
  if (v23 < v24)
  {
    [(ASCLockupContentView *)self minimumLockupHeight];
    double v23 = v25;
  }

  double v26 = width;
  double v27 = v23;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)ASCLockupContentView;
  [(ASCLockupContentView *)&v21 layoutSubviews];
  [(ASCLockupContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(ASCLockupContentView *)self layoutMargins];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  double v19 = [(ASCLockupContentView *)self makeLayout];
  v20 = [(UIView *)self asc_layoutTraitEnvironment];
  objc_msgSend(v19, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v12, v14, v16, v18);
}

- (void)setDataChanged
{
  if (result)
  {
    v1 = result;
    -[ASCLockupContentView updateViewsVisibility](result);
    -[ASCLockupContentView updateLockupTheme](v1);
    [v1 setNeedsLayout];
    return (void *)[v1 invalidateIntrinsicContentSize];
  }
  return result;
}

- (void)addOfferTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(ASCLockupContentView *)self offerButton];
  [v7 addTarget:v6 action:a4 forControlEvents:64];
}

- (void)removeOfferTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = [(ASCLockupContentView *)self offerButton];
  [v7 removeTarget:v6 action:a4 forControlEvents:64];
}

- (void)updateViewsVisibility
{
  if (a1)
  {
    uint64_t v2 = [a1 shouldHideIconArtwork];
    double v3 = [a1 iconArtworkView];
    [v3 setHidden:v2];

    uint64_t v4 = [a1 shouldHideTitle];
    double v5 = [a1 titleLabel];
    [v5 setHidden:v4];

    uint64_t v6 = [a1 shouldHideSubtitle];
    id v7 = [a1 subtitleLabel];
    [v7 setHidden:v6];

    uint64_t v8 = [a1 shouldHideHeading];
    double v9 = [a1 headingLabelIfLoaded];
    [v9 setHidden:v8];

    uint64_t v10 = [a1 shouldHideOfferStatus];
    id v11 = [a1 offerStatusLabelIfLoaded];
    [v11 setHidden:v10];
  }
}

- (id)defaultOfferTheme
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 offerButton];
    double v3 = [v2 metadata];
    uint64_t v4 = ASCOfferMetadataGetOfferTheme(v3);
    double v5 = v4;
    if (v4)
    {
      id v1 = v4;
    }
    else
    {
      uint64_t v6 = [v1 lockupSize];
      ASCLockupViewSizeGetOfferTheme(v6);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v1;
}

- (void)setLockupTheme:(id)a3
{
  id v7 = (ASCLockupTheme *)a3;
  double v5 = self->_lockupTheme;
  if (!v7 || !v5)
  {

    if (v5 == v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = [(ASCLockupTheme *)v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_lockupTheme, a3);
    -[ASCLockupContentView updateLockupTheme](self);
  }
LABEL_7:
}

- (void)setIconImage:(id)a3 withDecoration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ASCLockupContentView *)self iconArtworkView];
  [v8 setImage:v7];

  double v9 = [(ASCLockupContentView *)self iconArtworkView];
  [v9 setDecoration:v6];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setHeading:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = [(ASCLockupContentView *)self traitCollection];
  objc_msgSend(v4, "asc_attributedStringWithLockupHeading:compatibleWithTraitCollection:", v5, v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 && [v13 length])
  {
    id v7 = [(ASCLockupContentView *)self headingLabel];
    [v7 setAttributedText:v13];

    BOOL v8 = [(ASCLockupContentView *)self shouldHideHeading];
    double v9 = [(ASCLockupContentView *)self headingLabel];
    uint64_t v10 = v9;
    uint64_t v11 = v8;
  }
  else
  {
    double v12 = [(ASCLockupContentView *)self headingLabelIfLoaded];
    [v12 setAttributedText:0];

    double v9 = [(ASCLockupContentView *)self headingLabelIfLoaded];
    uint64_t v10 = v9;
    uint64_t v11 = 1;
  }
  [v9 setHidden:v11];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupContentView *)self titleLabel];
  [v5 setText:v4];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupContentView *)self subtitleLabel];
  [v5 setText:v4];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setBadge:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupContentView *)self badgeView];
  [v5 removeFromSuperview];

  [(ASCLockupContentView *)self setBadgeView:v4];
  id v6 = [(ASCLockupContentView *)self badgeView];

  if (v6)
  {
    id v7 = [(ASCLockupContentView *)self badgeView];
    [(ASCLockupContentView *)self addSubview:v7];
  }
  BOOL v8 = [(ASCLockupContentView *)self shouldHideBadge];
  double v9 = [(ASCLockupContentView *)self badgeView];
  [v9 setHidden:v8];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setPrefersRightToLeftLayout:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [(ASCLockupContentView *)self setSemanticContentAttribute:v4];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setLoading:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = +[ASCContentSkeleton fractionalSkeleton:0.76];
    id v5 = [(ASCLockupContentView *)self titleLabel];
    [v5 setSkeleton:v4];

    id v6 = +[ASCContentSkeleton fractionalSkeleton:0.47];
    id v7 = [(ASCLockupContentView *)self subtitleLabel];
    [v7 setSkeleton:v6];
  }
  else
  {
    BOOL v8 = [(ASCLockupContentView *)self titleLabel];
    [v8 setSkeleton:0];

    id v6 = [(ASCLockupContentView *)self subtitleLabel];
    [v6 setSkeleton:0];
  }

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setDisplayContext:(id)a3
{
  uint64_t v4 = (ASCLockupDisplayContext *)a3;
  displayContext = self->_displayContext;
  double v9 = v4;
  if (!v4 || !displayContext)
  {
    if (displayContext == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v6 = [(ASCLockupDisplayContext *)displayContext isEqual:v4];
  uint64_t v4 = v9;
  if (!v6)
  {
LABEL_6:
    id v7 = (ASCLockupDisplayContext *)[(ASCLockupDisplayContext *)v4 copy];
    BOOL v8 = self->_displayContext;
    self->_displayContext = v7;

    -[ASCLockupContentView setDataChanged](self);
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (id)saveOfferState
{
  double v3 = [ASCOfferPresenterViewState alloc];
  uint64_t v4 = [(ASCLockupContentView *)self offerButton];
  id v5 = [v4 metadata];
  BOOL v6 = [(ASCLockupContentView *)self offerTheme];
  id v7 = [(ASCOfferPresenterViewState *)v3 initWithMetadata:v5 theme:v6];

  return v7;
}

- (void)setOfferMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupContentView *)self offerButton];
  [v5 transitionToMetadata:v4 withCompletion:0];

  -[ASCLockupContentView updateOfferTheme](self);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setOfferTheme:(id)a3
{
  id v4 = (ASCOfferTheme *)a3;
  offerTheme = self->_offerTheme;
  double v9 = v4;
  if (!v4 || !offerTheme)
  {
    if (offerTheme == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v6 = [(ASCOfferTheme *)offerTheme isEqual:v4];
  id v4 = v9;
  if (!v6)
  {
LABEL_6:
    id v7 = (ASCOfferTheme *)[(ASCOfferTheme *)v4 copy];
    BOOL v8 = self->_offerTheme;
    self->_offerTheme = v7;

    -[ASCLockupContentView updateOfferTheme](self);
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (void)setOfferEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCLockupContentView *)self offerButton];
  [v4 setEnabled:v3];
}

- (void)setOfferInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCLockupContentView *)self offerButton];
  [v4 setUserInteractionEnabled:v3];
}

- (void)setOfferStatus:(id)a3
{
  id v10 = a3;
  if (v10 && [v10 length])
  {
    id v4 = [(ASCLockupContentView *)self offerStatusLabel];
    [v4 setText:v10];

    BOOL v5 = [(ASCLockupContentView *)self shouldHideOfferStatus];
    BOOL v6 = [(ASCLockupContentView *)self offerStatusLabel];
    id v7 = v6;
    uint64_t v8 = v5;
  }
  else
  {
    double v9 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
    [v9 setText:0];

    BOOL v6 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
    id v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setHidden:v8];

  -[ASCLockupContentView setDataChanged](self);
}

- (void)beginOfferModalStateWithCancelBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCLockupContentView *)self offerButton];
  [v5 beginModalStateWithCancelBlock:v4];
}

- (void)endOfferModalState
{
  id v2 = [(ASCLockupContentView *)self offerButton];
  [v2 endModalState];
}

- (void)offerButton:(id)a3 willTransitionToMetadata:(id)a4 usingAnimator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__ASCLockupContentView_offerButton_willTransitionToMetadata_usingAnimator___block_invoke;
  v11[3] = &unk_1E645D7E8;
  objc_copyWeak(&v12, &location);
  [v10 addAnimations:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __75__ASCLockupContentView_offerButton_willTransitionToMetadata_usingAnimator___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];

  id v3 = objc_loadWeakRetained(v1);
  [v3 layoutIfNeeded];
}

- (NSString)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCLockupContentView *)self headingLabelIfLoaded];
  id v5 = [v4 text];
  [(ASCDescriber *)v3 addObject:v5 withName:@"heading"];

  BOOL v6 = [(ASCLockupContentView *)self titleLabel];
  id v7 = [v6 text];
  [(ASCDescriber *)v3 addObject:v7 withName:@"title"];

  id v8 = [(ASCLockupContentView *)self subtitleLabel];
  id v9 = [v8 text];
  [(ASCDescriber *)v3 addObject:v9 withName:@"subtitle"];

  id v10 = [(ASCLockupContentView *)self lockupTheme];
  [(ASCDescriber *)v3 addObject:v10 withName:@"lockupTheme"];

  uint64_t v11 = [(ASCLockupContentView *)self displayContext];
  [(ASCDescriber *)v3 addObject:v11 withName:@"displayContext"];

  id v12 = [(ASCLockupContentView *)self offerButton];
  id v13 = [v12 size];
  [(ASCDescriber *)v3 addObject:v13 withName:@"offerSize"];

  double v14 = [(ASCLockupContentView *)self offerButton];
  double v15 = [v14 theme];
  [(ASCDescriber *)v3 addObject:v15 withName:@"offerTheme"];

  double v16 = [(ASCLockupContentView *)self offerButton];
  double v17 = [v16 metadata];
  [(ASCDescriber *)v3 addObject:v17 withName:@"offerMetadata"];

  double v18 = [(ASCLockupContentView *)self offerStatusLabelIfLoaded];
  double v19 = [v18 text];
  [(ASCDescriber *)v3 addObject:v19 withName:@"offerStatus"];

  v20 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v20;
}

- (NSString)lockupSize
{
  return self->_lockupSize;
}

- (ASCOfferTheme)offerTheme
{
  return self->_offerTheme;
}

- (ASCLockupTheme)lockupTheme
{
  return self->_lockupTheme;
}

- (ASCLockupDisplayContext)displayContext
{
  return self->_displayContext;
}

- (ASCArtworkView)iconArtworkView
{
  return self->_iconArtworkView;
}

- (ASCSkeletonLabel)titleLabel
{
  return self->_titleLabel;
}

- (ASCSkeletonLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (ASCOfferButton)offerButton
{
  return self->_offerButton;
}

- (UILabel)headingLabelIfLoaded
{
  return self->_headingLabelIfLoaded;
}

- (UILabel)offerStatusLabelIfLoaded
{
  return self->_offerStatusLabelIfLoaded;
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_offerStatusLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_headingLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_offerButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconArtworkView, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_lockupTheme, 0);
  objc_storeStrong((id *)&self->_offerTheme, 0);

  objc_storeStrong((id *)&self->_lockupSize, 0);
}

@end