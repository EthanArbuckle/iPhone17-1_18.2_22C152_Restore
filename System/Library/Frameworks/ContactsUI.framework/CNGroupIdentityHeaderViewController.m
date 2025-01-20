@interface CNGroupIdentityHeaderViewController
+ (id)descriptorForRequiredKeys;
+ (id)log;
- (BOOL)_canShowWhileLocked;
- (BOOL)groupContactIsSameAsCurrentContact:(id)a3;
- (BOOL)hasPerformedSharedProfileBannerAnimation;
- (BOOL)isMarkedForSyndication;
- (BOOL)preferredContentSizeCategoryIsXL;
- (BOOL)shouldShowActionButton;
- (BOOL)shouldShowActionsView;
- (BOOL)shouldShowContactBusy;
- (BOOL)shouldShowSharedProfileBannerView;
- (BOOL)shouldUseTitleLabelWrappedFontGivenBoundingRect:(CGRect)a3;
- (CGRect)titleLabelBoundingRectForFont:(id)a3 text:(id)a4 maxWidth:(double)a5 context:(id)a6;
- (CGSize)previousSize;
- (CGSize)sizeForLayoutInContainerSize:(CGSize)a3;
- (CNAvatarAccessoryView)mediaContextBadge;
- (CNBadgingAvatarBadgeStyleSettings)avatarBadgeStyleSettings;
- (CNContactFormatter)contactFormatter;
- (CNGroupAvatarViewController)groupAvatarViewController;
- (CNGroupIdentity)group;
- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3;
- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4;
- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4 avatarViewControllerSettings:(id)a5;
- (CNGroupIdentityHeaderViewControllerDelegate)delegate;
- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration;
- (CNGroupIdentityInlineActionsViewController)actionsViewController;
- (CNSharedProfileBannerStyle)sharedProfileBannerStyle;
- (CNSharedProfileBannerView)sharedProfileBannerView;
- (CNSharedProfileStateOracle)sharedProfileStateOracle;
- (NSArray)horizontalTitleLabelConstraints;
- (NSLayoutConstraint)actionButtonZeroHeightConstraint;
- (NSLayoutConstraint)actionsViewBottomConstraint;
- (NSLayoutConstraint)sharedProfileBannerContainerLeadingConstraint;
- (NSLayoutConstraint)sharedProfileBannerContainerTrailingConstraint;
- (NSString)actionButtonTitle;
- (UIButton)actionButton;
- (UIFont)titleLabelFont;
- (UIFont)titleLabelWrappedFont;
- (UIImage)avatarBadgeImage;
- (UIImageView)staticIdentityBadge;
- (UILabel)customSubtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)titleBadgeStackView;
- (UIStackView)titleLabelStackView;
- (UIView)sharedProfileBannerContainerView;
- (double)actionsViewTopMargin;
- (double)titleLabelBaselineOffset;
- (id)displayNameForGroupIdentity;
- (id)viewForActionAtIndex:(unint64_t)a3;
- (unint64_t)tappedSharedProfileBannerAction;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)didTapActionButton;
- (void)groupIdentityDidUpdate:(id)a3;
- (void)groupIdentityInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5;
- (void)groupIdentityInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4;
- (void)hideSharedProfileBannerViewForDismiss;
- (void)loadView;
- (void)performAnimationToNewContact:(id)a3 withCompletion:(id)a4;
- (void)setActionButton:(id)a3;
- (void)setActionButtonTitle:(id)a3;
- (void)setActionButtonZeroHeightConstraint:(id)a3;
- (void)setActionsViewBottomConstraint:(id)a3;
- (void)setActionsViewController:(id)a3;
- (void)setActionsViewTopMargin:(double)a3;
- (void)setAvatarBadgeImage:(id)a3;
- (void)setAvatarBadgeStyleSettings:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setCustomSubtitleLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroup:(id)a3;
- (void)setGroupAvatarViewController:(id)a3;
- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3;
- (void)setHorizontalTitleLabelConstraints:(id)a3;
- (void)setIsMarkedForSyndication:(BOOL)a3;
- (void)setMediaContextBadge:(id)a3;
- (void)setPreviousSize:(CGSize)a3;
- (void)setSharedProfileBannerContainerLeadingConstraint:(id)a3;
- (void)setSharedProfileBannerContainerTrailingConstraint:(id)a3;
- (void)setSharedProfileBannerContainerView:(id)a3;
- (void)setSharedProfileBannerStyle:(id)a3;
- (void)setSharedProfileBannerView:(id)a3;
- (void)setSharedProfileStateOracle:(id)a3;
- (void)setShouldHideTitleLabel:(BOOL)a3;
- (void)setShouldShowContactBusy:(BOOL)a3;
- (void)setShouldShowStaticKeyBadge:(BOOL)a3;
- (void)setStaticIdentityBadge:(id)a3;
- (void)setTappedSharedProfileBannerAction:(unint64_t)a3;
- (void)setTitleBadgeStackView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelFont:(id)a3;
- (void)setTitleLabelStackView:(id)a3;
- (void)setTitleLabelWrappedFont:(id)a3;
- (void)setupActionButton;
- (void)setupActionsView;
- (void)setupAvatarView;
- (void)setupCustomSubtitleLabel;
- (void)setupEmptyActionsView;
- (void)setupPopulatedActionsView;
- (void)setupSharedProfileBannerView;
- (void)setupTitleLabel;
- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5;
- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5;
- (void)updateActionButton;
- (void)updateActionButtonFont;
- (void)updateGroupWithContact:(id)a3;
- (void)updateTitleLabel;
- (void)updateTitleLabelFont;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CNGroupIdentityHeaderViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileBannerView, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_actionsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerContainerView, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_actionsViewController, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_storeStrong((id *)&self->_actionButtonZeroHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_staticIdentityBadge, 0);
  objc_storeStrong((id *)&self->_horizontalTitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_titleBadgeStackView, 0);
  objc_storeStrong((id *)&self->_titleLabelWrappedFont, 0);
  objc_storeStrong((id *)&self->_titleLabelFont, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabelStackView, 0);
  objc_storeStrong((id *)&self->_sharedProfileBannerStyle, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_storeStrong((id *)&self->_customSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_avatarBadgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_avatarBadgeImage, 0);
  objc_storeStrong((id *)&self->_actionsViewConfiguration, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

- (void)setHasPerformedSharedProfileBannerAnimation:(BOOL)a3
{
  self->_hasPerformedSharedProfileBannerAnimation = a3;
}

- (BOOL)hasPerformedSharedProfileBannerAnimation
{
  return self->_hasPerformedSharedProfileBannerAnimation;
}

- (void)setTappedSharedProfileBannerAction:(unint64_t)a3
{
  self->_tappedSharedProfileBannerAction = a3;
}

- (unint64_t)tappedSharedProfileBannerAction
{
  return self->_tappedSharedProfileBannerAction;
}

- (void)setSharedProfileBannerView:(id)a3
{
}

- (CNSharedProfileBannerView)sharedProfileBannerView
{
  return self->_sharedProfileBannerView;
}

- (void)setSharedProfileBannerContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)sharedProfileBannerContainerTrailingConstraint
{
  return self->_sharedProfileBannerContainerTrailingConstraint;
}

- (void)setSharedProfileBannerContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)sharedProfileBannerContainerLeadingConstraint
{
  return self->_sharedProfileBannerContainerLeadingConstraint;
}

