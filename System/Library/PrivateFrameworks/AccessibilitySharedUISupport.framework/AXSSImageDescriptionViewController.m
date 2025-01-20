@interface AXSSImageDescriptionViewController
- (AXSSImageDescriptionViewController)initWithContentSnapshot:(id)a3;
- (AXSSImageDescriptionViewControllerDelegate)delegate;
- (AXSSImagePreviewViewController)imagePreviewController;
- (AXSSScrollViewEnclosedTextView)textView;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasChanges;
- (BOOL)_hasFormView;
- (BOOL)isSavingOrCancelling;
- (BOOL)isUIReady;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (CGSize)preferredContentSize;
- (NSLayoutConstraint)textBackgroundViewBottomConstraint;
- (NSLayoutConstraint)textBackgroundViewFixedTopConstraint;
- (NSLayoutConstraint)textScrollViewBottomConstraint;
- (NSLayoutConstraint)textScrollViewExpandingHeightConstraint;
- (NSLayoutConstraint)textScrollViewFixedHeightConstraint;
- (NSString)imageDescription;
- (UIColor)contentBackgroundColor;
- (UINavigationBar)navBar;
- (UIScrollView)textScrollView;
- (UIView)contentBackgroundView;
- (UIView)contentSnapshot;
- (UIView)textBackgroundView;
- (double)_textViewMaxHeight;
- (id)_modifiedImageDescription;
- (int64_t)positionForBar:(id)a3;
- (void)_adjustViewToKeyboardFrame:(id)a3;
- (void)_hideKeyboard;
- (void)_imageDescriptionViewControllerSetupConstraints;
- (void)_imageDescriptionViewControllerSetupUI;
- (void)_layoutContentBackground;
- (void)_layoutImagePreview;
- (void)_scrollTextViewCaretToVisibleRegion;
- (void)_updateTextScrollViewConstraints;
- (void)cancelChanges:(id)a3;
- (void)imagePreviewShouldExpand:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)saveChanges:(id)a3;
- (void)setContentBackgroundColor:(id)a3;
- (void)setContentBackgroundView:(id)a3;
- (void)setContentSnapshot:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageDescription:(id)a3;
- (void)setImagePreviewController:(id)a3;
- (void)setIsSavingOrCancelling:(BOOL)a3;
- (void)setIsUIReady:(BOOL)a3;
- (void)setNavBar:(id)a3;
- (void)setTextBackgroundView:(id)a3;
- (void)setTextBackgroundViewBottomConstraint:(id)a3;
- (void)setTextBackgroundViewFixedTopConstraint:(id)a3;
- (void)setTextScrollView:(id)a3;
- (void)setTextScrollViewBottomConstraint:(id)a3;
- (void)setTextScrollViewExpandingHeightConstraint:(id)a3;
- (void)setTextScrollViewFixedHeightConstraint:(id)a3;
- (void)setTextView:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AXSSImageDescriptionViewController

- (AXSSImageDescriptionViewController)initWithContentSnapshot:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXSSImageDescriptionViewController;
  v6 = [(AXSSImageDescriptionViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentSnapshot, a3);
    uint64_t v8 = [MEMORY[0x263F825C8] blackColor];
    contentBackgroundColor = v7->_contentBackgroundColor;
    v7->_contentBackgroundColor = (UIColor *)v8;
  }
  return v7;
}

- (void)setContentSnapshot:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_contentSnapshot != v5)
  {
    objc_storeStrong((id *)&self->_contentSnapshot, a3);
    if ([(AXSSImageDescriptionViewController *)self isUIReady])
    {
      v6 = [(AXSSImageDescriptionViewController *)self imagePreviewController];

      if (v6)
      {
        v7 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
        uint64_t v8 = [v7 view];
        [v8 removeFromSuperview];

        v9 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
        [v9 removeFromParentViewController];

        [(AXSSImageDescriptionViewController *)self setImagePreviewController:0];
      }
      if (v5)
      {
        v10 = [[AXSSImagePreviewViewController alloc] initWithContentSnapshot:v5];
        [(AXSSImagePreviewViewController *)v10 setDelegate:self];
        [(AXSSImageDescriptionViewController *)self addChildViewController:v10];
        objc_super v11 = [(AXSSImageDescriptionViewController *)self view];
        v12 = [(AXSSImagePreviewViewController *)v10 view];
        v13 = [(AXSSImageDescriptionViewController *)self navBar];
        [v11 insertSubview:v12 belowSubview:v13];

        [(AXSSImageDescriptionViewController *)self setImagePreviewController:v10];
      }
      v14 = [(AXSSImageDescriptionViewController *)self view];
      [v14 setNeedsUpdateConstraints];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __57__AXSSImageDescriptionViewController_setContentSnapshot___block_invoke;
      v15[3] = &unk_264855890;
      v15[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:0 delay:v15 options:0 animations:0.18 completion:0.0];
    }
  }
}

