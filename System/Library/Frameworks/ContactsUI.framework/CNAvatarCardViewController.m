@interface CNAvatarCardViewController
- (BOOL)actionsReversed;
- (BOOL)bypassActionValidation;
- (BOOL)dismissesBeforePerforming;
- (BOOL)hasHeader;
- (BOOL)headerOnTop;
- (BOOL)isVisible;
- (BOOL)transitioningImageVisible;
- (CGRect)_photoFrameInView:(id)a3;
- (CGRect)transitioningContentFrame;
- (CGRect)transitioningFrame;
- (CGRect)transitioningImageFrame;
- (CNAvatarCardActionListController)actionListController;
- (CNAvatarCardActionListOrbSupport)actionListViewController;
- (CNAvatarCardActionsView)legacyContactActionsView;
- (CNAvatarCardController)cardController;
- (CNAvatarCardViewController)initWithContacts:(id)a3;
- (CNAvatarCardViewControllerDelegate)delegate;
- (CNContactActionsController)actionsController;
- (NSArray)actionCategories;
- (NSArray)verticalConstraints;
- (NSLayoutConstraint)actionsViewControllerHeightConstraint;
- (UIImage)transitioningImage;
- (UIView)actionsListView;
- (UIView)effectView;
- (UIView)headerContainerView;
- (UIView)sourceView;
- (double)borderMargin;
- (id)actionsView;
- (id)cardActionsView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5;
- (id)viewControllerForCardActionsView:(id)a3;
- (void)_updatePreferredSize;
- (void)cardActionsView:(id)a3 didShowActions:(id)a4;
- (void)contactActionsController:(id)a3 didSelectAction:(id)a4;
- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)didAddActionsViewToHierarchy;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissViewControllerForCardActionsView:(id)a3 animated:(BOOL)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)refreshActions;
- (void)setActionCategories:(id)a3;
- (void)setActionsController:(id)a3;
- (void)setActionsListView:(id)a3;
- (void)setActionsReversed:(BOOL)a3;
- (void)setActionsViewControllerHeightConstraint:(id)a3;
- (void)setBorderMargin:(double)a3;
- (void)setBypassActionValidation:(BOOL)a3;
- (void)setCardController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissesBeforePerforming:(BOOL)a3;
- (void)setEffectView:(id)a3;
- (void)setHasHeader:(BOOL)a3;
- (void)setHeaderContainerView:(id)a3;
- (void)setHeaderOnTop:(BOOL)a3;
- (void)setLegacyContactActionsView:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setTransitioningImageVisible:(BOOL)a3;
- (void)setVerticalConstraints:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateActionsControllerHeightConstraint;
- (void)updateActionsViewBackgroundColor;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAddActionsViewToHierarchy;
@end

@implementation CNAvatarCardViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsListView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_verticalConstraints, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_actionsViewControllerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_legacyContactActionsView, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_cardController);
}

- (void)setActionsListView:(id)a3
{
}

- (UIView)actionsListView
{
  return self->_actionsListView;
}

- (void)setHeaderContainerView:(id)a3
{
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setBorderMargin:(double)a3
{
  self->_borderMargin = a3;
}

- (double)borderMargin
{
  return self->_borderMargin;
}

- (void)setVerticalConstraints:(id)a3
{
}

- (NSArray)verticalConstraints
{
  return self->_verticalConstraints;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)effectView
{
  return self->_effectView;
}

- (void)setActionsViewControllerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionsViewControllerHeightConstraint
{
  return self->_actionsViewControllerHeightConstraint;
}

- (void)setActionsController:(id)a3
{
}

- (CNContactActionsController)actionsController
{
  return self->_actionsController;
}

- (void)setLegacyContactActionsView:(id)a3
{
}

- (CNAvatarCardActionsView)legacyContactActionsView
{
  return self->_legacyContactActionsView;
}

- (void)setSourceView:(id)a3
{
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (BOOL)headerOnTop
{
  return self->_headerOnTop;
}

- (void)setHasHeader:(BOOL)a3
{
  self->_hasHeader = a3;
}

- (BOOL)hasHeader
{
  return self->_hasHeader;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setDelegate:(id)a3
{
}

- (CNAvatarCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAvatarCardViewControllerDelegate *)WeakRetained;
}

- (void)setCardController:(id)a3
{
}

- (CNAvatarCardController)cardController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardController);

  return (CNAvatarCardController *)WeakRetained;
}

