@interface CUIKCreateFamilyCalendarFlowControllerManager
- (CUIKCreateFamilyCalendarFlowControllerManager)initWithDelegate:(id)a3;
- (id)viewController;
@end

@implementation CUIKCreateFamilyCalendarFlowControllerManager

- (CUIKCreateFamilyCalendarFlowControllerManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CUIKCreateFamilyCalendarFlowControllerManager;
  v5 = [(CUIKCreateFamilyCalendarFlowControllerManager *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl alloc] initWithDelegate:v4];
    impl = v5->_impl;
    v5->_impl = v6;
  }
  return v5;
}

- (id)viewController
{
  return [(CUIKCreateFamilyCalendarFlowControllerManagerImpl *)self->_impl viewController];
}

- (void).cxx_destruct
{
}

@end