@interface SGBannerView
- (BOOL)orientationChanged;
- (BOOL)prominentActionButton;
- (BOOL)suggestionCategorySupportsBatchDismissal;
- (CGSize)intrinsicContentSize;
- (NSArray)iconSFSymbols;
- (NSArray)imageSGViews;
- (NSArray)images;
- (NSAttributedString)attributedSubtitle;
- (NSAttributedString)attributedTitle;
- (NSString)actionTitle;
- (NSString)subtitle;
- (NSString)title;
- (SGBannerDividerParameter)bannerDivider;
- (SGBannerView)init;
- (SGSuggestion)suggestion;
- (SGSuggestionAction)dismissAction;
- (SGSuggestionAction)primaryAction;
- (UIColor)backgroundColor;
- (UIVisualEffectView)backgroundVisualEffectView;
- (_TtC17CoreSuggestionsUI15SGBannerContent)banner;
- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)bannerHostingView;
- (double)actionButtonLeadingEdgeOffset;
- (double)closeButtonXAnchorOffset;
- (int64_t)accessoryType;
- (int64_t)actionButtonType;
- (void)forceReloadBannerView:(id)a3;
- (void)invalidateBannerView;
- (void)invalidateReloadBannerView:(id)a3;
- (void)reload;
- (void)setAccessoryType:(int64_t)a3;
- (void)setActionButtonType:(int64_t)a3;
- (void)setActionTitle:(id)a3;
- (void)setAttributedSubtitle:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundVisualEffectView:(id)a3;
- (void)setBanner:(id)a3;
- (void)setBannerDivider:(id)a3;
- (void)setCloseButtonXAnchorOffset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setIconSFSymbols:(id)a3;
- (void)setImageSGViews:(id)a3;
- (void)setImages:(id)a3;
- (void)setOrientationChanged:(BOOL)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setProminentActionButton:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3;
- (void)setSuggestionStore:(id)a3;
- (void)setTitle:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SGBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_bannerHostingView, 0);
}

- (void)setOrientationChanged:(BOOL)a3
{
  self->_orientationChanged = a3;
}

- (BOOL)orientationChanged
{
  return self->_orientationChanged;
}

- (void)setBanner:(id)a3
{
}

- (_TtC17CoreSuggestionsUI15SGBannerContent)banner
{
  return self->_banner;
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)bannerHostingView
{
  return self->_bannerHostingView;
}

- (double)actionButtonLeadingEdgeOffset
{
  [(SGBannerContentHostingView *)self->_bannerHostingView actionButtonLeadingEdgeOffset];
  return result;
}

- (void)invalidateBannerView
{
}