- (void)contactActionsController:(id)a3 didUpdateWithMenu:(id)a4
{
  id v5 = a4;
  id v6 = [(CNAvatarCardViewController *)self cardController];
  [v6 updateWithMenuItems:v5];
}

- (void)contactActionsController:(id)a3 didSelectAction:(id)a4
{
  id v5 = a4;
  [(CNAvatarCardViewController *)self dismissAnimated:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  v7 = [v5 performActionWithContext:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke;
  v12[3] = &unk_1E549A500;
  id v8 = v5;
  id v13 = v8;
  [v7 addSuccessBlock:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke_2;
  v10[3] = &unk_1E5499BC8;
  id v11 = v8;
  id v9 = v8;
  [v7 addFailureBlock:v10];
}

void __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke(uint64_t a1)
{
}

void __71__CNAvatarCardViewController_contactActionsController_didSelectAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (BOOL)transitioningImageVisible
{
  v2 = [(CNAvatarCardViewController *)self cardController];
  v3 = [v2 headerView];
  v4 = [v3 photoView];
  char v5 = [v4 isHidden] ^ 1;

  return v5;
}

- (void)setTransitioningImageVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v6 = [(CNAvatarCardViewController *)self cardController];
  v4 = [v6 headerView];
  char v5 = [v4 photoView];
  [v5 setHidden:v3];
}

- (CGRect)transitioningImageFrame
{
  BOOL v3 = [(CNAvatarCardViewController *)self cardController];
  v4 = [v3 headerView];
  char v5 = [v4 photoView];
  id v6 = [v5 avatarView];

  [v6 contentImageFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(CNAvatarCardViewController *)self transitioningView];
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (UIImage)transitioningImage
{
  v2 = [(CNAvatarCardViewController *)self cardController];
  BOOL v3 = [v2 headerView];
  v4 = [v3 photoView];
  char v5 = [v4 avatarView];
  id v6 = [v5 contentImage];

  return (UIImage *)v6;
}

- (CGRect)transitioningContentFrame
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(CNAvatarCardViewController *)self actionsView];
  double v13 = [(CNAvatarCardViewController *)self transitioningView];
  objc_msgSend(v12, "convertRect:toView:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)transitioningFrame
{
  BOOL v3 = [(CNAvatarCardViewController *)self cardController];
  double v4 = [v3 headerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = [(CNAvatarCardViewController *)self view];
  [v11 bounds];
  double Width = CGRectGetWidth(v28);

  double v13 = [(CNAvatarCardViewController *)self transitioningView];
  double v14 = [(CNAvatarCardViewController *)self cardController];
  double v15 = [v14 headerView];
  objc_msgSend(v13, "convertRect:fromView:", v15, v6, v8, Width, v10);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    double v5 = [(CNAvatarCardViewController *)self view];
    [v5 setHidden:1];
  }
  double v6 = [(CNAvatarCardViewController *)self cardController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CNAvatarCardViewController_dismissAnimated___block_invoke;
  v7[3] = &unk_1E549B488;
  v7[4] = self;
  [v6 dismissAnimated:v3 completionHandler:v7];
}

void __46__CNAvatarCardViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setHidden:0];
}

- (void)dismissViewControllerForCardActionsView:(id)a3 animated:(BOOL)a4
{
}

- (id)viewControllerForCardActionsView:(id)a3
{
  if ([(CNAvatarCardViewController *)self dismissesBeforePerforming])
  {
    double v4 = [(CNAvatarCardViewController *)self cardController];
    double v5 = [v4 delegate];
    double v6 = [(CNAvatarCardViewController *)self cardController];
    double v7 = [v5 presentingViewControllerForAvatarCardController:v6];
  }
  else
  {
    double v7 = self;
  }

  return v7;
}

- (void)cardActionsView:(id)a3 didShowActions:(id)a4
{
  [(CNAvatarCardViewController *)self _updatePreferredSize];
  id v5 = [(CNAvatarCardViewController *)self presentationController];
  [v5 systemLayoutFittingSizeDidChangeForChildContentContainer:self];
}

- (id)cardActionsView:(id)a3 orderedPropertiesForProperties:(id)a4 category:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [(CNAvatarCardViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(CNAvatarCardViewController *)self delegate];
    double v12 = [v11 cardViewController:self orderedPropertiesForProperties:v7 category:v8];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)refreshActions
{
  id v2 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v2 refreshActions];
}

- (void)_updatePreferredSize
{
  BOOL v3 = [(CNAvatarCardViewController *)self view];
  [v3 frame];
  double Width = CGRectGetWidth(v22);

  id v5 = [(CNAvatarCardViewController *)self view];
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v6, v7);
  double v9 = v8;

  char v10 = [(CNAvatarCardViewController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [(CNAvatarCardViewController *)self view];
  objc_msgSend(v17, "setFrame:", v12, v14, v16, v9);

  -[CNAvatarCardViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v9);
  double v18 = [(CNAvatarCardViewController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    id v20 = [(CNAvatarCardViewController *)self delegate];
    [v20 cardViewControllerDidUpdatePreferredSize:self];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCardViewController;
  id v4 = a3;
  [(CNAvatarCardViewController *)&v7 preferredContentSizeDidChangeForChildContentContainer:v4];
  id v5 = [(CNAvatarCardViewController *)self actionsController];
  id v6 = [v5 viewController];

  if (v6 == v4)
  {
    [(CNAvatarCardViewController *)self updateActionsControllerHeightConstraint];
    [(CNAvatarCardViewController *)self _updatePreferredSize];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v5 viewDidDisappear:a3];
  [(CNAvatarCardViewController *)self setVisible:0];
  id v4 = [(CNAvatarCardViewController *)self actionsController];
  [v4 cancelModels];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(CNAvatarCardViewController *)self actionListViewController];
  [v4 stopTrackingRollover];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v7 viewDidAppear:a3];
  id v4 = [(CNAvatarCardViewController *)self actionListViewController];
  objc_super v5 = [(CNAvatarCardViewController *)self cardController];
  id v6 = [v5 rolloverGestureRecognizer];
  [v4 startTrackingRolloverWithGestureRecognizer:v6];
}

- (void)updateActionsViewBackgroundColor
{
  if (UIAccessibilityIsReduceTransparencyEnabled()
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 userInterfaceIdiom],
        v3,
        (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1))
  {
    uint64_t v5 = +[CNUIColorRepository quickActionBackgroundColorReducedTransparency];
  }
  else
  {
    uint64_t v5 = +[CNUIColorRepository quickActionBackgroundColorRegular];
  }
  id v7 = (id)v5;
  id v6 = [(CNAvatarCardViewController *)self actionsView];
  [v6 setBackgroundColor:v7];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v4 traitCollectionDidChange:a3];
  [(CNAvatarCardViewController *)self updateActionsViewBackgroundColor];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v5 viewWillAppear:a3];
  [(CNAvatarCardViewController *)self setVisible:1];
  [(CNAvatarCardViewController *)self _updatePreferredSize];
  objc_super v4 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v4 reset];
}