- (void)setActionsViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionsViewBottomConstraint
{
  return self->_actionsViewBottomConstraint;
}

- (void)setSharedProfileBannerContainerView:(id)a3
{
}

- (UIView)sharedProfileBannerContainerView
{
  return self->_sharedProfileBannerContainerView;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (CGSize)previousSize
{
  double width = self->_previousSize.width;
  double height = self->_previousSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setActionsViewController:(id)a3
{
}

- (CNGroupIdentityInlineActionsViewController)actionsViewController
{
  return self->_actionsViewController;
}

- (void)setGroupAvatarViewController:(id)a3
{
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setActionsViewTopMargin:(double)a3
{
  self->_actionsViewTopMargin = a3;
}

- (double)actionsViewTopMargin
{
  return self->_actionsViewTopMargin;
}

- (void)setActionButtonZeroHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionButtonZeroHeightConstraint
{
  return self->_actionButtonZeroHeightConstraint;
}

- (void)setActionButton:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setStaticIdentityBadge:(id)a3
{
}

- (UIImageView)staticIdentityBadge
{
  return self->_staticIdentityBadge;
}

- (void)setHorizontalTitleLabelConstraints:(id)a3
{
}

- (NSArray)horizontalTitleLabelConstraints
{
  return self->_horizontalTitleLabelConstraints;
}

- (void)setTitleBadgeStackView:(id)a3
{
}

- (UIStackView)titleBadgeStackView
{
  return self->_titleBadgeStackView;
}

- (void)setTitleLabelWrappedFont:(id)a3
{
}

- (void)setTitleLabelFont:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabelStackView:(id)a3
{
}

- (UIStackView)titleLabelStackView
{
  return self->_titleLabelStackView;
}

- (BOOL)shouldShowContactBusy
{
  return self->_shouldShowContactBusy;
}

- (CNSharedProfileBannerStyle)sharedProfileBannerStyle
{
  return self->_sharedProfileBannerStyle;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (UILabel)customSubtitleLabel
{
  return self->_customSubtitleLabel;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (CNBadgingAvatarBadgeStyleSettings)avatarBadgeStyleSettings
{
  return self->_avatarBadgeStyleSettings;
}

- (UIImage)avatarBadgeImage
{
  return self->_avatarBadgeImage;
}

- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration
{
  return self->_actionsViewConfiguration;
}

- (void)setGroup:(id)a3
{
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (void)setDelegate:(id)a3
{
}

- (CNGroupIdentityHeaderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNGroupIdentityHeaderViewControllerDelegate *)WeakRetained;
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)sharedProfileBannerView:(id)a3 didDismissWithUpdatedContact:(id)a4 forAction:(unint64_t)a5
{
  id v10 = a4;
  [(CNGroupIdentityHeaderViewController *)self setTappedSharedProfileBannerAction:0];
  [(CNGroupIdentityHeaderViewController *)self updateGroupWithContact:v10];
  [(CNGroupIdentityHeaderViewController *)self hideSharedProfileBannerViewForDismiss];
  v7 = [(CNGroupIdentityHeaderViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CNGroupIdentityHeaderViewController *)self delegate];
    [v9 groupIdentityHeaderViewController:self didDismissSharedProfileBannerWithUpdatedContact:v10 forAction:a5];
  }
}

- (void)sharedProfileBannerView:(id)a3 didUpdateContact:(id)a4 forAction:(unint64_t)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__CNGroupIdentityHeaderViewController_sharedProfileBannerView_didUpdateContact_forAction___block_invoke;
  v9[3] = &unk_1E549A010;
  v9[4] = self;
  id v10 = v7;
  unint64_t v11 = a5;
  id v8 = v7;
  [(CNGroupIdentityHeaderViewController *)self performAnimationToNewContact:v8 withCompletion:v9];
}

uint64_t __90__CNGroupIdentityHeaderViewController_sharedProfileBannerView_didUpdateContact_forAction___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegate];
    [v4 groupIdentityHeaderViewController:*(void *)(a1 + 32) sharedProfileBannerDidUpdateContact:*(void *)(a1 + 40) forAction:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 32) setTappedSharedProfileBannerAction:*(void *)(a1 + 48)];
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  return [v5 updateGroupWithContact:v6];
}

- (void)groupIdentityInlineActionsViewController:(id)a3 willPresentDisambiguationUIForActionType:(id)a4
{
  id v8 = a4;
  v5 = [(CNGroupIdentityHeaderViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CNGroupIdentityHeaderViewController *)self delegate];
    [v7 groupIdentityHeaderViewController:self willPresentDisambiguationUIForActionType:v8];
  }
}

- (void)groupIdentityInlineActionsViewController:(id)a3 didPerformActionOfType:(id)a4 fromDisambiguation:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  id v7 = [(CNGroupIdentityHeaderViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(CNGroupIdentityHeaderViewController *)self delegate];
    [v9 groupIdentityHeaderViewController:self didPerformActionOfType:v10 fromDisambiguation:v5];
  }
}

- (id)displayNameForGroupIdentity
{
  char v3 = [(CNGroupIdentityHeaderViewController *)self contactFormatter];
  v4 = [(CNGroupIdentityHeaderViewController *)self group];
  BOOL v5 = [v3 stringFromGroupIdentity:v4];

  return v5;
}

- (CGSize)sizeForLayoutInContainerSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  char v6 = [(CNGroupIdentityHeaderViewController *)self displayNameForGroupIdentity];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  [v7 setMaximumNumberOfLines:2];
  char v8 = [(CNGroupIdentityHeaderViewController *)self titleLabelFont];
  [(CNGroupIdentityHeaderViewController *)self titleLabelBoundingRectForFont:v8 text:v6 maxWidth:v7 context:width];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0
    && -[CNGroupIdentityHeaderViewController shouldUseTitleLabelWrappedFontGivenBoundingRect:](self, "shouldUseTitleLabelWrappedFontGivenBoundingRect:", v10, v12, v14, v16))
  {
    v17 = [(CNGroupIdentityHeaderViewController *)self titleLabelWrappedFont];
    [(CNGroupIdentityHeaderViewController *)self titleLabelBoundingRectForFont:v17 text:v6 maxWidth:v7 context:width];
    double v16 = v18;
  }
  double v19 = v16 + 102.0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v20 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  v21 = [v20 arrangedSubviews];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v51;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v51 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v50 + 1) + 8 * v25);
        objc_opt_class();
        id v27 = v26;
        if (objc_opt_isKindOfClass()) {
          v28 = v27;
        }
        else {
          v28 = 0;
        }
        id v29 = v28;

        if (v29)
        {
          [v29 sizeToFit];
          [v29 bounds];
          double v19 = v19 + v30;
        }

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v23);
  }

  if ([(CNGroupIdentityHeaderViewController *)self shouldShowActionButton])
  {
    v31 = [(CNGroupIdentityHeaderViewController *)self actionButton];
    v32 = [(CNGroupIdentityHeaderViewController *)self actionButtonTitle];
    [v31 setTitle:v32 forState:0];

    [v7 setMaximumNumberOfLines:2];
    v33 = [(CNGroupIdentityHeaderViewController *)self actionButtonTitle];
    uint64_t v54 = *MEMORY[0x1E4FB06F8];
    v34 = +[CNUIFontRepository groupHeaderActionButtonFont];
    v55 = v34;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    objc_msgSend(v33, "boundingRectWithSize:options:attributes:context:", 33, v35, v7, width, height);
    double v37 = v36;

    double v38 = v19 + v37 + -2.0;
    if ([(CNGroupIdentityHeaderViewController *)self preferredContentSizeCategoryIsXL])
    {
      double v19 = v38 + 25.0;
    }
    else
    {
      double v19 = v38;
    }
  }
  if ([(CNGroupIdentityHeaderViewController *)self shouldShowActionsView])
  {
    [(CNGroupIdentityHeaderViewController *)self actionsViewTopMargin];
    double v40 = v19 + v39;
    v41 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
    objc_msgSend(v41, "actionsViewHeightThatFits:", width, height);
    double v43 = v42;

    double v19 = v40 + v43;
  }
  double v44 = v19 + 10.0;
  if ([(CNGroupIdentityHeaderViewController *)self shouldShowSharedProfileBannerView])
  {
    v45 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerView];
    [v45 estimatedHeightForWidth:width];
    double v47 = v44 + v46 + 10.0;

    double v44 = v47 + -5.0;
  }
  if (width > 454.0) {
    double width = 454.0;
  }

  double v48 = ceil(width);
  double v49 = ceil(v44);
  result.double height = v49;
  result.double width = v48;
  return result;
}

- (id)viewForActionAtIndex:(unint64_t)a3
{
  v4 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
  BOOL v5 = [v4 viewForActionAtIndex:a3];

  return v5;
}

- (void)performAnimationToNewContact:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v8 primaryAvatarSize];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(CNGroupIdentityHeaderViewController *)self traitCollection];
  BOOL v14 = [v13 layoutDirection] == 1;

  double v16 = objc_alloc_init(CNSharedProfileAnimationGenerator);
  double v15 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:](v16, "performCoinFlipAnimationForAnimatingAvatarView:toContact:rightToLeft:avatarSize:completionHandler:", v15, v7, v14, v6, v10, v12);
}

- (void)hideSharedProfileBannerViewForDismiss
{
  v9[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];

  if (v3)
  {
    v4 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];
    [v4 removeFromSuperview];
  }
  BOOL v5 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F28DC8];
    id v7 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];
    v9[0] = v7;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 activateConstraints:v8];
  }
}

- (void)setupSharedProfileBannerView
{
  v68[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];

  if (v3)
  {
    v4 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];
    [v4 removeFromSuperview];
  }
  if ([(CNGroupIdentityHeaderViewController *)self shouldShowSharedProfileBannerView])
  {
    BOOL v5 = objc_alloc_init(CNSharedProfileBannerView);
    [(CNSharedProfileBannerView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNSharedProfileBannerView *)v5 setDelegate:self];
    id v6 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
    [(CNSharedProfileBannerView *)v5 setStyle:v6];

    id v7 = [(CNGroupIdentityHeaderViewController *)self sharedProfileStateOracle];
    [(CNSharedProfileBannerView *)v5 setUpWithSharedProfileStateOracle:v7 tappedAction:[(CNGroupIdentityHeaderViewController *)self tappedSharedProfileBannerAction] hasPerformedAnimation:[(CNGroupIdentityHeaderViewController *)self hasPerformedSharedProfileBannerAnimation]];

    [(CNGroupIdentityHeaderViewController *)self setHasPerformedSharedProfileBannerAnimation:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
    double v10 = [v9 backgroundColor];
    [v8 setBackgroundColor:v10];

    double v11 = [v8 layer];
    [v11 setCornerRadius:12.0];

    double v12 = [(CNGroupIdentityHeaderViewController *)self view];
    [v12 addSubview:v8];

    [v8 addSubview:v5];
    double v13 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
    BOOL v14 = [v13 backgroundVisualEffectView];

    if (v14)
    {
      double v15 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
      double v16 = [v15 backgroundVisualEffectView];
      [v8 addBackgroundVisualEffectView:v16 withCornerRadius:12.0];
    }
    v17 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];

    if (v17)
    {
      double v18 = (void *)MEMORY[0x1E4F28DC8];
      double v19 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];
      v67 = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
      [v18 deactivateConstraints:v20];
    }
    BOOL v21 = [(CNGroupIdentityHeaderViewController *)self shouldShowActionsView];
    uint64_t v22 = [v8 topAnchor];
    if (v21)
    {
      uint64_t v23 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
      uint64_t v24 = [v23 view];
      uint64_t v25 = [v24 bottomAnchor];
      uint64_t v26 = [v22 constraintEqualToAnchor:v25 constant:10.0];
    }
    else
    {
      uint64_t v23 = [(CNGroupIdentityHeaderViewController *)self actionButton];
      uint64_t v24 = [v23 bottomAnchor];
      uint64_t v26 = [v22 constraintEqualToAnchor:v24 constant:10.0];
    }
    v56 = (void *)v26;

    double v30 = [v8 leadingAnchor];
    v31 = [(CNGroupIdentityHeaderViewController *)self view];
    v32 = [v31 leadingAnchor];
    v33 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
    [v33 leadingTrailingInset];
    v34 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    [(CNGroupIdentityHeaderViewController *)self setSharedProfileBannerContainerLeadingConstraint:v34];

    v35 = [v8 trailingAnchor];
    double v36 = [(CNGroupIdentityHeaderViewController *)self view];
    double v37 = [v36 trailingAnchor];
    double v38 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerStyle];
    [v38 leadingTrailingInset];
    double v40 = [v35 constraintEqualToAnchor:v37 constant:-v39];
    [(CNGroupIdentityHeaderViewController *)self setSharedProfileBannerContainerTrailingConstraint:v40];

    v55 = (void *)MEMORY[0x1E4F28DC8];
    v66[0] = v26;
    v65 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerLeadingConstraint];
    v66[1] = v65;
    v64 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerTrailingConstraint];
    v66[2] = v64;
    v62 = [v8 bottomAnchor];
    v63 = [(CNGroupIdentityHeaderViewController *)self view];
    v61 = [v63 bottomAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v66[3] = v60;
    v59 = [(CNSharedProfileBannerView *)v5 topAnchor];
    v58 = [v8 topAnchor];
    uint64_t v57 = [v59 constraintEqualToAnchor:v58];
    v66[4] = v57;
    long long v53 = [(CNSharedProfileBannerView *)v5 leadingAnchor];
    uint64_t v54 = [v8 layoutMarginsGuide];
    long long v52 = [v54 leadingAnchor];
    long long v51 = [v53 constraintEqualToAnchor:v52];
    v66[5] = v51;
    double v49 = [(CNSharedProfileBannerView *)v5 trailingAnchor];
    long long v50 = [v8 layoutMarginsGuide];
    double v48 = [v50 trailingAnchor];
    v41 = [v49 constraintEqualToAnchor:v48];
    v66[6] = v41;
    double v42 = [(CNSharedProfileBannerView *)v5 bottomAnchor];
    double v43 = [v8 bottomAnchor];
    double v44 = [v42 constraintEqualToAnchor:v43];
    v66[7] = v44;
    [(CNSharedProfileBannerView *)v5 heightAnchor];
    v45 = id v29 = v5;
    [v29 estimatedHeight];
    double v46 = objc_msgSend(v45, "constraintGreaterThanOrEqualToConstant:");
    v66[8] = v46;
    double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:9];
    [v55 activateConstraints:v47];

    [(CNGroupIdentityHeaderViewController *)self setSharedProfileBannerContainerView:v8];
    [(CNGroupIdentityHeaderViewController *)self setSharedProfileBannerView:v29];
  }
  else
  {
    id v27 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];

    if (!v27) {
      return;
    }
    v28 = (void *)MEMORY[0x1E4F28DC8];
    id v29 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];
    v68[0] = v29;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    [v28 activateConstraints:v8];
  }
}