- (void)setBannerDivider:(id)a3
{
  [(SGBannerContent *)self->_banner setBannerDivider:a3];
  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (SGBannerDividerParameter)bannerDivider
{
  return [(SGBannerContent *)self->_banner bannerDivider];
}

- (UIColor)backgroundColor
{
  return [(SGBannerContent *)self->_banner backgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
  [(SGBannerContent *)self->_banner setBackgroundColor:a3];
  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGBannerView;
  -[SGBannerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    [(SGBannerView *)self reload];
  }
}

- (NSArray)iconSFSymbols
{
  return [(SGBannerContent *)self->_banner iconSFSymbols];
}

- (void)setIconSFSymbols:(id)a3
{
}

- (BOOL)suggestionCategorySupportsBatchDismissal
{
  return [(SGBannerContent *)self->_banner suggestionCategorySupportsBatchDismissal];
}

- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3
{
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return [(SGBannerContent *)self->_banner backgroundVisualEffectView];
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  [(SGBannerContent *)self->_banner setBackgroundVisualEffectView:a3];
  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (CGSize)intrinsicContentSize
{
  [(SGBannerContentHostingView *)self->_bannerHostingView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)reload
{
  bannerHostingView = self->_bannerHostingView;
  id v3 = [(SGBannerView *)self banner];
  [(SGBannerContentHostingView *)bannerHostingView updateWithBanner:v3];
}

- (BOOL)prominentActionButton
{
  return [(SGBannerContent *)self->_banner prominentActionButton];
}

- (void)setProminentActionButton:(BOOL)a3
{
}

- (double)closeButtonXAnchorOffset
{
  [(SGBannerContent *)self->_banner closeButtonXAnchorOffset];
  return result;
}

- (void)setCloseButtonXAnchorOffset:(double)a3
{
}

- (SGSuggestionAction)dismissAction
{
  return [(SGBannerContent *)self->_banner dismissAction];
}

- (void)setDismissAction:(id)a3
{
}

- (SGSuggestionAction)primaryAction
{
  return [(SGBannerContent *)self->_banner primaryAction];
}

- (void)setPrimaryAction:(id)a3
{
}

- (void)setSuggestionStore:(id)a3
{
}

- (void)setSuggestion:(id)a3
{
}

- (SGSuggestion)suggestion
{
  return [(SGBannerContent *)self->_banner suggestion];
}

- (NSArray)images
{
  return [(SGBannerContent *)self->_banner images];
}

- (void)setImages:(id)a3
{
  if (a3)
  {
    id v4 = (id)[a3 copy];
    [(SGBannerContent *)self->_banner setImages:v4];
  }
}

- (void)setImageSGViews:(id)a3
{
}

- (NSArray)imageSGViews
{
  return [(SGBannerContent *)self->_banner imageSGViews];
}

- (void)setActionTitle:(id)a3
{
  id v4 = (void *)[a3 copy];
  [(SGBannerContent *)self->_banner setActionTitle:v4];

  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (NSString)actionTitle
{
  return [(SGBannerContent *)self->_banner actionTitle];
}

- (int64_t)actionButtonType
{
  return [(SGBannerContent *)self->_banner actionButtonType];
}

- (void)setActionButtonType:(int64_t)a3
{
  if ([(SGBannerContent *)self->_banner actionButtonType] != a3)
  {
    banner = self->_banner;
    [(SGBannerContent *)banner setActionButtonType:a3];
  }
}

- (int64_t)accessoryType
{
  return [(SGBannerContent *)self->_banner accessoryType];
}

- (void)setAccessoryType:(int64_t)a3
{
  if ([(SGBannerContent *)self->_banner accessoryType] != a3)
  {
    banner = self->_banner;
    [(SGBannerContent *)banner setAccessoryType:a3];
  }
}

- (void)setAttributedSubtitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[v4 mutableCopy];
  [(SGBannerContent *)self->_banner setAttributedSubtitle:v5];

  id v6 = [v4 string];

  [(SGBannerContent *)self->_banner setSubtitle:v6];
}

- (NSAttributedString)attributedSubtitle
{
  return [(SGBannerContent *)self->_banner attributedSubtitle];
}

- (void)setSubtitle:(id)a3
{
  [(SGBannerContent *)self->_banner setSubtitle:a3];
  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (NSString)subtitle
{
  return [(SGBannerContent *)self->_banner subtitle];
}

- (void)setAttributedTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[v4 mutableCopy];
  [(SGBannerContent *)self->_banner setAttributedTitle:v5];

  id v6 = [v4 string];

  [(SGBannerContent *)self->_banner setTitle:v6];
}

- (NSAttributedString)attributedTitle
{
  return [(SGBannerContent *)self->_banner attributedTitle];
}

- (NSString)title
{
  return [(SGBannerContent *)self->_banner title];
}

- (void)setTitle:(id)a3
{
  [(SGBannerContent *)self->_banner setTitle:a3];
  bannerHostingView = self->_bannerHostingView;
  [(SGBannerContentHostingView *)bannerHostingView updateBannerViews];
}

- (void)setDelegate:(id)a3
{
}

- (void)forceReloadBannerView:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_banner)
  {
    objc_super v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 orientation];

    if (v6 == 1 && self->_orientationChanged)
    {
      v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v9 = @"SGListNotificationKeyChangedReorientation";
      v10[0] = &unk_1F0ED74F0;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      [v7 postNotificationName:@"com.apple.coresuggestionsui.SGListDidChangeNotification" object:0 userInfo:v8];

      self->_orientationChanged = 0;
    }
  }
}

- (void)invalidateReloadBannerView:(id)a3
{
  self->_orientationChanged = 1;
  id v4 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  id v5 = [v4 bundleIdentifier];

  if ([v5 isEqualToString:*MEMORY[0x1E4F5DC28]])
  {
    [(SGBannerView *)self invalidateBannerView];
    [(SGBannerView *)self reload];
  }
}

- (SGBannerView)init
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SGBannerView;
  double v2 = -[SGBannerView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    banner = v2->_banner;
    v2->_banner = (_TtC17CoreSuggestionsUI15SGBannerContent *)v3;

    id v5 = [[_TtC17CoreSuggestionsUI26SGBannerContentHostingView alloc] initWithBanner:v2->_banner];
    bannerHostingView = v2->_bannerHostingView;
    v2->_bannerHostingView = v5;

    v2->_orientationChanged = 0;
    [(SGBannerView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SGBannerContentHostingView *)v2->_bannerHostingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SGBannerView *)v2 addSubview:v2->_bannerHostingView];
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(SGBannerContentHostingView *)v2->_bannerHostingView leadingAnchor];
    v23 = [(SGBannerView *)v2 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v21 = [(SGBannerContentHostingView *)v2->_bannerHostingView trailingAnchor];
    v7 = [(SGBannerView *)v2 trailingAnchor];
    v8 = [v21 constraintEqualToAnchor:v7];
    v26[1] = v8;
    v9 = [(SGBannerContentHostingView *)v2->_bannerHostingView bottomAnchor];
    v10 = [(SGBannerView *)v2 bottomAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v26[2] = v11;
    v12 = [(SGBannerContentHostingView *)v2->_bannerHostingView topAnchor];
    v13 = [(SGBannerView *)v2 topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v26[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v20 activateConstraints:v15];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel_invalidateReloadBannerView_ name:*MEMORY[0x1E4FB27A8] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel_invalidateReloadBannerView_ name:*MEMORY[0x1E4FB2828] object:0];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v2 selector:sel_forceReloadBannerView_ name:*MEMORY[0x1E4FB2BC8] object:0];
  }
  return v2;
}

@end