- (void)updateActionsControllerHeightConstraint
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];
  objc_super v4 = [v3 viewController];
  [v4 preferredContentSize];
  double v6 = v5;

  id v7 = [(CNAvatarCardViewController *)self actionsViewControllerHeightConstraint];
  [v7 setConstant:v6];
}

- (void)didAddActionsViewToHierarchy
{
  v21[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];

  if (v3)
  {
    objc_super v4 = [(CNAvatarCardViewController *)self actionsController];
    double v5 = [v4 viewController];
    [v5 didMoveToParentViewController:self];

    double v6 = [(CNAvatarCardViewController *)self actionsViewControllerHeightConstraint];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F28DC8];
      double v8 = [(CNAvatarCardViewController *)self actionsViewControllerHeightConstraint];
      v21[0] = v8;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v7 deactivateConstraints:v9];
    }
    char v10 = (void *)MEMORY[0x1E4F28DC8];
    double v11 = [(CNAvatarCardViewController *)self actionsController];
    double v12 = [v11 viewController];
    double v13 = [v12 view];
    double v14 = [v10 constraintWithItem:v13 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    [(CNAvatarCardViewController *)self setActionsViewControllerHeightConstraint:v14];

    double v15 = [(CNAvatarCardViewController *)self actionsViewControllerHeightConstraint];
    LODWORD(v16) = 1144750080;
    [v15 setPriority:v16];

    [(CNAvatarCardViewController *)self updateActionsControllerHeightConstraint];
    double v17 = (void *)MEMORY[0x1E4F28DC8];
    double v18 = [(CNAvatarCardViewController *)self actionsViewControllerHeightConstraint];
    id v20 = v18;
    char v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v17 activateConstraints:v19];
  }
}

