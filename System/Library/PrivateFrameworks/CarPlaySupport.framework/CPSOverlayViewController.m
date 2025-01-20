@interface CPSOverlayViewController
- (BOOL)_needsVisibilityView;
- (BOOL)_useRightHandDriveFocusGuide;
- (BOOL)restoresFocusAfterTransition;
- (BOOL)shouldHideNavigationBarForViewController:(id)a3;
- (BOOL)usePreferredItemOnNextUpdate;
- (UIFocusGuide)rightHandDriveGuide;
- (UIFocusItem)preferredFocusItem;
- (_UINonHostingVisibilityPropagationView)visibilityView;
- (id)_firstFocusProvidingForViewController:(id)a3;
- (id)_linearFocusMovementSequences;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)preferredFocusEnvironments;
- (id)presentedTemplateViewController;
- (id)templates;
- (id)topTemplate;
- (id)viewControllerForTemplate:(id)a3;
- (int)pid;
- (unint64_t)indexOfTemplate:(id)a3;
- (void)_invalidateVisibilityView;
- (void)_resetRightHandDriveGuide;
- (void)_updateVisibilityView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissTemplateAnimated:(BOOL)a3 completion:(id)a4;
- (void)invalidate;
- (void)popTemplateAnimated:(BOOL)a3 completion:(id)a4;
- (void)popToRootTemplateAnimated:(BOOL)a3 completion:(id)a4;
- (void)popToTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentTemplateViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pushTemplateViewController:(id)a3 animated:(BOOL)a4 presentationStyle:(unint64_t)a5 completion:(id)a6;
- (void)setPid:(int)a3;
- (void)setPreferredFocusItem:(id)a3;
- (void)setUsePreferredItemOnNextUpdate:(BOOL)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)setVisibilityView:(id)a3;
- (void)updateVisibilityForPid:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CPSOverlayViewController

- (void)invalidate
{
  [(CPSOverlayViewController *)self _invalidateVisibilityView];
  id v2 = (id)[(CPSOverlayViewController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_0];
}

void __38__CPSOverlayViewController_invalidate__block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7[3] = a3;
  v7[2] = a4;
  v7[1] = a1;
  v7[0] = CPSSafeProtocolCast(&unk_26DF174A8, location[0]);
  [v7[0] invalidate];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSOverlayViewController;
  [(CPSOverlayViewController *)&v3 viewDidAppear:a3];
  [(CPSOverlayViewController *)v6 _updateVisibilityView];
}

- (void)viewDidLoad
{
  v21[4] = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)CPSOverlayViewController;
  [(CPSOverlayViewController *)&v18 viewDidLoad];
  id v17 = (id)[(CPSOverlayViewController *)v20 view];
  id v2 = [_CPSOverlayTouchBlockingView alloc];
  v16 = -[_CPSOverlayTouchBlockingView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(_CPSOverlayTouchBlockingView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_CPSOverlayTouchBlockingView *)v16 setUserInteractionEnabled:1];
  [v17 insertSubview:v16 atIndex:0];
  id v14 = (id)[v17 topAnchor];
  id v13 = (id)[(_CPSOverlayTouchBlockingView *)v16 topAnchor];
  id v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  v21[0] = v12;
  id v11 = (id)[v17 leftAnchor];
  id v10 = (id)[(_CPSOverlayTouchBlockingView *)v16 leftAnchor];
  id v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v21[1] = v9;
  id v8 = (id)[v17 rightAnchor];
  id v7 = (id)[(_CPSOverlayTouchBlockingView *)v16 rightAnchor];
  id v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
  v21[2] = v6;
  id v5 = (id)[v17 bottomAnchor];
  id v4 = (id)[(_CPSOverlayTouchBlockingView *)v16 bottomAnchor];
  id v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v21[3] = v3;
  id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];

  [MEMORY[0x263F08938] activateConstraints:v15];
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
}