- (BOOL)shouldShowSharedProfileBannerView
{
  char v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:16];

  if (!v5) {
    return 0;
  }
  id v6 = [(CNGroupIdentityHeaderViewController *)self sharedProfileStateOracle];

  if (!v6) {
    return 0;
  }
  id v7 = [(CNGroupIdentityHeaderViewController *)self group];
  id v8 = [v7 contacts];
  uint64_t v9 = [v8 count];

  if (v9 != 1) {
    return 0;
  }
  double v10 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerView];
  int v11 = [v10 isIgnored];

  if (v11)
  {
    double v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "Not showing banner view, user dismissed banner view", v16, 2u);
    }

    return 0;
  }
  double v15 = [(CNGroupIdentityHeaderViewController *)self sharedProfileStateOracle];
  if ([v15 bannerActionTypeForEffectiveState]) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = [(CNGroupIdentityHeaderViewController *)self tappedSharedProfileBannerAction] != 0;
  }

  return v13;
}

- (void)setSharedProfileBannerStyle:(id)a3
{
  v17 = (CNSharedProfileBannerStyle *)a3;
  if (self->_sharedProfileBannerStyle != v17)
  {
    objc_storeStrong((id *)&self->_sharedProfileBannerStyle, a3);
    int v5 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerView];
    [v5 setStyle:v17];

    id v6 = [(CNSharedProfileBannerStyle *)v17 backgroundColor];
    id v7 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];
    [v7 setBackgroundColor:v6];

    id v8 = [(CNSharedProfileBannerStyle *)v17 backgroundVisualEffectView];

    if (v8)
    {
      uint64_t v9 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerView];
      double v10 = [(CNSharedProfileBannerStyle *)v17 backgroundVisualEffectView];
      [v9 addBackgroundVisualEffectView:v10 withCornerRadius:12.0];
    }
    [(CNSharedProfileBannerStyle *)v17 leadingTrailingInset];
    double v12 = v11;
    BOOL v13 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerLeadingConstraint];
    [v13 setConstant:v12];

    [(CNSharedProfileBannerStyle *)v17 leadingTrailingInset];
    double v15 = -v14;
    double v16 = [(CNGroupIdentityHeaderViewController *)self sharedProfileBannerContainerTrailingConstraint];
    [v16 setConstant:v15];
  }
}

- (void)setSharedProfileStateOracle:(id)a3
{
  int v5 = (CNSharedProfileStateOracle *)a3;
  if (self->_sharedProfileStateOracle != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
    [(CNGroupIdentityHeaderViewController *)self setupSharedProfileBannerView];
    id v6 = [(CNGroupIdentityHeaderViewController *)self view];
    [v6 setNeedsUpdateConstraints];

    int v5 = v7;
  }
}

- (void)setMediaContextBadge:(id)a3
{
  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
  id v5 = a3;
  id v6 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v6 setMediaContextBadge:v5];
}

- (void)setShouldShowContactBusy:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldShowContactBusy = a3;
  id v4 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v4 setIsDoNotDisturb:v3];
}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isMarkedForSyndication = a3;
  id v4 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v4 setIsMarkedForSyndication:v3];
}

- (void)setAvatarBadgeStyleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_avatarBadgeStyleSettings, a3);
  id v5 = a3;
  id v6 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v6 setBadgeStyleSettings:v5];
}

- (void)setAvatarBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_avatarBadgeImage, a3);
  id v5 = a3;
  id v6 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v6 setBadgeImage:v5];
}

- (void)setupCustomSubtitleLabel
{
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self customSubtitleLabel];

  if (v3)
  {
    id v5 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
    id v4 = [(CNGroupIdentityHeaderViewController *)self customSubtitleLabel];
    [v5 addArrangedSubview:v4];
  }
}

- (void)setCustomSubtitleLabel:(id)a3
{
  id v5 = (UILabel *)a3;
  customSubtitleLabel = self->_customSubtitleLabel;
  if (customSubtitleLabel != v5)
  {
    id v7 = v5;
    [(UILabel *)customSubtitleLabel removeFromSuperview];
    objc_storeStrong((id *)&self->_customSubtitleLabel, a3);
    [(CNGroupIdentityHeaderViewController *)self setupCustomSubtitleLabel];
    id v5 = v7;
  }
}

- (void)didTapActionButton
{
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNGroupIdentityHeaderViewController *)self delegate];
    [v5 headerViewControllerDidTapActionButton:self];
  }
}

