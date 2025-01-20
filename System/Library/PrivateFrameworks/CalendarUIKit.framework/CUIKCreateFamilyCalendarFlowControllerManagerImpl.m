@interface CUIKCreateFamilyCalendarFlowControllerManagerImpl
- (UIViewController)viewController;
- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)init;
- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)initWithDelegate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CUIKCreateFamilyCalendarFlowControllerManagerImpl

- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)initWithDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKCreateFamilyCalendarFlowControllerManagerImpl();
  return [(CUIKCreateFamilyCalendarFlowControllerManagerImpl *)&v5 init];
}

- (UIViewController)viewController
{
  v2 = self;
  id v3 = sub_1BE00DB78();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl)init
{
  result = (_TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDFBE794((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl_delegate);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit49CUIKCreateFamilyCalendarFlowControllerManagerImpl____lazy_storage___viewController);
}

@end