- (UIFocusGuide)rightHandDriveGuide
{
  v27[4] = *MEMORY[0x263EF8340];
  if (!self->_rightHandDriveGuide)
  {
    id v2 = (UIFocusGuide *)objc_alloc_init(MEMORY[0x263F1C640]);
    rightHandDriveGuide = self->_rightHandDriveGuide;
    self->_rightHandDriveGuide = v2;

    id v7 = (id)[(CPSOverlayViewController *)self view];
    id v6 = [(CPSOverlayViewController *)self rightHandDriveGuide];
    objc_msgSend(v7, "addLayoutGuide:");

    id v8 = (void *)MEMORY[0x263F08938];
    v25 = [(CPSOverlayViewController *)self rightHandDriveGuide];
    id v24 = (id)[(UIFocusGuide *)v25 rightAnchor];
    id v23 = (id)[(CPSOverlayViewController *)self view];
    id v22 = (id)[v23 rightAnchor];
    id v21 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v27[0] = v21;
    v20 = [(CPSOverlayViewController *)self rightHandDriveGuide];
    id v19 = (id)[(UIFocusGuide *)v20 bottomAnchor];
    id v18 = (id)[(CPSOverlayViewController *)self view];
    id v17 = (id)[v18 bottomAnchor];
    id v16 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
    v27[1] = v16;
    id v15 = [(CPSOverlayViewController *)self rightHandDriveGuide];
    id v14 = (id)[(UIFocusGuide *)v15 heightAnchor];
    id v13 = (id)objc_msgSend(v14, "constraintEqualToConstant:");
    v27[2] = v13;
    id v12 = [(CPSOverlayViewController *)self rightHandDriveGuide];
    id v11 = (id)[(UIFocusGuide *)v12 widthAnchor];
    id v10 = (id)[v11 constraintEqualToConstant:1.0];
    v27[3] = v10;
    id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    objc_msgSend(v8, "activateConstraints:");
  }
  id v4 = self->_rightHandDriveGuide;

  return v4;
}

- (void)_resetRightHandDriveGuide
{
  if (self->_rightHandDriveGuide) {
    [(UIFocusGuide *)self->_rightHandDriveGuide setPreferredFocusEnvironments:0];
  }
}

- (BOOL)shouldHideNavigationBarForViewController:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v17 = 1;
    int v14 = 1;
  }
  else
  {
    id v9 = (id)[(CPSOverlayViewController *)v16 viewControllers];
    id v8 = (id)[v9 firstObject];
    char v10 = [v8 isEqual:location[0]];

    if (v10)
    {
      id v3 = objc_opt_class();
      id v13 = CPSSafeCast_2(v3, location[0]);
      id v7 = (id)[v13 navigationItem];
      id v12 = (id)[v7 title];

      if (v12 && [v12 length])
      {
        char v17 = 0;
        int v14 = 1;
      }
      else
      {
        id v5 = objc_opt_class();
        id v6 = (id)[v13 associatedTemplate];
        id v11 = CPSSafeCast_2(v5, v6);

        if (v11) {
          char v17 = [v11 shouldHideNavigationBar] & 1;
        }
        else {
          char v17 = 0;
        }
        int v14 = 1;
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    else
    {
      char v17 = 0;
      int v14 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSOverlayViewController;
  id v6 = [(CPSOverlayViewController *)&v5 popViewControllerAnimated:a3];
  objc_msgSend(v6, "_cps_viewControllerWasPopped");
  id v4 = v6;
  objc_storeStrong(&v6, 0);

  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v9 = a4;
  v7.receiver = v11;
  v7.super_class = (Class)CPSOverlayViewController;
  id v8 = [(CPSOverlayViewController *)&v7 popToViewController:location[0] animated:a4];
  [v8 enumerateObjectsWithOptions:2 usingBlock:&__block_literal_global_146];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

void __57__CPSOverlayViewController_popToViewController_animated___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "_cps_viewControllerWasPopped");
  objc_storeStrong(location, 0);
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSOverlayViewController;
  id v6 = [(CPSOverlayViewController *)&v5 popToRootViewControllerAnimated:a3];
  [v6 enumerateObjectsWithOptions:2 usingBlock:&__block_literal_global_150];
  id v4 = v6;
  objc_storeStrong(&v6, 0);

  return v4;
}

void __60__CPSOverlayViewController_popToRootViewControllerAnimated___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "_cps_viewControllerWasPopped");
  objc_storeStrong(location, 0);
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v21 = a4;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(CPSOverlayViewController *)v23 viewControllers];
  uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
  if (v17)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v17;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v13);
      id v4 = (CPSOverlayViewController *)(id)[v20 parentViewController];
      BOOL v10 = v4 != v23;

      if (!v10)
      {
        id v9 = (id)[v20 view];
        [v9 removeFromSuperview];

        [v20 removeFromParentViewController];
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v14) {
          break;
        }
      }
    }
  }

  id v6 = v23;
  id v7 = location[0];
  id v8 = (id)[(CPSOverlayViewController *)v23 viewControllers];
  if ([v8 count]) {
    int v5 = v21;
  }
  else {
    int v5 = 0;
  }
  v18.receiver = v6;
  v18.super_class = (Class)CPSOverlayViewController;
  [(CPSOverlayViewController *)&v18 setViewControllers:v7 animated:v5 != 0];

  [(CPSOverlayViewController *)v23 _updateVisibilityView];
  objc_storeStrong(location, 0);
}