void __57__AXSSImageDescriptionViewController_setContentSnapshot___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)setContentBackgroundColor:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
  id v5 = [(AXSSImageDescriptionViewController *)self contentBackgroundView];

  if (v5)
  {
    v6 = [(AXSSImageDescriptionViewController *)self contentBackgroundView];
    [v6 setBackgroundColor:v7];
  }
}

- (void)setImageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_imageDescription, a3);
  id v5 = a3;
  id v6 = [(AXSSImageDescriptionViewController *)self textView];
  [v6 setText:v5];
}

- (void)saveChanges:(id)a3
{
  if (![(AXSSImageDescriptionViewController *)self isSavingOrCancelling])
  {
    [(AXSSImageDescriptionViewController *)self setIsSavingOrCancelling:1];
    v4 = [(AXSSImageDescriptionViewController *)self _modifiedImageDescription];
    [(AXSSImageDescriptionViewController *)self setImageDescription:v4];

    id v5 = [(AXSSImageDescriptionViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 imageDescriptionViewControllerDidSave:self];
    }
    [(AXSSImageDescriptionViewController *)self setIsSavingOrCancelling:0];
  }
}

- (void)cancelChanges:(id)a3
{
  id v4 = a3;
  if (![(AXSSImageDescriptionViewController *)self isSavingOrCancelling])
  {
    [(AXSSImageDescriptionViewController *)self setIsSavingOrCancelling:1];
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke;
    aBlock[3] = &unk_2648558B8;
    objc_copyWeak(&v35, location);
    id v5 = (void (**)(void *, void))_Block_copy(aBlock);
    id v6 = [(AXSSImageDescriptionViewController *)self textView];
    int v7 = [v6 isFirstResponder];

    if (v7)
    {
      uint64_t v8 = [(AXSSImageDescriptionViewController *)self textView];
      [v8 resignFirstResponder];
    }
    if ([(AXSSImageDescriptionViewController *)self _hasChanges])
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_2;
      v31[3] = &unk_2648558E0;
      char v33 = v7;
      objc_copyWeak(&v32, location);
      v28 = _Block_copy(v31);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_3;
      v29[3] = &unk_2648558B8;
      objc_copyWeak(&v30, location);
      v27 = _Block_copy(v29);
      v9 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
      v10 = [(AXSSImageDescriptionViewController *)self navBar];
      objc_super v11 = [v10 items];
      v12 = [v11 objectAtIndexedSubscript:0];
      v13 = [v12 leftBarButtonItem];
      v14 = [v9 popoverPresentationController];
      [v14 setBarButtonItem:v13];

      v15 = (void *)MEMORY[0x263F82400];
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"Cancel" value:&stru_26DD45540 table:@"AccessibilitySharedUISupport"];
      v18 = [v15 actionWithTitle:v17 style:1 handler:v28];
      [v9 addAction:v18];

      v19 = (void *)MEMORY[0x263F82400];
      v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"Discard Changes" value:&stru_26DD45540 table:@"AccessibilitySharedUISupport"];
      v22 = [v19 actionWithTitle:v21 style:2 handler:v5];
      [v9 addAction:v22];

      v23 = (void *)MEMORY[0x263F82400];
      v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v25 = [v24 localizedStringForKey:@"Done" value:&stru_26DD45540 table:@"AccessibilitySharedUISupport"];
      v26 = [v23 actionWithTitle:v25 style:0 handler:v27];
      [v9 addAction:v26];

      [(AXSSImageDescriptionViewController *)self presentViewController:v9 animated:1 completion:0];
      objc_destroyWeak(&v30);

      objc_destroyWeak(&v32);
    }
    else
    {
      v5[2](v5, 0);
    }
    [(AXSSImageDescriptionViewController *)self setIsSavingOrCancelling:0];

    objc_destroyWeak(&v35);
    objc_destroyWeak(location);
  }
}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector()) {
    [v1 imageDescriptionViewControllerDidCancel:WeakRetained];
  }
}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v1 = [WeakRetained textView];
    [v1 becomeFirstResponder];
  }
}

