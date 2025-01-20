@interface FCUIBaseWelcomeController
+ (id)colorForColorName:(id)a3;
- (BOOL)showCloseButton;
- (FCUISetupNavigationController)setupNavigationController;
- (id)addBoldTrayButton;
- (id)addBoldTrayButtonWithColor:(id)a3;
- (id)addTrayButton;
- (void)_closeButtonPressed:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setHeaderViewDetailText:(id)a3;
- (void)setHeaderViewTitle:(id)a3;
- (void)setHeaderViewTitleHyphenationFactor:(float)a3;
- (void)setShowCloseButton:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FCUIBaseWelcomeController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)FCUIBaseWelcomeController;
  [(FCUIBaseWelcomeController *)&v4 viewDidLoad];
  v3 = [(FCUIBaseWelcomeController *)self scrollView];
  [v3 setDelegate:self];
  [(FCUIBaseWelcomeController *)self setShowCloseButton:1];
}

- (FCUISetupNavigationController)setupNavigationController
{
  v2 = [(FCUIBaseWelcomeController *)self navigationController];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return (FCUISetupNavigationController *)v6;
}

- (void)setShowCloseButton:(BOOL)a3
{
  if (self->_showCloseButton != a3)
  {
    self->_showCloseButton = a3;
    if (a3)
    {
      id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"_closeButtonPressed:"];
      id v4 = [(FCUIBaseWelcomeController *)self navigationItem];
      [v4 setRightBarButtonItem:v5];
    }
    else
    {
      id v5 = [(FCUIBaseWelcomeController *)self navigationItem];
      [v5 setRightBarButtonItem:0];
    }
  }
}

- (void)setHeaderViewTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(FCUIBaseWelcomeController *)self headerView];
  [v5 setTitle:v4];
}

- (void)setHeaderViewTitleHyphenationFactor:(float)a3
{
  id v5 = [(FCUIBaseWelcomeController *)self headerView];
  *(float *)&double v4 = a3;
  [v5 setTitleHyphenationFactor:v4];
}

- (void)setHeaderViewDetailText:(id)a3
{
  id v4 = a3;
  id v5 = [(FCUIBaseWelcomeController *)self headerView];
  [v5 setDetailText:v4];
}

- (id)addTrayButton
{
  uint64_t v3 = +[OBTrayButton buttonWithType:1];
  id v4 = [(FCUIBaseWelcomeController *)self buttonTray];
  [v4 addButton:v3];

  return v3;
}

- (id)addBoldTrayButtonWithColor:(id)a3
{
  id v4 = a3;
  id v5 = +[OBBoldTrayButton boldButton];
  id v6 = v5;
  if (v4) {
    [v5 setTintColor:v4];
  }
  v7 = [(FCUIBaseWelcomeController *)self buttonTray];
  [v7 addButton:v6];

  return v6;
}

- (id)addBoldTrayButton
{
  uint64_t v3 = +[OBBoldTrayButton boldButton];
  id v4 = [(FCUIBaseWelcomeController *)self buttonTray];
  [v4 addButton:v3];

  return v3;
}

+ (id)colorForColorName:(id)a3
{
  SEL v3 = NSSelectorFromString((NSString *)a3);
  if (objc_opt_respondsToSelector()) {
    id v4 = +[UIColor performSelector:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (void)_closeButtonPressed:(id)a3
{
  id v3 = [(FCUIBaseWelcomeController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)showCloseButton
{
  return self->_showCloseButton;
}

@end