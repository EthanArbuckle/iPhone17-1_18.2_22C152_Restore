@interface MRUActivityMirroringViewController
- (BOOL)_canShowWhileLocked;
- (MRUActivityMirroringViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MRUMirroringController)mirroringController;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)elementIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)loadView;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setMirroringController:(id)a3;
- (void)stopMirroring:(id)a3;
- (void)updateState;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MRUActivityMirroringViewController

- (MRUActivityMirroringViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MRUActivityMirroringViewController;
  v4 = [(MRUActivityMirroringViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(MRUMirroringController);
    mirroringController = v4->_mirroringController;
    v4->_mirroringController = v5;

    [(MRUMirroringController *)v4->_mirroringController setDelegate:v4];
  }
  return v4;
}

- (void)loadView
{
  v3 = objc_alloc_init(MRUActivityMirroringView);
  [(MRUActivityMirroringViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MRUActivityMirroringViewController;
  [(MRUActivityMirroringViewController *)&v5 viewDidLoad];
  v3 = [(MRUActivityMirroringViewController *)self view];
  v4 = [v3 button];
  [v4 addTarget:self action:sel_stopMirroring_ forControlEvents:64];

  [(MRUActivityMirroringViewController *)self updateState];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MRUActivityMirroringViewController;
  id v7 = a4;
  -[MRUActivityMirroringViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__MRUActivityMirroringViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F0E4A8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_46];
}

void __89__MRUActivityMirroringViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateState];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)stopMirroring:(id)a3
{
  mirroringController = self->_mirroringController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MRUActivityMirroringViewController_stopMirroring___block_invoke;
  v4[3] = &unk_1E5F0E388;
  v4[4] = self;
  [(MRUMirroringController *)mirroringController stopMirroringWithCompletion:v4];
}

void __52__MRUActivityMirroringViewController_stopMirroring___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) systemApertureElementContext];
  [v1 requestTransitionToPreferredLayoutMode];
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  self->_activeLayoutMode = a3;
  [(MRUActivityMirroringViewController *)self updateState];
}

- (int64_t)contentRole
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4FA7F38];
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = [(MRUActivityMirroringViewController *)self view];
  [v2 preferredHeightForBottomSafeArea];
  double v4 = v3;

  return v4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  v2 = [(MRUActivityMirroringViewController *)self view];
  double v3 = [v2 leadingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  v2 = [(MRUActivityMirroringViewController *)self view];
  double v3 = [v2 trailingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  v2 = [(MRUActivityMirroringViewController *)self view];
  double v3 = [v2 leadingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA9688], *MEMORY[0x1E4FA96D0], 0);
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (UIColor)keyColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] colorWithRed:0.246 green:0.6 blue:1.0 alpha:1.0];
}

- (void)updateState
{
  uint64_t v3 = [(MRUMirroringController *)self->_mirroringController selectedOutputDevice];
  id v19 = (id)v3;
  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4FB1818];
    objc_super v5 = +[MRUMirroringController symbolNameForOutputDevice:v3];
    v6 = [v4 systemImageNamed:v5];
    id v7 = [(MRUActivityMirroringViewController *)self view];
    [v7 setDeviceImage:v6];

    objc_super v8 = [v19 name];
    objc_super v9 = [(MRUActivityMirroringViewController *)self view];
    v10 = [v9 deviceImage];
    [v10 setAccessibilityLabel:v8];

    v11 = [v19 name];
    v12 = [(MRUActivityMirroringViewController *)self view];
    [v12 setDeviceName:v11];

    if (self->_activeLayoutMode == 4) {
      v13 = @"zoom";
    }
    else {
      v13 = @"breathe";
    }
    v14 = [(MRUActivityMirroringViewController *)self view];
    [v14 setState:v13];
  }
  else
  {
    v15 = [(MRUActivityMirroringViewController *)self view];
    [v15 setDeviceImage:0];

    v16 = [(MRUActivityMirroringViewController *)self view];
    [v16 setDeviceName:0];

    v17 = [(MRUActivityMirroringViewController *)self view];
    [v17 setState:&stru_1F06524E0];
  }
  if (self->_activeLayoutMode == 4)
  {
    v18 = [(MRUActivityMirroringViewController *)self systemApertureElementContext];
    [v18 setElementNeedsUpdate];
  }
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return self->associatedScenePersistenceIdentifier;
}

- (MRUMirroringController)mirroringController
{
  return self->_mirroringController;
}

- (void)setMirroringController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringController, 0);

  objc_storeStrong((id *)&self->associatedScenePersistenceIdentifier, 0);
}

@end