void __52__AXSSImageDescriptionViewController_cancelChanges___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained saveChanges:WeakRetained];
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v6 viewDidLoad];
  [(AXSSImageDescriptionViewController *)self _imageDescriptionViewControllerSetupUI];
  [(AXSSImageDescriptionViewController *)self _imageDescriptionViewControllerSetupConstraints];
  v3 = [(AXSSImageDescriptionViewController *)self presentationController];
  [v3 setDelegate:self];

  v7[0] = objc_opt_class();
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = (id)[(AXSSImageDescriptionViewController *)self registerForTraitChanges:v4 withAction:sel_traitEnvironment_didChangeTraitCollection_];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v9 viewWillAppear:a3];
  uint64_t v4 = [(AXSSImageDescriptionViewController *)self imageDescription];
  id v5 = (void *)v4;
  if (v4) {
    objc_super v6 = (__CFString *)v4;
  }
  else {
    objc_super v6 = &stru_26DD45540;
  }
  int v7 = [(AXSSImageDescriptionViewController *)self textView];
  [v7 setText:v6];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x263F833C0] object:0];
  [v8 addObserver:self selector:sel__adjustViewToKeyboardFrame_ name:*MEMORY[0x263F83800] object:0];
  [v8 addObserver:self selector:sel__adjustViewToKeyboardFrame_ name:*MEMORY[0x263F83808] object:0];
  [v8 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x263F83428] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v11 viewDidAppear:a3];
  uint64_t v4 = [(AXSSImageDescriptionViewController *)self textView];
  int v5 = [v4 canBecomeFirstResponder];

  if (v5)
  {
    objc_super v6 = [(AXSSImageDescriptionViewController *)self textView];
    [v6 becomeFirstResponder];
  }
  int v7 = [(AXSSImageDescriptionViewController *)self textView];
  uint64_t v8 = [v7 text];
  uint64_t v9 = [v8 length];
  v10 = [(AXSSImageDescriptionViewController *)self textView];
  objc_msgSend(v10, "setSelectedRange:", v9, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83428] object:0];
  [v4 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [v4 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v4 removeObserver:self name:*MEMORY[0x263F833C0] object:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXSSImageDescriptionViewController;
  -[AXSSImageDescriptionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  uint64_t v8 = [(AXSSImageDescriptionViewController *)self textView];
  int v9 = [v8 isFirstResponder];

  if (v9)
  {
    v10 = [(AXSSImageDescriptionViewController *)self textScrollViewBottomConstraint];
    [v10 setConstant:-16.0];

    objc_super v11 = [(AXSSImageDescriptionViewController *)self textView];
    [v11 resignFirstResponder];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__AXSSImageDescriptionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v12[3] = &unk_264855908;
    v12[4] = self;
    [v7 animateAlongsideTransition:0 completion:v12];
  }
}

void __89__AXSSImageDescriptionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) textView];
  [v1 becomeFirstResponder];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(AXSSImageDescriptionViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    id v12 = [MEMORY[0x263F825C8] separatorColor];
    uint64_t v9 = [v12 CGColor];
    v10 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
    objc_super v11 = [v10 layer];
    [v11 setBorderColor:v9];
  }
}

- (CGSize)preferredContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v13 preferredContentSize];
  uint64_t v4 = v3;
  double v6 = v5;
  if ([(AXSSImageDescriptionViewController *)self _hasFormView])
  {
    [(AXSSImageDescriptionViewController *)self _textViewMaxHeight];
    double v8 = v7 + 32.0;
    uint64_t v9 = [(AXSSImageDescriptionViewController *)self navBar];
    [v9 bounds];
    double v6 = v8 + CGRectGetHeight(v15);

    *(double *)&uint64_t v4 = 600.0;
  }
  v10 = [(AXSSImageDescriptionViewController *)self view];
  [v10 setNeedsUpdateConstraints];

  double v11 = *(double *)&v4;
  double v12 = v6;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)updateViewConstraints
{
  v14.receiver = self;
  v14.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v14 updateViewConstraints];
  BOOL v3 = [(AXSSImageDescriptionViewController *)self _hasFormView];
  uint64_t v4 = [(AXSSImageDescriptionViewController *)self textScrollViewFixedHeightConstraint];
  double v5 = v4;
  if (v3)
  {
    [v4 setActive:1];

    double v6 = [(AXSSImageDescriptionViewController *)self textScrollViewExpandingHeightConstraint];
    [v6 setActive:1];

    double v7 = [(AXSSImageDescriptionViewController *)self textBackgroundViewFixedTopConstraint];
    double v8 = v7;
    BOOL v9 = 0;
  }
  else
  {
    [v4 setActive:0];

    v10 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
    BOOL v11 = v10 == 0;
    BOOL v12 = v10 != 0;

    objc_super v13 = [(AXSSImageDescriptionViewController *)self textScrollViewExpandingHeightConstraint];
    [v13 setActive:v12];

    double v7 = [(AXSSImageDescriptionViewController *)self textBackgroundViewFixedTopConstraint];
    double v8 = v7;
    BOOL v9 = v11;
  }
  [v7 setActive:v9];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AXSSImageDescriptionViewController;
  [(AXSSImageDescriptionViewController *)&v3 viewDidLayoutSubviews];
  [(AXSSImageDescriptionViewController *)self _layoutImagePreview];
  [(AXSSImageDescriptionViewController *)self _layoutContentBackground];
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return ![(AXSSImageDescriptionViewController *)self _hasChanges];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(AXSSImageDescriptionViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 imageDescriptionViewControllerDidDismiss:self];
  }
}