- (BOOL)groupContactIsSameAsCurrentContact:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contacts];
  if ([v5 count] == 1)
  {
    id v6 = [(CNGroupIdentityHeaderViewController *)self group];
    id v7 = [v6 contacts];
    uint64_t v8 = [v7 count];

    if (v8 != 1)
    {
      char v15 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = [(CNGroupIdentityHeaderViewController *)self group];
    double v10 = [v9 contacts];
    id v5 = [v10 firstObject];

    double v11 = [v4 contacts];
    double v12 = [v11 firstObject];

    BOOL v13 = [v5 identifier];
    double v14 = [v12 identifier];
    char v15 = [v13 isEqualToString:v14];
  }
  else
  {
    char v15 = 0;
  }

LABEL_7:
  return v15;
}

- (void)groupIdentityDidUpdate:(id)a3
{
  id v4 = a3;
  if (![(CNGroupIdentityHeaderViewController *)self groupContactIsSameAsCurrentContact:v4])
  {
    [(CNGroupIdentityHeaderViewController *)self setTappedSharedProfileBannerAction:0];
    [(CNGroupIdentityHeaderViewController *)self setHasPerformedSharedProfileBannerAnimation:0];
    [(CNGroupIdentityHeaderViewController *)self setSharedProfileStateOracle:0];
  }
  [(CNGroupIdentityHeaderViewController *)self setGroup:v4];
  id v5 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  id v6 = [(CNGroupIdentityHeaderViewController *)self sharedProfileStateOracle];
  [v5 setSharedProfileStateOracle:v6];

  id v7 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [v7 groupIdentityDidUpdate:v4];

  [(CNGroupIdentityHeaderViewController *)self updateTitleLabel];
  id v8 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
  [v8 setGroup:v4];
}

- (void)updateGroupWithContact:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNGroupIdentityHeaderViewController *)self group];
  id v6 = (void *)[v5 copy];

  v8[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [v6 updateContacts:v7];
  [(CNGroupIdentityHeaderViewController *)self groupIdentityDidUpdate:v6];
}

- (void)setShouldShowStaticKeyBadge:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[CNStaticIdentityBadgeView sealLockImage];
    id v5 = [(CNGroupIdentityHeaderViewController *)self staticIdentityBadge];
    [v5 setImage:v4];

    id v6 = [(CNGroupIdentityHeaderViewController *)self titleBadgeStackView];
    id v7 = [(CNGroupIdentityHeaderViewController *)self staticIdentityBadge];
    [v6 addArrangedSubview:v7];

    id v8 = (void *)MEMORY[0x1E4F28DC8];
    id v12 = [(CNGroupIdentityHeaderViewController *)self horizontalTitleLabelConstraints];
    objc_msgSend(v8, "deactivateConstraints:");
  }
  else
  {
    uint64_t v9 = [(CNGroupIdentityHeaderViewController *)self staticIdentityBadge];
    [v9 setImage:0];

    double v10 = [(CNGroupIdentityHeaderViewController *)self staticIdentityBadge];
    [v10 removeFromSuperview];

    double v11 = (void *)MEMORY[0x1E4F28DC8];
    id v12 = [(CNGroupIdentityHeaderViewController *)self horizontalTitleLabelConstraints];
    objc_msgSend(v11, "activateConstraints:");
  }
}

- (void)setShouldHideTitleLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    id v7 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
    [v7 setHidden:v3];
  }
}

- (BOOL)shouldUseTitleLabelWrappedFontGivenBoundingRect:(CGRect)a3
{
  double height = a3.size.height;
  id v4 = [(CNGroupIdentityHeaderViewController *)self titleLabelFont];
  [v4 lineHeight];
  BOOL v6 = ceil(height / v5) > 1.0;

  return v6;
}

- (CGRect)titleLabelBoundingRectForFont:(id)a3 text:(id)a4 maxWidth:(double)a5 context:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v26 = *MEMORY[0x1E4FB06F8];
  v27[0] = a3;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [v9 dictionaryWithObjects:v27 forKeys:&v26 count:1];

  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 33, v13, v10, a5, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)updateTitleLabelFont
{
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

  if (v5 == v8 && v7 == v9)
  {
    id v11 = [(CNGroupIdentityHeaderViewController *)self view];
    [v11 bounds];
  }
  else
  {
    id v11 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
    [v11 frame];
  }
  double v13 = v12;

  double v14 = [(CNGroupIdentityHeaderViewController *)self titleLabelFont];
  double v15 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  double v16 = [v15 text];
  [(CNGroupIdentityHeaderViewController *)self titleLabelBoundingRectForFont:v14 text:v16 maxWidth:0 context:v13];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  id v30 = [(CNGroupIdentityHeaderViewController *)self titleLabelFont];
  if (-[CNGroupIdentityHeaderViewController shouldUseTitleLabelWrappedFontGivenBoundingRect:](self, "shouldUseTitleLabelWrappedFontGivenBoundingRect:", v18, v20, v22, v24))
  {
    uint64_t v25 = [(CNGroupIdentityHeaderViewController *)self titleLabelWrappedFont];

    id v30 = (id)v25;
  }
  uint64_t v26 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  id v27 = [v26 font];

  v28 = v30;
  if (v27 != v30)
  {
    id v29 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
    [v29 setFont:v30];

    v28 = v30;
  }
}

- (void)updateTitleLabel
{
  id v17 = [(CNGroupIdentityHeaderViewController *)self displayNameForGroupIdentity];
  if (!v17)
  {
    v2 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
    BOOL v3 = [v2 text];
    if (!v3)
    {
      int v7 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  double v5 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  double v6 = [v5 text];
  int v7 = [v17 isEqual:v6] ^ 1;

  if (!v17) {
    goto LABEL_6;
  }
LABEL_7:
  double v8 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  [v8 setText:v17];

  if (v7)
  {
    double v9 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);

    if (v11 != v14 || v13 != v15) {
      [(CNGroupIdentityHeaderViewController *)self updateTitleLabelFont];
    }
  }
}

- (void)updateActionButton
{
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self shouldShowActionButton];
  double v4 = [(CNGroupIdentityHeaderViewController *)self actionButtonZeroHeightConstraint];
  double v5 = v4;
  if (v3)
  {
    uint64_t v6 = 0;
  }
  else
  {

    if (!v5)
    {
      int v7 = [(CNGroupIdentityHeaderViewController *)self actionButton];
      double v8 = [v7 heightAnchor];
      double v9 = [v8 constraintEqualToConstant:0.0];
      [(CNGroupIdentityHeaderViewController *)self setActionButtonZeroHeightConstraint:v9];
    }
    double v4 = [(CNGroupIdentityHeaderViewController *)self actionButtonZeroHeightConstraint];
    double v5 = v4;
    uint64_t v6 = 1;
  }
  [v4 setActive:v6];

  id v11 = [(CNGroupIdentityHeaderViewController *)self actionButton];
  double v10 = [(CNGroupIdentityHeaderViewController *)self actionButtonTitle];
  [v11 setTitle:v10 forState:0];
}

