@interface CNPhotoPickerNavigationViewController
- (BOOL)allowRotation;
- (BOOL)disablingRotation;
- (BOOL)isDisplayingTrapView;
- (BOOL)isShowingKeyboard;
- (BOOL)shouldDisplayTrapOverlayView;
- (CGSize)previousSize;
- (CNPhotoPickerNavigationViewController)initWithRootViewController:(id)a3;
- (CNPhotoPickerTrapView)trapOverlayView;
- (NSArray)trapOverlayConstraints;
- (unint64_t)supportedInterfaceOrientations;
- (void)beginDisablingAutorotation;
- (void)dealloc;
- (void)endDisablingAutorotation;
- (void)endDisablingAutorotationIfNeeded;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)setAllowRotation:(BOOL)a3;
- (void)setDisablingRotation:(BOOL)a3;
- (void)setIsShowingKeyboard:(BOOL)a3;
- (void)setPreviousSize:(CGSize)a3;
- (void)setTrapOverlayConstraints:(id)a3;
- (void)setTrapOverlayView:(id)a3;
- (void)setupTrapOverlayView;
- (void)updateTrapOverlayViewIfNecessaryWithCoordinator:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNPhotoPickerNavigationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trapOverlayConstraints, 0);

  objc_storeStrong((id *)&self->_trapOverlayView, 0);
}

- (void)setIsShowingKeyboard:(BOOL)a3
{
  self->_isShowingKeyboard = a3;
}

- (BOOL)isShowingKeyboard
{
  return self->_isShowingKeyboard;
}

- (void)setDisablingRotation:(BOOL)a3
{
  self->_disablingRotation = a3;
}

- (BOOL)disablingRotation
{
  return self->_disablingRotation;
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

- (void)setTrapOverlayConstraints:(id)a3
{
}

- (NSArray)trapOverlayConstraints
{
  return self->_trapOverlayConstraints;
}

- (void)setTrapOverlayView:(id)a3
{
}

- (CNPhotoPickerTrapView)trapOverlayView
{
  return self->_trapOverlayView;
}

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)updateTrapOverlayViewIfNecessaryWithCoordinator:(id)a3
{
  if (a3)
  {
    v4[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke;
    v5[3] = &unk_1E5498AF8;
    v5[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_3;
    v4[3] = &unk_1E5498AF8;
    [a3 animateAlongsideTransition:v5 completion:v4];
  }
  else
  {
    [(CNPhotoPickerNavigationViewController *)self setupTrapOverlayView];
  }
}

void __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldDisplayTrapOverlayView])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_2;
    v6[3] = &unk_1E549B488;
    v6[4] = *(void *)(a1 + 32);
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    v2 = [*(id *)(a1 + 32) trapOverlayView];
    uint64_t v3 = [v2 label];
    [v3 setAlpha:1.0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) trapOverlayView];
    v4 = [v5 label];
    [v4 setAlpha:0.0];
  }
}

uint64_t __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupTrapOverlayView];
}

void __89__CNPhotoPickerNavigationViewController_updateTrapOverlayViewIfNecessaryWithCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setupTrapOverlayView];
  id v3 = [*(id *)(a1 + 32) trapOverlayView];
  v2 = [v3 label];
  [v2 setAlpha:0.0];
}

