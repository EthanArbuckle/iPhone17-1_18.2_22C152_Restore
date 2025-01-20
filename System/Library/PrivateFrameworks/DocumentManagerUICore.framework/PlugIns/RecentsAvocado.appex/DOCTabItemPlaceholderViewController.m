@interface DOCTabItemPlaceholderViewController
- (UIViewController)actualViewController;
- (id)tabBarItem;
- (void)setActualViewController:(id)a3;
@end

@implementation DOCTabItemPlaceholderViewController

- (id)tabBarItem
{
  v2 = [(DOCTabItemPlaceholderViewController *)self actualViewController];
  v3 = [v2 tabBarItem];

  return v3;
}

- (UIViewController)actualViewController
{
  return self->_actualViewController;
}

- (void)setActualViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end