- (unint64_t)indexOfTemplate:(id)a3
{
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(CPSOverlayViewController *)v13 viewControllers];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __44__CPSOverlayViewController_indexOfTemplate___block_invoke;
  BOOL v10 = &unk_2648A3DA8;
  id v11 = location[0];
  unint64_t v5 = objc_msgSend(v4, "indexOfObjectPassingTest:");
  objc_storeStrong(&v11, 0);

  objc_storeStrong(location, 0);
  return v5;
}

uint64_t __44__CPSOverlayViewController_indexOfTemplate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = a1;
  v12[0] = CPSSafeProtocolCast(&unk_26DF174A8, location[0]);
  id v11 = (id)[v12[0] associatedTemplate];
  id v9 = (id)[v11 identifier];
  id v8 = (id)[a1[4] identifier];
  char v10 = objc_msgSend(v9, "isEqual:");

  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (id)viewControllerForTemplate:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v6 = [(CPSOverlayViewController *)v8 indexOfTemplate:location[0]];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v5 = (id)[(CPSOverlayViewController *)v8 viewControllers];
    id v9 = (id)[v5 objectAtIndexedSubscript:v6];
  }
  objc_storeStrong(location, 0);
  id v3 = v9;

  return v3;
}

- (void)popToTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = [(CPSOverlayViewController *)v15 viewControllerForTemplate:location[0]];
  if (v11)
  {
    id v5 = [(CPSOverlayViewController *)v15 popToViewController:v11 animated:v13];
    if (v13)
    {
      id v10 = (id)[(CPSOverlayViewController *)v15 transitionCoordinator];
      id v6 = v10;
      id v9 = v12;
      objc_msgSend(v6, "animateAlongsideTransition:completion:");
      objc_storeStrong(&v9, 0);
      objc_storeStrong(&v10, 0);
    }
    else
    {
      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

void __62__CPSOverlayViewController_popToTemplate_animated_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)popToRootTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v9 = [(CPSOverlayViewController *)v13 popToRootViewControllerAnimated:v11];
  BOOL v8 = [v9 count] != 0;
  if (location)
  {
    id v7 = (id)[(CPSOverlayViewController *)v13 transitionCoordinator];
    if (v7)
    {
      id v4 = v7;
      id v5 = location;
      BOOL v6 = v8;
      objc_msgSend(v4, "animateAlongsideTransition:completion:");
      objc_storeStrong(&v5, 0);
    }
    else
    {
      (*((void (**)(id, BOOL))location + 2))(location, v8);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

void __65__CPSOverlayViewController_popToRootTemplateAnimated_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)popTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v9 = [(CPSOverlayViewController *)v13 popViewControllerAnimated:v11];
  BOOL v8 = v9 != 0;
  id v7 = (id)[(CPSOverlayViewController *)v13 transitionCoordinator];
  if (v7)
  {
    id v4 = v7;
    id v5 = location;
    BOOL v6 = v8;
    objc_msgSend(v4, "animateAlongsideTransition:completion:");
    objc_storeStrong(&v5, 0);
  }
  else
  {
    (*((void (**)(id, BOOL))location + 2))(location, v8);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

void __59__CPSOverlayViewController_popTemplateAnimated_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)pushTemplateViewController:(id)a3 animated:(BOOL)a4 presentationStyle:(unint64_t)a5 completion:(id)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v20 = a4;
  unint64_t v19 = a5;
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  id v13 = (id)[(CPSOverlayViewController *)v22 view];
  char v14 = [v13 isHidden];

  if (v14)
  {
    id v9 = (id)[(CPSOverlayViewController *)v22 view];
    [v9 setHidden:0];
  }
  if (v19)
  {
    if (v19 == 1)
    {
      id v7 = v22;
      v23[0] = location[0];
      id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      -[CPSOverlayViewController setViewControllers:animated:](v7, "setViewControllers:animated:");
    }
    else if (v19 == 2)
    {
      (*((void (**)(void))v18 + 2))();
      int v17 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    [(CPSOverlayViewController *)v22 pushViewController:location[0] animated:v20];
  }
  [(CPSOverlayViewController *)v22 setNavigationBarHidden:0 animated:1];
  id v16 = (id)[(CPSOverlayViewController *)v22 transitionCoordinator];
  if (v16)
  {
    id v6 = v16;
    id v15 = v18;
    objc_msgSend(v6, "animateAlongsideTransition:completion:");
    objc_storeStrong(&v15, 0);
  }
  else
  {
    (*((void (**)(void))v18 + 2))();
  }
  [(CPSOverlayViewController *)v22 _updateVisibilityView];
  objc_storeStrong(&v16, 0);
  int v17 = 0;
LABEL_14:
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __93__CPSOverlayViewController_pushTemplateViewController_animated_presentationStyle_completion___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)presentTemplateViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v9 = (id)[(CPSOverlayViewController *)v15 view];
  char v10 = [v9 isHidden];

  if (v10)
  {
    id v6 = (id)[(CPSOverlayViewController *)v15 view];
    [v6 setHidden:0];
  }
  id v5 = objc_alloc(MEMORY[0x263F1C7F8]);
  id v11 = (id)[v5 initWithRootViewController:location[0]];
  objc_msgSend(v11, "setOverrideUserInterfaceStyle:", -[CPSOverlayViewController overrideUserInterfaceStyle](v15, "overrideUserInterfaceStyle"));
  [v11 setModalPresentationStyle:0];
  [(CPSOverlayViewController *)v15 presentViewController:v11 animated:v13 completion:v12];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v13 = a4;
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v8 = (id)[(CPSOverlayViewController *)v15 view];
  char v9 = [v8 isHidden];

  if (v9)
  {
    id v5 = (id)[(CPSOverlayViewController *)v15 view];
    [v5 setHidden:0];
  }
  id v11 = +[CPSActionSheetController actionSheetControllerWithActionSheet:location[0]];
  if (v11)
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "Presenting action sheet template %@", v16, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(CPSOverlayViewController *)v15 presentViewController:v11 animated:v13 completion:v12];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (id)presentedTemplateViewController
{
  char v10 = self;
  v9[1] = (id)a2;
  id v8 = (id)[(CPSOverlayViewController *)self presentedViewController];

  if (v8)
  {
    id v4 = objc_opt_class();
    id v5 = (id)[(CPSOverlayViewController *)v10 presentedViewController];
    v9[0] = CPSSafeCast_2(v4, v5);

    id v6 = objc_opt_class();
    id v7 = (id)[v9[0] topViewController];
    id v11 = CPSSafeCast_2(v6, v7);

    objc_storeStrong(v9, 0);
  }
  else
  {
    id v11 = 0;
  }
  id v2 = v11;

  return v2;
}

- (void)dismissTemplateAnimated:(BOOL)a3 completion:(id)a4
{
  id v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v6 = (id)[(CPSOverlayViewController *)v11 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (id v4 = (id)[(CPSOverlayViewController *)v11 visibleViewController], objc_opt_class(), v5 = objc_opt_isKindOfClass(), v4, (v5 & 1) != 0))
  {
    [(CPSOverlayViewController *)v11 dismissViewControllerAnimated:v9 completion:location];
  }
  objc_storeStrong(&location, 0);
}

- (id)topTemplate
{
  v5[2] = self;
  v5[1] = (id)a2;
  id v3 = (id)[(CPSOverlayViewController *)self topViewController];
  v5[0] = CPSSafeProtocolCast(&unk_26DF174A8, v3);

  id v4 = (id)[v5[0] associatedTemplate];
  objc_storeStrong(v5, 0);

  return v4;
}

- (id)templates
{
  id v3 = (id)[(CPSOverlayViewController *)self viewControllers];
  id v4 = (id)objc_msgSend(v3, "cps_map:", &__block_literal_global_161);

  return v4;
}

id __37__CPSOverlayViewController_templates__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5[1] = a1;
  v5[0] = CPSSafeProtocolCast(&unk_26DF174A8, location[0]);
  id v4 = (id)[v5[0] associatedTemplate];
  objc_storeStrong(v5, 0);
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)restoresFocusAfterTransition
{
  id v3 = (id)[(CPSOverlayViewController *)self topViewController];
  char v4 = [v3 restoresFocusAfterTransition];

  return v4 & 1;
}