- (void)willAddActionsViewToHierarchy
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];

  if (v3)
  {
    id v5 = [(CNAvatarCardViewController *)self actionsController];
    objc_super v4 = [v5 viewController];
    [(CNAvatarCardViewController *)self addChildViewController:v4];
  }
}

- (CNAvatarCardActionListController)actionListController
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];

  if (v3) {
    [(CNAvatarCardViewController *)self actionsController];
  }
  else {
  objc_super v4 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  }

  return (CNAvatarCardActionListController *)v4;
}

- (CNAvatarCardActionListOrbSupport)actionListViewController
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];

  if (v3)
  {
    objc_super v4 = [(CNAvatarCardViewController *)self actionsController];
    id v5 = [v4 displayedController];
  }
  else
  {
    id v5 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  }

  return (CNAvatarCardActionListOrbSupport *)v5;
}

- (id)actionsView
{
  BOOL v3 = [(CNAvatarCardViewController *)self actionsController];

  if (v3)
  {
    objc_super v4 = [(CNAvatarCardViewController *)self actionsController];
    id v5 = [v4 displayedController];
    double v6 = [v5 view];
  }
  else
  {
    double v6 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  }

  return v6;
}

- (BOOL)bypassActionValidation
{
  id v2 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  char v3 = [v2 bypassActionValidation];

  return v3;
}

- (void)setBypassActionValidation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v4 setBypassActionValidation:v3];
}

- (NSArray)actionCategories
{
  id v2 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  BOOL v3 = [v2 actionCategories];

  return (NSArray *)v3;
}

- (void)setActionCategories:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v5 setActionCategories:v4];
}

- (CGRect)_photoFrameInView:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAvatarCardViewController *)self cardController];
  double v6 = [v5 headerView];
  id v7 = [v6 photoView];

  [v7 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)dismissesBeforePerforming
{
  id v2 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  char v3 = [v2 dismissesBeforePerforming];

  return v3;
}

- (void)setDismissesBeforePerforming:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v4 setDismissesBeforePerforming:v3];
}

- (BOOL)actionsReversed
{
  id v2 = [(CNAvatarCardViewController *)self actionListController];
  char v3 = [v2 actionsReversed];

  return v3;
}

- (void)setActionsReversed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CNAvatarCardViewController *)self actionListController];
  [v4 setActionsReversed:v3];
}

- (void)setHeaderOnTop:(BOOL)a3
{
  if (self->_headerOnTop != a3)
  {
    self->_headerOnTop = a3;
    id v3 = [(CNAvatarCardViewController *)self view];
    [v3 setNeedsUpdateConstraints];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  id v4 = [(CNAvatarCardViewController *)self cardController];
  id v5 = [v4 headerView];
  [v5 updateFontSizes];

  id v6 = [(CNAvatarCardViewController *)self legacyContactActionsView];
  [v6 reset];
}

- (void)updateViewConstraints
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v15 updateViewConstraints];
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(CNAvatarCardViewController *)self verticalConstraints];
  [v3 deactivateConstraints:v4];

  if ([(CNAvatarCardViewController *)self hasHeader])
  {
    v18[0] = @"headerContainerView";
    id v5 = [(CNAvatarCardViewController *)self headerContainerView];
    v19[0] = v5;
    v18[1] = @"actionsView";
    id v6 = [(CNAvatarCardViewController *)self actionsView];
    v19[1] = v6;
    v18[2] = @"effectView";
    id v7 = [(CNAvatarCardViewController *)self effectView];
    v19[2] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    if ([(CNAvatarCardViewController *)self headerOnTop]) {
      double v9 = @"V:|[headerContainerView]-8-[effectView]|";
    }
    else {
      double v9 = @"V:|[effectView]-8-[headerContainerView]|";
    }
    double v10 = (void *)MEMORY[0x1E4F28DC8];
  }
  else
  {
    double v16 = @"effectView";
    double v11 = [(CNAvatarCardViewController *)self effectView];
    double v17 = v11;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    double v10 = (void *)MEMORY[0x1E4F28DC8];
    double v9 = @"V:|[effectView]|";
  }
  double v12 = [v10 constraintsWithVisualFormat:v9 options:0 metrics:0 views:v8];
  [(CNAvatarCardViewController *)self setVerticalConstraints:v12];

  double v13 = (void *)MEMORY[0x1E4F28DC8];
  double v14 = [(CNAvatarCardViewController *)self verticalConstraints];
  [v13 activateConstraints:v14];
}