- (void)setupTrapOverlayView
{
  v43[4] = *MEMORY[0x1E4F143B8];
  if ([(CNPhotoPickerNavigationViewController *)self shouldDisplayTrapOverlayView])
  {
    id v3 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];

    if (v3)
    {
      v4 = [(CNPhotoPickerNavigationViewController *)self view];
      [(CNPhotoPickerTrapView *)v4 bringSubviewToFront:self->_trapOverlayView];
    }
    else
    {
      v10 = [CNPhotoPickerTrapView alloc];
      v4 = -[CNPhotoPickerTrapView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v11 = +[CNUIColorRepository photoPickerBackgroundColor];
      [(CNPhotoPickerTrapView *)v4 setBackgroundColor:v11];

      v12 = +[CNUIColorRepository photoPickerTrapViewMessageTextColor];
      v13 = [(CNPhotoPickerTrapView *)v4 label];
      [v13 setTextColor:v12];

      [(CNPhotoPickerTrapView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      v14 = [(CNPhotoPickerNavigationViewController *)self view];
      [v14 addSubview:v4];

      v41 = [(CNPhotoPickerTrapView *)v4 leadingAnchor];
      v42 = [(CNPhotoPickerNavigationViewController *)self view];
      v40 = [v42 leadingAnchor];
      v39 = [v41 constraintEqualToAnchor:v40];
      v43[0] = v39;
      v37 = [(CNPhotoPickerTrapView *)v4 trailingAnchor];
      v38 = [(CNPhotoPickerNavigationViewController *)self view];
      v36 = [v38 trailingAnchor];
      v35 = [v37 constraintEqualToAnchor:v36];
      v43[1] = v35;
      v33 = [(CNPhotoPickerTrapView *)v4 topAnchor];
      v34 = [(CNPhotoPickerNavigationViewController *)self view];
      v15 = [v34 safeAreaLayoutGuide];
      v16 = [v15 topAnchor];
      v17 = [v33 constraintEqualToAnchor:v16];
      v43[2] = v17;
      v18 = [(CNPhotoPickerTrapView *)v4 bottomAnchor];
      v19 = [(CNPhotoPickerNavigationViewController *)self view];
      v20 = [v19 bottomAnchor];
      v21 = [v18 constraintEqualToAnchor:v20];
      v43[3] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
      [(CNPhotoPickerNavigationViewController *)self setTrapOverlayConstraints:v22];

      v23 = (void *)MEMORY[0x1E4F28DC8];
      v24 = [(CNPhotoPickerNavigationViewController *)self trapOverlayConstraints];
      [v23 activateConstraints:v24];

      [(CNPhotoPickerNavigationViewController *)self setTrapOverlayView:v4];
    }

    unint64_t v25 = [(CNPhotoPickerNavigationViewController *)self interfaceOrientation] - 3;
    v26 = CNContactsUIBundle();
    v27 = v26;
    if (v25 > 1) {
      v28 = @"PHOTO_TRAP_VIEW_MESSAGE";
    }
    else {
      v28 = @"PHOTO_TRAP_VIEW_LANDSCAPE_MESSAGE";
    }
    v29 = [v26 localizedStringForKey:v28 value:&stru_1ED8AC728 table:@"Localized"];
    v30 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];
    v31 = [v30 label];
    [v31 setText:v29];

    v32 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];
    [v32 layoutIfNeeded];
  }
  else
  {
    id v5 = [(CNPhotoPickerNavigationViewController *)self trapOverlayConstraints];

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E4F28DC8];
      v7 = [(CNPhotoPickerNavigationViewController *)self trapOverlayConstraints];
      [v6 deactivateConstraints:v7];

      [(CNPhotoPickerNavigationViewController *)self setTrapOverlayConstraints:0];
    }
    v8 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];

    if (v8)
    {
      v9 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];
      [v9 removeFromSuperview];

      [(CNPhotoPickerNavigationViewController *)self setTrapOverlayView:0];
    }
  }
}

