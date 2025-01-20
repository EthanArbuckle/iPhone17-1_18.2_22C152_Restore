@interface CNSharedProfileBannerView
+ (id)log;
- (BOOL)hasTappedAction;
- (BOOL)isIgnored;
- (BOOL)isRTL;
- (BOOL)isRevertAction:(unint64_t)a3;
- (BOOL)shouldPerformActionUponCacheInvalidation;
- (CGSize)avatarSize;
- (CNAvatarView)avatarView;
- (CNSharedProfileAnimationGenerator)animationGenerator;
- (CNSharedProfileBannerStyle)style;
- (CNSharedProfileBannerView)init;
- (CNSharedProfileBannerViewDelegate)delegate;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (NSArray)constraints;
- (UIButton)actionButton;
- (UIButton)dismissButton;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)labelStackView;
- (double)estimatedHeight;
- (double)estimatedHeightForWidth:(double)a3;
- (id)actionButtonTitleForAction:(unint64_t)a3;
- (id)contactDisplayName;
- (id)horizontalConstraints;
- (id)subtitleForAction:(unint64_t)a3 contactName:(id)a4;
- (id)subtitleForTappedAction:(unint64_t)a3;
- (id)subtitleTextColorForTappedAction:(unint64_t)a3;
- (id)titleForAction:(unint64_t)a3;
- (id)verticalConstraintsWithAvatarView;
- (id)verticalConstraintsWithHiddenAvatarView;
- (id)xmarkImageWithColorConfiguration:(id)a3;
- (unint64_t)tappedAction;
- (void)avatarCacheDidUpdateForIdentifiers:(id)a3;
- (void)didTapActionButton;
- (void)didTapDismiss;
- (void)invalidateAvatarCacheEntriesForContact:(id)a3;
- (void)layoutSubviews;
- (void)performAnimationIfNeeded;
- (void)setActionButton:(id)a3;
- (void)setAnimationGenerator:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setIsIgnored:(BOOL)a3;
- (void)setLabelStackView:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setShouldPerformActionUponCacheInvalidation:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTappedAction:(unint64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpActionButton;
- (void)setUpAvatarView;
- (void)setUpDismissButton;
- (void)setUpLabels;
- (void)setUpViews;
- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5;
- (void)startObservingAvatarCacheInvalidation;
- (void)updateConstraints;
- (void)updateContactForTappedAction;
- (void)updateUIForCurrentState;
@end

@implementation CNSharedProfileBannerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationGenerator, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setShouldPerformActionUponCacheInvalidation:(BOOL)a3
{
  self->_shouldPerformActionUponCacheInvalidation = a3;
}

- (BOOL)shouldPerformActionUponCacheInvalidation
{
  return self->_shouldPerformActionUponCacheInvalidation;
}

- (unint64_t)tappedAction
{
  return self->_tappedAction;
}

- (void)setAnimationGenerator:(id)a3
{
}

- (CNSharedProfileAnimationGenerator)animationGenerator
{
  return self->_animationGenerator;
}

- (void)setSharedProfileStateOracle:(id)a3
{
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setConstraints:(id)a3
{
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setDismissButton:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setLabelStackView:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (CNSharedProfileBannerStyle)style
{
  return self->_style;
}

- (void)setDelegate:(id)a3
{
}

- (CNSharedProfileBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNSharedProfileBannerViewDelegate *)WeakRetained;
}

- (CGSize)avatarSize
{
  int v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  double v3 = 60.0;
  if (v2) {
    double v3 = 40.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isRTL
{
  int v2 = [(CNSharedProfileBannerView *)self traitCollection];
  BOOL v3 = [v2 layoutDirection] == 1;

  return v3;
}

- (BOOL)isRevertAction:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (id)contactDisplayName
{
  int v2 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  BOOL v3 = [v2 contact];

  double v4 = &stru_1ED8AC728;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B910]);
    [v5 setStyle:1000];
    [v5 setFallbackStyle:-1];
    uint64_t v6 = [v5 stringFromContact:v3];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1ED8AC728;
    }
    double v4 = v8;
  }

  return v4;
}

- (BOOL)hasTappedAction
{
  return [(CNSharedProfileBannerView *)self tappedAction] != 0;
}