- (void)imagePreviewShouldExpand:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSImageDescriptionViewController *)self imagePreviewController];

  if (v5 == v4)
  {
    [(AXSSImageDescriptionViewController *)self _hideKeyboard];
  }
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSImageDescriptionViewController *)self textView];

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__AXSSImageDescriptionViewController_textViewDidChange___block_invoke;
    v6[3] = &unk_264855890;
    v6[4] = self;
    [MEMORY[0x263F158F8] setCompletionBlock:v6];
  }
}

uint64_t __56__AXSSImageDescriptionViewController_textViewDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollTextViewCaretToVisibleRegion];
}

- (void)_adjustViewToKeyboardFrame:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];

  if (v5)
  {
    double v6 = -16.0;
    if (![(AXSSImageDescriptionViewController *)self _hasFormView])
    {
      double v7 = [v4 userInfo];
      double v8 = [v7 objectForKey:*MEMORY[0x263F837B8]];
      [v8 CGRectValue];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      v17 = [(AXSSImageDescriptionViewController *)self view];
      v18 = [v17 window];
      objc_msgSend(v18, "convertRect:fromView:", 0, v10, v12, v14, v16);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v27 = [(AXSSImageDescriptionViewController *)self view];
      v28 = [v27 window];
      v29 = [(AXSSImageDescriptionViewController *)self view];
      [v29 frame];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      v38 = [(AXSSImageDescriptionViewController *)self view];
      objc_msgSend(v28, "convertRect:fromView:", v38, v31, v33, v35, v37);
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;

      v62.origin.CGFloat x = v40;
      double v6 = -16.0;
      v62.origin.CGFloat y = v42;
      v62.size.CGFloat width = v44;
      v62.size.CGFloat height = v46;
      v65.origin.CGFloat x = v20;
      v65.origin.CGFloat y = v22;
      v65.size.CGFloat width = v24;
      v65.size.CGFloat height = v26;
      CGRect v63 = CGRectIntersection(v62, v65);
      CGFloat x = v63.origin.x;
      CGFloat y = v63.origin.y;
      CGFloat width = v63.size.width;
      CGFloat height = v63.size.height;
      if (!CGRectIsNull(v63))
      {
        v64.origin.CGFloat x = x;
        v64.origin.CGFloat y = y;
        v64.size.CGFloat width = width;
        v64.size.CGFloat height = height;
        double v6 = -16.0 - CGRectGetHeight(v64);
      }
    }
    v51 = [(AXSSImageDescriptionViewController *)self textScrollViewBottomConstraint];
    [v51 constant];
    double v53 = v52;

    if (v53 != v6)
    {
      v54 = [v4 userInfo];
      v55 = [v54 objectForKeyedSubscript:*MEMORY[0x263F83780]];
      [v55 floatValue];
      double v57 = v56;

      v58 = [v4 userInfo];
      v59 = [v58 objectForKey:*MEMORY[0x263F83778]];
      uint64_t v60 = [v59 integerValue];

      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __65__AXSSImageDescriptionViewController__adjustViewToKeyboardFrame___block_invoke;
      v61[3] = &unk_264855930;
      v61[4] = self;
      *(double *)&v61[5] = v6;
      [MEMORY[0x263F82E00] animateWithDuration:v60 << 16 delay:v61 options:0 animations:v57 completion:0.0];
    }
  }
}

void __65__AXSSImageDescriptionViewController__adjustViewToKeyboardFrame___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  objc_super v3 = [*(id *)(a1 + 32) textScrollViewBottomConstraint];
  [v3 setConstant:v2];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 layoutIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_modifiedImageDescription
{
  double v2 = [(AXSSImageDescriptionViewController *)self textView];
  objc_super v3 = [v2 text];
  id v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (v5) {
    double v6 = v5;
  }
  else {
    double v6 = &stru_26DD45540;
  }
  double v7 = v6;

  return v7;
}

