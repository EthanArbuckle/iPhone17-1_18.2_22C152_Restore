@interface BYODSelectDefaultEmailNavController
- (BYODSelectDefaultEmailDelegate)byodDelegate;
- (void)setByodDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODSelectDefaultEmailNavController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)BYODSelectDefaultEmailNavController;
  [(BYODSelectDefaultEmailNavController *)&v2 viewDidLoad];
}

- (BYODSelectDefaultEmailDelegate)byodDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_byodDelegate);

  return (BYODSelectDefaultEmailDelegate *)WeakRetained;
}

- (void)setByodDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end