- (void)viewDidLoad
{
  v68[6] = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v64 viewDidLoad];
  id v3 = [(CNAvatarCardViewController *)self view];
  [v3 setBackgroundColor:0];
  [(CNAvatarCardViewController *)self willAddActionsViewToHierarchy];
  id v4 = 0;
  id v5 = 0;
  if ([(CNAvatarCardViewController *)self hasHeader])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v6 = +[CNUIColorRepository contactStyleDefaultBackgroundColor];
    [v5 setBackgroundColor:v6];

    id v7 = [v5 layer];
    [v7 setCornerRadius:13.0];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v5];
    [(CNAvatarCardViewController *)self setHeaderContainerView:v5];
    double v8 = [(CNAvatarCardViewController *)self cardController];
    id v4 = [v8 headerView];

    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:v4];
  }
  double v9 = [(CNAvatarCardViewController *)self actionsView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v10 = [v9 layer];
  [v10 setCornerRadius:13.0];

  v60 = v9;
  [v9 setClipsToBounds:1];
  [(CNAvatarCardViewController *)self updateActionsViewBackgroundColor];
  id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v16 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], v13, v14, v15);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v12, v13, v14, v15);
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 addSubview:v17];
  double v18 = [(CNAvatarCardViewController *)self actionsView];
  [v17 addSubview:v18];

  double v19 = [(CNAvatarCardViewController *)self actionsView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  [v3 addSubview:v16];
  [(CNAvatarCardViewController *)self didAddActionsViewToHierarchy];
  [(CNAvatarCardViewController *)self setEffectView:v16];
  [(CNAvatarCardViewController *)self setActionsListView:v16];
  id v20 = [MEMORY[0x1E4F1CA48] array];
  v62 = v5;
  v63 = v3;
  v61 = v4;
  v59 = v17;
  if (v5 && v4)
  {
    v67[0] = @"headerContainerView";
    v67[1] = @"headerView";
    v68[0] = v5;
    v68[1] = v4;
    v67[2] = @"actionsView";
    double v21 = [(CNAvatarCardViewController *)self actionsView];
    v68[2] = v21;
    v68[3] = v16;
    v67[3] = @"effectView";
    v67[4] = @"vibrancyView";
    v67[5] = @"view";
    v68[4] = v17;
    v68[5] = v3;
    CGRect v22 = (void *)MEMORY[0x1E4F1C9E8];
    double v23 = v68;
    double v24 = v67;
    uint64_t v25 = 6;
  }
  else
  {
    v65[0] = @"actionsView";
    double v21 = [(CNAvatarCardViewController *)self actionsView];
    v66[0] = v21;
    v66[1] = v16;
    v65[1] = @"effectView";
    v65[2] = @"vibrancyView";
    v65[3] = @"view";
    v66[2] = v17;
    v66[3] = v3;
    CGRect v22 = (void *)MEMORY[0x1E4F1C9E8];
    double v23 = v66;
    double v24 = v65;
    uint64_t v25 = 4;
  }
  double v26 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];

  if ([(CNAvatarCardViewController *)self hasHeader])
  {
    double v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-0-[headerView]-(margin)-|" options:0 metrics:&unk_1ED915CD8 views:v26];
    [v20 addObjectsFromArray:v27];

    CGRect v28 = [(CNAvatarCardViewController *)self headerContainerView];
    v29 = [v28 leftAnchor];
    v30 = [(CNAvatarCardViewController *)self view];
    v31 = [v30 safeAreaLayoutGuide];
    v32 = [v31 leftAnchor];
    [(CNAvatarCardViewController *)self borderMargin];
    v33 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v32);
    [v20 addObject:v33];

    v34 = [(CNAvatarCardViewController *)self headerContainerView];
    v35 = [v34 rightAnchor];
    v36 = [(CNAvatarCardViewController *)self view];
    v37 = [v36 safeAreaLayoutGuide];
    v38 = [v37 rightAnchor];
    [(CNAvatarCardViewController *)self borderMargin];
    v40 = [v35 constraintEqualToAnchor:v38 constant:-v39];
    [v20 addObject:v40];

    v41 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[headerView]|" options:0 metrics:&unk_1ED915CD8 views:v26];
    [v20 addObjectsFromArray:v41];
  }
  v42 = [(CNAvatarCardViewController *)self effectView];
  v43 = [v42 leftAnchor];
  v44 = [(CNAvatarCardViewController *)self view];
  v45 = [v44 safeAreaLayoutGuide];
  v46 = [v45 leftAnchor];
  [(CNAvatarCardViewController *)self borderMargin];
  v47 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", v46);
  [v20 addObject:v47];

  v48 = [(CNAvatarCardViewController *)self effectView];
  v49 = [v48 rightAnchor];
  v50 = [(CNAvatarCardViewController *)self view];
  v51 = [v50 safeAreaLayoutGuide];
  v52 = [v51 rightAnchor];
  [(CNAvatarCardViewController *)self borderMargin];
  v54 = [v49 constraintEqualToAnchor:v52 constant:-v53];
  [v20 addObject:v54];

  v55 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[vibrancyView]-0-|" options:0 metrics:&unk_1ED915CD8 views:v26];
  [v20 addObjectsFromArray:v55];

  v56 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-0-[vibrancyView]-0-|" options:0 metrics:&unk_1ED915CD8 views:v26];
  [v20 addObjectsFromArray:v56];

  v57 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-0-[actionsView]-0-|" options:0 metrics:&unk_1ED915CD8 views:v26];
  [v20 addObjectsFromArray:v57];

  v58 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-0-[actionsView]-0-|" options:0 metrics:&unk_1ED915CD8 views:v26];
  [v20 addObjectsFromArray:v58];

  [MEMORY[0x1E4F28DC8] activateConstraints:v20];
  [v63 setNeedsUpdateConstraints];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNAvatarCardViewController;
  [(CNAvatarCardViewController *)&v4 dealloc];
}

