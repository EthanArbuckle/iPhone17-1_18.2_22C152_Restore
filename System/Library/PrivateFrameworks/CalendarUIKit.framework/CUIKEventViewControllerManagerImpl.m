@interface CUIKEventViewControllerManagerImpl
- (UIViewController)viewController;
- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)init;
- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithEditViewControllerDelegate:(id)a3;
- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithViewControllerDelegate:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CUIKEventViewControllerManagerImpl

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithViewControllerDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKEventViewControllerManagerImpl();
  return [(CUIKEventViewControllerManagerImpl *)&v5 init];
}

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)initWithEditViewControllerDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_subscribers) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CUIKEventViewControllerManagerImpl();
  return [(CUIKEventViewControllerManagerImpl *)&v5 init];
}

- (UIViewController)viewController
{
  v2 = self;
  id v3 = sub_1BDFBDFA0();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl)init
{
  result = (_TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BDFBE794((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_viewControllerDelegate);
  sub_1BDFBE794((uint64_t)self + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl_editViewControllerDelegate);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13CalendarUIKit34CUIKEventViewControllerManagerImpl____lazy_storage___viewController);
}

@end