- (id)preferredFocusEnvironments
{
  SEL v10 = self;
  v9[1] = (id)a2;
  v9[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(CPSOverlayViewController *)v10 usePreferredItemOnNextUpdate])
  {
    [(CPSOverlayViewController *)v10 setUsePreferredItemOnNextUpdate:0];
    [(CPSOverlayViewController *)v10 _resetRightHandDriveGuide];
    id v8 = [(CPSOverlayViewController *)v10 preferredFocusItem];

    if (v8)
    {
      id v7 = [(CPSOverlayViewController *)v10 preferredFocusItem];
      objc_msgSend(v9[0], "addObject:");
    }
  }
  id v6 = (id)[(CPSOverlayViewController *)v10 topViewController];

  if (v6)
  {
    id v5 = (id)[(CPSOverlayViewController *)v10 topViewController];
    id v4 = (id)[v5 preferredFocusEnvironments];
    objc_msgSend(v9[0], "addObjectsFromArray:");
  }
  id v3 = v9[0];
  objc_storeStrong(v9, 0);

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v14 = (id)[location[0] nextFocusedView];
  id v13 = (id)[v14 _window];
  id v12 = (id)[(CPSOverlayViewController *)v22 view];
  id v4 = (id)[v12 _window];
  BOOL v15 = v13 == v4;

  if (!v15)
  {
    [(CPSOverlayViewController *)v22 setUsePreferredItemOnNextUpdate:1];
    if ([(CPSOverlayViewController *)v22 _useRightHandDriveFocusGuide])
    {
      SEL v10 = [(CPSOverlayViewController *)v22 preferredFocusItem];
      v23[0] = v10;
      id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      id v8 = [(CPSOverlayViewController *)v22 rightHandDriveGuide];
      [(UIFocusGuide *)v8 setPreferredFocusEnvironments:v9];
    }
  }
  id v6 = (id)[location[0] nextFocusedView];
  char v18 = 0;
  char v16 = 0;
  char v7 = 0;
  if (v6)
  {
    id v19 = (id)[location[0] nextFocusedView];
    char v18 = 1;
    id v17 = (id)[(CPSOverlayViewController *)v22 view];
    char v16 = 1;
    char v7 = objc_msgSend(v19, "isDescendantOfView:");
  }
  if (v16) {

  }
  if (v18) {
  if (v7)
  }
  {
    id v5 = (id)[location[0] nextFocusedItem];
    -[CPSOverlayViewController setPreferredFocusItem:](v22, "setPreferredFocusItem:");
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (id)_firstFocusProvidingForViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] conformsToProtocol:&unk_26DF21F80])
  {
    id v17 = location[0];
    int v14 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location[0] childViewControllers];
    uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(__b[1] + 8 * v7);
        id v11 = [(CPSOverlayViewController *)v16 _firstFocusProvidingForViewController:v13];
        if (v11)
        {
          id v17 = v11;
          int v14 = 1;
        }
        else
        {
          int v14 = 0;
        }
        objc_storeStrong(&v11, 0);
        if (v14) {
          break;
        }
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v8) {
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
LABEL_13:
      int v14 = 0;
    }

    if (!v14)
    {
      id v17 = 0;
      int v14 = 1;
    }
  }
  objc_storeStrong(location, 0);
  id v3 = v17;

  return v3;
}

