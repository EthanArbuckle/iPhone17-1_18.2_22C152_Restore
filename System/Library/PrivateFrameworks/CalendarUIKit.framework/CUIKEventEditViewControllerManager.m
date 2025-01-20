@interface CUIKEventEditViewControllerManager
- (CUIKEventEditViewControllerManager)initWithDelegate:(id)a3;
- (UIViewController)viewController;
@end

@implementation CUIKEventEditViewControllerManager

- (CUIKEventEditViewControllerManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKEventEditViewControllerManager;
  v5 = [(CUIKEventEditViewControllerManager *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl alloc] initWithEditViewControllerDelegate:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (UIViewController)viewController
{
  return [(CUIKEventViewControllerManagerImpl *)self->_impl viewController];
}

- (void).cxx_destruct
{
}

@end