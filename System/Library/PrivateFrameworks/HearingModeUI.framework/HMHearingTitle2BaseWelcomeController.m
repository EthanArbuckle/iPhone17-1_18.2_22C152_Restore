@interface HMHearingTitle2BaseWelcomeController
- (void)viewDidLoad;
@end

@implementation HMHearingTitle2BaseWelcomeController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HMHearingTitle2BaseWelcomeController;
  [(OBBaseWelcomeController *)&v4 viewDidLoad];
  v3 = [(HMHearingTitle2BaseWelcomeController *)self headerView];
  [v3 setTitleStyle:1];
}

@end