- (BOOL)_useRightHandDriveFocusGuide
{
  int v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  unint64_t v8 = objc_opt_class();
  id v9 = (id)[(CPSOverlayViewController *)v14 topViewController];
  id location = CPSSafeCast_2(v8, v9);

  id v10 = (id)[(CPSOverlayViewController *)v14 topViewController];
  char v11 = [v10 conformsToProtocol:&unk_26DF21F80];

  if (v11)
  {
    id v2 = (id)[(CPSOverlayViewController *)v14 topViewController];
    id v3 = v13[0];
    v13[0] = v2;
  }
  else if (location)
  {
    id v7 = (id)[location selectedViewController];
    id v4 = -[CPSOverlayViewController _firstFocusProvidingForViewController:](v14, "_firstFocusProvidingForViewController:");
    id v5 = v13[0];
    v13[0] = v4;
  }
  BOOL v15 = (objc_opt_respondsToSelector() & 1) != 0 && ([v13[0] useRightHandDriveFocusGuide] & 1) != 0;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v15;
}

- (id)_linearFocusMovementSequences
{
  v25[1] = *MEMORY[0x263EF8340];
  id v22 = self;
  v21[1] = (id)a2;
  id v10 = objc_opt_class();
  id v11 = (id)[(CPSOverlayViewController *)v22 topViewController];
  v21[0] = CPSSafeCast_2(v10, v11);

  id v12 = (id)[(CPSOverlayViewController *)v22 topViewController];
  char v13 = [v12 conformsToProtocol:&unk_26DF21F80];

  if (v13)
  {
    id v20 = (id)[(CPSOverlayViewController *)v22 topViewController];
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = (id)[(CPSOverlayViewController *)v22 navigationBar];
    id v7 = (id)[v8 _linearFocusItems];
    objc_msgSend(v19, "addObjectsFromArray:");

    id v9 = (id)[v20 _linearFocusItems];
    objc_msgSend(v19, "addObjectsFromArray:");

    uint64_t v18 = [objc_alloc(MEMORY[0x263F1CCA0]) initWithItems:v19 loops:0];
    if ((objc_opt_respondsToSelector() & 1) == 0 || ([v20 useRightHandDriveFocusGuide] & 1) == 0) {
      [(CPSOverlayViewController *)v22 _resetRightHandDriveGuide];
    }
    v25[0] = v18;
    id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    int v17 = 1;
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    if (!v21[0]) {
      goto LABEL_14;
    }
    id v6 = (id)[v21[0] selectedViewController];
    id v16 = -[CPSOverlayViewController _firstFocusProvidingForViewController:](v22, "_firstFocusProvidingForViewController:");

    if (v16)
    {
      id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v4 = (id)[v21[0] tabBarButtons];
      objc_msgSend(v15, "addObjectsFromArray:");

      id v5 = (id)[v16 _linearFocusItems];
      objc_msgSend(v15, "addObjectsFromArray:");

      uint64_t v14 = [objc_alloc(MEMORY[0x263F1CCA0]) initWithItems:v15 loops:0];
      if ((objc_opt_respondsToSelector() & 1) == 0 || ([v16 useRightHandDriveFocusGuide] & 1) == 0) {
        [(CPSOverlayViewController *)v22 _resetRightHandDriveGuide];
      }
      uint64_t v24 = v14;
      id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
      int v17 = 1;
      objc_storeStrong((id *)&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      int v17 = 0;
    }
    objc_storeStrong(&v16, 0);
    if (!v17)
    {
LABEL_14:
      id v23 = MEMORY[0x263EFFA68];
      int v17 = 1;
    }
  }
  objc_storeStrong(v21, 0);
  id v2 = v23;

  return v2;
}

- (void)updateVisibilityForPid:(int)a3
{
}

- (BOOL)_needsVisibilityView
{
  char v4 = 0;
  BOOL v3 = 0;
  if ([(CPSOverlayViewController *)self pid] > 0)
  {
    id v5 = [(CPSOverlayViewController *)self templates];
    char v4 = 1;
    BOOL v3 = [v5 count] != 0;
  }
  if (v4) {

  }
  return v3;
}

- (void)_updateVisibilityView
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v65 = self;
  SEL v64 = a2;
  v31 = [(CPSOverlayViewController *)self visibilityView];
  int v32 = [(_UINonHostingVisibilityPropagationView *)v31 pid];

  int v63 = v32;
  unsigned int v62 = [(CPSOverlayViewController *)v65 pid];
  id v2 = [(CPSOverlayViewController *)v65 visibilityView];
  BOOL v33 = v2 != 0;

  BOOL v61 = v33;
  char v60 = [(CPSOverlayViewController *)v65 _needsVisibilityView];
  BOOL v59 = v32 != v62;
  v34 = NSString;
  id v39 = (id)[(CPSOverlayViewController *)v65 view];
  id v38 = (id)[v39 window];
  id v37 = (id)[v38 windowScene];
  id v36 = (id)[v37 _FBSScene];
  id v35 = (id)[v36 identifier];
  id v58 = (id)[v34 stringWithFormat:@"CPTUIH-Overlay-%d-%@", v62, v35];

  char v57 = 0;
  char v55 = 0;
  char v53 = 0;
  char v40 = 0;
  if (v33)
  {
    v56 = [(CPSOverlayViewController *)v65 visibilityView];
    char v55 = 1;
    id v54 = (id)[(_UINonHostingVisibilityPropagationView *)v56 environmentIdentifier];
    char v53 = 1;
    char v40 = objc_msgSend(v58, "isEqualToString:");
  }
  if (v53) {

  }
  if (v55) {
  char v57 = v40 & 1;
  }
  char v52 = 0;
  char v30 = 0;
  if (v61)
  {
    char v30 = 0;
    if (v63 == v62) {
      char v30 = v57;
    }
  }
  char v52 = v30;
  if ((v60 & 1) != 0 || !v61)
  {
    if (v59 && v61)
    {
      id v49 = CarPlaySupportGeneralLogging();
      os_log_type_t v48 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_2((uint64_t)v68, v63);
        _os_log_impl(&dword_22B689000, (os_log_t)v49, v48, "Removing visibility view for invalid pid: %{public}d", v68, 8u);
      }
      objc_storeStrong(&v49, 0);
      [(CPSOverlayViewController *)v65 _invalidateVisibilityView];
    }
  }
  else
  {
    id location = CarPlaySupportGeneralLogging();
    os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_2((uint64_t)v69, v63);
      _os_log_impl(&dword_22B689000, (os_log_t)location, v50, "Removing visibility view for pid: %{public}d, not considered visible", v69, 8u);
    }
    objc_storeStrong(&location, 0);
    [(CPSOverlayViewController *)v65 _invalidateVisibilityView];
  }
  if ((v60 & 1) != 0 && (v52 & 1) == 0)
  {
    id v47 = CarPlaySupportGeneralLogging();
    os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_2((uint64_t)v67, v62);
      _os_log_impl(&dword_22B689000, (os_log_t)v47, v46, "Client needs visibility view, installing for pid: %{public}d", v67, 8u);
    }
    objc_storeStrong(&v47, 0);
    id v28 = (id)[(CPSOverlayViewController *)v65 view];
    id v29 = (id)[v28 window];

    if (v29)
    {
      id v3 = objc_alloc(MEMORY[0x263F1CCF0]);
      id v45 = (id)objc_msgSend(v3, "initWithFrame:pid:environmentIdentifier:", v62, v58, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [v45 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(CPSOverlayViewController *)v65 setVisibilityView:v45];
      id v7 = (id)[(CPSOverlayViewController *)v65 view];
      id v6 = (id)[v7 window];
      [v6 insertSubview:v45 atIndex:0];

      id v27 = (id)[(CPSOverlayViewController *)v65 view];
      id v26 = (id)[v27 window];
      id v25 = (id)[v26 topAnchor];
      id v24 = (id)[v45 topAnchor];
      id v23 = (id)objc_msgSend(v25, "constraintEqualToAnchor:");
      v66[0] = v23;
      id v22 = (id)[(CPSOverlayViewController *)v65 view];
      id v21 = (id)[v22 window];
      id v20 = (id)[v21 leftAnchor];
      id v19 = (id)[v45 leftAnchor];
      id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
      v66[1] = v18;
      id v17 = (id)[(CPSOverlayViewController *)v65 view];
      id v16 = (id)[v17 window];
      id v15 = (id)[v16 rightAnchor];
      id v14 = (id)[v45 rightAnchor];
      id v13 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
      v66[2] = v13;
      id v12 = (id)[(CPSOverlayViewController *)v65 view];
      id v11 = (id)[v12 window];
      id v10 = (id)[v11 bottomAnchor];
      id v9 = (id)[v45 bottomAnchor];
      id v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
      v66[3] = v8;
      id v44 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:4];

      [MEMORY[0x263F08938] activateConstraints:v44];
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v45, 0);
    }
    else
    {
      id v43 = CarPlaySupportGeneralLogging();
      char v42 = 16;
      if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
      {
        char v4 = v43;
        os_log_type_t v5 = v42;
        __os_log_helper_16_0_0(v41);
        _os_log_error_impl(&dword_22B689000, v4, v5, "No window available to install visibility view", v41, 2u);
      }
      objc_storeStrong(&v43, 0);
    }
  }
  objc_storeStrong(&v58, 0);
}

- (void)_invalidateVisibilityView
{
}

- (UIFocusItem)preferredFocusItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->preferredFocusItem);

  return (UIFocusItem *)WeakRetained;
}

- (void)setPreferredFocusItem:(id)a3
{
}

- (BOOL)usePreferredItemOnNextUpdate
{
  return self->usePreferredItemOnNextUpdate;
}

- (void)setUsePreferredItemOnNextUpdate:(BOOL)a3
{
  self->usePreferredItemOnNextUpdate = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (_UINonHostingVisibilityPropagationView)visibilityView
{
  return self->_visibilityView;
}

- (void)setVisibilityView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end