- (BOOL)_hasFormView
{
  double v2 = [(AXSSImageDescriptionViewController *)self presentationController];
  objc_super v3 = [v2 traitCollection];

  BOOL v4 = [v3 horizontalSizeClass] == 2 && objc_msgSend(v3, "verticalSizeClass") == 2;
  return v4;
}

- (BOOL)_hasChanges
{
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self imageDescription];
  BOOL v4 = (void *)v3;
  id v5 = &stru_26DD45540;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  double v6 = v5;

  double v7 = [(AXSSImageDescriptionViewController *)self _modifiedImageDescription];
  char v8 = [(__CFString *)v6 isEqualToString:v7];

  return v8 ^ 1;
}

- (void)_hideKeyboard
{
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self textView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    id v5 = [(AXSSImageDescriptionViewController *)self textView];
    [v5 resignFirstResponder];
  }
}

- (void)_updateTextScrollViewConstraints
{
  [(AXSSImageDescriptionViewController *)self _textViewMaxHeight];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __70__AXSSImageDescriptionViewController__updateTextScrollViewConstraints__block_invoke;
  v4[3] = &unk_264855930;
  v4[4] = self;
  v4[5] = v3;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 options:0 animations:0.18 completion:0.0];
}

void __70__AXSSImageDescriptionViewController__updateTextScrollViewConstraints__block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) textScrollViewExpandingHeightConstraint];
  [v3 setConstant:v2];

  double v4 = *(double *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) textScrollViewFixedHeightConstraint];
  [v5 setConstant:v4];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

- (double)_textViewMaxHeight
{
  uint64_t v3 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v3 lineHeight];
  double v5 = v4;
  [v3 leading];
  double v7 = v5 + v6;
  char v8 = [(AXSSImageDescriptionViewController *)self textView];
  [v8 textContainerInset];
  double v10 = v9 + v7 * 4.5;
  double v11 = [(AXSSImageDescriptionViewController *)self textView];
  [v11 textContainerInset];
  double v13 = v10 + v12;

  return ceil(v13);
}

- (void)_layoutImagePreview
{
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self imagePreviewController];

  if (v3)
  {
    double v4 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
    [v4 frame];
    double MinY = CGRectGetMinY(v15);

    double v6 = [(AXSSImageDescriptionViewController *)self view];
    [v6 frame];
    double Width = CGRectGetWidth(v16);

    char v8 = [(AXSSImageDescriptionViewController *)self navBar];
    [v8 bounds];
    double v10 = v9;
    double v11 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
    objc_msgSend(v11, "setEdgeInsets:", v10, 0.0, 0.0, 0.0);

    id v13 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
    double v12 = [v13 view];
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, Width, fmax(MinY, 0.0));
  }
}

- (void)_layoutContentBackground
{
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self contentBackgroundView];

  if (v3)
  {
    double v4 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
    [v4 frame];
    double MinY = CGRectGetMinY(v13);

    double v6 = fmax(MinY, 0.0);
    double v7 = [(AXSSImageDescriptionViewController *)self view];
    [v7 frame];
    double Width = CGRectGetWidth(v14);

    double v9 = [(AXSSImageDescriptionViewController *)self navBar];
    [v9 bounds];
    double Height = CGRectGetHeight(v15);

    id v11 = [(AXSSImageDescriptionViewController *)self contentBackgroundView];
    objc_msgSend(v11, "setFrame:", 0.0, Height, Width, fmax(v6 - Height, 0.0));
  }
}

- (void)_imageDescriptionViewControllerSetupUI
{
  v52[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self contentBackgroundView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82E00]);
    double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(AXSSImageDescriptionViewController *)self contentBackgroundColor];
    [v5 setBackgroundColor:v6];

    double v7 = [(AXSSImageDescriptionViewController *)self view];
    [v7 insertSubview:v5 atIndex:0];

    [(AXSSImageDescriptionViewController *)self setContentBackgroundView:v5];
  }
  char v8 = [(AXSSImageDescriptionViewController *)self navBar];

  if (!v8)
  {
    id v9 = objc_alloc(MEMORY[0x263F829A0]);
    double v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setDelegate:self];
    id v11 = objc_alloc(MEMORY[0x263F829C8]);
    double v12 = [(AXSSImageDescriptionViewController *)self title];
    CGRect v13 = (void *)[v11 initWithTitle:v12];

    CGRect v14 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_saveChanges_];
    [v13 setRightBarButtonItem:v14];

    CGRect v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelChanges_];
    [v13 setLeftBarButtonItem:v15];

    v52[0] = v13;
    CGRect v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
    [v10 setItems:v16];

    [v10 updateConstraintsIfNeeded];
    v17 = [(AXSSImageDescriptionViewController *)self view];
    [v17 addSubview:v10];

    [(AXSSImageDescriptionViewController *)self setNavBar:v10];
  }
  v18 = [(AXSSImageDescriptionViewController *)self imagePreviewController];
  if (!v18)
  {
    double v19 = [(AXSSImageDescriptionViewController *)self contentSnapshot];

    if (!v19) {
      goto LABEL_9;
    }
    CGFloat v20 = [AXSSImagePreviewViewController alloc];
    double v21 = [(AXSSImageDescriptionViewController *)self contentSnapshot];
    v18 = [(AXSSImagePreviewViewController *)v20 initWithContentSnapshot:v21];

    [(AXSSImagePreviewViewController *)v18 setDelegate:self];
    [(AXSSImageDescriptionViewController *)self addChildViewController:v18];
    CGFloat v22 = [(AXSSImageDescriptionViewController *)self view];
    double v23 = [(AXSSImagePreviewViewController *)v18 view];
    CGFloat v24 = [(AXSSImageDescriptionViewController *)self navBar];
    [v22 insertSubview:v23 belowSubview:v24];

    [(AXSSImageDescriptionViewController *)self setImagePreviewController:v18];
  }