- (void)avatarCacheDidUpdateForIdentifiers:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(CNSharedProfileBannerView *)self shouldPerformActionUponCacheInvalidation])
  {
    [(CNSharedProfileBannerView *)self setShouldPerformActionUponCacheInvalidation:0];
    unint64_t v4 = [(CNSharedProfileBannerView *)self tappedAction];
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [MEMORY[0x1E4F1BAB8] descriptionForActionType:v4];
      v7 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
      v8 = [v7 contact];
      v9 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      __int16 v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_18B625000, v5, OS_LOG_TYPE_DEFAULT, "Performing %@ action type on contact (%@) from banner view", buf, 0x16u);
    }
    v10 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
    id v19 = 0;
    v11 = [v10 updateContactAndNicknamesForActionType:v4 error:&v19];
    id v12 = v19;

    if (v11)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __64__CNSharedProfileBannerView_avatarCacheDidUpdateForIdentifiers___block_invoke;
      v16[3] = &unk_1E549A010;
      v16[4] = self;
      id v17 = v11;
      unint64_t v18 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v16);
    }
    else
    {
      v13 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [0 identifier];
        v15 = [MEMORY[0x1E4F1BAB8] descriptionForActionType:v4];
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_error_impl(&dword_18B625000, v13, OS_LOG_TYPE_ERROR, "Error updating contact (%@) for action %@ with error %@", buf, 0x20u);
      }
    }
  }
}

void __64__CNSharedProfileBannerView_avatarCacheDidUpdateForIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sharedProfileBannerView:*(void *)(a1 + 32) didUpdateContact:*(void *)(a1 + 40) forAction:*(void *)(a1 + 48)];
}

- (void)invalidateAvatarCacheEntriesForContact:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = +[CNUIContactsEnvironment currentEnvironment];
    id v5 = [v4 cachingLikenessRenderer];
    uint64_t v6 = &unk_1ED9F0FB8;
    if ([v5 conformsToProtocol:v6]) {
      v7 = v5;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      v9 = dispatch_get_global_queue(25, 0);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __68__CNSharedProfileBannerView_invalidateAvatarCacheEntriesForContact___block_invoke;
      v10[3] = &unk_1E549BF80;
      id v11 = v8;
      id v12 = v3;
      dispatch_async(v9, v10);
    }
  }
}

void __68__CNSharedProfileBannerView_invalidateAvatarCacheEntriesForContact___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  v4[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 updateContactsWithIdentifiers:v3];
}

- (void)didTapDismiss
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  uint64_t v4 = [v3 bannerActionTypeForEffectiveState];

  id v5 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  id v9 = 0;
  uint64_t v6 = [v5 updateContactAndNicknamesForDeclinedActionType:v4 error:&v9];
  id v7 = v9;

  if (v6)
  {
    [(CNSharedProfileBannerView *)self setIsIgnored:1];
    id v8 = [(CNSharedProfileBannerView *)self delegate];
    [v8 sharedProfileBannerView:self didDismissWithUpdatedContact:v6 forAction:v4];
  }
  else
  {
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Error updating contact for dismiss action: %@", buf, 0xCu);
    }
  }
}

- (void)updateContactForTappedAction
{
  [(CNSharedProfileBannerView *)self setShouldPerformActionUponCacheInvalidation:1];
  id v4 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  id v3 = [v4 contact];
  [(CNSharedProfileBannerView *)self invalidateAvatarCacheEntriesForContact:v3];
}

- (void)didTapActionButton
{
  id v3 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  uint64_t v4 = [v3 bannerActionTypeForEffectiveState];

  [(CNSharedProfileBannerView *)self setTappedAction:v4];

  [(CNSharedProfileBannerView *)self updateContactForTappedAction];
}

- (void)performAnimationIfNeeded
{
  id v3 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  uint64_t v4 = [v3 bannerActionTypeForEffectiveState];

  if ([(CNSharedProfileBannerView *)self isRevertAction:v4])
  {
    id v5 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
    id v10 = [v5 targetProfileForActionType:v4];

    uint64_t v6 = [(CNSharedProfileBannerView *)self animationGenerator];
    id v7 = [(CNSharedProfileBannerView *)self avatarView];
    id v8 = [v10 contact];
    BOOL v9 = [(CNSharedProfileBannerView *)self isRTL];
    [(CNSharedProfileBannerView *)self avatarSize];
    objc_msgSend(v6, "performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:", v7, v8, v9, 0);
  }
}

- (id)actionButtonTitleForAction:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    id v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_REVERT_BANNER_BUTTON_TITLE";
LABEL_5:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    id v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_UPDATE_BANNER_BUTTON_TITLE";
    goto LABEL_5;
  }
  uint64_t v6 = &stru_1ED8AC728;