- (BOOL)shouldShowActionButton
{
  uint64_t v2 = *MEMORY[0x1E4F5A2A0];
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self actionButtonTitle];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v2;
}

- (void)setActionButtonTitle:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_actionButtonTitle != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_actionButtonTitle, a3);
    [(CNGroupIdentityHeaderViewController *)self updateActionButton];
    double v5 = v6;
  }
}

- (void)setupPopulatedActionsView
{
  v61[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [CNGroupIdentityInlineActionsViewController alloc];
  double v4 = [(CNGroupIdentityHeaderViewController *)self group];
  double v5 = [(CNGroupIdentityHeaderViewController *)self actionsViewConfiguration];
  uint64_t v6 = [(CNGroupIdentityInlineActionsViewController *)v3 initWithGroupIdentity:v4 actionsViewConfiguration:v5];

  [(CNGroupIdentityInlineActionsViewController *)v6 setDelegate:self];
  int v7 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = [(CNGroupIdentityHeaderViewController *)self view];
  [v8 bounds];
  -[CNGroupIdentityInlineActionsViewController actionsViewHeightThatFits:](v6, "actionsViewHeightThatFits:", v9, v10);
  double v12 = v11;

  [(CNGroupIdentityHeaderViewController *)self addChildViewController:v6];
  double v13 = [(CNGroupIdentityHeaderViewController *)self view];
  double v14 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  [v13 addSubview:v14];

  [(CNGroupIdentityInlineActionsViewController *)v6 didMoveToParentViewController:self];
  double v15 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  double v16 = [v15 widthAnchor];
  v60 = [v16 constraintLessThanOrEqualToConstant:454.0];

  LODWORD(v17) = 1148846080;
  [v60 setPriority:v17];
  [(CNGroupIdentityInlineActionsViewController *)v6 style];
  double v18 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  double v19 = [v18 leadingAnchor];
  double v20 = [(CNGroupIdentityHeaderViewController *)self view];
  double v21 = [v20 leadingAnchor];
  double v22 = [v19 constraintGreaterThanOrEqualToAnchor:v21];

  double v23 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  double v24 = [v23 trailingAnchor];
  uint64_t v25 = [(CNGroupIdentityHeaderViewController *)self view];
  uint64_t v26 = [v25 trailingAnchor];
  id v27 = [v24 constraintGreaterThanOrEqualToAnchor:v26];

  v28 = v22;
  v59 = v22;
  LODWORD(v29) = 1144766464;
  [v22 setPriority:v29];
  v58 = v27;
  LODWORD(v30) = 1144766464;
  [v27 setPriority:v30];
  v31 = [(CNGroupIdentityHeaderViewController *)self view];
  [v31 bounds];
  double v32 = 22.0;
  if (v33 > 896.0) {
    double v32 = 20.0;
  }
  [(CNGroupIdentityHeaderViewController *)self setActionsViewTopMargin:v32];

  v34 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  v35 = [v34 topAnchor];
  double v36 = [(CNGroupIdentityHeaderViewController *)self actionButton];
  double v37 = [v36 bottomAnchor];
  [(CNGroupIdentityHeaderViewController *)self actionsViewTopMargin];
  double v38 = objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37);

  LODWORD(v39) = 1148829696;
  uint64_t v57 = v38;
  [v38 setPriority:v39];
  double v40 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  v41 = [v40 bottomAnchor];
  double v42 = [(CNGroupIdentityHeaderViewController *)self view];
  double v43 = [v42 bottomAnchor];
  double v44 = [v41 constraintEqualToAnchor:v43 constant:-5.0];
  [(CNGroupIdentityHeaderViewController *)self setActionsViewBottomConstraint:v44];

  v61[0] = v38;
  v61[1] = v28;
  v61[2] = v27;
  v56 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  v55 = [v56 centerXAnchor];
  v45 = [(CNGroupIdentityHeaderViewController *)self view];
  double v46 = [v45 centerXAnchor];
  double v47 = [v55 constraintEqualToAnchor:v46];
  v61[3] = v47;
  double v48 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  double v49 = [v48 heightAnchor];
  long long v50 = [v49 constraintEqualToConstant:v12];
  v61[4] = v50;
  v61[5] = v60;
  long long v51 = [(CNGroupIdentityHeaderViewController *)self actionsViewBottomConstraint];
  v61[6] = v51;
  long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:7];

  long long v53 = [(CNGroupIdentityInlineActionsViewController *)v6 view];
  LODWORD(v54) = 1144750080;
  [v53 setContentHuggingPriority:1 forAxis:v54];

  [MEMORY[0x1E4F28DC8] activateConstraints:v52];
  [(CNGroupIdentityHeaderViewController *)self setActionsViewController:v6];
}

- (void)setupEmptyActionsView
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(CNGroupIdentityHeaderViewController *)self actionButton];
  double v5 = [v4 bottomAnchor];
  uint64_t v6 = [(CNGroupIdentityHeaderViewController *)self view];
  int v7 = [v6 bottomAnchor];
  double v8 = [v5 constraintLessThanOrEqualToAnchor:v7 constant:-5.0];
  v10[0] = v8;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 activateConstraints:v9];
}

- (BOOL)shouldShowActionsView
{
  uint64_t v2 = *MEMORY[0x1E4F5A258];
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self actionsViewConfiguration];
  double v4 = [v3 supportedActionTypes];
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4) ^ 1;

  return v2;
}

- (void)setupActionsView
{
  if ([(CNGroupIdentityHeaderViewController *)self shouldShowActionsView])
  {
    [(CNGroupIdentityHeaderViewController *)self setupPopulatedActionsView];
  }
  else
  {
    [(CNGroupIdentityHeaderViewController *)self setupEmptyActionsView];
  }
}

- (void)updateActionButtonFont
{
  if ([(CNGroupIdentityHeaderViewController *)self preferredContentSizeCategoryIsXL]) {
    +[CNUIFontRepository groupHeaderActionButtonWrappedFont];
  }
  else {
  id v5 = +[CNUIFontRepository groupHeaderActionButtonFont];
  }
  BOOL v3 = [(CNGroupIdentityHeaderViewController *)self actionButton];
  double v4 = [v3 titleLabel];
  [v4 setFont:v5];
}