LABEL_9:
  double v25 = [(AXSSImageDescriptionViewController *)self textBackgroundView];

  if (!v25)
  {
    id v26 = objc_alloc(MEMORY[0x263F82E00]);
    v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v28 = [MEMORY[0x263F825C8] separatorColor];
    uint64_t v29 = [v28 CGColor];
    double v30 = [v27 layer];
    [v30 setBorderColor:v29];

    double v31 = [v27 layer];
    [v31 setBorderWidth:1.0];

    double v32 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v27 setBackgroundColor:v32];

    double v33 = [(AXSSImageDescriptionViewController *)self view];
    [v33 addSubview:v27];

    [(AXSSImageDescriptionViewController *)self setTextBackgroundView:v27];
  }
  double v34 = [(AXSSImageDescriptionViewController *)self textScrollView];

  if (!v34)
  {
    id v35 = objc_alloc(MEMORY[0x263F82B88]);
    double v36 = objc_msgSend(v35, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v37 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
    [v37 addSubview:v36];

    [(AXSSImageDescriptionViewController *)self setTextScrollView:v36];
  }
  v38 = [(AXSSImageDescriptionViewController *)self textView];

  if (!v38)
  {
    double v39 = [AXSSScrollViewEnclosedTextView alloc];
    CGFloat v40 = -[AXSSScrollViewEnclosedTextView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(AXSSScrollViewEnclosedTextView *)v40 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AXSSScrollViewEnclosedTextView *)v40 setAdjustsFontForContentSizeCategory:1];
    double v41 = [MEMORY[0x263F825C8] clearColor];
    [(AXSSScrollViewEnclosedTextView *)v40 setBackgroundColor:v41];

    -[AXSSScrollViewEnclosedTextView setTextContainerInset:](v40, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    CGFloat v42 = [MEMORY[0x263F825C8] labelColor];
    [(AXSSScrollViewEnclosedTextView *)v40 setTextColor:v42];

    double v43 = (void *)MEMORY[0x263F81708];
    uint64_t v44 = *MEMORY[0x263F83570];
    double v45 = [MEMORY[0x263F82DA0] currentTraitCollection];
    CGFloat v46 = [v43 preferredFontForTextStyle:v44 compatibleWithTraitCollection:v45];
    [(AXSSScrollViewEnclosedTextView *)v40 setFont:v46];

    [(AXSSScrollViewEnclosedTextView *)v40 setScrollEnabled:0];
    [(AXSSScrollViewEnclosedTextView *)v40 setDelegate:self];
    id v47 = objc_alloc(MEMORY[0x263F086A0]);
    v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v49 = [v48 localizedStringForKey:@"Add Image Description" value:&stru_26DD45540 table:@"AccessibilitySharedUISupport"];
    v50 = (void *)[v47 initWithString:v49];
    [(AXSSScrollViewEnclosedTextView *)v40 setAttributedPlaceholder:v50];

    v51 = [(AXSSImageDescriptionViewController *)self textScrollView];
    [v51 addSubview:v40];

    [(AXSSImageDescriptionViewController *)self setTextView:v40];
  }
  [(AXSSImageDescriptionViewController *)self setIsUIReady:1];
}