- (CNAvatarCardViewController)initWithContacts:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNAvatarCardViewController;
  id v5 = [(CNAvatarCardViewController *)&v16 initWithNibName:0 bundle:0];
  if ((unint64_t)[v4 count] > 1) {
    goto LABEL_5;
  }
  id v6 = [v4 firstObject];
  if ([v6 isUnknown])
  {

LABEL_5:
    double v9 = [CNAvatarCardActionsView alloc];
    double v10 = -[CNAvatarCardActionsView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CNAvatarCardActionsView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNAvatarCardActionsView *)v10 setDelegate:v5];
    [(CNAvatarCardActionsView *)v10 setContacts:v4];
    [(CNAvatarCardViewController *)v5 setLegacyContactActionsView:v10];
    goto LABEL_6;
  }
  id v7 = [v4 firstObject];
  int v8 = [v7 isSuggestedMe];

  if (v8) {
    goto LABEL_5;
  }
  if ([v4 count] != 1) {
    goto LABEL_7;
  }
  double v13 = [CNContactActionsController alloc];
  double v14 = [v4 firstObject];
  double v15 = +[CNContactActionsController supportedActionTypes];
  double v10 = [(CNContactActionsController *)v13 initWithContact:v14 actionTypes:v15];

  [(CNAvatarCardActionsView *)v10 setDisplayMenuIconAtTopLevel:1];
  [(CNAvatarCardActionsView *)v10 setDelegate:v5];
  [(CNAvatarCardViewController *)v5 setActionsController:v10];
LABEL_6:

LABEL_7:
  [(CNAvatarCardViewController *)v5 setBorderMargin:10.0];
  [(CNAvatarCardViewController *)v5 setModalPresentationStyle:4];
  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v5 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  return v5;
}

@end