LABEL_7:

  return v6;
}

- (id)subtitleTextColorForTappedAction:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    uint64_t v3 = +[CNUIColorRepository sharedProfileBannerSubtitleRevertedColor];
LABEL_5:
    uint64_t v4 = (void *)v3;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    uint64_t v3 = +[CNUIColorRepository sharedProfileBannerSubtitleUpdatedColor];
    goto LABEL_5;
  }
  id v5 = [(CNSharedProfileBannerView *)self style];
  uint64_t v4 = [v5 subtitleTextColor];

LABEL_7:

  return v4;
}

- (id)subtitleForTappedAction:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    uint64_t v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_REVERT_PHOTO_BANNER_ACCEPTED_SUBTITLE";
LABEL_5:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    uint64_t v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_UPDATE_BANNER_ACCEPTED_SUBTITLE";
    goto LABEL_5;
  }
  uint64_t v6 = &stru_1ED8AC728;
LABEL_7:

  return v6;
}

- (id)subtitleForAction:(unint64_t)a3 contactName:(id)a4
{
  uint64_t v4 = NSString;
  id v5 = a4;
  uint64_t v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SNAP_PHOTO_BANNER_SUBTITLE_%@" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v5);

  return v8;
}

- (id)titleForAction:(unint64_t)a3
{
  if (a3 - 1 < 2)
  {
    uint64_t v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_REVERT_PHOTO_BANNER_TITLE";
LABEL_5:
    uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

    goto LABEL_7;
  }
  if (a3 == 3)
  {
    uint64_t v3 = CNContactsUIBundle();
    uint64_t v4 = v3;
    id v5 = @"SNAP_UPDATE_PHOTO_BANNER_TITLE";
    goto LABEL_5;
  }
  uint64_t v6 = &stru_1ED8AC728;
LABEL_7:

  return v6;
}

- (void)setTappedAction:(unint64_t)a3
{
  if (self->_tappedAction != a3)
  {
    self->_tappedAction = a3;
    [(CNSharedProfileBannerView *)self updateUIForCurrentState];
  }
}

- (void)updateUIForCurrentState
{
  if (!self->_sharedProfileStateOracle) {
    return;
  }
  uint64_t v3 = 504;
  unint64_t tappedAction = self->_tappedAction;
  id v5 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  uint64_t v6 = [v5 bannerActionTypeForEffectiveState];

  id v7 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
  id v25 = [v7 targetProfileForActionType:v6];

  if (tappedAction)
  {
    unint64_t v8 = self->_tappedAction;
    BOOL v9 = self;
  }
  else
  {
    BOOL v9 = self;
    unint64_t v8 = v6;
  }
  id v10 = [(CNSharedProfileBannerView *)v9 titleForAction:v8];
  id v11 = [(CNSharedProfileBannerView *)self titleLabel];
  [v11 setText:v10];

  if (tappedAction)
  {
    [(CNSharedProfileBannerView *)self subtitleForTappedAction:self->_tappedAction];
  }
  else
  {
    id v10 = [(CNSharedProfileBannerView *)self contactDisplayName];
    [(CNSharedProfileBannerView *)self subtitleForAction:v6 contactName:v10];
  uint64_t v12 = };
  v13 = [(CNSharedProfileBannerView *)self subtitleLabel];
  [v13 setText:v12];

  if (tappedAction)
  {
    [(CNSharedProfileBannerView *)self subtitleTextColorForTappedAction:self->_tappedAction];
  }
  else
  {

    id v10 = [(CNSharedProfileBannerView *)self style];
    [v10 subtitleTextColor];
  v14 = };
  v15 = [(CNSharedProfileBannerView *)self subtitleLabel];
  [v15 setTextColor:v14];

  if (tappedAction)
  {
    v16 = [(CNSharedProfileBannerView *)self style];
    v14 = [v16 subtitleFont];
    uint64_t v3 = [v14 fontDescriptor];
    +[CNUIFontRepository boldFontWithFontDescriptor:v3];
  }
  else
  {

    v16 = [(CNSharedProfileBannerView *)self style];
    [v16 subtitleFont];
  id v17 = };
  unint64_t v18 = [(CNSharedProfileBannerView *)self subtitleLabel];
  [v18 setFont:v17];

  if (tappedAction)
  {

    id v17 = v14;
  }

  id v19 = [(CNSharedProfileBannerView *)self actionButton];
  v20 = [(CNSharedProfileBannerView *)self actionButtonTitleForAction:v6];
  [v19 setTitle:v20 forState:0];

  v21 = [(CNSharedProfileBannerView *)self actionButton];
  [v21 setHidden:tappedAction != 0];

  if ([(CNSharedProfileBannerView *)self isRevertAction:v6])
  {
    __int16 v22 = [(CNSharedProfileBannerView *)self sharedProfileStateOracle];
    v23 = [v22 contact];
    __int16 v24 = [(CNSharedProfileBannerView *)self avatarView];
    [v24 setContact:v23];

LABEL_21:
    goto LABEL_22;
  }
  if (!tappedAction)
  {
    __int16 v22 = [v25 contact];
    v23 = [(CNSharedProfileBannerView *)self avatarView];
    [v23 setContact:v22];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)setUpWithSharedProfileStateOracle:(id)a3 tappedAction:(unint64_t)a4 hasPerformedAnimation:(BOOL)a5
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
  self->_unint64_t tappedAction = a4;
  [(CNSharedProfileBannerView *)self updateUIForCurrentState];
  if (!a5) {
    [(CNSharedProfileBannerView *)self performSelector:sel_performAnimationIfNeeded withObject:0 afterDelay:0.5];
  }
}