- (void)_imageDescriptionViewControllerSetupConstraints
{
  v89[10] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self textView];
  id v4 = [v3 heightAnchor];
  double v5 = [(AXSSImageDescriptionViewController *)self textScrollView];
  double v6 = [v5 heightAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];

  LODWORD(v8) = 1144733696;
  [v7 setPriority:v8];
  id v9 = [(AXSSImageDescriptionViewController *)self textScrollViewExpandingHeightConstraint];

  if (!v9)
  {
    double v10 = [(AXSSImageDescriptionViewController *)self textScrollView];
    id v11 = [v10 heightAnchor];
    double v12 = [v11 constraintLessThanOrEqualToConstant:0.0];
    [(AXSSImageDescriptionViewController *)self setTextScrollViewExpandingHeightConstraint:v12];

    CGRect v13 = [(AXSSImageDescriptionViewController *)self textScrollViewExpandingHeightConstraint];
    LODWORD(v14) = 1148829696;
    [v13 setPriority:v14];
  }
  CGRect v15 = [(AXSSImageDescriptionViewController *)self textBackgroundViewFixedTopConstraint];

  if (!v15)
  {
    CGRect v16 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
    v17 = [v16 topAnchor];
    v18 = [(AXSSImageDescriptionViewController *)self navBar];
    double v19 = [v18 bottomAnchor];
    CGFloat v20 = [v17 constraintEqualToAnchor:v19];
    [(AXSSImageDescriptionViewController *)self setTextBackgroundViewFixedTopConstraint:v20];
  }
  double v21 = [(AXSSImageDescriptionViewController *)self textScrollViewFixedHeightConstraint];

  if (!v21)
  {
    CGFloat v22 = [(AXSSImageDescriptionViewController *)self textScrollView];
    double v23 = [v22 heightAnchor];
    CGFloat v24 = [v23 constraintEqualToConstant:0.0];
    [(AXSSImageDescriptionViewController *)self setTextScrollViewFixedHeightConstraint:v24];
  }
  double v25 = [(AXSSImageDescriptionViewController *)self textScrollViewBottomConstraint];

  if (!v25)
  {
    id v26 = [(AXSSImageDescriptionViewController *)self textScrollView];
    v27 = [v26 bottomAnchor];
    id v28 = [(AXSSImageDescriptionViewController *)self view];
    uint64_t v29 = [v28 bottomAnchor];
    double v30 = [v27 constraintEqualToAnchor:v29 constant:-16.0];

    LODWORD(v31) = 1148829696;
    [v30 setPriority:v31];
    [(AXSSImageDescriptionViewController *)self setTextScrollViewBottomConstraint:v30];
  }
  [(AXSSImageDescriptionViewController *)self _updateTextScrollViewConstraints];
  id v65 = objc_alloc(MEMORY[0x263EFF980]);
  v88 = [(AXSSImageDescriptionViewController *)self navBar];
  v86 = [v88 topAnchor];
  v87 = [(AXSSImageDescriptionViewController *)self view];
  v85 = [v87 safeAreaLayoutGuide];
  v84 = [v85 topAnchor];
  v83 = [v86 constraintEqualToAnchor:v84];
  v89[0] = v83;
  v82 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
  v80 = [v82 topAnchor];
  v81 = [(AXSSImageDescriptionViewController *)self view];
  v79 = [v81 safeAreaLayoutGuide];
  v78 = [v79 topAnchor];
  v77 = [v80 constraintGreaterThanOrEqualToAnchor:v78];
  v89[1] = v77;
  v76 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
  v73 = [v76 bottomAnchor];
  v74 = [(AXSSImageDescriptionViewController *)self view];
  v72 = [v74 bottomAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v89[2] = v71;
  v70 = [(AXSSImageDescriptionViewController *)self textScrollView];
  v67 = [v70 topAnchor];
  v69 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
  v68 = [v69 safeAreaLayoutGuide];
  CGRect v64 = [v68 topAnchor];
  CGRect v63 = [v67 constraintEqualToAnchor:v64 constant:16.0];
  v89[3] = v63;
  CGRect v62 = [(AXSSImageDescriptionViewController *)self textScrollView];
  uint64_t v60 = [v62 leadingAnchor];
  v61 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
  v59 = [v61 safeAreaLayoutGuide];
  v58 = [v59 leadingAnchor];
  double v57 = [v60 constraintEqualToAnchor:v58 constant:16.0];
  v89[4] = v57;
  float v56 = [(AXSSImageDescriptionViewController *)self textScrollView];
  double v53 = [v56 trailingAnchor];
  v55 = [(AXSSImageDescriptionViewController *)self textBackgroundView];
  v54 = [v55 safeAreaLayoutGuide];
  double v52 = [v54 trailingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:-16.0];
  v89[5] = v51;
  v50 = [(AXSSImageDescriptionViewController *)self textScrollView];
  v48 = [v50 bottomAnchor];
  v49 = [(AXSSImageDescriptionViewController *)self view];
  id v47 = [v49 safeAreaLayoutGuide];
  double v32 = [v47 bottomAnchor];
  double v33 = [v48 constraintLessThanOrEqualToAnchor:v32 constant:-16.0];
  v89[6] = v33;
  double v34 = [(AXSSImageDescriptionViewController *)self textView];
  id v35 = [v34 widthAnchor];
  double v36 = [(AXSSImageDescriptionViewController *)self textScrollView];
  double v37 = [v36 widthAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  v89[7] = v38;
  double v39 = [(AXSSImageDescriptionViewController *)self textScrollViewBottomConstraint];
  v89[8] = v39;
  v89[9] = v7;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:10];
  CGFloat v40 = v75 = v7;
  v66 = (void *)[v65 initWithArray:v40];

  double v41 = _NSDictionaryOfVariableBindings(&cfstr_NavbarTextback.isa, self->_navBar, self->_textBackgroundView, self->_textView, 0);
  CGFloat v42 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_navBar]|" options:0 metrics:0 views:v41];
  [v66 addObjectsFromArray:v42];

  double v43 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_textBackgroundView]|" options:0 metrics:0 views:v41];
  [v66 addObjectsFromArray:v43];

  uint64_t v44 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[_textView]|" options:0 metrics:0 views:v41];
  [v66 addObjectsFromArray:v44];

  double v45 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_textView]|" options:0 metrics:0 views:v41];
  [v66 addObjectsFromArray:v45];

  [MEMORY[0x263F08938] activateConstraints:v66];
  CGFloat v46 = [(AXSSImageDescriptionViewController *)self view];
  [v46 layoutIfNeeded];
}

