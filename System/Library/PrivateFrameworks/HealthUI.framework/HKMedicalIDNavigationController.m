@interface HKMedicalIDNavigationController
- (BOOL)_canShowWhileLocked;
- (void)viewDidLoad;
@end

@implementation HKMedicalIDNavigationController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)HKMedicalIDNavigationController;
  [(HKNavigationController *)&v2 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end