- (void)startObservingAvatarCacheInvalidation
{
  uint64_t v3 = +[CNUIContactsEnvironment currentEnvironment];
  uint64_t v4 = [v3 cachingLikenessRenderer];
  if ([v4 conformsToProtocol:&unk_1ED9F0FB8]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v7 = v5;

  uint64_t v6 = v7;
  if (v7)
  {
    [v7 addDelegate:self];
    uint64_t v6 = v7;
  }
}

- (double)estimatedHeightForWidth:(double)a3
{
  id v5 = [(CNSharedProfileBannerView *)self dismissButton];
  [v5 sizeToFit];

  uint64_t v6 = [(CNSharedProfileBannerView *)self avatarView];
  [v6 sizeToFit];

  id v7 = [(CNSharedProfileBannerView *)self actionButton];
  [v7 sizeToFit];

  int v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  id v9 = [(CNSharedProfileBannerView *)self avatarView];
  char v10 = [v9 isHidden];
  double v11 = 0.0;
  if (v8)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = [(CNSharedProfileBannerView *)self avatarView];
      [v12 frame];
      double v11 = v13;
    }
    v14 = [(CNSharedProfileBannerView *)self actionButton];
    [v14 frame];
    double v16 = v15;

    double v17 = v11 + v16 + 16.0;
  }
  else
  {
    if ((v10 & 1) == 0)
    {
      unint64_t v18 = [(CNSharedProfileBannerView *)self avatarView];
      [v18 frame];
      double v11 = v19;
    }
    v20 = [(CNSharedProfileBannerView *)self actionButton];
    [v20 frame];
    double v22 = v21;
    v23 = [(CNSharedProfileBannerView *)self dismissButton];
    [v23 frame];
    double v25 = v22 + v24;

    a3 = a3 - v11 - v25 + -40.0;
    double v17 = 16.0;
  }
  uint64_t v26 = [(CNSharedProfileBannerView *)self titleLabel];
  objc_msgSend(v26, "sizeThatFits:", a3, 3.40282347e38);
  double v28 = v27;

  v29 = [(CNSharedProfileBannerView *)self subtitleLabel];
  objc_msgSend(v29, "sizeThatFits:", a3, 3.40282347e38);
  double v31 = v30;

  double result = v17 + v28 + v31;
  if (result < 60.0) {
    return 60.0;
  }
  return result;
}

- (double)estimatedHeight
{
  [(CNSharedProfileBannerView *)self estimatedHeightForWidth:0.0];
  return result;
}