- (void)setupActionButton
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB14D0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v4, "setContentEdgeInsets:", 1.0, 0.0, 1.0, 0.0);
  id v5 = [(CNGroupIdentityHeaderViewController *)self view];
  uint64_t v6 = [v5 tintColor];
  [v4 setTitleColor:v6 forState:0];

  int v7 = [v4 titleLabel];
  [v7 setAdjustsFontForContentSizeCategory:1];

  double v8 = [v4 titleLabel];
  [v8 setNumberOfLines:2];

  double v9 = [v4 titleLabel];
  [v9 setTextAlignment:1];

  [v4 addTarget:self action:sel_didTapActionButton forControlEvents:64];
  double v10 = [(CNGroupIdentityHeaderViewController *)self view];
  [v10 addSubview:v4];

  id v27 = [v4 topAnchor];
  v28 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  uint64_t v26 = [v28 bottomAnchor];
  uint64_t v25 = [v27 constraintEqualToAnchor:v26 constant:2.0];
  v29[0] = v25;
  double v23 = [v4 leadingAnchor];
  double v24 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  double v22 = [v24 leadingAnchor];
  double v21 = [v23 constraintGreaterThanOrEqualToAnchor:v22];
  v29[1] = v21;
  double v11 = [v4 trailingAnchor];
  double v12 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13];
  v29[2] = v14;
  double v15 = [v4 centerXAnchor];
  double v16 = [(CNGroupIdentityHeaderViewController *)self view];
  double v17 = [v16 centerXAnchor];
  double v18 = [v15 constraintEqualToAnchor:v17];
  v29[3] = v18;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
  LODWORD(v19) = 1148846080;
  [v4 setContentHuggingPriority:1 forAxis:v19];
  [(CNGroupIdentityHeaderViewController *)self setActionButton:v4];
  [(CNGroupIdentityHeaderViewController *)self updateActionButtonFont];
  [(CNGroupIdentityHeaderViewController *)self updateActionButton];
}

- (double)titleLabelBaselineOffset
{
  id v3 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  [v3 frame];
  double v5 = v4;
  uint64_t v6 = [(CNGroupIdentityHeaderViewController *)self titleLabelStackView];
  [v6 frame];
  double v8 = v5 + v7;
  double v9 = [(CNGroupIdentityHeaderViewController *)self titleLabel];
  double v10 = [v9 font];
  [v10 descender];
  double v12 = v8 + v11;

  return v12;
}

- (void)setupTitleLabel
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v3 setAxis:1];
  [v3 setAlignment:3];
  [v3 setDistribution:3];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNGroupIdentityHeaderViewController *)self setTitleLabelStackView:v3];
  id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setNumberOfLines:2];
  [v5 setMinimumScaleFactor:0.8];
  [v5 setAdjustsFontForContentSizeCategory:1];
  uint64_t v6 = [(CNGroupIdentityHeaderViewController *)self titleLabelFont];
  [v5 setFont:v6];

  [v5 setTextAlignment:1];
  [v5 sizeToFit];
  id v7 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v47[0] = v5;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  double v9 = (void *)[v7 initWithArrangedSubviews:v8];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAxis:0];
  [v9 setAlignment:3];
  [v9 setDistribution:0];
  [v9 setSpacing:2.0];
  [(CNGroupIdentityHeaderViewController *)self setTitleBadgeStackView:v9];
  double v44 = v9;
  [v3 addArrangedSubview:v9];
  double v10 = [(CNGroupIdentityHeaderViewController *)self view];
  [v10 addSubview:v3];

  double v11 = [v3 topAnchor];
  double v12 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v13 = [v12 view];
  double v14 = [v13 bottomAnchor];
  double v15 = [v11 constraintEqualToAnchor:v14 constant:-4.0];

  if (![(CNGroupIdentityHeaderViewController *)self preferredContentSizeCategoryIsXL])
  {
    LODWORD(v16) = 1132068864;
    [v15 setPriority:v16];
  }
  double v17 = [v5 leadingAnchor];
  double v18 = [v3 leadingAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  v46[0] = v19;
  double v20 = [v5 trailingAnchor];
  [v3 trailingAnchor];
  v21 = double v42 = v5;
  [v20 constraintEqualToAnchor:v21];
  double v22 = v43 = v15;
  v46[1] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [(CNGroupIdentityHeaderViewController *)self setHorizontalTitleLabelConstraints:v23];

  v45[0] = v15;
  double v40 = [v3 leadingAnchor];
  v41 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v39 = [v41 view];
  double v38 = [v39 leadingAnchor];
  double v24 = [v40 constraintEqualToAnchor:v38];
  v45[1] = v24;
  uint64_t v25 = [v3 trailingAnchor];
  uint64_t v26 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  id v27 = [v26 view];
  v28 = [v27 trailingAnchor];
  double v29 = [v25 constraintEqualToAnchor:v28];
  v45[2] = v29;
  double v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v31 = [(CNGroupIdentityHeaderViewController *)self horizontalTitleLabelConstraints];
  double v37 = [v30 arrayByAddingObjectsFromArray:v31];

  [MEMORY[0x1E4F28DC8] activateConstraints:v37];
  LODWORD(v32) = 1148846080;
  [v3 setContentHuggingPriority:1 forAxis:v32];
  [(CNGroupIdentityHeaderViewController *)self setTitleLabel:v42];
  [(CNGroupIdentityHeaderViewController *)self updateTitleLabel];
  id v33 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  LODWORD(v34) = 1148846080;
  [v33 setContentCompressionResistancePriority:0 forAxis:v34];
  [v33 setAccessibilityIdentifier:@"VerifiedBadge"];
  v35 = CNContactsUIBundle();
  double v36 = [v35 localizedStringForKey:@"GROUP_IDENTITY_HEADER_BADGE_ACCESSIBILITY_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  [v33 setAccessibilityLabel:v36];

  [v33 setIsAccessibilityElement:1];
  [(CNGroupIdentityHeaderViewController *)self setStaticIdentityBadge:v33];
  [(CNGroupIdentityHeaderViewController *)self setupCustomSubtitleLabel];
}

- (BOOL)preferredContentSizeCategoryIsXL
{
  uint64_t v2 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  if (([v2 isEqualToString:*MEMORY[0x1E4FB2788]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x1E4FB2780]] & 1) != 0)
  {
    char v3 = 1;
  }
  else
  {
    char v3 = [v2 isEqualToString:*MEMORY[0x1E4FB2778]];
  }

  return v3;
}

- (UIFont)titleLabelWrappedFont
{
  uint64_t v2 = cn_objectResultWithObjectLock();

  return (UIFont *)v2;
}

id __60__CNGroupIdentityHeaderViewController_titleLabelWrappedFont__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1088);
  if (!v2)
  {
    uint64_t v3 = +[CNUIFontRepository groupHeaderWrappedTitleFont];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 1088);
    *(void *)(v4 + 1088) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1088);
  }

  return v2;
}

- (UIFont)titleLabelFont
{
  uint64_t v2 = cn_objectResultWithObjectLock();

  return (UIFont *)v2;
}

id __53__CNGroupIdentityHeaderViewController_titleLabelFont__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1080);
  if (!v2)
  {
    uint64_t v3 = +[CNUIFontRepository groupHeaderTitleFont];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 1080);
    *(void *)(v4 + 1080) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1080);
  }

  return v2;
}

