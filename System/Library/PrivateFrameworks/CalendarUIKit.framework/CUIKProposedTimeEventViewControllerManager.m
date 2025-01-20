@interface CUIKProposedTimeEventViewControllerManager
- (CUIKProposedTimeEventViewControllerManager)initWithDelegate:(id)a3 proposedTime:(id)a4;
- (UIViewController)viewController;
@end

@implementation CUIKProposedTimeEventViewControllerManager

- (CUIKProposedTimeEventViewControllerManager)initWithDelegate:(id)a3 proposedTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKProposedTimeEventViewControllerManager;
  v8 = [(CUIKProposedTimeEventViewControllerManager *)&v12 init];
  if (v8)
  {
    v9 = [[_TtC13CalendarUIKit46CUIKProposedTimeEventViewControllerManagerImpl alloc] initWithDelegate:v6 proposedTime:v7];
    impl = v8->_impl;
    v8->_impl = v9;
  }
  return v8;
}

- (UIViewController)viewController
{
  return [(CUIKProposedTimeEventViewControllerManagerImpl *)self->_impl viewController];
}

- (void).cxx_destruct
{
}

@end