- (BOOL)isDisplayingTrapView
{
  v2 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldDisplayTrapOverlayView
{
  if ([(CNPhotoPickerNavigationViewController *)self allowRotation])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = [(CNPhotoPickerNavigationViewController *)self view];
    id v5 = [(CNPhotoPickerNavigationViewController *)self traitCollection];
    if (+[CNVisualIdentityPickerViewController canShowPhotoPickerForView:v4 withTraitCollection:v5])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      BOOL v3 = ![(CNPhotoPickerNavigationViewController *)self isShowingKeyboard];
    }
  }
  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)CNPhotoPickerNavigationViewController;
  id v7 = a4;
  -[CNPhotoPickerNavigationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CNPhotoPickerNavigationViewController setPreviousSize:](self, "setPreviousSize:", width, height, v8.receiver, v8.super_class);
  [(CNPhotoPickerNavigationViewController *)self updateTrapOverlayViewIfNecessaryWithCoordinator:v7];
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CNPhotoPickerNavigationViewController;
  [(CNPhotoPickerNavigationViewController *)&v11 viewWillLayoutSubviews];
  BOOL v3 = [(CNPhotoPickerNavigationViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  if (self->_previousSize.width == v5 && self->_previousSize.height == v7)
  {
    v9 = [(CNPhotoPickerNavigationViewController *)self trapOverlayView];
    BOOL v10 = v9 == 0;

    if ((v10 ^ [(CNPhotoPickerNavigationViewController *)self shouldDisplayTrapOverlayView]))return; {
  }
    }
  else
  {
    -[CNPhotoPickerNavigationViewController setPreviousSize:](self, "setPreviousSize:", v5, v7);
  }
  [(CNPhotoPickerNavigationViewController *)self updateTrapOverlayViewIfNecessaryWithCoordinator:0];
}

- (void)keyboardWillHide:(id)a3
{
}

- (void)keyboardWillShow:(id)a3
{
}

- (void)beginDisablingAutorotation
{
  [(CNPhotoPickerNavigationViewController *)self setDisablingRotation:1];

  [(CNPhotoPickerNavigationViewController *)self _beginDisablingInterfaceAutorotation];
}

- (void)endDisablingAutorotation
{
  [(CNPhotoPickerNavigationViewController *)self setDisablingRotation:0];

  [(CNPhotoPickerNavigationViewController *)self _endDisablingInterfaceAutorotation];
}

- (void)endDisablingAutorotationIfNeeded
{
  if ([(CNPhotoPickerNavigationViewController *)self disablingRotation])
  {
    [(CNPhotoPickerNavigationViewController *)self endDisablingAutorotation];
  }
}

- (void)setAllowRotation:(BOOL)a3
{
  if (self->_allowRotation != a3)
  {
    self->_allowRotation = a3;
    [(CNPhotoPickerNavigationViewController *)self updateTrapOverlayViewIfNecessaryWithCoordinator:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerNavigationViewController;
  [(CNPhotoPickerNavigationViewController *)&v5 viewWillDisappear:a3];
  if ([(CNPhotoPickerNavigationViewController *)self disablingRotation]
    && [(CNPhotoPickerNavigationViewController *)self _isInterfaceAutorotationDisabled])
  {
    double v4 = [(CNPhotoPickerNavigationViewController *)self presentedViewController];

    if (!v4) {
      [(CNPhotoPickerNavigationViewController *)self endDisablingAutorotation];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CNPhotoPickerNavigationViewController;
  [(CNPhotoPickerNavigationViewController *)&v14 viewDidAppear:a3];
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    if ([(CNPhotoPickerNavigationViewController *)self disablingRotation])
    {
      double v6 = [(CNPhotoPickerNavigationViewController *)self view];
      double v7 = [v6 window];
      objc_super v8 = [v7 windowScene];
      if ((unint64_t)([v8 interfaceOrientation] - 3) > 1)
      {
      }
      else
      {
        int v9 = [(CNPhotoPickerNavigationViewController *)self _isInterfaceAutorotationDisabled];

        if (v9) {
          [(CNPhotoPickerNavigationViewController *)self endDisablingAutorotation];
        }
      }
    }
    else if (![(CNPhotoPickerNavigationViewController *)self allowRotation])
    {
      BOOL v10 = [(CNPhotoPickerNavigationViewController *)self view];
      objc_super v11 = [v10 window];
      v12 = [v11 windowScene];
      uint64_t v13 = [v12 interfaceOrientation];

      if (v13 == 1) {
        [(CNPhotoPickerNavigationViewController *)self beginDisablingAutorotation];
      }
    }
  }
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPhotoPickerNavigationViewController;
  [(CNPhotoPickerNavigationViewController *)&v4 dealloc];
}

- (CNPhotoPickerNavigationViewController)initWithRootViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNPhotoPickerNavigationViewController;
  BOOL v3 = [(CNPhotoPickerNavigationViewController *)&v9 initWithRootViewController:a3];
  objc_super v4 = v3;
  if (v3)
  {
    v3->_previousSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v3->_disablingRotation = 0;
    v3->_isShowingKeyboard = 0;
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

    double v7 = v4;
  }

  return v4;
}

@end