@interface CUIKEventViewControllerManager
- (CUIKEventViewControllerManager)initWithDelegate:(id)a3;
- (UIViewController)viewController;
@end

@implementation CUIKEventViewControllerManager

- (CUIKEventViewControllerManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKEventViewControllerManager;
  v5 = [(CUIKEventViewControllerManager *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl alloc] initWithViewControllerDelegate:v4];
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