- (void)_scrollTextViewCaretToVisibleRegion
{
  uint64_t v3 = [(AXSSImageDescriptionViewController *)self textView];
  id v4 = [(AXSSImageDescriptionViewController *)self textView];
  double v5 = [v4 selectedTextRange];
  double v6 = [v5 start];
  [v3 caretRectForPosition:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v27.origin.CGFloat x = v8;
  v27.origin.CGFloat y = v10;
  v27.size.CGFloat width = v12;
  v27.size.CGFloat height = v14;
  if (!CGRectIsEmpty(v27))
  {
    CGRect v15 = [(AXSSImageDescriptionViewController *)self textScrollView];
    CGRect v16 = [(AXSSImageDescriptionViewController *)self textView];
    objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    id v25 = [(AXSSImageDescriptionViewController *)self textScrollView];
    objc_msgSend(v25, "scrollRectToVisible:animated:", 0, v18, v20, v22, v24);
  }
}

- (NSString)imageDescription
{
  return self->_imageDescription;
}

- (AXSSImageDescriptionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSSImageDescriptionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (AXSSScrollViewEnclosedTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (AXSSImagePreviewViewController)imagePreviewController
{
  return self->_imagePreviewController;
}

- (void)setImagePreviewController:(id)a3
{
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
}

- (UIScrollView)textScrollView
{
  return self->_textScrollView;
}

- (void)setTextScrollView:(id)a3
{
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
}

- (UIView)textBackgroundView
{
  return self->_textBackgroundView;
}

- (void)setTextBackgroundView:(id)a3
{
}

- (NSLayoutConstraint)textBackgroundViewBottomConstraint
{
  return self->_textBackgroundViewBottomConstraint;
}

- (void)setTextBackgroundViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textBackgroundViewFixedTopConstraint
{
  return self->_textBackgroundViewFixedTopConstraint;
}

- (void)setTextBackgroundViewFixedTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)textScrollViewBottomConstraint
{
  return self->_textScrollViewBottomConstraint;
}

- (void)setTextScrollViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textScrollViewExpandingHeightConstraint
{
  return self->_textScrollViewExpandingHeightConstraint;
}

- (void)setTextScrollViewExpandingHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)textScrollViewFixedHeightConstraint
{
  return self->_textScrollViewFixedHeightConstraint;
}

- (void)setTextScrollViewFixedHeightConstraint:(id)a3
{
}

- (BOOL)isSavingOrCancelling
{
  return self->_isSavingOrCancelling;
}

- (void)setIsSavingOrCancelling:(BOOL)a3
{
  self->_isSavingOrCancelling = a3;
}

- (BOOL)isUIReady
{
  return self->_isUIReady;
}

- (void)setIsUIReady:(BOOL)a3
{
  self->_isUIReadCGFloat y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textScrollViewFixedHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textScrollViewExpandingHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundViewFixedTopConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textBackgroundView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_textScrollView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_imagePreviewController, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageDescription, 0);
}

@end