- (void)setupAvatarView
{
  v40[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  uint64_t v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  [(CNGroupIdentityHeaderViewController *)self addChildViewController:v5];

  uint64_t v6 = [(CNGroupIdentityHeaderViewController *)self view];
  id v7 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v8 = [v7 view];
  [v6 addSubview:v8];

  double v9 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v10 = [v9 view];
  double v11 = [v10 heightAnchor];
  double v39 = [v11 constraintLessThanOrEqualToConstant:106.0];

  LODWORD(v12) = 1148846080;
  [v39 setPriority:v12];
  double v13 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v14 = [v13 view];
  double v15 = [v14 heightAnchor];
  double v16 = [(CNGroupIdentityHeaderViewController *)self view];
  double v17 = [v16 heightAnchor];
  double v38 = [v15 constraintGreaterThanOrEqualToAnchor:v17 multiplier:0.3];

  LODWORD(v18) = 1148829696;
  [v38 setPriority:v18];
  double v37 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v36 = [v37 view];
  double v34 = [v36 topAnchor];
  v35 = [(CNGroupIdentityHeaderViewController *)self view];
  id v33 = [v35 topAnchor];
  double v32 = [v34 constraintEqualToAnchor:v33 constant:5.0];
  v40[0] = v32;
  v31 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v30 = [v31 view];
  double v29 = [v30 leadingAnchor];
  double v19 = [(CNGroupIdentityHeaderViewController *)self view];
  double v20 = [v19 leadingAnchor];
  double v21 = [v29 constraintEqualToAnchor:v20 constant:0.0];
  v40[1] = v21;
  double v22 = [(CNGroupIdentityHeaderViewController *)self groupAvatarViewController];
  double v23 = [v22 view];
  double v24 = [v23 trailingAnchor];
  uint64_t v25 = [(CNGroupIdentityHeaderViewController *)self view];
  uint64_t v26 = [v25 trailingAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26 constant:-0.0];
  v40[2] = v27;
  v40[3] = v38;
  v40[4] = v39;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:5];

  [MEMORY[0x1E4F28DC8] activateConstraints:v28];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  uint64_t v4 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
  [v4 willMoveToParentViewController:0];

  double v5 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
  uint64_t v6 = [v5 view];
  [v6 removeFromSuperview];

  id v7 = [(CNGroupIdentityHeaderViewController *)self actionsViewController];
  [v7 removeFromParentViewController];

  [(CNGroupIdentityHeaderViewController *)self updateActionButtonFont];
  if ([(CNGroupIdentityHeaderViewController *)self shouldShowActionsView]) {
    [(CNGroupIdentityHeaderViewController *)self setupPopulatedActionsView];
  }
  id v8 = [(CNGroupIdentityHeaderViewController *)self view];
  [v8 invalidateIntrinsicContentSize];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CNGroupIdentityHeaderViewController;
  [(CNGroupIdentityHeaderViewController *)&v11 viewDidLayoutSubviews];
  uint64_t v3 = [(CNGroupIdentityHeaderViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(CNGroupIdentityHeaderViewController *)self previousSize];
  if (v9 != v5 || v8 != v7)
  {
    -[CNGroupIdentityHeaderViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
    [(CNGroupIdentityHeaderViewController *)self updateTitleLabelFont];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNGroupIdentityHeaderViewController;
  [(CNGroupIdentityHeaderViewController *)&v3 viewDidLoad];
  [(CNGroupIdentityHeaderViewController *)self setupAvatarView];
  [(CNGroupIdentityHeaderViewController *)self setupTitleLabel];
}

- (void)loadView
{
  objc_super v3 = [CNGroupIdentityHeaderContainerView alloc];
  double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  double v5 = -[CNGroupIdentityHeaderContainerView initWithFrame:](v3, "initWithFrame:");

  [(CNGroupIdentityHeaderContainerView *)v5 setDelegate:self];
  [(CNGroupIdentityHeaderViewController *)self setView:v5];
}

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4 avatarViewControllerSettings:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNGroupIdentityHeaderViewController;
  double v12 = [(CNGroupIdentityHeaderViewController *)&v23 init];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    double v14 = [[CNGroupAvatarViewController alloc] initWithGroup:v9 avatarViewControllerSettings:v11];
    groupAvatarViewController = v13->_groupAvatarViewController;
    v13->_groupAvatarViewController = v14;

    objc_storeStrong((id *)&v13->_actionsViewConfiguration, a4);
    double v16 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = v16;

    [(CNContactFormatter *)v13->_contactFormatter setStyle:1000];
    [(CNContactFormatter *)v13->_contactFormatter setFallbackStyle:-1];
    uint64_t v18 = +[CNSharedProfileBannerStyle defaultStyle];
    sharedProfileBannerStyle = v13->_sharedProfileBannerStyle;
    v13->_sharedProfileBannerStyle = (CNSharedProfileBannerStyle *)v18;

    [(CNGroupIdentityHeaderViewController *)v13 setupActionButton];
    [(CNGroupIdentityHeaderViewController *)v13 setupActionsView];
    [(CNGroupIdentityHeaderViewController *)v13 setupSharedProfileBannerView];
    double v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v13 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

    double v21 = v13;
  }

  return v13;
}

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3 actionsViewConfiguration:(id)a4
{
  return [(CNGroupIdentityHeaderViewController *)self initWithGroupIdentity:a3 actionsViewConfiguration:a4 avatarViewControllerSettings:0];
}

- (CNGroupIdentityHeaderViewController)initWithGroupIdentity:(id)a3
{
  return [(CNGroupIdentityHeaderViewController *)self initWithGroupIdentity:a3 actionsViewConfiguration:0];
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2, &__block_literal_global_18_5524);
  }
  uint64_t v2 = (void *)descriptorForRequiredKeys_cn_once_object_2;

  return v2;
}

void __64__CNGroupIdentityHeaderViewController_descriptorForRequiredKeys__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = +[CNGroupAvatarViewController descriptorForRequiredKeys];
  uint64_t v2 = +[CNGroupIdentityInlineActionsViewController descriptorForRequiredKeys];
  v8[1] = v2;
  objc_super v3 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  void v8[2] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  double v5 = [NSString stringWithUTF8String:"+[CNGroupIdentityHeaderViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v6 = [v0 descriptorWithKeyDescriptors:v4 description:v5];
  double v7 = (void *)descriptorForRequiredKeys_cn_once_object_2;
  descriptorForRequiredKeys_cn_once_object_2 = v6;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_5528);
  }
  uint64_t v2 = (void *)log_cn_once_object_1;

  return v2;
}

void __42__CNGroupIdentityHeaderViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNGroupIdentityHeaderViewController");
  v1 = (void *)log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;
}

@end