- (id)verticalConstraintsWithHiddenAvatarView
{
  v56[12] = *MEMORY[0x1E4F143B8];
  v55 = [(CNSharedProfileBannerView *)self avatarView];
  v54 = [v55 centerXAnchor];
  v53 = [(CNSharedProfileBannerView *)self centerXAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v56[0] = v52;
  v51 = [(CNSharedProfileBannerView *)self avatarView];
  v50 = [v51 topAnchor];
  v49 = [(CNSharedProfileBannerView *)self topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:8.0];
  v56[1] = v48;
  v47 = [(CNSharedProfileBannerView *)self avatarView];
  v45 = [v47 heightAnchor];
  v46 = [(CNSharedProfileBannerView *)self avatarView];
  v44 = [v46 widthAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v56[2] = v43;
  v42 = [(CNSharedProfileBannerView *)self avatarView];
  v41 = [v42 heightAnchor];
  v40 = [v41 constraintEqualToConstant:60.0];
  v56[3] = v40;
  v39 = [(CNSharedProfileBannerView *)self labelStackView];
  v38 = [v39 topAnchor];
  v37 = [(CNSharedProfileBannerView *)self topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v56[4] = v36;
  v35 = [(CNSharedProfileBannerView *)self labelStackView];
  v34 = [v35 leadingAnchor];
  v33 = [(CNSharedProfileBannerView *)self leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v56[5] = v32;
  double v31 = [(CNSharedProfileBannerView *)self labelStackView];
  v29 = [v31 trailingAnchor];
  double v30 = [(CNSharedProfileBannerView *)self dismissButton];
  double v28 = [v30 leadingAnchor];
  double v27 = [v29 constraintEqualToAnchor:v28];
  v56[6] = v27;
  uint64_t v26 = [(CNSharedProfileBannerView *)self actionButton];
  double v24 = [v26 topAnchor];
  double v25 = [(CNSharedProfileBannerView *)self labelStackView];
  v23 = [v25 bottomAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23];
  v56[7] = v22;
  double v21 = [(CNSharedProfileBannerView *)self actionButton];
  double v19 = [v21 centerXAnchor];
  v20 = [(CNSharedProfileBannerView *)self labelStackView];
  unint64_t v18 = [v20 centerXAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v56[8] = v17;
  double v16 = [(CNSharedProfileBannerView *)self actionButton];
  double v15 = [v16 bottomAnchor];
  uint64_t v3 = [(CNSharedProfileBannerView *)self bottomAnchor];
  uint64_t v4 = [v15 constraintEqualToAnchor:v3 constant:-8.0];
  v56[9] = v4;
  id v5 = [(CNSharedProfileBannerView *)self dismissButton];
  uint64_t v6 = [v5 trailingAnchor];
  id v7 = [(CNSharedProfileBannerView *)self trailingAnchor];
  int v8 = [v6 constraintEqualToAnchor:v7];
  v56[10] = v8;
  id v9 = [(CNSharedProfileBannerView *)self dismissButton];
  char v10 = [v9 centerYAnchor];
  double v11 = [(CNSharedProfileBannerView *)self centerYAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v56[11] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:12];

  return v14;
}

- (id)verticalConstraintsWithAvatarView
{
  v56[12] = *MEMORY[0x1E4F143B8];
  v55 = [(CNSharedProfileBannerView *)self avatarView];
  v54 = [v55 centerXAnchor];
  v53 = [(CNSharedProfileBannerView *)self centerXAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v56[0] = v52;
  v51 = [(CNSharedProfileBannerView *)self avatarView];
  v50 = [v51 topAnchor];
  v49 = [(CNSharedProfileBannerView *)self topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:8.0];
  v56[1] = v48;
  v47 = [(CNSharedProfileBannerView *)self avatarView];
  v45 = [v47 heightAnchor];
  v46 = [(CNSharedProfileBannerView *)self avatarView];
  v44 = [v46 widthAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v56[2] = v43;
  v42 = [(CNSharedProfileBannerView *)self avatarView];
  v41 = [v42 heightAnchor];
  v40 = [v41 constraintEqualToConstant:60.0];
  v56[3] = v40;
  v39 = [(CNSharedProfileBannerView *)self labelStackView];
  v37 = [v39 topAnchor];
  v38 = [(CNSharedProfileBannerView *)self avatarView];
  v36 = [v38 bottomAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v56[4] = v35;
  v34 = [(CNSharedProfileBannerView *)self labelStackView];
  v33 = [v34 leadingAnchor];
  v32 = [(CNSharedProfileBannerView *)self leadingAnchor];
  double v31 = [v33 constraintEqualToAnchor:v32];
  v56[5] = v31;
  double v30 = [(CNSharedProfileBannerView *)self labelStackView];
  v29 = [v30 trailingAnchor];
  double v28 = [(CNSharedProfileBannerView *)self trailingAnchor];
  double v27 = [v29 constraintEqualToAnchor:v28];
  v56[6] = v27;
  uint64_t v26 = [(CNSharedProfileBannerView *)self actionButton];
  double v24 = [v26 topAnchor];
  double v25 = [(CNSharedProfileBannerView *)self labelStackView];
  v23 = [v25 bottomAnchor];
  double v22 = [v24 constraintEqualToAnchor:v23];
  v56[7] = v22;
  double v21 = [(CNSharedProfileBannerView *)self actionButton];
  double v19 = [v21 centerXAnchor];
  v20 = [(CNSharedProfileBannerView *)self labelStackView];
  unint64_t v18 = [v20 centerXAnchor];
  double v17 = [v19 constraintEqualToAnchor:v18];
  v56[8] = v17;
  double v16 = [(CNSharedProfileBannerView *)self actionButton];
  double v15 = [v16 bottomAnchor];
  uint64_t v3 = [(CNSharedProfileBannerView *)self bottomAnchor];
  uint64_t v4 = [v15 constraintEqualToAnchor:v3 constant:-8.0];
  v56[9] = v4;
  id v5 = [(CNSharedProfileBannerView *)self dismissButton];
  uint64_t v6 = [v5 trailingAnchor];
  id v7 = [(CNSharedProfileBannerView *)self trailingAnchor];
  int v8 = [v6 constraintEqualToAnchor:v7];
  v56[10] = v8;
  id v9 = [(CNSharedProfileBannerView *)self dismissButton];
  char v10 = [v9 topAnchor];
  double v11 = [(CNSharedProfileBannerView *)self topAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v56[11] = v12;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:12];

  return v14;
}

- (id)horizontalConstraints
{
  v63[13] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNSharedProfileBannerView *)self avatarView];
  char v4 = [v3 isHidden];
  id v5 = [(CNSharedProfileBannerView *)self labelStackView];
  uint64_t v6 = [v5 leadingAnchor];
  if (v4)
  {
    id v7 = [(CNSharedProfileBannerView *)self leadingAnchor];
    uint64_t v8 = [v6 constraintEqualToAnchor:v7];
  }
  else
  {
    id v7 = [(CNSharedProfileBannerView *)self avatarView];
    id v9 = [v7 trailingAnchor];
    uint64_t v8 = [v6 constraintEqualToSystemSpacingAfterAnchor:v9 multiplier:1.0];
  }
  v38 = (void *)v8;

  v62 = [(CNSharedProfileBannerView *)self avatarView];
  v61 = [v62 centerYAnchor];
  v60 = [(CNSharedProfileBannerView *)self centerYAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v63[0] = v59;
  v58 = [(CNSharedProfileBannerView *)self avatarView];
  v57 = [v58 leadingAnchor];
  v56 = [(CNSharedProfileBannerView *)self leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v63[1] = v55;
  v54 = [(CNSharedProfileBannerView *)self avatarView];
  v52 = [v54 heightAnchor];
  v53 = [(CNSharedProfileBannerView *)self avatarView];
  v51 = [v53 widthAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v63[2] = v50;
  v49 = [(CNSharedProfileBannerView *)self avatarView];
  v48 = [v49 heightAnchor];
  v47 = [v48 constraintEqualToConstant:40.0];
  v63[3] = v47;
  v46 = [(CNSharedProfileBannerView *)self labelStackView];
  v45 = [v46 centerYAnchor];
  v44 = [(CNSharedProfileBannerView *)self centerYAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v63[4] = v43;
  v42 = [(CNSharedProfileBannerView *)self labelStackView];
  v41 = [v42 topAnchor];
  v40 = [(CNSharedProfileBannerView *)self topAnchor];
  v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40 constant:8.0];
  v63[5] = v39;
  v37 = [(CNSharedProfileBannerView *)self labelStackView];
  v36 = [v37 bottomAnchor];
  v35 = [(CNSharedProfileBannerView *)self bottomAnchor];
  v34 = [v36 constraintLessThanOrEqualToAnchor:v35 constant:8.0];
  v63[6] = v34;
  v63[7] = v8;
  v33 = [(CNSharedProfileBannerView *)self actionButton];
  double v31 = [v33 leadingAnchor];
  v32 = [(CNSharedProfileBannerView *)self labelStackView];
  double v30 = [v32 trailingAnchor];
  v29 = [v31 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v30 multiplier:1.0];
  v63[8] = v29;
  double v28 = [(CNSharedProfileBannerView *)self actionButton];
  double v27 = [v28 centerYAnchor];
  uint64_t v26 = [(CNSharedProfileBannerView *)self centerYAnchor];
  double v25 = [v27 constraintEqualToAnchor:v26];
  v63[9] = v25;
  double v24 = [(CNSharedProfileBannerView *)self dismissButton];
  double v22 = [v24 leadingAnchor];
  v23 = [(CNSharedProfileBannerView *)self actionButton];
  char v10 = [v23 trailingAnchor];
  double v11 = [v22 constraintEqualToAnchor:v10];
  v63[10] = v11;
  uint64_t v12 = [(CNSharedProfileBannerView *)self dismissButton];
  double v13 = [v12 trailingAnchor];
  id v14 = [(CNSharedProfileBannerView *)self trailingAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  v63[11] = v15;
  double v16 = [(CNSharedProfileBannerView *)self dismissButton];
  double v17 = [v16 centerYAnchor];
  unint64_t v18 = [(CNSharedProfileBannerView *)self centerYAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  v63[12] = v19;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:13];

  return v21;
}

- (void)updateConstraints
{
  v10.receiver = self;
  v10.super_class = (Class)CNSharedProfileBannerView;
  [(CNSharedProfileBannerView *)&v10 updateConstraints];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    uint64_t v3 = [(CNSharedProfileBannerView *)self avatarView];
    if ([v3 isHidden]) {
      [(CNSharedProfileBannerView *)self verticalConstraintsWithHiddenAvatarView];
    }
    else {
    char v4 = [(CNSharedProfileBannerView *)self verticalConstraintsWithAvatarView];
    }
    constraints = self->_constraints;
    self->_constraints = v4;

    uint64_t v6 = 1;
  }
  else
  {
    id v5 = [(CNSharedProfileBannerView *)self horizontalConstraints];
    uint64_t v3 = self->_constraints;
    self->_constraints = v5;
    uint64_t v6 = 4;
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  uint64_t v8 = [(CNSharedProfileBannerView *)self titleLabel];
  [v8 setTextAlignment:v6];

  id v9 = [(CNSharedProfileBannerView *)self subtitleLabel];
  [v9 setTextAlignment:v6];
}

- (void)setStyle:(id)a3
{
  uint64_t v6 = (CNSharedProfileBannerStyle *)a3;
  if (self->_style != v6)
  {
    double v22 = v6;
    objc_storeStrong((id *)&self->_style, a3);
    id v7 = [(CNSharedProfileBannerStyle *)v22 titleTextColor];
    uint64_t v8 = [(CNSharedProfileBannerView *)self titleLabel];
    [v8 setTextColor:v7];

    id v9 = [(CNSharedProfileBannerStyle *)v22 subtitleTextColor];
    objc_super v10 = [(CNSharedProfileBannerView *)self subtitleLabel];
    [v10 setTextColor:v9];

    double v11 = [(CNSharedProfileBannerStyle *)v22 titleFont];
    uint64_t v12 = [(CNSharedProfileBannerView *)self titleLabel];
    [v12 setFont:v11];

    BOOL v13 = [(CNSharedProfileBannerView *)self hasTappedAction];
    [(CNSharedProfileBannerStyle *)v22 subtitleFont];
    if (v13) {
      uint64_t v12 = {;
    }
      uint64_t v3 = [v12 fontDescriptor];
      +[CNUIFontRepository boldFontWithFontDescriptor:v3];
    id v14 = };
    double v15 = [(CNSharedProfileBannerView *)self subtitleLabel];
    [v15 setFont:v14];

    if (v13)
    {

      id v14 = v12;
    }

    double v16 = [(CNSharedProfileBannerStyle *)v22 actionButtonConfiguration];
    double v17 = [(CNSharedProfileBannerView *)self actionButton];
    [v17 setConfiguration:v16];

    unint64_t v18 = [(CNSharedProfileBannerStyle *)v22 xmarkButtonColorConfiguration];
    double v19 = [(CNSharedProfileBannerView *)self xmarkImageWithColorConfiguration:v18];
    v20 = [(CNSharedProfileBannerView *)self dismissButton];
    id v21 = [v20 imageView];
    [v21 setImage:v19];

    uint64_t v6 = v22;
  }
}

- (id)xmarkImageWithColorConfiguration:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1830];
  id v4 = a3;
  id v5 = [v3 configurationWithScale:2];
  uint64_t v6 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
  id v7 = [v6 configurationByApplyingConfiguration:v4];

  uint64_t v8 = [v5 configurationByApplyingConfiguration:v7];

  id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v8];

  return v9;
}

- (void)setUpDismissButton
{
  id v7 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  uint64_t v3 = [(CNSharedProfileBannerView *)self style];
  id v4 = [v3 xmarkButtonColorConfiguration];
  id v5 = [(CNSharedProfileBannerView *)self xmarkImageWithColorConfiguration:v4];
  [v7 setImage:v5];

  [v7 setButtonSize:2];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setConfiguration:v7];
  [v6 addTarget:self action:sel_didTapDismiss forControlEvents:64];
  [(CNSharedProfileBannerView *)self addSubview:v6];
  [(CNSharedProfileBannerView *)self setDismissButton:v6];
}

- (void)setUpActionButton
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = [(CNSharedProfileBannerView *)self style];
  id v4 = [v3 actionButtonConfiguration];
  [v5 setConfiguration:v4];

  [v5 addTarget:self action:sel_didTapActionButton forControlEvents:64];
  [(CNSharedProfileBannerView *)self addSubview:v5];
  [(CNSharedProfileBannerView *)self setActionButton:v5];
}

- (void)setUpLabels
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setNumberOfLines:0];
  id v4 = [(CNSharedProfileBannerView *)self style];
  id v5 = [v4 titleTextColor];
  [v3 setTextColor:v5];

  id v6 = [(CNSharedProfileBannerView *)self style];
  id v7 = [v6 titleFont];
  [v3 setFont:v7];

  [v3 setAdjustsFontSizeToFitWidth:1];
  [(CNSharedProfileBannerView *)self setTitleLabel:v3];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setNumberOfLines:0];
  [v8 setLineBreakMode:1];
  id v9 = [(CNSharedProfileBannerView *)self style];
  objc_super v10 = [v9 subtitleTextColor];
  [v8 setTextColor:v10];

  double v11 = [(CNSharedProfileBannerView *)self style];
  uint64_t v12 = [v11 subtitleFont];
  [v8 setFont:v12];

  [v8 setAdjustsFontSizeToFitWidth:1];
  [(CNSharedProfileBannerView *)self setSubtitleLabel:v8];
  id v13 = objc_alloc(MEMORY[0x1E4FB1C60]);
  id v14 = [(CNSharedProfileBannerView *)self titleLabel];
  v18[0] = v14;
  double v15 = [(CNSharedProfileBannerView *)self subtitleLabel];
  v18[1] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  double v17 = (void *)[v13 initWithArrangedSubviews:v16];

  [v17 setAxis:1];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setAlignment:1];
  [(CNSharedProfileBannerView *)self addSubview:v17];
  [(CNSharedProfileBannerView *)self setLabelStackView:v17];
}

- (void)setUpAvatarView
{
  id v3 = objc_alloc_init(CNAvatarView);
  [(CNAvatarView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNSharedProfileBannerView *)self addSubview:v3];
  [(CNSharedProfileBannerView *)self setAvatarView:v3];
}

- (void)setUpViews
{
  [(CNSharedProfileBannerView *)self setUpAvatarView];
  [(CNSharedProfileBannerView *)self setUpLabels];
  [(CNSharedProfileBannerView *)self setUpActionButton];

  [(CNSharedProfileBannerView *)self setUpDismissButton];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CNSharedProfileBannerView;
  [(CNSharedProfileBannerView *)&v7 layoutSubviews];
  id v3 = [(CNSharedProfileBannerView *)self labelStackView];
  [v3 bounds];
  double v5 = v4 + 20.0;
  id v6 = [(CNSharedProfileBannerView *)self titleLabel];
  [v6 setPreferredMaxLayoutWidth:v5];
}

- (CNSharedProfileBannerView)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNSharedProfileBannerView;
  id v2 = -[CNSharedProfileBannerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    uint64_t v3 = +[CNSharedProfileBannerStyle defaultStyle];
    style = v2->_style;
    v2->_style = (CNSharedProfileBannerStyle *)v3;

    double v5 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    animationGenerator = v2->_animationGenerator;
    v2->_animationGenerator = v5;

    [(CNSharedProfileBannerView *)v2 setUpViews];
    [(CNSharedProfileBannerView *)v2 startObservingAvatarCacheInvalidation];
    objc_super v7 = v2;
  }

  return v2;
}

+ (id)log
{
  if (log_cn_once_token_1_37302 != -1) {
    dispatch_once(&log_cn_once_token_1_37302, &__block_literal_global_37303);
  }
  id v2 = (void *)log_cn_once_object_1_37304;

  return v2;
}

void __32__CNSharedProfileBannerView_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNSharedProfileBannerView");
  v1 = (void *)log_cn_once_object_1_37304;
  log_cn_once_object_1_37304 = (uint64_t)v0;
}

@end