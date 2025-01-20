@interface HUQuickControlNavigationController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (id)hu_prepareForDismissalAnimated:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUQuickControlNavigationController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlNavigationController;
  [(HUQuickControlNavigationController *)&v5 viewDidLoad];
  if ([MEMORY[0x1E4F69758] shouldUseProxHandOffMaterials]) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 16;
  }
  [(HUQuickControlNavigationController *)self setModalPresentationStyle:v3];
  v4 = [(HUQuickControlNavigationController *)self presentationController];
  [v4 _setForcePresentationInPresenterScene:1];
}

- (CGSize)preferredContentSize
{
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    double v5 = 768.0;
    double v6 = 375.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlNavigationController;
    [(HUQuickControlNavigationController *)&v7 preferredContentSize];
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)hu_prepareForDismissalAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(HUQuickControlNavigationController *)self topViewController];
  if ([v4 conformsToProtocol:&unk_1F1A7BE18]) {
    double v5 = v4;
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    objc_msgSend(v6, "hu_prepareForDismissalAnimated:", v3);
  }
  else {
  objc_super v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:&unk_1F19B4C70];
  }

  return v7;
}

@end