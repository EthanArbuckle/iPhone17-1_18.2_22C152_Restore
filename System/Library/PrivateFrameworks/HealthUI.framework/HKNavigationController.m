@interface HKNavigationController
- (UIGestureRecognizer)internalSettingsGestureRecognizer;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)horizontalSizeClassDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)onInternalSettingsGesture;
- (void)reparentViewControllerIfNecessaryWithTraitCollection:(id)a3 previousTraitCollection:(id)a4;
- (void)setInternalSettingsGestureRecognizer:(id)a3;
- (void)updateTraits;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKNavigationController

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)HKNavigationController;
  [(HKNavigationController *)&v6 viewDidLoad];
  [(HKNavigationController *)self setDelegate:self];
  v7[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v4 = (id)[(HKNavigationController *)self registerForTraitChanges:v3 withAction:sel_horizontalSizeClassDidChangeWithTraitEnvironment_previousTraitCollection_];

  v5 = [[_TtC8HealthUI36InternalSettingsTapGestureRecognizer alloc] initWithTarget:self action:sel_onInternalSettingsGesture];
  [(HKNavigationController *)self setInternalSettingsGestureRecognizer:v5];
}

- (void)setInternalSettingsGestureRecognizer:(id)a3
{
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKNavigationController;
  [(HKNavigationController *)&v3 viewWillLayoutSubviews];
  [(HKNavigationController *)self updateTraits];
}

- (void)updateTraits
{
  objc_super v3 = [(HKNavigationController *)self view];
  [v3 bounds];
  double v5 = v4;

  int64_t v6 = +[HKWidthDesignationProvider widthDesignationFromViewWidth:v5];
  if (v5 < 678.0) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [(HKNavigationController *)self traitOverrides];
  [v8 setNSIntegerValue:v6 forTrait:objc_opt_class()];

  v9 = [(HKNavigationController *)self traitOverrides];
  [v9 setNSIntegerValue:v7 forTrait:objc_opt_class()];

  v10 = [(HKNavigationController *)self view];
  v11 = [v10 window];

  if (v11)
  {
    [(HKNavigationController *)self updateTraitsIfNeeded];
  }
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  objc_super v3 = [(HKNavigationController *)self topViewController];
  double v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 supportedInterfaceOrientations];
  }
  else {
    unint64_t v5 = 6;
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKNavigationController;
  [(HKNavigationController *)&v8 viewDidAppear:a3];
  double v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v5 = [v4 isAppleInternalInstall];

  if (v5)
  {
    int64_t v6 = [(HKNavigationController *)self navigationBar];
    uint64_t v7 = [(HKNavigationController *)self internalSettingsGestureRecognizer];
    [v6 addGestureRecognizer:v7];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKNavigationController;
  [(HKNavigationController *)&v8 viewDidDisappear:a3];
  double v4 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v5 = [v4 isAppleInternalInstall];

  if (v5)
  {
    int64_t v6 = [(HKNavigationController *)self navigationBar];
    uint64_t v7 = [(HKNavigationController *)self internalSettingsGestureRecognizer];
    [v6 removeGestureRecognizer:v7];
  }
}

- (void)horizontalSizeClassDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(HKNavigationController *)self view];
  objc_super v8 = [v7 window];

  if (v8)
  {
    v9 = [v10 traitCollection];
    [(HKNavigationController *)self reparentViewControllerIfNecessaryWithTraitCollection:v9 previousTraitCollection:v6];
  }
}

- (void)onInternalSettingsGesture
{
  objc_super v3 = [(HKNavigationController *)self topViewController];
  int v4 = [v3 conformsToProtocol:&unk_1F3C74AB0];

  if (v4)
  {
    id v5 = [(HKNavigationController *)self topViewController];
    [v5 onInternalSettingsGesture];
  }
}

- (UIGestureRecognizer)internalSettingsGestureRecognizer
{
  return self->_internalSettingsGestureRecognizer;
}

- (void).cxx_destruct
{
}

- (void)reparentViewControllerIfNecessaryWithTraitCollection:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  v11.is_nil = (char)v8;
  v9 = v8;
  v11.value.super.isa = (Class)a4;
  HKNavigationController.reparentViewControllerIfNecessary(traitCollection:previousTraitCollection:)((UITraitCollection)v6, v11);
}

@end